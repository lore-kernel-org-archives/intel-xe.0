Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A05C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 04:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CE610E2DE;
	Wed,  1 Jul 2026 04:22:36 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6755410E2DE;
 Wed,  1 Jul 2026 04:22:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/guc=5Fads=3A_allocate_U?=
 =?utf-8?q?M_queues_in_a_separate_UC_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 04:22:35 -0000
Message-ID: <178287975541.135220.2880422709871702048@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701041459.2151262-1-jia.yao@intel.com>
In-Reply-To: <20260701041459.2151262-1-jia.yao@intel.com>
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

Series: drm/xe/guc_ads: allocate UM queues in a separate UC BO
URL   : https://patchwork.freedesktop.org/series/169535/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[04:21:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:21:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
../drivers/gpu/drm/xe/xe_pt.c:1418:13: warning: ‘xe_pt_svm_userptr_notifier_lock’ defined but not used [-Wunused-function]
 1418 | static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[04:21:51] Starting KUnit Kernel (1/1)...
[04:21:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:21:51] ================== guc_buf (11 subtests) ===================
[04:21:51] [PASSED] test_smallest
[04:21:51] [PASSED] test_largest
[04:21:51] [PASSED] test_granular
[04:21:51] [PASSED] test_unique
[04:21:51] [PASSED] test_overlap
[04:21:51] [PASSED] test_reusable
[04:21:51] [PASSED] test_too_big
[04:21:51] [PASSED] test_flush
[04:21:51] [PASSED] test_lookup
[04:21:51] [PASSED] test_data
[04:21:51] [PASSED] test_class
[04:21:51] ===================== [PASSED] guc_buf =====================
[04:21:51] =================== guc_dbm (7 subtests) ===================
[04:21:51] [PASSED] test_empty
[04:21:51] [PASSED] test_default
[04:21:51] ======================== test_size  ========================
[04:21:51] [PASSED] 4
[04:21:51] [PASSED] 8
[04:21:51] [PASSED] 32
[04:21:51] [PASSED] 256
[04:21:51] ==================== [PASSED] test_size ====================
[04:21:51] ======================= test_reuse  ========================
[04:21:51] [PASSED] 4
[04:21:51] [PASSED] 8
[04:21:51] [PASSED] 32
[04:21:51] [PASSED] 256
[04:21:51] =================== [PASSED] test_reuse ====================
[04:21:51] =================== test_range_overlap  ====================
[04:21:51] [PASSED] 4
[04:21:51] [PASSED] 8
[04:21:51] [PASSED] 32
[04:21:51] [PASSED] 256
[04:21:51] =============== [PASSED] test_range_overlap ================
[04:21:51] =================== test_range_compact  ====================
[04:21:51] [PASSED] 4
[04:21:51] [PASSED] 8
[04:21:51] [PASSED] 32
[04:21:51] [PASSED] 256
[04:21:51] =============== [PASSED] test_range_compact ================
[04:21:51] ==================== test_range_spare  =====================
[04:21:51] [PASSED] 4
[04:21:51] [PASSED] 8
[04:21:51] [PASSED] 32
[04:21:51] [PASSED] 256
[04:21:51] ================ [PASSED] test_range_spare =================
[04:21:51] ===================== [PASSED] guc_dbm =====================
[04:21:51] =================== guc_idm (6 subtests) ===================
[04:21:51] [PASSED] bad_init
[04:21:51] [PASSED] no_init
[04:21:51] [PASSED] init_fini
[04:21:51] [PASSED] check_used
[04:21:51] [PASSED] check_quota
[04:21:51] [PASSED] check_all
[04:21:51] ===================== [PASSED] guc_idm =====================
[04:21:51] ================== no_relay (3 subtests) ===================
[04:21:51] [PASSED] xe_drops_guc2pf_if_not_ready
[04:21:51] [PASSED] xe_drops_guc2vf_if_not_ready
[04:21:51] [PASSED] xe_rejects_send_if_not_ready
[04:21:51] ==================== [PASSED] no_relay =====================
[04:21:51] ================== pf_relay (14 subtests) ==================
[04:21:51] [PASSED] pf_rejects_guc2pf_too_short
[04:21:51] [PASSED] pf_rejects_guc2pf_too_long
[04:21:51] [PASSED] pf_rejects_guc2pf_no_payload
[04:21:51] [PASSED] pf_fails_no_payload
[04:21:51] [PASSED] pf_fails_bad_origin
[04:21:51] [PASSED] pf_fails_bad_type
[04:21:51] [PASSED] pf_txn_reports_error
[04:21:51] [PASSED] pf_txn_sends_pf2guc
[04:21:51] [PASSED] pf_sends_pf2guc
[04:21:51] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:21:51] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:21:51] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:21:51] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:21:51] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:21:51] ==================== [PASSED] pf_relay =====================
[04:21:51] ================== vf_relay (3 subtests) ===================
[04:21:51] [PASSED] vf_rejects_guc2vf_too_short
[04:21:51] [PASSED] vf_rejects_guc2vf_too_long
[04:21:51] [PASSED] vf_rejects_guc2vf_no_payload
[04:21:51] ==================== [PASSED] vf_relay =====================
[04:21:51] ================ pf_gt_config (9 subtests) =================
[04:21:51] [PASSED] fair_contexts_1vf
[04:21:51] [PASSED] fair_doorbells_1vf
[04:21:51] [PASSED] fair_ggtt_1vf
[04:21:51] ====================== fair_vram_1vf  ======================
[04:21:51] [PASSED] 3.50 GiB
[04:21:51] [PASSED] 11.5 GiB
[04:21:51] [PASSED] 15.5 GiB
[04:21:51] [PASSED] 31.5 GiB
[04:21:51] [PASSED] 63.5 GiB
[04:21:51] [PASSED] 1.91 GiB
[04:21:51] ================== [PASSED] fair_vram_1vf ==================
[04:21:51] ================ fair_vram_1vf_admin_only  =================
[04:21:51] [PASSED] 3.50 GiB
[04:21:51] [PASSED] 11.5 GiB
[04:21:51] [PASSED] 15.5 GiB
[04:21:51] [PASSED] 31.5 GiB
[04:21:51] [PASSED] 63.5 GiB
[04:21:51] [PASSED] 1.91 GiB
[04:21:51] ============ [PASSED] fair_vram_1vf_admin_only =============
[04:21:51] ====================== fair_contexts  ======================
[04:21:51] [PASSED] 1 VF
[04:21:51] [PASSED] 2 VFs
[04:21:51] [PASSED] 3 VFs
[04:21:51] [PASSED] 4 VFs
[04:21:51] [PASSED] 5 VFs
[04:21:51] [PASSED] 6 VFs
[04:21:51] [PASSED] 7 VFs
[04:21:51] [PASSED] 8 VFs
[04:21:51] [PASSED] 9 VFs
[04:21:51] [PASSED] 10 VFs
[04:21:51] [PASSED] 11 VFs
[04:21:51] [PASSED] 12 VFs
[04:21:51] [PASSED] 13 VFs
[04:21:51] [PASSED] 14 VFs
[04:21:51] [PASSED] 15 VFs
[04:21:51] [PASSED] 16 VFs
[04:21:51] [PASSED] 17 VFs
[04:21:51] [PASSED] 18 VFs
[04:21:51] [PASSED] 19 VFs
[04:21:51] [PASSED] 20 VFs
[04:21:51] [PASSED] 21 VFs
[04:21:51] [PASSED] 22 VFs
[04:21:51] [PASSED] 23 VFs
[04:21:51] [PASSED] 24 VFs
[04:21:51] [PASSED] 25 VFs
[04:21:51] [PASSED] 26 VFs
[04:21:51] [PASSED] 27 VFs
[04:21:51] [PASSED] 28 VFs
[04:21:51] [PASSED] 29 VFs
[04:21:51] [PASSED] 30 VFs
[04:21:51] [PASSED] 31 VFs
[04:21:51] [PASSED] 32 VFs
[04:21:51] [PASSED] 33 VFs
[04:21:51] [PASSED] 34 VFs
[04:21:51] [PASSED] 35 VFs
[04:21:51] [PASSED] 36 VFs
[04:21:51] [PASSED] 37 VFs
[04:21:51] [PASSED] 38 VFs
[04:21:51] [PASSED] 39 VFs
[04:21:51] [PASSED] 40 VFs
[04:21:51] [PASSED] 41 VFs
[04:21:51] [PASSED] 42 VFs
[04:21:51] [PASSED] 43 VFs
[04:21:51] [PASSED] 44 VFs
[04:21:51] [PASSED] 45 VFs
[04:21:51] [PASSED] 46 VFs
[04:21:51] [PASSED] 47 VFs
[04:21:51] [PASSED] 48 VFs
[04:21:51] [PASSED] 49 VFs
[04:21:51] [PASSED] 50 VFs
[04:21:51] [PASSED] 51 VFs
[04:21:51] [PASSED] 52 VFs
[04:21:51] [PASSED] 53 VFs
[04:21:51] [PASSED] 54 VFs
[04:21:51] [PASSED] 55 VFs
[04:21:51] [PASSED] 56 VFs
[04:21:51] [PASSED] 57 VFs
[04:21:51] [PASSED] 58 VFs
[04:21:51] [PASSED] 59 VFs
[04:21:51] [PASSED] 60 VFs
[04:21:51] [PASSED] 61 VFs
[04:21:51] [PASSED] 62 VFs
[04:21:51] [PASSED] 63 VFs
[04:21:51] ================== [PASSED] fair_contexts ==================
[04:21:51] ===================== fair_doorbells  ======================
[04:21:51] [PASSED] 1 VF
[04:21:51] [PASSED] 2 VFs
[04:21:51] [PASSED] 3 VFs
[04:21:51] [PASSED] 4 VFs
[04:21:51] [PASSED] 5 VFs
[04:21:51] [PASSED] 6 VFs
[04:21:51] [PASSED] 7 VFs
[04:21:51] [PASSED] 8 VFs
[04:21:51] [PASSED] 9 VFs
[04:21:51] [PASSED] 10 VFs
[04:21:51] [PASSED] 11 VFs
[04:21:51] [PASSED] 12 VFs
[04:21:51] [PASSED] 13 VFs
[04:21:51] [PASSED] 14 VFs
[04:21:51] [PASSED] 15 VFs
[04:21:51] [PASSED] 16 VFs
[04:21:51] [PASSED] 17 VFs
[04:21:51] [PASSED] 18 VFs
[04:21:51] [PASSED] 19 VFs
[04:21:51] [PASSED] 20 VFs
[04:21:51] [PASSED] 21 VFs
[04:21:51] [PASSED] 22 VFs
[04:21:51] [PASSED] 23 VFs
[04:21:51] [PASSED] 24 VFs
[04:21:51] [PASSED] 25 VFs
[04:21:51] [PASSED] 26 VFs
[04:21:51] [PASSED] 27 VFs
[04:21:51] [PASSED] 28 VFs
[04:21:51] [PASSED] 29 VFs
[04:21:51] [PASSED] 30 VFs
[04:21:51] [PASSED] 31 VFs
[04:21:51] [PASSED] 32 VFs
[04:21:51] [PASSED] 33 VFs
[04:21:51] [PASSED] 34 VFs
[04:21:51] [PASSED] 35 VFs
[04:21:51] [PASSED] 36 VFs
[04:21:51] [PASSED] 37 VFs
[04:21:51] [PASSED] 38 VFs
[04:21:51] [PASSED] 39 VFs
[04:21:51] [PASSED] 40 VFs
[04:21:51] [PASSED] 41 VFs
[04:21:51] [PASSED] 42 VFs
[04:21:51] [PASSED] 43 VFs
[04:21:51] [PASSED] 44 VFs
[04:21:51] [PASSED] 45 VFs
[04:21:51] [PASSED] 46 VFs
[04:21:51] [PASSED] 47 VFs
[04:21:51] [PASSED] 48 VFs
[04:21:51] [PASSED] 49 VFs
[04:21:51] [PASSED] 50 VFs
[04:21:51] [PASSED] 51 VFs
[04:21:51] [PASSED] 52 VFs
[04:21:51] [PASSED] 53 VFs
[04:21:51] [PASSED] 54 VFs
[04:21:51] [PASSED] 55 VFs
[04:21:51] [PASSED] 56 VFs
[04:21:51] [PASSED] 57 VFs
[04:21:51] [PASSED] 58 VFs
[04:21:51] [PASSED] 59 VFs
[04:21:51] [PASSED] 60 VFs
[04:21:51] [PASSED] 61 VFs
[04:21:51] [PASSED] 62 VFs
[04:21:51] [PASSED] 63 VFs
[04:21:51] ================= [PASSED] fair_doorbells ==================
[04:21:51] ======================== fair_ggtt  ========================
[04:21:51] [PASSED] 1 VF
[04:21:51] [PASSED] 2 VFs
[04:21:51] [PASSED] 3 VFs
[04:21:51] [PASSED] 4 VFs
[04:21:51] [PASSED] 5 VFs
[04:21:51] [PASSED] 6 VFs
[04:21:51] [PASSED] 7 VFs
[04:21:51] [PASSED] 8 VFs
[04:21:51] [PASSED] 9 VFs
[04:21:51] [PASSED] 10 VFs
[04:21:51] [PASSED] 11 VFs
[04:21:51] [PASSED] 12 VFs
[04:21:51] [PASSED] 13 VFs
[04:21:51] [PASSED] 14 VFs
[04:21:51] [PASSED] 15 VFs
[04:21:51] [PASSED] 16 VFs
[04:21:51] [PASSED] 17 VFs
[04:21:51] [PASSED] 18 VFs
[04:21:51] [PASSED] 19 VFs
[04:21:51] [PASSED] 20 VFs
[04:21:51] [PASSED] 21 VFs
[04:21:51] [PASSED] 22 VFs
[04:21:51] [PASSED] 23 VFs
[04:21:51] [PASSED] 24 VFs
[04:21:52] [PASSED] 25 VFs
[04:21:52] [PASSED] 26 VFs
[04:21:52] [PASSED] 27 VFs
[04:21:52] [PASSED] 28 VFs
[04:21:52] [PASSED] 29 VFs
[04:21:52] [PASSED] 30 VFs
[04:21:52] [PASSED] 31 VFs
[04:21:52] [PASSED] 32 VFs
[04:21:52] [PASSED] 33 VFs
[04:21:52] [PASSED] 34 VFs
[04:21:52] [PASSED] 35 VFs
[04:21:52] [PASSED] 36 VFs
[04:21:52] [PASSED] 37 VFs
[04:21:52] [PASSED] 38 VFs
[04:21:52] [PASSED] 39 VFs
[04:21:52] [PASSED] 40 VFs
[04:21:52] [PASSED] 41 VFs
[04:21:52] [PASSED] 42 VFs
[04:21:52] [PASSED] 43 VFs
[04:21:52] [PASSED] 44 VFs
[04:21:52] [PASSED] 45 VFs
[04:21:52] [PASSED] 46 VFs
[04:21:52] [PASSED] 47 VFs
[04:21:52] [PASSED] 48 VFs
[04:21:52] [PASSED] 49 VFs
[04:21:52] [PASSED] 50 VFs
[04:21:52] [PASSED] 51 VFs
[04:21:52] [PASSED] 52 VFs
[04:21:52] [PASSED] 53 VFs
[04:21:52] [PASSED] 54 VFs
[04:21:52] [PASSED] 55 VFs
[04:21:52] [PASSED] 56 VFs
[04:21:52] [PASSED] 57 VFs
[04:21:52] [PASSED] 58 VFs
[04:21:52] [PASSED] 59 VFs
[04:21:52] [PASSED] 60 VFs
[04:21:52] [PASSED] 61 VFs
[04:21:52] [PASSED] 62 VFs
[04:21:52] [PASSED] 63 VFs
[04:21:52] ==================== [PASSED] fair_ggtt ====================
[04:21:52] ======================== fair_vram  ========================
[04:21:52] [PASSED] 1 VF
[04:21:52] [PASSED] 2 VFs
[04:21:52] [PASSED] 3 VFs
[04:21:52] [PASSED] 4 VFs
[04:21:52] [PASSED] 5 VFs
[04:21:52] [PASSED] 6 VFs
[04:21:52] [PASSED] 7 VFs
[04:21:52] [PASSED] 8 VFs
[04:21:52] [PASSED] 9 VFs
[04:21:52] [PASSED] 10 VFs
[04:21:52] [PASSED] 11 VFs
[04:21:52] [PASSED] 12 VFs
[04:21:52] [PASSED] 13 VFs
[04:21:52] [PASSED] 14 VFs
[04:21:52] [PASSED] 15 VFs
[04:21:52] [PASSED] 16 VFs
[04:21:52] [PASSED] 17 VFs
[04:21:52] [PASSED] 18 VFs
[04:21:52] [PASSED] 19 VFs
[04:21:52] [PASSED] 20 VFs
[04:21:52] [PASSED] 21 VFs
[04:21:52] [PASSED] 22 VFs
[04:21:52] [PASSED] 23 VFs
[04:21:52] [PASSED] 24 VFs
[04:21:52] [PASSED] 25 VFs
[04:21:52] [PASSED] 26 VFs
[04:21:52] [PASSED] 27 VFs
[04:21:52] [PASSED] 28 VFs
[04:21:52] [PASSED] 29 VFs
[04:21:52] [PASSED] 30 VFs
[04:21:52] [PASSED] 31 VFs
[04:21:52] [PASSED] 32 VFs
[04:21:52] [PASSED] 33 VFs
[04:21:52] [PASSED] 34 VFs
[04:21:52] [PASSED] 35 VFs
[04:21:52] [PASSED] 36 VFs
[04:21:52] [PASSED] 37 VFs
[04:21:52] [PASSED] 38 VFs
[04:21:52] [PASSED] 39 VFs
[04:21:52] [PASSED] 40 VFs
[04:21:52] [PASSED] 41 VFs
[04:21:52] [PASSED] 42 VFs
[04:21:52] [PASSED] 43 VFs
[04:21:52] [PASSED] 44 VFs
[04:21:52] [PASSED] 45 VFs
[04:21:52] [PASSED] 46 VFs
[04:21:52] [PASSED] 47 VFs
[04:21:52] [PASSED] 48 VFs
[04:21:52] [PASSED] 49 VFs
[04:21:52] [PASSED] 50 VFs
[04:21:52] [PASSED] 51 VFs
[04:21:52] [PASSED] 52 VFs
[04:21:52] [PASSED] 53 VFs
[04:21:52] [PASSED] 54 VFs
[04:21:52] [PASSED] 55 VFs
[04:21:52] [PASSED] 56 VFs
[04:21:52] [PASSED] 57 VFs
[04:21:52] [PASSED] 58 VFs
[04:21:52] [PASSED] 59 VFs
[04:21:52] [PASSED] 60 VFs
[04:21:52] [PASSED] 61 VFs
[04:21:52] [PASSED] 62 VFs
[04:21:52] [PASSED] 63 VFs
[04:21:52] ==================== [PASSED] fair_vram ====================
[04:21:52] ================== [PASSED] pf_gt_config ===================
[04:21:52] ===================== lmtt (1 subtest) =====================
[04:21:52] ======================== test_ops  =========================
[04:21:52] [PASSED] 2-level
[04:21:52] [PASSED] multi-level
[04:21:52] ==================== [PASSED] test_ops =====================
[04:21:52] ====================== [PASSED] lmtt =======================
[04:21:52] ================= pf_service (11 subtests) =================
[04:21:52] [PASSED] pf_negotiate_any
[04:21:52] [PASSED] pf_negotiate_base_match
[04:21:52] [PASSED] pf_negotiate_base_newer
[04:21:52] [PASSED] pf_negotiate_base_next
[04:21:52] [SKIPPED] pf_negotiate_base_older (no older minor)
[04:21:52] [PASSED] pf_negotiate_base_prev
[04:21:52] [PASSED] pf_negotiate_latest_match
[04:21:52] [PASSED] pf_negotiate_latest_newer
[04:21:52] [PASSED] pf_negotiate_latest_next
[04:21:52] [SKIPPED] pf_negotiate_latest_older (no older minor)
[04:21:52] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[04:21:52] =================== [PASSED] pf_service ====================
[04:21:52] ================= xe_guc_g2g (2 subtests) ==================
[04:21:52] ============== xe_live_guc_g2g_kunit_default  ==============
[04:21:52] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[04:21:52] ============== xe_live_guc_g2g_kunit_allmem  ===============
[04:21:52] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[04:21:52] =================== [SKIPPED] xe_guc_g2g ===================
[04:21:52] =================== xe_mocs (2 subtests) ===================
[04:21:52] ================ xe_live_mocs_kernel_kunit  ================
[04:21:52] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[04:21:52] ================ xe_live_mocs_reset_kunit  =================
[04:21:52] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[04:21:52] ==================== [SKIPPED] xe_mocs =====================
[04:21:52] ================= xe_migrate (2 subtests) ==================
[04:21:52] ================= xe_migrate_sanity_kunit  =================
[04:21:52] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[04:21:52] ================== xe_validate_ccs_kunit  ==================
[04:21:52] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[04:21:52] =================== [SKIPPED] xe_migrate ===================
[04:21:52] ================== xe_dma_buf (1 subtest) ==================
[04:21:52] ==================== xe_dma_buf_kunit  =====================
[04:21:52] ================ [SKIPPED] xe_dma_buf_kunit ================
[04:21:52] =================== [SKIPPED] xe_dma_buf ===================
[04:21:52] ================= xe_bo_shrink (1 subtest) =================
[04:21:52] =================== xe_bo_shrink_kunit  ====================
[04:21:52] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[04:21:52] ================== [SKIPPED] xe_bo_shrink ==================
[04:21:52] ==================== xe_bo (2 subtests) ====================
[04:21:52] ================== xe_ccs_migrate_kunit  ===================
[04:21:52] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[04:21:52] ==================== xe_bo_evict_kunit  ====================
[04:21:52] =============== [SKIPPED] xe_bo_evict_kunit ================
[04:21:52] ===================== [SKIPPED] xe_bo ======================
[04:21:52] ==================== args (13 subtests) ====================
[04:21:52] [PASSED] count_args_test
[04:21:52] [PASSED] call_args_example
[04:21:52] [PASSED] call_args_test
[04:21:52] [PASSED] drop_first_arg_example
[04:21:52] [PASSED] drop_first_arg_test
[04:21:52] [PASSED] first_arg_example
[04:21:52] [PASSED] first_arg_test
[04:21:52] [PASSED] last_arg_example
[04:21:52] [PASSED] last_arg_test
[04:21:52] [PASSED] pick_arg_example
[04:21:52] [PASSED] if_args_example
[04:21:52] [PASSED] if_args_test
[04:21:52] [PASSED] sep_comma_example
[04:21:52] ====================== [PASSED] args =======================
[04:21:52] =================== xe_pci (3 subtests) ====================
[04:21:52] ==================== check_graphics_ip  ====================
[04:21:52] [PASSED] 12.00 Xe_LP
[04:21:52] [PASSED] 12.10 Xe_LP+
[04:21:52] [PASSED] 12.55 Xe_HPG
[04:21:52] [PASSED] 12.60 Xe_HPC
[04:21:52] [PASSED] 12.70 Xe_LPG
[04:21:52] [PASSED] 12.71 Xe_LPG
[04:21:52] [PASSED] 12.74 Xe_LPG+
[04:21:52] [PASSED] 20.01 Xe2_HPG
[04:21:52] [PASSED] 20.02 Xe2_HPG
[04:21:52] [PASSED] 20.04 Xe2_LPG
[04:21:52] [PASSED] 30.00 Xe3_LPG
[04:21:52] [PASSED] 30.01 Xe3_LPG
[04:21:52] [PASSED] 30.03 Xe3_LPG
[04:21:52] [PASSED] 30.04 Xe3_LPG
[04:21:52] [PASSED] 30.05 Xe3_LPG
[04:21:52] [PASSED] 35.10 Xe3p_LPG
[04:21:52] [PASSED] 35.11 Xe3p_XPC
[04:21:52] ================ [PASSED] check_graphics_ip ================
[04:21:52] ===================== check_media_ip  ======================
[04:21:52] [PASSED] 12.00 Xe_M
[04:21:52] [PASSED] 12.55 Xe_HPM
[04:21:52] [PASSED] 13.00 Xe_LPM+
[04:21:52] [PASSED] 13.01 Xe2_HPM
[04:21:52] [PASSED] 20.00 Xe2_LPM
[04:21:52] [PASSED] 30.00 Xe3_LPM
[04:21:52] [PASSED] 30.02 Xe3_LPM
[04:21:52] [PASSED] 35.00 Xe3p_LPM
[04:21:52] [PASSED] 35.03 Xe3p_HPM
[04:21:52] ================= [PASSED] check_media_ip ==================
[04:21:52] =================== check_platform_desc  ===================
[04:21:52] [PASSED] 0x9A60 (TIGERLAKE)
[04:21:52] [PASSED] 0x9A68 (TIGERLAKE)
[04:21:52] [PASSED] 0x9A70 (TIGERLAKE)
[04:21:52] [PASSED] 0x9A40 (TIGERLAKE)
[04:21:52] [PASSED] 0x9A49 (TIGERLAKE)
[04:21:52] [PASSED] 0x9A59 (TIGERLAKE)
[04:21:52] [PASSED] 0x9A78 (TIGERLAKE)
[04:21:52] [PASSED] 0x9AC0 (TIGERLAKE)
[04:21:52] [PASSED] 0x9AC9 (TIGERLAKE)
[04:21:52] [PASSED] 0x9AD9 (TIGERLAKE)
[04:21:52] [PASSED] 0x9AF8 (TIGERLAKE)
[04:21:52] [PASSED] 0x4C80 (ROCKETLAKE)
[04:21:52] [PASSED] 0x4C8A (ROCKETLAKE)
[04:21:52] [PASSED] 0x4C8B (ROCKETLAKE)
[04:21:52] [PASSED] 0x4C8C (ROCKETLAKE)
[04:21:52] [PASSED] 0x4C90 (ROCKETLAKE)
[04:21:52] [PASSED] 0x4C9A (ROCKETLAKE)
[04:21:52] [PASSED] 0x4680 (ALDERLAKE_S)
[04:21:52] [PASSED] 0x4682 (ALDERLAKE_S)
[04:21:52] [PASSED] 0x4688 (ALDERLAKE_S)
[04:21:52] [PASSED] 0x468A (ALDERLAKE_S)
[04:21:52] [PASSED] 0x468B (ALDERLAKE_S)
[04:21:52] [PASSED] 0x4690 (ALDERLAKE_S)
[04:21:52] [PASSED] 0x4692 (ALDERLAKE_S)
[04:21:52] [PASSED] 0x4693 (ALDERLAKE_S)
[04:21:52] [PASSED] 0x46A0 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46A1 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46A2 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46A3 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46A6 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46A8 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46AA (ALDERLAKE_P)
[04:21:52] [PASSED] 0x462A (ALDERLAKE_P)
[04:21:52] [PASSED] 0x4626 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x4628 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46B0 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46B1 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46B2 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46B3 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46C0 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46C1 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46C2 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46C3 (ALDERLAKE_P)
[04:21:52] [PASSED] 0x46D0 (ALDERLAKE_N)
[04:21:52] [PASSED] 0x46D1 (ALDERLAKE_N)
[04:21:52] [PASSED] 0x46D2 (ALDERLAKE_N)
[04:21:52] [PASSED] 0x46D3 (ALDERLAKE_N)
[04:21:52] [PASSED] 0x46D4 (ALDERLAKE_N)
[04:21:52] [PASSED] 0xA721 (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7A1 (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7A9 (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7AC (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7AD (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA720 (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7A0 (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7A8 (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7AA (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA7AB (ALDERLAKE_P)
[04:21:52] [PASSED] 0xA780 (ALDERLAKE_S)
[04:21:52] [PASSED] 0xA781 (ALDERLAKE_S)
[04:21:52] [PASSED] 0xA782 (ALDERLAKE_S)
[04:21:52] [PASSED] 0xA783 (ALDERLAKE_S)
[04:21:52] [PASSED] 0xA788 (ALDERLAKE_S)
[04:21:52] [PASSED] 0xA789 (ALDERLAKE_S)
[04:21:52] [PASSED] 0xA78A (ALDERLAKE_S)
[04:21:52] [PASSED] 0xA78B (ALDERLAKE_S)
[04:21:52] [PASSED] 0x4905 (DG1)
[04:21:52] [PASSED] 0x4906 (DG1)
[04:21:52] [PASSED] 0x4907 (DG1)
[04:21:52] [PASSED] 0x4908 (DG1)
[04:21:52] [PASSED] 0x4909 (DG1)
[04:21:52] [PASSED] 0x56C0 (DG2)
[04:21:52] [PASSED] 0x56C2 (DG2)
[04:21:52] [PASSED] 0x56C1 (DG2)
[04:21:52] [PASSED] 0x7D51 (METEORLAKE)
[04:21:52] [PASSED] 0x7DD1 (METEORLAKE)
[04:21:52] [PASSED] 0x7D41 (METEORLAKE)
[04:21:52] [PASSED] 0x7D67 (METEORLAKE)
[04:21:52] [PASSED] 0xB640 (METEORLAKE)
[04:21:52] [PASSED] 0x56A0 (DG2)
[04:21:52] [PASSED] 0x56A1 (DG2)
[04:21:52] [PASSED] 0x56A2 (DG2)
[04:21:52] [PASSED] 0x56BE (DG2)
[04:21:52] [PASSED] 0x56BF (DG2)
[04:21:52] [PASSED] 0x5690 (DG2)
[04:21:52] [PASSED] 0x5691 (DG2)
[04:21:52] [PASSED] 0x5692 (DG2)
[04:21:52] [PASSED] 0x56A5 (DG2)
[04:21:52] [PASSED] 0x56A6 (DG2)
[04:21:52] [PASSED] 0x56B0 (DG2)
[04:21:52] [PASSED] 0x56B1 (DG2)
[04:21:52] [PASSED] 0x56BA (DG2)
[04:21:52] [PASSED] 0x56BB (DG2)
[04:21:52] [PASSED] 0x56BC (DG2)
[04:21:52] [PASSED] 0x56BD (DG2)
[04:21:52] [PASSED] 0x5693 (DG2)
[04:21:52] [PASSED] 0x5694 (DG2)
[04:21:52] [PASSED] 0x5695 (DG2)
[04:21:52] [PASSED] 0x56A3 (DG2)
[04:21:52] [PASSED] 0x56A4 (DG2)
[04:21:52] [PASSED] 0x56B2 (DG2)
[04:21:52] [PASSED] 0x56B3 (DG2)
[04:21:52] [PASSED] 0x5696 (DG2)
[04:21:52] [PASSED] 0x5697 (DG2)
[04:21:52] [PASSED] 0xB69 (PVC)
[04:21:52] [PASSED] 0xB6E (PVC)
[04:21:52] [PASSED] 0xBD4 (PVC)
[04:21:52] [PASSED] 0xBD5 (PVC)
[04:21:52] [PASSED] 0xBD6 (PVC)
[04:21:52] [PASSED] 0xBD7 (PVC)
[04:21:52] [PASSED] 0xBD8 (PVC)
[04:21:52] [PASSED] 0xBD9 (PVC)
[04:21:52] [PASSED] 0xBDA (PVC)
[04:21:52] [PASSED] 0xBDB (PVC)
[04:21:52] [PASSED] 0xBE0 (PVC)
[04:21:52] [PASSED] 0xBE1 (PVC)
[04:21:52] [PASSED] 0xBE5 (PVC)
[04:21:52] [PASSED] 0x7D40 (METEORLAKE)
[04:21:52] [PASSED] 0x7D45 (METEORLAKE)
[04:21:52] [PASSED] 0x7D55 (METEORLAKE)
[04:21:52] [PASSED] 0x7D60 (METEORLAKE)
[04:21:52] [PASSED] 0x7DD5 (METEORLAKE)
[04:21:52] [PASSED] 0x6420 (LUNARLAKE)
[04:21:52] [PASSED] 0x64A0 (LUNARLAKE)
[04:21:52] [PASSED] 0x64B0 (LUNARLAKE)
[04:21:52] [PASSED] 0xE202 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE209 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE20B (BATTLEMAGE)
[04:21:52] [PASSED] 0xE20C (BATTLEMAGE)
[04:21:52] [PASSED] 0xE20D (BATTLEMAGE)
[04:21:52] [PASSED] 0xE210 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE211 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE212 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE216 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE220 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE221 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE222 (BATTLEMAGE)
[04:21:52] [PASSED] 0xE223 (BATTLEMAGE)
[04:21:52] [PASSED] 0xB080 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB081 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB082 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB083 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB084 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB085 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB086 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB087 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB08F (PANTHERLAKE)
[04:21:52] [PASSED] 0xB090 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB0A0 (PANTHERLAKE)
[04:21:52] [PASSED] 0xB0B0 (PANTHERLAKE)
[04:21:52] [PASSED] 0xFD80 (PANTHERLAKE)
[04:21:52] [PASSED] 0xFD81 (PANTHERLAKE)
[04:21:52] [PASSED] 0xD740 (NOVALAKE_S)
[04:21:52] [PASSED] 0xD741 (NOVALAKE_S)
[04:21:52] [PASSED] 0xD742 (NOVALAKE_S)
[04:21:52] [PASSED] 0xD743 (NOVALAKE_S)
[04:21:52] [PASSED] 0xD745 (NOVALAKE_S)
[04:21:52] [PASSED] 0xD74A (NOVALAKE_S)
[04:21:52] [PASSED] 0xD74B (NOVALAKE_S)
[04:21:52] [PASSED] 0x674C (CRESCENTISLAND)
[04:21:52] [PASSED] 0x674D (CRESCENTISLAND)
[04:21:52] [PASSED] 0x674E (CRESCENTISLAND)
[04:21:52] [PASSED] 0x674F (CRESCENTISLAND)
[04:21:52] [PASSED] 0x6750 (CRESCENTISLAND)
[04:21:52] [PASSED] 0xD750 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD751 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD752 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD753 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD754 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD755 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD756 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD757 (NOVALAKE_P)
[04:21:52] [PASSED] 0xD75F (NOVALAKE_P)
[04:21:52] =============== [PASSED] check_platform_desc ===============
[04:21:52] ===================== [PASSED] xe_pci ======================
[04:21:52] ============= xe_rtp_tables_test (5 subtests) ==============
[04:21:52] ================== xe_rtp_table_gt_test  ===================
[04:21:52] [PASSED] gt_was/14011060649
[04:21:52] [PASSED] gt_was/14011059788
[04:21:52] [PASSED] gt_was/14015795083
[04:21:52] [PASSED] gt_was/16021867713
[04:21:52] [PASSED] gt_was/14019449301
[04:21:52] [PASSED] gt_was/16028005424
[04:21:52] [PASSED] gt_was/14026578760
[04:21:52] [PASSED] gt_was/1409420604
[04:21:52] [PASSED] gt_was/1408615072
[04:21:52] [PASSED] gt_was/22010523718
[04:21:52] [PASSED] gt_was/14011006942
[04:21:52] [PASSED] gt_was/14014830051
[04:21:52] [PASSED] gt_was/18018781329
[04:21:52] [PASSED] gt_was/1509235366
[04:21:52] [PASSED] gt_was/18018781329
[04:21:52] [PASSED] gt_was/16016694945
[04:21:52] [PASSED] gt_was/14018575942
[04:21:52] [PASSED] gt_was/22016670082
[04:21:52] [PASSED] gt_was/22016670082
[04:21:52] [PASSED] gt_was/14017421178
[04:21:52] [PASSED] gt_was/16025250150
[04:21:52] [PASSED] gt_was/14021871409
[04:21:52] [PASSED] gt_was/16021865536
[04:21:52] [PASSED] gt_was/14021486841
[04:21:52] [PASSED] gt_was/14025160223
[04:21:52] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[04:21:52] [PASSED] gt_was/14025635424
[04:21:52] [PASSED] gt_was/16028005424
[04:21:52] ============== [PASSED] xe_rtp_table_gt_test ===============
[04:21:52] ================== xe_rtp_table_gt_test  ===================
[04:21:52] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[04:21:52] [PASSED] gt_tunings/Tuning: 32B Access Enable
[04:21:52] [PASSED] gt_tunings/Tuning: L3 cache
[04:21:52] [PASSED] gt_tunings/Tuning: L3 cache - media
[04:21:52] [PASSED] gt_tunings/Tuning: Compression Overfetch
[04:21:52] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[04:21:52] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[04:21:52] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[04:21:52] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[04:21:52] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[04:21:52] [PASSED] gt_tunings/Tuning: Stateless compression control
[04:21:52] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[04:21:52] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[04:21:52] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[04:21:52] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[04:21:52] ============== [PASSED] xe_rtp_table_gt_test ===============
[04:21:52] ================== xe_rtp_table_oob_test  ==================
[04:21:52] [PASSED] oob_was/1607983814
[04:21:52] [PASSED] oob_was/16010904313
[04:21:52] [PASSED] oob_was/18022495364
[04:21:52] [PASSED] oob_was/22012773006
[04:21:52] [PASSED] oob_was/14014475959
[04:21:52] [PASSED] oob_was/22011391025
[04:21:52] [PASSED] oob_was/22012727170
[04:21:52] [PASSED] oob_was/22012727685
[04:21:52] [PASSED] oob_was/22016596838
[04:21:52] [PASSED] oob_was/18020744125
[04:21:52] [PASSED] oob_was/1409600907
[04:21:52] [PASSED] oob_was/22014953428
[04:21:52] [PASSED] oob_was/16017236439
[04:21:52] [PASSED] oob_was/14019821291
[04:21:52] [PASSED] oob_was/14015076503
[04:21:52] [PASSED] oob_was/14018913170
[04:21:52] [PASSED] oob_was/14018094691
[04:21:52] [PASSED] oob_was/18024947630
[04:21:52] [PASSED] oob_was/16022287689
[04:21:52] [PASSED] oob_was/13011645652
[04:21:52] [PASSED] oob_was/14022293748
[04:21:52] [PASSED] oob_was/22019794406
[04:21:52] [PASSED] oob_was/22019338487
[04:21:52] [PASSED] oob_was/16023588340
[04:21:52] [PASSED] oob_was/14019789679
[04:21:52] [PASSED] oob_was/14022866841
[04:21:52] [PASSED] oob_was/16021333562
[04:21:52] [PASSED] oob_was/14016712196
[04:21:52] [PASSED] oob_was/14015568240
[04:21:52] [PASSED] oob_was/18013179988
[04:21:52] [PASSED] oob_was/1508761755
[04:21:52] [PASSED] oob_was/16023105232
[04:21:52] [PASSED] oob_was/16026508708
[04:21:52] [PASSED] oob_was/14020001231
[04:21:52] [PASSED] oob_was/16023683509
[04:21:52] [PASSED] oob_was/14025515070
[04:21:52] [PASSED] oob_was/15015404425_disable
[04:21:52] [PASSED] oob_was/16026007364
[04:21:52] [PASSED] oob_was/14020316580
[04:21:52] [PASSED] oob_was/14025883347
[04:21:52] [PASSED] oob_was/16029380221
[04:21:52] ============== [PASSED] xe_rtp_table_oob_test ==============
[04:21:52] ================ xe_rtp_table_dev_oob_test  ================
[04:21:52] [PASSED] device_oob_was/22010954014
[04:21:52] [PASSED] device_oob_was/15015404425
[04:21:52] [PASSED] device_oob_was/22019338487_display
[04:21:52] [PASSED] device_oob_was/14022085890
[04:21:52] [PASSED] device_oob_was/14026539277
[04:21:52] [PASSED] device_oob_was/14026633728
[04:21:52] [PASSED] device_oob_was/14026746987
[04:21:52] [PASSED] device_oob_was/14026779378
[04:21:52] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[04:21:52] ========== xe_rtp_table_missing_upper_bound_test  ==========
[04:21:52] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[04:21:52] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[04:21:52] [PASSED] register_whitelist/1806527549
[04:21:52] [PASSED] register_whitelist/allow_read_ctx_timestamp
[04:21:52] [PASSED] register_whitelist/allow_read_queue_timestamp
[04:21:52] [PASSED] register_whitelist/16014440446
[04:21:52] [PASSED] register_whitelist/16017236439
[04:21:52] [PASSED] register_whitelist/16020183090
[04:21:52] [PASSED] register_whitelist/14024997852
[04:21:52] [PASSED] register_whitelist/14024997852
[04:21:52] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[04:21:52] =============== [PASSED] xe_rtp_tables_test ================
[04:21:52] =================== xe_rtp (3 subtests) ====================
[04:21:52] =================== xe_rtp_rules_tests  ====================
[04:21:52] [PASSED] no
[04:21:52] [PASSED] yes
[04:21:52] [PASSED] no-and-no
[04:21:52] [PASSED] no-and-yes
[04:21:52] [PASSED] yes-and-no
[04:21:52] [PASSED] yes-and-yes
[04:21:52] [PASSED] no-or-no
[04:21:52] [PASSED] no-or-yes
[04:21:52] [PASSED] yes-or-no
[04:21:52] [PASSED] yes-or-yes
[04:21:52] [PASSED] no-yes-or-yes-no
[04:21:52] [PASSED] no-yes-or-yes-yes
[04:21:52] [PASSED] yes-yes-or-no-yes
[04:21:52] [PASSED] yes-yes-or-yes-yes
[04:21:52] [PASSED] no-no-or-yes-or-no
[04:21:52] [PASSED] or
[04:21:52] [PASSED] or-yes
[04:21:52] [PASSED] or-no
[04:21:52] [PASSED] yes-or
[04:21:52] [PASSED] no-or
[04:21:52] [PASSED] no-or-or-yes
[04:21:52] [PASSED] yes-or-or-no
[04:21:52] [PASSED] no-or-or-no
[04:21:52] [PASSED] missing-context-engine-class
[04:21:52] [PASSED] missing-context-engine-class-or-yes
[04:21:52] [PASSED] missing-context-engine-class-or-or-yes
[04:21:52] =============== [PASSED] xe_rtp_rules_tests ================
[04:21:52] =============== xe_rtp_process_to_sr_tests  ================
[04:21:52] [PASSED] coalesce-same-reg
[04:21:52] [PASSED] coalesce-same-reg-literal-and-func
[04:21:52] [PASSED] no-match-no-add
[04:21:52] [PASSED] two-regs-two-entries
[04:21:52] [PASSED] clr-one-set-other
[04:21:52] [PASSED] set-field
[04:21:52] [PASSED] conflict-duplicate
[04:21:52] [PASSED] conflict-not-disjoint
[04:21:52] [PASSED] conflict-not-disjoint-literal-and-func
[04:21:52] [PASSED] conflict-reg-type
[04:21:52] [PASSED] bad-mcr-reg-forced-to-regular
[04:21:52] [PASSED] bad-regular-reg-forced-to-mcr
[04:21:52] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[04:21:52] ================== xe_rtp_process_tests  ===================
[04:21:52] [PASSED] active1
[04:21:52] [PASSED] active2
[04:21:52] [PASSED] active-inactive
[04:21:52] [PASSED] inactive-active
[04:21:52] [PASSED] inactive-active-inactive
[04:21:52] [PASSED] inactive-inactive-inactive
[04:21:52] ============== [PASSED] xe_rtp_process_tests ===============
[04:21:52] ===================== [PASSED] xe_rtp ======================
[04:21:52] ==================== xe_wa (1 subtest) =====================
[04:21:52] ======================== xe_wa_gt  =========================
[04:21:52] [PASSED] TIGERLAKE B0
[04:21:52] [PASSED] DG1 A0
[04:21:52] [PASSED] DG1 B0
[04:21:52] [PASSED] ALDERLAKE_S A0
[04:21:52] [PASSED] ALDERLAKE_S B0
[04:21:52] [PASSED] ALDERLAKE_S C0
[04:21:52] [PASSED] ALDERLAKE_S D0
[04:21:52] [PASSED] ALDERLAKE_P A0
[04:21:52] [PASSED] ALDERLAKE_P B0
[04:21:52] [PASSED] ALDERLAKE_P C0
[04:21:52] [PASSED] ALDERLAKE_S RPLS D0
[04:21:52] [PASSED] ALDERLAKE_P RPLU E0
[04:21:52] [PASSED] DG2 G10 C0
[04:21:52] [PASSED] DG2 G11 B1
[04:21:52] [PASSED] DG2 G12 A1
[04:21:52] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[04:21:52] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[04:21:52] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[04:21:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[04:21:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[04:21:52] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[04:21:52] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[04:21:52] ==================== [PASSED] xe_wa_gt =====================
[04:21:52] ====================== [PASSED] xe_wa ======================
[04:21:52] ============================================================
[04:21:52] Testing complete. Ran 729 tests: passed: 711, skipped: 18
[04:21:52] Elapsed time: 36.659s total, 4.337s configuring, 31.656s building, 0.640s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[04:21:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:21:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:22:18] Starting KUnit Kernel (1/1)...
[04:22:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:22:18] ============ drm_test_pick_cmdline (2 subtests) ============
[04:22:18] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[04:22:18] =============== drm_test_pick_cmdline_named  ===============
[04:22:18] [PASSED] NTSC
[04:22:18] [PASSED] NTSC-J
[04:22:18] [PASSED] PAL
[04:22:18] [PASSED] PAL-M
[04:22:18] =========== [PASSED] drm_test_pick_cmdline_named ===========
[04:22:18] ============== [PASSED] drm_test_pick_cmdline ==============
[04:22:18] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[04:22:18] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[04:22:18] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[04:22:18] =========== drm_validate_clone_mode (2 subtests) ===========
[04:22:18] ============== drm_test_check_in_clone_mode  ===============
[04:22:18] [PASSED] in_clone_mode
[04:22:18] [PASSED] not_in_clone_mode
[04:22:18] ========== [PASSED] drm_test_check_in_clone_mode ===========
[04:22:18] =============== drm_test_check_valid_clones  ===============
[04:22:18] [PASSED] not_in_clone_mode
[04:22:18] [PASSED] valid_clone
[04:22:18] [PASSED] invalid_clone
[04:22:18] =========== [PASSED] drm_test_check_valid_clones ===========
[04:22:18] ============= [PASSED] drm_validate_clone_mode =============
[04:22:18] ============= drm_validate_modeset (1 subtest) =============
[04:22:18] [PASSED] drm_test_check_connector_changed_modeset
[04:22:18] ============== [PASSED] drm_validate_modeset ===============
[04:22:18] ====== drm_test_bridge_get_current_state (2 subtests) ======
[04:22:18] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[04:22:18] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[04:22:18] ======== [PASSED] drm_test_bridge_get_current_state ========
[04:22:18] ====== drm_test_bridge_helper_reset_crtc (4 subtests) ======
[04:22:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[04:22:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[04:22:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[04:22:18] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[04:22:18] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[04:22:18] ============== drm_bridge_alloc (2 subtests) ===============
[04:22:18] [PASSED] drm_test_drm_bridge_alloc_basic
[04:22:18] [PASSED] drm_test_drm_bridge_alloc_get_put
[04:22:18] ================ [PASSED] drm_bridge_alloc =================
[04:22:18] ============= drm_bridge_bus_fmt (5 subtests) ==============
[04:22:18] [PASSED] drm_test_bridge_rgb_yuv_rgb
[04:22:18] [PASSED] drm_test_bridge_must_convert_to_yuv444
[04:22:18] [PASSED] drm_test_bridge_hdmi_auto_rgb
[04:22:18] [PASSED] drm_test_bridge_auto_first
[04:22:18] [PASSED] drm_test_bridge_rgb_yuv_no_path
[04:22:18] =============== [PASSED] drm_bridge_bus_fmt ================
[04:22:18] ============= drm_cmdline_parser (40 subtests) =============
[04:22:18] [PASSED] drm_test_cmdline_force_d_only
[04:22:18] [PASSED] drm_test_cmdline_force_D_only_dvi
[04:22:18] [PASSED] drm_test_cmdline_force_D_only_hdmi
[04:22:18] [PASSED] drm_test_cmdline_force_D_only_not_digital
[04:22:18] [PASSED] drm_test_cmdline_force_e_only
[04:22:18] [PASSED] drm_test_cmdline_res
[04:22:18] [PASSED] drm_test_cmdline_res_vesa
[04:22:18] [PASSED] drm_test_cmdline_res_vesa_rblank
[04:22:18] [PASSED] drm_test_cmdline_res_rblank
[04:22:18] [PASSED] drm_test_cmdline_res_bpp
[04:22:18] [PASSED] drm_test_cmdline_res_refresh
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[04:22:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[04:22:18] [PASSED] drm_test_cmdline_res_margins_force_on
[04:22:18] [PASSED] drm_test_cmdline_res_vesa_margins
[04:22:18] [PASSED] drm_test_cmdline_name
[04:22:18] [PASSED] drm_test_cmdline_name_bpp
[04:22:18] [PASSED] drm_test_cmdline_name_option
[04:22:18] [PASSED] drm_test_cmdline_name_bpp_option
[04:22:18] [PASSED] drm_test_cmdline_rotate_0
[04:22:18] [PASSED] drm_test_cmdline_rotate_90
[04:22:18] [PASSED] drm_test_cmdline_rotate_180
[04:22:18] [PASSED] drm_test_cmdline_rotate_270
[04:22:18] [PASSED] drm_test_cmdline_hmirror
[04:22:18] [PASSED] drm_test_cmdline_vmirror
[04:22:18] [PASSED] drm_test_cmdline_margin_options
[04:22:18] [PASSED] drm_test_cmdline_multiple_options
[04:22:18] [PASSED] drm_test_cmdline_bpp_extra_and_option
[04:22:18] [PASSED] drm_test_cmdline_extra_and_option
[04:22:18] [PASSED] drm_test_cmdline_freestanding_options
[04:22:18] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[04:22:18] [PASSED] drm_test_cmdline_panel_orientation
[04:22:18] ================ drm_test_cmdline_invalid  =================
[04:22:18] [PASSED] margin_only
[04:22:18] [PASSED] interlace_only
[04:22:18] [PASSED] res_missing_x
[04:22:18] [PASSED] res_missing_y
[04:22:18] [PASSED] res_bad_y
[04:22:18] [PASSED] res_missing_y_bpp
[04:22:18] [PASSED] res_bad_bpp
[04:22:18] [PASSED] res_bad_refresh
[04:22:18] [PASSED] res_bpp_refresh_force_on_off
[04:22:18] [PASSED] res_invalid_mode
[04:22:18] [PASSED] res_bpp_wrong_place_mode
[04:22:18] [PASSED] name_bpp_refresh
[04:22:18] [PASSED] name_refresh
[04:22:18] [PASSED] name_refresh_wrong_mode
[04:22:18] [PASSED] name_refresh_invalid_mode
[04:22:18] [PASSED] rotate_multiple
[04:22:18] [PASSED] rotate_invalid_val
[04:22:18] [PASSED] rotate_truncated
[04:22:18] [PASSED] invalid_option
[04:22:18] [PASSED] invalid_tv_option
[04:22:18] [PASSED] truncated_tv_option
[04:22:18] ============ [PASSED] drm_test_cmdline_invalid =============
[04:22:18] =============== drm_test_cmdline_tv_options  ===============
[04:22:18] [PASSED] NTSC
[04:22:18] [PASSED] NTSC_443
[04:22:18] [PASSED] NTSC_J
[04:22:18] [PASSED] PAL
[04:22:18] [PASSED] PAL_M
[04:22:18] [PASSED] PAL_N
[04:22:18] [PASSED] SECAM
[04:22:18] [PASSED] MONO_525
[04:22:18] [PASSED] MONO_625
[04:22:18] =========== [PASSED] drm_test_cmdline_tv_options ===========
[04:22:18] =============== [PASSED] drm_cmdline_parser ================
[04:22:18] ========== drmm_connector_hdmi_init (20 subtests) ==========
[04:22:18] [PASSED] drm_test_connector_hdmi_init_valid
[04:22:18] [PASSED] drm_test_connector_hdmi_init_bpc_8
[04:22:18] [PASSED] drm_test_connector_hdmi_init_bpc_10
[04:22:18] [PASSED] drm_test_connector_hdmi_init_bpc_12
[04:22:18] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[04:22:18] [PASSED] drm_test_connector_hdmi_init_bpc_null
[04:22:18] [PASSED] drm_test_connector_hdmi_init_formats_empty
[04:22:18] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[04:22:18] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[04:22:18] [PASSED] supported_formats=0x9 yuv420_allowed=1
[04:22:18] [PASSED] supported_formats=0x9 yuv420_allowed=0
[04:22:18] [PASSED] supported_formats=0x5 yuv420_allowed=1
[04:22:18] [PASSED] supported_formats=0x5 yuv420_allowed=0
[04:22:18] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[04:22:18] [PASSED] drm_test_connector_hdmi_init_null_ddc
[04:22:18] [PASSED] drm_test_connector_hdmi_init_null_product
[04:22:18] [PASSED] drm_test_connector_hdmi_init_null_vendor
[04:22:18] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[04:22:18] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[04:22:18] [PASSED] drm_test_connector_hdmi_init_product_valid
[04:22:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[04:22:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[04:22:18] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[04:22:18] ========= drm_test_connector_hdmi_init_type_valid  =========
[04:22:18] [PASSED] HDMI-A
[04:22:18] [PASSED] HDMI-B
[04:22:18] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[04:22:18] ======== drm_test_connector_hdmi_init_type_invalid  ========
[04:22:18] [PASSED] Unknown
[04:22:18] [PASSED] VGA
[04:22:18] [PASSED] DVI-I
[04:22:18] [PASSED] DVI-D
[04:22:18] [PASSED] DVI-A
[04:22:18] [PASSED] Composite
[04:22:18] [PASSED] SVIDEO
[04:22:18] [PASSED] LVDS
[04:22:18] [PASSED] Component
[04:22:18] [PASSED] DIN
[04:22:18] [PASSED] DP
[04:22:18] [PASSED] TV
[04:22:18] [PASSED] eDP
[04:22:18] [PASSED] Virtual
[04:22:18] [PASSED] DSI
[04:22:18] [PASSED] DPI
[04:22:18] [PASSED] Writeback
[04:22:18] [PASSED] SPI
[04:22:18] [PASSED] USB
[04:22:18] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[04:22:18] ============ [PASSED] drmm_connector_hdmi_init =============
[04:22:18] ============= drmm_connector_init (3 subtests) =============
[04:22:18] [PASSED] drm_test_drmm_connector_init
[04:22:18] [PASSED] drm_test_drmm_connector_init_null_ddc
[04:22:18] ========= drm_test_drmm_connector_init_type_valid  =========
[04:22:18] [PASSED] Unknown
[04:22:18] [PASSED] VGA
[04:22:18] [PASSED] DVI-I
[04:22:18] [PASSED] DVI-D
[04:22:18] [PASSED] DVI-A
[04:22:18] [PASSED] Composite
[04:22:18] [PASSED] SVIDEO
[04:22:18] [PASSED] LVDS
[04:22:18] [PASSED] Component
[04:22:18] [PASSED] DIN
[04:22:18] [PASSED] DP
[04:22:18] [PASSED] HDMI-A
[04:22:18] [PASSED] HDMI-B
[04:22:18] [PASSED] TV
[04:22:18] [PASSED] eDP
[04:22:18] [PASSED] Virtual
[04:22:18] [PASSED] DSI
[04:22:18] [PASSED] DPI
[04:22:18] [PASSED] Writeback
[04:22:18] [PASSED] SPI
[04:22:18] [PASSED] USB
[04:22:18] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[04:22:18] =============== [PASSED] drmm_connector_init ===============
[04:22:18] ========= drm_connector_dynamic_init (6 subtests) ==========
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_init
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_init_properties
[04:22:18] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[04:22:18] [PASSED] Unknown
[04:22:18] [PASSED] VGA
[04:22:18] [PASSED] DVI-I
[04:22:18] [PASSED] DVI-D
[04:22:18] [PASSED] DVI-A
[04:22:18] [PASSED] Composite
[04:22:18] [PASSED] SVIDEO
[04:22:18] [PASSED] LVDS
[04:22:18] [PASSED] Component
[04:22:18] [PASSED] DIN
[04:22:18] [PASSED] DP
[04:22:18] [PASSED] HDMI-A
[04:22:18] [PASSED] HDMI-B
[04:22:18] [PASSED] TV
[04:22:18] [PASSED] eDP
[04:22:18] [PASSED] Virtual
[04:22:18] [PASSED] DSI
[04:22:18] [PASSED] DPI
[04:22:18] [PASSED] Writeback
[04:22:18] [PASSED] SPI
[04:22:18] [PASSED] USB
[04:22:18] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[04:22:18] ======== drm_test_drm_connector_dynamic_init_name  =========
[04:22:18] [PASSED] Unknown
[04:22:18] [PASSED] VGA
[04:22:18] [PASSED] DVI-I
[04:22:18] [PASSED] DVI-D
[04:22:18] [PASSED] DVI-A
[04:22:18] [PASSED] Composite
[04:22:18] [PASSED] SVIDEO
[04:22:18] [PASSED] LVDS
[04:22:18] [PASSED] Component
[04:22:18] [PASSED] DIN
[04:22:18] [PASSED] DP
[04:22:18] [PASSED] HDMI-A
[04:22:18] [PASSED] HDMI-B
[04:22:18] [PASSED] TV
[04:22:18] [PASSED] eDP
[04:22:18] [PASSED] Virtual
[04:22:18] [PASSED] DSI
[04:22:18] [PASSED] DPI
[04:22:18] [PASSED] Writeback
[04:22:18] [PASSED] SPI
[04:22:18] [PASSED] USB
[04:22:18] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[04:22:18] =========== [PASSED] drm_connector_dynamic_init ============
[04:22:18] ==== drm_connector_dynamic_register_early (4 subtests) =====
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[04:22:18] ====== [PASSED] drm_connector_dynamic_register_early =======
[04:22:18] ======= drm_connector_dynamic_register (7 subtests) ========
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[04:22:18] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[04:22:18] ========= [PASSED] drm_connector_dynamic_register ==========
[04:22:18] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[04:22:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[04:22:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[04:22:18] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[04:22:18] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[04:22:18] ========== drm_test_get_tv_mode_from_name_valid  ===========
[04:22:18] [PASSED] NTSC
[04:22:18] [PASSED] NTSC-443
[04:22:18] [PASSED] NTSC-J
[04:22:18] [PASSED] PAL
[04:22:18] [PASSED] PAL-M
[04:22:18] [PASSED] PAL-N
[04:22:18] [PASSED] SECAM
[04:22:18] [PASSED] Mono
[04:22:18] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[04:22:18] [PASSED] drm_test_get_tv_mode_from_name_truncated
[04:22:18] ============ [PASSED] drm_get_tv_mode_from_name ============
[04:22:18] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[04:22:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[04:22:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[04:22:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[04:22:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[04:22:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[04:22:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[04:22:18] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[04:22:18] [PASSED] VIC 96
[04:22:18] [PASSED] VIC 97
[04:22:18] [PASSED] VIC 101
[04:22:18] [PASSED] VIC 102
[04:22:18] [PASSED] VIC 106
[04:22:18] [PASSED] VIC 107
[04:22:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[04:22:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[04:22:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[04:22:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[04:22:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[04:22:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[04:22:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[04:22:18] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[04:22:18] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[04:22:18] [PASSED] Automatic
[04:22:18] [PASSED] Full
[04:22:18] [PASSED] Limited 16:235
[04:22:18] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[04:22:18] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[04:22:18] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[04:22:18] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[04:22:18] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[04:22:18] [PASSED] RGB
[04:22:18] [PASSED] YUV 4:2:0
[04:22:18] [PASSED] YUV 4:2:2
[04:22:18] [PASSED] YUV 4:4:4
[04:22:18] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[04:22:18] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[04:22:18] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[04:22:18] ============= drm_damage_helper (21 subtests) ==============
[04:22:18] [PASSED] drm_test_damage_iter_no_damage
[04:22:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[04:22:18] [PASSED] drm_test_damage_iter_no_damage_src_moved
[04:22:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[04:22:18] [PASSED] drm_test_damage_iter_no_damage_not_visible
[04:22:18] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[04:22:18] [PASSED] drm_test_damage_iter_no_damage_no_fb
[04:22:18] [PASSED] drm_test_damage_iter_simple_damage
[04:22:18] [PASSED] drm_test_damage_iter_single_damage
[04:22:18] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[04:22:18] [PASSED] drm_test_damage_iter_single_damage_outside_src
[04:22:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[04:22:18] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[04:22:18] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[04:22:18] [PASSED] drm_test_damage_iter_single_damage_src_moved
[04:22:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[04:22:18] [PASSED] drm_test_damage_iter_damage
[04:22:18] [PASSED] drm_test_damage_iter_damage_one_intersect
[04:22:18] [PASSED] drm_test_damage_iter_damage_one_outside
[04:22:18] [PASSED] drm_test_damage_iter_damage_src_moved
[04:22:18] [PASSED] drm_test_damage_iter_damage_not_visible
[04:22:18] ================ [PASSED] drm_damage_helper ================
[04:22:18] ============== drm_dp_mst_helper (3 subtests) ==============
[04:22:18] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[04:22:18] [PASSED] Clock 154000 BPP 30 DSC disabled
[04:22:18] [PASSED] Clock 234000 BPP 30 DSC disabled
[04:22:18] [PASSED] Clock 297000 BPP 24 DSC disabled
[04:22:18] [PASSED] Clock 332880 BPP 24 DSC enabled
[04:22:18] [PASSED] Clock 324540 BPP 24 DSC enabled
[04:22:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[04:22:18] ============== drm_test_dp_mst_calc_pbn_div  ===============
[04:22:18] [PASSED] Link rate 2000000 lane count 4
[04:22:18] [PASSED] Link rate 2000000 lane count 2
[04:22:18] [PASSED] Link rate 2000000 lane count 1
[04:22:18] [PASSED] Link rate 1350000 lane count 4
[04:22:18] [PASSED] Link rate 1350000 lane count 2
[04:22:18] [PASSED] Link rate 1350000 lane count 1
[04:22:18] [PASSED] Link rate 1000000 lane count 4
[04:22:18] [PASSED] Link rate 1000000 lane count 2
[04:22:18] [PASSED] Link rate 1000000 lane count 1
[04:22:18] [PASSED] Link rate 810000 lane count 4
[04:22:18] [PASSED] Link rate 810000 lane count 2
[04:22:18] [PASSED] Link rate 810000 lane count 1
[04:22:18] [PASSED] Link rate 540000 lane count 4
[04:22:18] [PASSED] Link rate 540000 lane count 2
[04:22:18] [PASSED] Link rate 540000 lane count 1
[04:22:18] [PASSED] Link rate 270000 lane count 4
[04:22:18] [PASSED] Link rate 270000 lane count 2
[04:22:18] [PASSED] Link rate 270000 lane count 1
[04:22:18] [PASSED] Link rate 162000 lane count 4
[04:22:18] [PASSED] Link rate 162000 lane count 2
[04:22:18] [PASSED] Link rate 162000 lane count 1
[04:22:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[04:22:18] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[04:22:18] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[04:22:18] [PASSED] DP_POWER_UP_PHY with port number
[04:22:18] [PASSED] DP_POWER_DOWN_PHY with port number
[04:22:18] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[04:22:18] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[04:22:18] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[04:22:18] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[04:22:18] [PASSED] DP_QUERY_PAYLOAD with port number
[04:22:18] [PASSED] DP_QUERY_PAYLOAD with VCPI
[04:22:18] [PASSED] DP_REMOTE_DPCD_READ with port number
[04:22:18] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[04:22:18] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[04:22:18] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[04:22:18] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[04:22:18] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[04:22:18] [PASSED] DP_REMOTE_I2C_READ with port number
[04:22:18] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[04:22:18] [PASSED] DP_REMOTE_I2C_READ with transactions array
[04:22:18] [PASSED] DP_REMOTE_I2C_WRITE with port number
[04:22:18] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[04:22:18] [PASSED] DP_REMOTE_I2C_WRITE with data array
[04:22:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[04:22:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[04:22:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[04:22:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[04:22:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[04:22:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[04:22:18] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[04:22:18] ================ [PASSED] drm_dp_mst_helper ================
[04:22:18] ================== drm_exec (7 subtests) ===================
[04:22:18] [PASSED] sanitycheck
[04:22:18] [PASSED] test_lock
[04:22:18] [PASSED] test_lock_unlock
[04:22:18] [PASSED] test_duplicates
[04:22:18] [PASSED] test_prepare
[04:22:18] [PASSED] test_prepare_array
[04:22:18] [PASSED] test_multiple_loops
[04:22:18] ==================== [PASSED] drm_exec =====================
[04:22:18] =========== drm_format_helper_test (17 subtests) ===========
[04:22:18] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[04:22:18] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[04:22:18] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[04:22:18] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[04:22:18] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[04:22:18] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[04:22:18] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[04:22:18] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[04:22:18] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[04:22:18] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[04:22:18] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[04:22:18] ============== drm_test_fb_xrgb8888_to_mono  ===============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[04:22:18] ==================== drm_test_fb_swab  =====================
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ================ [PASSED] drm_test_fb_swab =================
[04:22:18] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[04:22:18] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[04:22:18] [PASSED] single_pixel_source_buffer
[04:22:18] [PASSED] single_pixel_clip_rectangle
[04:22:18] [PASSED] well_known_colors
[04:22:18] [PASSED] destination_pitch
[04:22:18] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[04:22:18] ================= drm_test_fb_clip_offset  =================
[04:22:18] [PASSED] pass through
[04:22:18] [PASSED] horizontal offset
[04:22:18] [PASSED] vertical offset
[04:22:18] [PASSED] horizontal and vertical offset
[04:22:18] [PASSED] horizontal offset (custom pitch)
[04:22:18] [PASSED] vertical offset (custom pitch)
[04:22:18] [PASSED] horizontal and vertical offset (custom pitch)
[04:22:18] ============= [PASSED] drm_test_fb_clip_offset =============
[04:22:18] =================== drm_test_fb_memcpy  ====================
[04:22:18] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[04:22:18] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[04:22:18] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[04:22:18] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[04:22:18] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[04:22:18] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[04:22:18] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[04:22:18] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[04:22:18] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[04:22:18] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[04:22:18] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[04:22:18] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[04:22:18] =============== [PASSED] drm_test_fb_memcpy ================
[04:22:18] ============= [PASSED] drm_format_helper_test ==============
[04:22:18] ================= drm_format (18 subtests) =================
[04:22:18] [PASSED] drm_test_format_block_width_invalid
[04:22:18] [PASSED] drm_test_format_block_width_one_plane
[04:22:18] [PASSED] drm_test_format_block_width_two_plane
[04:22:18] [PASSED] drm_test_format_block_width_three_plane
[04:22:18] [PASSED] drm_test_format_block_width_tiled
[04:22:18] [PASSED] drm_test_format_block_height_invalid
[04:22:18] [PASSED] drm_test_format_block_height_one_plane
[04:22:18] [PASSED] drm_test_format_block_height_two_plane
[04:22:18] [PASSED] drm_test_format_block_height_three_plane
[04:22:18] [PASSED] drm_test_format_block_height_tiled
[04:22:18] [PASSED] drm_test_format_min_pitch_invalid
[04:22:18] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[04:22:18] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[04:22:18] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[04:22:18] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[04:22:18] [PASSED] drm_test_format_min_pitch_two_plane
[04:22:18] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[04:22:18] [PASSED] drm_test_format_min_pitch_tiled
[04:22:18] =================== [PASSED] drm_format ====================
[04:22:18] ============== drm_framebuffer (10 subtests) ===============
[04:22:18] ========== drm_test_framebuffer_check_src_coords  ==========
[04:22:18] [PASSED] Success: source fits into fb
[04:22:18] [PASSED] Fail: overflowing fb with x-axis coordinate
[04:22:18] [PASSED] Fail: overflowing fb with y-axis coordinate
[04:22:18] [PASSED] Fail: overflowing fb with source width
[04:22:18] [PASSED] Fail: overflowing fb with source height
[04:22:18] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[04:22:18] [PASSED] drm_test_framebuffer_cleanup
[04:22:18] =============== drm_test_framebuffer_create  ===============
[04:22:18] [PASSED] ABGR8888 normal sizes
[04:22:18] [PASSED] ABGR8888 max sizes
[04:22:18] [PASSED] ABGR8888 pitch greater than min required
[04:22:18] [PASSED] ABGR8888 pitch less than min required
[04:22:18] [PASSED] ABGR8888 Invalid width
[04:22:18] [PASSED] ABGR8888 Invalid buffer handle
[04:22:18] [PASSED] No pixel format
[04:22:18] [PASSED] ABGR8888 Width 0
[04:22:18] [PASSED] ABGR8888 Height 0
[04:22:18] [PASSED] ABGR8888 Out of bound height * pitch combination
[04:22:18] [PASSED] ABGR8888 Large buffer offset
[04:22:18] [PASSED] ABGR8888 Buffer offset for inexistent plane
[04:22:18] [PASSED] ABGR8888 Invalid flag
[04:22:18] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[04:22:18] [PASSED] ABGR8888 Valid buffer modifier
[04:22:18] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[04:22:18] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[04:22:18] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[04:22:18] [PASSED] NV12 Normal sizes
[04:22:18] [PASSED] NV12 Max sizes
[04:22:18] [PASSED] NV12 Invalid pitch
[04:22:18] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[04:22:18] [PASSED] NV12 different  modifier per-plane
[04:22:18] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[04:22:18] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[04:22:18] [PASSED] NV12 Modifier for inexistent plane
[04:22:18] [PASSED] NV12 Handle for inexistent plane
[04:22:18] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[04:22:18] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[04:22:18] [PASSED] YVU420 Normal sizes
[04:22:18] [PASSED] YVU420 Max sizes
[04:22:18] [PASSED] YVU420 Invalid pitch
[04:22:18] [PASSED] YVU420 Different pitches
[04:22:18] [PASSED] YVU420 Different buffer offsets/pitches
[04:22:18] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[04:22:18] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[04:22:18] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[04:22:18] [PASSED] YVU420 Valid modifier
[04:22:18] [PASSED] YVU420 Different modifiers per plane
[04:22:18] [PASSED] YVU420 Modifier for inexistent plane
[04:22:18] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[04:22:18] [PASSED] X0L2 Normal sizes
[04:22:18] [PASSED] X0L2 Max sizes
[04:22:18] [PASSED] X0L2 Invalid pitch
[04:22:18] [PASSED] X0L2 Pitch greater than minimum required
[04:22:18] [PASSED] X0L2 Handle for inexistent plane
[04:22:18] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[04:22:18] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[04:22:18] [PASSED] X0L2 Valid modifier
[04:22:18] [PASSED] X0L2 Modifier for inexistent plane
[04:22:18] =========== [PASSED] drm_test_framebuffer_create ===========
[04:22:18] [PASSED] drm_test_framebuffer_free
[04:22:18] [PASSED] drm_test_framebuffer_init
[04:22:18] [PASSED] drm_test_framebuffer_init_bad_format
[04:22:18] [PASSED] drm_test_framebuffer_init_dev_mismatch
[04:22:18] [PASSED] drm_test_framebuffer_lookup
[04:22:18] [PASSED] drm_test_framebuffer_lookup_inexistent
[04:22:18] [PASSED] drm_test_framebuffer_modifiers_not_supported
[04:22:18] ================= [PASSED] drm_framebuffer =================
[04:22:18] ================ drm_gem_shmem (8 subtests) ================
[04:22:18] [PASSED] drm_gem_shmem_test_obj_create
[04:22:18] [PASSED] drm_gem_shmem_test_obj_create_private
[04:22:18] [PASSED] drm_gem_shmem_test_pin_pages
[04:22:18] [PASSED] drm_gem_shmem_test_vmap
[04:22:18] [PASSED] drm_gem_shmem_test_get_sg_table
[04:22:18] [PASSED] drm_gem_shmem_test_get_pages_sgt
[04:22:18] [PASSED] drm_gem_shmem_test_madvise
[04:22:18] [PASSED] drm_gem_shmem_test_purge
[04:22:18] ================== [PASSED] drm_gem_shmem ==================
[04:22:18] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[04:22:18] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[04:22:18] [PASSED] Automatic
[04:22:18] [PASSED] Full
[04:22:18] [PASSED] Limited 16:235
[04:22:18] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[04:22:18] [PASSED] drm_test_check_disable_connector
[04:22:18] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[04:22:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[04:22:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[04:22:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[04:22:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[04:22:18] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[04:22:18] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[04:22:18] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[04:22:18] [PASSED] drm_test_check_output_bpc_dvi
[04:22:18] [PASSED] drm_test_check_output_bpc_format_vic_1
[04:22:18] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[04:22:18] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[04:22:18] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[04:22:18] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[04:22:18] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[04:22:18] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[04:22:18] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[04:22:18] ============ drm_test_check_hdmi_color_format  =============
[04:22:18] [PASSED] AUTO -> RGB
[04:22:18] [PASSED] YCBCR422 -> YUV422
[04:22:18] [PASSED] YCBCR420 -> YUV420
[04:22:18] [PASSED] YCBCR444 -> YUV444
[04:22:18] [PASSED] RGB -> RGB
[04:22:18] ======== [PASSED] drm_test_check_hdmi_color_format =========
[04:22:18] ======== drm_test_check_hdmi_color_format_420_only  ========
[04:22:18] [PASSED] RGB should fail
[04:22:18] [PASSED] YUV444 should fail
[04:22:18] [PASSED] YUV422 should fail
[04:22:18] [PASSED] YUV420 should work
[04:22:18] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[04:22:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[04:22:18] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[04:22:18] [PASSED] drm_test_check_broadcast_rgb_value
[04:22:18] [PASSED] drm_test_check_bpc_8_value
[04:22:18] [PASSED] drm_test_check_bpc_10_value
[04:22:18] [PASSED] drm_test_check_bpc_12_value
[04:22:18] [PASSED] drm_test_check_format_value
[04:22:18] [PASSED] drm_test_check_tmds_char_value
[04:22:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[04:22:18] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[04:22:18] [PASSED] drm_test_check_mode_valid
[04:22:18] [PASSED] drm_test_check_mode_valid_reject
[04:22:18] [PASSED] drm_test_check_mode_valid_reject_rate
[04:22:18] [PASSED] drm_test_check_mode_valid_reject_max_clock
[04:22:18] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[04:22:18] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[04:22:18] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[04:22:18] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[04:22:18] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[04:22:18] [PASSED] drm_test_check_infoframes
[04:22:18] [PASSED] drm_test_check_reject_avi_infoframe
[04:22:18] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[04:22:18] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[04:22:18] [PASSED] drm_test_check_reject_audio_infoframe
[04:22:18] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[04:22:18] ================= drm_managed (2 subtests) =================
[04:22:18] [PASSED] drm_test_managed_release_action
[04:22:18] [PASSED] drm_test_managed_run_action
[04:22:18] =================== [PASSED] drm_managed ===================
[04:22:18] =================== drm_mm (6 subtests) ====================
[04:22:18] [PASSED] drm_test_mm_init
[04:22:18] [PASSED] drm_test_mm_debug
[04:22:18] [PASSED] drm_test_mm_align32
[04:22:18] [PASSED] drm_test_mm_align64
[04:22:18] [PASSED] drm_test_mm_lowest
[04:22:18] [PASSED] drm_test_mm_highest
[04:22:18] ===================== [PASSED] drm_mm ======================
[04:22:18] ============= drm_modes_analog_tv (5 subtests) =============
[04:22:18] [PASSED] drm_test_modes_analog_tv_mono_576i
[04:22:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[04:22:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[04:22:18] [PASSED] drm_test_modes_analog_tv_pal_576i
[04:22:18] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[04:22:18] =============== [PASSED] drm_modes_analog_tv ===============
[04:22:18] ============== drm_plane_helper (2 subtests) ===============
[04:22:18] =============== drm_test_check_plane_state  ================
[04:22:18] [PASSED] clipping_simple
[04:22:18] [PASSED] clipping_rotate_reflect
[04:22:18] [PASSED] positioning_simple
[04:22:18] [PASSED] upscaling
[04:22:18] [PASSED] downscaling
[04:22:18] [PASSED] rounding1
[04:22:18] [PASSED] rounding2
[04:22:18] [PASSED] rounding3
[04:22:18] [PASSED] rounding4
[04:22:18] =========== [PASSED] drm_test_check_plane_state ============
[04:22:18] =========== drm_test_check_invalid_plane_state  ============
[04:22:18] [PASSED] positioning_invalid
[04:22:18] [PASSED] upscaling_invalid
[04:22:18] [PASSED] downscaling_invalid
[04:22:18] ======= [PASSED] drm_test_check_invalid_plane_state ========
[04:22:18] ================ [PASSED] drm_plane_helper =================
[04:22:18] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[04:22:18] ====== drm_test_connector_helper_tv_get_modes_check  =======
[04:22:18] [PASSED] None
[04:22:18] [PASSED] PAL
[04:22:18] [PASSED] NTSC
[04:22:18] [PASSED] Both, NTSC Default
[04:22:18] [PASSED] Both, PAL Default
[04:22:18] [PASSED] Both, NTSC Default, with PAL on command-line
[04:22:18] [PASSED] Both, PAL Default, with NTSC on command-line
[04:22:18] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[04:22:18] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[04:22:18] ================== drm_rect (9 subtests) ===================
[04:22:18] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[04:22:18] [PASSED] drm_test_rect_clip_scaled_not_clipped
[04:22:18] [PASSED] drm_test_rect_clip_scaled_clipped
[04:22:18] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[04:22:18] ================= drm_test_rect_intersect  =================
[04:22:18] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[04:22:18] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[04:22:18] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[04:22:18] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[04:22:18] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[04:22:18] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[04:22:18] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[04:22:18] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[04:22:18] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[04:22:18] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[04:22:18] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[04:22:18] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[04:22:18] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[04:22:18] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[04:22:18] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[04:22:18] ============= [PASSED] drm_test_rect_intersect =============
[04:22:18] ================ drm_test_rect_calc_hscale  ================
[04:22:18] [PASSED] normal use
[04:22:18] [PASSED] out of max range
[04:22:18] [PASSED] out of min range
[04:22:18] [PASSED] zero dst
[04:22:18] [PASSED] negative src
[04:22:18] [PASSED] negative dst
[04:22:18] ============ [PASSED] drm_test_rect_calc_hscale ============
[04:22:18] ================ drm_test_rect_calc_vscale  ================
[04:22:18] [PASSED] normal use
[04:22:18] [PASSED] out of max range
[04:22:18] [PASSED] out of min range
[04:22:18] [PASSED] zero dst
[04:22:18] [PASSED] negative src
[04:22:18] [PASSED] negative dst
[04:22:18] ============ [PASSED] drm_test_rect_calc_vscale ============
[04:22:18] ================== drm_test_rect_rotate  ===================
[04:22:18] [PASSED] reflect-x
[04:22:18] [PASSED] reflect-y
[04:22:18] [PASSED] rotate-0
[04:22:18] [PASSED] rotate-90
[04:22:18] [PASSED] rotate-180
[04:22:18] [PASSED] rotate-270
[04:22:18] ============== [PASSED] drm_test_rect_rotate ===============
[04:22:18] ================ drm_test_rect_rotate_inv  =================
[04:22:18] [PASSED] reflect-x
[04:22:18] [PASSED] reflect-y
[04:22:18] [PASSED] rotate-0
[04:22:18] [PASSED] rotate-90
[04:22:18] [PASSED] rotate-180
[04:22:18] [PASSED] rotate-270
[04:22:18] ============ [PASSED] drm_test_rect_rotate_inv =============
[04:22:18] ==================== [PASSED] drm_rect =====================
[04:22:18] ============ drm_sysfb_modeset_test (1 subtest) ============
[04:22:18] ============ drm_test_sysfb_build_fourcc_list  =============
[04:22:18] [PASSED] no native formats
[04:22:18] [PASSED] XRGB8888 as native format
[04:22:18] [PASSED] remove duplicates
[04:22:18] [PASSED] convert alpha formats
[04:22:18] [PASSED] random formats
[04:22:18] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[04:22:18] ============= [PASSED] drm_sysfb_modeset_test ==============
[04:22:18] ================== drm_fixp (2 subtests) ===================
[04:22:18] [PASSED] drm_test_int2fixp
[04:22:18] [PASSED] drm_test_sm2fixp
[04:22:18] ==================== [PASSED] drm_fixp =====================
[04:22:18] ============================================================
[04:22:18] Testing complete. Ran 639 tests: passed: 639
[04:22:18] Elapsed time: 26.599s total, 1.785s configuring, 24.648s building, 0.139s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[04:22:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:22:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:22:30] Starting KUnit Kernel (1/1)...
[04:22:30] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:22:30] ================= ttm_device (5 subtests) ==================
[04:22:30] [PASSED] ttm_device_init_basic
[04:22:30] [PASSED] ttm_device_init_multiple
[04:22:30] [PASSED] ttm_device_fini_basic
[04:22:30] [PASSED] ttm_device_init_no_vma_man
[04:22:30] ================== ttm_device_init_pools  ==================
[04:22:30] [PASSED] No DMA allocations, no DMA32 required
[04:22:30] [PASSED] DMA allocations, DMA32 required
[04:22:30] [PASSED] No DMA allocations, DMA32 required
[04:22:30] [PASSED] DMA allocations, no DMA32 required
[04:22:30] ============== [PASSED] ttm_device_init_pools ==============
[04:22:30] =================== [PASSED] ttm_device ====================
[04:22:30] ================== ttm_pool (8 subtests) ===================
[04:22:30] ================== ttm_pool_alloc_basic  ===================
[04:22:30] [PASSED] One page
[04:22:30] [PASSED] More than one page
[04:22:30] [PASSED] Above the allocation limit
[04:22:30] [PASSED] One page, with coherent DMA mappings enabled
[04:22:30] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:22:30] ============== [PASSED] ttm_pool_alloc_basic ===============
[04:22:30] ============== ttm_pool_alloc_basic_dma_addr  ==============
[04:22:30] [PASSED] One page
[04:22:30] [PASSED] More than one page
[04:22:30] [PASSED] Above the allocation limit
[04:22:30] [PASSED] One page, with coherent DMA mappings enabled
[04:22:30] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:22:30] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[04:22:30] [PASSED] ttm_pool_alloc_order_caching_match
[04:22:30] [PASSED] ttm_pool_alloc_caching_mismatch
[04:22:30] [PASSED] ttm_pool_alloc_order_mismatch
[04:22:30] [PASSED] ttm_pool_free_dma_alloc
[04:22:30] [PASSED] ttm_pool_free_no_dma_alloc
[04:22:30] [PASSED] ttm_pool_fini_basic
[04:22:30] ==================== [PASSED] ttm_pool =====================
[04:22:30] ================ ttm_resource (8 subtests) =================
[04:22:30] ================= ttm_resource_init_basic  =================
[04:22:30] [PASSED] Init resource in TTM_PL_SYSTEM
[04:22:30] [PASSED] Init resource in TTM_PL_VRAM
[04:22:30] [PASSED] Init resource in a private placement
[04:22:30] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[04:22:30] ============= [PASSED] ttm_resource_init_basic =============
[04:22:30] [PASSED] ttm_resource_init_pinned
[04:22:30] [PASSED] ttm_resource_fini_basic
[04:22:30] [PASSED] ttm_resource_manager_init_basic
[04:22:30] [PASSED] ttm_resource_manager_usage_basic
[04:22:30] [PASSED] ttm_resource_manager_set_used_basic
[04:22:30] [PASSED] ttm_sys_man_alloc_basic
[04:22:30] [PASSED] ttm_sys_man_free_basic
[04:22:30] ================== [PASSED] ttm_resource ===================
[04:22:30] =================== ttm_tt (15 subtests) ===================
[04:22:30] ==================== ttm_tt_init_basic  ====================
[04:22:30] [PASSED] Page-aligned size
[04:22:30] [PASSED] Extra pages requested
[04:22:30] ================ [PASSED] ttm_tt_init_basic ================
[04:22:30] [PASSED] ttm_tt_init_misaligned
[04:22:30] [PASSED] ttm_tt_fini_basic
[04:22:30] [PASSED] ttm_tt_fini_sg
[04:22:30] [PASSED] ttm_tt_fini_shmem
[04:22:30] [PASSED] ttm_tt_create_basic
[04:22:30] [PASSED] ttm_tt_create_invalid_bo_type
[04:22:30] [PASSED] ttm_tt_create_ttm_exists
[04:22:30] [PASSED] ttm_tt_create_failed
[04:22:30] [PASSED] ttm_tt_destroy_basic
[04:22:30] [PASSED] ttm_tt_populate_null_ttm
[04:22:30] [PASSED] ttm_tt_populate_populated_ttm
[04:22:30] [PASSED] ttm_tt_unpopulate_basic
[04:22:30] [PASSED] ttm_tt_unpopulate_empty_ttm
[04:22:30] [PASSED] ttm_tt_swapin_basic
[04:22:30] ===================== [PASSED] ttm_tt ======================
[04:22:30] =================== ttm_bo (14 subtests) ===================
[04:22:30] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[04:22:30] [PASSED] Cannot be interrupted and sleeps
[04:22:30] [PASSED] Cannot be interrupted, locks straight away
[04:22:30] [PASSED] Can be interrupted, sleeps
[04:22:30] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[04:22:30] [PASSED] ttm_bo_reserve_locked_no_sleep
[04:22:30] [PASSED] ttm_bo_reserve_no_wait_ticket
[04:22:30] [PASSED] ttm_bo_reserve_double_resv
[04:22:30] [PASSED] ttm_bo_reserve_interrupted
[04:22:30] [PASSED] ttm_bo_reserve_deadlock
[04:22:30] [PASSED] ttm_bo_unreserve_basic
[04:22:30] [PASSED] ttm_bo_unreserve_pinned
[04:22:30] [PASSED] ttm_bo_unreserve_bulk
[04:22:30] [PASSED] ttm_bo_fini_basic
[04:22:30] [PASSED] ttm_bo_fini_shared_resv
[04:22:30] [PASSED] ttm_bo_pin_basic
[04:22:30] [PASSED] ttm_bo_pin_unpin_resource
[04:22:30] [PASSED] ttm_bo_multiple_pin_one_unpin
[04:22:30] ===================== [PASSED] ttm_bo ======================
[04:22:30] ============== ttm_bo_validate (22 subtests) ===============
[04:22:30] ============== ttm_bo_init_reserved_sys_man  ===============
[04:22:30] [PASSED] Buffer object for userspace
[04:22:30] [PASSED] Kernel buffer object
[04:22:30] [PASSED] Shared buffer object
[04:22:30] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[04:22:30] ============== ttm_bo_init_reserved_mock_man  ==============
[04:22:30] [PASSED] Buffer object for userspace
[04:22:30] [PASSED] Kernel buffer object
[04:22:30] [PASSED] Shared buffer object
[04:22:30] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[04:22:30] [PASSED] ttm_bo_init_reserved_resv
[04:22:30] ================== ttm_bo_validate_basic  ==================
[04:22:30] [PASSED] Buffer object for userspace
[04:22:30] [PASSED] Kernel buffer object
[04:22:30] [PASSED] Shared buffer object
[04:22:30] ============== [PASSED] ttm_bo_validate_basic ==============
[04:22:30] [PASSED] ttm_bo_validate_invalid_placement
[04:22:30] ============= ttm_bo_validate_same_placement  ==============
[04:22:30] [PASSED] System manager
[04:22:30] [PASSED] VRAM manager
[04:22:30] ========= [PASSED] ttm_bo_validate_same_placement ==========
[04:22:30] [PASSED] ttm_bo_validate_failed_alloc
[04:22:30] [PASSED] ttm_bo_validate_pinned
[04:22:30] [PASSED] ttm_bo_validate_busy_placement
[04:22:30] ================ ttm_bo_validate_multihop  =================
[04:22:30] [PASSED] Buffer object for userspace
[04:22:30] [PASSED] Kernel buffer object
[04:22:30] [PASSED] Shared buffer object
[04:22:30] ============ [PASSED] ttm_bo_validate_multihop =============
[04:22:30] ========== ttm_bo_validate_no_placement_signaled  ==========
[04:22:30] [PASSED] Buffer object in system domain, no page vector
[04:22:30] [PASSED] Buffer object in system domain with an existing page vector
[04:22:30] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[04:22:30] ======== ttm_bo_validate_no_placement_not_signaled  ========
[04:22:30] [PASSED] Buffer object for userspace
[04:22:30] [PASSED] Kernel buffer object
[04:22:30] [PASSED] Shared buffer object
[04:22:30] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[04:22:30] [PASSED] ttm_bo_validate_move_fence_signaled
[04:22:31] ========= ttm_bo_validate_move_fence_not_signaled  =========
[04:22:31] [PASSED] Waits for GPU
[04:22:31] [PASSED] Tries to lock straight away
[04:22:31] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[04:22:31] [PASSED] ttm_bo_validate_swapout
[04:22:31] [PASSED] ttm_bo_validate_happy_evict
[04:22:31] [PASSED] ttm_bo_validate_all_pinned_evict
[04:22:31] [PASSED] ttm_bo_validate_allowed_only_evict
[04:22:31] [PASSED] ttm_bo_validate_deleted_evict
[04:22:31] [PASSED] ttm_bo_validate_busy_domain_evict
[04:22:31] [PASSED] ttm_bo_validate_evict_gutting
[04:22:31] [PASSED] ttm_bo_validate_recrusive_evict
[04:22:31] ================= [PASSED] ttm_bo_validate =================
[04:22:31] ============================================================
[04:22:31] Testing complete. Ran 102 tests: passed: 102
[04:22:31] Elapsed time: 11.956s total, 1.815s configuring, 9.925s building, 0.186s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


