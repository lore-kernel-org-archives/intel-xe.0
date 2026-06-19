Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE14CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3FC10E104;
	Fri, 19 Jun 2026 19:18:48 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CE510E0FC;
 Fri, 19 Jun 2026 19:18:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Prepare_GuC_resource_managers_?=
 =?utf-8?q?for_VFs_provisioning_in_PF_admin_only_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jun 2026 19:18:47 -0000
Message-ID: <178189672746.96724.4345805473841161096@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
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

Series: Prepare GuC resource managers for VFs provisioning in PF admin only mode
URL   : https://patchwork.freedesktop.org/series/168863/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:18:06] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:18:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:18:41] Starting KUnit Kernel (1/1)...
[19:18:41] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:18:42] ================== guc_buf (11 subtests) ===================
[19:18:42] [PASSED] test_smallest
[19:18:42] [PASSED] test_largest
[19:18:42] [PASSED] test_granular
[19:18:42] [PASSED] test_unique
[19:18:42] [PASSED] test_overlap
[19:18:42] [PASSED] test_reusable
[19:18:42] [PASSED] test_too_big
[19:18:42] [PASSED] test_flush
[19:18:42] [PASSED] test_lookup
[19:18:42] [PASSED] test_data
[19:18:42] [PASSED] test_class
[19:18:42] ===================== [PASSED] guc_buf =====================
[19:18:42] =================== guc_dbm (8 subtests) ===================
[19:18:42] [PASSED] test_empty
[19:18:42] [PASSED] test_default
[19:18:42] [PASSED] test_start_offset
[19:18:42] ======================== test_size  ========================
[19:18:42] [PASSED] 4
[19:18:42] [PASSED] 8
[19:18:42] [PASSED] 32
[19:18:42] [PASSED] 256
[19:18:42] ==================== [PASSED] test_size ====================
[19:18:42] ======================= test_reuse  ========================
[19:18:42] [PASSED] 4
[19:18:42] [PASSED] 8
[19:18:42] [PASSED] 32
[19:18:42] [PASSED] 256
[19:18:42] =================== [PASSED] test_reuse ====================
[19:18:42] =================== test_range_overlap  ====================
[19:18:42] [PASSED] 4
[19:18:42] [PASSED] 8
[19:18:42] [PASSED] 32
[19:18:42] [PASSED] 256
[19:18:42] =============== [PASSED] test_range_overlap ================
[19:18:42] =================== test_range_compact  ====================
[19:18:42] [PASSED] 4
[19:18:42] [PASSED] 8
[19:18:42] [PASSED] 32
[19:18:42] [PASSED] 256
[19:18:42] =============== [PASSED] test_range_compact ================
[19:18:42] ==================== test_range_spare  =====================
[19:18:42] [PASSED] 4
[19:18:42] [PASSED] 8
[19:18:42] [PASSED] 32
[19:18:42] [PASSED] 256
[19:18:42] ================ [PASSED] test_range_spare =================
[19:18:42] ===================== [PASSED] guc_dbm =====================
[19:18:42] =================== guc_idm (7 subtests) ===================
[19:18:42] [PASSED] bad_init
[19:18:42] [PASSED] no_init
[19:18:42] [PASSED] init_fini
[19:18:42] [PASSED] check_used
[19:18:42] [PASSED] check_quota
[19:18:42] [PASSED] check_start_offset
[19:18:42] [PASSED] check_all
[19:18:42] ===================== [PASSED] guc_idm =====================
[19:18:42] ================== no_relay (3 subtests) ===================
[19:18:42] [PASSED] xe_drops_guc2pf_if_not_ready
[19:18:42] [PASSED] xe_drops_guc2vf_if_not_ready
[19:18:42] [PASSED] xe_rejects_send_if_not_ready
[19:18:42] ==================== [PASSED] no_relay =====================
[19:18:42] ================== pf_relay (14 subtests) ==================
[19:18:42] [PASSED] pf_rejects_guc2pf_too_short
[19:18:42] [PASSED] pf_rejects_guc2pf_too_long
[19:18:42] [PASSED] pf_rejects_guc2pf_no_payload
[19:18:42] [PASSED] pf_fails_no_payload
[19:18:42] [PASSED] pf_fails_bad_origin
[19:18:42] [PASSED] pf_fails_bad_type
[19:18:42] [PASSED] pf_txn_reports_error
[19:18:42] [PASSED] pf_txn_sends_pf2guc
[19:18:42] [PASSED] pf_sends_pf2guc
[19:18:42] [SKIPPED] pf_loopback_nop
[19:18:42] [SKIPPED] pf_loopback_echo
[19:18:42] [SKIPPED] pf_loopback_fail
[19:18:42] [SKIPPED] pf_loopback_busy
[19:18:42] [SKIPPED] pf_loopback_retry
[19:18:42] ==================== [PASSED] pf_relay =====================
[19:18:42] ================== vf_relay (3 subtests) ===================
[19:18:42] [PASSED] vf_rejects_guc2vf_too_short
[19:18:42] [PASSED] vf_rejects_guc2vf_too_long
[19:18:42] [PASSED] vf_rejects_guc2vf_no_payload
[19:18:42] ==================== [PASSED] vf_relay =====================
[19:18:42] ================ pf_gt_config (9 subtests) =================
[19:18:42] # fair_contexts_1vf: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:119
[19:18:42] Expected 0x00008000 == pf_profile_fair_ctxs(gt, 1), but
[19:18:42]     0x00008000 == 32768 (0x8000)
[19:18:42]     pf_profile_fair_ctxs(gt, 1) == 0 (0x0)
[19:18:42] # fair_contexts_1vf: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:123
[19:18:42] Expected 0x00010000 - 0x00000400 == pf_profile_fair_ctxs(gt, 1), but
[19:18:42]     0x00010000 - 0x00000400 == 64512 (0xfc00)
[19:18:42]     pf_profile_fair_ctxs(gt, 1) == 0 (0x0)
[19:18:42] [FAILED] fair_contexts_1vf
[19:18:42] # fair_doorbells_1vf: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:159
[19:18:42] Expected 128 == pf_profile_fair_dbs(gt, 1), but
[19:18:42]     pf_profile_fair_dbs(gt, 1) == 0 (0x0)
[19:18:42] # fair_doorbells_1vf: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:163
[19:18:42] Expected 240 == pf_profile_fair_dbs(gt, 1), but
[19:18:42]     pf_profile_fair_dbs(gt, 1) == 4294967280 (0xfffffff0)
[19:18:42] [FAILED] fair_doorbells_1vf
[19:18:42] [PASSED] fair_ggtt_1vf
[19:18:42] ====================== fair_vram_1vf  ======================
[19:18:42] [PASSED] 3.50 GiB
[19:18:42] [PASSED] 11.5 GiB
[19:18:42] [PASSED] 15.5 GiB
[19:18:42] [PASSED] 31.5 GiB
[19:18:42] [PASSED] 63.5 GiB
[19:18:42] [PASSED] 1.91 GiB
[19:18:42] ================== [PASSED] fair_vram_1vf ==================
[19:18:42] ================ fair_vram_1vf_admin_only  =================
[19:18:42] [PASSED] 3.50 GiB
[19:18:42] [PASSED] 11.5 GiB
[19:18:42] [PASSED] 15.5 GiB
[19:18:42] [PASSED] 31.5 GiB
[19:18:42] [PASSED] 63.5 GiB
[19:18:42] [PASSED] 1.91 GiB
[19:18:42] ============ [PASSED] fair_vram_1vf_admin_only =============
[19:18:42] ====================== fair_contexts  ======================
[19:18:42] [FAILED] 1 VF
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:147
[19:18:42] Expected 0x00004000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00004000 == 16384 (0x4000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 2 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:147
[19:18:42] Expected 0x00004000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00004000 == 16384 (0x4000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 3 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:145
[19:18:42] Expected 0x00002000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00002000 == 8192 (0x2000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 4 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:145
[19:18:42] Expected 0x00002000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00002000 == 8192 (0x2000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 5 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:145
[19:18:42] Expected 0x00002000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00002000 == 8192 (0x2000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 6 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:145
[19:18:42] Expected 0x00002000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00002000 == 8192 (0x2000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 7 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 8 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 9 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 10 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 11 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 12 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 13 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 14 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:143
[19:18:42] Expected 0x00001000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00001000 == 4096 (0x1000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 15 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 16 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 17 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 18 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 19 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 20 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 21 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 22 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 23 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 24 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 25 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 26 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 27 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 28 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 29 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 30 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:141
[19:18:42] Expected 0x00000800 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000800 == 2048 (0x800)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 31 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 32 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 33 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 34 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 35 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 36 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 37 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 38 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 39 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 40 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 41 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 42 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 43 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 44 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 45 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 46 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 47 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 48 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 49 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 50 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 51 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 52 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 53 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 54 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 55 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 56 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 57 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 58 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 59 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 60 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 61 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 62 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:139
[19:18:42] Expected 0x00000400 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00000400 == 1024 (0x400)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 63 VFs
[19:18:42] # fair_contexts: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:135
[19:18:42] Expected is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_contexts: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:149
[19:18:42] Expected 0x00008000 == pf_profile_fair_ctxs(gt, num_vfs), but
[19:18:42]     0x00008000 == 32768 (0x8000)
[19:18:42]     pf_profile_fair_ctxs(gt, num_vfs) == 0 (0x0)
[19:18:42] # fair_contexts: pass:0 fail:63 skip:0 total:63
[19:18:42] ================== [FAILED] fair_contexts ==================
[19:18:42] ===================== fair_doorbells  ======================
[19:18:42] [FAILED] 1 VF
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:187
[19:18:42] Expected 0x00000040 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000040 == 64 (0x40)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 2 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:187
[19:18:42] Expected 0x00000040 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000040 == 64 (0x40)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 3 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:185
[19:18:42] Expected 0x00000020 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000020 == 32 (0x20)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 4 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:185
[19:18:42] Expected 0x00000020 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000020 == 32 (0x20)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 5 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:185
[19:18:42] Expected 0x00000020 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000020 == 32 (0x20)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 6 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:185
[19:18:42] Expected 0x00000020 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000020 == 32 (0x20)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 7 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 8 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 9 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 10 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 11 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 12 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 13 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 14 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:183
[19:18:42] Expected 0x00000010 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000010 == 16 (0x10)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 15 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 16 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 17 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 18 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 19 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 20 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 21 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 22 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 23 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 24 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 25 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 26 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 27 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 28 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 29 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 30 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:181
[19:18:42] Expected 0x00000008 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000008 == 8 (0x8)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 31 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 32 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 33 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 34 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 35 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 36 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 37 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 38 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 39 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 40 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 41 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 42 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 43 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 44 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 45 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 46 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 47 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 48 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 49 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 50 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 51 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 52 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 53 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 54 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 55 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 56 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 57 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 58 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 59 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 60 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 61 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 62 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:179
[19:18:42] Expected 0x00000004 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000004 == 4 (0x4)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] [FAILED] 63 VFs
[19:18:42] # fair_doorbells: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:175
[19:18:42] Expected is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)) to be true, but is false
[19:18:42] # fair_doorbells: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:189
[19:18:42] Expected 0x00000080 == pf_profile_fair_dbs(gt, num_vfs), but
[19:18:42]     0x00000080 == 128 (0x80)
[19:18:42]     pf_profile_fair_dbs(gt, num_vfs) == 0 (0x0)
[19:18:42] # fair_doorbells: pass:0 fail:63 skip:0 total:63
[19:18:42] ================= [FAILED] fair_doorbells ==================
[19:18:42] ======================== fair_ggtt  ========================
[19:18:42] [PASSED] 1 VF
[19:18:42] [PASSED] 2 VFs
[19:18:42] [PASSED] 3 VFs
[19:18:42] [PASSED] 4 VFs
[19:18:42] [PASSED] 5 VFs
[19:18:42] [PASSED] 6 VFs
[19:18:42] [PASSED] 7 VFs
[19:18:42] [PASSED] 8 VFs
[19:18:42] [PASSED] 9 VFs
[19:18:42] [PASSED] 10 VFs
[19:18:42] [PASSED] 11 VFs
[19:18:42] [PASSED] 12 VFs
[19:18:42] [PASSED] 13 VFs
[19:18:42] [PASSED] 14 VFs
[19:18:42] [PASSED] 15 VFs
[19:18:42] [PASSED] 16 VFs
[19:18:42] [PASSED] 17 VFs
[19:18:42] [PASSED] 18 VFs
[19:18:42] [PASSED] 19 VFs
[19:18:42] [PASSED] 20 VFs
[19:18:42] [PASSED] 21 VFs
[19:18:42] [PASSED] 22 VFs
[19:18:42] [PASSED] 23 VFs
[19:18:42] [PASSED] 24 VFs
[19:18:42] [PASSED] 25 VFs
[19:18:42] [PASSED] 26 VFs
[19:18:42] [PASSED] 27 VFs
[19:18:42] [PASSED] 28 VFs
[19:18:42] [PASSED] 29 VFs
[19:18:42] [PASSED] 30 VFs
[19:18:42] [PASSED] 31 VFs
[19:18:42] [PASSED] 32 VFs
[19:18:42] [PASSED] 33 VFs
[19:18:42] [PASSED] 34 VFs
[19:18:42] [PASSED] 35 VFs
[19:18:42] [PASSED] 36 VFs
[19:18:42] [PASSED] 37 VFs
[19:18:42] [PASSED] 38 VFs
[19:18:42] [PASSED] 39 VFs
[19:18:42] [PASSED] 40 VFs
[19:18:42] [PASSED] 41 VFs
[19:18:42] [PASSED] 42 VFs
[19:18:42] [PASSED] 43 VFs
[19:18:42] [PASSED] 44 VFs
[19:18:42] [PASSED] 45 VFs
[19:18:42] [PASSED] 46 VFs
[19:18:42] [PASSED] 47 VFs
[19:18:42] [PASSED] 48 VFs
[19:18:42] [PASSED] 49 VFs
[19:18:42] [PASSED] 50 VFs
[19:18:42] [PASSED] 51 VFs
[19:18:42] [PASSED] 52 VFs
[19:18:42] [PASSED] 53 VFs
[19:18:42] [PASSED] 54 VFs
[19:18:42] [PASSED] 55 VFs
[19:18:42] [PASSED] 56 VFs
[19:18:42] [PASSED] 57 VFs
[19:18:42] [PASSED] 58 VFs
[19:18:42] [PASSED] 59 VFs
[19:18:42] [PASSED] 60 VFs
[19:18:42] [PASSED] 61 VFs
[19:18:42] [PASSED] 62 VFs
[19:18:42] [PASSED] 63 VFs
[19:18:42] ==================== [PASSED] fair_ggtt ====================
[19:18:42] ======================== fair_vram  ========================
[19:18:42] [PASSED] 1 VF
[19:18:42] [PASSED] 2 VFs
[19:18:42] [PASSED] 3 VFs
[19:18:42] [PASSED] 4 VFs
[19:18:42] [PASSED] 5 VFs
[19:18:42] [PASSED] 6 VFs
[19:18:42] [PASSED] 7 VFs
[19:18:42] [PASSED] 8 VFs
[19:18:42] [PASSED] 9 VFs
[19:18:42] [PASSED] 10 VFs
[19:18:42] [PASSED] 11 VFs
[19:18:42] [PASSED] 12 VFs
[19:18:42] [PASSED] 13 VFs
[19:18:42] [PASSED] 14 VFs
[19:18:42] [PASSED] 15 VFs
[19:18:42] [PASSED] 16 VFs
[19:18:42] [PASSED] 17 VFs
[19:18:42] [PASSED] 18 VFs
[19:18:42] [PASSED] 19 VFs
[19:18:42] [PASSED] 20 VFs
[19:18:42] [PASSED] 21 VFs
[19:18:42] [PASSED] 22 VFs
[19:18:42] [PASSED] 23 VFs
[19:18:42] [PASSED] 24 VFs
[19:18:42] [PASSED] 25 VFs
[19:18:42] [PASSED] 26 VFs
[19:18:42] [PASSED] 27 VFs
[19:18:42] [PASSED] 28 VFs
[19:18:42] [PASSED] 29 VFs
[19:18:42] [PASSED] 30 VFs
[19:18:42] [PASSED] 31 VFs
[19:18:42] [PASSED] 32 VFs
[19:18:42] [PASSED] 33 VFs
[19:18:42] [PASSED] 34 VFs
[19:18:42] [PASSED] 35 VFs
[19:18:42] [PASSED] 36 VFs
[19:18:42] [PASSED] 37 VFs
[19:18:42] [PASSED] 38 VFs
[19:18:42] [PASSED] 39 VFs
[19:18:42] [PASSED] 40 VFs
[19:18:42] [PASSED] 41 VFs
[19:18:42] [PASSED] 42 VFs
[19:18:42] [PASSED] 43 VFs
[19:18:42] [PASSED] 44 VFs
[19:18:42] [PASSED] 45 VFs
[19:18:42] [PASSED] 46 VFs
[19:18:42] [PASSED] 47 VFs
[19:18:42] [PASSED] 48 VFs
[19:18:42] [PASSED] 49 VFs
[19:18:42] [PASSED] 50 VFs
[19:18:42] [PASSED] 51 VFs
[19:18:42] [PASSED] 52 VFs
[19:18:42] [PASSED] 53 VFs
[19:18:42] [PASSED] 54 VFs
[19:18:42] [PASSED] 55 VFs
[19:18:42] [PASSED] 56 VFs
[19:18:42] [PASSED] 57 VFs
[19:18:42] [PASSED] 58 VFs
[19:18:42] [PASSED] 59 VFs
[19:18:42] [PASSED] 60 VFs
[19:18:42] [PASSED] 61 VFs
[19:18:42] [PASSED] 62 VFs
[19:18:42] [PASSED] 63 VFs
[19:18:42] ==================== [PASSED] fair_vram ====================
[19:18:42]     # module: xe
[19:18:42] # pf_gt_config: pass:5 fail:4 skip:0 total:9
[19:18:42] # Totals: pass:139 fail:128 skip:0 total:267
[19:18:42] ================== [FAILED] pf_gt_config ===================
[19:18:42] ===================== lmtt (1 subtest) =====================
[19:18:42] ======================== test_ops  =========================
[19:18:42] [PASSED] 2-level
[19:18:42] [PASSED] multi-level
[19:18:42] ==================== [PASSED] test_ops =====================
[19:18:42] ====================== [PASSED] lmtt =======================
[19:18:42] ================= pf_service (11 subtests) =================
[19:18:42] [PASSED] pf_negotiate_any
[19:18:42] [PASSED] pf_negotiate_base_match
[19:18:42] [PASSED] pf_negotiate_base_newer
[19:18:42] [PASSED] pf_negotiate_base_next
[19:18:42] [SKIPPED] pf_negotiate_base_older
[19:18:42] [PASSED] pf_negotiate_base_prev
[19:18:42] [PASSED] pf_negotiate_latest_match
[19:18:42] [PASSED] pf_negotiate_latest_newer
[19:18:42] [PASSED] pf_negotiate_latest_next
[19:18:42] [SKIPPED] pf_negotiate_latest_older
[19:18:42] [SKIPPED] pf_negotiate_latest_prev
[19:18:42] =================== [PASSED] pf_service ====================
[19:18:42] ================= xe_guc_g2g (2 subtests) ==================
[19:18:42] ============== xe_live_guc_g2g_kunit_default  ==============
[19:18:42] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[19:18:42] ============== xe_live_guc_g2g_kunit_allmem  ===============
[19:18:42] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[19:18:42] =================== [SKIPPED] xe_guc_g2g ===================
[19:18:42] =================== xe_mocs (2 subtests) ===================
[19:18:42] ================ xe_live_mocs_kernel_kunit  ================
[19:18:42] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[19:18:42] ================ xe_live_mocs_reset_kunit  =================
[19:18:42] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[19:18:42] ==================== [SKIPPED] xe_mocs =====================
[19:18:42] ================= xe_migrate (2 subtests) ==================
[19:18:42] ================= xe_migrate_sanity_kunit  =================
[19:18:42] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[19:18:42] ================== xe_validate_ccs_kunit  ==================
[19:18:42] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[19:18:42] =================== [SKIPPED] xe_migrate ===================
[19:18:42] ================== xe_dma_buf (1 subtest) ==================
[19:18:42] ==================== xe_dma_buf_kunit  =====================
[19:18:42] ================ [SKIPPED] xe_dma_buf_kunit ================
[19:18:42] =================== [SKIPPED] xe_dma_buf ===================
[19:18:42] ================= xe_bo_shrink (1 subtest) =================
[19:18:42] =================== xe_bo_shrink_kunit  ====================
[19:18:42] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[19:18:42] ================== [SKIPPED] xe_bo_shrink ==================
[19:18:42] ==================== xe_bo (2 subtests) ====================
[19:18:42] ================== xe_ccs_migrate_kunit  ===================
[19:18:42] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[19:18:42] ==================== xe_bo_evict_kunit  ====================
[19:18:42] =============== [SKIPPED] xe_bo_evict_kunit ================
[19:18:42] ===================== [SKIPPED] xe_bo ======================
[19:18:42] ==================== args (13 subtests) ====================
[19:18:42] [PASSED] count_args_test
[19:18:42] [PASSED] call_args_example
[19:18:42] [PASSED] call_args_test
[19:18:42] [PASSED] drop_first_arg_example
[19:18:42] [PASSED] drop_first_arg_test
[19:18:42] [PASSED] first_arg_example
[19:18:42] [PASSED] first_arg_test
[19:18:42] [PASSED] last_arg_example
[19:18:42] [PASSED] last_arg_test
[19:18:42] [PASSED] pick_arg_example
[19:18:42] [PASSED] if_args_example
[19:18:42] [PASSED] if_args_test
[19:18:42] [PASSED] sep_comma_example
[19:18:42] ====================== [PASSED] args =======================
[19:18:42] =================== xe_pci (3 subtests) ====================
[19:18:42] ==================== check_graphics_ip  ====================
[19:18:42] [PASSED] 12.00 Xe_LP
[19:18:42] [PASSED] 12.10 Xe_LP+
[19:18:42] [PASSED] 12.55 Xe_HPG
[19:18:42] [PASSED] 12.60 Xe_HPC
[19:18:42] [PASSED] 12.70 Xe_LPG
[19:18:42] [PASSED] 12.71 Xe_LPG
[19:18:42] [PASSED] 12.74 Xe_LPG+
[19:18:42] [PASSED] 20.01 Xe2_HPG
[19:18:42] [PASSED] 20.02 Xe2_HPG
[19:18:42] [PASSED] 20.04 Xe2_LPG
[19:18:42] [PASSED] 30.00 Xe3_LPG
[19:18:42] [PASSED] 30.01 Xe3_LPG
[19:18:42] [PASSED] 30.03 Xe3_LPG
[19:18:42] [PASSED] 30.04 Xe3_LPG
[19:18:42] [PASSED] 30.05 Xe3_LPG
[19:18:42] [PASSED] 35.10 Xe3p_LPG
[19:18:42] [PASSED] 35.11 Xe3p_XPC
[19:18:42] ================ [PASSED] check_graphics_ip ================
[19:18:42] ===================== check_media_ip  ======================
[19:18:42] [PASSED] 12.00 Xe_M
[19:18:42] [PASSED] 12.55 Xe_HPM
[19:18:42] [PASSED] 13.00 Xe_LPM+
[19:18:42] [PASSED] 13.01 Xe2_HPM
[19:18:42] [PASSED] 20.00 Xe2_LPM
[19:18:42] [PASSED] 30.00 Xe3_LPM
[19:18:42] [PASSED] 30.02 Xe3_LPM
[19:18:42] [PASSED] 35.00 Xe3p_LPM
[19:18:42] [PASSED] 35.03 Xe3p_HPM
[19:18:42] ================= [PASSED] check_media_ip ==================
[19:18:42] =================== check_platform_desc  ===================
[19:18:42] [PASSED] 0x9A60 (TIGERLAKE)
[19:18:42] [PASSED] 0x9A68 (TIGERLAKE)
[19:18:42] [PASSED] 0x9A70 (TIGERLAKE)
[19:18:42] [PASSED] 0x9A40 (TIGERLAKE)
[19:18:42] [PASSED] 0x9A49 (TIGERLAKE)
[19:18:42] [PASSED] 0x9A59 (TIGERLAKE)
[19:18:42] [PASSED] 0x9A78 (TIGERLAKE)
[19:18:42] [PASSED] 0x9AC0 (TIGERLAKE)
[19:18:42] [PASSED] 0x9AC9 (TIGERLAKE)
[19:18:42] [PASSED] 0x9AD9 (TIGERLAKE)
[19:18:42] [PASSED] 0x9AF8 (TIGERLAKE)
[19:18:42] [PASSED] 0x4C80 (ROCKETLAKE)
[19:18:42] [PASSED] 0x4C8A (ROCKETLAKE)
[19:18:42] [PASSED] 0x4C8B (ROCKETLAKE)
[19:18:42] [PASSED] 0x4C8C (ROCKETLAKE)
[19:18:42] [PASSED] 0x4C90 (ROCKETLAKE)
[19:18:42] [PASSED] 0x4C9A (ROCKETLAKE)
[19:18:42] [PASSED] 0x4680 (ALDERLAKE_S)
[19:18:42] [PASSED] 0x4682 (ALDERLAKE_S)
[19:18:42] [PASSED] 0x4688 (ALDERLAKE_S)
[19:18:42] [PASSED] 0x468A (ALDERLAKE_S)
[19:18:42] [PASSED] 0x468B (ALDERLAKE_S)
[19:18:42] [PASSED] 0x4690 (ALDERLAKE_S)
[19:18:42] [PASSED] 0x4692 (ALDERLAKE_S)
[19:18:42] [PASSED] 0x4693 (ALDERLAKE_S)
[19:18:42] [PASSED] 0x46A0 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46A1 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46A2 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46A3 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46A6 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46A8 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46AA (ALDERLAKE_P)
[19:18:42] [PASSED] 0x462A (ALDERLAKE_P)
[19:18:42] [PASSED] 0x4626 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x4628 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46B0 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46B1 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46B2 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46B3 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46C0 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46C1 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46C2 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46C3 (ALDERLAKE_P)
[19:18:42] [PASSED] 0x46D0 (ALDERLAKE_N)
[19:18:42] [PASSED] 0x46D1 (ALDERLAKE_N)
[19:18:42] [PASSED] 0x46D2 (ALDERLAKE_N)
[19:18:42] [PASSED] 0x46D3 (ALDERLAKE_N)
[19:18:42] [PASSED] 0x46D4 (ALDERLAKE_N)
[19:18:42] [PASSED] 0xA721 (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7A1 (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7A9 (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7AC (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7AD (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA720 (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7A0 (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7A8 (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7AA (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA7AB (ALDERLAKE_P)
[19:18:42] [PASSED] 0xA780 (ALDERLAKE_S)
[19:18:42] [PASSED] 0xA781 (ALDERLAKE_S)
[19:18:42] [PASSED] 0xA782 (ALDERLAKE_S)
[19:18:42] [PASSED] 0xA783 (ALDERLAKE_S)
[19:18:42] [PASSED] 0xA788 (ALDERLAKE_S)
[19:18:42] [PASSED] 0xA789 (ALDERLAKE_S)
[19:18:42] [PASSED] 0xA78A (ALDERLAKE_S)
[19:18:42] [PASSED] 0xA78B (ALDERLAKE_S)
[19:18:42] [PASSED] 0x4905 (DG1)
[19:18:42] [PASSED] 0x4906 (DG1)
[19:18:42] [PASSED] 0x4907 (DG1)
[19:18:42] [PASSED] 0x4908 (DG1)
[19:18:42] [PASSED] 0x4909 (DG1)
[19:18:42] [PASSED] 0x56C0 (DG2)
[19:18:42] [PASSED] 0x56C2 (DG2)
[19:18:42] [PASSED] 0x56C1 (DG2)
[19:18:42] [PASSED] 0x7D51 (METEORLAKE)
[19:18:42] [PASSED] 0x7DD1 (METEORLAKE)
[19:18:42] [PASSED] 0x7D41 (METEORLAKE)
[19:18:42] [PASSED] 0x7D67 (METEORLAKE)
[19:18:42] [PASSED] 0xB640 (METEORLAKE)
[19:18:42] [PASSED] 0x56A0 (DG2)
[19:18:42] [PASSED] 0x56A1 (DG2)
[19:18:42] [PASSED] 0x56A2 (DG2)
[19:18:42] [PASSED] 0x56BE (DG2)
[19:18:42] [PASSED] 0x56BF (DG2)
[19:18:42] [PASSED] 0x5690 (DG2)
[19:18:42] [PASSED] 0x5691 (DG2)
[19:18:42] [PASSED] 0x5692 (DG2)
[19:18:42] [PASSED] 0x56A5 (DG2)
[19:18:42] [PASSED] 0x56A6 (DG2)
[19:18:42] [PASSED] 0x56B0 (DG2)
[19:18:42] [PASSED] 0x56B1 (DG2)
[19:18:42] [PASSED] 0x56BA (DG2)
[19:18:42] [PASSED] 0x56BB (DG2)
[19:18:42] [PASSED] 0x56BC (DG2)
[19:18:42] [PASSED] 0x56BD (DG2)
[19:18:42] [PASSED] 0x5693 (DG2)
[19:18:42] [PASSED] 0x5694 (DG2)
[19:18:42] [PASSED] 0x5695 (DG2)
[19:18:42] [PASSED] 0x56A3 (DG2)
[19:18:42] [PASSED] 0x56A4 (DG2)
[19:18:42] [PASSED] 0x56B2 (DG2)
[19:18:42] [PASSED] 0x56B3 (DG2)
[19:18:42] [PASSED] 0x5696 (DG2)
[19:18:42] [PASSED] 0x5697 (DG2)
[19:18:42] [PASSED] 0xB69 (PVC)
[19:18:42] [PASSED] 0xB6E (PVC)
[19:18:42] [PASSED] 0xBD4 (PVC)
[19:18:42] [PASSED] 0xBD5 (PVC)
[19:18:42] [PASSED] 0xBD6 (PVC)
[19:18:42] [PASSED] 0xBD7 (PVC)
[19:18:42] [PASSED] 0xBD8 (PVC)
[19:18:42] [PASSED] 0xBD9 (PVC)
[19:18:42] [PASSED] 0xBDA (PVC)
[19:18:42] [PASSED] 0xBDB (PVC)
[19:18:42] [PASSED] 0xBE0 (PVC)
[19:18:42] [PASSED] 0xBE1 (PVC)
[19:18:42] [PASSED] 0xBE5 (PVC)
[19:18:42] [PASSED] 0x7D40 (METEORLAKE)
[19:18:42] [PASSED] 0x7D45 (METEORLAKE)
[19:18:42] [PASSED] 0x7D55 (METEORLAKE)
[19:18:42] [PASSED] 0x7D60 (METEORLAKE)
[19:18:42] [PASSED] 0x7DD5 (METEORLAKE)
[19:18:42] [PASSED] 0x6420 (LUNARLAKE)
[19:18:42] [PASSED] 0x64A0 (LUNARLAKE)
[19:18:42] [PASSED] 0x64B0 (LUNARLAKE)
[19:18:42] [PASSED] 0xE202 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE209 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE20B (BATTLEMAGE)
[19:18:42] [PASSED] 0xE20C (BATTLEMAGE)
[19:18:42] [PASSED] 0xE20D (BATTLEMAGE)
[19:18:42] [PASSED] 0xE210 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE211 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE212 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE216 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE220 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE221 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE222 (BATTLEMAGE)
[19:18:42] [PASSED] 0xE223 (BATTLEMAGE)
[19:18:42] [PASSED] 0xB080 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB081 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB082 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB083 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB084 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB085 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB086 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB087 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB08F (PANTHERLAKE)
[19:18:42] [PASSED] 0xB090 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB0A0 (PANTHERLAKE)
[19:18:42] [PASSED] 0xB0B0 (PANTHERLAKE)
[19:18:42] [PASSED] 0xFD80 (PANTHERLAKE)
[19:18:42] [PASSED] 0xFD81 (PANTHERLAKE)
[19:18:42] [PASSED] 0xD740 (NOVALAKE_S)
[19:18:42] [PASSED] 0xD741 (NOVALAKE_S)
[19:18:42] [PASSED] 0xD742 (NOVALAKE_S)
[19:18:42] [PASSED] 0xD743 (NOVALAKE_S)
[19:18:42] [PASSED] 0xD745 (NOVALAKE_S)
[19:18:42] [PASSED] 0xD74A (NOVALAKE_S)
[19:18:42] [PASSED] 0xD74B (NOVALAKE_S)
[19:18:42] [PASSED] 0x674C (CRESCENTISLAND)
[19:18:42] [PASSED] 0x674D (CRESCENTISLAND)
[19:18:42] [PASSED] 0x674E (CRESCENTISLAND)
[19:18:42] [PASSED] 0x674F (CRESCENTISLAND)
[19:18:42] [PASSED] 0x6750 (CRESCENTISLAND)
[19:18:42] [PASSED] 0xD750 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD751 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD752 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD753 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD754 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD755 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD756 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD757 (NOVALAKE_P)
[19:18:42] [PASSED] 0xD75F (NOVALAKE_P)
[19:18:42] =============== [PASSED] check_platform_desc ===============
[19:18:42] ===================== [PASSED] xe_pci ======================
[19:18:42] ============= xe_rtp_tables_test (4 subtests) ==============
[19:18:42] ================== xe_rtp_table_gt_test  ===================
[19:18:42] [PASSED] gt_was/14011060649
[19:18:42] [PASSED] gt_was/14011059788
[19:18:42] [PASSED] gt_was/14015795083
[19:18:42] [PASSED] gt_was/16021867713
[19:18:42] [PASSED] gt_was/14019449301
[19:18:42] [PASSED] gt_was/16028005424
[19:18:42] [PASSED] gt_was/14026578760
[19:18:42] [PASSED] gt_was/1409420604
[19:18:42] [PASSED] gt_was/1408615072
[19:18:42] [PASSED] gt_was/22010523718
[19:18:42] [PASSED] gt_was/14011006942
[19:18:42] [PASSED] gt_was/14014830051
[19:18:42] [PASSED] gt_was/18018781329
[19:18:42] [PASSED] gt_was/1509235366
[19:18:42] [PASSED] gt_was/18018781329
[19:18:42] [PASSED] gt_was/16016694945
[19:18:42] [PASSED] gt_was/14018575942
[19:18:42] [PASSED] gt_was/22016670082
[19:18:42] [PASSED] gt_was/22016670082
[19:18:42] [PASSED] gt_was/14017421178
[19:18:42] [PASSED] gt_was/16025250150
[19:18:42] [PASSED] gt_was/14021871409
[19:18:42] [PASSED] gt_was/16021865536
[19:18:42] [PASSED] gt_was/14021486841
[19:18:42] [PASSED] gt_was/14025160223
[19:18:42] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[19:18:42] [PASSED] gt_was/14025635424
[19:18:42] [PASSED] gt_was/16028005424
[19:18:42] ============== [PASSED] xe_rtp_table_gt_test ===============
[19:18:42] ================== xe_rtp_table_gt_test  ===================
[19:18:42] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[19:18:42] [PASSED] gt_tunings/Tuning: 32B Access Enable
[19:18:42] [PASSED] gt_tunings/Tuning: L3 cache
[19:18:42] [PASSED] gt_tunings/Tuning: L3 cache - media
[19:18:42] [PASSED] gt_tunings/Tuning: Compression Overfetch
[19:18:42] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[19:18:42] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[19:18:42] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[19:18:42] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[19:18:42] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[19:18:42] [PASSED] gt_tunings/Tuning: Stateless compression control
[19:18:42] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[19:18:42] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[19:18:42] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[19:18:42] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[19:18:42] ============== [PASSED] xe_rtp_table_gt_test ===============
[19:18:42] ================== xe_rtp_table_oob_test  ==================
[19:18:42] [PASSED] oob_was/1607983814
[19:18:42] [PASSED] oob_was/16010904313
[19:18:42] [PASSED] oob_was/18022495364
[19:18:42] [PASSED] oob_was/22012773006
[19:18:42] [PASSED] oob_was/14014475959
[19:18:42] [PASSED] oob_was/22011391025
[19:18:42] [PASSED] oob_was/22012727170
[19:18:42] [PASSED] oob_was/22012727685
[19:18:42] [PASSED] oob_was/22016596838
[19:18:42] [PASSED] oob_was/18020744125
[19:18:42] [PASSED] oob_was/1409600907
[19:18:42] [PASSED] oob_was/22014953428
[19:18:42] [PASSED] oob_was/16017236439
[19:18:42] [PASSED] oob_was/14019821291
[19:18:42] [PASSED] oob_was/14015076503
[19:18:42] [PASSED] oob_was/14018913170
[19:18:42] [PASSED] oob_was/14018094691
[19:18:42] [PASSED] oob_was/18024947630
[19:18:42] [PASSED] oob_was/16022287689
[19:18:42] [PASSED] oob_was/13011645652
[19:18:42] [PASSED] oob_was/14022293748
[19:18:42] [PASSED] oob_was/22019794406
[19:18:42] [PASSED] oob_was/22019338487
[19:18:42] [PASSED] oob_was/16023588340
[19:18:42] [PASSED] oob_was/14019789679
[19:18:42] [PASSED] oob_was/14022866841
[19:18:42] [PASSED] oob_was/16021333562
[19:18:42] [PASSED] oob_was/14016712196
[19:18:42] [PASSED] oob_was/14015568240
[19:18:42] [PASSED] oob_was/18013179988
[19:18:42] [PASSED] oob_was/1508761755
[19:18:42] [PASSED] oob_was/16023105232
[19:18:42] [PASSED] oob_was/16026508708
[19:18:42] [PASSED] oob_was/14020001231
[19:18:42] [PASSED] oob_was/16023683509
[19:18:42] [PASSED] oob_was/14025515070
[19:18:42] [PASSED] oob_was/15015404425_disable
[19:18:42] [PASSED] oob_was/16026007364
[19:18:42] [PASSED] oob_was/14020316580
[19:18:42] [PASSED] oob_was/14025883347
[19:18:42] [PASSED] oob_was/16029380221
[19:18:42] ============== [PASSED] xe_rtp_table_oob_test ==============
[19:18:42] ================ xe_rtp_table_dev_oob_test  ================
[19:18:42] [PASSED] device_oob_was/22010954014
[19:18:42] [PASSED] device_oob_was/15015404425
[19:18:42] [PASSED] device_oob_was/22019338487_display
[19:18:42] [PASSED] device_oob_was/14022085890
[19:18:42] [PASSED] device_oob_was/14026539277
[19:18:42] [PASSED] device_oob_was/14026633728
[19:18:42] [PASSED] device_oob_was/14026746987
[19:18:42] [PASSED] device_oob_was/14026779378
[19:18:42] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[19:18:42] =============== [PASSED] xe_rtp_tables_test ================
[19:18:42] =================== xe_rtp (3 subtests) ====================
[19:18:42] =================== xe_rtp_rules_tests  ====================
[19:18:42] [PASSED] no
[19:18:42] [PASSED] yes
[19:18:42] [PASSED] no-and-no
[19:18:42] [PASSED] no-and-yes
[19:18:42] [PASSED] yes-and-no
[19:18:42] [PASSED] yes-and-yes
[19:18:42] [PASSED] no-or-no
[19:18:42] [PASSED] no-or-yes
[19:18:42] [PASSED] yes-or-no
[19:18:42] [PASSED] yes-or-yes
[19:18:42] [PASSED] no-yes-or-yes-no
[19:18:42] [PASSED] no-yes-or-yes-yes
[19:18:42] [PASSED] yes-yes-or-no-yes
[19:18:42] [PASSED] yes-yes-or-yes-yes
[19:18:42] [PASSED] no-no-or-yes-or-no
[19:18:42] [PASSED] or
[19:18:42] [PASSED] or-yes
[19:18:42] [PASSED] or-no
[19:18:42] [PASSED] yes-or
[19:18:42] [PASSED] no-or
[19:18:42] [PASSED] no-or-or-yes
[19:18:42] [PASSED] yes-or-or-no
[19:18:42] [PASSED] no-or-or-no
[19:18:42] [PASSED] missing-context-engine-class
[19:18:42] [PASSED] missing-context-engine-class-or-yes
[19:18:42] [PASSED] missing-context-engine-class-or-or-yes
[19:18:42] =============== [PASSED] xe_rtp_rules_tests ================
[19:18:42] =============== xe_rtp_process_to_sr_tests  ================
[19:18:42] [PASSED] coalesce-same-reg
[19:18:42] [PASSED] coalesce-same-reg-literal-and-func
[19:18:42] [PASSED] no-match-no-add
[19:18:42] [PASSED] two-regs-two-entries
[19:18:42] [PASSED] clr-one-set-other
[19:18:42] [PASSED] set-field
[19:18:42] [PASSED] conflict-duplicate
[19:18:42] [PASSED] conflict-not-disjoint
[19:18:42] [PASSED] conflict-not-disjoint-literal-and-func
[19:18:42] [PASSED] conflict-reg-type
[19:18:42] [PASSED] bad-mcr-reg-forced-to-regular
[19:18:42] [PASSED] bad-regular-reg-forced-to-mcr
[19:18:42] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[19:18:42] ================== xe_rtp_process_tests  ===================
[19:18:42] [PASSED] active1
[19:18:42] [PASSED] active2
[19:18:42] [PASSED] active-inactive
[19:18:42] [PASSED] inactive-active
[19:18:42] [PASSED] inactive-active-inactive
[19:18:42] [PASSED] inactive-inactive-inactive
[19:18:42] ============== [PASSED] xe_rtp_process_tests ===============
[19:18:42] ===================== [PASSED] xe_rtp ======================
[19:18:42] ==================== xe_wa (1 subtest) =====================
[19:18:42] ======================== xe_wa_gt  =========================
[19:18:42] [PASSED] TIGERLAKE B0
[19:18:42] [PASSED] DG1 A0
[19:18:42] [PASSED] DG1 B0
[19:18:42] [PASSED] ALDERLAKE_S A0
[19:18:42] [PASSED] ALDERLAKE_S B0
[19:18:42] [PASSED] ALDERLAKE_S C0
[19:18:42] [PASSED] ALDERLAKE_S D0
[19:18:42] [PASSED] ALDERLAKE_P A0
[19:18:42] [PASSED] ALDERLAKE_P B0
[19:18:42] [PASSED] ALDERLAKE_P C0
[19:18:42] [PASSED] ALDERLAKE_S RPLS D0
[19:18:42] [PASSED] ALDERLAKE_P RPLU E0
[19:18:42] [PASSED] DG2 G10 C0
[19:18:42] [PASSED] DG2 G11 B1
[19:18:42] [PASSED] DG2 G12 A1
[19:18:42] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[19:18:42] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[19:18:42] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[19:18:42] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[19:18:42] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[19:18:42] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[19:18:42] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[19:18:42] ==================== [PASSED] xe_wa_gt =====================
[19:18:42] ====================== [PASSED] xe_wa ======================
[19:18:42] ============================================================
[19:18:42] Testing complete. Ran 721 tests: passed: 575, failed: 128, skipped: 18
[19:18:42] Failures: pf_gt_config.fair_contexts_1vf, pf_gt_config.fair_doorbells_1vf, pf_gt_config.fair_contexts, pf_gt_config.fair_doorbells
[19:18:42] Elapsed time: 36.239s total, 4.314s configuring, 31.259s building, 0.653s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


