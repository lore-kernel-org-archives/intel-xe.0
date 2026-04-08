Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2470C10FC45A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 22:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A020F10E6FF;
	Wed,  8 Apr 2026 22:35:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053F310E6F2;
 Wed,  8 Apr 2026 22:35:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/debugfs=3A_Correct_prin?=
 =?utf-8?q?ting_of_register_whitelist_ranges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 22:35:26 -0000
Message-ID: <177568772697.444564.2205274675655027273@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408-regsr_wl_range-v1-1-e9a28c8b4264@intel.com>
In-Reply-To: <20260408-regsr_wl_range-v1-1-e9a28c8b4264@intel.com>
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

Series: drm/xe/debugfs: Correct printing of register whitelist ranges
URL   : https://patchwork.freedesktop.org/series/164574/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:34:09] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:34:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:34:45] Starting KUnit Kernel (1/1)...
[22:34:45] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:34:45] ================== guc_buf (11 subtests) ===================
[22:34:45] [PASSED] test_smallest
[22:34:45] [PASSED] test_largest
[22:34:45] [PASSED] test_granular
[22:34:45] [PASSED] test_unique
[22:34:45] [PASSED] test_overlap
[22:34:45] [PASSED] test_reusable
[22:34:45] [PASSED] test_too_big
[22:34:45] [PASSED] test_flush
[22:34:45] [PASSED] test_lookup
[22:34:45] [PASSED] test_data
[22:34:45] [PASSED] test_class
[22:34:45] ===================== [PASSED] guc_buf =====================
[22:34:45] =================== guc_dbm (7 subtests) ===================
[22:34:45] [PASSED] test_empty
[22:34:45] [PASSED] test_default
[22:34:45] ======================== test_size  ========================
[22:34:45] [PASSED] 4
[22:34:45] [PASSED] 8
[22:34:45] [PASSED] 32
[22:34:45] [PASSED] 256
[22:34:45] ==================== [PASSED] test_size ====================
[22:34:45] ======================= test_reuse  ========================
[22:34:45] [PASSED] 4
[22:34:45] [PASSED] 8
[22:34:45] [PASSED] 32
[22:34:45] [PASSED] 256
[22:34:45] =================== [PASSED] test_reuse ====================
[22:34:45] =================== test_range_overlap  ====================
[22:34:45] [PASSED] 4
[22:34:45] [PASSED] 8
[22:34:45] [PASSED] 32
[22:34:45] [PASSED] 256
[22:34:45] =============== [PASSED] test_range_overlap ================
[22:34:45] =================== test_range_compact  ====================
[22:34:45] [PASSED] 4
[22:34:45] [PASSED] 8
[22:34:45] [PASSED] 32
[22:34:45] [PASSED] 256
[22:34:45] =============== [PASSED] test_range_compact ================
[22:34:45] ==================== test_range_spare  =====================
[22:34:45] [PASSED] 4
[22:34:45] [PASSED] 8
[22:34:45] [PASSED] 32
[22:34:45] [PASSED] 256
[22:34:45] ================ [PASSED] test_range_spare =================
[22:34:45] ===================== [PASSED] guc_dbm =====================
[22:34:45] =================== guc_idm (6 subtests) ===================
[22:34:45] [PASSED] bad_init
[22:34:45] [PASSED] no_init
[22:34:45] [PASSED] init_fini
[22:34:45] [PASSED] check_used
[22:34:45] [PASSED] check_quota
[22:34:45] [PASSED] check_all
[22:34:45] ===================== [PASSED] guc_idm =====================
[22:34:45] ================== no_relay (3 subtests) ===================
[22:34:45] [PASSED] xe_drops_guc2pf_if_not_ready
[22:34:45] [PASSED] xe_drops_guc2vf_if_not_ready
[22:34:45] [PASSED] xe_rejects_send_if_not_ready
[22:34:45] ==================== [PASSED] no_relay =====================
[22:34:45] ================== pf_relay (14 subtests) ==================
[22:34:45] [PASSED] pf_rejects_guc2pf_too_short
[22:34:45] [PASSED] pf_rejects_guc2pf_too_long
[22:34:45] [PASSED] pf_rejects_guc2pf_no_payload
[22:34:45] [PASSED] pf_fails_no_payload
[22:34:45] [PASSED] pf_fails_bad_origin
[22:34:45] [PASSED] pf_fails_bad_type
[22:34:45] [PASSED] pf_txn_reports_error
[22:34:45] [PASSED] pf_txn_sends_pf2guc
[22:34:45] [PASSED] pf_sends_pf2guc
[22:34:45] [SKIPPED] pf_loopback_nop
[22:34:45] [SKIPPED] pf_loopback_echo
[22:34:45] [SKIPPED] pf_loopback_fail
[22:34:45] [SKIPPED] pf_loopback_busy
[22:34:45] [SKIPPED] pf_loopback_retry
[22:34:45] ==================== [PASSED] pf_relay =====================
[22:34:45] ================== vf_relay (3 subtests) ===================
[22:34:45] [PASSED] vf_rejects_guc2vf_too_short
[22:34:45] [PASSED] vf_rejects_guc2vf_too_long
[22:34:45] [PASSED] vf_rejects_guc2vf_no_payload
[22:34:45] ==================== [PASSED] vf_relay =====================
[22:34:45] ================ pf_gt_config (9 subtests) =================
[22:34:45] [PASSED] fair_contexts_1vf
[22:34:45] [PASSED] fair_doorbells_1vf
[22:34:45] [PASSED] fair_ggtt_1vf
[22:34:45] ====================== fair_vram_1vf  ======================
[22:34:45] [PASSED] 3.50 GiB
[22:34:45] [PASSED] 11.5 GiB
[22:34:45] [PASSED] 15.5 GiB
[22:34:45] [PASSED] 31.5 GiB
[22:34:45] [PASSED] 63.5 GiB
[22:34:45] [PASSED] 1.91 GiB
[22:34:45] ================== [PASSED] fair_vram_1vf ==================
[22:34:45] ================ fair_vram_1vf_admin_only  =================
[22:34:45] [PASSED] 3.50 GiB
[22:34:45] [PASSED] 11.5 GiB
[22:34:45] [PASSED] 15.5 GiB
[22:34:45] [PASSED] 31.5 GiB
[22:34:45] [PASSED] 63.5 GiB
[22:34:45] [PASSED] 1.91 GiB
[22:34:45] ============ [PASSED] fair_vram_1vf_admin_only =============
[22:34:45] ====================== fair_contexts  ======================
[22:34:45] [PASSED] 1 VF
[22:34:45] [PASSED] 2 VFs
[22:34:45] [PASSED] 3 VFs
[22:34:45] [PASSED] 4 VFs
[22:34:45] [PASSED] 5 VFs
[22:34:45] [PASSED] 6 VFs
[22:34:45] [PASSED] 7 VFs
[22:34:45] [PASSED] 8 VFs
[22:34:45] [PASSED] 9 VFs
[22:34:45] [PASSED] 10 VFs
[22:34:45] [PASSED] 11 VFs
[22:34:45] [PASSED] 12 VFs
[22:34:45] [PASSED] 13 VFs
[22:34:45] [PASSED] 14 VFs
[22:34:45] [PASSED] 15 VFs
[22:34:45] [PASSED] 16 VFs
[22:34:45] [PASSED] 17 VFs
[22:34:45] [PASSED] 18 VFs
[22:34:45] [PASSED] 19 VFs
[22:34:45] [PASSED] 20 VFs
[22:34:45] [PASSED] 21 VFs
[22:34:45] [PASSED] 22 VFs
[22:34:45] [PASSED] 23 VFs
[22:34:45] [PASSED] 24 VFs
[22:34:45] [PASSED] 25 VFs
[22:34:45] [PASSED] 26 VFs
[22:34:45] [PASSED] 27 VFs
[22:34:45] [PASSED] 28 VFs
[22:34:45] [PASSED] 29 VFs
[22:34:45] [PASSED] 30 VFs
[22:34:45] [PASSED] 31 VFs
[22:34:45] [PASSED] 32 VFs
[22:34:45] [PASSED] 33 VFs
[22:34:45] [PASSED] 34 VFs
[22:34:45] [PASSED] 35 VFs
[22:34:45] [PASSED] 36 VFs
[22:34:45] [PASSED] 37 VFs
[22:34:45] [PASSED] 38 VFs
[22:34:45] [PASSED] 39 VFs
[22:34:45] [PASSED] 40 VFs
[22:34:45] [PASSED] 41 VFs
[22:34:45] [PASSED] 42 VFs
[22:34:45] [PASSED] 43 VFs
[22:34:45] [PASSED] 44 VFs
[22:34:45] [PASSED] 45 VFs
[22:34:45] [PASSED] 46 VFs
[22:34:45] [PASSED] 47 VFs
[22:34:45] [PASSED] 48 VFs
[22:34:45] [PASSED] 49 VFs
[22:34:45] [PASSED] 50 VFs
[22:34:45] [PASSED] 51 VFs
[22:34:45] [PASSED] 52 VFs
[22:34:45] [PASSED] 53 VFs
[22:34:45] [PASSED] 54 VFs
[22:34:45] [PASSED] 55 VFs
[22:34:45] [PASSED] 56 VFs
[22:34:45] [PASSED] 57 VFs
[22:34:45] [PASSED] 58 VFs
[22:34:45] [PASSED] 59 VFs
[22:34:45] [PASSED] 60 VFs
[22:34:45] [PASSED] 61 VFs
[22:34:45] [PASSED] 62 VFs
[22:34:45] [PASSED] 63 VFs
[22:34:45] ================== [PASSED] fair_contexts ==================
[22:34:45] ===================== fair_doorbells  ======================
[22:34:45] [PASSED] 1 VF
[22:34:45] [PASSED] 2 VFs
[22:34:45] [PASSED] 3 VFs
[22:34:45] [PASSED] 4 VFs
[22:34:45] [PASSED] 5 VFs
[22:34:45] [PASSED] 6 VFs
[22:34:45] [PASSED] 7 VFs
[22:34:45] [PASSED] 8 VFs
[22:34:45] [PASSED] 9 VFs
[22:34:45] [PASSED] 10 VFs
[22:34:45] [PASSED] 11 VFs
[22:34:45] [PASSED] 12 VFs
[22:34:45] [PASSED] 13 VFs
[22:34:45] [PASSED] 14 VFs
[22:34:45] [PASSED] 15 VFs
[22:34:45] [PASSED] 16 VFs
[22:34:45] [PASSED] 17 VFs
[22:34:45] [PASSED] 18 VFs
[22:34:45] [PASSED] 19 VFs
[22:34:45] [PASSED] 20 VFs
[22:34:45] [PASSED] 21 VFs
[22:34:45] [PASSED] 22 VFs
[22:34:45] [PASSED] 23 VFs
[22:34:45] [PASSED] 24 VFs
[22:34:45] [PASSED] 25 VFs
[22:34:45] [PASSED] 26 VFs
[22:34:45] [PASSED] 27 VFs
[22:34:45] [PASSED] 28 VFs
[22:34:45] [PASSED] 29 VFs
[22:34:45] [PASSED] 30 VFs
[22:34:45] [PASSED] 31 VFs
[22:34:45] [PASSED] 32 VFs
[22:34:45] [PASSED] 33 VFs
[22:34:45] [PASSED] 34 VFs
[22:34:45] [PASSED] 35 VFs
[22:34:45] [PASSED] 36 VFs
[22:34:45] [PASSED] 37 VFs
[22:34:45] [PASSED] 38 VFs
[22:34:45] [PASSED] 39 VFs
[22:34:45] [PASSED] 40 VFs
[22:34:45] [PASSED] 41 VFs
[22:34:45] [PASSED] 42 VFs
[22:34:45] [PASSED] 43 VFs
[22:34:45] [PASSED] 44 VFs
[22:34:45] [PASSED] 45 VFs
[22:34:45] [PASSED] 46 VFs
[22:34:45] [PASSED] 47 VFs
[22:34:45] [PASSED] 48 VFs
[22:34:45] [PASSED] 49 VFs
[22:34:45] [PASSED] 50 VFs
[22:34:45] [PASSED] 51 VFs
[22:34:45] [PASSED] 52 VFs
[22:34:45] [PASSED] 53 VFs
[22:34:45] [PASSED] 54 VFs
[22:34:45] [PASSED] 55 VFs
[22:34:45] [PASSED] 56 VFs
[22:34:45] [PASSED] 57 VFs
[22:34:45] [PASSED] 58 VFs
[22:34:45] [PASSED] 59 VFs
[22:34:45] [PASSED] 60 VFs
[22:34:45] [PASSED] 61 VFs
[22:34:45] [PASSED] 62 VFs
[22:34:45] [PASSED] 63 VFs
[22:34:45] ================= [PASSED] fair_doorbells ==================
[22:34:45] ======================== fair_ggtt  ========================
[22:34:45] [PASSED] 1 VF
[22:34:45] [PASSED] 2 VFs
[22:34:45] [PASSED] 3 VFs
[22:34:45] [PASSED] 4 VFs
[22:34:45] [PASSED] 5 VFs
[22:34:45] [PASSED] 6 VFs
[22:34:45] [PASSED] 7 VFs
[22:34:45] [PASSED] 8 VFs
[22:34:45] [PASSED] 9 VFs
[22:34:45] [PASSED] 10 VFs
[22:34:45] [PASSED] 11 VFs
[22:34:45] [PASSED] 12 VFs
[22:34:45] [PASSED] 13 VFs
[22:34:45] [PASSED] 14 VFs
[22:34:45] [PASSED] 15 VFs
[22:34:45] [PASSED] 16 VFs
[22:34:45] [PASSED] 17 VFs
[22:34:45] [PASSED] 18 VFs
[22:34:45] [PASSED] 19 VFs
[22:34:45] [PASSED] 20 VFs
[22:34:45] [PASSED] 21 VFs
[22:34:45] [PASSED] 22 VFs
[22:34:45] [PASSED] 23 VFs
[22:34:45] [PASSED] 24 VFs
[22:34:45] [PASSED] 25 VFs
[22:34:45] [PASSED] 26 VFs
[22:34:45] [PASSED] 27 VFs
[22:34:45] [PASSED] 28 VFs
[22:34:45] [PASSED] 29 VFs
[22:34:45] [PASSED] 30 VFs
[22:34:45] [PASSED] 31 VFs
[22:34:45] [PASSED] 32 VFs
[22:34:45] [PASSED] 33 VFs
[22:34:45] [PASSED] 34 VFs
[22:34:45] [PASSED] 35 VFs
[22:34:45] [PASSED] 36 VFs
[22:34:45] [PASSED] 37 VFs
[22:34:45] [PASSED] 38 VFs
[22:34:45] [PASSED] 39 VFs
[22:34:45] [PASSED] 40 VFs
[22:34:45] [PASSED] 41 VFs
[22:34:45] [PASSED] 42 VFs
[22:34:45] [PASSED] 43 VFs
[22:34:45] [PASSED] 44 VFs
[22:34:45] [PASSED] 45 VFs
[22:34:45] [PASSED] 46 VFs
[22:34:45] [PASSED] 47 VFs
[22:34:45] [PASSED] 48 VFs
[22:34:45] [PASSED] 49 VFs
[22:34:45] [PASSED] 50 VFs
[22:34:45] [PASSED] 51 VFs
[22:34:45] [PASSED] 52 VFs
[22:34:45] [PASSED] 53 VFs
[22:34:45] [PASSED] 54 VFs
[22:34:45] [PASSED] 55 VFs
[22:34:45] [PASSED] 56 VFs
[22:34:45] [PASSED] 57 VFs
[22:34:45] [PASSED] 58 VFs
[22:34:45] [PASSED] 59 VFs
[22:34:45] [PASSED] 60 VFs
[22:34:45] [PASSED] 61 VFs
[22:34:45] [PASSED] 62 VFs
[22:34:45] [PASSED] 63 VFs
[22:34:45] ==================== [PASSED] fair_ggtt ====================
[22:34:45] ======================== fair_vram  ========================
[22:34:45] [PASSED] 1 VF
[22:34:45] [PASSED] 2 VFs
[22:34:45] [PASSED] 3 VFs
[22:34:45] [PASSED] 4 VFs
[22:34:45] [PASSED] 5 VFs
[22:34:45] [PASSED] 6 VFs
[22:34:45] [PASSED] 7 VFs
[22:34:45] [PASSED] 8 VFs
[22:34:45] [PASSED] 9 VFs
[22:34:45] [PASSED] 10 VFs
[22:34:45] [PASSED] 11 VFs
[22:34:45] [PASSED] 12 VFs
[22:34:45] [PASSED] 13 VFs
[22:34:45] [PASSED] 14 VFs
[22:34:45] [PASSED] 15 VFs
[22:34:45] [PASSED] 16 VFs
[22:34:45] [PASSED] 17 VFs
[22:34:45] [PASSED] 18 VFs
[22:34:45] [PASSED] 19 VFs
[22:34:45] [PASSED] 20 VFs
[22:34:45] [PASSED] 21 VFs
[22:34:45] [PASSED] 22 VFs
[22:34:45] [PASSED] 23 VFs
[22:34:45] [PASSED] 24 VFs
[22:34:45] [PASSED] 25 VFs
[22:34:45] [PASSED] 26 VFs
[22:34:45] [PASSED] 27 VFs
[22:34:45] [PASSED] 28 VFs
[22:34:45] [PASSED] 29 VFs
[22:34:45] [PASSED] 30 VFs
[22:34:45] [PASSED] 31 VFs
[22:34:45] [PASSED] 32 VFs
[22:34:45] [PASSED] 33 VFs
[22:34:45] [PASSED] 34 VFs
[22:34:45] [PASSED] 35 VFs
[22:34:45] [PASSED] 36 VFs
[22:34:45] [PASSED] 37 VFs
[22:34:45] [PASSED] 38 VFs
[22:34:45] [PASSED] 39 VFs
[22:34:45] [PASSED] 40 VFs
[22:34:45] [PASSED] 41 VFs
[22:34:45] [PASSED] 42 VFs
[22:34:45] [PASSED] 43 VFs
[22:34:45] [PASSED] 44 VFs
[22:34:45] [PASSED] 45 VFs
[22:34:45] [PASSED] 46 VFs
[22:34:45] [PASSED] 47 VFs
[22:34:45] [PASSED] 48 VFs
[22:34:45] [PASSED] 49 VFs
[22:34:45] [PASSED] 50 VFs
[22:34:45] [PASSED] 51 VFs
[22:34:45] [PASSED] 52 VFs
[22:34:45] [PASSED] 53 VFs
[22:34:45] [PASSED] 54 VFs
[22:34:45] [PASSED] 55 VFs
[22:34:45] [PASSED] 56 VFs
[22:34:45] [PASSED] 57 VFs
[22:34:45] [PASSED] 58 VFs
[22:34:45] [PASSED] 59 VFs
[22:34:45] [PASSED] 60 VFs
[22:34:45] [PASSED] 61 VFs
[22:34:45] [PASSED] 62 VFs
[22:34:45] [PASSED] 63 VFs
[22:34:45] ==================== [PASSED] fair_vram ====================
[22:34:45] ================== [PASSED] pf_gt_config ===================
[22:34:45] ===================== lmtt (1 subtest) =====================
[22:34:45] ======================== test_ops  =========================
[22:34:45] [PASSED] 2-level
[22:34:45] [PASSED] multi-level
[22:34:45] ==================== [PASSED] test_ops =====================
[22:34:45] ====================== [PASSED] lmtt =======================
[22:34:45] ================= pf_service (11 subtests) =================
[22:34:45] [PASSED] pf_negotiate_any
[22:34:45] [PASSED] pf_negotiate_base_match
[22:34:45] [PASSED] pf_negotiate_base_newer
[22:34:45] [PASSED] pf_negotiate_base_next
[22:34:45] [SKIPPED] pf_negotiate_base_older
[22:34:45] [PASSED] pf_negotiate_base_prev
[22:34:45] [PASSED] pf_negotiate_latest_match
[22:34:45] [PASSED] pf_negotiate_latest_newer
[22:34:45] [PASSED] pf_negotiate_latest_next
[22:34:45] [SKIPPED] pf_negotiate_latest_older
[22:34:45] [SKIPPED] pf_negotiate_latest_prev
[22:34:45] =================== [PASSED] pf_service ====================
[22:34:45] ================= xe_guc_g2g (2 subtests) ==================
[22:34:45] ============== xe_live_guc_g2g_kunit_default  ==============
[22:34:45] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[22:34:45] ============== xe_live_guc_g2g_kunit_allmem  ===============
[22:34:45] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[22:34:45] =================== [SKIPPED] xe_guc_g2g ===================
[22:34:45] =================== xe_mocs (2 subtests) ===================
[22:34:45] ================ xe_live_mocs_kernel_kunit  ================
[22:34:45] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[22:34:45] ================ xe_live_mocs_reset_kunit  =================
[22:34:45] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[22:34:45] ==================== [SKIPPED] xe_mocs =====================
[22:34:45] ================= xe_migrate (2 subtests) ==================
[22:34:45] ================= xe_migrate_sanity_kunit  =================
[22:34:45] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[22:34:45] ================== xe_validate_ccs_kunit  ==================
[22:34:45] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[22:34:45] =================== [SKIPPED] xe_migrate ===================
[22:34:45] ================== xe_dma_buf (1 subtest) ==================
[22:34:45] ==================== xe_dma_buf_kunit  =====================
[22:34:45] ================ [SKIPPED] xe_dma_buf_kunit ================
[22:34:45] =================== [SKIPPED] xe_dma_buf ===================
[22:34:45] ================= xe_bo_shrink (1 subtest) =================
[22:34:45] =================== xe_bo_shrink_kunit  ====================
[22:34:45] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[22:34:45] ================== [SKIPPED] xe_bo_shrink ==================
[22:34:45] ==================== xe_bo (2 subtests) ====================
[22:34:45] ================== xe_ccs_migrate_kunit  ===================
[22:34:45] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[22:34:45] ==================== xe_bo_evict_kunit  ====================
[22:34:45] =============== [SKIPPED] xe_bo_evict_kunit ================
[22:34:45] ===================== [SKIPPED] xe_bo ======================
[22:34:45] ==================== args (13 subtests) ====================
[22:34:45] [PASSED] count_args_test
[22:34:45] [PASSED] call_args_example
[22:34:45] [PASSED] call_args_test
[22:34:45] [PASSED] drop_first_arg_example
[22:34:45] [PASSED] drop_first_arg_test
[22:34:45] [PASSED] first_arg_example
[22:34:45] [PASSED] first_arg_test
[22:34:45] [PASSED] last_arg_example
[22:34:45] [PASSED] last_arg_test
[22:34:45] [PASSED] pick_arg_example
[22:34:45] [PASSED] if_args_example
[22:34:45] [PASSED] if_args_test
[22:34:45] [PASSED] sep_comma_example
[22:34:45] ====================== [PASSED] args =======================
[22:34:45] =================== xe_pci (3 subtests) ====================
[22:34:45] ==================== check_graphics_ip  ====================
[22:34:45] [PASSED] 12.00 Xe_LP
[22:34:45] [PASSED] 12.10 Xe_LP+
[22:34:45] [PASSED] 12.55 Xe_HPG
[22:34:45] [PASSED] 12.60 Xe_HPC
[22:34:45] [PASSED] 12.70 Xe_LPG
[22:34:45] [PASSED] 12.71 Xe_LPG
[22:34:45] [PASSED] 12.74 Xe_LPG+
[22:34:45] [PASSED] 20.01 Xe2_HPG
[22:34:45] [PASSED] 20.02 Xe2_HPG
[22:34:45] [PASSED] 20.04 Xe2_LPG
[22:34:45] [PASSED] 30.00 Xe3_LPG
[22:34:45] [PASSED] 30.01 Xe3_LPG
[22:34:45] [PASSED] 30.03 Xe3_LPG
[22:34:45] [PASSED] 30.04 Xe3_LPG
[22:34:45] [PASSED] 30.05 Xe3_LPG
[22:34:45] [PASSED] 35.10 Xe3p_LPG
[22:34:45] [PASSED] 35.11 Xe3p_XPC
[22:34:45] ================ [PASSED] check_graphics_ip ================
[22:34:45] ===================== check_media_ip  ======================
[22:34:45] [PASSED] 12.00 Xe_M
[22:34:45] [PASSED] 12.55 Xe_HPM
[22:34:45] [PASSED] 13.00 Xe_LPM+
[22:34:45] [PASSED] 13.01 Xe2_HPM
[22:34:45] [PASSED] 20.00 Xe2_LPM
[22:34:45] [PASSED] 30.00 Xe3_LPM
[22:34:45] [PASSED] 30.02 Xe3_LPM
[22:34:45] [PASSED] 35.00 Xe3p_LPM
[22:34:45] [PASSED] 35.03 Xe3p_HPM
[22:34:45] ================= [PASSED] check_media_ip ==================
[22:34:45] =================== check_platform_desc  ===================
[22:34:45] [PASSED] 0x9A60 (TIGERLAKE)
[22:34:45] [PASSED] 0x9A68 (TIGERLAKE)
[22:34:45] [PASSED] 0x9A70 (TIGERLAKE)
[22:34:45] [PASSED] 0x9A40 (TIGERLAKE)
[22:34:45] [PASSED] 0x9A49 (TIGERLAKE)
[22:34:45] [PASSED] 0x9A59 (TIGERLAKE)
[22:34:45] [PASSED] 0x9A78 (TIGERLAKE)
[22:34:45] [PASSED] 0x9AC0 (TIGERLAKE)
[22:34:45] [PASSED] 0x9AC9 (TIGERLAKE)
[22:34:45] [PASSED] 0x9AD9 (TIGERLAKE)
[22:34:45] [PASSED] 0x9AF8 (TIGERLAKE)
[22:34:45] [PASSED] 0x4C80 (ROCKETLAKE)
[22:34:45] [PASSED] 0x4C8A (ROCKETLAKE)
[22:34:45] [PASSED] 0x4C8B (ROCKETLAKE)
[22:34:45] [PASSED] 0x4C8C (ROCKETLAKE)
[22:34:45] [PASSED] 0x4C90 (ROCKETLAKE)
[22:34:45] [PASSED] 0x4C9A (ROCKETLAKE)
[22:34:45] [PASSED] 0x4680 (ALDERLAKE_S)
[22:34:45] [PASSED] 0x4682 (ALDERLAKE_S)
[22:34:45] [PASSED] 0x4688 (ALDERLAKE_S)
[22:34:45] [PASSED] 0x468A (ALDERLAKE_S)
[22:34:45] [PASSED] 0x468B (ALDERLAKE_S)
[22:34:45] [PASSED] 0x4690 (ALDERLAKE_S)
[22:34:45] [PASSED] 0x4692 (ALDERLAKE_S)
[22:34:45] [PASSED] 0x4693 (ALDERLAKE_S)
[22:34:45] [PASSED] 0x46A0 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46A1 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46A2 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46A3 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46A6 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46A8 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46AA (ALDERLAKE_P)
[22:34:45] [PASSED] 0x462A (ALDERLAKE_P)
[22:34:45] [PASSED] 0x4626 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x4628 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46B0 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46B1 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46B2 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46B3 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46C0 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46C1 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46C2 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46C3 (ALDERLAKE_P)
[22:34:45] [PASSED] 0x46D0 (ALDERLAKE_N)
[22:34:45] [PASSED] 0x46D1 (ALDERLAKE_N)
[22:34:45] [PASSED] 0x46D2 (ALDERLAKE_N)
[22:34:45] [PASSED] 0x46D3 (ALDERLAKE_N)
[22:34:45] [PASSED] 0x46D4 (ALDERLAKE_N)
[22:34:45] [PASSED] 0xA721 (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7A1 (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7A9 (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7AC (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7AD (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA720 (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7A0 (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7A8 (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7AA (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA7AB (ALDERLAKE_P)
[22:34:45] [PASSED] 0xA780 (ALDERLAKE_S)
[22:34:45] [PASSED] 0xA781 (ALDERLAKE_S)
[22:34:45] [PASSED] 0xA782 (ALDERLAKE_S)
[22:34:45] [PASSED] 0xA783 (ALDERLAKE_S)
[22:34:45] [PASSED] 0xA788 (ALDERLAKE_S)
[22:34:45] [PASSED] 0xA789 (ALDERLAKE_S)
[22:34:45] [PASSED] 0xA78A (ALDERLAKE_S)
[22:34:45] [PASSED] 0xA78B (ALDERLAKE_S)
[22:34:45] [PASSED] 0x4905 (DG1)
[22:34:45] [PASSED] 0x4906 (DG1)
[22:34:45] [PASSED] 0x4907 (DG1)
[22:34:45] [PASSED] 0x4908 (DG1)
[22:34:45] [PASSED] 0x4909 (DG1)
[22:34:45] [PASSED] 0x56C0 (DG2)
[22:34:45] [PASSED] 0x56C2 (DG2)
[22:34:45] [PASSED] 0x56C1 (DG2)
[22:34:45] [PASSED] 0x7D51 (METEORLAKE)
[22:34:45] [PASSED] 0x7DD1 (METEORLAKE)
[22:34:45] [PASSED] 0x7D41 (METEORLAKE)
[22:34:45] [PASSED] 0x7D67 (METEORLAKE)
[22:34:45] [PASSED] 0xB640 (METEORLAKE)
[22:34:45] [PASSED] 0x56A0 (DG2)
[22:34:45] [PASSED] 0x56A1 (DG2)
[22:34:45] [PASSED] 0x56A2 (DG2)
[22:34:45] [PASSED] 0x56BE (DG2)
[22:34:45] [PASSED] 0x56BF (DG2)
[22:34:45] [PASSED] 0x5690 (DG2)
[22:34:45] [PASSED] 0x5691 (DG2)
[22:34:45] [PASSED] 0x5692 (DG2)
[22:34:45] [PASSED] 0x56A5 (DG2)
[22:34:45] [PASSED] 0x56A6 (DG2)
[22:34:45] [PASSED] 0x56B0 (DG2)
[22:34:45] [PASSED] 0x56B1 (DG2)
[22:34:45] [PASSED] 0x56BA (DG2)
[22:34:45] [PASSED] 0x56BB (DG2)
[22:34:45] [PASSED] 0x56BC (DG2)
[22:34:45] [PASSED] 0x56BD (DG2)
[22:34:45] [PASSED] 0x5693 (DG2)
[22:34:45] [PASSED] 0x5694 (DG2)
[22:34:45] [PASSED] 0x5695 (DG2)
[22:34:45] [PASSED] 0x56A3 (DG2)
[22:34:45] [PASSED] 0x56A4 (DG2)
[22:34:45] [PASSED] 0x56B2 (DG2)
[22:34:45] [PASSED] 0x56B3 (DG2)
[22:34:45] [PASSED] 0x5696 (DG2)
[22:34:45] [PASSED] 0x5697 (DG2)
[22:34:45] [PASSED] 0xB69 (PVC)
[22:34:45] [PASSED] 0xB6E (PVC)
[22:34:45] [PASSED] 0xBD4 (PVC)
[22:34:45] [PASSED] 0xBD5 (PVC)
[22:34:45] [PASSED] 0xBD6 (PVC)
[22:34:45] [PASSED] 0xBD7 (PVC)
[22:34:45] [PASSED] 0xBD8 (PVC)
[22:34:45] [PASSED] 0xBD9 (PVC)
[22:34:45] [PASSED] 0xBDA (PVC)
[22:34:45] [PASSED] 0xBDB (PVC)
[22:34:45] [PASSED] 0xBE0 (PVC)
[22:34:45] [PASSED] 0xBE1 (PVC)
[22:34:45] [PASSED] 0xBE5 (PVC)
[22:34:45] [PASSED] 0x7D40 (METEORLAKE)
[22:34:45] [PASSED] 0x7D45 (METEORLAKE)
[22:34:45] [PASSED] 0x7D55 (METEORLAKE)
[22:34:45] [PASSED] 0x7D60 (METEORLAKE)
[22:34:45] [PASSED] 0x7DD5 (METEORLAKE)
[22:34:45] [PASSED] 0x6420 (LUNARLAKE)
[22:34:45] [PASSED] 0x64A0 (LUNARLAKE)
[22:34:45] [PASSED] 0x64B0 (LUNARLAKE)
[22:34:45] [PASSED] 0xE202 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE209 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE20B (BATTLEMAGE)
[22:34:45] [PASSED] 0xE20C (BATTLEMAGE)
[22:34:45] [PASSED] 0xE20D (BATTLEMAGE)
[22:34:45] [PASSED] 0xE210 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE211 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE212 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE216 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE220 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE221 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE222 (BATTLEMAGE)
[22:34:45] [PASSED] 0xE223 (BATTLEMAGE)
[22:34:45] [PASSED] 0xB080 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB081 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB082 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB083 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB084 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB085 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB086 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB087 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB08F (PANTHERLAKE)
[22:34:45] [PASSED] 0xB090 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB0A0 (PANTHERLAKE)
[22:34:45] [PASSED] 0xB0B0 (PANTHERLAKE)
[22:34:45] [PASSED] 0xFD80 (PANTHERLAKE)
[22:34:45] [PASSED] 0xFD81 (PANTHERLAKE)
[22:34:45] [PASSED] 0xD740 (NOVALAKE_S)
[22:34:45] [PASSED] 0xD741 (NOVALAKE_S)
[22:34:45] [PASSED] 0xD742 (NOVALAKE_S)
[22:34:45] [PASSED] 0xD743 (NOVALAKE_S)
[22:34:45] [PASSED] 0xD744 (NOVALAKE_S)
[22:34:45] [PASSED] 0xD745 (NOVALAKE_S)
[22:34:45] [PASSED] 0x674C (CRESCENTISLAND)
[22:34:45] [PASSED] 0xD750 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD751 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD752 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD753 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD754 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD755 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD756 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD757 (NOVALAKE_P)
[22:34:45] [PASSED] 0xD75F (NOVALAKE_P)
[22:34:45] =============== [PASSED] check_platform_desc ===============
[22:34:45] ===================== [PASSED] xe_pci ======================
[22:34:45] =================== xe_rtp (2 subtests) ====================
[22:34:45] =============== xe_rtp_process_to_sr_tests  ================
[22:34:45] [PASSED] coalesce-same-reg
[22:34:45] [PASSED] no-match-no-add
[22:34:45] [PASSED] match-or
[22:34:45] [PASSED] match-or-xfail
[22:34:45] [PASSED] no-match-no-add-multiple-rules
[22:34:45] [PASSED] two-regs-two-entries
[22:34:45] [PASSED] clr-one-set-other
[22:34:45] [PASSED] set-field
[22:34:45] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[22:34:45] [PASSED] conflict-not-disjoint
[22:34:45] [PASSED] conflict-reg-type
[22:34:45] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[22:34:45] ================== xe_rtp_process_tests  ===================
[22:34:45] [PASSED] active1
[22:34:45] [PASSED] active2
[22:34:45] [PASSED] active-inactive
[22:34:45] [PASSED] inactive-active
[22:34:45] [PASSED] inactive-1st_or_active-inactive
[22:34:45] [PASSED] inactive-2nd_or_active-inactive
[22:34:45] [PASSED] inactive-last_or_active-inactive
[22:34:45] [PASSED] inactive-no_or_active-inactive
[22:34:45] ============== [PASSED] xe_rtp_process_tests ===============
[22:34:45] ===================== [PASSED] xe_rtp ======================
[22:34:45] ==================== xe_wa (1 subtest) =====================
[22:34:45] ======================== xe_wa_gt  =========================
[22:34:45] [PASSED] TIGERLAKE B0
[22:34:45] [PASSED] DG1 A0
[22:34:45] [PASSED] DG1 B0
[22:34:45] [PASSED] ALDERLAKE_S A0
[22:34:45] [PASSED] ALDERLAKE_S B0
[22:34:45] [PASSED] ALDERLAKE_S C0
[22:34:45] [PASSED] ALDERLAKE_S D0
[22:34:45] [PASSED] ALDERLAKE_P A0
[22:34:45] [PASSED] ALDERLAKE_P B0
[22:34:45] [PASSED] ALDERLAKE_P C0
[22:34:45] [PASSED] ALDERLAKE_S RPLS D0
[22:34:45] [PASSED] ALDERLAKE_P RPLU E0
[22:34:45] [PASSED] DG2 G10 C0
[22:34:45] [PASSED] DG2 G11 B1
[22:34:45] [PASSED] DG2 G12 A1
[22:34:45] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:34:45] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:34:45] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[22:34:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[22:34:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[22:34:45] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[22:34:45] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[22:34:45] ==================== [PASSED] xe_wa_gt =====================
[22:34:45] ====================== [PASSED] xe_wa ======================
[22:34:45] ============================================================
[22:34:45] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[22:34:45] Elapsed time: 36.018s total, 4.209s configuring, 31.192s building, 0.592s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:34:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:34:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:35:12] Starting KUnit Kernel (1/1)...
[22:35:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:35:12] ============ drm_test_pick_cmdline (2 subtests) ============
[22:35:12] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[22:35:12] =============== drm_test_pick_cmdline_named  ===============
[22:35:12] [PASSED] NTSC
[22:35:12] [PASSED] NTSC-J
[22:35:12] [PASSED] PAL
[22:35:12] [PASSED] PAL-M
[22:35:12] =========== [PASSED] drm_test_pick_cmdline_named ===========
[22:35:12] ============== [PASSED] drm_test_pick_cmdline ==============
[22:35:12] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[22:35:12] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[22:35:12] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[22:35:12] =========== drm_validate_clone_mode (2 subtests) ===========
[22:35:12] ============== drm_test_check_in_clone_mode  ===============
[22:35:12] [PASSED] in_clone_mode
[22:35:12] [PASSED] not_in_clone_mode
[22:35:12] ========== [PASSED] drm_test_check_in_clone_mode ===========
[22:35:12] =============== drm_test_check_valid_clones  ===============
[22:35:12] [PASSED] not_in_clone_mode
[22:35:12] [PASSED] valid_clone
[22:35:12] [PASSED] invalid_clone
[22:35:12] =========== [PASSED] drm_test_check_valid_clones ===========
[22:35:12] ============= [PASSED] drm_validate_clone_mode =============
[22:35:12] ============= drm_validate_modeset (1 subtest) =============
[22:35:12] [PASSED] drm_test_check_connector_changed_modeset
[22:35:12] ============== [PASSED] drm_validate_modeset ===============
[22:35:12] ====== drm_test_bridge_get_current_state (2 subtests) ======
[22:35:12] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[22:35:12] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[22:35:12] ======== [PASSED] drm_test_bridge_get_current_state ========
[22:35:12] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[22:35:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[22:35:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[22:35:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[22:35:12] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[22:35:12] ============== drm_bridge_alloc (2 subtests) ===============
[22:35:12] [PASSED] drm_test_drm_bridge_alloc_basic
[22:35:12] [PASSED] drm_test_drm_bridge_alloc_get_put
[22:35:12] ================ [PASSED] drm_bridge_alloc =================
[22:35:12] ============= drm_cmdline_parser (40 subtests) =============
[22:35:12] [PASSED] drm_test_cmdline_force_d_only
[22:35:12] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:35:12] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:35:12] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:35:12] [PASSED] drm_test_cmdline_force_e_only
[22:35:12] [PASSED] drm_test_cmdline_res
[22:35:12] [PASSED] drm_test_cmdline_res_vesa
[22:35:12] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:35:12] [PASSED] drm_test_cmdline_res_rblank
[22:35:12] [PASSED] drm_test_cmdline_res_bpp
[22:35:12] [PASSED] drm_test_cmdline_res_refresh
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:35:12] [PASSED] drm_test_cmdline_res_margins_force_on
[22:35:12] [PASSED] drm_test_cmdline_res_vesa_margins
[22:35:12] [PASSED] drm_test_cmdline_name
[22:35:12] [PASSED] drm_test_cmdline_name_bpp
[22:35:12] [PASSED] drm_test_cmdline_name_option
[22:35:12] [PASSED] drm_test_cmdline_name_bpp_option
[22:35:12] [PASSED] drm_test_cmdline_rotate_0
[22:35:12] [PASSED] drm_test_cmdline_rotate_90
[22:35:12] [PASSED] drm_test_cmdline_rotate_180
[22:35:12] [PASSED] drm_test_cmdline_rotate_270
[22:35:12] [PASSED] drm_test_cmdline_hmirror
[22:35:12] [PASSED] drm_test_cmdline_vmirror
[22:35:12] [PASSED] drm_test_cmdline_margin_options
[22:35:12] [PASSED] drm_test_cmdline_multiple_options
[22:35:12] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:35:12] [PASSED] drm_test_cmdline_extra_and_option
[22:35:12] [PASSED] drm_test_cmdline_freestanding_options
[22:35:12] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:35:12] [PASSED] drm_test_cmdline_panel_orientation
[22:35:12] ================ drm_test_cmdline_invalid  =================
[22:35:12] [PASSED] margin_only
[22:35:12] [PASSED] interlace_only
[22:35:12] [PASSED] res_missing_x
[22:35:12] [PASSED] res_missing_y
[22:35:12] [PASSED] res_bad_y
[22:35:12] [PASSED] res_missing_y_bpp
[22:35:12] [PASSED] res_bad_bpp
[22:35:12] [PASSED] res_bad_refresh
[22:35:12] [PASSED] res_bpp_refresh_force_on_off
[22:35:12] [PASSED] res_invalid_mode
[22:35:12] [PASSED] res_bpp_wrong_place_mode
[22:35:12] [PASSED] name_bpp_refresh
[22:35:12] [PASSED] name_refresh
[22:35:12] [PASSED] name_refresh_wrong_mode
[22:35:12] [PASSED] name_refresh_invalid_mode
[22:35:12] [PASSED] rotate_multiple
[22:35:12] [PASSED] rotate_invalid_val
[22:35:12] [PASSED] rotate_truncated
[22:35:12] [PASSED] invalid_option
[22:35:12] [PASSED] invalid_tv_option
[22:35:12] [PASSED] truncated_tv_option
[22:35:12] ============ [PASSED] drm_test_cmdline_invalid =============
[22:35:12] =============== drm_test_cmdline_tv_options  ===============
[22:35:12] [PASSED] NTSC
[22:35:12] [PASSED] NTSC_443
[22:35:12] [PASSED] NTSC_J
[22:35:12] [PASSED] PAL
[22:35:12] [PASSED] PAL_M
[22:35:12] [PASSED] PAL_N
[22:35:12] [PASSED] SECAM
[22:35:12] [PASSED] MONO_525
[22:35:12] [PASSED] MONO_625
[22:35:12] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:35:12] =============== [PASSED] drm_cmdline_parser ================
[22:35:12] ========== drmm_connector_hdmi_init (20 subtests) ==========
[22:35:12] [PASSED] drm_test_connector_hdmi_init_valid
[22:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_8
[22:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_10
[22:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_12
[22:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[22:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_null
[22:35:12] [PASSED] drm_test_connector_hdmi_init_formats_empty
[22:35:12] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[22:35:12] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[22:35:12] [PASSED] supported_formats=0x9 yuv420_allowed=1
[22:35:12] [PASSED] supported_formats=0x9 yuv420_allowed=0
[22:35:12] [PASSED] supported_formats=0x5 yuv420_allowed=1
[22:35:12] [PASSED] supported_formats=0x5 yuv420_allowed=0
[22:35:12] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[22:35:12] [PASSED] drm_test_connector_hdmi_init_null_ddc
[22:35:12] [PASSED] drm_test_connector_hdmi_init_null_product
[22:35:12] [PASSED] drm_test_connector_hdmi_init_null_vendor
[22:35:12] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[22:35:12] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[22:35:12] [PASSED] drm_test_connector_hdmi_init_product_valid
[22:35:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[22:35:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[22:35:12] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[22:35:12] ========= drm_test_connector_hdmi_init_type_valid  =========
[22:35:12] [PASSED] HDMI-A
[22:35:12] [PASSED] HDMI-B
[22:35:12] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[22:35:12] ======== drm_test_connector_hdmi_init_type_invalid  ========
[22:35:12] [PASSED] Unknown
[22:35:12] [PASSED] VGA
[22:35:12] [PASSED] DVI-I
[22:35:12] [PASSED] DVI-D
[22:35:12] [PASSED] DVI-A
[22:35:12] [PASSED] Composite
[22:35:12] [PASSED] SVIDEO
[22:35:12] [PASSED] LVDS
[22:35:12] [PASSED] Component
[22:35:12] [PASSED] DIN
[22:35:12] [PASSED] DP
[22:35:12] [PASSED] TV
[22:35:12] [PASSED] eDP
[22:35:12] [PASSED] Virtual
[22:35:12] [PASSED] DSI
[22:35:12] [PASSED] DPI
[22:35:12] [PASSED] Writeback
[22:35:12] [PASSED] SPI
[22:35:12] [PASSED] USB
[22:35:12] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[22:35:12] ============ [PASSED] drmm_connector_hdmi_init =============
[22:35:12] ============= drmm_connector_init (3 subtests) =============
[22:35:12] [PASSED] drm_test_drmm_connector_init
[22:35:12] [PASSED] drm_test_drmm_connector_init_null_ddc
[22:35:12] ========= drm_test_drmm_connector_init_type_valid  =========
[22:35:12] [PASSED] Unknown
[22:35:12] [PASSED] VGA
[22:35:12] [PASSED] DVI-I
[22:35:12] [PASSED] DVI-D
[22:35:12] [PASSED] DVI-A
[22:35:12] [PASSED] Composite
[22:35:12] [PASSED] SVIDEO
[22:35:12] [PASSED] LVDS
[22:35:12] [PASSED] Component
[22:35:12] [PASSED] DIN
[22:35:12] [PASSED] DP
[22:35:12] [PASSED] HDMI-A
[22:35:12] [PASSED] HDMI-B
[22:35:12] [PASSED] TV
[22:35:12] [PASSED] eDP
[22:35:12] [PASSED] Virtual
[22:35:12] [PASSED] DSI
[22:35:12] [PASSED] DPI
[22:35:12] [PASSED] Writeback
[22:35:12] [PASSED] SPI
[22:35:12] [PASSED] USB
[22:35:12] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[22:35:12] =============== [PASSED] drmm_connector_init ===============
[22:35:12] ========= drm_connector_dynamic_init (6 subtests) ==========
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_init
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_init_properties
[22:35:12] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[22:35:12] [PASSED] Unknown
[22:35:12] [PASSED] VGA
[22:35:12] [PASSED] DVI-I
[22:35:12] [PASSED] DVI-D
[22:35:12] [PASSED] DVI-A
[22:35:12] [PASSED] Composite
[22:35:12] [PASSED] SVIDEO
[22:35:12] [PASSED] LVDS
[22:35:12] [PASSED] Component
[22:35:12] [PASSED] DIN
[22:35:12] [PASSED] DP
[22:35:12] [PASSED] HDMI-A
[22:35:12] [PASSED] HDMI-B
[22:35:12] [PASSED] TV
[22:35:12] [PASSED] eDP
[22:35:12] [PASSED] Virtual
[22:35:12] [PASSED] DSI
[22:35:12] [PASSED] DPI
[22:35:12] [PASSED] Writeback
[22:35:12] [PASSED] SPI
[22:35:12] [PASSED] USB
[22:35:12] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[22:35:12] ======== drm_test_drm_connector_dynamic_init_name  =========
[22:35:12] [PASSED] Unknown
[22:35:12] [PASSED] VGA
[22:35:12] [PASSED] DVI-I
[22:35:12] [PASSED] DVI-D
[22:35:12] [PASSED] DVI-A
[22:35:12] [PASSED] Composite
[22:35:12] [PASSED] SVIDEO
[22:35:12] [PASSED] LVDS
[22:35:12] [PASSED] Component
[22:35:12] [PASSED] DIN
[22:35:12] [PASSED] DP
[22:35:12] [PASSED] HDMI-A
[22:35:12] [PASSED] HDMI-B
[22:35:12] [PASSED] TV
[22:35:12] [PASSED] eDP
[22:35:12] [PASSED] Virtual
[22:35:12] [PASSED] DSI
[22:35:12] [PASSED] DPI
[22:35:12] [PASSED] Writeback
[22:35:12] [PASSED] SPI
[22:35:12] [PASSED] USB
[22:35:12] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[22:35:12] =========== [PASSED] drm_connector_dynamic_init ============
[22:35:12] ==== drm_connector_dynamic_register_early (4 subtests) =====
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[22:35:12] ====== [PASSED] drm_connector_dynamic_register_early =======
[22:35:12] ======= drm_connector_dynamic_register (7 subtests) ========
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[22:35:12] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[22:35:12] ========= [PASSED] drm_connector_dynamic_register ==========
[22:35:12] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[22:35:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[22:35:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[22:35:12] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[22:35:12] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[22:35:12] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:35:12] [PASSED] NTSC
[22:35:12] [PASSED] NTSC-443
[22:35:12] [PASSED] NTSC-J
[22:35:12] [PASSED] PAL
[22:35:12] [PASSED] PAL-M
[22:35:12] [PASSED] PAL-N
[22:35:12] [PASSED] SECAM
[22:35:12] [PASSED] Mono
[22:35:12] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:35:12] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:35:12] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:35:12] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[22:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[22:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[22:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[22:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[22:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[22:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[22:35:12] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[22:35:12] [PASSED] VIC 96
[22:35:12] [PASSED] VIC 97
[22:35:12] [PASSED] VIC 101
[22:35:12] [PASSED] VIC 102
[22:35:12] [PASSED] VIC 106
[22:35:12] [PASSED] VIC 107
[22:35:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[22:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[22:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[22:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[22:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[22:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[22:35:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[22:35:12] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[22:35:12] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[22:35:12] [PASSED] Automatic
[22:35:12] [PASSED] Full
[22:35:12] [PASSED] Limited 16:235
[22:35:12] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[22:35:12] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[22:35:12] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[22:35:12] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[22:35:12] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[22:35:12] [PASSED] RGB
[22:35:12] [PASSED] YUV 4:2:0
[22:35:12] [PASSED] YUV 4:2:2
[22:35:12] [PASSED] YUV 4:4:4
[22:35:12] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[22:35:12] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[22:35:12] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[22:35:12] ============= drm_damage_helper (21 subtests) ==============
[22:35:12] [PASSED] drm_test_damage_iter_no_damage
[22:35:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:35:12] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:35:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:35:12] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:35:12] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:35:12] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:35:12] [PASSED] drm_test_damage_iter_simple_damage
[22:35:12] [PASSED] drm_test_damage_iter_single_damage
[22:35:12] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:35:12] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:35:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:35:12] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:35:12] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:35:12] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:35:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:35:12] [PASSED] drm_test_damage_iter_damage
[22:35:12] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:35:12] [PASSED] drm_test_damage_iter_damage_one_outside
[22:35:12] [PASSED] drm_test_damage_iter_damage_src_moved
[22:35:12] [PASSED] drm_test_damage_iter_damage_not_visible
[22:35:12] ================ [PASSED] drm_damage_helper ================
[22:35:12] ============== drm_dp_mst_helper (3 subtests) ==============
[22:35:12] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:35:12] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:35:12] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:35:12] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:35:12] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:35:12] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:35:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:35:12] ============== drm_test_dp_mst_calc_pbn_div  ===============
[22:35:12] [PASSED] Link rate 2000000 lane count 4
[22:35:12] [PASSED] Link rate 2000000 lane count 2
[22:35:12] [PASSED] Link rate 2000000 lane count 1
[22:35:12] [PASSED] Link rate 1350000 lane count 4
[22:35:12] [PASSED] Link rate 1350000 lane count 2
[22:35:12] [PASSED] Link rate 1350000 lane count 1
[22:35:12] [PASSED] Link rate 1000000 lane count 4
[22:35:12] [PASSED] Link rate 1000000 lane count 2
[22:35:12] [PASSED] Link rate 1000000 lane count 1
[22:35:12] [PASSED] Link rate 810000 lane count 4
[22:35:12] [PASSED] Link rate 810000 lane count 2
[22:35:12] [PASSED] Link rate 810000 lane count 1
[22:35:12] [PASSED] Link rate 540000 lane count 4
[22:35:12] [PASSED] Link rate 540000 lane count 2
[22:35:12] [PASSED] Link rate 540000 lane count 1
[22:35:12] [PASSED] Link rate 270000 lane count 4
[22:35:12] [PASSED] Link rate 270000 lane count 2
[22:35:12] [PASSED] Link rate 270000 lane count 1
[22:35:12] [PASSED] Link rate 162000 lane count 4
[22:35:12] [PASSED] Link rate 162000 lane count 2
[22:35:12] [PASSED] Link rate 162000 lane count 1
[22:35:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[22:35:12] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:35:12] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:35:12] [PASSED] DP_POWER_UP_PHY with port number
[22:35:12] [PASSED] DP_POWER_DOWN_PHY with port number
[22:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:35:12] [PASSED] DP_QUERY_PAYLOAD with port number
[22:35:12] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:35:12] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:35:12] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:35:12] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:35:12] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:35:12] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:35:12] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:35:12] [PASSED] DP_REMOTE_I2C_READ with port number
[22:35:12] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:35:12] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:35:12] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:35:12] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:35:12] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:35:12] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:35:12] ================ [PASSED] drm_dp_mst_helper ================
[22:35:12] ================== drm_exec (7 subtests) ===================
[22:35:12] [PASSED] sanitycheck
[22:35:12] [PASSED] test_lock
[22:35:12] [PASSED] test_lock_unlock
[22:35:12] [PASSED] test_duplicates
[22:35:12] [PASSED] test_prepare
[22:35:12] [PASSED] test_prepare_array
[22:35:12] [PASSED] test_multiple_loops
[22:35:12] ==================== [PASSED] drm_exec =====================
[22:35:12] =========== drm_format_helper_test (17 subtests) ===========
[22:35:12] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:35:12] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:35:12] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:35:12] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:35:12] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:35:12] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:35:12] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:35:12] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[22:35:12] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:35:12] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:35:12] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:35:12] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:35:12] ==================== drm_test_fb_swab  =====================
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ================ [PASSED] drm_test_fb_swab =================
[22:35:12] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[22:35:12] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[22:35:12] [PASSED] single_pixel_source_buffer
[22:35:12] [PASSED] single_pixel_clip_rectangle
[22:35:12] [PASSED] well_known_colors
[22:35:12] [PASSED] destination_pitch
[22:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[22:35:12] ================= drm_test_fb_clip_offset  =================
[22:35:12] [PASSED] pass through
[22:35:12] [PASSED] horizontal offset
[22:35:12] [PASSED] vertical offset
[22:35:12] [PASSED] horizontal and vertical offset
[22:35:12] [PASSED] horizontal offset (custom pitch)
[22:35:12] [PASSED] vertical offset (custom pitch)
[22:35:12] [PASSED] horizontal and vertical offset (custom pitch)
[22:35:12] ============= [PASSED] drm_test_fb_clip_offset =============
[22:35:12] =================== drm_test_fb_memcpy  ====================
[22:35:12] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:35:12] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:35:12] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:35:12] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:35:12] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:35:12] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:35:12] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:35:12] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:35:12] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:35:12] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:35:12] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:35:12] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:35:12] =============== [PASSED] drm_test_fb_memcpy ================
[22:35:12] ============= [PASSED] drm_format_helper_test ==============
[22:35:12] ================= drm_format (18 subtests) =================
[22:35:12] [PASSED] drm_test_format_block_width_invalid
[22:35:12] [PASSED] drm_test_format_block_width_one_plane
[22:35:12] [PASSED] drm_test_format_block_width_two_plane
[22:35:12] [PASSED] drm_test_format_block_width_three_plane
[22:35:12] [PASSED] drm_test_format_block_width_tiled
[22:35:12] [PASSED] drm_test_format_block_height_invalid
[22:35:12] [PASSED] drm_test_format_block_height_one_plane
[22:35:12] [PASSED] drm_test_format_block_height_two_plane
[22:35:12] [PASSED] drm_test_format_block_height_three_plane
[22:35:12] [PASSED] drm_test_format_block_height_tiled
[22:35:12] [PASSED] drm_test_format_min_pitch_invalid
[22:35:12] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:35:12] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:35:12] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:35:12] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:35:12] [PASSED] drm_test_format_min_pitch_two_plane
[22:35:12] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:35:12] [PASSED] drm_test_format_min_pitch_tiled
[22:35:12] =================== [PASSED] drm_format ====================
[22:35:12] ============== drm_framebuffer (10 subtests) ===============
[22:35:12] ========== drm_test_framebuffer_check_src_coords  ==========
[22:35:12] [PASSED] Success: source fits into fb
[22:35:12] [PASSED] Fail: overflowing fb with x-axis coordinate
[22:35:12] [PASSED] Fail: overflowing fb with y-axis coordinate
[22:35:12] [PASSED] Fail: overflowing fb with source width
[22:35:12] [PASSED] Fail: overflowing fb with source height
[22:35:12] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[22:35:12] [PASSED] drm_test_framebuffer_cleanup
[22:35:12] =============== drm_test_framebuffer_create  ===============
[22:35:12] [PASSED] ABGR8888 normal sizes
[22:35:12] [PASSED] ABGR8888 max sizes
[22:35:12] [PASSED] ABGR8888 pitch greater than min required
[22:35:12] [PASSED] ABGR8888 pitch less than min required
[22:35:12] [PASSED] ABGR8888 Invalid width
[22:35:12] [PASSED] ABGR8888 Invalid buffer handle
[22:35:12] [PASSED] No pixel format
[22:35:12] [PASSED] ABGR8888 Width 0
[22:35:12] [PASSED] ABGR8888 Height 0
[22:35:12] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:35:12] [PASSED] ABGR8888 Large buffer offset
[22:35:12] [PASSED] ABGR8888 Buffer offset for inexistent plane
[22:35:12] [PASSED] ABGR8888 Invalid flag
[22:35:12] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:35:12] [PASSED] ABGR8888 Valid buffer modifier
[22:35:12] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:35:12] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:35:12] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:35:12] [PASSED] NV12 Normal sizes
[22:35:12] [PASSED] NV12 Max sizes
[22:35:12] [PASSED] NV12 Invalid pitch
[22:35:12] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:35:12] [PASSED] NV12 different  modifier per-plane
[22:35:12] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:35:12] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:35:12] [PASSED] NV12 Modifier for inexistent plane
[22:35:12] [PASSED] NV12 Handle for inexistent plane
[22:35:12] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:35:12] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:35:12] [PASSED] YVU420 Normal sizes
[22:35:12] [PASSED] YVU420 Max sizes
[22:35:12] [PASSED] YVU420 Invalid pitch
[22:35:12] [PASSED] YVU420 Different pitches
[22:35:12] [PASSED] YVU420 Different buffer offsets/pitches
[22:35:12] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:35:12] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:35:12] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:35:12] [PASSED] YVU420 Valid modifier
[22:35:12] [PASSED] YVU420 Different modifiers per plane
[22:35:12] [PASSED] YVU420 Modifier for inexistent plane
[22:35:12] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[22:35:12] [PASSED] X0L2 Normal sizes
[22:35:12] [PASSED] X0L2 Max sizes
[22:35:12] [PASSED] X0L2 Invalid pitch
[22:35:12] [PASSED] X0L2 Pitch greater than minimum required
[22:35:12] [PASSED] X0L2 Handle for inexistent plane
[22:35:12] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:35:12] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:35:12] [PASSED] X0L2 Valid modifier
[22:35:12] [PASSED] X0L2 Modifier for inexistent plane
[22:35:12] =========== [PASSED] drm_test_framebuffer_create ===========
[22:35:12] [PASSED] drm_test_framebuffer_free
[22:35:12] [PASSED] drm_test_framebuffer_init
[22:35:12] [PASSED] drm_test_framebuffer_init_bad_format
[22:35:12] [PASSED] drm_test_framebuffer_init_dev_mismatch
[22:35:12] [PASSED] drm_test_framebuffer_lookup
[22:35:12] [PASSED] drm_test_framebuffer_lookup_inexistent
[22:35:12] [PASSED] drm_test_framebuffer_modifiers_not_supported
[22:35:12] ================= [PASSED] drm_framebuffer =================
[22:35:12] ================ drm_gem_shmem (8 subtests) ================
[22:35:12] [PASSED] drm_gem_shmem_test_obj_create
[22:35:12] [PASSED] drm_gem_shmem_test_obj_create_private
[22:35:12] [PASSED] drm_gem_shmem_test_pin_pages
[22:35:12] [PASSED] drm_gem_shmem_test_vmap
[22:35:12] [PASSED] drm_gem_shmem_test_get_sg_table
[22:35:12] [PASSED] drm_gem_shmem_test_get_pages_sgt
[22:35:12] [PASSED] drm_gem_shmem_test_madvise
[22:35:12] [PASSED] drm_gem_shmem_test_purge
[22:35:12] ================== [PASSED] drm_gem_shmem ==================
[22:35:12] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[22:35:12] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[22:35:12] [PASSED] Automatic
[22:35:12] [PASSED] Full
[22:35:12] [PASSED] Limited 16:235
[22:35:12] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[22:35:12] [PASSED] drm_test_check_disable_connector
[22:35:12] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[22:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[22:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[22:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[22:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[22:35:12] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[22:35:12] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[22:35:12] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[22:35:12] [PASSED] drm_test_check_output_bpc_dvi
[22:35:12] [PASSED] drm_test_check_output_bpc_format_vic_1
[22:35:12] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[22:35:12] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[22:35:12] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[22:35:12] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[22:35:12] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[22:35:12] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[22:35:12] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[22:35:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[22:35:12] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[22:35:12] [PASSED] drm_test_check_broadcast_rgb_value
[22:35:12] [PASSED] drm_test_check_bpc_8_value
[22:35:12] [PASSED] drm_test_check_bpc_10_value
[22:35:12] [PASSED] drm_test_check_bpc_12_value
[22:35:12] [PASSED] drm_test_check_format_value
[22:35:12] [PASSED] drm_test_check_tmds_char_value
[22:35:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[22:35:12] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[22:35:12] [PASSED] drm_test_check_mode_valid
[22:35:12] [PASSED] drm_test_check_mode_valid_reject
[22:35:12] [PASSED] drm_test_check_mode_valid_reject_rate
[22:35:12] [PASSED] drm_test_check_mode_valid_reject_max_clock
[22:35:12] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[22:35:12] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[22:35:12] [PASSED] drm_test_check_infoframes
[22:35:12] [PASSED] drm_test_check_reject_avi_infoframe
[22:35:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[22:35:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[22:35:12] [PASSED] drm_test_check_reject_audio_infoframe
[22:35:12] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[22:35:12] ================= drm_managed (2 subtests) =================
[22:35:12] [PASSED] drm_test_managed_release_action
[22:35:12] [PASSED] drm_test_managed_run_action
[22:35:12] =================== [PASSED] drm_managed ===================
[22:35:12] =================== drm_mm (6 subtests) ====================
[22:35:12] [PASSED] drm_test_mm_init
[22:35:12] [PASSED] drm_test_mm_debug
[22:35:12] [PASSED] drm_test_mm_align32
[22:35:12] [PASSED] drm_test_mm_align64
[22:35:12] [PASSED] drm_test_mm_lowest
[22:35:12] [PASSED] drm_test_mm_highest
[22:35:12] ===================== [PASSED] drm_mm ======================
[22:35:12] ============= drm_modes_analog_tv (5 subtests) =============
[22:35:12] [PASSED] drm_test_modes_analog_tv_mono_576i
[22:35:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:35:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:35:12] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:35:12] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:35:12] =============== [PASSED] drm_modes_analog_tv ===============
[22:35:12] ============== drm_plane_helper (2 subtests) ===============
[22:35:12] =============== drm_test_check_plane_state  ================
[22:35:12] [PASSED] clipping_simple
[22:35:12] [PASSED] clipping_rotate_reflect
[22:35:12] [PASSED] positioning_simple
[22:35:12] [PASSED] upscaling
[22:35:12] [PASSED] downscaling
[22:35:12] [PASSED] rounding1
[22:35:12] [PASSED] rounding2
[22:35:12] [PASSED] rounding3
[22:35:12] [PASSED] rounding4
[22:35:12] =========== [PASSED] drm_test_check_plane_state ============
[22:35:12] =========== drm_test_check_invalid_plane_state  ============
[22:35:12] [PASSED] positioning_invalid
[22:35:12] [PASSED] upscaling_invalid
[22:35:12] [PASSED] downscaling_invalid
[22:35:12] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:35:12] ================ [PASSED] drm_plane_helper =================
[22:35:12] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[22:35:12] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:35:12] [PASSED] None
[22:35:12] [PASSED] PAL
[22:35:12] [PASSED] NTSC
[22:35:12] [PASSED] Both, NTSC Default
[22:35:12] [PASSED] Both, PAL Default
[22:35:12] [PASSED] Both, NTSC Default, with PAL on command-line
[22:35:12] [PASSED] Both, PAL Default, with NTSC on command-line
[22:35:12] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:35:12] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:35:12] ================== drm_rect (9 subtests) ===================
[22:35:12] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:35:12] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:35:12] [PASSED] drm_test_rect_clip_scaled_clipped
[22:35:12] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:35:12] ================= drm_test_rect_intersect  =================
[22:35:12] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:35:12] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:35:12] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:35:12] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:35:12] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:35:12] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:35:12] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:35:12] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:35:12] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:35:12] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:35:12] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:35:12] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:35:12] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:35:12] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[22:35:12] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:35:12] ============= [PASSED] drm_test_rect_intersect =============
[22:35:12] ================ drm_test_rect_calc_hscale  ================
[22:35:12] [PASSED] normal use
[22:35:12] [PASSED] out of max range
[22:35:12] [PASSED] out of min range
[22:35:12] [PASSED] zero dst
[22:35:12] [PASSED] negative src
[22:35:12] [PASSED] negative dst
[22:35:12] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:35:12] ================ drm_test_rect_calc_vscale  ================
[22:35:12] [PASSED] normal use
[22:35:12] [PASSED] out of max range
[22:35:12] [PASSED] out of min range
[22:35:12] [PASSED] zero dst
[22:35:12] [PASSED] negative src
[22:35:12] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[22:35:12] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:35:12] ================== drm_test_rect_rotate  ===================
[22:35:12] [PASSED] reflect-x
[22:35:12] [PASSED] reflect-y
[22:35:12] [PASSED] rotate-0
[22:35:12] [PASSED] rotate-90
[22:35:12] [PASSED] rotate-180
[22:35:12] [PASSED] rotate-270
[22:35:12] ============== [PASSED] drm_test_rect_rotate ===============
[22:35:12] ================ drm_test_rect_rotate_inv  =================
[22:35:12] [PASSED] reflect-x
[22:35:12] [PASSED] reflect-y
[22:35:12] [PASSED] rotate-0
[22:35:12] [PASSED] rotate-90
[22:35:12] [PASSED] rotate-180
[22:35:12] [PASSED] rotate-270
[22:35:12] ============ [PASSED] drm_test_rect_rotate_inv =============
[22:35:12] ==================== [PASSED] drm_rect =====================
[22:35:12] ============ drm_sysfb_modeset_test (1 subtest) ============
[22:35:12] ============ drm_test_sysfb_build_fourcc_list  =============
[22:35:12] [PASSED] no native formats
[22:35:12] [PASSED] XRGB8888 as native format
[22:35:12] [PASSED] remove duplicates
[22:35:12] [PASSED] convert alpha formats
[22:35:12] [PASSED] random formats
[22:35:12] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[22:35:12] ============= [PASSED] drm_sysfb_modeset_test ==============
[22:35:12] ================== drm_fixp (2 subtests) ===================
[22:35:12] [PASSED] drm_test_int2fixp
[22:35:12] [PASSED] drm_test_sm2fixp
[22:35:12] ==================== [PASSED] drm_fixp =====================
[22:35:12] ============================================================
[22:35:12] Testing complete. Ran 621 tests: passed: 621
[22:35:12] Elapsed time: 26.309s total, 1.670s configuring, 24.467s building, 0.139s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[22:35:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:35:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:35:23] Starting KUnit Kernel (1/1)...
[22:35:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:35:23] ================= ttm_device (5 subtests) ==================
[22:35:23] [PASSED] ttm_device_init_basic
[22:35:23] [PASSED] ttm_device_init_multiple
[22:35:23] [PASSED] ttm_device_fini_basic
[22:35:23] [PASSED] ttm_device_init_no_vma_man
[22:35:23] ================== ttm_device_init_pools  ==================
[22:35:23] [PASSED] No DMA allocations, no DMA32 required
[22:35:23] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[22:35:23] Expected !list_lru_count(&pt.pages) to be false, but is true
[22:35:23] [FAILED] DMA allocations, DMA32 required
[22:35:23] [PASSED] No DMA allocations, DMA32 required
[22:35:23]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[22:35:23]     Expected !list_lru_count(&pt.pages) to be false, but is true
[22:35:23] ------------[ cut here ]------------
[22:35:23] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[22:35:23] refcount_t: underflow; use-after-free.
[22:35:23] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g70d2d451fada #3 VOLUNTARY
[22:35:23] Tainted: [W]=WARN, [N]=TEST
[22:35:23] Stack:
[22:35:23]  6044ed8b 00000000 00000000 00000001
[22:35:23]  ffffff00 6044ed8b 6032367a 00000009
[22:35:23]  0000001c 60043e88 6002381c a70cbd40
[22:35:23] Call Trace:
[22:35:23]  [<6032367a>] ? devres_release_all+0xaa/0x100
[22:35:23]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[22:35:23]  [<6002381c>] ? _printk+0x0/0x65
[22:35:23]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[22:35:23]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[22:35:23]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[22:35:23]  [<60052e36>] ? um_set_signals+0x36/0x60
[22:35:23]  [<600c5a42>] ? call_rcu+0x52/0x90
[22:35:23]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[22:35:23]  [<60147f50>] ? kfree+0x0/0x250
[22:35:23]  [<6032367a>] ? devres_release_all+0xaa/0x100
[22:35:23]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[22:35:23]  [<6031c3c0>] ? bus_notify+0x0/0x60
[22:35:23]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[22:35:23]  [<60398620>] ? mutex_lock+0x0/0x40
[22:35:23]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[22:35:23]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[22:35:23]  [<60372210>] ? kobject_put+0x0/0x150
[22:35:23]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[22:35:23]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[22:35:23]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[22:35:23]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[22:35:23]  [<60315a8c>] ? device_del+0x1bc/0x600
[22:35:23]  [<60052e00>] ? um_set_signals+0x0/0x60
[22:35:23]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[22:35:23]  [<60052e00>] ? um_set_signals+0x0/0x60
[22:35:23]  [<60315ee4>] ? device_unregister+0x14/0x40
[22:35:23]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[22:35:23]  [<60257d70>] ? kunit_release_action+0x0/0x170
[22:35:23]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[22:35:23]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[22:35:23]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[22:35:23]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[22:35:23]  [<60081e36>] ? kthread+0xe6/0x150
[22:35:23]  [<60046435>] ? new_thread_handler+0x45/0x60
[22:35:23] ---[ end trace 0000000000000000 ]---
[22:35:23] [FAILED] DMA allocations, no DMA32 required
[22:35:23] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[22:35:23] ============== [FAILED] ttm_device_init_pools ==============
[22:35:23]     # module: ttm_device_test
[22:35:23] # ttm_device: pass:4 fail:1 skip:0 total:5
[22:35:23] # Totals: pass:6 fail:2 skip:0 total:8
[22:35:23] =================== [FAILED] ttm_device ====================
[22:35:23] ================== ttm_pool (8 subtests) ===================
[22:35:23] ================== ttm_pool_alloc_basic  ===================
[22:35:23] [PASSED] One page
[22:35:23] [PASSED] More than one page
[22:35:23] [PASSED] Above the allocation limit
[22:35:23] [PASSED] One page, with coherent DMA mappings enabled
[22:35:23] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:35:23] ============== [PASSED] ttm_pool_alloc_basic ===============
[22:35:23] ============== ttm_pool_alloc_basic_dma_addr  ==============
[22:35:23] [PASSED] One page
[22:35:23] [PASSED] More than one page
[22:35:23] [PASSED] Above the allocation limit
[22:35:23] [PASSED] One page, with coherent DMA mappings enabled
[22:35:23] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:35:23] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[22:35:23] [PASSED] ttm_pool_alloc_order_caching_match
[22:35:23] [PASSED] ttm_pool_alloc_caching_mismatch
[22:35:23] [PASSED] ttm_pool_alloc_order_mismatch
[22:35:23] [PASSED] ttm_pool_free_dma_alloc
[22:35:23] [ERROR] Test: ttm_pool: missing expected subtest!
[22:35:23] 
[22:35:23] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g70d2d451fada
[22:35:23] RIP: 0033:list_lru_count_node+0xe/0x20
[22:35:23] RSP: 00000000a70cbed8  EFLAGS: 00010246
[22:35:23] RAX: 0000000000000000 RBX: 00000000a7003c90 RCX: 0000000067a4c7d8
[22:35:23] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000067886880
[22:35:23] RBP: 0000000067886800 R08: 00000000a6072c28 R09: 0000000067850c80
[22:35:23] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000067850c80
[22:35:23] R13: 0000000060440770 R14: 000000006010eb50 R15: 0000000067886880
[22:35:23] Kernel panic - not syncing: Segfault with no mm
[22:35:23] [CRASHED] 
[22:35:23] [ERROR] Test: ttm_pool: missing expected subtest!
[22:35:23] [CRASHED] 
[22:35:23] [ERROR] Test: ttm_pool: missing subtest result line!
[22:35:23] # module: ttm_pool_test
[22:35:23] ==================== [CRASHED] ttm_pool ====================
[22:35:23] [ERROR] Test: main: missing expected subtest!
[22:35:23] [CRASHED] 
[22:35:23] [ERROR] Test: main: missing expected subtest!
[22:35:23] [CRASHED] 
[22:35:23] [ERROR] Test: main: missing expected subtest!
[22:35:23] [CRASHED] 
[22:35:23] [ERROR] Test: main: missing expected subtest!
[22:35:23] [CRASHED] 
[22:35:23] ============================================================
[22:35:23] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[22:35:23] Elapsed time: 11.371s total, 1.726s configuring, 9.377s building, 0.267s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


