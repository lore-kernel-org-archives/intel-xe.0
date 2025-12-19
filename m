Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E7BD711D6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 08:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3410C10EED8;
	Fri, 19 Dec 2025 08:26:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30BF10E647;
 Fri, 19 Dec 2025 08:26:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_select_CONFIGFS=5FFS?=
 =?utf-8?q?_dependency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 08:26:07 -0000
Message-ID: <176613276785.104603.11263091229599270358@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219080513.848072-2-riana.tauro@intel.com>
In-Reply-To: <20251219080513.848072-2-riana.tauro@intel.com>
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

Series: drm/xe: select CONFIGFS_FS dependency
URL   : https://patchwork.freedesktop.org/series/159265/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:24:49] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:24:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:25:25] Starting KUnit Kernel (1/1)...
[08:25:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:25:25] ================== guc_buf (11 subtests) ===================
[08:25:25] [PASSED] test_smallest
[08:25:25] [PASSED] test_largest
[08:25:25] [PASSED] test_granular
[08:25:25] [PASSED] test_unique
[08:25:25] [PASSED] test_overlap
[08:25:25] [PASSED] test_reusable
[08:25:25] [PASSED] test_too_big
[08:25:25] [PASSED] test_flush
[08:25:25] [PASSED] test_lookup
[08:25:25] [PASSED] test_data
[08:25:25] [PASSED] test_class
[08:25:25] ===================== [PASSED] guc_buf =====================
[08:25:25] =================== guc_dbm (7 subtests) ===================
[08:25:25] [PASSED] test_empty
[08:25:25] [PASSED] test_default
[08:25:25] ======================== test_size  ========================
[08:25:25] [PASSED] 4
[08:25:25] [PASSED] 8
[08:25:25] [PASSED] 32
[08:25:25] [PASSED] 256
[08:25:25] ==================== [PASSED] test_size ====================
[08:25:25] ======================= test_reuse  ========================
[08:25:25] [PASSED] 4
[08:25:25] [PASSED] 8
[08:25:25] [PASSED] 32
[08:25:25] [PASSED] 256
[08:25:25] =================== [PASSED] test_reuse ====================
[08:25:25] =================== test_range_overlap  ====================
[08:25:25] [PASSED] 4
[08:25:25] [PASSED] 8
[08:25:25] [PASSED] 32
[08:25:25] [PASSED] 256
[08:25:25] =============== [PASSED] test_range_overlap ================
[08:25:25] =================== test_range_compact  ====================
[08:25:25] [PASSED] 4
[08:25:25] [PASSED] 8
[08:25:25] [PASSED] 32
[08:25:25] [PASSED] 256
[08:25:25] =============== [PASSED] test_range_compact ================
[08:25:25] ==================== test_range_spare  =====================
[08:25:25] [PASSED] 4
[08:25:25] [PASSED] 8
[08:25:25] [PASSED] 32
[08:25:25] [PASSED] 256
[08:25:25] ================ [PASSED] test_range_spare =================
[08:25:25] ===================== [PASSED] guc_dbm =====================
[08:25:25] =================== guc_idm (6 subtests) ===================
[08:25:25] [PASSED] bad_init
[08:25:25] [PASSED] no_init
[08:25:25] [PASSED] init_fini
[08:25:25] [PASSED] check_used
[08:25:25] [PASSED] check_quota
[08:25:25] [PASSED] check_all
[08:25:25] ===================== [PASSED] guc_idm =====================
[08:25:25] ================== no_relay (3 subtests) ===================
[08:25:25] [PASSED] xe_drops_guc2pf_if_not_ready
[08:25:25] [PASSED] xe_drops_guc2vf_if_not_ready
[08:25:25] [PASSED] xe_rejects_send_if_not_ready
[08:25:25] ==================== [PASSED] no_relay =====================
[08:25:25] ================== pf_relay (14 subtests) ==================
[08:25:25] [PASSED] pf_rejects_guc2pf_too_short
[08:25:25] [PASSED] pf_rejects_guc2pf_too_long
[08:25:25] [PASSED] pf_rejects_guc2pf_no_payload
[08:25:25] [PASSED] pf_fails_no_payload
[08:25:25] [PASSED] pf_fails_bad_origin
[08:25:25] [PASSED] pf_fails_bad_type
[08:25:25] [PASSED] pf_txn_reports_error
[08:25:25] [PASSED] pf_txn_sends_pf2guc
[08:25:25] [PASSED] pf_sends_pf2guc
[08:25:25] [SKIPPED] pf_loopback_nop
[08:25:25] [SKIPPED] pf_loopback_echo
[08:25:25] [SKIPPED] pf_loopback_fail
[08:25:25] [SKIPPED] pf_loopback_busy
[08:25:25] [SKIPPED] pf_loopback_retry
[08:25:25] ==================== [PASSED] pf_relay =====================
[08:25:25] ================== vf_relay (3 subtests) ===================
[08:25:25] [PASSED] vf_rejects_guc2vf_too_short
[08:25:25] [PASSED] vf_rejects_guc2vf_too_long
[08:25:25] [PASSED] vf_rejects_guc2vf_no_payload
[08:25:25] ==================== [PASSED] vf_relay =====================
[08:25:25] ================ pf_gt_config (6 subtests) =================
[08:25:25] [PASSED] fair_contexts_1vf
[08:25:25] [PASSED] fair_doorbells_1vf
[08:25:25] [PASSED] fair_ggtt_1vf
[08:25:25] ====================== fair_contexts  ======================
[08:25:25] [PASSED] 1 VF
[08:25:25] [PASSED] 2 VFs
[08:25:25] [PASSED] 3 VFs
[08:25:25] [PASSED] 4 VFs
[08:25:25] [PASSED] 5 VFs
[08:25:25] [PASSED] 6 VFs
[08:25:25] [PASSED] 7 VFs
[08:25:25] [PASSED] 8 VFs
[08:25:25] [PASSED] 9 VFs
[08:25:25] [PASSED] 10 VFs
[08:25:25] [PASSED] 11 VFs
[08:25:25] [PASSED] 12 VFs
[08:25:25] [PASSED] 13 VFs
[08:25:25] [PASSED] 14 VFs
[08:25:25] [PASSED] 15 VFs
[08:25:25] [PASSED] 16 VFs
[08:25:25] [PASSED] 17 VFs
[08:25:25] [PASSED] 18 VFs
[08:25:25] [PASSED] 19 VFs
[08:25:25] [PASSED] 20 VFs
[08:25:25] [PASSED] 21 VFs
[08:25:25] [PASSED] 22 VFs
[08:25:25] [PASSED] 23 VFs
[08:25:25] [PASSED] 24 VFs
[08:25:25] [PASSED] 25 VFs
[08:25:25] [PASSED] 26 VFs
[08:25:25] [PASSED] 27 VFs
[08:25:25] [PASSED] 28 VFs
[08:25:25] [PASSED] 29 VFs
[08:25:25] [PASSED] 30 VFs
[08:25:25] [PASSED] 31 VFs
[08:25:25] [PASSED] 32 VFs
[08:25:25] [PASSED] 33 VFs
[08:25:25] [PASSED] 34 VFs
[08:25:25] [PASSED] 35 VFs
[08:25:25] [PASSED] 36 VFs
[08:25:25] [PASSED] 37 VFs
[08:25:25] [PASSED] 38 VFs
[08:25:25] [PASSED] 39 VFs
[08:25:25] [PASSED] 40 VFs
[08:25:25] [PASSED] 41 VFs
[08:25:25] [PASSED] 42 VFs
[08:25:25] [PASSED] 43 VFs
[08:25:25] [PASSED] 44 VFs
[08:25:25] [PASSED] 45 VFs
[08:25:25] [PASSED] 46 VFs
[08:25:25] [PASSED] 47 VFs
[08:25:25] [PASSED] 48 VFs
[08:25:25] [PASSED] 49 VFs
[08:25:25] [PASSED] 50 VFs
[08:25:25] [PASSED] 51 VFs
[08:25:25] [PASSED] 52 VFs
[08:25:25] [PASSED] 53 VFs
[08:25:25] [PASSED] 54 VFs
[08:25:25] [PASSED] 55 VFs
[08:25:25] [PASSED] 56 VFs
[08:25:25] [PASSED] 57 VFs
[08:25:25] [PASSED] 58 VFs
[08:25:25] [PASSED] 59 VFs
[08:25:25] [PASSED] 60 VFs
[08:25:25] [PASSED] 61 VFs
[08:25:25] [PASSED] 62 VFs
[08:25:25] [PASSED] 63 VFs
[08:25:25] ================== [PASSED] fair_contexts ==================
[08:25:25] ===================== fair_doorbells  ======================
[08:25:25] [PASSED] 1 VF
[08:25:25] [PASSED] 2 VFs
[08:25:25] [PASSED] 3 VFs
[08:25:25] [PASSED] 4 VFs
[08:25:25] [PASSED] 5 VFs
[08:25:25] [PASSED] 6 VFs
[08:25:25] [PASSED] 7 VFs
[08:25:25] [PASSED] 8 VFs
[08:25:25] [PASSED] 9 VFs
[08:25:25] [PASSED] 10 VFs
[08:25:25] [PASSED] 11 VFs
[08:25:25] [PASSED] 12 VFs
[08:25:25] [PASSED] 13 VFs
[08:25:25] [PASSED] 14 VFs
[08:25:25] [PASSED] 15 VFs
[08:25:25] [PASSED] 16 VFs
[08:25:25] [PASSED] 17 VFs
[08:25:25] [PASSED] 18 VFs
[08:25:25] [PASSED] 19 VFs
[08:25:25] [PASSED] 20 VFs
[08:25:25] [PASSED] 21 VFs
[08:25:25] [PASSED] 22 VFs
[08:25:25] [PASSED] 23 VFs
[08:25:25] [PASSED] 24 VFs
[08:25:25] [PASSED] 25 VFs
[08:25:25] [PASSED] 26 VFs
[08:25:25] [PASSED] 27 VFs
[08:25:25] [PASSED] 28 VFs
[08:25:25] [PASSED] 29 VFs
[08:25:25] [PASSED] 30 VFs
[08:25:25] [PASSED] 31 VFs
[08:25:25] [PASSED] 32 VFs
[08:25:25] [PASSED] 33 VFs
[08:25:25] [PASSED] 34 VFs
[08:25:25] [PASSED] 35 VFs
[08:25:25] [PASSED] 36 VFs
[08:25:25] [PASSED] 37 VFs
[08:25:25] [PASSED] 38 VFs
[08:25:25] [PASSED] 39 VFs
[08:25:25] [PASSED] 40 VFs
[08:25:25] [PASSED] 41 VFs
[08:25:25] [PASSED] 42 VFs
[08:25:25] [PASSED] 43 VFs
[08:25:25] [PASSED] 44 VFs
[08:25:25] [PASSED] 45 VFs
[08:25:25] [PASSED] 46 VFs
[08:25:25] [PASSED] 47 VFs
[08:25:25] [PASSED] 48 VFs
[08:25:25] [PASSED] 49 VFs
[08:25:25] [PASSED] 50 VFs
[08:25:25] [PASSED] 51 VFs
[08:25:25] [PASSED] 52 VFs
[08:25:25] [PASSED] 53 VFs
[08:25:25] [PASSED] 54 VFs
[08:25:25] [PASSED] 55 VFs
[08:25:25] [PASSED] 56 VFs
[08:25:25] [PASSED] 57 VFs
[08:25:25] [PASSED] 58 VFs
[08:25:25] [PASSED] 59 VFs
[08:25:25] [PASSED] 60 VFs
[08:25:25] [PASSED] 61 VFs
[08:25:25] [PASSED] 62 VFs
[08:25:25] [PASSED] 63 VFs
[08:25:25] ================= [PASSED] fair_doorbells ==================
[08:25:25] ======================== fair_ggtt  ========================
[08:25:25] [PASSED] 1 VF
[08:25:25] [PASSED] 2 VFs
[08:25:25] [PASSED] 3 VFs
[08:25:25] [PASSED] 4 VFs
[08:25:25] [PASSED] 5 VFs
[08:25:25] [PASSED] 6 VFs
[08:25:25] [PASSED] 7 VFs
[08:25:25] [PASSED] 8 VFs
[08:25:25] [PASSED] 9 VFs
[08:25:25] [PASSED] 10 VFs
[08:25:25] [PASSED] 11 VFs
[08:25:25] [PASSED] 12 VFs
[08:25:25] [PASSED] 13 VFs
[08:25:25] [PASSED] 14 VFs
[08:25:25] [PASSED] 15 VFs
[08:25:25] [PASSED] 16 VFs
[08:25:25] [PASSED] 17 VFs
[08:25:25] [PASSED] 18 VFs
[08:25:25] [PASSED] 19 VFs
[08:25:25] [PASSED] 20 VFs
[08:25:25] [PASSED] 21 VFs
[08:25:25] [PASSED] 22 VFs
[08:25:25] [PASSED] 23 VFs
[08:25:25] [PASSED] 24 VFs
[08:25:25] [PASSED] 25 VFs
[08:25:25] [PASSED] 26 VFs
[08:25:25] [PASSED] 27 VFs
[08:25:25] [PASSED] 28 VFs
[08:25:25] [PASSED] 29 VFs
[08:25:25] [PASSED] 30 VFs
[08:25:25] [PASSED] 31 VFs
[08:25:25] [PASSED] 32 VFs
[08:25:25] [PASSED] 33 VFs
[08:25:25] [PASSED] 34 VFs
[08:25:25] [PASSED] 35 VFs
[08:25:25] [PASSED] 36 VFs
[08:25:25] [PASSED] 37 VFs
[08:25:25] [PASSED] 38 VFs
[08:25:25] [PASSED] 39 VFs
[08:25:25] [PASSED] 40 VFs
[08:25:25] [PASSED] 41 VFs
[08:25:25] [PASSED] 42 VFs
[08:25:25] [PASSED] 43 VFs
[08:25:25] [PASSED] 44 VFs
[08:25:25] [PASSED] 45 VFs
[08:25:25] [PASSED] 46 VFs
[08:25:25] [PASSED] 47 VFs
[08:25:25] [PASSED] 48 VFs
[08:25:25] [PASSED] 49 VFs
[08:25:25] [PASSED] 50 VFs
[08:25:25] [PASSED] 51 VFs
[08:25:25] [PASSED] 52 VFs
[08:25:25] [PASSED] 53 VFs
[08:25:25] [PASSED] 54 VFs
[08:25:25] [PASSED] 55 VFs
[08:25:25] [PASSED] 56 VFs
[08:25:25] [PASSED] 57 VFs
[08:25:25] [PASSED] 58 VFs
[08:25:25] [PASSED] 59 VFs
[08:25:25] [PASSED] 60 VFs
[08:25:25] [PASSED] 61 VFs
[08:25:25] [PASSED] 62 VFs
[08:25:25] [PASSED] 63 VFs
[08:25:25] ==================== [PASSED] fair_ggtt ====================
[08:25:25] ================== [PASSED] pf_gt_config ===================
[08:25:25] ===================== lmtt (1 subtest) =====================
[08:25:25] ======================== test_ops  =========================
[08:25:25] [PASSED] 2-level
[08:25:25] [PASSED] multi-level
[08:25:25] ==================== [PASSED] test_ops =====================
[08:25:25] ====================== [PASSED] lmtt =======================
[08:25:25] ================= pf_service (11 subtests) =================
[08:25:25] [PASSED] pf_negotiate_any
[08:25:25] [PASSED] pf_negotiate_base_match
[08:25:25] [PASSED] pf_negotiate_base_newer
[08:25:25] [PASSED] pf_negotiate_base_next
[08:25:25] [SKIPPED] pf_negotiate_base_older
[08:25:25] [PASSED] pf_negotiate_base_prev
[08:25:25] [PASSED] pf_negotiate_latest_match
[08:25:25] [PASSED] pf_negotiate_latest_newer
[08:25:25] [PASSED] pf_negotiate_latest_next
[08:25:25] [SKIPPED] pf_negotiate_latest_older
[08:25:25] [SKIPPED] pf_negotiate_latest_prev
[08:25:25] =================== [PASSED] pf_service ====================
[08:25:25] ================= xe_guc_g2g (2 subtests) ==================
[08:25:25] ============== xe_live_guc_g2g_kunit_default  ==============
[08:25:25] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[08:25:25] ============== xe_live_guc_g2g_kunit_allmem  ===============
[08:25:25] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[08:25:25] =================== [SKIPPED] xe_guc_g2g ===================
[08:25:25] =================== xe_mocs (2 subtests) ===================
[08:25:25] ================ xe_live_mocs_kernel_kunit  ================
[08:25:25] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[08:25:25] ================ xe_live_mocs_reset_kunit  =================
[08:25:25] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[08:25:25] ==================== [SKIPPED] xe_mocs =====================
[08:25:25] ================= xe_migrate (2 subtests) ==================
[08:25:25] ================= xe_migrate_sanity_kunit  =================
[08:25:25] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[08:25:25] ================== xe_validate_ccs_kunit  ==================
[08:25:25] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[08:25:25] =================== [SKIPPED] xe_migrate ===================
[08:25:25] ================== xe_dma_buf (1 subtest) ==================
[08:25:25] ==================== xe_dma_buf_kunit  =====================
[08:25:25] ================ [SKIPPED] xe_dma_buf_kunit ================
[08:25:25] =================== [SKIPPED] xe_dma_buf ===================
[08:25:25] ================= xe_bo_shrink (1 subtest) =================
[08:25:25] =================== xe_bo_shrink_kunit  ====================
[08:25:25] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[08:25:25] ================== [SKIPPED] xe_bo_shrink ==================
[08:25:25] ==================== xe_bo (2 subtests) ====================
[08:25:25] ================== xe_ccs_migrate_kunit  ===================
[08:25:25] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[08:25:25] ==================== xe_bo_evict_kunit  ====================
[08:25:25] =============== [SKIPPED] xe_bo_evict_kunit ================
[08:25:25] ===================== [SKIPPED] xe_bo ======================
[08:25:25] ==================== args (13 subtests) ====================
[08:25:25] [PASSED] count_args_test
[08:25:25] [PASSED] call_args_example
[08:25:25] [PASSED] call_args_test
[08:25:25] [PASSED] drop_first_arg_example
[08:25:25] [PASSED] drop_first_arg_test
[08:25:25] [PASSED] first_arg_example
[08:25:25] [PASSED] first_arg_test
[08:25:25] [PASSED] last_arg_example
[08:25:25] [PASSED] last_arg_test
[08:25:25] [PASSED] pick_arg_example
[08:25:25] [PASSED] if_args_example
[08:25:25] [PASSED] if_args_test
[08:25:25] [PASSED] sep_comma_example
[08:25:25] ====================== [PASSED] args =======================
[08:25:25] =================== xe_pci (3 subtests) ====================
[08:25:25] ==================== check_graphics_ip  ====================
[08:25:25] [PASSED] 12.00 Xe_LP
[08:25:25] [PASSED] 12.10 Xe_LP+
[08:25:25] [PASSED] 12.55 Xe_HPG
[08:25:25] [PASSED] 12.60 Xe_HPC
[08:25:25] [PASSED] 12.70 Xe_LPG
[08:25:25] [PASSED] 12.71 Xe_LPG
[08:25:25] [PASSED] 12.74 Xe_LPG+
[08:25:25] [PASSED] 20.01 Xe2_HPG
[08:25:25] [PASSED] 20.02 Xe2_HPG
[08:25:25] [PASSED] 20.04 Xe2_LPG
[08:25:25] [PASSED] 30.00 Xe3_LPG
[08:25:25] [PASSED] 30.01 Xe3_LPG
[08:25:25] [PASSED] 30.03 Xe3_LPG
[08:25:25] [PASSED] 30.04 Xe3_LPG
[08:25:25] [PASSED] 30.05 Xe3_LPG
[08:25:25] [PASSED] 35.11 Xe3p_XPC
[08:25:25] ================ [PASSED] check_graphics_ip ================
[08:25:25] ===================== check_media_ip  ======================
[08:25:25] [PASSED] 12.00 Xe_M
[08:25:25] [PASSED] 12.55 Xe_HPM
[08:25:25] [PASSED] 13.00 Xe_LPM+
[08:25:25] [PASSED] 13.01 Xe2_HPM
[08:25:25] [PASSED] 20.00 Xe2_LPM
[08:25:25] [PASSED] 30.00 Xe3_LPM
[08:25:25] [PASSED] 30.02 Xe3_LPM
[08:25:25] [PASSED] 35.00 Xe3p_LPM
[08:25:25] [PASSED] 35.03 Xe3p_HPM
[08:25:25] ================= [PASSED] check_media_ip ==================
[08:25:25] =================== check_platform_desc  ===================
[08:25:25] [PASSED] 0x9A60 (TIGERLAKE)
[08:25:25] [PASSED] 0x9A68 (TIGERLAKE)
[08:25:25] [PASSED] 0x9A70 (TIGERLAKE)
[08:25:25] [PASSED] 0x9A40 (TIGERLAKE)
[08:25:25] [PASSED] 0x9A49 (TIGERLAKE)
[08:25:25] [PASSED] 0x9A59 (TIGERLAKE)
[08:25:25] [PASSED] 0x9A78 (TIGERLAKE)
[08:25:25] [PASSED] 0x9AC0 (TIGERLAKE)
[08:25:25] [PASSED] 0x9AC9 (TIGERLAKE)
[08:25:25] [PASSED] 0x9AD9 (TIGERLAKE)
[08:25:25] [PASSED] 0x9AF8 (TIGERLAKE)
[08:25:25] [PASSED] 0x4C80 (ROCKETLAKE)
[08:25:25] [PASSED] 0x4C8A (ROCKETLAKE)
[08:25:25] [PASSED] 0x4C8B (ROCKETLAKE)
[08:25:25] [PASSED] 0x4C8C (ROCKETLAKE)
[08:25:25] [PASSED] 0x4C90 (ROCKETLAKE)
[08:25:25] [PASSED] 0x4C9A (ROCKETLAKE)
[08:25:25] [PASSED] 0x4680 (ALDERLAKE_S)
[08:25:25] [PASSED] 0x4682 (ALDERLAKE_S)
[08:25:25] [PASSED] 0x4688 (ALDERLAKE_S)
[08:25:25] [PASSED] 0x468A (ALDERLAKE_S)
[08:25:25] [PASSED] 0x468B (ALDERLAKE_S)
[08:25:25] [PASSED] 0x4690 (ALDERLAKE_S)
[08:25:25] [PASSED] 0x4692 (ALDERLAKE_S)
[08:25:25] [PASSED] 0x4693 (ALDERLAKE_S)
[08:25:25] [PASSED] 0x46A0 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46A1 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46A2 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46A3 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46A6 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46A8 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46AA (ALDERLAKE_P)
[08:25:25] [PASSED] 0x462A (ALDERLAKE_P)
[08:25:25] [PASSED] 0x4626 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x4628 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[08:25:25] [PASSED] 0x46B0 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46B1 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46B2 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46B3 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46C0 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46C1 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46C2 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46C3 (ALDERLAKE_P)
[08:25:25] [PASSED] 0x46D0 (ALDERLAKE_N)
[08:25:25] [PASSED] 0x46D1 (ALDERLAKE_N)
[08:25:25] [PASSED] 0x46D2 (ALDERLAKE_N)
[08:25:25] [PASSED] 0x46D3 (ALDERLAKE_N)
[08:25:25] [PASSED] 0x46D4 (ALDERLAKE_N)
[08:25:25] [PASSED] 0xA721 (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7A1 (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7A9 (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7AC (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7AD (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA720 (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7A0 (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7A8 (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7AA (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA7AB (ALDERLAKE_P)
[08:25:25] [PASSED] 0xA780 (ALDERLAKE_S)
[08:25:25] [PASSED] 0xA781 (ALDERLAKE_S)
[08:25:25] [PASSED] 0xA782 (ALDERLAKE_S)
[08:25:25] [PASSED] 0xA783 (ALDERLAKE_S)
[08:25:25] [PASSED] 0xA788 (ALDERLAKE_S)
[08:25:25] [PASSED] 0xA789 (ALDERLAKE_S)
[08:25:25] [PASSED] 0xA78A (ALDERLAKE_S)
[08:25:25] [PASSED] 0xA78B (ALDERLAKE_S)
[08:25:25] [PASSED] 0x4905 (DG1)
[08:25:25] [PASSED] 0x4906 (DG1)
[08:25:25] [PASSED] 0x4907 (DG1)
[08:25:25] [PASSED] 0x4908 (DG1)
[08:25:25] [PASSED] 0x4909 (DG1)
[08:25:25] [PASSED] 0x56C0 (DG2)
[08:25:25] [PASSED] 0x56C2 (DG2)
[08:25:25] [PASSED] 0x56C1 (DG2)
[08:25:25] [PASSED] 0x7D51 (METEORLAKE)
[08:25:25] [PASSED] 0x7DD1 (METEORLAKE)
[08:25:25] [PASSED] 0x7D41 (METEORLAKE)
[08:25:25] [PASSED] 0x7D67 (METEORLAKE)
[08:25:25] [PASSED] 0xB640 (METEORLAKE)
[08:25:25] [PASSED] 0x56A0 (DG2)
[08:25:25] [PASSED] 0x56A1 (DG2)
[08:25:25] [PASSED] 0x56A2 (DG2)
[08:25:25] [PASSED] 0x56BE (DG2)
[08:25:25] [PASSED] 0x56BF (DG2)
[08:25:25] [PASSED] 0x5690 (DG2)
[08:25:25] [PASSED] 0x5691 (DG2)
[08:25:25] [PASSED] 0x5692 (DG2)
[08:25:25] [PASSED] 0x56A5 (DG2)
[08:25:25] [PASSED] 0x56A6 (DG2)
[08:25:25] [PASSED] 0x56B0 (DG2)
[08:25:25] [PASSED] 0x56B1 (DG2)
[08:25:25] [PASSED] 0x56BA (DG2)
[08:25:25] [PASSED] 0x56BB (DG2)
[08:25:25] [PASSED] 0x56BC (DG2)
[08:25:25] [PASSED] 0x56BD (DG2)
[08:25:25] [PASSED] 0x5693 (DG2)
[08:25:25] [PASSED] 0x5694 (DG2)
[08:25:25] [PASSED] 0x5695 (DG2)
[08:25:25] [PASSED] 0x56A3 (DG2)
[08:25:25] [PASSED] 0x56A4 (DG2)
[08:25:25] [PASSED] 0x56B2 (DG2)
[08:25:25] [PASSED] 0x56B3 (DG2)
[08:25:25] [PASSED] 0x5696 (DG2)
[08:25:25] [PASSED] 0x5697 (DG2)
[08:25:25] [PASSED] 0xB69 (PVC)
[08:25:25] [PASSED] 0xB6E (PVC)
[08:25:25] [PASSED] 0xBD4 (PVC)
[08:25:25] [PASSED] 0xBD5 (PVC)
[08:25:25] [PASSED] 0xBD6 (PVC)
[08:25:25] [PASSED] 0xBD7 (PVC)
[08:25:25] [PASSED] 0xBD8 (PVC)
[08:25:25] [PASSED] 0xBD9 (PVC)
[08:25:25] [PASSED] 0xBDA (PVC)
[08:25:25] [PASSED] 0xBDB (PVC)
[08:25:25] [PASSED] 0xBE0 (PVC)
[08:25:25] [PASSED] 0xBE1 (PVC)
[08:25:25] [PASSED] 0xBE5 (PVC)
[08:25:25] [PASSED] 0x7D40 (METEORLAKE)
[08:25:25] [PASSED] 0x7D45 (METEORLAKE)
[08:25:25] [PASSED] 0x7D55 (METEORLAKE)
[08:25:25] [PASSED] 0x7D60 (METEORLAKE)
[08:25:25] [PASSED] 0x7DD5 (METEORLAKE)
[08:25:25] [PASSED] 0x6420 (LUNARLAKE)
[08:25:25] [PASSED] 0x64A0 (LUNARLAKE)
[08:25:25] [PASSED] 0x64B0 (LUNARLAKE)
[08:25:25] [PASSED] 0xE202 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE209 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE20B (BATTLEMAGE)
[08:25:25] [PASSED] 0xE20C (BATTLEMAGE)
[08:25:25] [PASSED] 0xE20D (BATTLEMAGE)
[08:25:25] [PASSED] 0xE210 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE211 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE212 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE216 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE220 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE221 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE222 (BATTLEMAGE)
[08:25:25] [PASSED] 0xE223 (BATTLEMAGE)
[08:25:25] [PASSED] 0xB080 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB081 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB082 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB083 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB084 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB085 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB086 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB087 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB08F (PANTHERLAKE)
[08:25:25] [PASSED] 0xB090 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB0A0 (PANTHERLAKE)
[08:25:25] [PASSED] 0xB0B0 (PANTHERLAKE)
[08:25:25] [PASSED] 0xFD80 (PANTHERLAKE)
[08:25:25] [PASSED] 0xFD81 (PANTHERLAKE)
[08:25:25] [PASSED] 0xD740 (NOVALAKE_S)
[08:25:25] [PASSED] 0xD741 (NOVALAKE_S)
[08:25:25] [PASSED] 0xD742 (NOVALAKE_S)
[08:25:25] [PASSED] 0xD743 (NOVALAKE_S)
[08:25:25] [PASSED] 0xD744 (NOVALAKE_S)
[08:25:25] [PASSED] 0xD745 (NOVALAKE_S)
[08:25:25] [PASSED] 0x674C (CRESCENTISLAND)
[08:25:25] =============== [PASSED] check_platform_desc ===============
[08:25:25] ===================== [PASSED] xe_pci ======================
[08:25:25] =================== xe_rtp (2 subtests) ====================
[08:25:25] =============== xe_rtp_process_to_sr_tests  ================
[08:25:25] [PASSED] coalesce-same-reg
[08:25:25] [PASSED] no-match-no-add
[08:25:25] [PASSED] match-or
[08:25:25] [PASSED] match-or-xfail
[08:25:25] [PASSED] no-match-no-add-multiple-rules
[08:25:25] [PASSED] two-regs-two-entries
[08:25:25] [PASSED] clr-one-set-other
[08:25:25] [PASSED] set-field
[08:25:25] [PASSED] conflict-duplicate
[08:25:25] [PASSED] conflict-not-disjoint
[08:25:25] [PASSED] conflict-reg-type
[08:25:25] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[08:25:25] ================== xe_rtp_process_tests  ===================
[08:25:25] [PASSED] active1
[08:25:25] [PASSED] active2
[08:25:25] [PASSED] active-inactive
[08:25:25] [PASSED] inactive-active
[08:25:25] [PASSED] inactive-1st_or_active-inactive
[08:25:25] [PASSED] inactive-2nd_or_active-inactive
[08:25:25] [PASSED] inactive-last_or_active-inactive
[08:25:25] [PASSED] inactive-no_or_active-inactive
[08:25:25] ============== [PASSED] xe_rtp_process_tests ===============
[08:25:25] ===================== [PASSED] xe_rtp ======================
[08:25:25] ==================== xe_wa (1 subtest) =====================
[08:25:25] ======================== xe_wa_gt  =========================
[08:25:25] [PASSED] TIGERLAKE B0
[08:25:25] [PASSED] DG1 A0
[08:25:25] [PASSED] DG1 B0
[08:25:25] [PASSED] ALDERLAKE_S A0
[08:25:25] [PASSED] ALDERLAKE_S B0
[08:25:25] [PASSED] ALDERLAKE_S C0
[08:25:25] [PASSED] ALDERLAKE_S D0
[08:25:25] [PASSED] ALDERLAKE_P A0
[08:25:25] [PASSED] ALDERLAKE_P B0
[08:25:25] [PASSED] ALDERLAKE_P C0
[08:25:25] [PASSED] ALDERLAKE_S RPLS D0
[08:25:25] [PASSED] ALDERLAKE_P RPLU E0
[08:25:25] [PASSED] DG2 G10 C0
[08:25:25] [PASSED] DG2 G11 B1
[08:25:25] [PASSED] DG2 G12 A1
[08:25:25] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[08:25:25] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[08:25:25] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[08:25:25] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[08:25:25] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[08:25:25] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[08:25:25] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[08:25:25] ==================== [PASSED] xe_wa_gt =====================
[08:25:25] ====================== [PASSED] xe_wa ======================
[08:25:25] ============================================================
[08:25:25] Testing complete. Ran 512 tests: passed: 494, skipped: 18
[08:25:25] Elapsed time: 36.307s total, 4.217s configuring, 31.574s building, 0.472s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[08:25:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:25:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:25:53] Starting KUnit Kernel (1/1)...
[08:25:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:25:53] ============ drm_test_pick_cmdline (2 subtests) ============
[08:25:53] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[08:25:53] =============== drm_test_pick_cmdline_named  ===============
[08:25:53] [PASSED] NTSC
[08:25:53] [PASSED] NTSC-J
[08:25:53] [PASSED] PAL
[08:25:53] [PASSED] PAL-M
[08:25:53] =========== [PASSED] drm_test_pick_cmdline_named ===========
[08:25:53] ============== [PASSED] drm_test_pick_cmdline ==============
[08:25:53] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[08:25:53] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[08:25:53] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[08:25:53] =========== drm_validate_clone_mode (2 subtests) ===========
[08:25:53] ============== drm_test_check_in_clone_mode  ===============
[08:25:53] [PASSED] in_clone_mode
[08:25:53] [PASSED] not_in_clone_mode
[08:25:53] ========== [PASSED] drm_test_check_in_clone_mode ===========
[08:25:53] =============== drm_test_check_valid_clones  ===============
[08:25:53] [PASSED] not_in_clone_mode
[08:25:53] [PASSED] valid_clone
[08:25:53] [PASSED] invalid_clone
[08:25:53] =========== [PASSED] drm_test_check_valid_clones ===========
[08:25:53] ============= [PASSED] drm_validate_clone_mode =============
[08:25:53] ============= drm_validate_modeset (1 subtest) =============
[08:25:53] [PASSED] drm_test_check_connector_changed_modeset
[08:25:53] ============== [PASSED] drm_validate_modeset ===============
[08:25:53] ====== drm_test_bridge_get_current_state (2 subtests) ======
[08:25:53] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[08:25:53] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[08:25:53] ======== [PASSED] drm_test_bridge_get_current_state ========
[08:25:53] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[08:25:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[08:25:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[08:25:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[08:25:53] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[08:25:53] ============== drm_bridge_alloc (2 subtests) ===============
[08:25:53] [PASSED] drm_test_drm_bridge_alloc_basic
[08:25:53] [PASSED] drm_test_drm_bridge_alloc_get_put
[08:25:53] ================ [PASSED] drm_bridge_alloc =================
[08:25:53] ================== drm_buddy (8 subtests) ==================
[08:25:53] [PASSED] drm_test_buddy_alloc_limit
[08:25:53] [PASSED] drm_test_buddy_alloc_optimistic
[08:25:53] [PASSED] drm_test_buddy_alloc_pessimistic
[08:25:53] [PASSED] drm_test_buddy_alloc_pathological
[08:25:53] [PASSED] drm_test_buddy_alloc_contiguous
[08:25:53] [PASSED] drm_test_buddy_alloc_clear
[08:25:53] [PASSED] drm_test_buddy_alloc_range_bias
[08:25:53] [PASSED] drm_test_buddy_fragmentation_performance
[08:25:53] ==================== [PASSED] drm_buddy ====================
[08:25:53] ============= drm_cmdline_parser (40 subtests) =============
[08:25:53] [PASSED] drm_test_cmdline_force_d_only
[08:25:53] [PASSED] drm_test_cmdline_force_D_only_dvi
[08:25:53] [PASSED] drm_test_cmdline_force_D_only_hdmi
[08:25:53] [PASSED] drm_test_cmdline_force_D_only_not_digital
[08:25:53] [PASSED] drm_test_cmdline_force_e_only
[08:25:53] [PASSED] drm_test_cmdline_res
[08:25:53] [PASSED] drm_test_cmdline_res_vesa
[08:25:53] [PASSED] drm_test_cmdline_res_vesa_rblank
[08:25:53] [PASSED] drm_test_cmdline_res_rblank
[08:25:53] [PASSED] drm_test_cmdline_res_bpp
[08:25:53] [PASSED] drm_test_cmdline_res_refresh
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[08:25:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[08:25:53] [PASSED] drm_test_cmdline_res_margins_force_on
[08:25:53] [PASSED] drm_test_cmdline_res_vesa_margins
[08:25:53] [PASSED] drm_test_cmdline_name
[08:25:53] [PASSED] drm_test_cmdline_name_bpp
[08:25:53] [PASSED] drm_test_cmdline_name_option
[08:25:53] [PASSED] drm_test_cmdline_name_bpp_option
[08:25:53] [PASSED] drm_test_cmdline_rotate_0
[08:25:53] [PASSED] drm_test_cmdline_rotate_90
[08:25:53] [PASSED] drm_test_cmdline_rotate_180
[08:25:53] [PASSED] drm_test_cmdline_rotate_270
[08:25:53] [PASSED] drm_test_cmdline_hmirror
[08:25:53] [PASSED] drm_test_cmdline_vmirror
[08:25:53] [PASSED] drm_test_cmdline_margin_options
[08:25:53] [PASSED] drm_test_cmdline_multiple_options
[08:25:53] [PASSED] drm_test_cmdline_bpp_extra_and_option
[08:25:53] [PASSED] drm_test_cmdline_extra_and_option
[08:25:53] [PASSED] drm_test_cmdline_freestanding_options
[08:25:53] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[08:25:53] [PASSED] drm_test_cmdline_panel_orientation
[08:25:53] ================ drm_test_cmdline_invalid  =================
[08:25:53] [PASSED] margin_only
[08:25:53] [PASSED] interlace_only
[08:25:53] [PASSED] res_missing_x
[08:25:53] [PASSED] res_missing_y
[08:25:53] [PASSED] res_bad_y
[08:25:53] [PASSED] res_missing_y_bpp
[08:25:53] [PASSED] res_bad_bpp
[08:25:53] [PASSED] res_bad_refresh
[08:25:53] [PASSED] res_bpp_refresh_force_on_off
[08:25:53] [PASSED] res_invalid_mode
[08:25:53] [PASSED] res_bpp_wrong_place_mode
[08:25:53] [PASSED] name_bpp_refresh
[08:25:53] [PASSED] name_refresh
[08:25:53] [PASSED] name_refresh_wrong_mode
[08:25:53] [PASSED] name_refresh_invalid_mode
[08:25:53] [PASSED] rotate_multiple
[08:25:53] [PASSED] rotate_invalid_val
[08:25:53] [PASSED] rotate_truncated
[08:25:53] [PASSED] invalid_option
[08:25:53] [PASSED] invalid_tv_option
[08:25:53] [PASSED] truncated_tv_option
[08:25:53] ============ [PASSED] drm_test_cmdline_invalid =============
[08:25:53] =============== drm_test_cmdline_tv_options  ===============
[08:25:53] [PASSED] NTSC
[08:25:53] [PASSED] NTSC_443
[08:25:53] [PASSED] NTSC_J
[08:25:53] [PASSED] PAL
[08:25:53] [PASSED] PAL_M
[08:25:53] [PASSED] PAL_N
[08:25:53] [PASSED] SECAM
[08:25:53] [PASSED] MONO_525
[08:25:53] [PASSED] MONO_625
[08:25:53] =========== [PASSED] drm_test_cmdline_tv_options ===========
[08:25:53] =============== [PASSED] drm_cmdline_parser ================
[08:25:53] ========== drmm_connector_hdmi_init (20 subtests) ==========
[08:25:53] [PASSED] drm_test_connector_hdmi_init_valid
[08:25:53] [PASSED] drm_test_connector_hdmi_init_bpc_8
[08:25:53] [PASSED] drm_test_connector_hdmi_init_bpc_10
[08:25:53] [PASSED] drm_test_connector_hdmi_init_bpc_12
[08:25:53] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[08:25:53] [PASSED] drm_test_connector_hdmi_init_bpc_null
[08:25:53] [PASSED] drm_test_connector_hdmi_init_formats_empty
[08:25:53] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[08:25:53] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[08:25:53] [PASSED] supported_formats=0x9 yuv420_allowed=1
[08:25:53] [PASSED] supported_formats=0x9 yuv420_allowed=0
[08:25:53] [PASSED] supported_formats=0x3 yuv420_allowed=1
[08:25:53] [PASSED] supported_formats=0x3 yuv420_allowed=0
[08:25:53] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[08:25:53] [PASSED] drm_test_connector_hdmi_init_null_ddc
[08:25:53] [PASSED] drm_test_connector_hdmi_init_null_product
[08:25:53] [PASSED] drm_test_connector_hdmi_init_null_vendor
[08:25:53] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[08:25:53] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[08:25:53] [PASSED] drm_test_connector_hdmi_init_product_valid
[08:25:53] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[08:25:53] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[08:25:53] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[08:25:53] ========= drm_test_connector_hdmi_init_type_valid  =========
[08:25:53] [PASSED] HDMI-A
[08:25:53] [PASSED] HDMI-B
[08:25:53] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[08:25:53] ======== drm_test_connector_hdmi_init_type_invalid  ========
[08:25:53] [PASSED] Unknown
[08:25:53] [PASSED] VGA
[08:25:53] [PASSED] DVI-I
[08:25:53] [PASSED] DVI-D
[08:25:53] [PASSED] DVI-A
[08:25:53] [PASSED] Composite
[08:25:53] [PASSED] SVIDEO
[08:25:53] [PASSED] LVDS
[08:25:53] [PASSED] Component
[08:25:53] [PASSED] DIN
[08:25:53] [PASSED] DP
[08:25:53] [PASSED] TV
[08:25:53] [PASSED] eDP
[08:25:53] [PASSED] Virtual
[08:25:53] [PASSED] DSI
[08:25:53] [PASSED] DPI
[08:25:53] [PASSED] Writeback
[08:25:53] [PASSED] SPI
[08:25:53] [PASSED] USB
[08:25:53] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[08:25:53] ============ [PASSED] drmm_connector_hdmi_init =============
[08:25:53] ============= drmm_connector_init (3 subtests) =============
[08:25:53] [PASSED] drm_test_drmm_connector_init
[08:25:53] [PASSED] drm_test_drmm_connector_init_null_ddc
[08:25:53] ========= drm_test_drmm_connector_init_type_valid  =========
[08:25:53] [PASSED] Unknown
[08:25:53] [PASSED] VGA
[08:25:53] [PASSED] DVI-I
[08:25:53] [PASSED] DVI-D
[08:25:53] [PASSED] DVI-A
[08:25:53] [PASSED] Composite
[08:25:53] [PASSED] SVIDEO
[08:25:53] [PASSED] LVDS
[08:25:53] [PASSED] Component
[08:25:53] [PASSED] DIN
[08:25:53] [PASSED] DP
[08:25:53] [PASSED] HDMI-A
[08:25:53] [PASSED] HDMI-B
[08:25:53] [PASSED] TV
[08:25:53] [PASSED] eDP
[08:25:53] [PASSED] Virtual
[08:25:53] [PASSED] DSI
[08:25:53] [PASSED] DPI
[08:25:53] [PASSED] Writeback
[08:25:53] [PASSED] SPI
[08:25:53] [PASSED] USB
[08:25:53] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[08:25:53] =============== [PASSED] drmm_connector_init ===============
[08:25:53] ========= drm_connector_dynamic_init (6 subtests) ==========
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_init
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_init_properties
[08:25:53] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[08:25:53] [PASSED] Unknown
[08:25:53] [PASSED] VGA
[08:25:53] [PASSED] DVI-I
[08:25:53] [PASSED] DVI-D
[08:25:53] [PASSED] DVI-A
[08:25:53] [PASSED] Composite
[08:25:53] [PASSED] SVIDEO
[08:25:53] [PASSED] LVDS
[08:25:53] [PASSED] Component
[08:25:53] [PASSED] DIN
[08:25:53] [PASSED] DP
[08:25:53] [PASSED] HDMI-A
[08:25:53] [PASSED] HDMI-B
[08:25:53] [PASSED] TV
[08:25:53] [PASSED] eDP
[08:25:53] [PASSED] Virtual
[08:25:53] [PASSED] DSI
[08:25:53] [PASSED] DPI
[08:25:53] [PASSED] Writeback
[08:25:53] [PASSED] SPI
[08:25:53] [PASSED] USB
[08:25:53] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[08:25:53] ======== drm_test_drm_connector_dynamic_init_name  =========
[08:25:53] [PASSED] Unknown
[08:25:53] [PASSED] VGA
[08:25:53] [PASSED] DVI-I
[08:25:53] [PASSED] DVI-D
[08:25:53] [PASSED] DVI-A
[08:25:53] [PASSED] Composite
[08:25:53] [PASSED] SVIDEO
[08:25:53] [PASSED] LVDS
[08:25:53] [PASSED] Component
[08:25:53] [PASSED] DIN
[08:25:53] [PASSED] DP
[08:25:53] [PASSED] HDMI-A
[08:25:53] [PASSED] HDMI-B
[08:25:53] [PASSED] TV
[08:25:53] [PASSED] eDP
[08:25:53] [PASSED] Virtual
[08:25:53] [PASSED] DSI
[08:25:53] [PASSED] DPI
[08:25:53] [PASSED] Writeback
[08:25:53] [PASSED] SPI
[08:25:53] [PASSED] USB
[08:25:53] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[08:25:53] =========== [PASSED] drm_connector_dynamic_init ============
[08:25:53] ==== drm_connector_dynamic_register_early (4 subtests) =====
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[08:25:53] ====== [PASSED] drm_connector_dynamic_register_early =======
[08:25:53] ======= drm_connector_dynamic_register (7 subtests) ========
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[08:25:53] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[08:25:53] ========= [PASSED] drm_connector_dynamic_register ==========
[08:25:53] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[08:25:53] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[08:25:53] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[08:25:53] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[08:25:53] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[08:25:53] ========== drm_test_get_tv_mode_from_name_valid  ===========
[08:25:53] [PASSED] NTSC
[08:25:53] [PASSED] NTSC-443
[08:25:53] [PASSED] NTSC-J
[08:25:53] [PASSED] PAL
[08:25:53] [PASSED] PAL-M
[08:25:53] [PASSED] PAL-N
[08:25:53] [PASSED] SECAM
[08:25:53] [PASSED] Mono
[08:25:53] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[08:25:53] [PASSED] drm_test_get_tv_mode_from_name_truncated
[08:25:53] ============ [PASSED] drm_get_tv_mode_from_name ============
[08:25:53] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[08:25:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[08:25:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[08:25:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[08:25:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[08:25:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[08:25:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[08:25:53] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[08:25:53] [PASSED] VIC 96
[08:25:53] [PASSED] VIC 97
[08:25:53] [PASSED] VIC 101
[08:25:53] [PASSED] VIC 102
[08:25:53] [PASSED] VIC 106
[08:25:53] [PASSED] VIC 107
[08:25:53] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[08:25:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[08:25:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[08:25:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[08:25:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[08:25:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[08:25:53] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[08:25:53] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[08:25:53] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[08:25:53] [PASSED] Automatic
[08:25:53] [PASSED] Full
[08:25:53] [PASSED] Limited 16:235
[08:25:53] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[08:25:53] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[08:25:53] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[08:25:53] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[08:25:53] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[08:25:53] [PASSED] RGB
[08:25:53] [PASSED] YUV 4:2:0
[08:25:53] [PASSED] YUV 4:2:2
[08:25:53] [PASSED] YUV 4:4:4
[08:25:53] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[08:25:53] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[08:25:53] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[08:25:53] ============= drm_damage_helper (21 subtests) ==============
[08:25:53] [PASSED] drm_test_damage_iter_no_damage
[08:25:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[08:25:53] [PASSED] drm_test_damage_iter_no_damage_src_moved
[08:25:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[08:25:53] [PASSED] drm_test_damage_iter_no_damage_not_visible
[08:25:53] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[08:25:53] [PASSED] drm_test_damage_iter_no_damage_no_fb
[08:25:53] [PASSED] drm_test_damage_iter_simple_damage
[08:25:53] [PASSED] drm_test_damage_iter_single_damage
[08:25:53] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[08:25:53] [PASSED] drm_test_damage_iter_single_damage_outside_src
[08:25:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[08:25:53] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[08:25:53] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[08:25:53] [PASSED] drm_test_damage_iter_single_damage_src_moved
[08:25:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[08:25:53] [PASSED] drm_test_damage_iter_damage
[08:25:53] [PASSED] drm_test_damage_iter_damage_one_intersect
[08:25:53] [PASSED] drm_test_damage_iter_damage_one_outside
[08:25:53] [PASSED] drm_test_damage_iter_damage_src_moved
[08:25:53] [PASSED] drm_test_damage_iter_damage_not_visible
[08:25:53] ================ [PASSED] drm_damage_helper ================
[08:25:53] ============== drm_dp_mst_helper (3 subtests) ==============
[08:25:53] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[08:25:53] [PASSED] Clock 154000 BPP 30 DSC disabled
[08:25:53] [PASSED] Clock 234000 BPP 30 DSC disabled
[08:25:53] [PASSED] Clock 297000 BPP 24 DSC disabled
[08:25:53] [PASSED] Clock 332880 BPP 24 DSC enabled
[08:25:53] [PASSED] Clock 324540 BPP 24 DSC enabled
[08:25:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[08:25:53] ============== drm_test_dp_mst_calc_pbn_div  ===============
[08:25:53] [PASSED] Link rate 2000000 lane count 4
[08:25:53] [PASSED] Link rate 2000000 lane count 2
[08:25:53] [PASSED] Link rate 2000000 lane count 1
[08:25:53] [PASSED] Link rate 1350000 lane count 4
[08:25:53] [PASSED] Link rate 1350000 lane count 2
[08:25:53] [PASSED] Link rate 1350000 lane count 1
[08:25:53] [PASSED] Link rate 1000000 lane count 4
[08:25:53] [PASSED] Link rate 1000000 lane count 2
[08:25:53] [PASSED] Link rate 1000000 lane count 1
[08:25:53] [PASSED] Link rate 810000 lane count 4
[08:25:53] [PASSED] Link rate 810000 lane count 2
[08:25:53] [PASSED] Link rate 810000 lane count 1
[08:25:53] [PASSED] Link rate 540000 lane count 4
[08:25:53] [PASSED] Link rate 540000 lane count 2
[08:25:53] [PASSED] Link rate 540000 lane count 1
[08:25:53] [PASSED] Link rate 270000 lane count 4
[08:25:53] [PASSED] Link rate 270000 lane count 2
[08:25:53] [PASSED] Link rate 270000 lane count 1
[08:25:53] [PASSED] Link rate 162000 lane count 4
[08:25:53] [PASSED] Link rate 162000 lane count 2
[08:25:53] [PASSED] Link rate 162000 lane count 1
[08:25:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[08:25:53] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[08:25:53] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[08:25:53] [PASSED] DP_POWER_UP_PHY with port number
[08:25:53] [PASSED] DP_POWER_DOWN_PHY with port number
[08:25:53] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[08:25:53] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[08:25:53] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[08:25:53] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[08:25:53] [PASSED] DP_QUERY_PAYLOAD with port number
[08:25:53] [PASSED] DP_QUERY_PAYLOAD with VCPI
[08:25:53] [PASSED] DP_REMOTE_DPCD_READ with port number
[08:25:53] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[08:25:53] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[08:25:53] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[08:25:53] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[08:25:53] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[08:25:53] [PASSED] DP_REMOTE_I2C_READ with port number
[08:25:53] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[08:25:53] [PASSED] DP_REMOTE_I2C_READ with transactions array
[08:25:53] [PASSED] DP_REMOTE_I2C_WRITE with port number
[08:25:53] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[08:25:53] [PASSED] DP_REMOTE_I2C_WRITE with data array
[08:25:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[08:25:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[08:25:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[08:25:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[08:25:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[08:25:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[08:25:53] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[08:25:53] ================ [PASSED] drm_dp_mst_helper ================
[08:25:53] ================== drm_exec (7 subtests) ===================
[08:25:53] [PASSED] sanitycheck
[08:25:53] [PASSED] test_lock
[08:25:53] [PASSED] test_lock_unlock
[08:25:53] [PASSED] test_duplicates
[08:25:53] [PASSED] test_prepare
[08:25:53] [PASSED] test_prepare_array
[08:25:53] [PASSED] test_multiple_loops
[08:25:53] ==================== [PASSED] drm_exec =====================
[08:25:53] =========== drm_format_helper_test (17 subtests) ===========
[08:25:53] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[08:25:53] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[08:25:53] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[08:25:53] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[08:25:53] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[08:25:53] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[08:25:53] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[08:25:53] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[08:25:53] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[08:25:53] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[08:25:53] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[08:25:53] ============== drm_test_fb_xrgb8888_to_mono  ===============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[08:25:53] ==================== drm_test_fb_swab  =====================
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ================ [PASSED] drm_test_fb_swab =================
[08:25:53] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[08:25:53] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[08:25:53] [PASSED] single_pixel_source_buffer
[08:25:53] [PASSED] single_pixel_clip_rectangle
[08:25:53] [PASSED] well_known_colors
[08:25:53] [PASSED] destination_pitch
[08:25:53] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[08:25:53] ================= drm_test_fb_clip_offset  =================
[08:25:53] [PASSED] pass through
[08:25:53] [PASSED] horizontal offset
[08:25:53] [PASSED] vertical offset
[08:25:53] [PASSED] horizontal and vertical offset
[08:25:53] [PASSED] horizontal offset (custom pitch)
[08:25:53] [PASSED] vertical offset (custom pitch)
[08:25:53] [PASSED] horizontal and vertical offset (custom pitch)
[08:25:53] ============= [PASSED] drm_test_fb_clip_offset =============
[08:25:53] =================== drm_test_fb_memcpy  ====================
[08:25:53] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[08:25:53] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[08:25:53] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[08:25:53] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[08:25:53] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[08:25:53] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[08:25:53] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[08:25:53] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[08:25:53] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[08:25:53] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[08:25:53] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[08:25:53] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[08:25:53] =============== [PASSED] drm_test_fb_memcpy ================
[08:25:53] ============= [PASSED] drm_format_helper_test ==============
[08:25:53] ================= drm_format (18 subtests) =================
[08:25:53] [PASSED] drm_test_format_block_width_invalid
[08:25:53] [PASSED] drm_test_format_block_width_one_plane
[08:25:53] [PASSED] drm_test_format_block_width_two_plane
[08:25:53] [PASSED] drm_test_format_block_width_three_plane
[08:25:53] [PASSED] drm_test_format_block_width_tiled
[08:25:53] [PASSED] drm_test_format_block_height_invalid
[08:25:53] [PASSED] drm_test_format_block_height_one_plane
[08:25:53] [PASSED] drm_test_format_block_height_two_plane
[08:25:53] [PASSED] drm_test_format_block_height_three_plane
[08:25:53] [PASSED] drm_test_format_block_height_tiled
[08:25:53] [PASSED] drm_test_format_min_pitch_invalid
[08:25:53] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[08:25:53] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[08:25:53] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[08:25:53] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[08:25:53] [PASSED] drm_test_format_min_pitch_two_plane
[08:25:53] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[08:25:53] [PASSED] drm_test_format_min_pitch_tiled
[08:25:53] =================== [PASSED] drm_format ====================
[08:25:53] ============== drm_framebuffer (10 subtests) ===============
[08:25:53] ========== drm_test_framebuffer_check_src_coords  ==========
[08:25:53] [PASSED] Success: source fits into fb
[08:25:53] [PASSED] Fail: overflowing fb with x-axis coordinate
[08:25:53] [PASSED] Fail: overflowing fb with y-axis coordinate
[08:25:53] [PASSED] Fail: overflowing fb with source width
[08:25:53] [PASSED] Fail: overflowing fb with source height
[08:25:53] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[08:25:53] [PASSED] drm_test_framebuffer_cleanup
[08:25:53] =============== drm_test_framebuffer_create  ===============
[08:25:53] [PASSED] ABGR8888 normal sizes
[08:25:53] [PASSED] ABGR8888 max sizes
[08:25:53] [PASSED] ABGR8888 pitch greater than min required
[08:25:53] [PASSED] ABGR8888 pitch less than min required
[08:25:53] [PASSED] ABGR8888 Invalid width
[08:25:53] [PASSED] ABGR8888 Invalid buffer handle
[08:25:53] [PASSED] No pixel format
[08:25:53] [PASSED] ABGR8888 Width 0
[08:25:53] [PASSED] ABGR8888 Height 0
[08:25:53] [PASSED] ABGR8888 Out of bound height * pitch combination
[08:25:53] [PASSED] ABGR8888 Large buffer offset
[08:25:53] [PASSED] ABGR8888 Buffer offset for inexistent plane
[08:25:53] [PASSED] ABGR8888 Invalid flag
[08:25:53] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[08:25:53] [PASSED] ABGR8888 Valid buffer modifier
[08:25:53] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[08:25:53] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[08:25:53] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[08:25:53] [PASSED] NV12 Normal sizes
[08:25:53] [PASSED] NV12 Max sizes
[08:25:53] [PASSED] NV12 Invalid pitch
[08:25:53] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[08:25:53] [PASSED] NV12 different  modifier per-plane
[08:25:53] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[08:25:53] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[08:25:53] [PASSED] NV12 Modifier for inexistent plane
[08:25:53] [PASSED] NV12 Handle for inexistent plane
[08:25:53] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[08:25:53] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[08:25:53] [PASSED] YVU420 Normal sizes
[08:25:53] [PASSED] YVU420 Max sizes
[08:25:53] [PASSED] YVU420 Invalid pitch
[08:25:53] [PASSED] YVU420 Different pitches
[08:25:53] [PASSED] YVU420 Different buffer offsets/pitches
[08:25:53] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[08:25:53] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[08:25:53] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[08:25:53] [PASSED] YVU420 Valid modifier
[08:25:53] [PASSED] YVU420 Different modifiers per plane
[08:25:53] [PASSED] YVU420 Modifier for inexistent plane
[08:25:53] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[08:25:53] [PASSED] X0L2 Normal sizes
[08:25:53] [PASSED] X0L2 Max sizes
[08:25:53] [PASSED] X0L2 Invalid pitch
[08:25:53] [PASSED] X0L2 Pitch greater than minimum required
[08:25:53] [PASSED] X0L2 Handle for inexistent plane
[08:25:53] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[08:25:53] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[08:25:53] [PASSED] X0L2 Valid modifier
[08:25:53] [PASSED] X0L2 Modifier for inexistent plane
[08:25:53] =========== [PASSED] drm_test_framebuffer_create ===========
[08:25:53] [PASSED] drm_test_framebuffer_free
[08:25:53] [PASSED] drm_test_framebuffer_init
[08:25:53] [PASSED] drm_test_framebuffer_init_bad_format
[08:25:53] [PASSED] drm_test_framebuffer_init_dev_mismatch
[08:25:53] [PASSED] drm_test_framebuffer_lookup
[08:25:53] [PASSED] drm_test_framebuffer_lookup_inexistent
[08:25:53] [PASSED] drm_test_framebuffer_modifiers_not_supported
[08:25:53] ================= [PASSED] drm_framebuffer =================
[08:25:53] ================ drm_gem_shmem (8 subtests) ================
[08:25:53] [PASSED] drm_gem_shmem_test_obj_create
[08:25:53] [PASSED] drm_gem_shmem_test_obj_create_private
[08:25:53] [PASSED] drm_gem_shmem_test_pin_pages
[08:25:53] [PASSED] drm_gem_shmem_test_vmap
[08:25:53] [PASSED] drm_gem_shmem_test_get_pages_sgt
[08:25:53] [PASSED] drm_gem_shmem_test_get_sg_table
[08:25:53] [PASSED] drm_gem_shmem_test_madvise
[08:25:53] [PASSED] drm_gem_shmem_test_purge
[08:25:53] ================== [PASSED] drm_gem_shmem ==================
[08:25:53] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[08:25:53] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[08:25:53] [PASSED] Automatic
[08:25:53] [PASSED] Full
[08:25:53] [PASSED] Limited 16:235
[08:25:53] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[08:25:53] [PASSED] drm_test_check_disable_connector
[08:25:53] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[08:25:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[08:25:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[08:25:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[08:25:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[08:25:53] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[08:25:53] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[08:25:53] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[08:25:53] [PASSED] drm_test_check_output_bpc_dvi
[08:25:53] [PASSED] drm_test_check_output_bpc_format_vic_1
[08:25:53] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[08:25:53] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[08:25:53] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[08:25:53] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[08:25:53] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[08:25:53] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[08:25:53] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[08:25:53] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[08:25:53] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[08:25:53] [PASSED] drm_test_check_broadcast_rgb_value
[08:25:53] [PASSED] drm_test_check_bpc_8_value
[08:25:53] [PASSED] drm_test_check_bpc_10_value
[08:25:53] [PASSED] drm_test_check_bpc_12_value
[08:25:53] [PASSED] drm_test_check_format_value
[08:25:53] [PASSED] drm_test_check_tmds_char_value
[08:25:53] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[08:25:53] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[08:25:53] [PASSED] drm_test_check_mode_valid
[08:25:53] [PASSED] drm_test_check_mode_valid_reject
[08:25:53] [PASSED] drm_test_check_mode_valid_reject_rate
[08:25:53] [PASSED] drm_test_check_mode_valid_reject_max_clock
[08:25:53] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[08:25:53] ================= drm_managed (2 subtests) =================
[08:25:53] [PASSED] drm_test_managed_release_action
[08:25:53] [PASSED] drm_test_managed_run_action
[08:25:53] =================== [PASSED] drm_managed ===================
[08:25:53] =================== drm_mm (6 subtests) ====================
[08:25:53] [PASSED] drm_test_mm_init
[08:25:53] [PASSED] drm_test_mm_debug
[08:25:53] [PASSED] drm_test_mm_align32
[08:25:53] [PASSED] drm_test_mm_align64
[08:25:53] [PASSED] drm_test_mm_lowest
[08:25:53] [PASSED] drm_test_mm_highest
[08:25:53] ===================== [PASSED] drm_mm ======================
[08:25:53] ============= drm_modes_analog_tv (5 subtests) =============
[08:25:53] [PASSED] drm_test_modes_analog_tv_mono_576i
[08:25:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[08:25:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[08:25:53] [PASSED] drm_test_modes_analog_tv_pal_576i
[08:25:53] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[08:25:53] =============== [PASSED] drm_modes_analog_tv ===============
[08:25:53] ============== drm_plane_helper (2 subtests) ===============
[08:25:53] =============== drm_test_check_plane_state  ================
[08:25:53] [PASSED] clipping_simple
[08:25:53] [PASSED] clipping_rotate_reflect
[08:25:53] [PASSED] positioning_simple
[08:25:53] [PASSED] upscaling
[08:25:53] [PASSED] downscaling
[08:25:53] [PASSED] rounding1
[08:25:53] [PASSED] rounding2
[08:25:53] [PASSED] rounding3
[08:25:53] [PASSED] rounding4
[08:25:53] =========== [PASSED] drm_test_check_plane_state ============
[08:25:53] =========== drm_test_check_invalid_plane_state  ============
[08:25:53] [PASSED] positioning_invalid
[08:25:53] [PASSED] upscaling_invalid
[08:25:53] [PASSED] downscaling_invalid
[08:25:53] ======= [PASSED] drm_test_check_invalid_plane_state ========
[08:25:53] ================ [PASSED] drm_plane_helper =================
[08:25:53] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[08:25:53] ====== drm_test_connector_helper_tv_get_modes_check  =======
[08:25:53] [PASSED] None
[08:25:53] [PASSED] PAL
[08:25:53] [PASSED] NTSC
[08:25:53] [PASSED] Both, NTSC Default
[08:25:53] [PASSED] Both, PAL Default
[08:25:53] [PASSED] Both, NTSC Default, with PAL on command-line
[08:25:53] [PASSED] Both, PAL Default, with NTSC on command-line
[08:25:53] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[08:25:53] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[08:25:53] ================== drm_rect (9 subtests) ===================
[08:25:53] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[08:25:53] [PASSED] drm_test_rect_clip_scaled_not_clipped
[08:25:53] [PASSED] drm_test_rect_clip_scaled_clipped
[08:25:53] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[08:25:53] ================= drm_test_rect_intersect  =================
[08:25:53] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[08:25:53] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[08:25:53] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[08:25:53] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[08:25:53] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[08:25:53] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[08:25:53] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[08:25:53] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[08:25:53] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[08:25:53] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[08:25:53] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[08:25:53] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[08:25:53] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[08:25:53] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[08:25:53] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[08:25:53] ============= [PASSED] drm_test_rect_intersect =============
[08:25:53] ================ drm_test_rect_calc_hscale  ================
[08:25:53] [PASSED] normal use
[08:25:53] [PASSED] out of max range
[08:25:53] [PASSED] out of min range
[08:25:53] [PASSED] zero dst
[08:25:53] [PASSED] negative src
[08:25:53] [PASSED] negative dst
[08:25:53] ============ [PASSED] drm_test_rect_calc_hscale ============
[08:25:53] ================ drm_test_rect_calc_vscale  ================
[08:25:53] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[08:25:53] [PASSED] out of max range
[08:25:53] [PASSED] out of min range
[08:25:53] [PASSED] zero dst
[08:25:53] [PASSED] negative src
[08:25:53] [PASSED] negative dst
[08:25:53] ============ [PASSED] drm_test_rect_calc_vscale ============
[08:25:53] ================== drm_test_rect_rotate  ===================
[08:25:53] [PASSED] reflect-x
[08:25:53] [PASSED] reflect-y
[08:25:53] [PASSED] rotate-0
[08:25:53] [PASSED] rotate-90
[08:25:53] [PASSED] rotate-180
[08:25:53] [PASSED] rotate-270
[08:25:53] ============== [PASSED] drm_test_rect_rotate ===============
[08:25:53] ================ drm_test_rect_rotate_inv  =================
[08:25:53] [PASSED] reflect-x
[08:25:53] [PASSED] reflect-y
[08:25:53] [PASSED] rotate-0
[08:25:53] [PASSED] rotate-90
[08:25:53] [PASSED] rotate-180
[08:25:53] [PASSED] rotate-270
[08:25:53] ============ [PASSED] drm_test_rect_rotate_inv =============
[08:25:53] ==================== [PASSED] drm_rect =====================
[08:25:53] ============ drm_sysfb_modeset_test (1 subtest) ============
[08:25:53] ============ drm_test_sysfb_build_fourcc_list  =============
[08:25:53] [PASSED] no native formats
[08:25:53] [PASSED] XRGB8888 as native format
[08:25:53] [PASSED] remove duplicates
[08:25:53] [PASSED] convert alpha formats
[08:25:53] [PASSED] random formats
[08:25:53] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[08:25:53] ============= [PASSED] drm_sysfb_modeset_test ==============
[08:25:53] ================== drm_fixp (2 subtests) ===================
[08:25:53] [PASSED] drm_test_int2fixp
[08:25:53] [PASSED] drm_test_sm2fixp
[08:25:53] ==================== [PASSED] drm_fixp =====================
[08:25:53] ============================================================
[08:25:53] Testing complete. Ran 624 tests: passed: 624
[08:25:53] Elapsed time: 27.438s total, 1.673s configuring, 25.346s building, 0.373s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[08:25:53] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:25:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:26:04] Starting KUnit Kernel (1/1)...
[08:26:04] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:26:04] ================= ttm_device (5 subtests) ==================
[08:26:04] [PASSED] ttm_device_init_basic
[08:26:04] [PASSED] ttm_device_init_multiple
[08:26:04] [PASSED] ttm_device_fini_basic
[08:26:04] [PASSED] ttm_device_init_no_vma_man
[08:26:04] ================== ttm_device_init_pools  ==================
[08:26:04] [PASSED] No DMA allocations, no DMA32 required
[08:26:04] [PASSED] DMA allocations, DMA32 required
[08:26:04] [PASSED] No DMA allocations, DMA32 required
[08:26:04] [PASSED] DMA allocations, no DMA32 required
[08:26:04] ============== [PASSED] ttm_device_init_pools ==============
[08:26:04] =================== [PASSED] ttm_device ====================
[08:26:04] ================== ttm_pool (8 subtests) ===================
[08:26:04] ================== ttm_pool_alloc_basic  ===================
[08:26:04] [PASSED] One page
[08:26:04] [PASSED] More than one page
[08:26:04] [PASSED] Above the allocation limit
[08:26:04] [PASSED] One page, with coherent DMA mappings enabled
[08:26:04] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:26:04] ============== [PASSED] ttm_pool_alloc_basic ===============
[08:26:04] ============== ttm_pool_alloc_basic_dma_addr  ==============
[08:26:04] [PASSED] One page
[08:26:04] [PASSED] More than one page
[08:26:04] [PASSED] Above the allocation limit
[08:26:04] [PASSED] One page, with coherent DMA mappings enabled
[08:26:04] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:26:04] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[08:26:04] [PASSED] ttm_pool_alloc_order_caching_match
[08:26:04] [PASSED] ttm_pool_alloc_caching_mismatch
[08:26:04] [PASSED] ttm_pool_alloc_order_mismatch
[08:26:04] [PASSED] ttm_pool_free_dma_alloc
[08:26:04] [PASSED] ttm_pool_free_no_dma_alloc
[08:26:04] [PASSED] ttm_pool_fini_basic
[08:26:04] ==================== [PASSED] ttm_pool =====================
[08:26:04] ================ ttm_resource (8 subtests) =================
[08:26:04] ================= ttm_resource_init_basic  =================
[08:26:04] [PASSED] Init resource in TTM_PL_SYSTEM
[08:26:04] [PASSED] Init resource in TTM_PL_VRAM
[08:26:04] [PASSED] Init resource in a private placement
[08:26:04] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[08:26:04] ============= [PASSED] ttm_resource_init_basic =============
[08:26:04] [PASSED] ttm_resource_init_pinned
[08:26:04] [PASSED] ttm_resource_fini_basic
[08:26:04] [PASSED] ttm_resource_manager_init_basic
[08:26:04] [PASSED] ttm_resource_manager_usage_basic
[08:26:04] [PASSED] ttm_resource_manager_set_used_basic
[08:26:04] [PASSED] ttm_sys_man_alloc_basic
[08:26:04] [PASSED] ttm_sys_man_free_basic
[08:26:04] ================== [PASSED] ttm_resource ===================
[08:26:04] =================== ttm_tt (15 subtests) ===================
[08:26:04] ==================== ttm_tt_init_basic  ====================
[08:26:04] [PASSED] Page-aligned size
[08:26:04] [PASSED] Extra pages requested
[08:26:04] ================ [PASSED] ttm_tt_init_basic ================
[08:26:04] [PASSED] ttm_tt_init_misaligned
[08:26:04] [PASSED] ttm_tt_fini_basic
[08:26:04] [PASSED] ttm_tt_fini_sg
[08:26:04] [PASSED] ttm_tt_fini_shmem
[08:26:04] [PASSED] ttm_tt_create_basic
[08:26:04] [PASSED] ttm_tt_create_invalid_bo_type
[08:26:04] [PASSED] ttm_tt_create_ttm_exists
[08:26:04] [PASSED] ttm_tt_create_failed
[08:26:04] [PASSED] ttm_tt_destroy_basic
[08:26:04] [PASSED] ttm_tt_populate_null_ttm
[08:26:04] [PASSED] ttm_tt_populate_populated_ttm
[08:26:04] [PASSED] ttm_tt_unpopulate_basic
[08:26:04] [PASSED] ttm_tt_unpopulate_empty_ttm
[08:26:04] [PASSED] ttm_tt_swapin_basic
[08:26:04] ===================== [PASSED] ttm_tt ======================
[08:26:04] =================== ttm_bo (14 subtests) ===================
[08:26:04] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[08:26:04] [PASSED] Cannot be interrupted and sleeps
[08:26:04] [PASSED] Cannot be interrupted, locks straight away
[08:26:04] [PASSED] Can be interrupted, sleeps
[08:26:04] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[08:26:04] [PASSED] ttm_bo_reserve_locked_no_sleep
[08:26:04] [PASSED] ttm_bo_reserve_no_wait_ticket
[08:26:04] [PASSED] ttm_bo_reserve_double_resv
[08:26:04] [PASSED] ttm_bo_reserve_interrupted
[08:26:04] [PASSED] ttm_bo_reserve_deadlock
[08:26:04] [PASSED] ttm_bo_unreserve_basic
[08:26:04] [PASSED] ttm_bo_unreserve_pinned
[08:26:04] [PASSED] ttm_bo_unreserve_bulk
[08:26:04] [PASSED] ttm_bo_fini_basic
[08:26:04] [PASSED] ttm_bo_fini_shared_resv
[08:26:04] [PASSED] ttm_bo_pin_basic
[08:26:04] [PASSED] ttm_bo_pin_unpin_resource
[08:26:04] [PASSED] ttm_bo_multiple_pin_one_unpin
[08:26:04] ===================== [PASSED] ttm_bo ======================
[08:26:04] ============== ttm_bo_validate (21 subtests) ===============
[08:26:04] ============== ttm_bo_init_reserved_sys_man  ===============
[08:26:04] [PASSED] Buffer object for userspace
[08:26:04] [PASSED] Kernel buffer object
[08:26:04] [PASSED] Shared buffer object
[08:26:04] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[08:26:04] ============== ttm_bo_init_reserved_mock_man  ==============
[08:26:04] [PASSED] Buffer object for userspace
[08:26:04] [PASSED] Kernel buffer object
[08:26:04] [PASSED] Shared buffer object
[08:26:04] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[08:26:04] [PASSED] ttm_bo_init_reserved_resv
[08:26:04] ================== ttm_bo_validate_basic  ==================
[08:26:04] [PASSED] Buffer object for userspace
[08:26:04] [PASSED] Kernel buffer object
[08:26:04] [PASSED] Shared buffer object
[08:26:04] ============== [PASSED] ttm_bo_validate_basic ==============
[08:26:04] [PASSED] ttm_bo_validate_invalid_placement
[08:26:04] ============= ttm_bo_validate_same_placement  ==============
[08:26:04] [PASSED] System manager
[08:26:04] [PASSED] VRAM manager
[08:26:04] ========= [PASSED] ttm_bo_validate_same_placement ==========
[08:26:04] [PASSED] ttm_bo_validate_failed_alloc
[08:26:04] [PASSED] ttm_bo_validate_pinned
[08:26:04] [PASSED] ttm_bo_validate_busy_placement
[08:26:04] ================ ttm_bo_validate_multihop  =================
[08:26:04] [PASSED] Buffer object for userspace
[08:26:04] [PASSED] Kernel buffer object
[08:26:04] [PASSED] Shared buffer object
[08:26:04] ============ [PASSED] ttm_bo_validate_multihop =============
[08:26:04] ========== ttm_bo_validate_no_placement_signaled  ==========
[08:26:04] [PASSED] Buffer object in system domain, no page vector
[08:26:04] [PASSED] Buffer object in system domain with an existing page vector
[08:26:04] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[08:26:04] ======== ttm_bo_validate_no_placement_not_signaled  ========
[08:26:04] [PASSED] Buffer object for userspace
[08:26:04] [PASSED] Kernel buffer object
[08:26:04] [PASSED] Shared buffer object
[08:26:04] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[08:26:04] [PASSED] ttm_bo_validate_move_fence_signaled
[08:26:04] ========= ttm_bo_validate_move_fence_not_signaled  =========
[08:26:04] [PASSED] Waits for GPU
[08:26:04] [PASSED] Tries to lock straight away
[08:26:04] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[08:26:04] [PASSED] ttm_bo_validate_happy_evict
[08:26:04] [PASSED] ttm_bo_validate_all_pinned_evict
[08:26:04] [PASSED] ttm_bo_validate_allowed_only_evict
[08:26:04] [PASSED] ttm_bo_validate_deleted_evict
[08:26:04] [PASSED] ttm_bo_validate_busy_domain_evict
[08:26:04] [PASSED] ttm_bo_validate_evict_gutting
[08:26:04] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[08:26:04] ================= [PASSED] ttm_bo_validate =================
[08:26:04] ============================================================
[08:26:04] Testing complete. Ran 101 tests: passed: 101
[08:26:04] Elapsed time: 11.424s total, 1.666s configuring, 9.541s building, 0.177s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


