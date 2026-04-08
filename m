Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8322B10F995A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 16:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B4D10E6A0;
	Wed,  8 Apr 2026 16:11:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C9110E6A0;
 Wed,  8 Apr 2026 16:11:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_vfio/xe=3A_Reorganize_the_init_to_decouple_migration_from_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 16:11:55 -0000
Message-ID: <177566471559.443324.12095582373708570817@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408160340.866784-1-michal.winiarski@intel.com>
In-Reply-To: <20260408160340.866784-1-michal.winiarski@intel.com>
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

Series: series starting with [1/2] vfio/xe: Reorganize the init to decouple migration from reset
URL   : https://patchwork.freedesktop.org/series/164560/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[16:10:38] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:10:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:11:13] Starting KUnit Kernel (1/1)...
[16:11:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:11:13] ================== guc_buf (11 subtests) ===================
[16:11:13] [PASSED] test_smallest
[16:11:13] [PASSED] test_largest
[16:11:13] [PASSED] test_granular
[16:11:13] [PASSED] test_unique
[16:11:13] [PASSED] test_overlap
[16:11:13] [PASSED] test_reusable
[16:11:13] [PASSED] test_too_big
[16:11:13] [PASSED] test_flush
[16:11:13] [PASSED] test_lookup
[16:11:13] [PASSED] test_data
[16:11:13] [PASSED] test_class
[16:11:13] ===================== [PASSED] guc_buf =====================
[16:11:13] =================== guc_dbm (7 subtests) ===================
[16:11:13] [PASSED] test_empty
[16:11:13] [PASSED] test_default
[16:11:13] ======================== test_size  ========================
[16:11:13] [PASSED] 4
[16:11:13] [PASSED] 8
[16:11:13] [PASSED] 32
[16:11:13] [PASSED] 256
[16:11:13] ==================== [PASSED] test_size ====================
[16:11:13] ======================= test_reuse  ========================
[16:11:13] [PASSED] 4
[16:11:13] [PASSED] 8
[16:11:13] [PASSED] 32
[16:11:13] [PASSED] 256
[16:11:13] =================== [PASSED] test_reuse ====================
[16:11:13] =================== test_range_overlap  ====================
[16:11:13] [PASSED] 4
[16:11:13] [PASSED] 8
[16:11:13] [PASSED] 32
[16:11:13] [PASSED] 256
[16:11:13] =============== [PASSED] test_range_overlap ================
[16:11:13] =================== test_range_compact  ====================
[16:11:13] [PASSED] 4
[16:11:13] [PASSED] 8
[16:11:13] [PASSED] 32
[16:11:13] [PASSED] 256
[16:11:13] =============== [PASSED] test_range_compact ================
[16:11:13] ==================== test_range_spare  =====================
[16:11:13] [PASSED] 4
[16:11:13] [PASSED] 8
[16:11:13] [PASSED] 32
[16:11:13] [PASSED] 256
[16:11:13] ================ [PASSED] test_range_spare =================
[16:11:13] ===================== [PASSED] guc_dbm =====================
[16:11:13] =================== guc_idm (6 subtests) ===================
[16:11:13] [PASSED] bad_init
[16:11:13] [PASSED] no_init
[16:11:13] [PASSED] init_fini
[16:11:13] [PASSED] check_used
[16:11:13] [PASSED] check_quota
[16:11:13] [PASSED] check_all
[16:11:13] ===================== [PASSED] guc_idm =====================
[16:11:13] ================== no_relay (3 subtests) ===================
[16:11:13] [PASSED] xe_drops_guc2pf_if_not_ready
[16:11:13] [PASSED] xe_drops_guc2vf_if_not_ready
[16:11:13] [PASSED] xe_rejects_send_if_not_ready
[16:11:13] ==================== [PASSED] no_relay =====================
[16:11:13] ================== pf_relay (14 subtests) ==================
[16:11:13] [PASSED] pf_rejects_guc2pf_too_short
[16:11:13] [PASSED] pf_rejects_guc2pf_too_long
[16:11:13] [PASSED] pf_rejects_guc2pf_no_payload
[16:11:13] [PASSED] pf_fails_no_payload
[16:11:13] [PASSED] pf_fails_bad_origin
[16:11:13] [PASSED] pf_fails_bad_type
[16:11:13] [PASSED] pf_txn_reports_error
[16:11:13] [PASSED] pf_txn_sends_pf2guc
[16:11:13] [PASSED] pf_sends_pf2guc
[16:11:13] [SKIPPED] pf_loopback_nop
[16:11:13] [SKIPPED] pf_loopback_echo
[16:11:13] [SKIPPED] pf_loopback_fail
[16:11:13] [SKIPPED] pf_loopback_busy
[16:11:13] [SKIPPED] pf_loopback_retry
[16:11:13] ==================== [PASSED] pf_relay =====================
[16:11:13] ================== vf_relay (3 subtests) ===================
[16:11:13] [PASSED] vf_rejects_guc2vf_too_short
[16:11:13] [PASSED] vf_rejects_guc2vf_too_long
[16:11:13] [PASSED] vf_rejects_guc2vf_no_payload
[16:11:13] ==================== [PASSED] vf_relay =====================
[16:11:13] ================ pf_gt_config (9 subtests) =================
[16:11:13] [PASSED] fair_contexts_1vf
[16:11:13] [PASSED] fair_doorbells_1vf
[16:11:13] [PASSED] fair_ggtt_1vf
[16:11:13] ====================== fair_vram_1vf  ======================
[16:11:13] [PASSED] 3.50 GiB
[16:11:13] [PASSED] 11.5 GiB
[16:11:13] [PASSED] 15.5 GiB
[16:11:13] [PASSED] 31.5 GiB
[16:11:13] [PASSED] 63.5 GiB
[16:11:13] [PASSED] 1.91 GiB
[16:11:13] ================== [PASSED] fair_vram_1vf ==================
[16:11:13] ================ fair_vram_1vf_admin_only  =================
[16:11:13] [PASSED] 3.50 GiB
[16:11:13] [PASSED] 11.5 GiB
[16:11:13] [PASSED] 15.5 GiB
[16:11:13] [PASSED] 31.5 GiB
[16:11:13] [PASSED] 63.5 GiB
[16:11:13] [PASSED] 1.91 GiB
[16:11:13] ============ [PASSED] fair_vram_1vf_admin_only =============
[16:11:13] ====================== fair_contexts  ======================
[16:11:13] [PASSED] 1 VF
[16:11:13] [PASSED] 2 VFs
[16:11:13] [PASSED] 3 VFs
[16:11:13] [PASSED] 4 VFs
[16:11:13] [PASSED] 5 VFs
[16:11:13] [PASSED] 6 VFs
[16:11:13] [PASSED] 7 VFs
[16:11:13] [PASSED] 8 VFs
[16:11:13] [PASSED] 9 VFs
[16:11:13] [PASSED] 10 VFs
[16:11:13] [PASSED] 11 VFs
[16:11:13] [PASSED] 12 VFs
[16:11:13] [PASSED] 13 VFs
[16:11:13] [PASSED] 14 VFs
[16:11:13] [PASSED] 15 VFs
[16:11:13] [PASSED] 16 VFs
[16:11:13] [PASSED] 17 VFs
[16:11:13] [PASSED] 18 VFs
[16:11:13] [PASSED] 19 VFs
[16:11:13] [PASSED] 20 VFs
[16:11:13] [PASSED] 21 VFs
[16:11:13] [PASSED] 22 VFs
[16:11:13] [PASSED] 23 VFs
[16:11:13] [PASSED] 24 VFs
[16:11:13] [PASSED] 25 VFs
[16:11:13] [PASSED] 26 VFs
[16:11:13] [PASSED] 27 VFs
[16:11:13] [PASSED] 28 VFs
[16:11:13] [PASSED] 29 VFs
[16:11:13] [PASSED] 30 VFs
[16:11:13] [PASSED] 31 VFs
[16:11:13] [PASSED] 32 VFs
[16:11:13] [PASSED] 33 VFs
[16:11:13] [PASSED] 34 VFs
[16:11:13] [PASSED] 35 VFs
[16:11:13] [PASSED] 36 VFs
[16:11:13] [PASSED] 37 VFs
[16:11:13] [PASSED] 38 VFs
[16:11:13] [PASSED] 39 VFs
[16:11:13] [PASSED] 40 VFs
[16:11:13] [PASSED] 41 VFs
[16:11:13] [PASSED] 42 VFs
[16:11:13] [PASSED] 43 VFs
[16:11:13] [PASSED] 44 VFs
[16:11:13] [PASSED] 45 VFs
[16:11:13] [PASSED] 46 VFs
[16:11:13] [PASSED] 47 VFs
[16:11:13] [PASSED] 48 VFs
[16:11:13] [PASSED] 49 VFs
[16:11:13] [PASSED] 50 VFs
[16:11:13] [PASSED] 51 VFs
[16:11:13] [PASSED] 52 VFs
[16:11:13] [PASSED] 53 VFs
[16:11:13] [PASSED] 54 VFs
[16:11:13] [PASSED] 55 VFs
[16:11:13] [PASSED] 56 VFs
[16:11:13] [PASSED] 57 VFs
[16:11:13] [PASSED] 58 VFs
[16:11:13] [PASSED] 59 VFs
[16:11:13] [PASSED] 60 VFs
[16:11:13] [PASSED] 61 VFs
[16:11:13] [PASSED] 62 VFs
[16:11:13] [PASSED] 63 VFs
[16:11:13] ================== [PASSED] fair_contexts ==================
[16:11:13] ===================== fair_doorbells  ======================
[16:11:13] [PASSED] 1 VF
[16:11:13] [PASSED] 2 VFs
[16:11:13] [PASSED] 3 VFs
[16:11:13] [PASSED] 4 VFs
[16:11:13] [PASSED] 5 VFs
[16:11:13] [PASSED] 6 VFs
[16:11:13] [PASSED] 7 VFs
[16:11:13] [PASSED] 8 VFs
[16:11:13] [PASSED] 9 VFs
[16:11:13] [PASSED] 10 VFs
[16:11:13] [PASSED] 11 VFs
[16:11:13] [PASSED] 12 VFs
[16:11:13] [PASSED] 13 VFs
[16:11:13] [PASSED] 14 VFs
[16:11:13] [PASSED] 15 VFs
[16:11:13] [PASSED] 16 VFs
[16:11:13] [PASSED] 17 VFs
[16:11:13] [PASSED] 18 VFs
[16:11:13] [PASSED] 19 VFs
[16:11:13] [PASSED] 20 VFs
[16:11:13] [PASSED] 21 VFs
[16:11:13] [PASSED] 22 VFs
[16:11:13] [PASSED] 23 VFs
[16:11:13] [PASSED] 24 VFs
[16:11:13] [PASSED] 25 VFs
[16:11:13] [PASSED] 26 VFs
[16:11:13] [PASSED] 27 VFs
[16:11:13] [PASSED] 28 VFs
[16:11:14] [PASSED] 29 VFs
[16:11:14] [PASSED] 30 VFs
[16:11:14] [PASSED] 31 VFs
[16:11:14] [PASSED] 32 VFs
[16:11:14] [PASSED] 33 VFs
[16:11:14] [PASSED] 34 VFs
[16:11:14] [PASSED] 35 VFs
[16:11:14] [PASSED] 36 VFs
[16:11:14] [PASSED] 37 VFs
[16:11:14] [PASSED] 38 VFs
[16:11:14] [PASSED] 39 VFs
[16:11:14] [PASSED] 40 VFs
[16:11:14] [PASSED] 41 VFs
[16:11:14] [PASSED] 42 VFs
[16:11:14] [PASSED] 43 VFs
[16:11:14] [PASSED] 44 VFs
[16:11:14] [PASSED] 45 VFs
[16:11:14] [PASSED] 46 VFs
[16:11:14] [PASSED] 47 VFs
[16:11:14] [PASSED] 48 VFs
[16:11:14] [PASSED] 49 VFs
[16:11:14] [PASSED] 50 VFs
[16:11:14] [PASSED] 51 VFs
[16:11:14] [PASSED] 52 VFs
[16:11:14] [PASSED] 53 VFs
[16:11:14] [PASSED] 54 VFs
[16:11:14] [PASSED] 55 VFs
[16:11:14] [PASSED] 56 VFs
[16:11:14] [PASSED] 57 VFs
[16:11:14] [PASSED] 58 VFs
[16:11:14] [PASSED] 59 VFs
[16:11:14] [PASSED] 60 VFs
[16:11:14] [PASSED] 61 VFs
[16:11:14] [PASSED] 62 VFs
[16:11:14] [PASSED] 63 VFs
[16:11:14] ================= [PASSED] fair_doorbells ==================
[16:11:14] ======================== fair_ggtt  ========================
[16:11:14] [PASSED] 1 VF
[16:11:14] [PASSED] 2 VFs
[16:11:14] [PASSED] 3 VFs
[16:11:14] [PASSED] 4 VFs
[16:11:14] [PASSED] 5 VFs
[16:11:14] [PASSED] 6 VFs
[16:11:14] [PASSED] 7 VFs
[16:11:14] [PASSED] 8 VFs
[16:11:14] [PASSED] 9 VFs
[16:11:14] [PASSED] 10 VFs
[16:11:14] [PASSED] 11 VFs
[16:11:14] [PASSED] 12 VFs
[16:11:14] [PASSED] 13 VFs
[16:11:14] [PASSED] 14 VFs
[16:11:14] [PASSED] 15 VFs
[16:11:14] [PASSED] 16 VFs
[16:11:14] [PASSED] 17 VFs
[16:11:14] [PASSED] 18 VFs
[16:11:14] [PASSED] 19 VFs
[16:11:14] [PASSED] 20 VFs
[16:11:14] [PASSED] 21 VFs
[16:11:14] [PASSED] 22 VFs
[16:11:14] [PASSED] 23 VFs
[16:11:14] [PASSED] 24 VFs
[16:11:14] [PASSED] 25 VFs
[16:11:14] [PASSED] 26 VFs
[16:11:14] [PASSED] 27 VFs
[16:11:14] [PASSED] 28 VFs
[16:11:14] [PASSED] 29 VFs
[16:11:14] [PASSED] 30 VFs
[16:11:14] [PASSED] 31 VFs
[16:11:14] [PASSED] 32 VFs
[16:11:14] [PASSED] 33 VFs
[16:11:14] [PASSED] 34 VFs
[16:11:14] [PASSED] 35 VFs
[16:11:14] [PASSED] 36 VFs
[16:11:14] [PASSED] 37 VFs
[16:11:14] [PASSED] 38 VFs
[16:11:14] [PASSED] 39 VFs
[16:11:14] [PASSED] 40 VFs
[16:11:14] [PASSED] 41 VFs
[16:11:14] [PASSED] 42 VFs
[16:11:14] [PASSED] 43 VFs
[16:11:14] [PASSED] 44 VFs
[16:11:14] [PASSED] 45 VFs
[16:11:14] [PASSED] 46 VFs
[16:11:14] [PASSED] 47 VFs
[16:11:14] [PASSED] 48 VFs
[16:11:14] [PASSED] 49 VFs
[16:11:14] [PASSED] 50 VFs
[16:11:14] [PASSED] 51 VFs
[16:11:14] [PASSED] 52 VFs
[16:11:14] [PASSED] 53 VFs
[16:11:14] [PASSED] 54 VFs
[16:11:14] [PASSED] 55 VFs
[16:11:14] [PASSED] 56 VFs
[16:11:14] [PASSED] 57 VFs
[16:11:14] [PASSED] 58 VFs
[16:11:14] [PASSED] 59 VFs
[16:11:14] [PASSED] 60 VFs
[16:11:14] [PASSED] 61 VFs
[16:11:14] [PASSED] 62 VFs
[16:11:14] [PASSED] 63 VFs
[16:11:14] ==================== [PASSED] fair_ggtt ====================
[16:11:14] ======================== fair_vram  ========================
[16:11:14] [PASSED] 1 VF
[16:11:14] [PASSED] 2 VFs
[16:11:14] [PASSED] 3 VFs
[16:11:14] [PASSED] 4 VFs
[16:11:14] [PASSED] 5 VFs
[16:11:14] [PASSED] 6 VFs
[16:11:14] [PASSED] 7 VFs
[16:11:14] [PASSED] 8 VFs
[16:11:14] [PASSED] 9 VFs
[16:11:14] [PASSED] 10 VFs
[16:11:14] [PASSED] 11 VFs
[16:11:14] [PASSED] 12 VFs
[16:11:14] [PASSED] 13 VFs
[16:11:14] [PASSED] 14 VFs
[16:11:14] [PASSED] 15 VFs
[16:11:14] [PASSED] 16 VFs
[16:11:14] [PASSED] 17 VFs
[16:11:14] [PASSED] 18 VFs
[16:11:14] [PASSED] 19 VFs
[16:11:14] [PASSED] 20 VFs
[16:11:14] [PASSED] 21 VFs
[16:11:14] [PASSED] 22 VFs
[16:11:14] [PASSED] 23 VFs
[16:11:14] [PASSED] 24 VFs
[16:11:14] [PASSED] 25 VFs
[16:11:14] [PASSED] 26 VFs
[16:11:14] [PASSED] 27 VFs
[16:11:14] [PASSED] 28 VFs
[16:11:14] [PASSED] 29 VFs
[16:11:14] [PASSED] 30 VFs
[16:11:14] [PASSED] 31 VFs
[16:11:14] [PASSED] 32 VFs
[16:11:14] [PASSED] 33 VFs
[16:11:14] [PASSED] 34 VFs
[16:11:14] [PASSED] 35 VFs
[16:11:14] [PASSED] 36 VFs
[16:11:14] [PASSED] 37 VFs
[16:11:14] [PASSED] 38 VFs
[16:11:14] [PASSED] 39 VFs
[16:11:14] [PASSED] 40 VFs
[16:11:14] [PASSED] 41 VFs
[16:11:14] [PASSED] 42 VFs
[16:11:14] [PASSED] 43 VFs
[16:11:14] [PASSED] 44 VFs
[16:11:14] [PASSED] 45 VFs
[16:11:14] [PASSED] 46 VFs
[16:11:14] [PASSED] 47 VFs
[16:11:14] [PASSED] 48 VFs
[16:11:14] [PASSED] 49 VFs
[16:11:14] [PASSED] 50 VFs
[16:11:14] [PASSED] 51 VFs
[16:11:14] [PASSED] 52 VFs
[16:11:14] [PASSED] 53 VFs
[16:11:14] [PASSED] 54 VFs
[16:11:14] [PASSED] 55 VFs
[16:11:14] [PASSED] 56 VFs
[16:11:14] [PASSED] 57 VFs
[16:11:14] [PASSED] 58 VFs
[16:11:14] [PASSED] 59 VFs
[16:11:14] [PASSED] 60 VFs
[16:11:14] [PASSED] 61 VFs
[16:11:14] [PASSED] 62 VFs
[16:11:14] [PASSED] 63 VFs
[16:11:14] ==================== [PASSED] fair_vram ====================
[16:11:14] ================== [PASSED] pf_gt_config ===================
[16:11:14] ===================== lmtt (1 subtest) =====================
[16:11:14] ======================== test_ops  =========================
[16:11:14] [PASSED] 2-level
[16:11:14] [PASSED] multi-level
[16:11:14] ==================== [PASSED] test_ops =====================
[16:11:14] ====================== [PASSED] lmtt =======================
[16:11:14] ================= pf_service (11 subtests) =================
[16:11:14] [PASSED] pf_negotiate_any
[16:11:14] [PASSED] pf_negotiate_base_match
[16:11:14] [PASSED] pf_negotiate_base_newer
[16:11:14] [PASSED] pf_negotiate_base_next
[16:11:14] [SKIPPED] pf_negotiate_base_older
[16:11:14] [PASSED] pf_negotiate_base_prev
[16:11:14] [PASSED] pf_negotiate_latest_match
[16:11:14] [PASSED] pf_negotiate_latest_newer
[16:11:14] [PASSED] pf_negotiate_latest_next
[16:11:14] [SKIPPED] pf_negotiate_latest_older
[16:11:14] [SKIPPED] pf_negotiate_latest_prev
[16:11:14] =================== [PASSED] pf_service ====================
[16:11:14] ================= xe_guc_g2g (2 subtests) ==================
[16:11:14] ============== xe_live_guc_g2g_kunit_default  ==============
[16:11:14] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[16:11:14] ============== xe_live_guc_g2g_kunit_allmem  ===============
[16:11:14] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[16:11:14] =================== [SKIPPED] xe_guc_g2g ===================
[16:11:14] =================== xe_mocs (2 subtests) ===================
[16:11:14] ================ xe_live_mocs_kernel_kunit  ================
[16:11:14] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[16:11:14] ================ xe_live_mocs_reset_kunit  =================
[16:11:14] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[16:11:14] ==================== [SKIPPED] xe_mocs =====================
[16:11:14] ================= xe_migrate (2 subtests) ==================
[16:11:14] ================= xe_migrate_sanity_kunit  =================
[16:11:14] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[16:11:14] ================== xe_validate_ccs_kunit  ==================
[16:11:14] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[16:11:14] =================== [SKIPPED] xe_migrate ===================
[16:11:14] ================== xe_dma_buf (1 subtest) ==================
[16:11:14] ==================== xe_dma_buf_kunit  =====================
[16:11:14] ================ [SKIPPED] xe_dma_buf_kunit ================
[16:11:14] =================== [SKIPPED] xe_dma_buf ===================
[16:11:14] ================= xe_bo_shrink (1 subtest) =================
[16:11:14] =================== xe_bo_shrink_kunit  ====================
[16:11:14] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[16:11:14] ================== [SKIPPED] xe_bo_shrink ==================
[16:11:14] ==================== xe_bo (2 subtests) ====================
[16:11:14] ================== xe_ccs_migrate_kunit  ===================
[16:11:14] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[16:11:14] ==================== xe_bo_evict_kunit  ====================
[16:11:14] =============== [SKIPPED] xe_bo_evict_kunit ================
[16:11:14] ===================== [SKIPPED] xe_bo ======================
[16:11:14] ==================== args (13 subtests) ====================
[16:11:14] [PASSED] count_args_test
[16:11:14] [PASSED] call_args_example
[16:11:14] [PASSED] call_args_test
[16:11:14] [PASSED] drop_first_arg_example
[16:11:14] [PASSED] drop_first_arg_test
[16:11:14] [PASSED] first_arg_example
[16:11:14] [PASSED] first_arg_test
[16:11:14] [PASSED] last_arg_example
[16:11:14] [PASSED] last_arg_test
[16:11:14] [PASSED] pick_arg_example
[16:11:14] [PASSED] if_args_example
[16:11:14] [PASSED] if_args_test
[16:11:14] [PASSED] sep_comma_example
[16:11:14] ====================== [PASSED] args =======================
[16:11:14] =================== xe_pci (3 subtests) ====================
[16:11:14] ==================== check_graphics_ip  ====================
[16:11:14] [PASSED] 12.00 Xe_LP
[16:11:14] [PASSED] 12.10 Xe_LP+
[16:11:14] [PASSED] 12.55 Xe_HPG
[16:11:14] [PASSED] 12.60 Xe_HPC
[16:11:14] [PASSED] 12.70 Xe_LPG
[16:11:14] [PASSED] 12.71 Xe_LPG
[16:11:14] [PASSED] 12.74 Xe_LPG+
[16:11:14] [PASSED] 20.01 Xe2_HPG
[16:11:14] [PASSED] 20.02 Xe2_HPG
[16:11:14] [PASSED] 20.04 Xe2_LPG
[16:11:14] [PASSED] 30.00 Xe3_LPG
[16:11:14] [PASSED] 30.01 Xe3_LPG
[16:11:14] [PASSED] 30.03 Xe3_LPG
[16:11:14] [PASSED] 30.04 Xe3_LPG
[16:11:14] [PASSED] 30.05 Xe3_LPG
[16:11:14] [PASSED] 35.10 Xe3p_LPG
[16:11:14] [PASSED] 35.11 Xe3p_XPC
[16:11:14] ================ [PASSED] check_graphics_ip ================
[16:11:14] ===================== check_media_ip  ======================
[16:11:14] [PASSED] 12.00 Xe_M
[16:11:14] [PASSED] 12.55 Xe_HPM
[16:11:14] [PASSED] 13.00 Xe_LPM+
[16:11:14] [PASSED] 13.01 Xe2_HPM
[16:11:14] [PASSED] 20.00 Xe2_LPM
[16:11:14] [PASSED] 30.00 Xe3_LPM
[16:11:14] [PASSED] 30.02 Xe3_LPM
[16:11:14] [PASSED] 35.00 Xe3p_LPM
[16:11:14] [PASSED] 35.03 Xe3p_HPM
[16:11:14] ================= [PASSED] check_media_ip ==================
[16:11:14] =================== check_platform_desc  ===================
[16:11:14] [PASSED] 0x9A60 (TIGERLAKE)
[16:11:14] [PASSED] 0x9A68 (TIGERLAKE)
[16:11:14] [PASSED] 0x9A70 (TIGERLAKE)
[16:11:14] [PASSED] 0x9A40 (TIGERLAKE)
[16:11:14] [PASSED] 0x9A49 (TIGERLAKE)
[16:11:14] [PASSED] 0x9A59 (TIGERLAKE)
[16:11:14] [PASSED] 0x9A78 (TIGERLAKE)
[16:11:14] [PASSED] 0x9AC0 (TIGERLAKE)
[16:11:14] [PASSED] 0x9AC9 (TIGERLAKE)
[16:11:14] [PASSED] 0x9AD9 (TIGERLAKE)
[16:11:14] [PASSED] 0x9AF8 (TIGERLAKE)
[16:11:14] [PASSED] 0x4C80 (ROCKETLAKE)
[16:11:14] [PASSED] 0x4C8A (ROCKETLAKE)
[16:11:14] [PASSED] 0x4C8B (ROCKETLAKE)
[16:11:14] [PASSED] 0x4C8C (ROCKETLAKE)
[16:11:14] [PASSED] 0x4C90 (ROCKETLAKE)
[16:11:14] [PASSED] 0x4C9A (ROCKETLAKE)
[16:11:14] [PASSED] 0x4680 (ALDERLAKE_S)
[16:11:14] [PASSED] 0x4682 (ALDERLAKE_S)
[16:11:14] [PASSED] 0x4688 (ALDERLAKE_S)
[16:11:14] [PASSED] 0x468A (ALDERLAKE_S)
[16:11:14] [PASSED] 0x468B (ALDERLAKE_S)
[16:11:14] [PASSED] 0x4690 (ALDERLAKE_S)
[16:11:14] [PASSED] 0x4692 (ALDERLAKE_S)
[16:11:14] [PASSED] 0x4693 (ALDERLAKE_S)
[16:11:14] [PASSED] 0x46A0 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46A1 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46A2 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46A3 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46A6 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46A8 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46AA (ALDERLAKE_P)
[16:11:14] [PASSED] 0x462A (ALDERLAKE_P)
[16:11:14] [PASSED] 0x4626 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x4628 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46B0 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46B1 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46B2 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46B3 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46C0 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46C1 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46C2 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46C3 (ALDERLAKE_P)
[16:11:14] [PASSED] 0x46D0 (ALDERLAKE_N)
[16:11:14] [PASSED] 0x46D1 (ALDERLAKE_N)
[16:11:14] [PASSED] 0x46D2 (ALDERLAKE_N)
[16:11:14] [PASSED] 0x46D3 (ALDERLAKE_N)
[16:11:14] [PASSED] 0x46D4 (ALDERLAKE_N)
[16:11:14] [PASSED] 0xA721 (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7A1 (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7A9 (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7AC (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7AD (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA720 (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7A0 (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7A8 (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7AA (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA7AB (ALDERLAKE_P)
[16:11:14] [PASSED] 0xA780 (ALDERLAKE_S)
[16:11:14] [PASSED] 0xA781 (ALDERLAKE_S)
[16:11:14] [PASSED] 0xA782 (ALDERLAKE_S)
[16:11:14] [PASSED] 0xA783 (ALDERLAKE_S)
[16:11:14] [PASSED] 0xA788 (ALDERLAKE_S)
[16:11:14] [PASSED] 0xA789 (ALDERLAKE_S)
[16:11:14] [PASSED] 0xA78A (ALDERLAKE_S)
[16:11:14] [PASSED] 0xA78B (ALDERLAKE_S)
[16:11:14] [PASSED] 0x4905 (DG1)
[16:11:14] [PASSED] 0x4906 (DG1)
[16:11:14] [PASSED] 0x4907 (DG1)
[16:11:14] [PASSED] 0x4908 (DG1)
[16:11:14] [PASSED] 0x4909 (DG1)
[16:11:14] [PASSED] 0x56C0 (DG2)
[16:11:14] [PASSED] 0x56C2 (DG2)
[16:11:14] [PASSED] 0x56C1 (DG2)
[16:11:14] [PASSED] 0x7D51 (METEORLAKE)
[16:11:14] [PASSED] 0x7DD1 (METEORLAKE)
[16:11:14] [PASSED] 0x7D41 (METEORLAKE)
[16:11:14] [PASSED] 0x7D67 (METEORLAKE)
[16:11:14] [PASSED] 0xB640 (METEORLAKE)
[16:11:14] [PASSED] 0x56A0 (DG2)
[16:11:14] [PASSED] 0x56A1 (DG2)
[16:11:14] [PASSED] 0x56A2 (DG2)
[16:11:14] [PASSED] 0x56BE (DG2)
[16:11:14] [PASSED] 0x56BF (DG2)
[16:11:14] [PASSED] 0x5690 (DG2)
[16:11:14] [PASSED] 0x5691 (DG2)
[16:11:14] [PASSED] 0x5692 (DG2)
[16:11:14] [PASSED] 0x56A5 (DG2)
[16:11:14] [PASSED] 0x56A6 (DG2)
[16:11:14] [PASSED] 0x56B0 (DG2)
[16:11:14] [PASSED] 0x56B1 (DG2)
[16:11:14] [PASSED] 0x56BA (DG2)
[16:11:14] [PASSED] 0x56BB (DG2)
[16:11:14] [PASSED] 0x56BC (DG2)
[16:11:14] [PASSED] 0x56BD (DG2)
[16:11:14] [PASSED] 0x5693 (DG2)
[16:11:14] [PASSED] 0x5694 (DG2)
[16:11:14] [PASSED] 0x5695 (DG2)
[16:11:14] [PASSED] 0x56A3 (DG2)
[16:11:14] [PASSED] 0x56A4 (DG2)
[16:11:14] [PASSED] 0x56B2 (DG2)
[16:11:14] [PASSED] 0x56B3 (DG2)
[16:11:14] [PASSED] 0x5696 (DG2)
[16:11:14] [PASSED] 0x5697 (DG2)
[16:11:14] [PASSED] 0xB69 (PVC)
[16:11:14] [PASSED] 0xB6E (PVC)
[16:11:14] [PASSED] 0xBD4 (PVC)
[16:11:14] [PASSED] 0xBD5 (PVC)
[16:11:14] [PASSED] 0xBD6 (PVC)
[16:11:14] [PASSED] 0xBD7 (PVC)
[16:11:14] [PASSED] 0xBD8 (PVC)
[16:11:14] [PASSED] 0xBD9 (PVC)
[16:11:14] [PASSED] 0xBDA (PVC)
[16:11:14] [PASSED] 0xBDB (PVC)
[16:11:14] [PASSED] 0xBE0 (PVC)
[16:11:14] [PASSED] 0xBE1 (PVC)
[16:11:14] [PASSED] 0xBE5 (PVC)
[16:11:14] [PASSED] 0x7D40 (METEORLAKE)
[16:11:14] [PASSED] 0x7D45 (METEORLAKE)
[16:11:14] [PASSED] 0x7D55 (METEORLAKE)
[16:11:14] [PASSED] 0x7D60 (METEORLAKE)
[16:11:14] [PASSED] 0x7DD5 (METEORLAKE)
[16:11:14] [PASSED] 0x6420 (LUNARLAKE)
[16:11:14] [PASSED] 0x64A0 (LUNARLAKE)
[16:11:14] [PASSED] 0x64B0 (LUNARLAKE)
[16:11:14] [PASSED] 0xE202 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE209 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE20B (BATTLEMAGE)
[16:11:14] [PASSED] 0xE20C (BATTLEMAGE)
[16:11:14] [PASSED] 0xE20D (BATTLEMAGE)
[16:11:14] [PASSED] 0xE210 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE211 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE212 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE216 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE220 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE221 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE222 (BATTLEMAGE)
[16:11:14] [PASSED] 0xE223 (BATTLEMAGE)
[16:11:14] [PASSED] 0xB080 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB081 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB082 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB083 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB084 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB085 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB086 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB087 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB08F (PANTHERLAKE)
[16:11:14] [PASSED] 0xB090 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB0A0 (PANTHERLAKE)
[16:11:14] [PASSED] 0xB0B0 (PANTHERLAKE)
[16:11:14] [PASSED] 0xFD80 (PANTHERLAKE)
[16:11:14] [PASSED] 0xFD81 (PANTHERLAKE)
[16:11:14] [PASSED] 0xD740 (NOVALAKE_S)
[16:11:14] [PASSED] 0xD741 (NOVALAKE_S)
[16:11:14] [PASSED] 0xD742 (NOVALAKE_S)
[16:11:14] [PASSED] 0xD743 (NOVALAKE_S)
[16:11:14] [PASSED] 0xD744 (NOVALAKE_S)
[16:11:14] [PASSED] 0xD745 (NOVALAKE_S)
[16:11:14] [PASSED] 0x674C (CRESCENTISLAND)
[16:11:14] [PASSED] 0xD750 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD751 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD752 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD753 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD754 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD755 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD756 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD757 (NOVALAKE_P)
[16:11:14] [PASSED] 0xD75F (NOVALAKE_P)
[16:11:14] =============== [PASSED] check_platform_desc ===============
[16:11:14] ===================== [PASSED] xe_pci ======================
[16:11:14] =================== xe_rtp (2 subtests) ====================
[16:11:14] =============== xe_rtp_process_to_sr_tests  ================
[16:11:14] [PASSED] coalesce-same-reg
[16:11:14] [PASSED] no-match-no-add
[16:11:14] [PASSED] match-or
[16:11:14] [PASSED] match-or-xfail
[16:11:14] [PASSED] no-match-no-add-multiple-rules
[16:11:14] [PASSED] two-regs-two-entries
[16:11:14] [PASSED] clr-one-set-other
[16:11:14] [PASSED] set-field
[16:11:14] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[16:11:14] [PASSED] conflict-not-disjoint
[16:11:14] [PASSED] conflict-reg-type
[16:11:14] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[16:11:14] ================== xe_rtp_process_tests  ===================
[16:11:14] [PASSED] active1
[16:11:14] [PASSED] active2
[16:11:14] [PASSED] active-inactive
[16:11:14] [PASSED] inactive-active
[16:11:14] [PASSED] inactive-1st_or_active-inactive
[16:11:14] [PASSED] inactive-2nd_or_active-inactive
[16:11:14] [PASSED] inactive-last_or_active-inactive
[16:11:14] [PASSED] inactive-no_or_active-inactive
[16:11:14] ============== [PASSED] xe_rtp_process_tests ===============
[16:11:14] ===================== [PASSED] xe_rtp ======================
[16:11:14] ==================== xe_wa (1 subtest) =====================
[16:11:14] ======================== xe_wa_gt  =========================
[16:11:14] [PASSED] TIGERLAKE B0
[16:11:14] [PASSED] DG1 A0
[16:11:14] [PASSED] DG1 B0
[16:11:14] [PASSED] ALDERLAKE_S A0
[16:11:14] [PASSED] ALDERLAKE_S B0
[16:11:14] [PASSED] ALDERLAKE_S C0
[16:11:14] [PASSED] ALDERLAKE_S D0
[16:11:14] [PASSED] ALDERLAKE_P A0
[16:11:14] [PASSED] ALDERLAKE_P B0
[16:11:14] [PASSED] ALDERLAKE_P C0
[16:11:14] [PASSED] ALDERLAKE_S RPLS D0
[16:11:14] [PASSED] ALDERLAKE_P RPLU E0
[16:11:14] [PASSED] DG2 G10 C0
[16:11:14] [PASSED] DG2 G11 B1
[16:11:14] [PASSED] DG2 G12 A1
[16:11:14] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[16:11:14] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[16:11:14] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[16:11:14] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[16:11:14] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[16:11:14] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[16:11:14] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[16:11:14] ==================== [PASSED] xe_wa_gt =====================
[16:11:14] ====================== [PASSED] xe_wa ======================
[16:11:14] ============================================================
[16:11:14] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[16:11:14] Elapsed time: 36.048s total, 4.247s configuring, 31.184s building, 0.598s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:11:14] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:11:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:11:39] Starting KUnit Kernel (1/1)...
[16:11:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:11:40] ============ drm_test_pick_cmdline (2 subtests) ============
[16:11:40] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[16:11:40] =============== drm_test_pick_cmdline_named  ===============
[16:11:40] [PASSED] NTSC
[16:11:40] [PASSED] NTSC-J
[16:11:40] [PASSED] PAL
[16:11:40] [PASSED] PAL-M
[16:11:40] =========== [PASSED] drm_test_pick_cmdline_named ===========
[16:11:40] ============== [PASSED] drm_test_pick_cmdline ==============
[16:11:40] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[16:11:40] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[16:11:40] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[16:11:40] =========== drm_validate_clone_mode (2 subtests) ===========
[16:11:40] ============== drm_test_check_in_clone_mode  ===============
[16:11:40] [PASSED] in_clone_mode
[16:11:40] [PASSED] not_in_clone_mode
[16:11:40] ========== [PASSED] drm_test_check_in_clone_mode ===========
[16:11:40] =============== drm_test_check_valid_clones  ===============
[16:11:40] [PASSED] not_in_clone_mode
[16:11:40] [PASSED] valid_clone
[16:11:40] [PASSED] invalid_clone
[16:11:40] =========== [PASSED] drm_test_check_valid_clones ===========
[16:11:40] ============= [PASSED] drm_validate_clone_mode =============
[16:11:40] ============= drm_validate_modeset (1 subtest) =============
[16:11:40] [PASSED] drm_test_check_connector_changed_modeset
[16:11:40] ============== [PASSED] drm_validate_modeset ===============
[16:11:40] ====== drm_test_bridge_get_current_state (2 subtests) ======
[16:11:40] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[16:11:40] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[16:11:40] ======== [PASSED] drm_test_bridge_get_current_state ========
[16:11:40] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[16:11:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[16:11:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[16:11:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[16:11:40] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[16:11:40] ============== drm_bridge_alloc (2 subtests) ===============
[16:11:40] [PASSED] drm_test_drm_bridge_alloc_basic
[16:11:40] [PASSED] drm_test_drm_bridge_alloc_get_put
[16:11:40] ================ [PASSED] drm_bridge_alloc =================
[16:11:40] ============= drm_cmdline_parser (40 subtests) =============
[16:11:40] [PASSED] drm_test_cmdline_force_d_only
[16:11:40] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:11:40] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:11:40] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:11:40] [PASSED] drm_test_cmdline_force_e_only
[16:11:40] [PASSED] drm_test_cmdline_res
[16:11:40] [PASSED] drm_test_cmdline_res_vesa
[16:11:40] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:11:40] [PASSED] drm_test_cmdline_res_rblank
[16:11:40] [PASSED] drm_test_cmdline_res_bpp
[16:11:40] [PASSED] drm_test_cmdline_res_refresh
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:11:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:11:40] [PASSED] drm_test_cmdline_res_margins_force_on
[16:11:40] [PASSED] drm_test_cmdline_res_vesa_margins
[16:11:40] [PASSED] drm_test_cmdline_name
[16:11:40] [PASSED] drm_test_cmdline_name_bpp
[16:11:40] [PASSED] drm_test_cmdline_name_option
[16:11:40] [PASSED] drm_test_cmdline_name_bpp_option
[16:11:40] [PASSED] drm_test_cmdline_rotate_0
[16:11:40] [PASSED] drm_test_cmdline_rotate_90
[16:11:40] [PASSED] drm_test_cmdline_rotate_180
[16:11:40] [PASSED] drm_test_cmdline_rotate_270
[16:11:40] [PASSED] drm_test_cmdline_hmirror
[16:11:40] [PASSED] drm_test_cmdline_vmirror
[16:11:40] [PASSED] drm_test_cmdline_margin_options
[16:11:40] [PASSED] drm_test_cmdline_multiple_options
[16:11:40] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:11:40] [PASSED] drm_test_cmdline_extra_and_option
[16:11:40] [PASSED] drm_test_cmdline_freestanding_options
[16:11:40] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:11:40] [PASSED] drm_test_cmdline_panel_orientation
[16:11:40] ================ drm_test_cmdline_invalid  =================
[16:11:40] [PASSED] margin_only
[16:11:40] [PASSED] interlace_only
[16:11:40] [PASSED] res_missing_x
[16:11:40] [PASSED] res_missing_y
[16:11:40] [PASSED] res_bad_y
[16:11:40] [PASSED] res_missing_y_bpp
[16:11:40] [PASSED] res_bad_bpp
[16:11:40] [PASSED] res_bad_refresh
[16:11:40] [PASSED] res_bpp_refresh_force_on_off
[16:11:40] [PASSED] res_invalid_mode
[16:11:40] [PASSED] res_bpp_wrong_place_mode
[16:11:40] [PASSED] name_bpp_refresh
[16:11:40] [PASSED] name_refresh
[16:11:40] [PASSED] name_refresh_wrong_mode
[16:11:40] [PASSED] name_refresh_invalid_mode
[16:11:40] [PASSED] rotate_multiple
[16:11:40] [PASSED] rotate_invalid_val
[16:11:40] [PASSED] rotate_truncated
[16:11:40] [PASSED] invalid_option
[16:11:40] [PASSED] invalid_tv_option
[16:11:40] [PASSED] truncated_tv_option
[16:11:40] ============ [PASSED] drm_test_cmdline_invalid =============
[16:11:40] =============== drm_test_cmdline_tv_options  ===============
[16:11:40] [PASSED] NTSC
[16:11:40] [PASSED] NTSC_443
[16:11:40] [PASSED] NTSC_J
[16:11:40] [PASSED] PAL
[16:11:40] [PASSED] PAL_M
[16:11:40] [PASSED] PAL_N
[16:11:40] [PASSED] SECAM
[16:11:40] [PASSED] MONO_525
[16:11:40] [PASSED] MONO_625
[16:11:40] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:11:40] =============== [PASSED] drm_cmdline_parser ================
[16:11:40] ========== drmm_connector_hdmi_init (20 subtests) ==========
[16:11:40] [PASSED] drm_test_connector_hdmi_init_valid
[16:11:40] [PASSED] drm_test_connector_hdmi_init_bpc_8
[16:11:40] [PASSED] drm_test_connector_hdmi_init_bpc_10
[16:11:40] [PASSED] drm_test_connector_hdmi_init_bpc_12
[16:11:40] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[16:11:40] [PASSED] drm_test_connector_hdmi_init_bpc_null
[16:11:40] [PASSED] drm_test_connector_hdmi_init_formats_empty
[16:11:40] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[16:11:40] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[16:11:40] [PASSED] supported_formats=0x9 yuv420_allowed=1
[16:11:40] [PASSED] supported_formats=0x9 yuv420_allowed=0
[16:11:40] [PASSED] supported_formats=0x5 yuv420_allowed=1
[16:11:40] [PASSED] supported_formats=0x5 yuv420_allowed=0
[16:11:40] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[16:11:40] [PASSED] drm_test_connector_hdmi_init_null_ddc
[16:11:40] [PASSED] drm_test_connector_hdmi_init_null_product
[16:11:40] [PASSED] drm_test_connector_hdmi_init_null_vendor
[16:11:40] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[16:11:40] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[16:11:40] [PASSED] drm_test_connector_hdmi_init_product_valid
[16:11:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[16:11:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[16:11:40] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[16:11:40] ========= drm_test_connector_hdmi_init_type_valid  =========
[16:11:40] [PASSED] HDMI-A
[16:11:40] [PASSED] HDMI-B
[16:11:40] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[16:11:40] ======== drm_test_connector_hdmi_init_type_invalid  ========
[16:11:40] [PASSED] Unknown
[16:11:40] [PASSED] VGA
[16:11:40] [PASSED] DVI-I
[16:11:40] [PASSED] DVI-D
[16:11:40] [PASSED] DVI-A
[16:11:40] [PASSED] Composite
[16:11:40] [PASSED] SVIDEO
[16:11:40] [PASSED] LVDS
[16:11:40] [PASSED] Component
[16:11:40] [PASSED] DIN
[16:11:40] [PASSED] DP
[16:11:40] [PASSED] TV
[16:11:40] [PASSED] eDP
[16:11:40] [PASSED] Virtual
[16:11:40] [PASSED] DSI
[16:11:40] [PASSED] DPI
[16:11:40] [PASSED] Writeback
[16:11:40] [PASSED] SPI
[16:11:40] [PASSED] USB
[16:11:40] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[16:11:40] ============ [PASSED] drmm_connector_hdmi_init =============
[16:11:40] ============= drmm_connector_init (3 subtests) =============
[16:11:40] [PASSED] drm_test_drmm_connector_init
[16:11:40] [PASSED] drm_test_drmm_connector_init_null_ddc
[16:11:40] ========= drm_test_drmm_connector_init_type_valid  =========
[16:11:40] [PASSED] Unknown
[16:11:40] [PASSED] VGA
[16:11:40] [PASSED] DVI-I
[16:11:40] [PASSED] DVI-D
[16:11:40] [PASSED] DVI-A
[16:11:40] [PASSED] Composite
[16:11:40] [PASSED] SVIDEO
[16:11:40] [PASSED] LVDS
[16:11:40] [PASSED] Component
[16:11:40] [PASSED] DIN
[16:11:40] [PASSED] DP
[16:11:40] [PASSED] HDMI-A
[16:11:40] [PASSED] HDMI-B
[16:11:40] [PASSED] TV
[16:11:40] [PASSED] eDP
[16:11:40] [PASSED] Virtual
[16:11:40] [PASSED] DSI
[16:11:40] [PASSED] DPI
[16:11:40] [PASSED] Writeback
[16:11:40] [PASSED] SPI
[16:11:40] [PASSED] USB
[16:11:40] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[16:11:40] =============== [PASSED] drmm_connector_init ===============
[16:11:40] ========= drm_connector_dynamic_init (6 subtests) ==========
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_init
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_init_properties
[16:11:40] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[16:11:40] [PASSED] Unknown
[16:11:40] [PASSED] VGA
[16:11:40] [PASSED] DVI-I
[16:11:40] [PASSED] DVI-D
[16:11:40] [PASSED] DVI-A
[16:11:40] [PASSED] Composite
[16:11:40] [PASSED] SVIDEO
[16:11:40] [PASSED] LVDS
[16:11:40] [PASSED] Component
[16:11:40] [PASSED] DIN
[16:11:40] [PASSED] DP
[16:11:40] [PASSED] HDMI-A
[16:11:40] [PASSED] HDMI-B
[16:11:40] [PASSED] TV
[16:11:40] [PASSED] eDP
[16:11:40] [PASSED] Virtual
[16:11:40] [PASSED] DSI
[16:11:40] [PASSED] DPI
[16:11:40] [PASSED] Writeback
[16:11:40] [PASSED] SPI
[16:11:40] [PASSED] USB
[16:11:40] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[16:11:40] ======== drm_test_drm_connector_dynamic_init_name  =========
[16:11:40] [PASSED] Unknown
[16:11:40] [PASSED] VGA
[16:11:40] [PASSED] DVI-I
[16:11:40] [PASSED] DVI-D
[16:11:40] [PASSED] DVI-A
[16:11:40] [PASSED] Composite
[16:11:40] [PASSED] SVIDEO
[16:11:40] [PASSED] LVDS
[16:11:40] [PASSED] Component
[16:11:40] [PASSED] DIN
[16:11:40] [PASSED] DP
[16:11:40] [PASSED] HDMI-A
[16:11:40] [PASSED] HDMI-B
[16:11:40] [PASSED] TV
[16:11:40] [PASSED] eDP
[16:11:40] [PASSED] Virtual
[16:11:40] [PASSED] DSI
[16:11:40] [PASSED] DPI
[16:11:40] [PASSED] Writeback
[16:11:40] [PASSED] SPI
[16:11:40] [PASSED] USB
[16:11:40] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[16:11:40] =========== [PASSED] drm_connector_dynamic_init ============
[16:11:40] ==== drm_connector_dynamic_register_early (4 subtests) =====
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[16:11:40] ====== [PASSED] drm_connector_dynamic_register_early =======
[16:11:40] ======= drm_connector_dynamic_register (7 subtests) ========
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[16:11:40] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[16:11:40] ========= [PASSED] drm_connector_dynamic_register ==========
[16:11:40] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[16:11:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[16:11:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[16:11:40] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[16:11:40] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[16:11:40] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:11:40] [PASSED] NTSC
[16:11:40] [PASSED] NTSC-443
[16:11:40] [PASSED] NTSC-J
[16:11:40] [PASSED] PAL
[16:11:40] [PASSED] PAL-M
[16:11:40] [PASSED] PAL-N
[16:11:40] [PASSED] SECAM
[16:11:40] [PASSED] Mono
[16:11:40] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:11:40] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:11:40] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:11:40] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[16:11:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[16:11:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[16:11:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[16:11:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[16:11:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[16:11:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[16:11:40] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[16:11:40] [PASSED] VIC 96
[16:11:40] [PASSED] VIC 97
[16:11:40] [PASSED] VIC 101
[16:11:40] [PASSED] VIC 102
[16:11:40] [PASSED] VIC 106
[16:11:40] [PASSED] VIC 107
[16:11:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[16:11:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[16:11:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[16:11:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[16:11:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[16:11:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[16:11:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[16:11:40] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[16:11:40] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[16:11:40] [PASSED] Automatic
[16:11:40] [PASSED] Full
[16:11:40] [PASSED] Limited 16:235
[16:11:40] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[16:11:40] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[16:11:40] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[16:11:40] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[16:11:40] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[16:11:40] [PASSED] RGB
[16:11:40] [PASSED] YUV 4:2:0
[16:11:40] [PASSED] YUV 4:2:2
[16:11:40] [PASSED] YUV 4:4:4
[16:11:40] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[16:11:40] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[16:11:40] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[16:11:40] ============= drm_damage_helper (21 subtests) ==============
[16:11:40] [PASSED] drm_test_damage_iter_no_damage
[16:11:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:11:40] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:11:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:11:40] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:11:40] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:11:40] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:11:40] [PASSED] drm_test_damage_iter_simple_damage
[16:11:40] [PASSED] drm_test_damage_iter_single_damage
[16:11:40] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:11:40] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:11:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:11:40] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:11:40] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:11:40] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:11:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:11:40] [PASSED] drm_test_damage_iter_damage
[16:11:40] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:11:40] [PASSED] drm_test_damage_iter_damage_one_outside
[16:11:40] [PASSED] drm_test_damage_iter_damage_src_moved
[16:11:40] [PASSED] drm_test_damage_iter_damage_not_visible
[16:11:40] ================ [PASSED] drm_damage_helper ================
[16:11:40] ============== drm_dp_mst_helper (3 subtests) ==============
[16:11:40] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:11:40] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:11:40] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:11:40] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:11:40] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:11:40] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:11:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:11:40] ============== drm_test_dp_mst_calc_pbn_div  ===============
[16:11:40] [PASSED] Link rate 2000000 lane count 4
[16:11:40] [PASSED] Link rate 2000000 lane count 2
[16:11:40] [PASSED] Link rate 2000000 lane count 1
[16:11:40] [PASSED] Link rate 1350000 lane count 4
[16:11:40] [PASSED] Link rate 1350000 lane count 2
[16:11:40] [PASSED] Link rate 1350000 lane count 1
[16:11:40] [PASSED] Link rate 1000000 lane count 4
[16:11:40] [PASSED] Link rate 1000000 lane count 2
[16:11:40] [PASSED] Link rate 1000000 lane count 1
[16:11:40] [PASSED] Link rate 810000 lane count 4
[16:11:40] [PASSED] Link rate 810000 lane count 2
[16:11:40] [PASSED] Link rate 810000 lane count 1
[16:11:40] [PASSED] Link rate 540000 lane count 4
[16:11:40] [PASSED] Link rate 540000 lane count 2
[16:11:40] [PASSED] Link rate 540000 lane count 1
[16:11:40] [PASSED] Link rate 270000 lane count 4
[16:11:40] [PASSED] Link rate 270000 lane count 2
[16:11:40] [PASSED] Link rate 270000 lane count 1
[16:11:40] [PASSED] Link rate 162000 lane count 4
[16:11:40] [PASSED] Link rate 162000 lane count 2
[16:11:40] [PASSED] Link rate 162000 lane count 1
[16:11:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[16:11:40] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:11:40] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:11:40] [PASSED] DP_POWER_UP_PHY with port number
[16:11:40] [PASSED] DP_POWER_DOWN_PHY with port number
[16:11:40] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:11:40] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:11:40] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:11:40] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:11:40] [PASSED] DP_QUERY_PAYLOAD with port number
[16:11:40] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:11:40] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:11:40] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:11:40] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:11:40] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:11:40] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:11:40] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:11:40] [PASSED] DP_REMOTE_I2C_READ with port number
[16:11:40] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:11:40] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:11:40] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:11:40] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:11:40] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:11:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:11:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:11:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:11:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:11:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:11:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:11:40] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:11:40] ================ [PASSED] drm_dp_mst_helper ================
[16:11:40] ================== drm_exec (7 subtests) ===================
[16:11:40] [PASSED] sanitycheck
[16:11:40] [PASSED] test_lock
[16:11:40] [PASSED] test_lock_unlock
[16:11:40] [PASSED] test_duplicates
[16:11:40] [PASSED] test_prepare
[16:11:40] [PASSED] test_prepare_array
[16:11:40] [PASSED] test_multiple_loops
[16:11:40] ==================== [PASSED] drm_exec =====================
[16:11:40] =========== drm_format_helper_test (17 subtests) ===========
[16:11:40] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:11:40] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:11:40] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:11:40] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:11:40] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:11:40] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:11:40] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:11:40] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[16:11:40] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:11:40] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:11:40] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:11:40] ============== drm_test_fb_xrgb8888_to_mono  ===============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[16:11:40] ==================== drm_test_fb_swab  =====================
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ================ [PASSED] drm_test_fb_swab =================
[16:11:40] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[16:11:40] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[16:11:40] [PASSED] single_pixel_source_buffer
[16:11:40] [PASSED] single_pixel_clip_rectangle
[16:11:40] [PASSED] well_known_colors
[16:11:40] [PASSED] destination_pitch
[16:11:40] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[16:11:40] ================= drm_test_fb_clip_offset  =================
[16:11:40] [PASSED] pass through
[16:11:40] [PASSED] horizontal offset
[16:11:40] [PASSED] vertical offset
[16:11:40] [PASSED] horizontal and vertical offset
[16:11:40] [PASSED] horizontal offset (custom pitch)
[16:11:40] [PASSED] vertical offset (custom pitch)
[16:11:40] [PASSED] horizontal and vertical offset (custom pitch)
[16:11:40] ============= [PASSED] drm_test_fb_clip_offset =============
[16:11:40] =================== drm_test_fb_memcpy  ====================
[16:11:40] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[16:11:40] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[16:11:40] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[16:11:40] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[16:11:40] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[16:11:40] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[16:11:40] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[16:11:40] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[16:11:40] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[16:11:40] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[16:11:40] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[16:11:40] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[16:11:40] =============== [PASSED] drm_test_fb_memcpy ================
[16:11:40] ============= [PASSED] drm_format_helper_test ==============
[16:11:40] ================= drm_format (18 subtests) =================
[16:11:40] [PASSED] drm_test_format_block_width_invalid
[16:11:40] [PASSED] drm_test_format_block_width_one_plane
[16:11:40] [PASSED] drm_test_format_block_width_two_plane
[16:11:40] [PASSED] drm_test_format_block_width_three_plane
[16:11:40] [PASSED] drm_test_format_block_width_tiled
[16:11:40] [PASSED] drm_test_format_block_height_invalid
[16:11:40] [PASSED] drm_test_format_block_height_one_plane
[16:11:40] [PASSED] drm_test_format_block_height_two_plane
[16:11:40] [PASSED] drm_test_format_block_height_three_plane
[16:11:40] [PASSED] drm_test_format_block_height_tiled
[16:11:40] [PASSED] drm_test_format_min_pitch_invalid
[16:11:40] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:11:40] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:11:40] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:11:40] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:11:40] [PASSED] drm_test_format_min_pitch_two_plane
[16:11:40] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:11:40] [PASSED] drm_test_format_min_pitch_tiled
[16:11:40] =================== [PASSED] drm_format ====================
[16:11:40] ============== drm_framebuffer (10 subtests) ===============
[16:11:40] ========== drm_test_framebuffer_check_src_coords  ==========
[16:11:40] [PASSED] Success: source fits into fb
[16:11:40] [PASSED] Fail: overflowing fb with x-axis coordinate
[16:11:40] [PASSED] Fail: overflowing fb with y-axis coordinate
[16:11:40] [PASSED] Fail: overflowing fb with source width
[16:11:40] [PASSED] Fail: overflowing fb with source height
[16:11:40] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[16:11:40] [PASSED] drm_test_framebuffer_cleanup
[16:11:40] =============== drm_test_framebuffer_create  ===============
[16:11:40] [PASSED] ABGR8888 normal sizes
[16:11:40] [PASSED] ABGR8888 max sizes
[16:11:40] [PASSED] ABGR8888 pitch greater than min required
[16:11:40] [PASSED] ABGR8888 pitch less than min required
[16:11:40] [PASSED] ABGR8888 Invalid width
[16:11:40] [PASSED] ABGR8888 Invalid buffer handle
[16:11:40] [PASSED] No pixel format
[16:11:40] [PASSED] ABGR8888 Width 0
[16:11:40] [PASSED] ABGR8888 Height 0
[16:11:40] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:11:40] [PASSED] ABGR8888 Large buffer offset
[16:11:40] [PASSED] ABGR8888 Buffer offset for inexistent plane
[16:11:40] [PASSED] ABGR8888 Invalid flag
[16:11:40] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:11:40] [PASSED] ABGR8888 Valid buffer modifier
[16:11:40] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:11:40] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:11:40] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:11:40] [PASSED] NV12 Normal sizes
[16:11:40] [PASSED] NV12 Max sizes
[16:11:40] [PASSED] NV12 Invalid pitch
[16:11:40] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:11:40] [PASSED] NV12 different  modifier per-plane
[16:11:40] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:11:40] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:11:40] [PASSED] NV12 Modifier for inexistent plane
[16:11:40] [PASSED] NV12 Handle for inexistent plane
[16:11:40] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:11:40] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:11:40] [PASSED] YVU420 Normal sizes
[16:11:40] [PASSED] YVU420 Max sizes
[16:11:40] [PASSED] YVU420 Invalid pitch
[16:11:40] [PASSED] YVU420 Different pitches
[16:11:40] [PASSED] YVU420 Different buffer offsets/pitches
[16:11:40] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:11:40] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:11:40] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:11:40] [PASSED] YVU420 Valid modifier
[16:11:40] [PASSED] YVU420 Different modifiers per plane
[16:11:40] [PASSED] YVU420 Modifier for inexistent plane
[16:11:40] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[16:11:40] [PASSED] X0L2 Normal sizes
[16:11:40] [PASSED] X0L2 Max sizes
[16:11:40] [PASSED] X0L2 Invalid pitch
[16:11:40] [PASSED] X0L2 Pitch greater than minimum required
[16:11:40] [PASSED] X0L2 Handle for inexistent plane
[16:11:40] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:11:40] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:11:40] [PASSED] X0L2 Valid modifier
[16:11:40] [PASSED] X0L2 Modifier for inexistent plane
[16:11:40] =========== [PASSED] drm_test_framebuffer_create ===========
[16:11:40] [PASSED] drm_test_framebuffer_free
[16:11:40] [PASSED] drm_test_framebuffer_init
[16:11:40] [PASSED] drm_test_framebuffer_init_bad_format
[16:11:40] [PASSED] drm_test_framebuffer_init_dev_mismatch
[16:11:40] [PASSED] drm_test_framebuffer_lookup
[16:11:40] [PASSED] drm_test_framebuffer_lookup_inexistent
[16:11:40] [PASSED] drm_test_framebuffer_modifiers_not_supported
[16:11:40] ================= [PASSED] drm_framebuffer =================
[16:11:40] ================ drm_gem_shmem (8 subtests) ================
[16:11:40] [PASSED] drm_gem_shmem_test_obj_create
[16:11:40] [PASSED] drm_gem_shmem_test_obj_create_private
[16:11:40] [PASSED] drm_gem_shmem_test_pin_pages
[16:11:40] [PASSED] drm_gem_shmem_test_vmap
[16:11:40] [PASSED] drm_gem_shmem_test_get_sg_table
[16:11:40] [PASSED] drm_gem_shmem_test_get_pages_sgt
[16:11:40] [PASSED] drm_gem_shmem_test_madvise
[16:11:40] [PASSED] drm_gem_shmem_test_purge
[16:11:40] ================== [PASSED] drm_gem_shmem ==================
[16:11:40] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[16:11:40] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[16:11:40] [PASSED] Automatic
[16:11:40] [PASSED] Full
[16:11:40] [PASSED] Limited 16:235
[16:11:40] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[16:11:40] [PASSED] drm_test_check_disable_connector
[16:11:40] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[16:11:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[16:11:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[16:11:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[16:11:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[16:11:40] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[16:11:40] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[16:11:40] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[16:11:40] [PASSED] drm_test_check_output_bpc_dvi
[16:11:40] [PASSED] drm_test_check_output_bpc_format_vic_1
[16:11:40] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[16:11:40] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[16:11:40] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[16:11:40] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[16:11:40] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[16:11:40] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[16:11:40] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[16:11:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[16:11:40] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[16:11:40] [PASSED] drm_test_check_broadcast_rgb_value
[16:11:40] [PASSED] drm_test_check_bpc_8_value
[16:11:40] [PASSED] drm_test_check_bpc_10_value
[16:11:40] [PASSED] drm_test_check_bpc_12_value
[16:11:40] [PASSED] drm_test_check_format_value
[16:11:40] [PASSED] drm_test_check_tmds_char_value
[16:11:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[16:11:40] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[16:11:40] [PASSED] drm_test_check_mode_valid
[16:11:40] [PASSED] drm_test_check_mode_valid_reject
[16:11:40] [PASSED] drm_test_check_mode_valid_reject_rate
[16:11:40] [PASSED] drm_test_check_mode_valid_reject_max_clock
[16:11:40] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[16:11:40] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[16:11:40] [PASSED] drm_test_check_infoframes
[16:11:40] [PASSED] drm_test_check_reject_avi_infoframe
[16:11:40] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[16:11:40] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[16:11:40] [PASSED] drm_test_check_reject_audio_infoframe
[16:11:40] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[16:11:40] ================= drm_managed (2 subtests) =================
[16:11:40] [PASSED] drm_test_managed_release_action
[16:11:40] [PASSED] drm_test_managed_run_action
[16:11:40] =================== [PASSED] drm_managed ===================
[16:11:40] =================== drm_mm (6 subtests) ====================
[16:11:40] [PASSED] drm_test_mm_init
[16:11:40] [PASSED] drm_test_mm_debug
[16:11:40] [PASSED] drm_test_mm_align32
[16:11:40] [PASSED] drm_test_mm_align64
[16:11:40] [PASSED] drm_test_mm_lowest
[16:11:40] [PASSED] drm_test_mm_highest
[16:11:40] ===================== [PASSED] drm_mm ======================
[16:11:40] ============= drm_modes_analog_tv (5 subtests) =============
[16:11:40] [PASSED] drm_test_modes_analog_tv_mono_576i
[16:11:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:11:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:11:40] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:11:40] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:11:40] =============== [PASSED] drm_modes_analog_tv ===============
[16:11:40] ============== drm_plane_helper (2 subtests) ===============
[16:11:40] =============== drm_test_check_plane_state  ================
[16:11:40] [PASSED] clipping_simple
[16:11:40] [PASSED] clipping_rotate_reflect
[16:11:40] [PASSED] positioning_simple
[16:11:40] [PASSED] upscaling
[16:11:40] [PASSED] downscaling
[16:11:40] [PASSED] rounding1
[16:11:40] [PASSED] rounding2
[16:11:40] [PASSED] rounding3
[16:11:40] [PASSED] rounding4
[16:11:40] =========== [PASSED] drm_test_check_plane_state ============
[16:11:40] =========== drm_test_check_invalid_plane_state  ============
[16:11:40] [PASSED] positioning_invalid
[16:11:40] [PASSED] upscaling_invalid
[16:11:40] [PASSED] downscaling_invalid
[16:11:40] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:11:40] ================ [PASSED] drm_plane_helper =================
[16:11:40] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[16:11:40] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:11:40] [PASSED] None
[16:11:40] [PASSED] PAL
[16:11:40] [PASSED] NTSC
[16:11:40] [PASSED] Both, NTSC Default
[16:11:40] [PASSED] Both, PAL Default
[16:11:40] [PASSED] Both, NTSC Default, with PAL on command-line
[16:11:40] [PASSED] Both, PAL Default, with NTSC on command-line
[16:11:40] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:11:40] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:11:40] ================== drm_rect (9 subtests) ===================
[16:11:40] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:11:40] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:11:40] [PASSED] drm_test_rect_clip_scaled_clipped
[16:11:40] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:11:40] ================= drm_test_rect_intersect  =================
[16:11:40] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[16:11:40] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[16:11:40] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[16:11:40] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[16:11:40] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[16:11:40] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[16:11:40] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[16:11:40] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[16:11:40] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[16:11:40] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[16:11:40] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[16:11:40] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[16:11:40] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[16:11:40] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[16:11:40] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[16:11:40] ============= [PASSED] drm_test_rect_intersect =============
[16:11:40] ================ drm_test_rect_calc_hscale  ================
[16:11:40] [PASSED] normal use
[16:11:40] [PASSED] out of max range
[16:11:40] [PASSED] out of min range
[16:11:40] [PASSED] zero dst
[16:11:40] [PASSED] negative src
[16:11:40] [PASSED] negative dst
[16:11:40] ============ [PASSED] drm_test_rect_calc_hscale ============
[16:11:40] ================ drm_test_rect_calc_vscale  ================
[16:11:40] [PASSED] normal use
[16:11:40] [PASSED] out of max range
[16:11:40] [PASSED] out of min range
[16:11:40] [PASSED] zero dst
[16:11:40] [PASSED] negative src
[16:11:40] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[16:11:40] ============ [PASSED] drm_test_rect_calc_vscale ============
[16:11:40] ================== drm_test_rect_rotate  ===================
[16:11:40] [PASSED] reflect-x
[16:11:40] [PASSED] reflect-y
[16:11:40] [PASSED] rotate-0
[16:11:40] [PASSED] rotate-90
[16:11:40] [PASSED] rotate-180
[16:11:40] [PASSED] rotate-270
[16:11:40] ============== [PASSED] drm_test_rect_rotate ===============
[16:11:40] ================ drm_test_rect_rotate_inv  =================
[16:11:40] [PASSED] reflect-x
[16:11:40] [PASSED] reflect-y
[16:11:40] [PASSED] rotate-0
[16:11:40] [PASSED] rotate-90
[16:11:40] [PASSED] rotate-180
[16:11:40] [PASSED] rotate-270
[16:11:40] ============ [PASSED] drm_test_rect_rotate_inv =============
[16:11:40] ==================== [PASSED] drm_rect =====================
[16:11:40] ============ drm_sysfb_modeset_test (1 subtest) ============
[16:11:40] ============ drm_test_sysfb_build_fourcc_list  =============
[16:11:40] [PASSED] no native formats
[16:11:40] [PASSED] XRGB8888 as native format
[16:11:40] [PASSED] remove duplicates
[16:11:40] [PASSED] convert alpha formats
[16:11:40] [PASSED] random formats
[16:11:40] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[16:11:40] ============= [PASSED] drm_sysfb_modeset_test ==============
[16:11:40] ================== drm_fixp (2 subtests) ===================
[16:11:40] [PASSED] drm_test_int2fixp
[16:11:40] [PASSED] drm_test_sm2fixp
[16:11:40] ==================== [PASSED] drm_fixp =====================
[16:11:40] ============================================================
[16:11:40] Testing complete. Ran 621 tests: passed: 621
[16:11:40] Elapsed time: 25.829s total, 1.688s configuring, 23.974s building, 0.132s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[16:11:40] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:11:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:11:51] Starting KUnit Kernel (1/1)...
[16:11:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:11:51] ================= ttm_device (5 subtests) ==================
[16:11:51] [PASSED] ttm_device_init_basic
[16:11:51] [PASSED] ttm_device_init_multiple
[16:11:51] [PASSED] ttm_device_fini_basic
[16:11:51] [PASSED] ttm_device_init_no_vma_man
[16:11:51] ================== ttm_device_init_pools  ==================
[16:11:51] [PASSED] No DMA allocations, no DMA32 required
[16:11:51] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[16:11:51] Expected !list_lru_count(&pt.pages) to be false, but is true
[16:11:51] [FAILED] DMA allocations, DMA32 required
[16:11:51] [PASSED] No DMA allocations, DMA32 required
[16:11:51]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[16:11:51]     Expected !list_lru_count(&pt.pages) to be false, but is true
[16:11:51] ------------[ cut here ]------------
[16:11:51] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[16:11:51] refcount_t: underflow; use-after-free.
[16:11:51] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g351a21c41dfb #3 VOLUNTARY
[16:11:51] Tainted: [W]=WARN, [N]=TEST
[16:11:51] Stack:
[16:11:51]  6044ed8b 00000000 00000000 00000001
[16:11:51]  ffffff00 6044ed8b 6032367a 00000009
[16:11:51]  0000001c 60043e88 6002381c c50cbd40
[16:11:51] Call Trace:
[16:11:51]  [<6032367a>] ? devres_release_all+0xaa/0x100
[16:11:51]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[16:11:51]  [<6002381c>] ? _printk+0x0/0x65
[16:11:51]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[16:11:51]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[16:11:51]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[16:11:51]  [<60052e36>] ? um_set_signals+0x36/0x60
[16:11:51]  [<600c5a42>] ? call_rcu+0x52/0x90
[16:11:51]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[16:11:51]  [<60147f50>] ? kfree+0x0/0x250
[16:11:51]  [<6032367a>] ? devres_release_all+0xaa/0x100
[16:11:51]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[16:11:51]  [<6031c3c0>] ? bus_notify+0x0/0x60
[16:11:51]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[16:11:51]  [<60398620>] ? mutex_lock+0x0/0x40
[16:11:51]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[16:11:51]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[16:11:51]  [<60372210>] ? kobject_put+0x0/0x150
[16:11:51]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[16:11:51]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[16:11:51]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[16:11:51]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[16:11:51]  [<60315a8c>] ? device_del+0x1bc/0x600
[16:11:51]  [<60052e00>] ? um_set_signals+0x0/0x60
[16:11:51]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[16:11:51]  [<60052e00>] ? um_set_signals+0x0/0x60
[16:11:51]  [<60315ee4>] ? device_unregister+0x14/0x40
[16:11:51]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[16:11:51]  [<60257d70>] ? kunit_release_action+0x0/0x170
[16:11:51]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[16:11:51]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[16:11:51]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[16:11:51]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[16:11:51]  [<60081e36>] ? kthread+0xe6/0x150
[16:11:51]  [<60046435>] ? new_thread_handler+0x45/0x60
[16:11:51] ---[ end trace 0000000000000000 ]---
[16:11:51] [FAILED] DMA allocations, no DMA32 required
[16:11:51] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[16:11:51] ============== [FAILED] ttm_device_init_pools ==============
[16:11:51]     # module: ttm_device_test
[16:11:51] # ttm_device: pass:4 fail:1 skip:0 total:5
[16:11:51] # Totals: pass:6 fail:2 skip:0 total:8
[16:11:51] =================== [FAILED] ttm_device ====================
[16:11:51] ================== ttm_pool (8 subtests) ===================
[16:11:51] ================== ttm_pool_alloc_basic  ===================
[16:11:51] [PASSED] One page
[16:11:51] [PASSED] More than one page
[16:11:51] [PASSED] Above the allocation limit
[16:11:51] [PASSED] One page, with coherent DMA mappings enabled
[16:11:51] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:11:51] ============== [PASSED] ttm_pool_alloc_basic ===============
[16:11:51] ============== ttm_pool_alloc_basic_dma_addr  ==============
[16:11:51] [PASSED] One page
[16:11:51] [PASSED] More than one page
[16:11:51] [PASSED] Above the allocation limit
[16:11:51] [PASSED] One page, with coherent DMA mappings enabled
[16:11:51] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:11:51] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[16:11:51] [PASSED] ttm_pool_alloc_order_caching_match
[16:11:51] [PASSED] ttm_pool_alloc_caching_mismatch
[16:11:51] [PASSED] ttm_pool_alloc_order_mismatch
[16:11:51] [PASSED] ttm_pool_free_dma_alloc
[16:11:51] [ERROR] Test: ttm_pool: missing expected subtest!
[16:11:51] 
[16:11:51] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g351a21c41dfb
[16:11:51] RIP: 0033:list_lru_count_node+0xe/0x20
[16:11:51] RSP: 00000000c50cbed8  EFLAGS: 00010246
[16:11:51] RAX: 0000000000000000 RBX: 00000000c5003c90 RCX: 000000008524c7d8
[16:11:51] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000085086880
[16:11:51] RBP: 0000000085086800 R08: 00000000c3a80c28 R09: 0000000085050c80
[16:11:51] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000085050c80
[16:11:51] R13: 0000000060440770 R14: 000000006010eb50 R15: 0000000085086880
[16:11:51] Kernel panic - not syncing: Segfault with no mm
[16:11:51] [CRASHED] 
[16:11:51] [ERROR] Test: ttm_pool: missing expected subtest!
[16:11:51] [CRASHED] 
[16:11:51] [ERROR] Test: ttm_pool: missing subtest result line!
[16:11:51] # module: ttm_pool_test
[16:11:51] ==================== [CRASHED] ttm_pool ====================
[16:11:51] [ERROR] Test: main: missing expected subtest!
[16:11:51] [CRASHED] 
[16:11:51] [ERROR] Test: main: missing expected subtest!
[16:11:51] [CRASHED] 
[16:11:51] [ERROR] Test: main: missing expected subtest!
[16:11:51] [CRASHED] 
[16:11:51] [ERROR] Test: main: missing expected subtest!
[16:11:51] [CRASHED] 
[16:11:51] ============================================================
[16:11:51] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[16:11:51] Elapsed time: 11.415s total, 1.702s configuring, 9.446s building, 0.266s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


