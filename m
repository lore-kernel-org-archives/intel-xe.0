Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45912C44500
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 22:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082B210E07B;
	Wed, 21 Jan 2026 22:26:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064110E07B;
 Wed, 21 Jan 2026 22:26:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/configfs=3A_Add_sriov?=
 =?utf-8?q?=2Eadmin=5Fonly=5Fpf_attribute?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 22:26:32 -0000
Message-ID: <176903439226.180221.17080771508663839517@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/configfs: Add sriov.admin_only_pf attribute
URL   : https://patchwork.freedesktop.org/series/160448/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:25:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:25:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:26:27] Starting KUnit Kernel (1/1)...
[22:26:27] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:26:27] ================== guc_buf (11 subtests) ===================
[22:26:27] [PASSED] test_smallest
[22:26:27] [PASSED] test_largest
[22:26:27] [PASSED] test_granular
[22:26:27] [PASSED] test_unique
[22:26:27] [PASSED] test_overlap
[22:26:27] [PASSED] test_reusable
[22:26:27] [PASSED] test_too_big
[22:26:27] [PASSED] test_flush
[22:26:27] [PASSED] test_lookup
[22:26:27] [PASSED] test_data
[22:26:27] [PASSED] test_class
[22:26:27] ===================== [PASSED] guc_buf =====================
[22:26:27] =================== guc_dbm (7 subtests) ===================
[22:26:27] [PASSED] test_empty
[22:26:27] [PASSED] test_default
[22:26:27] ======================== test_size  ========================
[22:26:27] [PASSED] 4
[22:26:27] [PASSED] 8
[22:26:27] [PASSED] 32
[22:26:27] [PASSED] 256
[22:26:27] ==================== [PASSED] test_size ====================
[22:26:27] ======================= test_reuse  ========================
[22:26:27] [PASSED] 4
[22:26:27] [PASSED] 8
[22:26:27] [PASSED] 32
[22:26:27] [PASSED] 256
[22:26:27] =================== [PASSED] test_reuse ====================
[22:26:27] =================== test_range_overlap  ====================
[22:26:27] [PASSED] 4
[22:26:27] [PASSED] 8
[22:26:27] [PASSED] 32
[22:26:27] [PASSED] 256
[22:26:27] =============== [PASSED] test_range_overlap ================
[22:26:27] =================== test_range_compact  ====================
[22:26:27] [PASSED] 4
[22:26:27] [PASSED] 8
[22:26:27] [PASSED] 32
[22:26:27] [PASSED] 256
[22:26:27] =============== [PASSED] test_range_compact ================
[22:26:27] ==================== test_range_spare  =====================
[22:26:27] [PASSED] 4
[22:26:27] [PASSED] 8
[22:26:27] [PASSED] 32
[22:26:27] [PASSED] 256
[22:26:27] ================ [PASSED] test_range_spare =================
[22:26:27] ===================== [PASSED] guc_dbm =====================
[22:26:27] =================== guc_idm (6 subtests) ===================
[22:26:27] [PASSED] bad_init
[22:26:27] [PASSED] no_init
[22:26:27] [PASSED] init_fini
[22:26:27] [PASSED] check_used
[22:26:27] [PASSED] check_quota
[22:26:27] [PASSED] check_all
[22:26:27] ===================== [PASSED] guc_idm =====================
[22:26:27] ================== no_relay (3 subtests) ===================
[22:26:27] [PASSED] xe_drops_guc2pf_if_not_ready
[22:26:27] [PASSED] xe_drops_guc2vf_if_not_ready
[22:26:27] [PASSED] xe_rejects_send_if_not_ready
[22:26:27] ==================== [PASSED] no_relay =====================
[22:26:27] ================== pf_relay (14 subtests) ==================
[22:26:27] [PASSED] pf_rejects_guc2pf_too_short
[22:26:27] [PASSED] pf_rejects_guc2pf_too_long
[22:26:27] [PASSED] pf_rejects_guc2pf_no_payload
[22:26:27] [PASSED] pf_fails_no_payload
[22:26:27] [PASSED] pf_fails_bad_origin
[22:26:27] [PASSED] pf_fails_bad_type
[22:26:27] [PASSED] pf_txn_reports_error
[22:26:27] [PASSED] pf_txn_sends_pf2guc
[22:26:27] [PASSED] pf_sends_pf2guc
[22:26:27] [SKIPPED] pf_loopback_nop
[22:26:27] [SKIPPED] pf_loopback_echo
[22:26:27] [SKIPPED] pf_loopback_fail
[22:26:27] [SKIPPED] pf_loopback_busy
[22:26:27] [SKIPPED] pf_loopback_retry
[22:26:27] ==================== [PASSED] pf_relay =====================
[22:26:27] ================== vf_relay (3 subtests) ===================
[22:26:27] [PASSED] vf_rejects_guc2vf_too_short
[22:26:27] [PASSED] vf_rejects_guc2vf_too_long
[22:26:27] [PASSED] vf_rejects_guc2vf_no_payload
[22:26:27] ==================== [PASSED] vf_relay =====================
[22:26:27] ================ pf_gt_config (6 subtests) =================
[22:26:27] drm-kunit-mock-device fair_contexts_1vf.drm-kunit-mock-device: [drm] PF: migration disabled: requires memory-based IRQ support
[22:26:27]     # fair_contexts_1vf: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:19
[22:26:27]     Expected enable == xe_sriov_pf_admin_only(xe), but
[22:26:27]         enable == 1 (0x1)
[22:26:27]         xe_sriov_pf_admin_only(xe) == 0 (0x0)
[22:26:27]     # fair_contexts_1vf: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:78
[22:26:27]     Expected xe_sriov_pf_admin_only(xe) to be true, but is false
[22:26:27] [FAILED] fair_contexts_1vf
[22:26:27] drm-kunit-mock-device fair_doorbells_1vf.drm-kunit-mock-device: [drm] PF: migration disabled: requires memory-based IRQ support
[22:26:27]     # fair_doorbells_1vf: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:19
[22:26:27]     Expected enable == xe_sriov_pf_admin_only(xe), but
[22:26:27]         enable == 1 (0x1)
[22:26:27]         xe_sriov_pf_admin_only(xe) == 0 (0x0)
[22:26:27]     # fair_doorbells_1vf: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:118
[22:26:27]     Expected xe_sriov_pf_admin_only(xe) to be true, but is false
[22:26:27] [FAILED] fair_doorbells_1vf
[22:26:27] drm-kunit-mock-device fair_ggtt_1vf.drm-kunit-mock-device: [drm] PF: migration disabled: requires memory-based IRQ support
[22:26:27]     # fair_ggtt_1vf: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:19
[22:26:27]     Expected enable == xe_sriov_pf_admin_only(xe), but
[22:26:27]         enable == 1 (0x1)
[22:26:27]         xe_sriov_pf_admin_only(xe) == 0 (0x0)
[22:26:27]     # fair_ggtt_1vf: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:158
[22:26:27]     Expected xe_sriov_pf_admin_only(xe) to be true, but is false
[22:26:27] [FAILED] fair_ggtt_1vf
[22:26:27] ====================== fair_contexts  ======================
[22:26:27] [PASSED] 1 VF
[22:26:27] [PASSED] 2 VFs
[22:26:27] [PASSED] 3 VFs
[22:26:27] [PASSED] 4 VFs
[22:26:27] [PASSED] 5 VFs
[22:26:27] [PASSED] 6 VFs
[22:26:27] [PASSED] 7 VFs
[22:26:27] [PASSED] 8 VFs
[22:26:27] [PASSED] 9 VFs
[22:26:27] [PASSED] 10 VFs
[22:26:27] [PASSED] 11 VFs
[22:26:27] [PASSED] 12 VFs
[22:26:27] [PASSED] 13 VFs
[22:26:27] [PASSED] 14 VFs
[22:26:27] [PASSED] 15 VFs
[22:26:27] [PASSED] 16 VFs
[22:26:27] [PASSED] 17 VFs
[22:26:27] [PASSED] 18 VFs
[22:26:27] [PASSED] 19 VFs
[22:26:27] [PASSED] 20 VFs
[22:26:27] [PASSED] 21 VFs
[22:26:27] [PASSED] 22 VFs
[22:26:27] [PASSED] 23 VFs
[22:26:27] [PASSED] 24 VFs
[22:26:27] [PASSED] 25 VFs
[22:26:27] [PASSED] 26 VFs
[22:26:27] [PASSED] 27 VFs
[22:26:27] [PASSED] 28 VFs
[22:26:27] [PASSED] 29 VFs
[22:26:27] [PASSED] 30 VFs
[22:26:27] [PASSED] 31 VFs
[22:26:27] [PASSED] 32 VFs
[22:26:27] [PASSED] 33 VFs
[22:26:27] [PASSED] 34 VFs
[22:26:27] [PASSED] 35 VFs
[22:26:27] [PASSED] 36 VFs
[22:26:27] [PASSED] 37 VFs
[22:26:27] [PASSED] 38 VFs
[22:26:27] [PASSED] 39 VFs
[22:26:27] [PASSED] 40 VFs
[22:26:27] [PASSED] 41 VFs
[22:26:27] [PASSED] 42 VFs
[22:26:27] [PASSED] 43 VFs
[22:26:27] [PASSED] 44 VFs
[22:26:27] [PASSED] 45 VFs
[22:26:27] [PASSED] 46 VFs
[22:26:27] [PASSED] 47 VFs
[22:26:27] [PASSED] 48 VFs
[22:26:27] [PASSED] 49 VFs
[22:26:27] [PASSED] 50 VFs
[22:26:27] [PASSED] 51 VFs
[22:26:27] [PASSED] 52 VFs
[22:26:27] [PASSED] 53 VFs
[22:26:27] [PASSED] 54 VFs
[22:26:27] [PASSED] 55 VFs
[22:26:27] [PASSED] 56 VFs
[22:26:27] [PASSED] 57 VFs
[22:26:27] [PASSED] 58 VFs
[22:26:27] [PASSED] 59 VFs
[22:26:27] [PASSED] 60 VFs
[22:26:27] [PASSED] 61 VFs
[22:26:27] [PASSED] 62 VFs
[22:26:27] [PASSED] 63 VFs
[22:26:27] ================== [PASSED] fair_contexts ==================
[22:26:27] ===================== fair_doorbells  ======================
[22:26:27] [PASSED] 1 VF
[22:26:27] [PASSED] 2 VFs
[22:26:27] [PASSED] 3 VFs
[22:26:27] [PASSED] 4 VFs
[22:26:27] [PASSED] 5 VFs
[22:26:27] [PASSED] 6 VFs
[22:26:27] [PASSED] 7 VFs
[22:26:27] [PASSED] 8 VFs
[22:26:27] [PASSED] 9 VFs
[22:26:27] [PASSED] 10 VFs
[22:26:27] [PASSED] 11 VFs
[22:26:27] [PASSED] 12 VFs
[22:26:27] [PASSED] 13 VFs
[22:26:27] [PASSED] 14 VFs
[22:26:27] [PASSED] 15 VFs
[22:26:27] [PASSED] 16 VFs
[22:26:27] [PASSED] 17 VFs
[22:26:27] [PASSED] 18 VFs
[22:26:27] [PASSED] 19 VFs
[22:26:27] [PASSED] 20 VFs
[22:26:27] [PASSED] 21 VFs
[22:26:27] [PASSED] 22 VFs
[22:26:27] [PASSED] 23 VFs
[22:26:27] [PASSED] 24 VFs
[22:26:27] [PASSED] 25 VFs
[22:26:27] [PASSED] 26 VFs
[22:26:27] [PASSED] 27 VFs
[22:26:27] [PASSED] 28 VFs
[22:26:27] [PASSED] 29 VFs
[22:26:27] [PASSED] 30 VFs
[22:26:27] [PASSED] 31 VFs
[22:26:27] [PASSED] 32 VFs
[22:26:27] [PASSED] 33 VFs
[22:26:27] [PASSED] 34 VFs
[22:26:27] [PASSED] 35 VFs
[22:26:27] [PASSED] 36 VFs
[22:26:27] [PASSED] 37 VFs
[22:26:27] [PASSED] 38 VFs
[22:26:27] [PASSED] 39 VFs
[22:26:27] [PASSED] 40 VFs
[22:26:27] [PASSED] 41 VFs
[22:26:27] [PASSED] 42 VFs
[22:26:27] [PASSED] 43 VFs
[22:26:27] [PASSED] 44 VFs
[22:26:27] [PASSED] 45 VFs
[22:26:27] [PASSED] 46 VFs
[22:26:27] [PASSED] 47 VFs
[22:26:27] [PASSED] 48 VFs
[22:26:27] [PASSED] 49 VFs
[22:26:27] [PASSED] 50 VFs
[22:26:27] [PASSED] 51 VFs
[22:26:27] [PASSED] 52 VFs
[22:26:27] [PASSED] 53 VFs
[22:26:27] [PASSED] 54 VFs
[22:26:27] [PASSED] 55 VFs
[22:26:27] [PASSED] 56 VFs
[22:26:27] [PASSED] 57 VFs
[22:26:27] [PASSED] 58 VFs
[22:26:27] [PASSED] 59 VFs
[22:26:27] [PASSED] 60 VFs
[22:26:27] [PASSED] 61 VFs
[22:26:28] [PASSED] 62 VFs
[22:26:28] [PASSED] 63 VFs
[22:26:28] ================= [PASSED] fair_doorbells ==================
[22:26:28] ======================== fair_ggtt  ========================
[22:26:28] [PASSED] 1 VF
[22:26:28] [PASSED] 2 VFs
[22:26:28] [PASSED] 3 VFs
[22:26:28] [PASSED] 4 VFs
[22:26:28] [PASSED] 5 VFs
[22:26:28] [PASSED] 6 VFs
[22:26:28] [PASSED] 7 VFs
[22:26:28] [PASSED] 8 VFs
[22:26:28] [PASSED] 9 VFs
[22:26:28] [PASSED] 10 VFs
[22:26:28] [PASSED] 11 VFs
[22:26:28] [PASSED] 12 VFs
[22:26:28] [PASSED] 13 VFs
[22:26:28] [PASSED] 14 VFs
[22:26:28] [PASSED] 15 VFs
[22:26:28] [PASSED] 16 VFs
[22:26:28] [PASSED] 17 VFs
[22:26:28] [PASSED] 18 VFs
[22:26:28] [PASSED] 19 VFs
[22:26:28] [PASSED] 20 VFs
[22:26:28] [PASSED] 21 VFs
[22:26:28] [PASSED] 22 VFs
[22:26:28] [PASSED] 23 VFs
[22:26:28] [PASSED] 24 VFs
[22:26:28] [PASSED] 25 VFs
[22:26:28] [PASSED] 26 VFs
[22:26:28] [PASSED] 27 VFs
[22:26:28] [PASSED] 28 VFs
[22:26:28] [PASSED] 29 VFs
[22:26:28] [PASSED] 30 VFs
[22:26:28] [PASSED] 31 VFs
[22:26:28] [PASSED] 32 VFs
[22:26:28] [PASSED] 33 VFs
[22:26:28] [PASSED] 34 VFs
[22:26:28] [PASSED] 35 VFs
[22:26:28] [PASSED] 36 VFs
[22:26:28] [PASSED] 37 VFs
[22:26:28] [PASSED] 38 VFs
[22:26:28] [PASSED] 39 VFs
[22:26:28] [PASSED] 40 VFs
[22:26:28] [PASSED] 41 VFs
[22:26:28] [PASSED] 42 VFs
[22:26:28] [PASSED] 43 VFs
[22:26:28] [PASSED] 44 VFs
[22:26:28] [PASSED] 45 VFs
[22:26:28] [PASSED] 46 VFs
[22:26:28] [PASSED] 47 VFs
[22:26:28] [PASSED] 48 VFs
[22:26:28] [PASSED] 49 VFs
[22:26:28] [PASSED] 50 VFs
[22:26:28] [PASSED] 51 VFs
[22:26:28] [PASSED] 52 VFs
[22:26:28] [PASSED] 53 VFs
[22:26:28] [PASSED] 54 VFs
[22:26:28] [PASSED] 55 VFs
[22:26:28] [PASSED] 56 VFs
[22:26:28] [PASSED] 57 VFs
[22:26:28] [PASSED] 58 VFs
[22:26:28] [PASSED] 59 VFs
[22:26:28] [PASSED] 60 VFs
[22:26:28] [PASSED] 61 VFs
[22:26:28] [PASSED] 62 VFs
[22:26:28] [PASSED] 63 VFs
[22:26:28] ==================== [PASSED] fair_ggtt ====================
[22:26:28]     # module: xe
[22:26:28] # pf_gt_config: pass:3 fail:3 skip:0 total:6
[22:26:28] # Totals: pass:189 fail:3 skip:0 total:192
[22:26:28] ================== [FAILED] pf_gt_config ===================
[22:26:28] ===================== lmtt (1 subtest) =====================
[22:26:28] ======================== test_ops  =========================
[22:26:28] [PASSED] 2-level
[22:26:28] [PASSED] multi-level
[22:26:28] ==================== [PASSED] test_ops =====================
[22:26:28] ====================== [PASSED] lmtt =======================
[22:26:28] ================= pf_service (11 subtests) =================
[22:26:28] [PASSED] pf_negotiate_any
[22:26:28] [PASSED] pf_negotiate_base_match
[22:26:28] [PASSED] pf_negotiate_base_newer
[22:26:28] [PASSED] pf_negotiate_base_next
[22:26:28] [SKIPPED] pf_negotiate_base_older
[22:26:28] [PASSED] pf_negotiate_base_prev
[22:26:28] [PASSED] pf_negotiate_latest_match
[22:26:28] [PASSED] pf_negotiate_latest_newer
[22:26:28] [PASSED] pf_negotiate_latest_next
[22:26:28] [SKIPPED] pf_negotiate_latest_older
[22:26:28] [SKIPPED] pf_negotiate_latest_prev
[22:26:28] =================== [PASSED] pf_service ====================
[22:26:28] ================= xe_guc_g2g (2 subtests) ==================
[22:26:28] ============== xe_live_guc_g2g_kunit_default  ==============
[22:26:28] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[22:26:28] ============== xe_live_guc_g2g_kunit_allmem  ===============
[22:26:28] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[22:26:28] =================== [SKIPPED] xe_guc_g2g ===================
[22:26:28] =================== xe_mocs (2 subtests) ===================
[22:26:28] ================ xe_live_mocs_kernel_kunit  ================
[22:26:28] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[22:26:28] ================ xe_live_mocs_reset_kunit  =================
[22:26:28] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[22:26:28] ==================== [SKIPPED] xe_mocs =====================
[22:26:28] ================= xe_migrate (2 subtests) ==================
[22:26:28] ================= xe_migrate_sanity_kunit  =================
[22:26:28] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[22:26:28] ================== xe_validate_ccs_kunit  ==================
[22:26:28] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[22:26:28] =================== [SKIPPED] xe_migrate ===================
[22:26:28] ================== xe_dma_buf (1 subtest) ==================
[22:26:28] ==================== xe_dma_buf_kunit  =====================
[22:26:28] ================ [SKIPPED] xe_dma_buf_kunit ================
[22:26:28] =================== [SKIPPED] xe_dma_buf ===================
[22:26:28] ================= xe_bo_shrink (1 subtest) =================
[22:26:28] =================== xe_bo_shrink_kunit  ====================
[22:26:28] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[22:26:28] ================== [SKIPPED] xe_bo_shrink ==================
[22:26:28] ==================== xe_bo (2 subtests) ====================
[22:26:28] ================== xe_ccs_migrate_kunit  ===================
[22:26:28] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[22:26:28] ==================== xe_bo_evict_kunit  ====================
[22:26:28] =============== [SKIPPED] xe_bo_evict_kunit ================
[22:26:28] ===================== [SKIPPED] xe_bo ======================
[22:26:28] ==================== args (13 subtests) ====================
[22:26:28] [PASSED] count_args_test
[22:26:28] [PASSED] call_args_example
[22:26:28] [PASSED] call_args_test
[22:26:28] [PASSED] drop_first_arg_example
[22:26:28] [PASSED] drop_first_arg_test
[22:26:28] [PASSED] first_arg_example
[22:26:28] [PASSED] first_arg_test
[22:26:28] [PASSED] last_arg_example
[22:26:28] [PASSED] last_arg_test
[22:26:28] [PASSED] pick_arg_example
[22:26:28] [PASSED] if_args_example
[22:26:28] [PASSED] if_args_test
[22:26:28] [PASSED] sep_comma_example
[22:26:28] ====================== [PASSED] args =======================
[22:26:28] =================== xe_pci (3 subtests) ====================
[22:26:28] ==================== check_graphics_ip  ====================
[22:26:28] [PASSED] 12.00 Xe_LP
[22:26:28] [PASSED] 12.10 Xe_LP+
[22:26:28] [PASSED] 12.55 Xe_HPG
[22:26:28] [PASSED] 12.60 Xe_HPC
[22:26:28] [PASSED] 12.70 Xe_LPG
[22:26:28] [PASSED] 12.71 Xe_LPG
[22:26:28] [PASSED] 12.74 Xe_LPG+
[22:26:28] [PASSED] 20.01 Xe2_HPG
[22:26:28] [PASSED] 20.02 Xe2_HPG
[22:26:28] [PASSED] 20.04 Xe2_LPG
[22:26:28] [PASSED] 30.00 Xe3_LPG
[22:26:28] [PASSED] 30.01 Xe3_LPG
[22:26:28] [PASSED] 30.03 Xe3_LPG
[22:26:28] [PASSED] 30.04 Xe3_LPG
[22:26:28] [PASSED] 30.05 Xe3_LPG
[22:26:28] [PASSED] 35.11 Xe3p_XPC
[22:26:28] ================ [PASSED] check_graphics_ip ================
[22:26:28] ===================== check_media_ip  ======================
[22:26:28] [PASSED] 12.00 Xe_M
[22:26:28] [PASSED] 12.55 Xe_HPM
[22:26:28] [PASSED] 13.00 Xe_LPM+
[22:26:28] [PASSED] 13.01 Xe2_HPM
[22:26:28] [PASSED] 20.00 Xe2_LPM
[22:26:28] [PASSED] 30.00 Xe3_LPM
[22:26:28] [PASSED] 30.02 Xe3_LPM
[22:26:28] [PASSED] 35.00 Xe3p_LPM
[22:26:28] [PASSED] 35.03 Xe3p_HPM
[22:26:28] ================= [PASSED] check_media_ip ==================
[22:26:28] =================== check_platform_desc  ===================
[22:26:28] [PASSED] 0x9A60 (TIGERLAKE)
[22:26:28] [PASSED] 0x9A68 (TIGERLAKE)
[22:26:28] [PASSED] 0x9A70 (TIGERLAKE)
[22:26:28] [PASSED] 0x9A40 (TIGERLAKE)
[22:26:28] [PASSED] 0x9A49 (TIGERLAKE)
[22:26:28] [PASSED] 0x9A59 (TIGERLAKE)
[22:26:28] [PASSED] 0x9A78 (TIGERLAKE)
[22:26:28] [PASSED] 0x9AC0 (TIGERLAKE)
[22:26:28] [PASSED] 0x9AC9 (TIGERLAKE)
[22:26:28] [PASSED] 0x9AD9 (TIGERLAKE)
[22:26:28] [PASSED] 0x9AF8 (TIGERLAKE)
[22:26:28] [PASSED] 0x4C80 (ROCKETLAKE)
[22:26:28] [PASSED] 0x4C8A (ROCKETLAKE)
[22:26:28] [PASSED] 0x4C8B (ROCKETLAKE)
[22:26:28] [PASSED] 0x4C8C (ROCKETLAKE)
[22:26:28] [PASSED] 0x4C90 (ROCKETLAKE)
[22:26:28] [PASSED] 0x4C9A (ROCKETLAKE)
[22:26:28] [PASSED] 0x4680 (ALDERLAKE_S)
[22:26:28] [PASSED] 0x4682 (ALDERLAKE_S)
[22:26:28] [PASSED] 0x4688 (ALDERLAKE_S)
[22:26:28] [PASSED] 0x468A (ALDERLAKE_S)
[22:26:28] [PASSED] 0x468B (ALDERLAKE_S)
[22:26:28] [PASSED] 0x4690 (ALDERLAKE_S)
[22:26:28] [PASSED] 0x4692 (ALDERLAKE_S)
[22:26:28] [PASSED] 0x4693 (ALDERLAKE_S)
[22:26:28] [PASSED] 0x46A0 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46A1 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46A2 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46A3 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46A6 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46A8 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46AA (ALDERLAKE_P)
[22:26:28] [PASSED] 0x462A (ALDERLAKE_P)
[22:26:28] [PASSED] 0x4626 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x4628 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46B0 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46B1 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46B2 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46B3 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46C0 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46C1 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46C2 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46C3 (ALDERLAKE_P)
[22:26:28] [PASSED] 0x46D0 (ALDERLAKE_N)
[22:26:28] [PASSED] 0x46D1 (ALDERLAKE_N)
[22:26:28] [PASSED] 0x46D2 (ALDERLAKE_N)
[22:26:28] [PASSED] 0x46D3 (ALDERLAKE_N)
[22:26:28] [PASSED] 0x46D4 (ALDERLAKE_N)
[22:26:28] [PASSED] 0xA721 (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7A1 (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7A9 (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7AC (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7AD (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA720 (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7A0 (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7A8 (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7AA (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA7AB (ALDERLAKE_P)
[22:26:28] [PASSED] 0xA780 (ALDERLAKE_S)
[22:26:28] [PASSED] 0xA781 (ALDERLAKE_S)
[22:26:28] [PASSED] 0xA782 (ALDERLAKE_S)
[22:26:28] [PASSED] 0xA783 (ALDERLAKE_S)
[22:26:28] [PASSED] 0xA788 (ALDERLAKE_S)
[22:26:28] [PASSED] 0xA789 (ALDERLAKE_S)
[22:26:28] [PASSED] 0xA78A (ALDERLAKE_S)
[22:26:28] [PASSED] 0xA78B (ALDERLAKE_S)
[22:26:28] [PASSED] 0x4905 (DG1)
[22:26:28] [PASSED] 0x4906 (DG1)
[22:26:28] [PASSED] 0x4907 (DG1)
[22:26:28] [PASSED] 0x4908 (DG1)
[22:26:28] [PASSED] 0x4909 (DG1)
[22:26:28] [PASSED] 0x56C0 (DG2)
[22:26:28] [PASSED] 0x56C2 (DG2)
[22:26:28] [PASSED] 0x56C1 (DG2)
[22:26:28] [PASSED] 0x7D51 (METEORLAKE)
[22:26:28] [PASSED] 0x7DD1 (METEORLAKE)
[22:26:28] [PASSED] 0x7D41 (METEORLAKE)
[22:26:28] [PASSED] 0x7D67 (METEORLAKE)
[22:26:28] [PASSED] 0xB640 (METEORLAKE)
[22:26:28] [PASSED] 0x56A0 (DG2)
[22:26:28] [PASSED] 0x56A1 (DG2)
[22:26:28] [PASSED] 0x56A2 (DG2)
[22:26:28] [PASSED] 0x56BE (DG2)
[22:26:28] [PASSED] 0x56BF (DG2)
[22:26:28] [PASSED] 0x5690 (DG2)
[22:26:28] [PASSED] 0x5691 (DG2)
[22:26:28] [PASSED] 0x5692 (DG2)
[22:26:28] [PASSED] 0x56A5 (DG2)
[22:26:28] [PASSED] 0x56A6 (DG2)
[22:26:28] [PASSED] 0x56B0 (DG2)
[22:26:28] [PASSED] 0x56B1 (DG2)
[22:26:28] [PASSED] 0x56BA (DG2)
[22:26:28] [PASSED] 0x56BB (DG2)
[22:26:28] [PASSED] 0x56BC (DG2)
[22:26:28] [PASSED] 0x56BD (DG2)
[22:26:28] [PASSED] 0x5693 (DG2)
[22:26:28] [PASSED] 0x5694 (DG2)
[22:26:28] [PASSED] 0x5695 (DG2)
[22:26:28] [PASSED] 0x56A3 (DG2)
[22:26:28] [PASSED] 0x56A4 (DG2)
[22:26:28] [PASSED] 0x56B2 (DG2)
[22:26:28] [PASSED] 0x56B3 (DG2)
[22:26:28] [PASSED] 0x5696 (DG2)
[22:26:28] [PASSED] 0x5697 (DG2)
[22:26:28] [PASSED] 0xB69 (PVC)
[22:26:28] [PASSED] 0xB6E (PVC)
[22:26:28] [PASSED] 0xBD4 (PVC)
[22:26:28] [PASSED] 0xBD5 (PVC)
[22:26:28] [PASSED] 0xBD6 (PVC)
[22:26:28] [PASSED] 0xBD7 (PVC)
[22:26:28] [PASSED] 0xBD8 (PVC)
[22:26:28] [PASSED] 0xBD9 (PVC)
[22:26:28] [PASSED] 0xBDA (PVC)
[22:26:28] [PASSED] 0xBDB (PVC)
[22:26:28] [PASSED] 0xBE0 (PVC)
[22:26:28] [PASSED] 0xBE1 (PVC)
[22:26:28] [PASSED] 0xBE5 (PVC)
[22:26:28] [PASSED] 0x7D40 (METEORLAKE)
[22:26:28] [PASSED] 0x7D45 (METEORLAKE)
[22:26:28] [PASSED] 0x7D55 (METEORLAKE)
[22:26:28] [PASSED] 0x7D60 (METEORLAKE)
[22:26:28] [PASSED] 0x7DD5 (METEORLAKE)
[22:26:28] [PASSED] 0x6420 (LUNARLAKE)
[22:26:28] [PASSED] 0x64A0 (LUNARLAKE)
[22:26:28] [PASSED] 0x64B0 (LUNARLAKE)
[22:26:28] [PASSED] 0xE202 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE209 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE20B (BATTLEMAGE)
[22:26:28] [PASSED] 0xE20C (BATTLEMAGE)
[22:26:28] [PASSED] 0xE20D (BATTLEMAGE)
[22:26:28] [PASSED] 0xE210 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE211 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE212 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE216 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE220 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE221 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE222 (BATTLEMAGE)
[22:26:28] [PASSED] 0xE223 (BATTLEMAGE)
[22:26:28] [PASSED] 0xB080 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB081 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB082 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB083 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB084 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB085 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB086 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB087 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB08F (PANTHERLAKE)
[22:26:28] [PASSED] 0xB090 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB0A0 (PANTHERLAKE)
[22:26:28] [PASSED] 0xB0B0 (PANTHERLAKE)
[22:26:28] [PASSED] 0xFD80 (PANTHERLAKE)
[22:26:28] [PASSED] 0xFD81 (PANTHERLAKE)
[22:26:28] [PASSED] 0xD740 (NOVALAKE_S)
[22:26:28] [PASSED] 0xD741 (NOVALAKE_S)
[22:26:28] [PASSED] 0xD742 (NOVALAKE_S)
[22:26:28] [PASSED] 0xD743 (NOVALAKE_S)
[22:26:28] [PASSED] 0xD744 (NOVALAKE_S)
[22:26:28] [PASSED] 0xD745 (NOVALAKE_S)
[22:26:28] [PASSED] 0x674C (CRESCENTISLAND)
[22:26:28] =============== [PASSED] check_platform_desc ===============
[22:26:28] ===================== [PASSED] xe_pci ======================
[22:26:28] =================== xe_rtp (2 subtests) ====================
[22:26:28] =============== xe_rtp_process_to_sr_tests  ================
[22:26:28] [PASSED] coalesce-same-reg
[22:26:28] [PASSED] no-match-no-add
[22:26:28] [PASSED] match-or
[22:26:28] [PASSED] match-or-xfail
[22:26:28] [PASSED] no-match-no-add-multiple-rules
[22:26:28] [PASSED] two-regs-two-entries
[22:26:28] [PASSED] clr-one-set-other
[22:26:28] [PASSED] set-field
[22:26:28] [PASSED] conflict-duplicate
[22:26:28] [PASSED] conflict-not-disjoint
[22:26:28] [PASSED] conflict-reg-type
[22:26:28] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[22:26:28] ================== xe_rtp_process_tests  ===================
[22:26:28] [PASSED] active1
[22:26:28] [PASSED] active2
[22:26:28] [PASSED] active-inactive
[22:26:28] [PASSED] inactive-active
[22:26:28] [PASSED] inactive-1st_or_active-inactive
[22:26:28] [PASSED] inactive-2nd_or_active-inactive
[22:26:28] [PASSED] inactive-last_or_active-inactive
[22:26:28] [PASSED] inactive-no_or_active-inactive
[22:26:28] ============== [PASSED] xe_rtp_process_tests ===============
[22:26:28] ===================== [PASSED] xe_rtp ======================
[22:26:28] ==================== xe_wa (1 subtest) =====================
[22:26:28] ======================== xe_wa_gt  =========================
[22:26:28] [PASSED] TIGERLAKE B0
stty: 'standard input': Inappropriate ioctl for device
[22:26:28] [PASSED] DG1 A0
[22:26:28] [PASSED] DG1 B0
[22:26:28] [PASSED] ALDERLAKE_S A0
[22:26:28] [PASSED] ALDERLAKE_S B0
[22:26:28] [PASSED] ALDERLAKE_S C0
[22:26:28] [PASSED] ALDERLAKE_S D0
[22:26:28] [PASSED] ALDERLAKE_P A0
[22:26:28] [PASSED] ALDERLAKE_P B0
[22:26:28] [PASSED] ALDERLAKE_P C0
[22:26:28] [PASSED] ALDERLAKE_S RPLS D0
[22:26:28] [PASSED] ALDERLAKE_P RPLU E0
[22:26:28] [PASSED] DG2 G10 C0
[22:26:28] [PASSED] DG2 G11 B1
[22:26:28] [PASSED] DG2 G12 A1
[22:26:28] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:26:28] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:26:28] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[22:26:28] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[22:26:28] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[22:26:28] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[22:26:28] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[22:26:28] ==================== [PASSED] xe_wa_gt =====================
[22:26:28] ====================== [PASSED] xe_wa ======================
[22:26:28] ============================================================
[22:26:28] Testing complete. Ran 512 tests: passed: 491, failed: 3, skipped: 18
[22:26:28] Failures: pf_gt_config.fair_contexts_1vf, pf_gt_config.fair_doorbells_1vf, pf_gt_config.fair_ggtt_1vf
[22:26:28] Elapsed time: 36.486s total, 4.261s configuring, 31.708s building, 0.474s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


