Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92D0D5C0C5
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 03:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A70710E612;
	Tue, 16 Dec 2025 03:21:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE1D10E60E;
 Tue, 16 Dec 2025 03:21:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe=5Fvm=3A_Implement_xe?=
 =?utf-8?q?=5Fvm=5Fget=5Fproperty=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 03:21:54 -0000
Message-ID: <176585531469.91565.8377039858475164500@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215230949.164845-7-jonathan.cavitt@intel.com>
In-Reply-To: <20251215230949.164845-7-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
URL   : https://patchwork.freedesktop.org/series/159054/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[03:20:36] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:20:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[03:21:12] Starting KUnit Kernel (1/1)...
[03:21:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:21:12] ================== guc_buf (11 subtests) ===================
[03:21:12] [PASSED] test_smallest
[03:21:12] [PASSED] test_largest
[03:21:12] [PASSED] test_granular
[03:21:12] [PASSED] test_unique
[03:21:12] [PASSED] test_overlap
[03:21:12] [PASSED] test_reusable
[03:21:12] [PASSED] test_too_big
[03:21:12] [PASSED] test_flush
[03:21:12] [PASSED] test_lookup
[03:21:12] [PASSED] test_data
[03:21:12] [PASSED] test_class
[03:21:12] ===================== [PASSED] guc_buf =====================
[03:21:12] =================== guc_dbm (7 subtests) ===================
[03:21:12] [PASSED] test_empty
[03:21:12] [PASSED] test_default
[03:21:12] ======================== test_size  ========================
[03:21:12] [PASSED] 4
[03:21:12] [PASSED] 8
[03:21:12] [PASSED] 32
[03:21:12] [PASSED] 256
[03:21:12] ==================== [PASSED] test_size ====================
[03:21:12] ======================= test_reuse  ========================
[03:21:12] [PASSED] 4
[03:21:12] [PASSED] 8
[03:21:12] [PASSED] 32
[03:21:12] [PASSED] 256
[03:21:12] =================== [PASSED] test_reuse ====================
[03:21:12] =================== test_range_overlap  ====================
[03:21:12] [PASSED] 4
[03:21:12] [PASSED] 8
[03:21:12] [PASSED] 32
[03:21:12] [PASSED] 256
[03:21:12] =============== [PASSED] test_range_overlap ================
[03:21:12] =================== test_range_compact  ====================
[03:21:12] [PASSED] 4
[03:21:12] [PASSED] 8
[03:21:12] [PASSED] 32
[03:21:12] [PASSED] 256
[03:21:12] =============== [PASSED] test_range_compact ================
[03:21:12] ==================== test_range_spare  =====================
[03:21:12] [PASSED] 4
[03:21:12] [PASSED] 8
[03:21:12] [PASSED] 32
[03:21:12] [PASSED] 256
[03:21:12] ================ [PASSED] test_range_spare =================
[03:21:12] ===================== [PASSED] guc_dbm =====================
[03:21:12] =================== guc_idm (6 subtests) ===================
[03:21:12] [PASSED] bad_init
[03:21:12] [PASSED] no_init
[03:21:12] [PASSED] init_fini
[03:21:12] [PASSED] check_used
[03:21:12] [PASSED] check_quota
[03:21:12] [PASSED] check_all
[03:21:12] ===================== [PASSED] guc_idm =====================
[03:21:12] ================== no_relay (3 subtests) ===================
[03:21:12] [PASSED] xe_drops_guc2pf_if_not_ready
[03:21:12] [PASSED] xe_drops_guc2vf_if_not_ready
[03:21:12] [PASSED] xe_rejects_send_if_not_ready
[03:21:12] ==================== [PASSED] no_relay =====================
[03:21:12] ================== pf_relay (14 subtests) ==================
[03:21:12] [PASSED] pf_rejects_guc2pf_too_short
[03:21:12] [PASSED] pf_rejects_guc2pf_too_long
[03:21:12] [PASSED] pf_rejects_guc2pf_no_payload
[03:21:12] [PASSED] pf_fails_no_payload
[03:21:12] [PASSED] pf_fails_bad_origin
[03:21:12] [PASSED] pf_fails_bad_type
[03:21:12] [PASSED] pf_txn_reports_error
[03:21:12] [PASSED] pf_txn_sends_pf2guc
[03:21:12] [PASSED] pf_sends_pf2guc
[03:21:12] [SKIPPED] pf_loopback_nop
[03:21:12] [SKIPPED] pf_loopback_echo
[03:21:12] [SKIPPED] pf_loopback_fail
[03:21:12] [SKIPPED] pf_loopback_busy
[03:21:12] [SKIPPED] pf_loopback_retry
[03:21:12] ==================== [PASSED] pf_relay =====================
[03:21:12] ================== vf_relay (3 subtests) ===================
[03:21:12] [PASSED] vf_rejects_guc2vf_too_short
[03:21:12] [PASSED] vf_rejects_guc2vf_too_long
[03:21:12] [PASSED] vf_rejects_guc2vf_no_payload
[03:21:12] ==================== [PASSED] vf_relay =====================
[03:21:12] ================ pf_gt_config (6 subtests) =================
[03:21:12] [PASSED] fair_contexts_1vf
[03:21:12] [PASSED] fair_doorbells_1vf
[03:21:12] [PASSED] fair_ggtt_1vf
[03:21:12] ====================== fair_contexts  ======================
[03:21:12] [PASSED] 1 VF
[03:21:12] [PASSED] 2 VFs
[03:21:12] [PASSED] 3 VFs
[03:21:12] [PASSED] 4 VFs
[03:21:12] [PASSED] 5 VFs
[03:21:12] [PASSED] 6 VFs
[03:21:12] [PASSED] 7 VFs
[03:21:12] [PASSED] 8 VFs
[03:21:12] [PASSED] 9 VFs
[03:21:12] [PASSED] 10 VFs
[03:21:12] [PASSED] 11 VFs
[03:21:12] [PASSED] 12 VFs
[03:21:12] [PASSED] 13 VFs
[03:21:12] [PASSED] 14 VFs
[03:21:12] [PASSED] 15 VFs
[03:21:12] [PASSED] 16 VFs
[03:21:12] [PASSED] 17 VFs
[03:21:12] [PASSED] 18 VFs
[03:21:12] [PASSED] 19 VFs
[03:21:12] [PASSED] 20 VFs
[03:21:12] [PASSED] 21 VFs
[03:21:12] [PASSED] 22 VFs
[03:21:12] [PASSED] 23 VFs
[03:21:12] [PASSED] 24 VFs
[03:21:12] [PASSED] 25 VFs
[03:21:12] [PASSED] 26 VFs
[03:21:12] [PASSED] 27 VFs
[03:21:12] [PASSED] 28 VFs
[03:21:12] [PASSED] 29 VFs
[03:21:12] [PASSED] 30 VFs
[03:21:12] [PASSED] 31 VFs
[03:21:12] [PASSED] 32 VFs
[03:21:12] [PASSED] 33 VFs
[03:21:12] [PASSED] 34 VFs
[03:21:12] [PASSED] 35 VFs
[03:21:12] [PASSED] 36 VFs
[03:21:12] [PASSED] 37 VFs
[03:21:12] [PASSED] 38 VFs
[03:21:12] [PASSED] 39 VFs
[03:21:12] [PASSED] 40 VFs
[03:21:12] [PASSED] 41 VFs
[03:21:12] [PASSED] 42 VFs
[03:21:12] [PASSED] 43 VFs
[03:21:12] [PASSED] 44 VFs
[03:21:13] [PASSED] 45 VFs
[03:21:13] [PASSED] 46 VFs
[03:21:13] [PASSED] 47 VFs
[03:21:13] [PASSED] 48 VFs
[03:21:13] [PASSED] 49 VFs
[03:21:13] [PASSED] 50 VFs
[03:21:13] [PASSED] 51 VFs
[03:21:13] [PASSED] 52 VFs
[03:21:13] [PASSED] 53 VFs
[03:21:13] [PASSED] 54 VFs
[03:21:13] [PASSED] 55 VFs
[03:21:13] [PASSED] 56 VFs
[03:21:13] [PASSED] 57 VFs
[03:21:13] [PASSED] 58 VFs
[03:21:13] [PASSED] 59 VFs
[03:21:13] [PASSED] 60 VFs
[03:21:13] [PASSED] 61 VFs
[03:21:13] [PASSED] 62 VFs
[03:21:13] [PASSED] 63 VFs
[03:21:13] ================== [PASSED] fair_contexts ==================
[03:21:13] ===================== fair_doorbells  ======================
[03:21:13] [PASSED] 1 VF
[03:21:13] [PASSED] 2 VFs
[03:21:13] [PASSED] 3 VFs
[03:21:13] [PASSED] 4 VFs
[03:21:13] [PASSED] 5 VFs
[03:21:13] [PASSED] 6 VFs
[03:21:13] [PASSED] 7 VFs
[03:21:13] [PASSED] 8 VFs
[03:21:13] [PASSED] 9 VFs
[03:21:13] [PASSED] 10 VFs
[03:21:13] [PASSED] 11 VFs
[03:21:13] [PASSED] 12 VFs
[03:21:13] [PASSED] 13 VFs
[03:21:13] [PASSED] 14 VFs
[03:21:13] [PASSED] 15 VFs
[03:21:13] [PASSED] 16 VFs
[03:21:13] [PASSED] 17 VFs
[03:21:13] [PASSED] 18 VFs
[03:21:13] [PASSED] 19 VFs
[03:21:13] [PASSED] 20 VFs
[03:21:13] [PASSED] 21 VFs
[03:21:13] [PASSED] 22 VFs
[03:21:13] [PASSED] 23 VFs
[03:21:13] [PASSED] 24 VFs
[03:21:13] [PASSED] 25 VFs
[03:21:13] [PASSED] 26 VFs
[03:21:13] [PASSED] 27 VFs
[03:21:13] [PASSED] 28 VFs
[03:21:13] [PASSED] 29 VFs
[03:21:13] [PASSED] 30 VFs
[03:21:13] [PASSED] 31 VFs
[03:21:13] [PASSED] 32 VFs
[03:21:13] [PASSED] 33 VFs
[03:21:13] [PASSED] 34 VFs
[03:21:13] [PASSED] 35 VFs
[03:21:13] [PASSED] 36 VFs
[03:21:13] [PASSED] 37 VFs
[03:21:13] [PASSED] 38 VFs
[03:21:13] [PASSED] 39 VFs
[03:21:13] [PASSED] 40 VFs
[03:21:13] [PASSED] 41 VFs
[03:21:13] [PASSED] 42 VFs
[03:21:13] [PASSED] 43 VFs
[03:21:13] [PASSED] 44 VFs
[03:21:13] [PASSED] 45 VFs
[03:21:13] [PASSED] 46 VFs
[03:21:13] [PASSED] 47 VFs
[03:21:13] [PASSED] 48 VFs
[03:21:13] [PASSED] 49 VFs
[03:21:13] [PASSED] 50 VFs
[03:21:13] [PASSED] 51 VFs
[03:21:13] [PASSED] 52 VFs
[03:21:13] [PASSED] 53 VFs
[03:21:13] [PASSED] 54 VFs
[03:21:13] [PASSED] 55 VFs
[03:21:13] [PASSED] 56 VFs
[03:21:13] [PASSED] 57 VFs
[03:21:13] [PASSED] 58 VFs
[03:21:13] [PASSED] 59 VFs
[03:21:13] [PASSED] 60 VFs
[03:21:13] [PASSED] 61 VFs
[03:21:13] [PASSED] 62 VFs
[03:21:13] [PASSED] 63 VFs
[03:21:13] ================= [PASSED] fair_doorbells ==================
[03:21:13] ======================== fair_ggtt  ========================
[03:21:13] [PASSED] 1 VF
[03:21:13] [PASSED] 2 VFs
[03:21:13] [PASSED] 3 VFs
[03:21:13] [PASSED] 4 VFs
[03:21:13] [PASSED] 5 VFs
[03:21:13] [PASSED] 6 VFs
[03:21:13] [PASSED] 7 VFs
[03:21:13] [PASSED] 8 VFs
[03:21:13] [PASSED] 9 VFs
[03:21:13] [PASSED] 10 VFs
[03:21:13] [PASSED] 11 VFs
[03:21:13] [PASSED] 12 VFs
[03:21:13] [PASSED] 13 VFs
[03:21:13] [PASSED] 14 VFs
[03:21:13] [PASSED] 15 VFs
[03:21:13] [PASSED] 16 VFs
[03:21:13] [PASSED] 17 VFs
[03:21:13] [PASSED] 18 VFs
[03:21:13] [PASSED] 19 VFs
[03:21:13] [PASSED] 20 VFs
[03:21:13] [PASSED] 21 VFs
[03:21:13] [PASSED] 22 VFs
[03:21:13] [PASSED] 23 VFs
[03:21:13] [PASSED] 24 VFs
[03:21:13] [PASSED] 25 VFs
[03:21:13] [PASSED] 26 VFs
[03:21:13] [PASSED] 27 VFs
[03:21:13] [PASSED] 28 VFs
[03:21:13] [PASSED] 29 VFs
[03:21:13] [PASSED] 30 VFs
[03:21:13] [PASSED] 31 VFs
[03:21:13] [PASSED] 32 VFs
[03:21:13] [PASSED] 33 VFs
[03:21:13] [PASSED] 34 VFs
[03:21:13] [PASSED] 35 VFs
[03:21:13] [PASSED] 36 VFs
[03:21:13] [PASSED] 37 VFs
[03:21:13] [PASSED] 38 VFs
[03:21:13] [PASSED] 39 VFs
[03:21:13] [PASSED] 40 VFs
[03:21:13] [PASSED] 41 VFs
[03:21:13] [PASSED] 42 VFs
[03:21:13] [PASSED] 43 VFs
[03:21:13] [PASSED] 44 VFs
[03:21:13] [PASSED] 45 VFs
[03:21:13] [PASSED] 46 VFs
[03:21:13] [PASSED] 47 VFs
[03:21:13] [PASSED] 48 VFs
[03:21:13] [PASSED] 49 VFs
[03:21:13] [PASSED] 50 VFs
[03:21:13] [PASSED] 51 VFs
[03:21:13] [PASSED] 52 VFs
[03:21:13] [PASSED] 53 VFs
[03:21:13] [PASSED] 54 VFs
[03:21:13] [PASSED] 55 VFs
[03:21:13] [PASSED] 56 VFs
[03:21:13] [PASSED] 57 VFs
[03:21:13] [PASSED] 58 VFs
[03:21:13] [PASSED] 59 VFs
[03:21:13] [PASSED] 60 VFs
[03:21:13] [PASSED] 61 VFs
[03:21:13] [PASSED] 62 VFs
[03:21:13] [PASSED] 63 VFs
[03:21:13] ==================== [PASSED] fair_ggtt ====================
[03:21:13] ================== [PASSED] pf_gt_config ===================
[03:21:13] ===================== lmtt (1 subtest) =====================
[03:21:13] ======================== test_ops  =========================
[03:21:13] [PASSED] 2-level
[03:21:13] [PASSED] multi-level
[03:21:13] ==================== [PASSED] test_ops =====================
[03:21:13] ====================== [PASSED] lmtt =======================
[03:21:13] ================= pf_service (11 subtests) =================
[03:21:13] [PASSED] pf_negotiate_any
[03:21:13] [PASSED] pf_negotiate_base_match
[03:21:13] [PASSED] pf_negotiate_base_newer
[03:21:13] [PASSED] pf_negotiate_base_next
[03:21:13] [SKIPPED] pf_negotiate_base_older
[03:21:13] [PASSED] pf_negotiate_base_prev
[03:21:13] [PASSED] pf_negotiate_latest_match
[03:21:13] [PASSED] pf_negotiate_latest_newer
[03:21:13] [PASSED] pf_negotiate_latest_next
[03:21:13] [SKIPPED] pf_negotiate_latest_older
[03:21:13] [SKIPPED] pf_negotiate_latest_prev
[03:21:13] =================== [PASSED] pf_service ====================
[03:21:13] ================= xe_guc_g2g (2 subtests) ==================
[03:21:13] ============== xe_live_guc_g2g_kunit_default  ==============
[03:21:13] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[03:21:13] ============== xe_live_guc_g2g_kunit_allmem  ===============
[03:21:13] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[03:21:13] =================== [SKIPPED] xe_guc_g2g ===================
[03:21:13] =================== xe_mocs (2 subtests) ===================
[03:21:13] ================ xe_live_mocs_kernel_kunit  ================
[03:21:13] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[03:21:13] ================ xe_live_mocs_reset_kunit  =================
[03:21:13] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[03:21:13] ==================== [SKIPPED] xe_mocs =====================
[03:21:13] ================= xe_migrate (2 subtests) ==================
[03:21:13] ================= xe_migrate_sanity_kunit  =================
[03:21:13] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[03:21:13] ================== xe_validate_ccs_kunit  ==================
[03:21:13] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[03:21:13] =================== [SKIPPED] xe_migrate ===================
[03:21:13] ================== xe_dma_buf (1 subtest) ==================
[03:21:13] ==================== xe_dma_buf_kunit  =====================
[03:21:13] ================ [SKIPPED] xe_dma_buf_kunit ================
[03:21:13] =================== [SKIPPED] xe_dma_buf ===================
[03:21:13] ================= xe_bo_shrink (1 subtest) =================
[03:21:13] =================== xe_bo_shrink_kunit  ====================
[03:21:13] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[03:21:13] ================== [SKIPPED] xe_bo_shrink ==================
[03:21:13] ==================== xe_bo (2 subtests) ====================
[03:21:13] ================== xe_ccs_migrate_kunit  ===================
[03:21:13] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[03:21:13] ==================== xe_bo_evict_kunit  ====================
[03:21:13] =============== [SKIPPED] xe_bo_evict_kunit ================
[03:21:13] ===================== [SKIPPED] xe_bo ======================
[03:21:13] ==================== args (11 subtests) ====================
[03:21:13] [PASSED] count_args_test
[03:21:13] [PASSED] call_args_example
[03:21:13] [PASSED] call_args_test
[03:21:13] [PASSED] drop_first_arg_example
[03:21:13] [PASSED] drop_first_arg_test
[03:21:13] [PASSED] first_arg_example
[03:21:13] [PASSED] first_arg_test
[03:21:13] [PASSED] last_arg_example
[03:21:13] [PASSED] last_arg_test
[03:21:13] [PASSED] pick_arg_example
[03:21:13] [PASSED] sep_comma_example
[03:21:13] ====================== [PASSED] args =======================
[03:21:13] =================== xe_pci (3 subtests) ====================
[03:21:13] ==================== check_graphics_ip  ====================
[03:21:13] [PASSED] 12.00 Xe_LP
[03:21:13] [PASSED] 12.10 Xe_LP+
[03:21:13] [PASSED] 12.55 Xe_HPG
[03:21:13] [PASSED] 12.60 Xe_HPC
[03:21:13] [PASSED] 12.70 Xe_LPG
[03:21:13] [PASSED] 12.71 Xe_LPG
[03:21:13] [PASSED] 12.74 Xe_LPG+
[03:21:13] [PASSED] 20.01 Xe2_HPG
[03:21:13] [PASSED] 20.02 Xe2_HPG
[03:21:13] [PASSED] 20.04 Xe2_LPG
[03:21:13] [PASSED] 30.00 Xe3_LPG
[03:21:13] [PASSED] 30.01 Xe3_LPG
[03:21:13] [PASSED] 30.03 Xe3_LPG
[03:21:13] [PASSED] 30.04 Xe3_LPG
[03:21:13] [PASSED] 30.05 Xe3_LPG
[03:21:13] [PASSED] 35.11 Xe3p_XPC
[03:21:13] ================ [PASSED] check_graphics_ip ================
[03:21:13] ===================== check_media_ip  ======================
[03:21:13] [PASSED] 12.00 Xe_M
[03:21:13] [PASSED] 12.55 Xe_HPM
[03:21:13] [PASSED] 13.00 Xe_LPM+
[03:21:13] [PASSED] 13.01 Xe2_HPM
[03:21:13] [PASSED] 20.00 Xe2_LPM
[03:21:13] [PASSED] 30.00 Xe3_LPM
[03:21:13] [PASSED] 30.02 Xe3_LPM
[03:21:13] [PASSED] 35.00 Xe3p_LPM
[03:21:13] [PASSED] 35.03 Xe3p_HPM
[03:21:13] ================= [PASSED] check_media_ip ==================
[03:21:13] =================== check_platform_desc  ===================
[03:21:13] [PASSED] 0x9A60 (TIGERLAKE)
[03:21:13] [PASSED] 0x9A68 (TIGERLAKE)
[03:21:13] [PASSED] 0x9A70 (TIGERLAKE)
[03:21:13] [PASSED] 0x9A40 (TIGERLAKE)
[03:21:13] [PASSED] 0x9A49 (TIGERLAKE)
[03:21:13] [PASSED] 0x9A59 (TIGERLAKE)
[03:21:13] [PASSED] 0x9A78 (TIGERLAKE)
[03:21:13] [PASSED] 0x9AC0 (TIGERLAKE)
[03:21:13] [PASSED] 0x9AC9 (TIGERLAKE)
[03:21:13] [PASSED] 0x9AD9 (TIGERLAKE)
[03:21:13] [PASSED] 0x9AF8 (TIGERLAKE)
[03:21:13] [PASSED] 0x4C80 (ROCKETLAKE)
[03:21:13] [PASSED] 0x4C8A (ROCKETLAKE)
[03:21:13] [PASSED] 0x4C8B (ROCKETLAKE)
[03:21:13] [PASSED] 0x4C8C (ROCKETLAKE)
[03:21:13] [PASSED] 0x4C90 (ROCKETLAKE)
[03:21:13] [PASSED] 0x4C9A (ROCKETLAKE)
[03:21:13] [PASSED] 0x4680 (ALDERLAKE_S)
[03:21:13] [PASSED] 0x4682 (ALDERLAKE_S)
[03:21:13] [PASSED] 0x4688 (ALDERLAKE_S)
[03:21:13] [PASSED] 0x468A (ALDERLAKE_S)
[03:21:13] [PASSED] 0x468B (ALDERLAKE_S)
[03:21:13] [PASSED] 0x4690 (ALDERLAKE_S)
[03:21:13] [PASSED] 0x4692 (ALDERLAKE_S)
[03:21:13] [PASSED] 0x4693 (ALDERLAKE_S)
[03:21:13] [PASSED] 0x46A0 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46A1 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46A2 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46A3 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46A6 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46A8 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46AA (ALDERLAKE_P)
[03:21:13] [PASSED] 0x462A (ALDERLAKE_P)
[03:21:13] [PASSED] 0x4626 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x4628 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46B0 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[03:21:13] [PASSED] 0x46B1 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46B2 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46B3 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46C0 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46C1 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46C2 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46C3 (ALDERLAKE_P)
[03:21:13] [PASSED] 0x46D0 (ALDERLAKE_N)
[03:21:13] [PASSED] 0x46D1 (ALDERLAKE_N)
[03:21:13] [PASSED] 0x46D2 (ALDERLAKE_N)
[03:21:13] [PASSED] 0x46D3 (ALDERLAKE_N)
[03:21:13] [PASSED] 0x46D4 (ALDERLAKE_N)
[03:21:13] [PASSED] 0xA721 (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7A1 (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7A9 (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7AC (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7AD (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA720 (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7A0 (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7A8 (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7AA (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA7AB (ALDERLAKE_P)
[03:21:13] [PASSED] 0xA780 (ALDERLAKE_S)
[03:21:13] [PASSED] 0xA781 (ALDERLAKE_S)
[03:21:13] [PASSED] 0xA782 (ALDERLAKE_S)
[03:21:13] [PASSED] 0xA783 (ALDERLAKE_S)
[03:21:13] [PASSED] 0xA788 (ALDERLAKE_S)
[03:21:13] [PASSED] 0xA789 (ALDERLAKE_S)
[03:21:13] [PASSED] 0xA78A (ALDERLAKE_S)
[03:21:13] [PASSED] 0xA78B (ALDERLAKE_S)
[03:21:13] [PASSED] 0x4905 (DG1)
[03:21:13] [PASSED] 0x4906 (DG1)
[03:21:13] [PASSED] 0x4907 (DG1)
[03:21:13] [PASSED] 0x4908 (DG1)
[03:21:13] [PASSED] 0x4909 (DG1)
[03:21:13] [PASSED] 0x56C0 (DG2)
[03:21:13] [PASSED] 0x56C2 (DG2)
[03:21:13] [PASSED] 0x56C1 (DG2)
[03:21:13] [PASSED] 0x7D51 (METEORLAKE)
[03:21:13] [PASSED] 0x7DD1 (METEORLAKE)
[03:21:13] [PASSED] 0x7D41 (METEORLAKE)
[03:21:13] [PASSED] 0x7D67 (METEORLAKE)
[03:21:13] [PASSED] 0xB640 (METEORLAKE)
[03:21:13] [PASSED] 0x56A0 (DG2)
[03:21:13] [PASSED] 0x56A1 (DG2)
[03:21:13] [PASSED] 0x56A2 (DG2)
[03:21:13] [PASSED] 0x56BE (DG2)
[03:21:13] [PASSED] 0x56BF (DG2)
[03:21:13] [PASSED] 0x5690 (DG2)
[03:21:13] [PASSED] 0x5691 (DG2)
[03:21:13] [PASSED] 0x5692 (DG2)
[03:21:13] [PASSED] 0x56A5 (DG2)
[03:21:13] [PASSED] 0x56A6 (DG2)
[03:21:13] [PASSED] 0x56B0 (DG2)
[03:21:13] [PASSED] 0x56B1 (DG2)
[03:21:13] [PASSED] 0x56BA (DG2)
[03:21:13] [PASSED] 0x56BB (DG2)
[03:21:13] [PASSED] 0x56BC (DG2)
[03:21:13] [PASSED] 0x56BD (DG2)
[03:21:13] [PASSED] 0x5693 (DG2)
[03:21:13] [PASSED] 0x5694 (DG2)
[03:21:13] [PASSED] 0x5695 (DG2)
[03:21:13] [PASSED] 0x56A3 (DG2)
[03:21:13] [PASSED] 0x56A4 (DG2)
[03:21:13] [PASSED] 0x56B2 (DG2)
[03:21:13] [PASSED] 0x56B3 (DG2)
[03:21:13] [PASSED] 0x5696 (DG2)
[03:21:13] [PASSED] 0x5697 (DG2)
[03:21:13] [PASSED] 0xB69 (PVC)
[03:21:13] [PASSED] 0xB6E (PVC)
[03:21:13] [PASSED] 0xBD4 (PVC)
[03:21:13] [PASSED] 0xBD5 (PVC)
[03:21:13] [PASSED] 0xBD6 (PVC)
[03:21:13] [PASSED] 0xBD7 (PVC)
[03:21:13] [PASSED] 0xBD8 (PVC)
[03:21:13] [PASSED] 0xBD9 (PVC)
[03:21:13] [PASSED] 0xBDA (PVC)
[03:21:13] [PASSED] 0xBDB (PVC)
[03:21:13] [PASSED] 0xBE0 (PVC)
[03:21:13] [PASSED] 0xBE1 (PVC)
[03:21:13] [PASSED] 0xBE5 (PVC)
[03:21:13] [PASSED] 0x7D40 (METEORLAKE)
[03:21:13] [PASSED] 0x7D45 (METEORLAKE)
[03:21:13] [PASSED] 0x7D55 (METEORLAKE)
[03:21:13] [PASSED] 0x7D60 (METEORLAKE)
[03:21:13] [PASSED] 0x7DD5 (METEORLAKE)
[03:21:13] [PASSED] 0x6420 (LUNARLAKE)
[03:21:13] [PASSED] 0x64A0 (LUNARLAKE)
[03:21:13] [PASSED] 0x64B0 (LUNARLAKE)
[03:21:13] [PASSED] 0xE202 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE209 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE20B (BATTLEMAGE)
[03:21:13] [PASSED] 0xE20C (BATTLEMAGE)
[03:21:13] [PASSED] 0xE20D (BATTLEMAGE)
[03:21:13] [PASSED] 0xE210 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE211 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE212 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE216 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE220 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE221 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE222 (BATTLEMAGE)
[03:21:13] [PASSED] 0xE223 (BATTLEMAGE)
[03:21:13] [PASSED] 0xB080 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB081 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB082 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB083 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB084 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB085 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB086 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB087 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB08F (PANTHERLAKE)
[03:21:13] [PASSED] 0xB090 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB0A0 (PANTHERLAKE)
[03:21:13] [PASSED] 0xB0B0 (PANTHERLAKE)
[03:21:13] [PASSED] 0xFD80 (PANTHERLAKE)
[03:21:13] [PASSED] 0xFD81 (PANTHERLAKE)
[03:21:13] [PASSED] 0xD740 (NOVALAKE_S)
[03:21:13] [PASSED] 0xD741 (NOVALAKE_S)
[03:21:13] [PASSED] 0xD742 (NOVALAKE_S)
[03:21:13] [PASSED] 0xD743 (NOVALAKE_S)
[03:21:13] [PASSED] 0xD744 (NOVALAKE_S)
[03:21:13] [PASSED] 0xD745 (NOVALAKE_S)
[03:21:13] [PASSED] 0x674C (CRESCENTISLAND)
[03:21:13] =============== [PASSED] check_platform_desc ===============
[03:21:13] ===================== [PASSED] xe_pci ======================
[03:21:13] =================== xe_rtp (2 subtests) ====================
[03:21:13] =============== xe_rtp_process_to_sr_tests  ================
[03:21:13] [PASSED] coalesce-same-reg
[03:21:13] [PASSED] no-match-no-add
[03:21:13] [PASSED] match-or
[03:21:13] [PASSED] match-or-xfail
[03:21:13] [PASSED] no-match-no-add-multiple-rules
[03:21:13] [PASSED] two-regs-two-entries
[03:21:13] [PASSED] clr-one-set-other
[03:21:13] [PASSED] set-field
[03:21:13] [PASSED] conflict-duplicate
[03:21:13] [PASSED] conflict-not-disjoint
[03:21:13] [PASSED] conflict-reg-type
[03:21:13] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[03:21:13] ================== xe_rtp_process_tests  ===================
[03:21:13] [PASSED] active1
[03:21:13] [PASSED] active2
[03:21:13] [PASSED] active-inactive
[03:21:13] [PASSED] inactive-active
[03:21:13] [PASSED] inactive-1st_or_active-inactive
[03:21:13] [PASSED] inactive-2nd_or_active-inactive
[03:21:13] [PASSED] inactive-last_or_active-inactive
[03:21:13] [PASSED] inactive-no_or_active-inactive
[03:21:13] ============== [PASSED] xe_rtp_process_tests ===============
[03:21:13] ===================== [PASSED] xe_rtp ======================
[03:21:13] ==================== xe_wa (1 subtest) =====================
[03:21:13] ======================== xe_wa_gt  =========================
[03:21:13] [PASSED] TIGERLAKE B0
[03:21:13] [PASSED] DG1 A0
[03:21:13] [PASSED] DG1 B0
[03:21:13] [PASSED] ALDERLAKE_S A0
[03:21:13] [PASSED] ALDERLAKE_S B0
[03:21:13] [PASSED] ALDERLAKE_S C0
[03:21:13] [PASSED] ALDERLAKE_S D0
[03:21:13] [PASSED] ALDERLAKE_P A0
[03:21:13] [PASSED] ALDERLAKE_P B0
[03:21:13] [PASSED] ALDERLAKE_P C0
[03:21:13] [PASSED] ALDERLAKE_S RPLS D0
[03:21:13] [PASSED] ALDERLAKE_P RPLU E0
[03:21:13] [PASSED] DG2 G10 C0
[03:21:13] [PASSED] DG2 G11 B1
[03:21:13] [PASSED] DG2 G12 A1
[03:21:13] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[03:21:13] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[03:21:13] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[03:21:13] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[03:21:13] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[03:21:13] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[03:21:13] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[03:21:13] ==================== [PASSED] xe_wa_gt =====================
[03:21:13] ====================== [PASSED] xe_wa ======================
[03:21:13] ============================================================
[03:21:13] Testing complete. Ran 510 tests: passed: 492, skipped: 18
[03:21:13] Elapsed time: 36.245s total, 4.215s configuring, 31.513s building, 0.467s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[03:21:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:21:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[03:21:40] Starting KUnit Kernel (1/1)...
[03:21:40] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:21:40] ============ drm_test_pick_cmdline (2 subtests) ============
[03:21:40] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[03:21:40] =============== drm_test_pick_cmdline_named  ===============
[03:21:40] [PASSED] NTSC
[03:21:40] [PASSED] NTSC-J
[03:21:40] [PASSED] PAL
[03:21:40] [PASSED] PAL-M
[03:21:40] =========== [PASSED] drm_test_pick_cmdline_named ===========
[03:21:40] ============== [PASSED] drm_test_pick_cmdline ==============
[03:21:40] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[03:21:40] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[03:21:40] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[03:21:40] =========== drm_validate_clone_mode (2 subtests) ===========
[03:21:40] ============== drm_test_check_in_clone_mode  ===============
[03:21:40] [PASSED] in_clone_mode
[03:21:40] [PASSED] not_in_clone_mode
[03:21:40] ========== [PASSED] drm_test_check_in_clone_mode ===========
[03:21:40] =============== drm_test_check_valid_clones  ===============
[03:21:40] [PASSED] not_in_clone_mode
[03:21:40] [PASSED] valid_clone
[03:21:40] [PASSED] invalid_clone
[03:21:40] =========== [PASSED] drm_test_check_valid_clones ===========
[03:21:40] ============= [PASSED] drm_validate_clone_mode =============
[03:21:40] ============= drm_validate_modeset (1 subtest) =============
[03:21:40] [PASSED] drm_test_check_connector_changed_modeset
[03:21:40] ============== [PASSED] drm_validate_modeset ===============
[03:21:40] ====== drm_test_bridge_get_current_state (2 subtests) ======
[03:21:40] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[03:21:40] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[03:21:40] ======== [PASSED] drm_test_bridge_get_current_state ========
[03:21:40] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[03:21:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[03:21:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[03:21:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[03:21:40] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[03:21:40] ============== drm_bridge_alloc (2 subtests) ===============
[03:21:40] [PASSED] drm_test_drm_bridge_alloc_basic
[03:21:40] [PASSED] drm_test_drm_bridge_alloc_get_put
[03:21:40] ================ [PASSED] drm_bridge_alloc =================
[03:21:40] ================== drm_buddy (8 subtests) ==================
[03:21:40] [PASSED] drm_test_buddy_alloc_limit
[03:21:40] [PASSED] drm_test_buddy_alloc_optimistic
[03:21:40] [PASSED] drm_test_buddy_alloc_pessimistic
[03:21:40] [PASSED] drm_test_buddy_alloc_pathological
[03:21:40] [PASSED] drm_test_buddy_alloc_contiguous
[03:21:40] [PASSED] drm_test_buddy_alloc_clear
[03:21:40] [PASSED] drm_test_buddy_alloc_range_bias
[03:21:40] [PASSED] drm_test_buddy_fragmentation_performance
[03:21:40] ==================== [PASSED] drm_buddy ====================
[03:21:40] ============= drm_cmdline_parser (40 subtests) =============
[03:21:40] [PASSED] drm_test_cmdline_force_d_only
[03:21:40] [PASSED] drm_test_cmdline_force_D_only_dvi
[03:21:40] [PASSED] drm_test_cmdline_force_D_only_hdmi
[03:21:40] [PASSED] drm_test_cmdline_force_D_only_not_digital
[03:21:40] [PASSED] drm_test_cmdline_force_e_only
[03:21:40] [PASSED] drm_test_cmdline_res
[03:21:40] [PASSED] drm_test_cmdline_res_vesa
[03:21:40] [PASSED] drm_test_cmdline_res_vesa_rblank
[03:21:40] [PASSED] drm_test_cmdline_res_rblank
[03:21:40] [PASSED] drm_test_cmdline_res_bpp
[03:21:40] [PASSED] drm_test_cmdline_res_refresh
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[03:21:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[03:21:40] [PASSED] drm_test_cmdline_res_margins_force_on
[03:21:40] [PASSED] drm_test_cmdline_res_vesa_margins
[03:21:40] [PASSED] drm_test_cmdline_name
[03:21:40] [PASSED] drm_test_cmdline_name_bpp
[03:21:40] [PASSED] drm_test_cmdline_name_option
[03:21:40] [PASSED] drm_test_cmdline_name_bpp_option
[03:21:40] [PASSED] drm_test_cmdline_rotate_0
[03:21:40] [PASSED] drm_test_cmdline_rotate_90
[03:21:40] [PASSED] drm_test_cmdline_rotate_180
[03:21:40] [PASSED] drm_test_cmdline_rotate_270
[03:21:40] [PASSED] drm_test_cmdline_hmirror
[03:21:40] [PASSED] drm_test_cmdline_vmirror
[03:21:40] [PASSED] drm_test_cmdline_margin_options
[03:21:40] [PASSED] drm_test_cmdline_multiple_options
[03:21:40] [PASSED] drm_test_cmdline_bpp_extra_and_option
[03:21:40] [PASSED] drm_test_cmdline_extra_and_option
[03:21:40] [PASSED] drm_test_cmdline_freestanding_options
[03:21:40] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[03:21:40] [PASSED] drm_test_cmdline_panel_orientation
[03:21:40] ================ drm_test_cmdline_invalid  =================
[03:21:40] [PASSED] margin_only
[03:21:40] [PASSED] interlace_only
[03:21:40] [PASSED] res_missing_x
[03:21:40] [PASSED] res_missing_y
[03:21:40] [PASSED] res_bad_y
[03:21:40] [PASSED] res_missing_y_bpp
[03:21:40] [PASSED] res_bad_bpp
[03:21:40] [PASSED] res_bad_refresh
[03:21:40] [PASSED] res_bpp_refresh_force_on_off
[03:21:40] [PASSED] res_invalid_mode
[03:21:40] [PASSED] res_bpp_wrong_place_mode
[03:21:40] [PASSED] name_bpp_refresh
[03:21:40] [PASSED] name_refresh
[03:21:40] [PASSED] name_refresh_wrong_mode
[03:21:40] [PASSED] name_refresh_invalid_mode
[03:21:40] [PASSED] rotate_multiple
[03:21:40] [PASSED] rotate_invalid_val
[03:21:40] [PASSED] rotate_truncated
[03:21:40] [PASSED] invalid_option
[03:21:40] [PASSED] invalid_tv_option
[03:21:40] [PASSED] truncated_tv_option
[03:21:40] ============ [PASSED] drm_test_cmdline_invalid =============
[03:21:40] =============== drm_test_cmdline_tv_options  ===============
[03:21:40] [PASSED] NTSC
[03:21:40] [PASSED] NTSC_443
[03:21:40] [PASSED] NTSC_J
[03:21:40] [PASSED] PAL
[03:21:40] [PASSED] PAL_M
[03:21:40] [PASSED] PAL_N
[03:21:40] [PASSED] SECAM
[03:21:40] [PASSED] MONO_525
[03:21:40] [PASSED] MONO_625
[03:21:40] =========== [PASSED] drm_test_cmdline_tv_options ===========
[03:21:40] =============== [PASSED] drm_cmdline_parser ================
[03:21:40] ========== drmm_connector_hdmi_init (20 subtests) ==========
[03:21:40] [PASSED] drm_test_connector_hdmi_init_valid
[03:21:40] [PASSED] drm_test_connector_hdmi_init_bpc_8
[03:21:40] [PASSED] drm_test_connector_hdmi_init_bpc_10
[03:21:40] [PASSED] drm_test_connector_hdmi_init_bpc_12
[03:21:40] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[03:21:40] [PASSED] drm_test_connector_hdmi_init_bpc_null
[03:21:40] [PASSED] drm_test_connector_hdmi_init_formats_empty
[03:21:40] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[03:21:40] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[03:21:40] [PASSED] supported_formats=0x9 yuv420_allowed=1
[03:21:40] [PASSED] supported_formats=0x9 yuv420_allowed=0
[03:21:40] [PASSED] supported_formats=0x3 yuv420_allowed=1
[03:21:40] [PASSED] supported_formats=0x3 yuv420_allowed=0
[03:21:40] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[03:21:40] [PASSED] drm_test_connector_hdmi_init_null_ddc
[03:21:40] [PASSED] drm_test_connector_hdmi_init_null_product
[03:21:40] [PASSED] drm_test_connector_hdmi_init_null_vendor
[03:21:40] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[03:21:40] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[03:21:40] [PASSED] drm_test_connector_hdmi_init_product_valid
[03:21:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[03:21:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[03:21:40] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[03:21:40] ========= drm_test_connector_hdmi_init_type_valid  =========
[03:21:40] [PASSED] HDMI-A
[03:21:40] [PASSED] HDMI-B
[03:21:40] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[03:21:40] ======== drm_test_connector_hdmi_init_type_invalid  ========
[03:21:40] [PASSED] Unknown
[03:21:40] [PASSED] VGA
[03:21:40] [PASSED] DVI-I
[03:21:40] [PASSED] DVI-D
[03:21:40] [PASSED] DVI-A
[03:21:40] [PASSED] Composite
[03:21:40] [PASSED] SVIDEO
[03:21:40] [PASSED] LVDS
[03:21:40] [PASSED] Component
[03:21:40] [PASSED] DIN
[03:21:40] [PASSED] DP
[03:21:40] [PASSED] TV
[03:21:40] [PASSED] eDP
[03:21:40] [PASSED] Virtual
[03:21:40] [PASSED] DSI
[03:21:40] [PASSED] DPI
[03:21:40] [PASSED] Writeback
[03:21:40] [PASSED] SPI
[03:21:40] [PASSED] USB
[03:21:40] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[03:21:40] ============ [PASSED] drmm_connector_hdmi_init =============
[03:21:40] ============= drmm_connector_init (3 subtests) =============
[03:21:40] [PASSED] drm_test_drmm_connector_init
[03:21:40] [PASSED] drm_test_drmm_connector_init_null_ddc
[03:21:40] ========= drm_test_drmm_connector_init_type_valid  =========
[03:21:40] [PASSED] Unknown
[03:21:40] [PASSED] VGA
[03:21:40] [PASSED] DVI-I
[03:21:40] [PASSED] DVI-D
[03:21:40] [PASSED] DVI-A
[03:21:40] [PASSED] Composite
[03:21:40] [PASSED] SVIDEO
[03:21:40] [PASSED] LVDS
[03:21:40] [PASSED] Component
[03:21:40] [PASSED] DIN
[03:21:40] [PASSED] DP
[03:21:40] [PASSED] HDMI-A
[03:21:40] [PASSED] HDMI-B
[03:21:40] [PASSED] TV
[03:21:40] [PASSED] eDP
[03:21:40] [PASSED] Virtual
[03:21:40] [PASSED] DSI
[03:21:40] [PASSED] DPI
[03:21:40] [PASSED] Writeback
[03:21:40] [PASSED] SPI
[03:21:40] [PASSED] USB
[03:21:40] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[03:21:40] =============== [PASSED] drmm_connector_init ===============
[03:21:40] ========= drm_connector_dynamic_init (6 subtests) ==========
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_init
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_init_properties
[03:21:40] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[03:21:40] [PASSED] Unknown
[03:21:40] [PASSED] VGA
[03:21:40] [PASSED] DVI-I
[03:21:40] [PASSED] DVI-D
[03:21:40] [PASSED] DVI-A
[03:21:40] [PASSED] Composite
[03:21:40] [PASSED] SVIDEO
[03:21:40] [PASSED] LVDS
[03:21:40] [PASSED] Component
[03:21:40] [PASSED] DIN
[03:21:40] [PASSED] DP
[03:21:40] [PASSED] HDMI-A
[03:21:40] [PASSED] HDMI-B
[03:21:40] [PASSED] TV
[03:21:40] [PASSED] eDP
[03:21:40] [PASSED] Virtual
[03:21:40] [PASSED] DSI
[03:21:40] [PASSED] DPI
[03:21:40] [PASSED] Writeback
[03:21:40] [PASSED] SPI
[03:21:40] [PASSED] USB
[03:21:40] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[03:21:40] ======== drm_test_drm_connector_dynamic_init_name  =========
[03:21:40] [PASSED] Unknown
[03:21:40] [PASSED] VGA
[03:21:40] [PASSED] DVI-I
[03:21:40] [PASSED] DVI-D
[03:21:40] [PASSED] DVI-A
[03:21:40] [PASSED] Composite
[03:21:40] [PASSED] SVIDEO
[03:21:40] [PASSED] LVDS
[03:21:40] [PASSED] Component
[03:21:40] [PASSED] DIN
[03:21:40] [PASSED] DP
[03:21:40] [PASSED] HDMI-A
[03:21:40] [PASSED] HDMI-B
[03:21:40] [PASSED] TV
[03:21:40] [PASSED] eDP
[03:21:40] [PASSED] Virtual
[03:21:40] [PASSED] DSI
[03:21:40] [PASSED] DPI
[03:21:40] [PASSED] Writeback
[03:21:40] [PASSED] SPI
[03:21:40] [PASSED] USB
[03:21:40] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[03:21:40] =========== [PASSED] drm_connector_dynamic_init ============
[03:21:40] ==== drm_connector_dynamic_register_early (4 subtests) =====
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[03:21:40] ====== [PASSED] drm_connector_dynamic_register_early =======
[03:21:40] ======= drm_connector_dynamic_register (7 subtests) ========
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[03:21:40] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[03:21:40] ========= [PASSED] drm_connector_dynamic_register ==========
[03:21:40] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[03:21:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[03:21:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[03:21:40] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[03:21:40] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[03:21:40] ========== drm_test_get_tv_mode_from_name_valid  ===========
[03:21:40] [PASSED] NTSC
[03:21:40] [PASSED] NTSC-443
[03:21:40] [PASSED] NTSC-J
[03:21:40] [PASSED] PAL
[03:21:40] [PASSED] PAL-M
[03:21:40] [PASSED] PAL-N
[03:21:40] [PASSED] SECAM
[03:21:40] [PASSED] Mono
[03:21:40] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[03:21:40] [PASSED] drm_test_get_tv_mode_from_name_truncated
[03:21:40] ============ [PASSED] drm_get_tv_mode_from_name ============
[03:21:40] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[03:21:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[03:21:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[03:21:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[03:21:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[03:21:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[03:21:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[03:21:40] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[03:21:40] [PASSED] VIC 96
[03:21:40] [PASSED] VIC 97
[03:21:40] [PASSED] VIC 101
[03:21:40] [PASSED] VIC 102
[03:21:40] [PASSED] VIC 106
[03:21:40] [PASSED] VIC 107
[03:21:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[03:21:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[03:21:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[03:21:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[03:21:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[03:21:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[03:21:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[03:21:40] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[03:21:40] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[03:21:40] [PASSED] Automatic
[03:21:40] [PASSED] Full
[03:21:40] [PASSED] Limited 16:235
[03:21:40] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[03:21:40] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[03:21:40] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[03:21:40] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[03:21:40] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[03:21:40] [PASSED] RGB
[03:21:40] [PASSED] YUV 4:2:0
[03:21:40] [PASSED] YUV 4:2:2
[03:21:40] [PASSED] YUV 4:4:4
[03:21:40] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[03:21:40] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[03:21:40] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[03:21:40] ============= drm_damage_helper (21 subtests) ==============
[03:21:40] [PASSED] drm_test_damage_iter_no_damage
[03:21:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[03:21:40] [PASSED] drm_test_damage_iter_no_damage_src_moved
[03:21:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[03:21:40] [PASSED] drm_test_damage_iter_no_damage_not_visible
[03:21:40] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[03:21:40] [PASSED] drm_test_damage_iter_no_damage_no_fb
[03:21:40] [PASSED] drm_test_damage_iter_simple_damage
[03:21:40] [PASSED] drm_test_damage_iter_single_damage
[03:21:40] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[03:21:40] [PASSED] drm_test_damage_iter_single_damage_outside_src
[03:21:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[03:21:40] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[03:21:40] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[03:21:40] [PASSED] drm_test_damage_iter_single_damage_src_moved
[03:21:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[03:21:40] [PASSED] drm_test_damage_iter_damage
[03:21:40] [PASSED] drm_test_damage_iter_damage_one_intersect
[03:21:40] [PASSED] drm_test_damage_iter_damage_one_outside
[03:21:40] [PASSED] drm_test_damage_iter_damage_src_moved
[03:21:40] [PASSED] drm_test_damage_iter_damage_not_visible
[03:21:40] ================ [PASSED] drm_damage_helper ================
[03:21:40] ============== drm_dp_mst_helper (3 subtests) ==============
[03:21:40] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[03:21:40] [PASSED] Clock 154000 BPP 30 DSC disabled
[03:21:40] [PASSED] Clock 234000 BPP 30 DSC disabled
[03:21:40] [PASSED] Clock 297000 BPP 24 DSC disabled
[03:21:40] [PASSED] Clock 332880 BPP 24 DSC enabled
[03:21:40] [PASSED] Clock 324540 BPP 24 DSC enabled
[03:21:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[03:21:40] ============== drm_test_dp_mst_calc_pbn_div  ===============
[03:21:40] [PASSED] Link rate 2000000 lane count 4
[03:21:40] [PASSED] Link rate 2000000 lane count 2
[03:21:40] [PASSED] Link rate 2000000 lane count 1
[03:21:40] [PASSED] Link rate 1350000 lane count 4
[03:21:40] [PASSED] Link rate 1350000 lane count 2
[03:21:40] [PASSED] Link rate 1350000 lane count 1
[03:21:40] [PASSED] Link rate 1000000 lane count 4
[03:21:40] [PASSED] Link rate 1000000 lane count 2
[03:21:40] [PASSED] Link rate 1000000 lane count 1
[03:21:40] [PASSED] Link rate 810000 lane count 4
[03:21:40] [PASSED] Link rate 810000 lane count 2
[03:21:40] [PASSED] Link rate 810000 lane count 1
[03:21:40] [PASSED] Link rate 540000 lane count 4
[03:21:40] [PASSED] Link rate 540000 lane count 2
[03:21:40] [PASSED] Link rate 540000 lane count 1
[03:21:40] [PASSED] Link rate 270000 lane count 4
[03:21:40] [PASSED] Link rate 270000 lane count 2
[03:21:40] [PASSED] Link rate 270000 lane count 1
[03:21:40] [PASSED] Link rate 162000 lane count 4
[03:21:40] [PASSED] Link rate 162000 lane count 2
[03:21:40] [PASSED] Link rate 162000 lane count 1
[03:21:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[03:21:40] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[03:21:40] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[03:21:40] [PASSED] DP_POWER_UP_PHY with port number
[03:21:40] [PASSED] DP_POWER_DOWN_PHY with port number
[03:21:40] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[03:21:40] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[03:21:40] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[03:21:40] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[03:21:40] [PASSED] DP_QUERY_PAYLOAD with port number
[03:21:40] [PASSED] DP_QUERY_PAYLOAD with VCPI
[03:21:40] [PASSED] DP_REMOTE_DPCD_READ with port number
[03:21:40] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[03:21:40] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[03:21:40] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[03:21:40] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[03:21:40] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[03:21:40] [PASSED] DP_REMOTE_I2C_READ with port number
[03:21:40] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[03:21:40] [PASSED] DP_REMOTE_I2C_READ with transactions array
[03:21:40] [PASSED] DP_REMOTE_I2C_WRITE with port number
[03:21:40] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[03:21:40] [PASSED] DP_REMOTE_I2C_WRITE with data array
[03:21:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[03:21:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[03:21:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[03:21:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[03:21:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[03:21:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[03:21:40] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[03:21:40] ================ [PASSED] drm_dp_mst_helper ================
[03:21:40] ================== drm_exec (7 subtests) ===================
[03:21:40] [PASSED] sanitycheck
[03:21:40] [PASSED] test_lock
[03:21:40] [PASSED] test_lock_unlock
[03:21:40] [PASSED] test_duplicates
[03:21:40] [PASSED] test_prepare
[03:21:40] [PASSED] test_prepare_array
[03:21:40] [PASSED] test_multiple_loops
[03:21:40] ==================== [PASSED] drm_exec =====================
[03:21:40] =========== drm_format_helper_test (17 subtests) ===========
[03:21:40] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[03:21:40] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[03:21:40] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[03:21:40] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[03:21:40] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[03:21:40] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[03:21:40] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[03:21:40] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[03:21:40] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[03:21:40] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[03:21:40] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[03:21:40] ============== drm_test_fb_xrgb8888_to_mono  ===============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[03:21:40] ==================== drm_test_fb_swab  =====================
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ================ [PASSED] drm_test_fb_swab =================
[03:21:40] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[03:21:40] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[03:21:40] [PASSED] single_pixel_source_buffer
[03:21:40] [PASSED] single_pixel_clip_rectangle
[03:21:40] [PASSED] well_known_colors
[03:21:40] [PASSED] destination_pitch
[03:21:40] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[03:21:40] ================= drm_test_fb_clip_offset  =================
[03:21:40] [PASSED] pass through
[03:21:40] [PASSED] horizontal offset
[03:21:40] [PASSED] vertical offset
[03:21:40] [PASSED] horizontal and vertical offset
[03:21:40] [PASSED] horizontal offset (custom pitch)
[03:21:40] [PASSED] vertical offset (custom pitch)
[03:21:40] [PASSED] horizontal and vertical offset (custom pitch)
[03:21:40] ============= [PASSED] drm_test_fb_clip_offset =============
[03:21:40] =================== drm_test_fb_memcpy  ====================
[03:21:40] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[03:21:40] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[03:21:40] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[03:21:40] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[03:21:40] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[03:21:40] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[03:21:40] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[03:21:40] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[03:21:40] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[03:21:40] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[03:21:40] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[03:21:40] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[03:21:40] =============== [PASSED] drm_test_fb_memcpy ================
[03:21:40] ============= [PASSED] drm_format_helper_test ==============
[03:21:40] ================= drm_format (18 subtests) =================
[03:21:40] [PASSED] drm_test_format_block_width_invalid
[03:21:40] [PASSED] drm_test_format_block_width_one_plane
[03:21:40] [PASSED] drm_test_format_block_width_two_plane
[03:21:40] [PASSED] drm_test_format_block_width_three_plane
[03:21:40] [PASSED] drm_test_format_block_width_tiled
[03:21:40] [PASSED] drm_test_format_block_height_invalid
[03:21:40] [PASSED] drm_test_format_block_height_one_plane
[03:21:40] [PASSED] drm_test_format_block_height_two_plane
[03:21:40] [PASSED] drm_test_format_block_height_three_plane
[03:21:40] [PASSED] drm_test_format_block_height_tiled
[03:21:40] [PASSED] drm_test_format_min_pitch_invalid
[03:21:40] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[03:21:40] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[03:21:40] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[03:21:40] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[03:21:40] [PASSED] drm_test_format_min_pitch_two_plane
[03:21:40] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[03:21:40] [PASSED] drm_test_format_min_pitch_tiled
[03:21:40] =================== [PASSED] drm_format ====================
[03:21:40] ============== drm_framebuffer (10 subtests) ===============
[03:21:40] ========== drm_test_framebuffer_check_src_coords  ==========
[03:21:40] [PASSED] Success: source fits into fb
[03:21:40] [PASSED] Fail: overflowing fb with x-axis coordinate
[03:21:40] [PASSED] Fail: overflowing fb with y-axis coordinate
[03:21:40] [PASSED] Fail: overflowing fb with source width
[03:21:40] [PASSED] Fail: overflowing fb with source height
[03:21:40] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[03:21:40] [PASSED] drm_test_framebuffer_cleanup
[03:21:40] =============== drm_test_framebuffer_create  ===============
[03:21:40] [PASSED] ABGR8888 normal sizes
[03:21:40] [PASSED] ABGR8888 max sizes
[03:21:40] [PASSED] ABGR8888 pitch greater than min required
[03:21:40] [PASSED] ABGR8888 pitch less than min required
[03:21:40] [PASSED] ABGR8888 Invalid width
[03:21:40] [PASSED] ABGR8888 Invalid buffer handle
[03:21:40] [PASSED] No pixel format
[03:21:40] [PASSED] ABGR8888 Width 0
[03:21:40] [PASSED] ABGR8888 Height 0
[03:21:40] [PASSED] ABGR8888 Out of bound height * pitch combination
[03:21:40] [PASSED] ABGR8888 Large buffer offset
[03:21:40] [PASSED] ABGR8888 Buffer offset for inexistent plane
[03:21:40] [PASSED] ABGR8888 Invalid flag
[03:21:40] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[03:21:40] [PASSED] ABGR8888 Valid buffer modifier
[03:21:40] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[03:21:40] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[03:21:40] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[03:21:40] [PASSED] NV12 Normal sizes
[03:21:40] [PASSED] NV12 Max sizes
[03:21:40] [PASSED] NV12 Invalid pitch
[03:21:40] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[03:21:40] [PASSED] NV12 different  modifier per-plane
[03:21:40] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[03:21:40] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[03:21:40] [PASSED] NV12 Modifier for inexistent plane
[03:21:40] [PASSED] NV12 Handle for inexistent plane
[03:21:40] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[03:21:40] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[03:21:40] [PASSED] YVU420 Normal sizes
[03:21:40] [PASSED] YVU420 Max sizes
[03:21:40] [PASSED] YVU420 Invalid pitch
[03:21:40] [PASSED] YVU420 Different pitches
[03:21:40] [PASSED] YVU420 Different buffer offsets/pitches
[03:21:40] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[03:21:40] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[03:21:40] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[03:21:40] [PASSED] YVU420 Valid modifier
[03:21:40] [PASSED] YVU420 Different modifiers per plane
[03:21:40] [PASSED] YVU420 Modifier for inexistent plane
[03:21:40] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[03:21:40] [PASSED] X0L2 Normal sizes
[03:21:40] [PASSED] X0L2 Max sizes
[03:21:40] [PASSED] X0L2 Invalid pitch
[03:21:40] [PASSED] X0L2 Pitch greater than minimum required
[03:21:40] [PASSED] X0L2 Handle for inexistent plane
[03:21:40] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[03:21:40] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[03:21:40] [PASSED] X0L2 Valid modifier
[03:21:40] [PASSED] X0L2 Modifier for inexistent plane
[03:21:40] =========== [PASSED] drm_test_framebuffer_create ===========
[03:21:40] [PASSED] drm_test_framebuffer_free
[03:21:40] [PASSED] drm_test_framebuffer_init
[03:21:40] [PASSED] drm_test_framebuffer_init_bad_format
[03:21:40] [PASSED] drm_test_framebuffer_init_dev_mismatch
[03:21:40] [PASSED] drm_test_framebuffer_lookup
[03:21:40] [PASSED] drm_test_framebuffer_lookup_inexistent
[03:21:40] [PASSED] drm_test_framebuffer_modifiers_not_supported
[03:21:40] ================= [PASSED] drm_framebuffer =================
[03:21:40] ================ drm_gem_shmem (8 subtests) ================
[03:21:40] [PASSED] drm_gem_shmem_test_obj_create
[03:21:40] [PASSED] drm_gem_shmem_test_obj_create_private
[03:21:40] [PASSED] drm_gem_shmem_test_pin_pages
[03:21:40] [PASSED] drm_gem_shmem_test_vmap
[03:21:40] [PASSED] drm_gem_shmem_test_get_pages_sgt
[03:21:40] [PASSED] drm_gem_shmem_test_get_sg_table
[03:21:40] [PASSED] drm_gem_shmem_test_madvise
[03:21:40] [PASSED] drm_gem_shmem_test_purge
[03:21:40] ================== [PASSED] drm_gem_shmem ==================
[03:21:40] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[03:21:40] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[03:21:40] [PASSED] Automatic
[03:21:40] [PASSED] Full
[03:21:40] [PASSED] Limited 16:235
[03:21:40] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[03:21:40] [PASSED] drm_test_check_disable_connector
[03:21:40] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[03:21:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[03:21:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[03:21:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[03:21:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[03:21:40] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[03:21:40] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[03:21:40] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[03:21:40] [PASSED] drm_test_check_output_bpc_dvi
[03:21:40] [PASSED] drm_test_check_output_bpc_format_vic_1
[03:21:40] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[03:21:40] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[03:21:40] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[03:21:40] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[03:21:40] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[03:21:40] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[03:21:40] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[03:21:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[03:21:40] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[03:21:40] [PASSED] drm_test_check_broadcast_rgb_value
[03:21:40] [PASSED] drm_test_check_bpc_8_value
[03:21:40] [PASSED] drm_test_check_bpc_10_value
[03:21:40] [PASSED] drm_test_check_bpc_12_value
[03:21:40] [PASSED] drm_test_check_format_value
[03:21:40] [PASSED] drm_test_check_tmds_char_value
[03:21:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[03:21:40] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[03:21:40] [PASSED] drm_test_check_mode_valid
[03:21:40] [PASSED] drm_test_check_mode_valid_reject
[03:21:40] [PASSED] drm_test_check_mode_valid_reject_rate
[03:21:40] [PASSED] drm_test_check_mode_valid_reject_max_clock
[03:21:40] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[03:21:40] ================= drm_managed (2 subtests) =================
[03:21:40] [PASSED] drm_test_managed_release_action
[03:21:40] [PASSED] drm_test_managed_run_action
[03:21:40] =================== [PASSED] drm_managed ===================
[03:21:40] =================== drm_mm (6 subtests) ====================
[03:21:40] [PASSED] drm_test_mm_init
[03:21:40] [PASSED] drm_test_mm_debug
[03:21:40] [PASSED] drm_test_mm_align32
[03:21:40] [PASSED] drm_test_mm_align64
[03:21:40] [PASSED] drm_test_mm_lowest
[03:21:40] [PASSED] drm_test_mm_highest
[03:21:40] ===================== [PASSED] drm_mm ======================
[03:21:40] ============= drm_modes_analog_tv (5 subtests) =============
[03:21:40] [PASSED] drm_test_modes_analog_tv_mono_576i
[03:21:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[03:21:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[03:21:40] [PASSED] drm_test_modes_analog_tv_pal_576i
[03:21:40] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[03:21:40] =============== [PASSED] drm_modes_analog_tv ===============
[03:21:40] ============== drm_plane_helper (2 subtests) ===============
[03:21:40] =============== drm_test_check_plane_state  ================
[03:21:40] [PASSED] clipping_simple
[03:21:40] [PASSED] clipping_rotate_reflect
[03:21:40] [PASSED] positioning_simple
[03:21:40] [PASSED] upscaling
[03:21:40] [PASSED] downscaling
[03:21:40] [PASSED] rounding1
[03:21:40] [PASSED] rounding2
[03:21:40] [PASSED] rounding3
[03:21:40] [PASSED] rounding4
[03:21:40] =========== [PASSED] drm_test_check_plane_state ============
[03:21:40] =========== drm_test_check_invalid_plane_state  ============
[03:21:40] [PASSED] positioning_invalid
[03:21:40] [PASSED] upscaling_invalid
[03:21:40] [PASSED] downscaling_invalid
[03:21:40] ======= [PASSED] drm_test_check_invalid_plane_state ========
[03:21:40] ================ [PASSED] drm_plane_helper =================
[03:21:40] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[03:21:40] ====== drm_test_connector_helper_tv_get_modes_check  =======
[03:21:40] [PASSED] None
[03:21:40] [PASSED] PAL
[03:21:40] [PASSED] NTSC
[03:21:40] [PASSED] Both, NTSC Default
[03:21:40] [PASSED] Both, PAL Default
[03:21:40] [PASSED] Both, NTSC Default, with PAL on command-line
[03:21:40] [PASSED] Both, PAL Default, with NTSC on command-line
[03:21:40] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[03:21:40] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[03:21:40] ================== drm_rect (9 subtests) ===================
[03:21:40] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[03:21:40] [PASSED] drm_test_rect_clip_scaled_not_clipped
[03:21:40] [PASSED] drm_test_rect_clip_scaled_clipped
[03:21:40] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[03:21:40] ================= drm_test_rect_intersect  =================
[03:21:40] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[03:21:40] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[03:21:40] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[03:21:40] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[03:21:40] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[03:21:40] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[03:21:40] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[03:21:40] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[03:21:40] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[03:21:40] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[03:21:40] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[03:21:40] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[03:21:40] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[03:21:40] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[03:21:40] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[03:21:40] ============= [PASSED] drm_test_rect_intersect =============
[03:21:40] ================ drm_test_rect_calc_hscale  ================
[03:21:40] [PASSED] normal use
[03:21:40] [PASSED] out of max range
[03:21:40] [PASSED] out of min range
[03:21:40] [PASSED] zero dst
[03:21:40] [PASSED] negative src
[03:21:40] [PASSED] negative dst
[03:21:40] ============ [PASSED] drm_test_rect_calc_hscale ============
[03:21:40] ================ drm_test_rect_calc_vscale  ================
[03:21:40] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[03:21:40] [PASSED] out of max range
[03:21:40] [PASSED] out of min range
[03:21:40] [PASSED] zero dst
[03:21:40] [PASSED] negative src
[03:21:40] [PASSED] negative dst
[03:21:40] ============ [PASSED] drm_test_rect_calc_vscale ============
[03:21:40] ================== drm_test_rect_rotate  ===================
[03:21:40] [PASSED] reflect-x
[03:21:40] [PASSED] reflect-y
[03:21:40] [PASSED] rotate-0
[03:21:40] [PASSED] rotate-90
[03:21:40] [PASSED] rotate-180
[03:21:40] [PASSED] rotate-270
[03:21:40] ============== [PASSED] drm_test_rect_rotate ===============
[03:21:40] ================ drm_test_rect_rotate_inv  =================
[03:21:40] [PASSED] reflect-x
[03:21:40] [PASSED] reflect-y
[03:21:40] [PASSED] rotate-0
[03:21:40] [PASSED] rotate-90
[03:21:40] [PASSED] rotate-180
[03:21:40] [PASSED] rotate-270
[03:21:40] ============ [PASSED] drm_test_rect_rotate_inv =============
[03:21:40] ==================== [PASSED] drm_rect =====================
[03:21:40] ============ drm_sysfb_modeset_test (1 subtest) ============
[03:21:40] ============ drm_test_sysfb_build_fourcc_list  =============
[03:21:40] [PASSED] no native formats
[03:21:40] [PASSED] XRGB8888 as native format
[03:21:40] [PASSED] remove duplicates
[03:21:40] [PASSED] convert alpha formats
[03:21:40] [PASSED] random formats
[03:21:40] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[03:21:40] ============= [PASSED] drm_sysfb_modeset_test ==============
[03:21:40] ================== drm_fixp (2 subtests) ===================
[03:21:40] [PASSED] drm_test_int2fixp
[03:21:40] [PASSED] drm_test_sm2fixp
[03:21:40] ==================== [PASSED] drm_fixp =====================
[03:21:40] ============================================================
[03:21:40] Testing complete. Ran 624 tests: passed: 624
[03:21:40] Elapsed time: 27.317s total, 1.597s configuring, 25.304s building, 0.363s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[03:21:40] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:21:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[03:21:51] Starting KUnit Kernel (1/1)...
[03:21:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:21:51] ================= ttm_device (5 subtests) ==================
[03:21:51] [PASSED] ttm_device_init_basic
[03:21:51] [PASSED] ttm_device_init_multiple
[03:21:51] [PASSED] ttm_device_fini_basic
[03:21:51] [PASSED] ttm_device_init_no_vma_man
[03:21:51] ================== ttm_device_init_pools  ==================
[03:21:51] [PASSED] No DMA allocations, no DMA32 required
[03:21:51] [PASSED] DMA allocations, DMA32 required
[03:21:51] [PASSED] No DMA allocations, DMA32 required
[03:21:51] [PASSED] DMA allocations, no DMA32 required
[03:21:51] ============== [PASSED] ttm_device_init_pools ==============
[03:21:51] =================== [PASSED] ttm_device ====================
[03:21:51] ================== ttm_pool (8 subtests) ===================
[03:21:51] ================== ttm_pool_alloc_basic  ===================
[03:21:51] [PASSED] One page
[03:21:51] [PASSED] More than one page
[03:21:51] [PASSED] Above the allocation limit
[03:21:51] [PASSED] One page, with coherent DMA mappings enabled
[03:21:51] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[03:21:51] ============== [PASSED] ttm_pool_alloc_basic ===============
[03:21:51] ============== ttm_pool_alloc_basic_dma_addr  ==============
[03:21:51] [PASSED] One page
[03:21:51] [PASSED] More than one page
[03:21:51] [PASSED] Above the allocation limit
[03:21:51] [PASSED] One page, with coherent DMA mappings enabled
[03:21:51] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[03:21:51] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[03:21:51] [PASSED] ttm_pool_alloc_order_caching_match
[03:21:51] [PASSED] ttm_pool_alloc_caching_mismatch
[03:21:51] [PASSED] ttm_pool_alloc_order_mismatch
[03:21:51] [PASSED] ttm_pool_free_dma_alloc
[03:21:51] [PASSED] ttm_pool_free_no_dma_alloc
[03:21:51] [PASSED] ttm_pool_fini_basic
[03:21:51] ==================== [PASSED] ttm_pool =====================
[03:21:51] ================ ttm_resource (8 subtests) =================
[03:21:51] ================= ttm_resource_init_basic  =================
[03:21:51] [PASSED] Init resource in TTM_PL_SYSTEM
[03:21:51] [PASSED] Init resource in TTM_PL_VRAM
[03:21:51] [PASSED] Init resource in a private placement
[03:21:51] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[03:21:51] ============= [PASSED] ttm_resource_init_basic =============
[03:21:51] [PASSED] ttm_resource_init_pinned
[03:21:51] [PASSED] ttm_resource_fini_basic
[03:21:51] [PASSED] ttm_resource_manager_init_basic
[03:21:51] [PASSED] ttm_resource_manager_usage_basic
[03:21:51] [PASSED] ttm_resource_manager_set_used_basic
[03:21:51] [PASSED] ttm_sys_man_alloc_basic
[03:21:51] [PASSED] ttm_sys_man_free_basic
[03:21:51] ================== [PASSED] ttm_resource ===================
[03:21:51] =================== ttm_tt (15 subtests) ===================
[03:21:51] ==================== ttm_tt_init_basic  ====================
[03:21:51] [PASSED] Page-aligned size
[03:21:51] [PASSED] Extra pages requested
[03:21:51] ================ [PASSED] ttm_tt_init_basic ================
[03:21:51] [PASSED] ttm_tt_init_misaligned
[03:21:51] [PASSED] ttm_tt_fini_basic
[03:21:51] [PASSED] ttm_tt_fini_sg
[03:21:51] [PASSED] ttm_tt_fini_shmem
[03:21:51] [PASSED] ttm_tt_create_basic
[03:21:51] [PASSED] ttm_tt_create_invalid_bo_type
[03:21:51] [PASSED] ttm_tt_create_ttm_exists
[03:21:51] [PASSED] ttm_tt_create_failed
[03:21:51] [PASSED] ttm_tt_destroy_basic
[03:21:51] [PASSED] ttm_tt_populate_null_ttm
[03:21:51] [PASSED] ttm_tt_populate_populated_ttm
[03:21:51] [PASSED] ttm_tt_unpopulate_basic
[03:21:51] [PASSED] ttm_tt_unpopulate_empty_ttm
[03:21:51] [PASSED] ttm_tt_swapin_basic
[03:21:51] ===================== [PASSED] ttm_tt ======================
[03:21:51] =================== ttm_bo (14 subtests) ===================
[03:21:51] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[03:21:51] [PASSED] Cannot be interrupted and sleeps
[03:21:51] [PASSED] Cannot be interrupted, locks straight away
[03:21:51] [PASSED] Can be interrupted, sleeps
[03:21:51] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[03:21:51] [PASSED] ttm_bo_reserve_locked_no_sleep
[03:21:51] [PASSED] ttm_bo_reserve_no_wait_ticket
[03:21:51] [PASSED] ttm_bo_reserve_double_resv
[03:21:51] [PASSED] ttm_bo_reserve_interrupted
[03:21:51] [PASSED] ttm_bo_reserve_deadlock
[03:21:51] [PASSED] ttm_bo_unreserve_basic
[03:21:51] [PASSED] ttm_bo_unreserve_pinned
[03:21:51] [PASSED] ttm_bo_unreserve_bulk
[03:21:51] [PASSED] ttm_bo_fini_basic
[03:21:51] [PASSED] ttm_bo_fini_shared_resv
[03:21:51] [PASSED] ttm_bo_pin_basic
[03:21:51] [PASSED] ttm_bo_pin_unpin_resource
[03:21:51] [PASSED] ttm_bo_multiple_pin_one_unpin
[03:21:51] ===================== [PASSED] ttm_bo ======================
[03:21:51] ============== ttm_bo_validate (21 subtests) ===============
[03:21:51] ============== ttm_bo_init_reserved_sys_man  ===============
[03:21:51] [PASSED] Buffer object for userspace
[03:21:51] [PASSED] Kernel buffer object
[03:21:51] [PASSED] Shared buffer object
[03:21:51] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[03:21:51] ============== ttm_bo_init_reserved_mock_man  ==============
[03:21:51] [PASSED] Buffer object for userspace
[03:21:51] [PASSED] Kernel buffer object
[03:21:51] [PASSED] Shared buffer object
[03:21:51] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[03:21:51] [PASSED] ttm_bo_init_reserved_resv
[03:21:51] ================== ttm_bo_validate_basic  ==================
[03:21:51] [PASSED] Buffer object for userspace
[03:21:51] [PASSED] Kernel buffer object
[03:21:51] [PASSED] Shared buffer object
[03:21:51] ============== [PASSED] ttm_bo_validate_basic ==============
[03:21:51] [PASSED] ttm_bo_validate_invalid_placement
[03:21:51] ============= ttm_bo_validate_same_placement  ==============
[03:21:51] [PASSED] System manager
[03:21:51] [PASSED] VRAM manager
[03:21:51] ========= [PASSED] ttm_bo_validate_same_placement ==========
[03:21:51] [PASSED] ttm_bo_validate_failed_alloc
[03:21:51] [PASSED] ttm_bo_validate_pinned
[03:21:51] [PASSED] ttm_bo_validate_busy_placement
[03:21:51] ================ ttm_bo_validate_multihop  =================
[03:21:51] [PASSED] Buffer object for userspace
[03:21:51] [PASSED] Kernel buffer object
[03:21:51] [PASSED] Shared buffer object
[03:21:51] ============ [PASSED] ttm_bo_validate_multihop =============
[03:21:51] ========== ttm_bo_validate_no_placement_signaled  ==========
[03:21:51] [PASSED] Buffer object in system domain, no page vector
[03:21:51] [PASSED] Buffer object in system domain with an existing page vector
[03:21:51] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[03:21:51] ======== ttm_bo_validate_no_placement_not_signaled  ========
[03:21:51] [PASSED] Buffer object for userspace
[03:21:51] [PASSED] Kernel buffer object
[03:21:51] [PASSED] Shared buffer object
[03:21:51] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[03:21:51] [PASSED] ttm_bo_validate_move_fence_signaled
[03:21:51] ========= ttm_bo_validate_move_fence_not_signaled  =========
[03:21:51] [PASSED] Waits for GPU
[03:21:51] [PASSED] Tries to lock straight away
[03:21:51] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[03:21:51] [PASSED] ttm_bo_validate_happy_evict
[03:21:51] [PASSED] ttm_bo_validate_all_pinned_evict
[03:21:51] [PASSED] ttm_bo_validate_allowed_only_evict
[03:21:51] [PASSED] ttm_bo_validate_deleted_evict
[03:21:51] [PASSED] ttm_bo_validate_busy_domain_evict
[03:21:51] [PASSED] ttm_bo_validate_evict_gutting
[03:21:51] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[03:21:51] ================= [PASSED] ttm_bo_validate =================
[03:21:51] ============================================================
[03:21:51] Testing complete. Ran 101 tests: passed: 101
[03:21:51] Elapsed time: 11.115s total, 1.618s configuring, 9.281s building, 0.182s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


