Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E0010FC456
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 00:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA7510E6F7;
	Thu,  9 Apr 2026 00:45:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFC110E6F7;
 Thu,  9 Apr 2026 00:45:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Fix_potential_NULL_d?=
 =?utf-8?q?eref_in_xe=5Fexec=5Fqueue=5Ftlb=5Finval=5Flast=5Ffence=5Fput=5Fun?=
 =?utf-8?q?locked?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 00:45:27 -0000
Message-ID: <177569552749.444945.14110715419434359226@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409003449.3405767-1-shuicheng.lin@intel.com>
In-Reply-To: <20260409003449.3405767-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix potential NULL deref in xe_exec_queue_tlb_inval_last_fence_put_unlocked
URL   : https://patchwork.freedesktop.org/series/164582/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[00:44:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:44:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:44:45] Starting KUnit Kernel (1/1)...
[00:44:45] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:44:45] ================== guc_buf (11 subtests) ===================
[00:44:45] [PASSED] test_smallest
[00:44:45] [PASSED] test_largest
[00:44:45] [PASSED] test_granular
[00:44:45] [PASSED] test_unique
[00:44:45] [PASSED] test_overlap
[00:44:45] [PASSED] test_reusable
[00:44:45] [PASSED] test_too_big
[00:44:45] [PASSED] test_flush
[00:44:45] [PASSED] test_lookup
[00:44:45] [PASSED] test_data
[00:44:45] [PASSED] test_class
[00:44:45] ===================== [PASSED] guc_buf =====================
[00:44:45] =================== guc_dbm (7 subtests) ===================
[00:44:45] [PASSED] test_empty
[00:44:45] [PASSED] test_default
[00:44:45] ======================== test_size  ========================
[00:44:45] [PASSED] 4
[00:44:45] [PASSED] 8
[00:44:45] [PASSED] 32
[00:44:45] [PASSED] 256
[00:44:45] ==================== [PASSED] test_size ====================
[00:44:45] ======================= test_reuse  ========================
[00:44:45] [PASSED] 4
[00:44:45] [PASSED] 8
[00:44:45] [PASSED] 32
[00:44:45] [PASSED] 256
[00:44:45] =================== [PASSED] test_reuse ====================
[00:44:45] =================== test_range_overlap  ====================
[00:44:45] [PASSED] 4
[00:44:45] [PASSED] 8
[00:44:45] [PASSED] 32
[00:44:45] [PASSED] 256
[00:44:45] =============== [PASSED] test_range_overlap ================
[00:44:45] =================== test_range_compact  ====================
[00:44:45] [PASSED] 4
[00:44:45] [PASSED] 8
[00:44:45] [PASSED] 32
[00:44:45] [PASSED] 256
[00:44:45] =============== [PASSED] test_range_compact ================
[00:44:45] ==================== test_range_spare  =====================
[00:44:45] [PASSED] 4
[00:44:45] [PASSED] 8
[00:44:45] [PASSED] 32
[00:44:45] [PASSED] 256
[00:44:45] ================ [PASSED] test_range_spare =================
[00:44:45] ===================== [PASSED] guc_dbm =====================
[00:44:45] =================== guc_idm (6 subtests) ===================
[00:44:45] [PASSED] bad_init
[00:44:45] [PASSED] no_init
[00:44:45] [PASSED] init_fini
[00:44:45] [PASSED] check_used
[00:44:45] [PASSED] check_quota
[00:44:45] [PASSED] check_all
[00:44:45] ===================== [PASSED] guc_idm =====================
[00:44:45] ================== no_relay (3 subtests) ===================
[00:44:45] [PASSED] xe_drops_guc2pf_if_not_ready
[00:44:45] [PASSED] xe_drops_guc2vf_if_not_ready
[00:44:45] [PASSED] xe_rejects_send_if_not_ready
[00:44:45] ==================== [PASSED] no_relay =====================
[00:44:45] ================== pf_relay (14 subtests) ==================
[00:44:45] [PASSED] pf_rejects_guc2pf_too_short
[00:44:45] [PASSED] pf_rejects_guc2pf_too_long
[00:44:45] [PASSED] pf_rejects_guc2pf_no_payload
[00:44:45] [PASSED] pf_fails_no_payload
[00:44:45] [PASSED] pf_fails_bad_origin
[00:44:45] [PASSED] pf_fails_bad_type
[00:44:45] [PASSED] pf_txn_reports_error
[00:44:45] [PASSED] pf_txn_sends_pf2guc
[00:44:45] [PASSED] pf_sends_pf2guc
[00:44:45] [SKIPPED] pf_loopback_nop
[00:44:45] [SKIPPED] pf_loopback_echo
[00:44:45] [SKIPPED] pf_loopback_fail
[00:44:45] [SKIPPED] pf_loopback_busy
[00:44:45] [SKIPPED] pf_loopback_retry
[00:44:45] ==================== [PASSED] pf_relay =====================
[00:44:45] ================== vf_relay (3 subtests) ===================
[00:44:45] [PASSED] vf_rejects_guc2vf_too_short
[00:44:45] [PASSED] vf_rejects_guc2vf_too_long
[00:44:45] [PASSED] vf_rejects_guc2vf_no_payload
[00:44:45] ==================== [PASSED] vf_relay =====================
[00:44:45] ================ pf_gt_config (9 subtests) =================
[00:44:45] [PASSED] fair_contexts_1vf
[00:44:45] [PASSED] fair_doorbells_1vf
[00:44:45] [PASSED] fair_ggtt_1vf
[00:44:45] ====================== fair_vram_1vf  ======================
[00:44:45] [PASSED] 3.50 GiB
[00:44:45] [PASSED] 11.5 GiB
[00:44:45] [PASSED] 15.5 GiB
[00:44:45] [PASSED] 31.5 GiB
[00:44:45] [PASSED] 63.5 GiB
[00:44:45] [PASSED] 1.91 GiB
[00:44:45] ================== [PASSED] fair_vram_1vf ==================
[00:44:45] ================ fair_vram_1vf_admin_only  =================
[00:44:45] [PASSED] 3.50 GiB
[00:44:45] [PASSED] 11.5 GiB
[00:44:45] [PASSED] 15.5 GiB
[00:44:45] [PASSED] 31.5 GiB
[00:44:45] [PASSED] 63.5 GiB
[00:44:45] [PASSED] 1.91 GiB
[00:44:45] ============ [PASSED] fair_vram_1vf_admin_only =============
[00:44:45] ====================== fair_contexts  ======================
[00:44:45] [PASSED] 1 VF
[00:44:45] [PASSED] 2 VFs
[00:44:45] [PASSED] 3 VFs
[00:44:45] [PASSED] 4 VFs
[00:44:45] [PASSED] 5 VFs
[00:44:45] [PASSED] 6 VFs
[00:44:45] [PASSED] 7 VFs
[00:44:45] [PASSED] 8 VFs
[00:44:45] [PASSED] 9 VFs
[00:44:45] [PASSED] 10 VFs
[00:44:45] [PASSED] 11 VFs
[00:44:45] [PASSED] 12 VFs
[00:44:45] [PASSED] 13 VFs
[00:44:45] [PASSED] 14 VFs
[00:44:45] [PASSED] 15 VFs
[00:44:45] [PASSED] 16 VFs
[00:44:45] [PASSED] 17 VFs
[00:44:45] [PASSED] 18 VFs
[00:44:45] [PASSED] 19 VFs
[00:44:45] [PASSED] 20 VFs
[00:44:45] [PASSED] 21 VFs
[00:44:45] [PASSED] 22 VFs
[00:44:45] [PASSED] 23 VFs
[00:44:45] [PASSED] 24 VFs
[00:44:45] [PASSED] 25 VFs
[00:44:45] [PASSED] 26 VFs
[00:44:45] [PASSED] 27 VFs
[00:44:45] [PASSED] 28 VFs
[00:44:45] [PASSED] 29 VFs
[00:44:45] [PASSED] 30 VFs
[00:44:45] [PASSED] 31 VFs
[00:44:45] [PASSED] 32 VFs
[00:44:45] [PASSED] 33 VFs
[00:44:45] [PASSED] 34 VFs
[00:44:45] [PASSED] 35 VFs
[00:44:45] [PASSED] 36 VFs
[00:44:45] [PASSED] 37 VFs
[00:44:45] [PASSED] 38 VFs
[00:44:45] [PASSED] 39 VFs
[00:44:45] [PASSED] 40 VFs
[00:44:45] [PASSED] 41 VFs
[00:44:45] [PASSED] 42 VFs
[00:44:45] [PASSED] 43 VFs
[00:44:45] [PASSED] 44 VFs
[00:44:45] [PASSED] 45 VFs
[00:44:45] [PASSED] 46 VFs
[00:44:45] [PASSED] 47 VFs
[00:44:45] [PASSED] 48 VFs
[00:44:45] [PASSED] 49 VFs
[00:44:45] [PASSED] 50 VFs
[00:44:45] [PASSED] 51 VFs
[00:44:45] [PASSED] 52 VFs
[00:44:45] [PASSED] 53 VFs
[00:44:45] [PASSED] 54 VFs
[00:44:45] [PASSED] 55 VFs
[00:44:45] [PASSED] 56 VFs
[00:44:45] [PASSED] 57 VFs
[00:44:45] [PASSED] 58 VFs
[00:44:45] [PASSED] 59 VFs
[00:44:45] [PASSED] 60 VFs
[00:44:45] [PASSED] 61 VFs
[00:44:45] [PASSED] 62 VFs
[00:44:45] [PASSED] 63 VFs
[00:44:45] ================== [PASSED] fair_contexts ==================
[00:44:45] ===================== fair_doorbells  ======================
[00:44:45] [PASSED] 1 VF
[00:44:45] [PASSED] 2 VFs
[00:44:45] [PASSED] 3 VFs
[00:44:45] [PASSED] 4 VFs
[00:44:45] [PASSED] 5 VFs
[00:44:45] [PASSED] 6 VFs
[00:44:45] [PASSED] 7 VFs
[00:44:45] [PASSED] 8 VFs
[00:44:45] [PASSED] 9 VFs
[00:44:45] [PASSED] 10 VFs
[00:44:45] [PASSED] 11 VFs
[00:44:45] [PASSED] 12 VFs
[00:44:45] [PASSED] 13 VFs
[00:44:45] [PASSED] 14 VFs
[00:44:45] [PASSED] 15 VFs
[00:44:45] [PASSED] 16 VFs
[00:44:45] [PASSED] 17 VFs
[00:44:45] [PASSED] 18 VFs
[00:44:45] [PASSED] 19 VFs
[00:44:45] [PASSED] 20 VFs
[00:44:45] [PASSED] 21 VFs
[00:44:45] [PASSED] 22 VFs
[00:44:45] [PASSED] 23 VFs
[00:44:45] [PASSED] 24 VFs
[00:44:45] [PASSED] 25 VFs
[00:44:45] [PASSED] 26 VFs
[00:44:45] [PASSED] 27 VFs
[00:44:45] [PASSED] 28 VFs
[00:44:45] [PASSED] 29 VFs
[00:44:45] [PASSED] 30 VFs
[00:44:45] [PASSED] 31 VFs
[00:44:45] [PASSED] 32 VFs
[00:44:45] [PASSED] 33 VFs
[00:44:45] [PASSED] 34 VFs
[00:44:45] [PASSED] 35 VFs
[00:44:45] [PASSED] 36 VFs
[00:44:45] [PASSED] 37 VFs
[00:44:45] [PASSED] 38 VFs
[00:44:45] [PASSED] 39 VFs
[00:44:45] [PASSED] 40 VFs
[00:44:45] [PASSED] 41 VFs
[00:44:45] [PASSED] 42 VFs
[00:44:45] [PASSED] 43 VFs
[00:44:45] [PASSED] 44 VFs
[00:44:45] [PASSED] 45 VFs
[00:44:45] [PASSED] 46 VFs
[00:44:45] [PASSED] 47 VFs
[00:44:45] [PASSED] 48 VFs
[00:44:45] [PASSED] 49 VFs
[00:44:45] [PASSED] 50 VFs
[00:44:45] [PASSED] 51 VFs
[00:44:45] [PASSED] 52 VFs
[00:44:45] [PASSED] 53 VFs
[00:44:45] [PASSED] 54 VFs
[00:44:45] [PASSED] 55 VFs
[00:44:45] [PASSED] 56 VFs
[00:44:45] [PASSED] 57 VFs
[00:44:45] [PASSED] 58 VFs
[00:44:45] [PASSED] 59 VFs
[00:44:45] [PASSED] 60 VFs
[00:44:45] [PASSED] 61 VFs
[00:44:45] [PASSED] 62 VFs
[00:44:45] [PASSED] 63 VFs
[00:44:45] ================= [PASSED] fair_doorbells ==================
[00:44:45] ======================== fair_ggtt  ========================
[00:44:45] [PASSED] 1 VF
[00:44:45] [PASSED] 2 VFs
[00:44:45] [PASSED] 3 VFs
[00:44:45] [PASSED] 4 VFs
[00:44:45] [PASSED] 5 VFs
[00:44:45] [PASSED] 6 VFs
[00:44:45] [PASSED] 7 VFs
[00:44:45] [PASSED] 8 VFs
[00:44:45] [PASSED] 9 VFs
[00:44:45] [PASSED] 10 VFs
[00:44:45] [PASSED] 11 VFs
[00:44:45] [PASSED] 12 VFs
[00:44:45] [PASSED] 13 VFs
[00:44:45] [PASSED] 14 VFs
[00:44:45] [PASSED] 15 VFs
[00:44:45] [PASSED] 16 VFs
[00:44:45] [PASSED] 17 VFs
[00:44:45] [PASSED] 18 VFs
[00:44:45] [PASSED] 19 VFs
[00:44:45] [PASSED] 20 VFs
[00:44:45] [PASSED] 21 VFs
[00:44:45] [PASSED] 22 VFs
[00:44:45] [PASSED] 23 VFs
[00:44:45] [PASSED] 24 VFs
[00:44:45] [PASSED] 25 VFs
[00:44:45] [PASSED] 26 VFs
[00:44:45] [PASSED] 27 VFs
[00:44:46] [PASSED] 28 VFs
[00:44:46] [PASSED] 29 VFs
[00:44:46] [PASSED] 30 VFs
[00:44:46] [PASSED] 31 VFs
[00:44:46] [PASSED] 32 VFs
[00:44:46] [PASSED] 33 VFs
[00:44:46] [PASSED] 34 VFs
[00:44:46] [PASSED] 35 VFs
[00:44:46] [PASSED] 36 VFs
[00:44:46] [PASSED] 37 VFs
[00:44:46] [PASSED] 38 VFs
[00:44:46] [PASSED] 39 VFs
[00:44:46] [PASSED] 40 VFs
[00:44:46] [PASSED] 41 VFs
[00:44:46] [PASSED] 42 VFs
[00:44:46] [PASSED] 43 VFs
[00:44:46] [PASSED] 44 VFs
[00:44:46] [PASSED] 45 VFs
[00:44:46] [PASSED] 46 VFs
[00:44:46] [PASSED] 47 VFs
[00:44:46] [PASSED] 48 VFs
[00:44:46] [PASSED] 49 VFs
[00:44:46] [PASSED] 50 VFs
[00:44:46] [PASSED] 51 VFs
[00:44:46] [PASSED] 52 VFs
[00:44:46] [PASSED] 53 VFs
[00:44:46] [PASSED] 54 VFs
[00:44:46] [PASSED] 55 VFs
[00:44:46] [PASSED] 56 VFs
[00:44:46] [PASSED] 57 VFs
[00:44:46] [PASSED] 58 VFs
[00:44:46] [PASSED] 59 VFs
[00:44:46] [PASSED] 60 VFs
[00:44:46] [PASSED] 61 VFs
[00:44:46] [PASSED] 62 VFs
[00:44:46] [PASSED] 63 VFs
[00:44:46] ==================== [PASSED] fair_ggtt ====================
[00:44:46] ======================== fair_vram  ========================
[00:44:46] [PASSED] 1 VF
[00:44:46] [PASSED] 2 VFs
[00:44:46] [PASSED] 3 VFs
[00:44:46] [PASSED] 4 VFs
[00:44:46] [PASSED] 5 VFs
[00:44:46] [PASSED] 6 VFs
[00:44:46] [PASSED] 7 VFs
[00:44:46] [PASSED] 8 VFs
[00:44:46] [PASSED] 9 VFs
[00:44:46] [PASSED] 10 VFs
[00:44:46] [PASSED] 11 VFs
[00:44:46] [PASSED] 12 VFs
[00:44:46] [PASSED] 13 VFs
[00:44:46] [PASSED] 14 VFs
[00:44:46] [PASSED] 15 VFs
[00:44:46] [PASSED] 16 VFs
[00:44:46] [PASSED] 17 VFs
[00:44:46] [PASSED] 18 VFs
[00:44:46] [PASSED] 19 VFs
[00:44:46] [PASSED] 20 VFs
[00:44:46] [PASSED] 21 VFs
[00:44:46] [PASSED] 22 VFs
[00:44:46] [PASSED] 23 VFs
[00:44:46] [PASSED] 24 VFs
[00:44:46] [PASSED] 25 VFs
[00:44:46] [PASSED] 26 VFs
[00:44:46] [PASSED] 27 VFs
[00:44:46] [PASSED] 28 VFs
[00:44:46] [PASSED] 29 VFs
[00:44:46] [PASSED] 30 VFs
[00:44:46] [PASSED] 31 VFs
[00:44:46] [PASSED] 32 VFs
[00:44:46] [PASSED] 33 VFs
[00:44:46] [PASSED] 34 VFs
[00:44:46] [PASSED] 35 VFs
[00:44:46] [PASSED] 36 VFs
[00:44:46] [PASSED] 37 VFs
[00:44:46] [PASSED] 38 VFs
[00:44:46] [PASSED] 39 VFs
[00:44:46] [PASSED] 40 VFs
[00:44:46] [PASSED] 41 VFs
[00:44:46] [PASSED] 42 VFs
[00:44:46] [PASSED] 43 VFs
[00:44:46] [PASSED] 44 VFs
[00:44:46] [PASSED] 45 VFs
[00:44:46] [PASSED] 46 VFs
[00:44:46] [PASSED] 47 VFs
[00:44:46] [PASSED] 48 VFs
[00:44:46] [PASSED] 49 VFs
[00:44:46] [PASSED] 50 VFs
[00:44:46] [PASSED] 51 VFs
[00:44:46] [PASSED] 52 VFs
[00:44:46] [PASSED] 53 VFs
[00:44:46] [PASSED] 54 VFs
[00:44:46] [PASSED] 55 VFs
[00:44:46] [PASSED] 56 VFs
[00:44:46] [PASSED] 57 VFs
[00:44:46] [PASSED] 58 VFs
[00:44:46] [PASSED] 59 VFs
[00:44:46] [PASSED] 60 VFs
[00:44:46] [PASSED] 61 VFs
[00:44:46] [PASSED] 62 VFs
[00:44:46] [PASSED] 63 VFs
[00:44:46] ==================== [PASSED] fair_vram ====================
[00:44:46] ================== [PASSED] pf_gt_config ===================
[00:44:46] ===================== lmtt (1 subtest) =====================
[00:44:46] ======================== test_ops  =========================
[00:44:46] [PASSED] 2-level
[00:44:46] [PASSED] multi-level
[00:44:46] ==================== [PASSED] test_ops =====================
[00:44:46] ====================== [PASSED] lmtt =======================
[00:44:46] ================= pf_service (11 subtests) =================
[00:44:46] [PASSED] pf_negotiate_any
[00:44:46] [PASSED] pf_negotiate_base_match
[00:44:46] [PASSED] pf_negotiate_base_newer
[00:44:46] [PASSED] pf_negotiate_base_next
[00:44:46] [SKIPPED] pf_negotiate_base_older
[00:44:46] [PASSED] pf_negotiate_base_prev
[00:44:46] [PASSED] pf_negotiate_latest_match
[00:44:46] [PASSED] pf_negotiate_latest_newer
[00:44:46] [PASSED] pf_negotiate_latest_next
[00:44:46] [SKIPPED] pf_negotiate_latest_older
[00:44:46] [SKIPPED] pf_negotiate_latest_prev
[00:44:46] =================== [PASSED] pf_service ====================
[00:44:46] ================= xe_guc_g2g (2 subtests) ==================
[00:44:46] ============== xe_live_guc_g2g_kunit_default  ==============
[00:44:46] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[00:44:46] ============== xe_live_guc_g2g_kunit_allmem  ===============
[00:44:46] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[00:44:46] =================== [SKIPPED] xe_guc_g2g ===================
[00:44:46] =================== xe_mocs (2 subtests) ===================
[00:44:46] ================ xe_live_mocs_kernel_kunit  ================
[00:44:46] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[00:44:46] ================ xe_live_mocs_reset_kunit  =================
[00:44:46] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[00:44:46] ==================== [SKIPPED] xe_mocs =====================
[00:44:46] ================= xe_migrate (2 subtests) ==================
[00:44:46] ================= xe_migrate_sanity_kunit  =================
[00:44:46] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[00:44:46] ================== xe_validate_ccs_kunit  ==================
[00:44:46] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[00:44:46] =================== [SKIPPED] xe_migrate ===================
[00:44:46] ================== xe_dma_buf (1 subtest) ==================
[00:44:46] ==================== xe_dma_buf_kunit  =====================
[00:44:46] ================ [SKIPPED] xe_dma_buf_kunit ================
[00:44:46] =================== [SKIPPED] xe_dma_buf ===================
[00:44:46] ================= xe_bo_shrink (1 subtest) =================
[00:44:46] =================== xe_bo_shrink_kunit  ====================
[00:44:46] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[00:44:46] ================== [SKIPPED] xe_bo_shrink ==================
[00:44:46] ==================== xe_bo (2 subtests) ====================
[00:44:46] ================== xe_ccs_migrate_kunit  ===================
[00:44:46] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[00:44:46] ==================== xe_bo_evict_kunit  ====================
[00:44:46] =============== [SKIPPED] xe_bo_evict_kunit ================
[00:44:46] ===================== [SKIPPED] xe_bo ======================
[00:44:46] ==================== args (13 subtests) ====================
[00:44:46] [PASSED] count_args_test
[00:44:46] [PASSED] call_args_example
[00:44:46] [PASSED] call_args_test
[00:44:46] [PASSED] drop_first_arg_example
[00:44:46] [PASSED] drop_first_arg_test
[00:44:46] [PASSED] first_arg_example
[00:44:46] [PASSED] first_arg_test
[00:44:46] [PASSED] last_arg_example
[00:44:46] [PASSED] last_arg_test
[00:44:46] [PASSED] pick_arg_example
[00:44:46] [PASSED] if_args_example
[00:44:46] [PASSED] if_args_test
[00:44:46] [PASSED] sep_comma_example
[00:44:46] ====================== [PASSED] args =======================
[00:44:46] =================== xe_pci (3 subtests) ====================
[00:44:46] ==================== check_graphics_ip  ====================
[00:44:46] [PASSED] 12.00 Xe_LP
[00:44:46] [PASSED] 12.10 Xe_LP+
[00:44:46] [PASSED] 12.55 Xe_HPG
[00:44:46] [PASSED] 12.60 Xe_HPC
[00:44:46] [PASSED] 12.70 Xe_LPG
[00:44:46] [PASSED] 12.71 Xe_LPG
[00:44:46] [PASSED] 12.74 Xe_LPG+
[00:44:46] [PASSED] 20.01 Xe2_HPG
[00:44:46] [PASSED] 20.02 Xe2_HPG
[00:44:46] [PASSED] 20.04 Xe2_LPG
[00:44:46] [PASSED] 30.00 Xe3_LPG
[00:44:46] [PASSED] 30.01 Xe3_LPG
[00:44:46] [PASSED] 30.03 Xe3_LPG
[00:44:46] [PASSED] 30.04 Xe3_LPG
[00:44:46] [PASSED] 30.05 Xe3_LPG
[00:44:46] [PASSED] 35.10 Xe3p_LPG
[00:44:46] [PASSED] 35.11 Xe3p_XPC
[00:44:46] ================ [PASSED] check_graphics_ip ================
[00:44:46] ===================== check_media_ip  ======================
[00:44:46] [PASSED] 12.00 Xe_M
[00:44:46] [PASSED] 12.55 Xe_HPM
[00:44:46] [PASSED] 13.00 Xe_LPM+
[00:44:46] [PASSED] 13.01 Xe2_HPM
[00:44:46] [PASSED] 20.00 Xe2_LPM
[00:44:46] [PASSED] 30.00 Xe3_LPM
[00:44:46] [PASSED] 30.02 Xe3_LPM
[00:44:46] [PASSED] 35.00 Xe3p_LPM
[00:44:46] [PASSED] 35.03 Xe3p_HPM
[00:44:46] ================= [PASSED] check_media_ip ==================
[00:44:46] =================== check_platform_desc  ===================
[00:44:46] [PASSED] 0x9A60 (TIGERLAKE)
[00:44:46] [PASSED] 0x9A68 (TIGERLAKE)
[00:44:46] [PASSED] 0x9A70 (TIGERLAKE)
[00:44:46] [PASSED] 0x9A40 (TIGERLAKE)
[00:44:46] [PASSED] 0x9A49 (TIGERLAKE)
[00:44:46] [PASSED] 0x9A59 (TIGERLAKE)
[00:44:46] [PASSED] 0x9A78 (TIGERLAKE)
[00:44:46] [PASSED] 0x9AC0 (TIGERLAKE)
[00:44:46] [PASSED] 0x9AC9 (TIGERLAKE)
[00:44:46] [PASSED] 0x9AD9 (TIGERLAKE)
[00:44:46] [PASSED] 0x9AF8 (TIGERLAKE)
[00:44:46] [PASSED] 0x4C80 (ROCKETLAKE)
[00:44:46] [PASSED] 0x4C8A (ROCKETLAKE)
[00:44:46] [PASSED] 0x4C8B (ROCKETLAKE)
[00:44:46] [PASSED] 0x4C8C (ROCKETLAKE)
[00:44:46] [PASSED] 0x4C90 (ROCKETLAKE)
[00:44:46] [PASSED] 0x4C9A (ROCKETLAKE)
[00:44:46] [PASSED] 0x4680 (ALDERLAKE_S)
[00:44:46] [PASSED] 0x4682 (ALDERLAKE_S)
[00:44:46] [PASSED] 0x4688 (ALDERLAKE_S)
[00:44:46] [PASSED] 0x468A (ALDERLAKE_S)
[00:44:46] [PASSED] 0x468B (ALDERLAKE_S)
[00:44:46] [PASSED] 0x4690 (ALDERLAKE_S)
[00:44:46] [PASSED] 0x4692 (ALDERLAKE_S)
[00:44:46] [PASSED] 0x4693 (ALDERLAKE_S)
[00:44:46] [PASSED] 0x46A0 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46A1 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46A2 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46A3 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46A6 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46A8 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46AA (ALDERLAKE_P)
[00:44:46] [PASSED] 0x462A (ALDERLAKE_P)
[00:44:46] [PASSED] 0x4626 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x4628 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46B0 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46B1 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46B2 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46B3 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46C0 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46C1 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46C2 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46C3 (ALDERLAKE_P)
[00:44:46] [PASSED] 0x46D0 (ALDERLAKE_N)
[00:44:46] [PASSED] 0x46D1 (ALDERLAKE_N)
[00:44:46] [PASSED] 0x46D2 (ALDERLAKE_N)
[00:44:46] [PASSED] 0x46D3 (ALDERLAKE_N)
[00:44:46] [PASSED] 0x46D4 (ALDERLAKE_N)
[00:44:46] [PASSED] 0xA721 (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7A1 (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7A9 (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7AC (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7AD (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA720 (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7A0 (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7A8 (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7AA (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA7AB (ALDERLAKE_P)
[00:44:46] [PASSED] 0xA780 (ALDERLAKE_S)
[00:44:46] [PASSED] 0xA781 (ALDERLAKE_S)
[00:44:46] [PASSED] 0xA782 (ALDERLAKE_S)
[00:44:46] [PASSED] 0xA783 (ALDERLAKE_S)
[00:44:46] [PASSED] 0xA788 (ALDERLAKE_S)
[00:44:46] [PASSED] 0xA789 (ALDERLAKE_S)
[00:44:46] [PASSED] 0xA78A (ALDERLAKE_S)
[00:44:46] [PASSED] 0xA78B (ALDERLAKE_S)
[00:44:46] [PASSED] 0x4905 (DG1)
[00:44:46] [PASSED] 0x4906 (DG1)
[00:44:46] [PASSED] 0x4907 (DG1)
[00:44:46] [PASSED] 0x4908 (DG1)
[00:44:46] [PASSED] 0x4909 (DG1)
[00:44:46] [PASSED] 0x56C0 (DG2)
[00:44:46] [PASSED] 0x56C2 (DG2)
[00:44:46] [PASSED] 0x56C1 (DG2)
[00:44:46] [PASSED] 0x7D51 (METEORLAKE)
[00:44:46] [PASSED] 0x7DD1 (METEORLAKE)
[00:44:46] [PASSED] 0x7D41 (METEORLAKE)
[00:44:46] [PASSED] 0x7D67 (METEORLAKE)
[00:44:46] [PASSED] 0xB640 (METEORLAKE)
[00:44:46] [PASSED] 0x56A0 (DG2)
[00:44:46] [PASSED] 0x56A1 (DG2)
[00:44:46] [PASSED] 0x56A2 (DG2)
[00:44:46] [PASSED] 0x56BE (DG2)
[00:44:46] [PASSED] 0x56BF (DG2)
[00:44:46] [PASSED] 0x5690 (DG2)
[00:44:46] [PASSED] 0x5691 (DG2)
[00:44:46] [PASSED] 0x5692 (DG2)
[00:44:46] [PASSED] 0x56A5 (DG2)
[00:44:46] [PASSED] 0x56A6 (DG2)
[00:44:46] [PASSED] 0x56B0 (DG2)
[00:44:46] [PASSED] 0x56B1 (DG2)
[00:44:46] [PASSED] 0x56BA (DG2)
[00:44:46] [PASSED] 0x56BB (DG2)
[00:44:46] [PASSED] 0x56BC (DG2)
[00:44:46] [PASSED] 0x56BD (DG2)
[00:44:46] [PASSED] 0x5693 (DG2)
[00:44:46] [PASSED] 0x5694 (DG2)
[00:44:46] [PASSED] 0x5695 (DG2)
[00:44:46] [PASSED] 0x56A3 (DG2)
[00:44:46] [PASSED] 0x56A4 (DG2)
[00:44:46] [PASSED] 0x56B2 (DG2)
[00:44:46] [PASSED] 0x56B3 (DG2)
[00:44:46] [PASSED] 0x5696 (DG2)
[00:44:46] [PASSED] 0x5697 (DG2)
[00:44:46] [PASSED] 0xB69 (PVC)
[00:44:46] [PASSED] 0xB6E (PVC)
[00:44:46] [PASSED] 0xBD4 (PVC)
[00:44:46] [PASSED] 0xBD5 (PVC)
[00:44:46] [PASSED] 0xBD6 (PVC)
[00:44:46] [PASSED] 0xBD7 (PVC)
[00:44:46] [PASSED] 0xBD8 (PVC)
[00:44:46] [PASSED] 0xBD9 (PVC)
[00:44:46] [PASSED] 0xBDA (PVC)
[00:44:46] [PASSED] 0xBDB (PVC)
[00:44:46] [PASSED] 0xBE0 (PVC)
[00:44:46] [PASSED] 0xBE1 (PVC)
[00:44:46] [PASSED] 0xBE5 (PVC)
[00:44:46] [PASSED] 0x7D40 (METEORLAKE)
[00:44:46] [PASSED] 0x7D45 (METEORLAKE)
[00:44:46] [PASSED] 0x7D55 (METEORLAKE)
[00:44:46] [PASSED] 0x7D60 (METEORLAKE)
[00:44:46] [PASSED] 0x7DD5 (METEORLAKE)
[00:44:46] [PASSED] 0x6420 (LUNARLAKE)
[00:44:46] [PASSED] 0x64A0 (LUNARLAKE)
[00:44:46] [PASSED] 0x64B0 (LUNARLAKE)
[00:44:46] [PASSED] 0xE202 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE209 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE20B (BATTLEMAGE)
[00:44:46] [PASSED] 0xE20C (BATTLEMAGE)
[00:44:46] [PASSED] 0xE20D (BATTLEMAGE)
[00:44:46] [PASSED] 0xE210 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE211 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE212 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE216 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE220 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE221 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE222 (BATTLEMAGE)
[00:44:46] [PASSED] 0xE223 (BATTLEMAGE)
[00:44:46] [PASSED] 0xB080 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB081 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB082 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB083 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB084 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB085 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB086 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB087 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB08F (PANTHERLAKE)
[00:44:46] [PASSED] 0xB090 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB0A0 (PANTHERLAKE)
[00:44:46] [PASSED] 0xB0B0 (PANTHERLAKE)
[00:44:46] [PASSED] 0xFD80 (PANTHERLAKE)
[00:44:46] [PASSED] 0xFD81 (PANTHERLAKE)
[00:44:46] [PASSED] 0xD740 (NOVALAKE_S)
[00:44:46] [PASSED] 0xD741 (NOVALAKE_S)
[00:44:46] [PASSED] 0xD742 (NOVALAKE_S)
[00:44:46] [PASSED] 0xD743 (NOVALAKE_S)
[00:44:46] [PASSED] 0xD744 (NOVALAKE_S)
[00:44:46] [PASSED] 0xD745 (NOVALAKE_S)
[00:44:46] [PASSED] 0x674C (CRESCENTISLAND)
[00:44:46] [PASSED] 0xD750 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD751 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD752 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD753 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD754 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD755 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD756 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD757 (NOVALAKE_P)
[00:44:46] [PASSED] 0xD75F (NOVALAKE_P)
[00:44:46] =============== [PASSED] check_platform_desc ===============
[00:44:46] ===================== [PASSED] xe_pci ======================
[00:44:46] =================== xe_rtp (2 subtests) ====================
[00:44:46] =============== xe_rtp_process_to_sr_tests  ================
[00:44:46] [PASSED] coalesce-same-reg
[00:44:46] [PASSED] no-match-no-add
[00:44:46] [PASSED] match-or
[00:44:46] [PASSED] match-or-xfail
[00:44:46] [PASSED] no-match-no-add-multiple-rules
[00:44:46] [PASSED] two-regs-two-entries
[00:44:46] [PASSED] clr-one-set-other
[00:44:46] [PASSED] set-field
[00:44:46] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[00:44:46] [PASSED] conflict-not-disjoint
[00:44:46] [PASSED] conflict-reg-type
[00:44:46] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[00:44:46] ================== xe_rtp_process_tests  ===================
[00:44:46] [PASSED] active1
[00:44:46] [PASSED] active2
[00:44:46] [PASSED] active-inactive
[00:44:46] [PASSED] inactive-active
[00:44:46] [PASSED] inactive-1st_or_active-inactive
[00:44:46] [PASSED] inactive-2nd_or_active-inactive
[00:44:46] [PASSED] inactive-last_or_active-inactive
[00:44:46] [PASSED] inactive-no_or_active-inactive
[00:44:46] ============== [PASSED] xe_rtp_process_tests ===============
[00:44:46] ===================== [PASSED] xe_rtp ======================
[00:44:46] ==================== xe_wa (1 subtest) =====================
[00:44:46] ======================== xe_wa_gt  =========================
[00:44:46] [PASSED] TIGERLAKE B0
[00:44:46] [PASSED] DG1 A0
[00:44:46] [PASSED] DG1 B0
[00:44:46] [PASSED] ALDERLAKE_S A0
[00:44:46] [PASSED] ALDERLAKE_S B0
[00:44:46] [PASSED] ALDERLAKE_S C0
[00:44:46] [PASSED] ALDERLAKE_S D0
[00:44:46] [PASSED] ALDERLAKE_P A0
[00:44:46] [PASSED] ALDERLAKE_P B0
[00:44:46] [PASSED] ALDERLAKE_P C0
[00:44:46] [PASSED] ALDERLAKE_S RPLS D0
[00:44:46] [PASSED] ALDERLAKE_P RPLU E0
[00:44:46] [PASSED] DG2 G10 C0
[00:44:46] [PASSED] DG2 G11 B1
[00:44:46] [PASSED] DG2 G12 A1
[00:44:46] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[00:44:46] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[00:44:46] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[00:44:46] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[00:44:46] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[00:44:46] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[00:44:46] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[00:44:46] ==================== [PASSED] xe_wa_gt =====================
[00:44:46] ====================== [PASSED] xe_wa ======================
[00:44:46] ============================================================
[00:44:46] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[00:44:46] Elapsed time: 36.148s total, 4.263s configuring, 31.267s building, 0.597s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:44:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:44:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:45:12] Starting KUnit Kernel (1/1)...
[00:45:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:45:12] ============ drm_test_pick_cmdline (2 subtests) ============
[00:45:12] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:45:12] =============== drm_test_pick_cmdline_named  ===============
[00:45:12] [PASSED] NTSC
[00:45:12] [PASSED] NTSC-J
[00:45:12] [PASSED] PAL
[00:45:12] [PASSED] PAL-M
[00:45:12] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:45:12] ============== [PASSED] drm_test_pick_cmdline ==============
[00:45:12] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[00:45:12] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[00:45:12] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[00:45:12] =========== drm_validate_clone_mode (2 subtests) ===========
[00:45:12] ============== drm_test_check_in_clone_mode  ===============
[00:45:12] [PASSED] in_clone_mode
[00:45:12] [PASSED] not_in_clone_mode
[00:45:12] ========== [PASSED] drm_test_check_in_clone_mode ===========
[00:45:12] =============== drm_test_check_valid_clones  ===============
[00:45:12] [PASSED] not_in_clone_mode
[00:45:12] [PASSED] valid_clone
[00:45:12] [PASSED] invalid_clone
[00:45:12] =========== [PASSED] drm_test_check_valid_clones ===========
[00:45:12] ============= [PASSED] drm_validate_clone_mode =============
[00:45:12] ============= drm_validate_modeset (1 subtest) =============
[00:45:12] [PASSED] drm_test_check_connector_changed_modeset
[00:45:12] ============== [PASSED] drm_validate_modeset ===============
[00:45:12] ====== drm_test_bridge_get_current_state (2 subtests) ======
[00:45:12] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[00:45:12] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[00:45:12] ======== [PASSED] drm_test_bridge_get_current_state ========
[00:45:12] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[00:45:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[00:45:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[00:45:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[00:45:12] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[00:45:12] ============== drm_bridge_alloc (2 subtests) ===============
[00:45:12] [PASSED] drm_test_drm_bridge_alloc_basic
[00:45:12] [PASSED] drm_test_drm_bridge_alloc_get_put
[00:45:12] ================ [PASSED] drm_bridge_alloc =================
[00:45:12] ============= drm_cmdline_parser (40 subtests) =============
[00:45:12] [PASSED] drm_test_cmdline_force_d_only
[00:45:12] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:45:12] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:45:12] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:45:12] [PASSED] drm_test_cmdline_force_e_only
[00:45:12] [PASSED] drm_test_cmdline_res
[00:45:12] [PASSED] drm_test_cmdline_res_vesa
[00:45:12] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:45:12] [PASSED] drm_test_cmdline_res_rblank
[00:45:12] [PASSED] drm_test_cmdline_res_bpp
[00:45:12] [PASSED] drm_test_cmdline_res_refresh
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:45:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:45:12] [PASSED] drm_test_cmdline_res_margins_force_on
[00:45:12] [PASSED] drm_test_cmdline_res_vesa_margins
[00:45:12] [PASSED] drm_test_cmdline_name
[00:45:12] [PASSED] drm_test_cmdline_name_bpp
[00:45:12] [PASSED] drm_test_cmdline_name_option
[00:45:12] [PASSED] drm_test_cmdline_name_bpp_option
[00:45:12] [PASSED] drm_test_cmdline_rotate_0
[00:45:12] [PASSED] drm_test_cmdline_rotate_90
[00:45:12] [PASSED] drm_test_cmdline_rotate_180
[00:45:12] [PASSED] drm_test_cmdline_rotate_270
[00:45:12] [PASSED] drm_test_cmdline_hmirror
[00:45:12] [PASSED] drm_test_cmdline_vmirror
[00:45:12] [PASSED] drm_test_cmdline_margin_options
[00:45:12] [PASSED] drm_test_cmdline_multiple_options
[00:45:12] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:45:12] [PASSED] drm_test_cmdline_extra_and_option
[00:45:12] [PASSED] drm_test_cmdline_freestanding_options
[00:45:12] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:45:12] [PASSED] drm_test_cmdline_panel_orientation
[00:45:12] ================ drm_test_cmdline_invalid  =================
[00:45:12] [PASSED] margin_only
[00:45:12] [PASSED] interlace_only
[00:45:12] [PASSED] res_missing_x
[00:45:12] [PASSED] res_missing_y
[00:45:12] [PASSED] res_bad_y
[00:45:12] [PASSED] res_missing_y_bpp
[00:45:12] [PASSED] res_bad_bpp
[00:45:12] [PASSED] res_bad_refresh
[00:45:12] [PASSED] res_bpp_refresh_force_on_off
[00:45:12] [PASSED] res_invalid_mode
[00:45:12] [PASSED] res_bpp_wrong_place_mode
[00:45:12] [PASSED] name_bpp_refresh
[00:45:12] [PASSED] name_refresh
[00:45:12] [PASSED] name_refresh_wrong_mode
[00:45:12] [PASSED] name_refresh_invalid_mode
[00:45:12] [PASSED] rotate_multiple
[00:45:12] [PASSED] rotate_invalid_val
[00:45:12] [PASSED] rotate_truncated
[00:45:12] [PASSED] invalid_option
[00:45:12] [PASSED] invalid_tv_option
[00:45:12] [PASSED] truncated_tv_option
[00:45:12] ============ [PASSED] drm_test_cmdline_invalid =============
[00:45:12] =============== drm_test_cmdline_tv_options  ===============
[00:45:12] [PASSED] NTSC
[00:45:12] [PASSED] NTSC_443
[00:45:12] [PASSED] NTSC_J
[00:45:12] [PASSED] PAL
[00:45:12] [PASSED] PAL_M
[00:45:12] [PASSED] PAL_N
[00:45:12] [PASSED] SECAM
[00:45:12] [PASSED] MONO_525
[00:45:12] [PASSED] MONO_625
[00:45:12] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:45:12] =============== [PASSED] drm_cmdline_parser ================
[00:45:12] ========== drmm_connector_hdmi_init (20 subtests) ==========
[00:45:12] [PASSED] drm_test_connector_hdmi_init_valid
[00:45:12] [PASSED] drm_test_connector_hdmi_init_bpc_8
[00:45:12] [PASSED] drm_test_connector_hdmi_init_bpc_10
[00:45:12] [PASSED] drm_test_connector_hdmi_init_bpc_12
[00:45:12] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[00:45:12] [PASSED] drm_test_connector_hdmi_init_bpc_null
[00:45:12] [PASSED] drm_test_connector_hdmi_init_formats_empty
[00:45:12] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[00:45:12] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[00:45:12] [PASSED] supported_formats=0x9 yuv420_allowed=1
[00:45:12] [PASSED] supported_formats=0x9 yuv420_allowed=0
[00:45:12] [PASSED] supported_formats=0x5 yuv420_allowed=1
[00:45:12] [PASSED] supported_formats=0x5 yuv420_allowed=0
[00:45:12] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[00:45:12] [PASSED] drm_test_connector_hdmi_init_null_ddc
[00:45:12] [PASSED] drm_test_connector_hdmi_init_null_product
[00:45:12] [PASSED] drm_test_connector_hdmi_init_null_vendor
[00:45:12] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[00:45:12] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[00:45:12] [PASSED] drm_test_connector_hdmi_init_product_valid
[00:45:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[00:45:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[00:45:12] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[00:45:12] ========= drm_test_connector_hdmi_init_type_valid  =========
[00:45:12] [PASSED] HDMI-A
[00:45:12] [PASSED] HDMI-B
[00:45:12] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[00:45:12] ======== drm_test_connector_hdmi_init_type_invalid  ========
[00:45:12] [PASSED] Unknown
[00:45:12] [PASSED] VGA
[00:45:12] [PASSED] DVI-I
[00:45:12] [PASSED] DVI-D
[00:45:12] [PASSED] DVI-A
[00:45:12] [PASSED] Composite
[00:45:12] [PASSED] SVIDEO
[00:45:12] [PASSED] LVDS
[00:45:12] [PASSED] Component
[00:45:12] [PASSED] DIN
[00:45:12] [PASSED] DP
[00:45:12] [PASSED] TV
[00:45:12] [PASSED] eDP
[00:45:12] [PASSED] Virtual
[00:45:12] [PASSED] DSI
[00:45:12] [PASSED] DPI
[00:45:12] [PASSED] Writeback
[00:45:12] [PASSED] SPI
[00:45:12] [PASSED] USB
[00:45:12] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[00:45:12] ============ [PASSED] drmm_connector_hdmi_init =============
[00:45:12] ============= drmm_connector_init (3 subtests) =============
[00:45:12] [PASSED] drm_test_drmm_connector_init
[00:45:12] [PASSED] drm_test_drmm_connector_init_null_ddc
[00:45:12] ========= drm_test_drmm_connector_init_type_valid  =========
[00:45:12] [PASSED] Unknown
[00:45:12] [PASSED] VGA
[00:45:12] [PASSED] DVI-I
[00:45:12] [PASSED] DVI-D
[00:45:12] [PASSED] DVI-A
[00:45:12] [PASSED] Composite
[00:45:12] [PASSED] SVIDEO
[00:45:12] [PASSED] LVDS
[00:45:12] [PASSED] Component
[00:45:12] [PASSED] DIN
[00:45:12] [PASSED] DP
[00:45:12] [PASSED] HDMI-A
[00:45:12] [PASSED] HDMI-B
[00:45:12] [PASSED] TV
[00:45:12] [PASSED] eDP
[00:45:12] [PASSED] Virtual
[00:45:12] [PASSED] DSI
[00:45:12] [PASSED] DPI
[00:45:12] [PASSED] Writeback
[00:45:12] [PASSED] SPI
[00:45:12] [PASSED] USB
[00:45:12] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[00:45:12] =============== [PASSED] drmm_connector_init ===============
[00:45:12] ========= drm_connector_dynamic_init (6 subtests) ==========
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_init
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_init_properties
[00:45:12] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[00:45:12] [PASSED] Unknown
[00:45:12] [PASSED] VGA
[00:45:12] [PASSED] DVI-I
[00:45:12] [PASSED] DVI-D
[00:45:12] [PASSED] DVI-A
[00:45:12] [PASSED] Composite
[00:45:12] [PASSED] SVIDEO
[00:45:12] [PASSED] LVDS
[00:45:12] [PASSED] Component
[00:45:12] [PASSED] DIN
[00:45:12] [PASSED] DP
[00:45:12] [PASSED] HDMI-A
[00:45:12] [PASSED] HDMI-B
[00:45:12] [PASSED] TV
[00:45:12] [PASSED] eDP
[00:45:12] [PASSED] Virtual
[00:45:12] [PASSED] DSI
[00:45:12] [PASSED] DPI
[00:45:12] [PASSED] Writeback
[00:45:12] [PASSED] SPI
[00:45:12] [PASSED] USB
[00:45:12] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[00:45:12] ======== drm_test_drm_connector_dynamic_init_name  =========
[00:45:12] [PASSED] Unknown
[00:45:12] [PASSED] VGA
[00:45:12] [PASSED] DVI-I
[00:45:12] [PASSED] DVI-D
[00:45:12] [PASSED] DVI-A
[00:45:12] [PASSED] Composite
[00:45:12] [PASSED] SVIDEO
[00:45:12] [PASSED] LVDS
[00:45:12] [PASSED] Component
[00:45:12] [PASSED] DIN
[00:45:12] [PASSED] DP
[00:45:12] [PASSED] HDMI-A
[00:45:12] [PASSED] HDMI-B
[00:45:12] [PASSED] TV
[00:45:12] [PASSED] eDP
[00:45:12] [PASSED] Virtual
[00:45:12] [PASSED] DSI
[00:45:12] [PASSED] DPI
[00:45:12] [PASSED] Writeback
[00:45:12] [PASSED] SPI
[00:45:12] [PASSED] USB
[00:45:12] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[00:45:12] =========== [PASSED] drm_connector_dynamic_init ============
[00:45:12] ==== drm_connector_dynamic_register_early (4 subtests) =====
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[00:45:12] ====== [PASSED] drm_connector_dynamic_register_early =======
[00:45:12] ======= drm_connector_dynamic_register (7 subtests) ========
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[00:45:12] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[00:45:12] ========= [PASSED] drm_connector_dynamic_register ==========
[00:45:12] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[00:45:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[00:45:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[00:45:12] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[00:45:12] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[00:45:12] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:45:12] [PASSED] NTSC
[00:45:12] [PASSED] NTSC-443
[00:45:12] [PASSED] NTSC-J
[00:45:12] [PASSED] PAL
[00:45:12] [PASSED] PAL-M
[00:45:12] [PASSED] PAL-N
[00:45:12] [PASSED] SECAM
[00:45:12] [PASSED] Mono
[00:45:12] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:45:12] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:45:12] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:45:12] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[00:45:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[00:45:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[00:45:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[00:45:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[00:45:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[00:45:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[00:45:12] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[00:45:12] [PASSED] VIC 96
[00:45:12] [PASSED] VIC 97
[00:45:12] [PASSED] VIC 101
[00:45:12] [PASSED] VIC 102
[00:45:12] [PASSED] VIC 106
[00:45:12] [PASSED] VIC 107
[00:45:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[00:45:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[00:45:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[00:45:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[00:45:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[00:45:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[00:45:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[00:45:12] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[00:45:12] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[00:45:12] [PASSED] Automatic
[00:45:12] [PASSED] Full
[00:45:12] [PASSED] Limited 16:235
[00:45:12] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[00:45:12] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[00:45:12] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[00:45:12] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[00:45:12] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[00:45:12] [PASSED] RGB
[00:45:12] [PASSED] YUV 4:2:0
[00:45:12] [PASSED] YUV 4:2:2
[00:45:12] [PASSED] YUV 4:4:4
[00:45:12] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[00:45:12] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[00:45:12] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[00:45:12] ============= drm_damage_helper (21 subtests) ==============
[00:45:12] [PASSED] drm_test_damage_iter_no_damage
[00:45:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:45:12] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:45:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:45:12] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:45:12] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:45:12] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:45:12] [PASSED] drm_test_damage_iter_simple_damage
[00:45:12] [PASSED] drm_test_damage_iter_single_damage
[00:45:12] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:45:12] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:45:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:45:12] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:45:12] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:45:12] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:45:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:45:12] [PASSED] drm_test_damage_iter_damage
[00:45:12] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:45:12] [PASSED] drm_test_damage_iter_damage_one_outside
[00:45:12] [PASSED] drm_test_damage_iter_damage_src_moved
[00:45:12] [PASSED] drm_test_damage_iter_damage_not_visible
[00:45:12] ================ [PASSED] drm_damage_helper ================
[00:45:12] ============== drm_dp_mst_helper (3 subtests) ==============
[00:45:12] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:45:12] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:45:12] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:45:12] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:45:12] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:45:12] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:45:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:45:12] ============== drm_test_dp_mst_calc_pbn_div  ===============
[00:45:12] [PASSED] Link rate 2000000 lane count 4
[00:45:12] [PASSED] Link rate 2000000 lane count 2
[00:45:12] [PASSED] Link rate 2000000 lane count 1
[00:45:12] [PASSED] Link rate 1350000 lane count 4
[00:45:12] [PASSED] Link rate 1350000 lane count 2
[00:45:12] [PASSED] Link rate 1350000 lane count 1
[00:45:12] [PASSED] Link rate 1000000 lane count 4
[00:45:12] [PASSED] Link rate 1000000 lane count 2
[00:45:12] [PASSED] Link rate 1000000 lane count 1
[00:45:12] [PASSED] Link rate 810000 lane count 4
[00:45:12] [PASSED] Link rate 810000 lane count 2
[00:45:12] [PASSED] Link rate 810000 lane count 1
[00:45:12] [PASSED] Link rate 540000 lane count 4
[00:45:12] [PASSED] Link rate 540000 lane count 2
[00:45:12] [PASSED] Link rate 540000 lane count 1
[00:45:12] [PASSED] Link rate 270000 lane count 4
[00:45:12] [PASSED] Link rate 270000 lane count 2
[00:45:12] [PASSED] Link rate 270000 lane count 1
[00:45:12] [PASSED] Link rate 162000 lane count 4
[00:45:12] [PASSED] Link rate 162000 lane count 2
[00:45:12] [PASSED] Link rate 162000 lane count 1
[00:45:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[00:45:12] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:45:12] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:45:12] [PASSED] DP_POWER_UP_PHY with port number
[00:45:12] [PASSED] DP_POWER_DOWN_PHY with port number
[00:45:12] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:45:12] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:45:12] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:45:12] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:45:12] [PASSED] DP_QUERY_PAYLOAD with port number
[00:45:12] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:45:12] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:45:12] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:45:12] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:45:12] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:45:12] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:45:12] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:45:12] [PASSED] DP_REMOTE_I2C_READ with port number
[00:45:12] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:45:12] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:45:12] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:45:12] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:45:12] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:45:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:45:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:45:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:45:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:45:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:45:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:45:12] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:45:12] ================ [PASSED] drm_dp_mst_helper ================
[00:45:12] ================== drm_exec (7 subtests) ===================
[00:45:12] [PASSED] sanitycheck
[00:45:12] [PASSED] test_lock
[00:45:12] [PASSED] test_lock_unlock
[00:45:12] [PASSED] test_duplicates
[00:45:12] [PASSED] test_prepare
[00:45:12] [PASSED] test_prepare_array
[00:45:12] [PASSED] test_multiple_loops
[00:45:12] ==================== [PASSED] drm_exec =====================
[00:45:12] =========== drm_format_helper_test (17 subtests) ===========
[00:45:12] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:45:12] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:45:12] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:45:12] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:45:12] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:45:12] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:45:12] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:45:12] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[00:45:12] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:45:12] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:45:12] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:45:12] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:45:12] ==================== drm_test_fb_swab  =====================
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ================ [PASSED] drm_test_fb_swab =================
[00:45:12] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[00:45:12] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[00:45:12] [PASSED] single_pixel_source_buffer
[00:45:12] [PASSED] single_pixel_clip_rectangle
[00:45:12] [PASSED] well_known_colors
[00:45:12] [PASSED] destination_pitch
[00:45:12] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[00:45:12] ================= drm_test_fb_clip_offset  =================
[00:45:12] [PASSED] pass through
[00:45:12] [PASSED] horizontal offset
[00:45:12] [PASSED] vertical offset
[00:45:12] [PASSED] horizontal and vertical offset
[00:45:12] [PASSED] horizontal offset (custom pitch)
[00:45:12] [PASSED] vertical offset (custom pitch)
[00:45:12] [PASSED] horizontal and vertical offset (custom pitch)
[00:45:12] ============= [PASSED] drm_test_fb_clip_offset =============
[00:45:12] =================== drm_test_fb_memcpy  ====================
[00:45:12] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:45:12] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:45:12] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:45:12] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:45:12] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:45:12] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:45:12] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:45:12] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:45:12] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:45:12] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:45:12] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:45:12] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:45:12] =============== [PASSED] drm_test_fb_memcpy ================
[00:45:12] ============= [PASSED] drm_format_helper_test ==============
[00:45:12] ================= drm_format (18 subtests) =================
[00:45:12] [PASSED] drm_test_format_block_width_invalid
[00:45:12] [PASSED] drm_test_format_block_width_one_plane
[00:45:12] [PASSED] drm_test_format_block_width_two_plane
[00:45:12] [PASSED] drm_test_format_block_width_three_plane
[00:45:12] [PASSED] drm_test_format_block_width_tiled
[00:45:12] [PASSED] drm_test_format_block_height_invalid
[00:45:12] [PASSED] drm_test_format_block_height_one_plane
[00:45:12] [PASSED] drm_test_format_block_height_two_plane
[00:45:12] [PASSED] drm_test_format_block_height_three_plane
[00:45:12] [PASSED] drm_test_format_block_height_tiled
[00:45:12] [PASSED] drm_test_format_min_pitch_invalid
[00:45:12] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:45:12] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:45:12] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:45:12] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:45:12] [PASSED] drm_test_format_min_pitch_two_plane
[00:45:12] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:45:12] [PASSED] drm_test_format_min_pitch_tiled
[00:45:12] =================== [PASSED] drm_format ====================
[00:45:12] ============== drm_framebuffer (10 subtests) ===============
[00:45:12] ========== drm_test_framebuffer_check_src_coords  ==========
[00:45:12] [PASSED] Success: source fits into fb
[00:45:12] [PASSED] Fail: overflowing fb with x-axis coordinate
[00:45:12] [PASSED] Fail: overflowing fb with y-axis coordinate
[00:45:12] [PASSED] Fail: overflowing fb with source width
[00:45:12] [PASSED] Fail: overflowing fb with source height
[00:45:12] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[00:45:12] [PASSED] drm_test_framebuffer_cleanup
[00:45:12] =============== drm_test_framebuffer_create  ===============
[00:45:12] [PASSED] ABGR8888 normal sizes
[00:45:12] [PASSED] ABGR8888 max sizes
[00:45:12] [PASSED] ABGR8888 pitch greater than min required
[00:45:12] [PASSED] ABGR8888 pitch less than min required
[00:45:12] [PASSED] ABGR8888 Invalid width
[00:45:12] [PASSED] ABGR8888 Invalid buffer handle
[00:45:12] [PASSED] No pixel format
[00:45:12] [PASSED] ABGR8888 Width 0
[00:45:12] [PASSED] ABGR8888 Height 0
[00:45:12] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:45:12] [PASSED] ABGR8888 Large buffer offset
[00:45:12] [PASSED] ABGR8888 Buffer offset for inexistent plane
[00:45:12] [PASSED] ABGR8888 Invalid flag
[00:45:12] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:45:12] [PASSED] ABGR8888 Valid buffer modifier
[00:45:12] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:45:12] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:45:12] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:45:12] [PASSED] NV12 Normal sizes
[00:45:12] [PASSED] NV12 Max sizes
[00:45:12] [PASSED] NV12 Invalid pitch
[00:45:12] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:45:12] [PASSED] NV12 different  modifier per-plane
[00:45:12] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:45:12] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:45:12] [PASSED] NV12 Modifier for inexistent plane
[00:45:12] [PASSED] NV12 Handle for inexistent plane
[00:45:12] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:45:12] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:45:12] [PASSED] YVU420 Normal sizes
[00:45:12] [PASSED] YVU420 Max sizes
[00:45:12] [PASSED] YVU420 Invalid pitch
[00:45:12] [PASSED] YVU420 Different pitches
[00:45:12] [PASSED] YVU420 Different buffer offsets/pitches
[00:45:12] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:45:12] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:45:12] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:45:12] [PASSED] YVU420 Valid modifier
[00:45:12] [PASSED] YVU420 Different modifiers per plane
[00:45:12] [PASSED] YVU420 Modifier for inexistent plane
[00:45:12] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[00:45:12] [PASSED] X0L2 Normal sizes
[00:45:12] [PASSED] X0L2 Max sizes
[00:45:12] [PASSED] X0L2 Invalid pitch
[00:45:12] [PASSED] X0L2 Pitch greater than minimum required
[00:45:12] [PASSED] X0L2 Handle for inexistent plane
[00:45:12] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:45:12] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:45:12] [PASSED] X0L2 Valid modifier
[00:45:12] [PASSED] X0L2 Modifier for inexistent plane
[00:45:12] =========== [PASSED] drm_test_framebuffer_create ===========
[00:45:12] [PASSED] drm_test_framebuffer_free
[00:45:12] [PASSED] drm_test_framebuffer_init
[00:45:12] [PASSED] drm_test_framebuffer_init_bad_format
[00:45:12] [PASSED] drm_test_framebuffer_init_dev_mismatch
[00:45:12] [PASSED] drm_test_framebuffer_lookup
[00:45:12] [PASSED] drm_test_framebuffer_lookup_inexistent
[00:45:12] [PASSED] drm_test_framebuffer_modifiers_not_supported
[00:45:12] ================= [PASSED] drm_framebuffer =================
[00:45:12] ================ drm_gem_shmem (8 subtests) ================
[00:45:12] [PASSED] drm_gem_shmem_test_obj_create
[00:45:12] [PASSED] drm_gem_shmem_test_obj_create_private
[00:45:12] [PASSED] drm_gem_shmem_test_pin_pages
[00:45:12] [PASSED] drm_gem_shmem_test_vmap
[00:45:12] [PASSED] drm_gem_shmem_test_get_sg_table
[00:45:12] [PASSED] drm_gem_shmem_test_get_pages_sgt
[00:45:12] [PASSED] drm_gem_shmem_test_madvise
[00:45:12] [PASSED] drm_gem_shmem_test_purge
[00:45:12] ================== [PASSED] drm_gem_shmem ==================
[00:45:12] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[00:45:12] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[00:45:12] [PASSED] Automatic
[00:45:12] [PASSED] Full
[00:45:12] [PASSED] Limited 16:235
[00:45:12] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[00:45:12] [PASSED] drm_test_check_disable_connector
[00:45:12] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[00:45:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[00:45:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[00:45:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[00:45:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[00:45:12] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[00:45:12] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[00:45:12] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[00:45:12] [PASSED] drm_test_check_output_bpc_dvi
[00:45:12] [PASSED] drm_test_check_output_bpc_format_vic_1
[00:45:12] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[00:45:12] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[00:45:12] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[00:45:12] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[00:45:12] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[00:45:12] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[00:45:12] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[00:45:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[00:45:12] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[00:45:12] [PASSED] drm_test_check_broadcast_rgb_value
[00:45:12] [PASSED] drm_test_check_bpc_8_value
[00:45:12] [PASSED] drm_test_check_bpc_10_value
[00:45:12] [PASSED] drm_test_check_bpc_12_value
[00:45:12] [PASSED] drm_test_check_format_value
[00:45:12] [PASSED] drm_test_check_tmds_char_value
[00:45:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[00:45:12] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[00:45:12] [PASSED] drm_test_check_mode_valid
[00:45:12] [PASSED] drm_test_check_mode_valid_reject
[00:45:12] [PASSED] drm_test_check_mode_valid_reject_rate
[00:45:12] [PASSED] drm_test_check_mode_valid_reject_max_clock
[00:45:12] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[00:45:12] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[00:45:12] [PASSED] drm_test_check_infoframes
[00:45:12] [PASSED] drm_test_check_reject_avi_infoframe
[00:45:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[00:45:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[00:45:12] [PASSED] drm_test_check_reject_audio_infoframe
[00:45:12] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[00:45:12] ================= drm_managed (2 subtests) =================
[00:45:12] [PASSED] drm_test_managed_release_action
[00:45:12] [PASSED] drm_test_managed_run_action
[00:45:12] =================== [PASSED] drm_managed ===================
[00:45:12] =================== drm_mm (6 subtests) ====================
[00:45:12] [PASSED] drm_test_mm_init
[00:45:12] [PASSED] drm_test_mm_debug
[00:45:12] [PASSED] drm_test_mm_align32
[00:45:12] [PASSED] drm_test_mm_align64
[00:45:12] [PASSED] drm_test_mm_lowest
[00:45:12] [PASSED] drm_test_mm_highest
[00:45:12] ===================== [PASSED] drm_mm ======================
[00:45:12] ============= drm_modes_analog_tv (5 subtests) =============
[00:45:12] [PASSED] drm_test_modes_analog_tv_mono_576i
[00:45:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:45:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:45:12] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:45:12] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:45:12] =============== [PASSED] drm_modes_analog_tv ===============
[00:45:12] ============== drm_plane_helper (2 subtests) ===============
[00:45:12] =============== drm_test_check_plane_state  ================
[00:45:12] [PASSED] clipping_simple
[00:45:12] [PASSED] clipping_rotate_reflect
[00:45:12] [PASSED] positioning_simple
[00:45:12] [PASSED] upscaling
[00:45:12] [PASSED] downscaling
[00:45:12] [PASSED] rounding1
[00:45:12] [PASSED] rounding2
[00:45:12] [PASSED] rounding3
[00:45:12] [PASSED] rounding4
[00:45:12] =========== [PASSED] drm_test_check_plane_state ============
[00:45:12] =========== drm_test_check_invalid_plane_state  ============
[00:45:12] [PASSED] positioning_invalid
[00:45:12] [PASSED] upscaling_invalid
[00:45:12] [PASSED] downscaling_invalid
[00:45:12] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:45:12] ================ [PASSED] drm_plane_helper =================
[00:45:12] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[00:45:12] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:45:12] [PASSED] None
[00:45:12] [PASSED] PAL
[00:45:12] [PASSED] NTSC
[00:45:12] [PASSED] Both, NTSC Default
[00:45:12] [PASSED] Both, PAL Default
[00:45:12] [PASSED] Both, NTSC Default, with PAL on command-line
[00:45:12] [PASSED] Both, PAL Default, with NTSC on command-line
[00:45:12] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:45:12] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:45:12] ================== drm_rect (9 subtests) ===================
[00:45:12] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:45:12] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:45:12] [PASSED] drm_test_rect_clip_scaled_clipped
[00:45:12] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:45:12] ================= drm_test_rect_intersect  =================
[00:45:12] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:45:12] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:45:12] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:45:12] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:45:12] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:45:12] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:45:12] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:45:12] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:45:12] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:45:12] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:45:12] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:45:12] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:45:12] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:45:12] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:45:12] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:45:12] ============= [PASSED] drm_test_rect_intersect =============
[00:45:12] ================ drm_test_rect_calc_hscale  ================
[00:45:12] [PASSED] normal use
[00:45:12] [PASSED] out of max range
[00:45:12] [PASSED] out of min range
[00:45:12] [PASSED] zero dst
[00:45:12] [PASSED] negative src
[00:45:12] [PASSED] negative dst
[00:45:12] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:45:12] ================ drm_test_rect_calc_vscale  ================
[00:45:12] [PASSED] normal use
[00:45:12] [PASSED] out of max range
[00:45:12] [PASSED] out of min range
[00:45:12] [PASSED] zero dst
[00:45:12] [PASSED] negative src
[00:45:12] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[00:45:12] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:45:12] ================== drm_test_rect_rotate  ===================
[00:45:12] [PASSED] reflect-x
[00:45:12] [PASSED] reflect-y
[00:45:12] [PASSED] rotate-0
[00:45:12] [PASSED] rotate-90
[00:45:12] [PASSED] rotate-180
[00:45:12] [PASSED] rotate-270
[00:45:12] ============== [PASSED] drm_test_rect_rotate ===============
[00:45:12] ================ drm_test_rect_rotate_inv  =================
[00:45:12] [PASSED] reflect-x
[00:45:12] [PASSED] reflect-y
[00:45:12] [PASSED] rotate-0
[00:45:12] [PASSED] rotate-90
[00:45:12] [PASSED] rotate-180
[00:45:12] [PASSED] rotate-270
[00:45:12] ============ [PASSED] drm_test_rect_rotate_inv =============
[00:45:12] ==================== [PASSED] drm_rect =====================
[00:45:12] ============ drm_sysfb_modeset_test (1 subtest) ============
[00:45:12] ============ drm_test_sysfb_build_fourcc_list  =============
[00:45:12] [PASSED] no native formats
[00:45:12] [PASSED] XRGB8888 as native format
[00:45:12] [PASSED] remove duplicates
[00:45:12] [PASSED] convert alpha formats
[00:45:12] [PASSED] random formats
[00:45:12] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[00:45:12] ============= [PASSED] drm_sysfb_modeset_test ==============
[00:45:12] ================== drm_fixp (2 subtests) ===================
[00:45:12] [PASSED] drm_test_int2fixp
[00:45:12] [PASSED] drm_test_sm2fixp
[00:45:12] ==================== [PASSED] drm_fixp =====================
[00:45:12] ============================================================
[00:45:12] Testing complete. Ran 621 tests: passed: 621
[00:45:12] Elapsed time: 26.251s total, 1.735s configuring, 24.299s building, 0.184s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[00:45:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:45:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:45:23] Starting KUnit Kernel (1/1)...
[00:45:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:45:23] ================= ttm_device (5 subtests) ==================
[00:45:23] [PASSED] ttm_device_init_basic
[00:45:23] [PASSED] ttm_device_init_multiple
[00:45:23] [PASSED] ttm_device_fini_basic
[00:45:23] [PASSED] ttm_device_init_no_vma_man
[00:45:23] ================== ttm_device_init_pools  ==================
[00:45:23] [PASSED] No DMA allocations, no DMA32 required
[00:45:23] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[00:45:23] Expected !list_lru_count(&pt.pages) to be false, but is true
[00:45:23] [FAILED] DMA allocations, DMA32 required
[00:45:23] [PASSED] No DMA allocations, DMA32 required
[00:45:23]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[00:45:23]     Expected !list_lru_count(&pt.pages) to be false, but is true
[00:45:23] ------------[ cut here ]------------
[00:45:23] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[00:45:23] refcount_t: underflow; use-after-free.
[00:45:23] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g49563b7509ba #3 VOLUNTARY
[00:45:23] Tainted: [W]=WARN, [N]=TEST
[00:45:23] Stack:
[00:45:23]  6044ed8b 00000000 00000000 00000001
[00:45:23]  ffffff00 6044ed8b 6032367a 00000009
[00:45:23]  0000001c 60043e88 6002381c b78cbd40
[00:45:23] Call Trace:
[00:45:23]  [<6032367a>] ? devres_release_all+0xaa/0x100
[00:45:23]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[00:45:23]  [<6002381c>] ? _printk+0x0/0x65
[00:45:23]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[00:45:23]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[00:45:23]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[00:45:23]  [<60052e36>] ? um_set_signals+0x36/0x60
[00:45:23]  [<600c5a42>] ? call_rcu+0x52/0x90
[00:45:23]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[00:45:23]  [<60147f50>] ? kfree+0x0/0x250
[00:45:23]  [<6032367a>] ? devres_release_all+0xaa/0x100
[00:45:23]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[00:45:23]  [<6031c3c0>] ? bus_notify+0x0/0x60
[00:45:23]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[00:45:23]  [<60398620>] ? mutex_lock+0x0/0x40
[00:45:23]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[00:45:23]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[00:45:23]  [<60372210>] ? kobject_put+0x0/0x150
[00:45:23]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[00:45:23]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[00:45:23]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[00:45:23]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[00:45:23]  [<60315a8c>] ? device_del+0x1bc/0x600
[00:45:23]  [<60052e00>] ? um_set_signals+0x0/0x60
[00:45:23]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[00:45:23]  [<60052e00>] ? um_set_signals+0x0/0x60
[00:45:23]  [<60315ee4>] ? device_unregister+0x14/0x40
[00:45:23]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[00:45:23]  [<60257d70>] ? kunit_release_action+0x0/0x170
[00:45:23]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[00:45:23]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[00:45:23]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[00:45:23]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[00:45:23]  [<60081e36>] ? kthread+0xe6/0x150
[00:45:23]  [<60046435>] ? new_thread_handler+0x45/0x60
[00:45:23] ---[ end trace 0000000000000000 ]---
[00:45:23] [FAILED] DMA allocations, no DMA32 required
[00:45:23] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[00:45:23] ============== [FAILED] ttm_device_init_pools ==============
[00:45:23]     # module: ttm_device_test
[00:45:23] # ttm_device: pass:4 fail:1 skip:0 total:5
[00:45:23] # Totals: pass:6 fail:2 skip:0 total:8
[00:45:23] =================== [FAILED] ttm_device ====================
[00:45:23] ================== ttm_pool (8 subtests) ===================
[00:45:23] ================== ttm_pool_alloc_basic  ===================
[00:45:23] [PASSED] One page
[00:45:23] [PASSED] More than one page
[00:45:23] [PASSED] Above the allocation limit
[00:45:23] [PASSED] One page, with coherent DMA mappings enabled
[00:45:23] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:45:23] ============== [PASSED] ttm_pool_alloc_basic ===============
[00:45:23] ============== ttm_pool_alloc_basic_dma_addr  ==============
[00:45:23] [PASSED] One page
[00:45:23] [PASSED] More than one page
[00:45:23] [PASSED] Above the allocation limit
[00:45:23] [PASSED] One page, with coherent DMA mappings enabled
[00:45:23] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:45:23] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[00:45:23] [PASSED] ttm_pool_alloc_order_caching_match
[00:45:23] [PASSED] ttm_pool_alloc_caching_mismatch
[00:45:23] [PASSED] ttm_pool_alloc_order_mismatch
[00:45:23] [PASSED] ttm_pool_free_dma_alloc
[00:45:24] [ERROR] Test: ttm_pool: missing expected subtest!
[00:45:24] 
[00:45:24] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g49563b7509ba
[00:45:24] RIP: 0033:list_lru_count_node+0xe/0x20
[00:45:24] RSP: 00000000b78cbed8  EFLAGS: 00010246
[00:45:24] RAX: 0000000000000000 RBX: 00000000b7803c90 RCX: 0000000077e4c7d8
[00:45:24] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000077c86880
[00:45:24] RBP: 0000000077c86800 R08: 00000000b671bc28 R09: 0000000077c50c80
[00:45:24] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000077c50c80
[00:45:24] R13: 0000000060440770 R14: 000000006010eb50 R15: 0000000077c86880
[00:45:24] Kernel panic - not syncing: Segfault with no mm
[00:45:24] [CRASHED] 
[00:45:24] [ERROR] Test: ttm_pool: missing expected subtest!
[00:45:24] [CRASHED] 
[00:45:24] [ERROR] Test: ttm_pool: missing subtest result line!
[00:45:24] # module: ttm_pool_test
[00:45:24] ==================== [CRASHED] ttm_pool ====================
[00:45:24] [ERROR] Test: main: missing expected subtest!
[00:45:24] [CRASHED] 
[00:45:24] [ERROR] Test: main: missing expected subtest!
[00:45:24] [CRASHED] 
[00:45:24] [ERROR] Test: main: missing expected subtest!
[00:45:24] [CRASHED] 
[00:45:24] [ERROR] Test: main: missing expected subtest!
[00:45:24] [CRASHED] 
[00:45:24] ============================================================
[00:45:24] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[00:45:24] Elapsed time: 11.392s total, 1.682s configuring, 9.443s building, 0.266s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


