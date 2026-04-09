Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640410FC463
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 01:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3B110E70C;
	Thu,  9 Apr 2026 01:40:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502A010E70A;
 Thu,  9 Apr 2026 01:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_use_krealloc=5Farray?=
 =?utf-8?q?_to_prevent_integer_overflow_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Baoli.Zhang" <baoli.zhang@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 01:40:24 -0000
Message-ID: <177569882427.444945.702463517578358354@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409012520.3531256-1-baoli.zhang@linux.intel.com>
In-Reply-To: <20260409012520.3531256-1-baoli.zhang@linux.intel.com>
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

Series: drm/xe: use krealloc_array to prevent integer overflow (rev2)
URL   : https://patchwork.freedesktop.org/series/163696/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[01:39:07] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:39:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:39:42] Starting KUnit Kernel (1/1)...
[01:39:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:39:42] ================== guc_buf (11 subtests) ===================
[01:39:42] [PASSED] test_smallest
[01:39:42] [PASSED] test_largest
[01:39:42] [PASSED] test_granular
[01:39:42] [PASSED] test_unique
[01:39:42] [PASSED] test_overlap
[01:39:42] [PASSED] test_reusable
[01:39:42] [PASSED] test_too_big
[01:39:42] [PASSED] test_flush
[01:39:42] [PASSED] test_lookup
[01:39:42] [PASSED] test_data
[01:39:42] [PASSED] test_class
[01:39:42] ===================== [PASSED] guc_buf =====================
[01:39:42] =================== guc_dbm (7 subtests) ===================
[01:39:42] [PASSED] test_empty
[01:39:42] [PASSED] test_default
[01:39:42] ======================== test_size  ========================
[01:39:42] [PASSED] 4
[01:39:42] [PASSED] 8
[01:39:42] [PASSED] 32
[01:39:42] [PASSED] 256
[01:39:42] ==================== [PASSED] test_size ====================
[01:39:42] ======================= test_reuse  ========================
[01:39:42] [PASSED] 4
[01:39:42] [PASSED] 8
[01:39:42] [PASSED] 32
[01:39:42] [PASSED] 256
[01:39:42] =================== [PASSED] test_reuse ====================
[01:39:42] =================== test_range_overlap  ====================
[01:39:42] [PASSED] 4
[01:39:42] [PASSED] 8
[01:39:42] [PASSED] 32
[01:39:42] [PASSED] 256
[01:39:42] =============== [PASSED] test_range_overlap ================
[01:39:42] =================== test_range_compact  ====================
[01:39:42] [PASSED] 4
[01:39:42] [PASSED] 8
[01:39:42] [PASSED] 32
[01:39:42] [PASSED] 256
[01:39:42] =============== [PASSED] test_range_compact ================
[01:39:42] ==================== test_range_spare  =====================
[01:39:42] [PASSED] 4
[01:39:42] [PASSED] 8
[01:39:42] [PASSED] 32
[01:39:42] [PASSED] 256
[01:39:42] ================ [PASSED] test_range_spare =================
[01:39:42] ===================== [PASSED] guc_dbm =====================
[01:39:42] =================== guc_idm (6 subtests) ===================
[01:39:42] [PASSED] bad_init
[01:39:42] [PASSED] no_init
[01:39:42] [PASSED] init_fini
[01:39:42] [PASSED] check_used
[01:39:43] [PASSED] check_quota
[01:39:43] [PASSED] check_all
[01:39:43] ===================== [PASSED] guc_idm =====================
[01:39:43] ================== no_relay (3 subtests) ===================
[01:39:43] [PASSED] xe_drops_guc2pf_if_not_ready
[01:39:43] [PASSED] xe_drops_guc2vf_if_not_ready
[01:39:43] [PASSED] xe_rejects_send_if_not_ready
[01:39:43] ==================== [PASSED] no_relay =====================
[01:39:43] ================== pf_relay (14 subtests) ==================
[01:39:43] [PASSED] pf_rejects_guc2pf_too_short
[01:39:43] [PASSED] pf_rejects_guc2pf_too_long
[01:39:43] [PASSED] pf_rejects_guc2pf_no_payload
[01:39:43] [PASSED] pf_fails_no_payload
[01:39:43] [PASSED] pf_fails_bad_origin
[01:39:43] [PASSED] pf_fails_bad_type
[01:39:43] [PASSED] pf_txn_reports_error
[01:39:43] [PASSED] pf_txn_sends_pf2guc
[01:39:43] [PASSED] pf_sends_pf2guc
[01:39:43] [SKIPPED] pf_loopback_nop
[01:39:43] [SKIPPED] pf_loopback_echo
[01:39:43] [SKIPPED] pf_loopback_fail
[01:39:43] [SKIPPED] pf_loopback_busy
[01:39:43] [SKIPPED] pf_loopback_retry
[01:39:43] ==================== [PASSED] pf_relay =====================
[01:39:43] ================== vf_relay (3 subtests) ===================
[01:39:43] [PASSED] vf_rejects_guc2vf_too_short
[01:39:43] [PASSED] vf_rejects_guc2vf_too_long
[01:39:43] [PASSED] vf_rejects_guc2vf_no_payload
[01:39:43] ==================== [PASSED] vf_relay =====================
[01:39:43] ================ pf_gt_config (9 subtests) =================
[01:39:43] [PASSED] fair_contexts_1vf
[01:39:43] [PASSED] fair_doorbells_1vf
[01:39:43] [PASSED] fair_ggtt_1vf
[01:39:43] ====================== fair_vram_1vf  ======================
[01:39:43] [PASSED] 3.50 GiB
[01:39:43] [PASSED] 11.5 GiB
[01:39:43] [PASSED] 15.5 GiB
[01:39:43] [PASSED] 31.5 GiB
[01:39:43] [PASSED] 63.5 GiB
[01:39:43] [PASSED] 1.91 GiB
[01:39:43] ================== [PASSED] fair_vram_1vf ==================
[01:39:43] ================ fair_vram_1vf_admin_only  =================
[01:39:43] [PASSED] 3.50 GiB
[01:39:43] [PASSED] 11.5 GiB
[01:39:43] [PASSED] 15.5 GiB
[01:39:43] [PASSED] 31.5 GiB
[01:39:43] [PASSED] 63.5 GiB
[01:39:43] [PASSED] 1.91 GiB
[01:39:43] ============ [PASSED] fair_vram_1vf_admin_only =============
[01:39:43] ====================== fair_contexts  ======================
[01:39:43] [PASSED] 1 VF
[01:39:43] [PASSED] 2 VFs
[01:39:43] [PASSED] 3 VFs
[01:39:43] [PASSED] 4 VFs
[01:39:43] [PASSED] 5 VFs
[01:39:43] [PASSED] 6 VFs
[01:39:43] [PASSED] 7 VFs
[01:39:43] [PASSED] 8 VFs
[01:39:43] [PASSED] 9 VFs
[01:39:43] [PASSED] 10 VFs
[01:39:43] [PASSED] 11 VFs
[01:39:43] [PASSED] 12 VFs
[01:39:43] [PASSED] 13 VFs
[01:39:43] [PASSED] 14 VFs
[01:39:43] [PASSED] 15 VFs
[01:39:43] [PASSED] 16 VFs
[01:39:43] [PASSED] 17 VFs
[01:39:43] [PASSED] 18 VFs
[01:39:43] [PASSED] 19 VFs
[01:39:43] [PASSED] 20 VFs
[01:39:43] [PASSED] 21 VFs
[01:39:43] [PASSED] 22 VFs
[01:39:43] [PASSED] 23 VFs
[01:39:43] [PASSED] 24 VFs
[01:39:43] [PASSED] 25 VFs
[01:39:43] [PASSED] 26 VFs
[01:39:43] [PASSED] 27 VFs
[01:39:43] [PASSED] 28 VFs
[01:39:43] [PASSED] 29 VFs
[01:39:43] [PASSED] 30 VFs
[01:39:43] [PASSED] 31 VFs
[01:39:43] [PASSED] 32 VFs
[01:39:43] [PASSED] 33 VFs
[01:39:43] [PASSED] 34 VFs
[01:39:43] [PASSED] 35 VFs
[01:39:43] [PASSED] 36 VFs
[01:39:43] [PASSED] 37 VFs
[01:39:43] [PASSED] 38 VFs
[01:39:43] [PASSED] 39 VFs
[01:39:43] [PASSED] 40 VFs
[01:39:43] [PASSED] 41 VFs
[01:39:43] [PASSED] 42 VFs
[01:39:43] [PASSED] 43 VFs
[01:39:43] [PASSED] 44 VFs
[01:39:43] [PASSED] 45 VFs
[01:39:43] [PASSED] 46 VFs
[01:39:43] [PASSED] 47 VFs
[01:39:43] [PASSED] 48 VFs
[01:39:43] [PASSED] 49 VFs
[01:39:43] [PASSED] 50 VFs
[01:39:43] [PASSED] 51 VFs
[01:39:43] [PASSED] 52 VFs
[01:39:43] [PASSED] 53 VFs
[01:39:43] [PASSED] 54 VFs
[01:39:43] [PASSED] 55 VFs
[01:39:43] [PASSED] 56 VFs
[01:39:43] [PASSED] 57 VFs
[01:39:43] [PASSED] 58 VFs
[01:39:43] [PASSED] 59 VFs
[01:39:43] [PASSED] 60 VFs
[01:39:43] [PASSED] 61 VFs
[01:39:43] [PASSED] 62 VFs
[01:39:43] [PASSED] 63 VFs
[01:39:43] ================== [PASSED] fair_contexts ==================
[01:39:43] ===================== fair_doorbells  ======================
[01:39:43] [PASSED] 1 VF
[01:39:43] [PASSED] 2 VFs
[01:39:43] [PASSED] 3 VFs
[01:39:43] [PASSED] 4 VFs
[01:39:43] [PASSED] 5 VFs
[01:39:43] [PASSED] 6 VFs
[01:39:43] [PASSED] 7 VFs
[01:39:43] [PASSED] 8 VFs
[01:39:43] [PASSED] 9 VFs
[01:39:43] [PASSED] 10 VFs
[01:39:43] [PASSED] 11 VFs
[01:39:43] [PASSED] 12 VFs
[01:39:43] [PASSED] 13 VFs
[01:39:43] [PASSED] 14 VFs
[01:39:43] [PASSED] 15 VFs
[01:39:43] [PASSED] 16 VFs
[01:39:43] [PASSED] 17 VFs
[01:39:43] [PASSED] 18 VFs
[01:39:43] [PASSED] 19 VFs
[01:39:43] [PASSED] 20 VFs
[01:39:43] [PASSED] 21 VFs
[01:39:43] [PASSED] 22 VFs
[01:39:43] [PASSED] 23 VFs
[01:39:43] [PASSED] 24 VFs
[01:39:43] [PASSED] 25 VFs
[01:39:43] [PASSED] 26 VFs
[01:39:43] [PASSED] 27 VFs
[01:39:43] [PASSED] 28 VFs
[01:39:43] [PASSED] 29 VFs
[01:39:43] [PASSED] 30 VFs
[01:39:43] [PASSED] 31 VFs
[01:39:43] [PASSED] 32 VFs
[01:39:43] [PASSED] 33 VFs
[01:39:43] [PASSED] 34 VFs
[01:39:43] [PASSED] 35 VFs
[01:39:43] [PASSED] 36 VFs
[01:39:43] [PASSED] 37 VFs
[01:39:43] [PASSED] 38 VFs
[01:39:43] [PASSED] 39 VFs
[01:39:43] [PASSED] 40 VFs
[01:39:43] [PASSED] 41 VFs
[01:39:43] [PASSED] 42 VFs
[01:39:43] [PASSED] 43 VFs
[01:39:43] [PASSED] 44 VFs
[01:39:43] [PASSED] 45 VFs
[01:39:43] [PASSED] 46 VFs
[01:39:43] [PASSED] 47 VFs
[01:39:43] [PASSED] 48 VFs
[01:39:43] [PASSED] 49 VFs
[01:39:43] [PASSED] 50 VFs
[01:39:43] [PASSED] 51 VFs
[01:39:43] [PASSED] 52 VFs
[01:39:43] [PASSED] 53 VFs
[01:39:43] [PASSED] 54 VFs
[01:39:43] [PASSED] 55 VFs
[01:39:43] [PASSED] 56 VFs
[01:39:43] [PASSED] 57 VFs
[01:39:43] [PASSED] 58 VFs
[01:39:43] [PASSED] 59 VFs
[01:39:43] [PASSED] 60 VFs
[01:39:43] [PASSED] 61 VFs
[01:39:43] [PASSED] 62 VFs
[01:39:43] [PASSED] 63 VFs
[01:39:43] ================= [PASSED] fair_doorbells ==================
[01:39:43] ======================== fair_ggtt  ========================
[01:39:43] [PASSED] 1 VF
[01:39:43] [PASSED] 2 VFs
[01:39:43] [PASSED] 3 VFs
[01:39:43] [PASSED] 4 VFs
[01:39:43] [PASSED] 5 VFs
[01:39:43] [PASSED] 6 VFs
[01:39:43] [PASSED] 7 VFs
[01:39:43] [PASSED] 8 VFs
[01:39:43] [PASSED] 9 VFs
[01:39:43] [PASSED] 10 VFs
[01:39:43] [PASSED] 11 VFs
[01:39:43] [PASSED] 12 VFs
[01:39:43] [PASSED] 13 VFs
[01:39:43] [PASSED] 14 VFs
[01:39:43] [PASSED] 15 VFs
[01:39:43] [PASSED] 16 VFs
[01:39:43] [PASSED] 17 VFs
[01:39:43] [PASSED] 18 VFs
[01:39:43] [PASSED] 19 VFs
[01:39:43] [PASSED] 20 VFs
[01:39:43] [PASSED] 21 VFs
[01:39:43] [PASSED] 22 VFs
[01:39:43] [PASSED] 23 VFs
[01:39:43] [PASSED] 24 VFs
[01:39:43] [PASSED] 25 VFs
[01:39:43] [PASSED] 26 VFs
[01:39:43] [PASSED] 27 VFs
[01:39:43] [PASSED] 28 VFs
[01:39:43] [PASSED] 29 VFs
[01:39:43] [PASSED] 30 VFs
[01:39:43] [PASSED] 31 VFs
[01:39:43] [PASSED] 32 VFs
[01:39:43] [PASSED] 33 VFs
[01:39:43] [PASSED] 34 VFs
[01:39:43] [PASSED] 35 VFs
[01:39:43] [PASSED] 36 VFs
[01:39:43] [PASSED] 37 VFs
[01:39:43] [PASSED] 38 VFs
[01:39:43] [PASSED] 39 VFs
[01:39:43] [PASSED] 40 VFs
[01:39:43] [PASSED] 41 VFs
[01:39:43] [PASSED] 42 VFs
[01:39:43] [PASSED] 43 VFs
[01:39:43] [PASSED] 44 VFs
[01:39:43] [PASSED] 45 VFs
[01:39:43] [PASSED] 46 VFs
[01:39:43] [PASSED] 47 VFs
[01:39:43] [PASSED] 48 VFs
[01:39:43] [PASSED] 49 VFs
[01:39:43] [PASSED] 50 VFs
[01:39:43] [PASSED] 51 VFs
[01:39:43] [PASSED] 52 VFs
[01:39:43] [PASSED] 53 VFs
[01:39:43] [PASSED] 54 VFs
[01:39:43] [PASSED] 55 VFs
[01:39:43] [PASSED] 56 VFs
[01:39:43] [PASSED] 57 VFs
[01:39:43] [PASSED] 58 VFs
[01:39:43] [PASSED] 59 VFs
[01:39:43] [PASSED] 60 VFs
[01:39:43] [PASSED] 61 VFs
[01:39:43] [PASSED] 62 VFs
[01:39:43] [PASSED] 63 VFs
[01:39:43] ==================== [PASSED] fair_ggtt ====================
[01:39:43] ======================== fair_vram  ========================
[01:39:43] [PASSED] 1 VF
[01:39:43] [PASSED] 2 VFs
[01:39:43] [PASSED] 3 VFs
[01:39:43] [PASSED] 4 VFs
[01:39:43] [PASSED] 5 VFs
[01:39:43] [PASSED] 6 VFs
[01:39:43] [PASSED] 7 VFs
[01:39:43] [PASSED] 8 VFs
[01:39:43] [PASSED] 9 VFs
[01:39:43] [PASSED] 10 VFs
[01:39:43] [PASSED] 11 VFs
[01:39:43] [PASSED] 12 VFs
[01:39:43] [PASSED] 13 VFs
[01:39:43] [PASSED] 14 VFs
[01:39:43] [PASSED] 15 VFs
[01:39:43] [PASSED] 16 VFs
[01:39:43] [PASSED] 17 VFs
[01:39:43] [PASSED] 18 VFs
[01:39:43] [PASSED] 19 VFs
[01:39:43] [PASSED] 20 VFs
[01:39:43] [PASSED] 21 VFs
[01:39:43] [PASSED] 22 VFs
[01:39:43] [PASSED] 23 VFs
[01:39:43] [PASSED] 24 VFs
[01:39:43] [PASSED] 25 VFs
[01:39:43] [PASSED] 26 VFs
[01:39:43] [PASSED] 27 VFs
[01:39:43] [PASSED] 28 VFs
[01:39:43] [PASSED] 29 VFs
[01:39:43] [PASSED] 30 VFs
[01:39:43] [PASSED] 31 VFs
[01:39:43] [PASSED] 32 VFs
[01:39:43] [PASSED] 33 VFs
[01:39:43] [PASSED] 34 VFs
[01:39:43] [PASSED] 35 VFs
[01:39:43] [PASSED] 36 VFs
[01:39:43] [PASSED] 37 VFs
[01:39:43] [PASSED] 38 VFs
[01:39:43] [PASSED] 39 VFs
[01:39:43] [PASSED] 40 VFs
[01:39:43] [PASSED] 41 VFs
[01:39:43] [PASSED] 42 VFs
[01:39:43] [PASSED] 43 VFs
[01:39:43] [PASSED] 44 VFs
[01:39:43] [PASSED] 45 VFs
[01:39:43] [PASSED] 46 VFs
[01:39:43] [PASSED] 47 VFs
[01:39:43] [PASSED] 48 VFs
[01:39:43] [PASSED] 49 VFs
[01:39:43] [PASSED] 50 VFs
[01:39:43] [PASSED] 51 VFs
[01:39:43] [PASSED] 52 VFs
[01:39:43] [PASSED] 53 VFs
[01:39:43] [PASSED] 54 VFs
[01:39:43] [PASSED] 55 VFs
[01:39:43] [PASSED] 56 VFs
[01:39:43] [PASSED] 57 VFs
[01:39:43] [PASSED] 58 VFs
[01:39:43] [PASSED] 59 VFs
[01:39:43] [PASSED] 60 VFs
[01:39:43] [PASSED] 61 VFs
[01:39:43] [PASSED] 62 VFs
[01:39:43] [PASSED] 63 VFs
[01:39:43] ==================== [PASSED] fair_vram ====================
[01:39:43] ================== [PASSED] pf_gt_config ===================
[01:39:43] ===================== lmtt (1 subtest) =====================
[01:39:43] ======================== test_ops  =========================
[01:39:43] [PASSED] 2-level
[01:39:43] [PASSED] multi-level
[01:39:43] ==================== [PASSED] test_ops =====================
[01:39:43] ====================== [PASSED] lmtt =======================
[01:39:43] ================= pf_service (11 subtests) =================
[01:39:43] [PASSED] pf_negotiate_any
[01:39:43] [PASSED] pf_negotiate_base_match
[01:39:43] [PASSED] pf_negotiate_base_newer
[01:39:43] [PASSED] pf_negotiate_base_next
[01:39:43] [SKIPPED] pf_negotiate_base_older
[01:39:43] [PASSED] pf_negotiate_base_prev
[01:39:43] [PASSED] pf_negotiate_latest_match
[01:39:43] [PASSED] pf_negotiate_latest_newer
[01:39:43] [PASSED] pf_negotiate_latest_next
[01:39:43] [SKIPPED] pf_negotiate_latest_older
[01:39:43] [SKIPPED] pf_negotiate_latest_prev
[01:39:43] =================== [PASSED] pf_service ====================
[01:39:43] ================= xe_guc_g2g (2 subtests) ==================
[01:39:43] ============== xe_live_guc_g2g_kunit_default  ==============
[01:39:43] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[01:39:43] ============== xe_live_guc_g2g_kunit_allmem  ===============
[01:39:43] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[01:39:43] =================== [SKIPPED] xe_guc_g2g ===================
[01:39:43] =================== xe_mocs (2 subtests) ===================
[01:39:43] ================ xe_live_mocs_kernel_kunit  ================
[01:39:43] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[01:39:43] ================ xe_live_mocs_reset_kunit  =================
[01:39:43] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[01:39:43] ==================== [SKIPPED] xe_mocs =====================
[01:39:43] ================= xe_migrate (2 subtests) ==================
[01:39:43] ================= xe_migrate_sanity_kunit  =================
[01:39:43] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[01:39:43] ================== xe_validate_ccs_kunit  ==================
[01:39:43] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[01:39:43] =================== [SKIPPED] xe_migrate ===================
[01:39:43] ================== xe_dma_buf (1 subtest) ==================
[01:39:43] ==================== xe_dma_buf_kunit  =====================
[01:39:43] ================ [SKIPPED] xe_dma_buf_kunit ================
[01:39:43] =================== [SKIPPED] xe_dma_buf ===================
[01:39:43] ================= xe_bo_shrink (1 subtest) =================
[01:39:43] =================== xe_bo_shrink_kunit  ====================
[01:39:43] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[01:39:43] ================== [SKIPPED] xe_bo_shrink ==================
[01:39:43] ==================== xe_bo (2 subtests) ====================
[01:39:43] ================== xe_ccs_migrate_kunit  ===================
[01:39:43] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[01:39:43] ==================== xe_bo_evict_kunit  ====================
[01:39:43] =============== [SKIPPED] xe_bo_evict_kunit ================
[01:39:43] ===================== [SKIPPED] xe_bo ======================
[01:39:43] ==================== args (13 subtests) ====================
[01:39:43] [PASSED] count_args_test
[01:39:43] [PASSED] call_args_example
[01:39:43] [PASSED] call_args_test
[01:39:43] [PASSED] drop_first_arg_example
[01:39:43] [PASSED] drop_first_arg_test
[01:39:43] [PASSED] first_arg_example
[01:39:43] [PASSED] first_arg_test
[01:39:43] [PASSED] last_arg_example
[01:39:43] [PASSED] last_arg_test
[01:39:43] [PASSED] pick_arg_example
[01:39:43] [PASSED] if_args_example
[01:39:43] [PASSED] if_args_test
[01:39:43] [PASSED] sep_comma_example
[01:39:43] ====================== [PASSED] args =======================
[01:39:43] =================== xe_pci (3 subtests) ====================
[01:39:43] ==================== check_graphics_ip  ====================
[01:39:43] [PASSED] 12.00 Xe_LP
[01:39:43] [PASSED] 12.10 Xe_LP+
[01:39:43] [PASSED] 12.55 Xe_HPG
[01:39:43] [PASSED] 12.60 Xe_HPC
[01:39:43] [PASSED] 12.70 Xe_LPG
[01:39:43] [PASSED] 12.71 Xe_LPG
[01:39:43] [PASSED] 12.74 Xe_LPG+
[01:39:43] [PASSED] 20.01 Xe2_HPG
[01:39:43] [PASSED] 20.02 Xe2_HPG
[01:39:43] [PASSED] 20.04 Xe2_LPG
[01:39:43] [PASSED] 30.00 Xe3_LPG
[01:39:43] [PASSED] 30.01 Xe3_LPG
[01:39:43] [PASSED] 30.03 Xe3_LPG
[01:39:43] [PASSED] 30.04 Xe3_LPG
[01:39:43] [PASSED] 30.05 Xe3_LPG
[01:39:43] [PASSED] 35.10 Xe3p_LPG
[01:39:43] [PASSED] 35.11 Xe3p_XPC
[01:39:43] ================ [PASSED] check_graphics_ip ================
[01:39:43] ===================== check_media_ip  ======================
[01:39:43] [PASSED] 12.00 Xe_M
[01:39:43] [PASSED] 12.55 Xe_HPM
[01:39:43] [PASSED] 13.00 Xe_LPM+
[01:39:43] [PASSED] 13.01 Xe2_HPM
[01:39:43] [PASSED] 20.00 Xe2_LPM
[01:39:43] [PASSED] 30.00 Xe3_LPM
[01:39:43] [PASSED] 30.02 Xe3_LPM
[01:39:43] [PASSED] 35.00 Xe3p_LPM
[01:39:43] [PASSED] 35.03 Xe3p_HPM
[01:39:43] ================= [PASSED] check_media_ip ==================
[01:39:43] =================== check_platform_desc  ===================
[01:39:43] [PASSED] 0x9A60 (TIGERLAKE)
[01:39:43] [PASSED] 0x9A68 (TIGERLAKE)
[01:39:43] [PASSED] 0x9A70 (TIGERLAKE)
[01:39:43] [PASSED] 0x9A40 (TIGERLAKE)
[01:39:43] [PASSED] 0x9A49 (TIGERLAKE)
[01:39:43] [PASSED] 0x9A59 (TIGERLAKE)
[01:39:43] [PASSED] 0x9A78 (TIGERLAKE)
[01:39:43] [PASSED] 0x9AC0 (TIGERLAKE)
[01:39:43] [PASSED] 0x9AC9 (TIGERLAKE)
[01:39:43] [PASSED] 0x9AD9 (TIGERLAKE)
[01:39:43] [PASSED] 0x9AF8 (TIGERLAKE)
[01:39:43] [PASSED] 0x4C80 (ROCKETLAKE)
[01:39:43] [PASSED] 0x4C8A (ROCKETLAKE)
[01:39:43] [PASSED] 0x4C8B (ROCKETLAKE)
[01:39:43] [PASSED] 0x4C8C (ROCKETLAKE)
[01:39:43] [PASSED] 0x4C90 (ROCKETLAKE)
[01:39:43] [PASSED] 0x4C9A (ROCKETLAKE)
[01:39:43] [PASSED] 0x4680 (ALDERLAKE_S)
[01:39:43] [PASSED] 0x4682 (ALDERLAKE_S)
[01:39:43] [PASSED] 0x4688 (ALDERLAKE_S)
[01:39:43] [PASSED] 0x468A (ALDERLAKE_S)
[01:39:43] [PASSED] 0x468B (ALDERLAKE_S)
[01:39:43] [PASSED] 0x4690 (ALDERLAKE_S)
[01:39:43] [PASSED] 0x4692 (ALDERLAKE_S)
[01:39:43] [PASSED] 0x4693 (ALDERLAKE_S)
[01:39:43] [PASSED] 0x46A0 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46A1 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46A2 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46A3 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46A6 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46A8 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46AA (ALDERLAKE_P)
[01:39:43] [PASSED] 0x462A (ALDERLAKE_P)
[01:39:43] [PASSED] 0x4626 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x4628 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46B0 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46B1 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46B2 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46B3 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46C0 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46C1 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46C2 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46C3 (ALDERLAKE_P)
[01:39:43] [PASSED] 0x46D0 (ALDERLAKE_N)
[01:39:43] [PASSED] 0x46D1 (ALDERLAKE_N)
[01:39:43] [PASSED] 0x46D2 (ALDERLAKE_N)
[01:39:43] [PASSED] 0x46D3 (ALDERLAKE_N)
[01:39:43] [PASSED] 0x46D4 (ALDERLAKE_N)
[01:39:43] [PASSED] 0xA721 (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7A1 (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7A9 (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7AC (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7AD (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA720 (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7A0 (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7A8 (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7AA (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA7AB (ALDERLAKE_P)
[01:39:43] [PASSED] 0xA780 (ALDERLAKE_S)
[01:39:43] [PASSED] 0xA781 (ALDERLAKE_S)
[01:39:43] [PASSED] 0xA782 (ALDERLAKE_S)
[01:39:43] [PASSED] 0xA783 (ALDERLAKE_S)
[01:39:43] [PASSED] 0xA788 (ALDERLAKE_S)
[01:39:43] [PASSED] 0xA789 (ALDERLAKE_S)
[01:39:43] [PASSED] 0xA78A (ALDERLAKE_S)
[01:39:43] [PASSED] 0xA78B (ALDERLAKE_S)
[01:39:43] [PASSED] 0x4905 (DG1)
[01:39:43] [PASSED] 0x4906 (DG1)
[01:39:43] [PASSED] 0x4907 (DG1)
[01:39:43] [PASSED] 0x4908 (DG1)
[01:39:43] [PASSED] 0x4909 (DG1)
[01:39:43] [PASSED] 0x56C0 (DG2)
[01:39:43] [PASSED] 0x56C2 (DG2)
[01:39:43] [PASSED] 0x56C1 (DG2)
[01:39:43] [PASSED] 0x7D51 (METEORLAKE)
[01:39:43] [PASSED] 0x7DD1 (METEORLAKE)
[01:39:43] [PASSED] 0x7D41 (METEORLAKE)
[01:39:43] [PASSED] 0x7D67 (METEORLAKE)
[01:39:43] [PASSED] 0xB640 (METEORLAKE)
[01:39:43] [PASSED] 0x56A0 (DG2)
[01:39:43] [PASSED] 0x56A1 (DG2)
[01:39:43] [PASSED] 0x56A2 (DG2)
[01:39:43] [PASSED] 0x56BE (DG2)
[01:39:43] [PASSED] 0x56BF (DG2)
[01:39:43] [PASSED] 0x5690 (DG2)
[01:39:43] [PASSED] 0x5691 (DG2)
[01:39:43] [PASSED] 0x5692 (DG2)
[01:39:43] [PASSED] 0x56A5 (DG2)
[01:39:43] [PASSED] 0x56A6 (DG2)
[01:39:43] [PASSED] 0x56B0 (DG2)
[01:39:43] [PASSED] 0x56B1 (DG2)
[01:39:43] [PASSED] 0x56BA (DG2)
[01:39:43] [PASSED] 0x56BB (DG2)
[01:39:43] [PASSED] 0x56BC (DG2)
[01:39:43] [PASSED] 0x56BD (DG2)
[01:39:43] [PASSED] 0x5693 (DG2)
[01:39:43] [PASSED] 0x5694 (DG2)
[01:39:43] [PASSED] 0x5695 (DG2)
[01:39:43] [PASSED] 0x56A3 (DG2)
[01:39:43] [PASSED] 0x56A4 (DG2)
[01:39:43] [PASSED] 0x56B2 (DG2)
[01:39:43] [PASSED] 0x56B3 (DG2)
[01:39:43] [PASSED] 0x5696 (DG2)
[01:39:43] [PASSED] 0x5697 (DG2)
[01:39:43] [PASSED] 0xB69 (PVC)
[01:39:43] [PASSED] 0xB6E (PVC)
[01:39:43] [PASSED] 0xBD4 (PVC)
[01:39:43] [PASSED] 0xBD5 (PVC)
[01:39:43] [PASSED] 0xBD6 (PVC)
[01:39:43] [PASSED] 0xBD7 (PVC)
[01:39:43] [PASSED] 0xBD8 (PVC)
[01:39:43] [PASSED] 0xBD9 (PVC)
[01:39:43] [PASSED] 0xBDA (PVC)
[01:39:43] [PASSED] 0xBDB (PVC)
[01:39:43] [PASSED] 0xBE0 (PVC)
[01:39:43] [PASSED] 0xBE1 (PVC)
[01:39:43] [PASSED] 0xBE5 (PVC)
[01:39:43] [PASSED] 0x7D40 (METEORLAKE)
[01:39:43] [PASSED] 0x7D45 (METEORLAKE)
[01:39:43] [PASSED] 0x7D55 (METEORLAKE)
[01:39:43] [PASSED] 0x7D60 (METEORLAKE)
[01:39:43] [PASSED] 0x7DD5 (METEORLAKE)
[01:39:43] [PASSED] 0x6420 (LUNARLAKE)
[01:39:43] [PASSED] 0x64A0 (LUNARLAKE)
[01:39:43] [PASSED] 0x64B0 (LUNARLAKE)
[01:39:43] [PASSED] 0xE202 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE209 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE20B (BATTLEMAGE)
[01:39:43] [PASSED] 0xE20C (BATTLEMAGE)
[01:39:43] [PASSED] 0xE20D (BATTLEMAGE)
[01:39:43] [PASSED] 0xE210 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE211 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE212 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE216 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE220 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE221 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE222 (BATTLEMAGE)
[01:39:43] [PASSED] 0xE223 (BATTLEMAGE)
[01:39:43] [PASSED] 0xB080 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB081 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB082 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB083 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB084 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB085 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB086 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB087 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB08F (PANTHERLAKE)
[01:39:43] [PASSED] 0xB090 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB0A0 (PANTHERLAKE)
[01:39:43] [PASSED] 0xB0B0 (PANTHERLAKE)
[01:39:43] [PASSED] 0xFD80 (PANTHERLAKE)
[01:39:43] [PASSED] 0xFD81 (PANTHERLAKE)
[01:39:43] [PASSED] 0xD740 (NOVALAKE_S)
[01:39:43] [PASSED] 0xD741 (NOVALAKE_S)
[01:39:43] [PASSED] 0xD742 (NOVALAKE_S)
[01:39:43] [PASSED] 0xD743 (NOVALAKE_S)
[01:39:43] [PASSED] 0xD744 (NOVALAKE_S)
[01:39:43] [PASSED] 0xD745 (NOVALAKE_S)
[01:39:43] [PASSED] 0x674C (CRESCENTISLAND)
[01:39:43] [PASSED] 0xD750 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD751 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD752 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD753 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD754 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD755 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD756 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD757 (NOVALAKE_P)
[01:39:43] [PASSED] 0xD75F (NOVALAKE_P)
[01:39:43] =============== [PASSED] check_platform_desc ===============
[01:39:43] ===================== [PASSED] xe_pci ======================
[01:39:43] =================== xe_rtp (2 subtests) ====================
[01:39:43] =============== xe_rtp_process_to_sr_tests  ================
[01:39:43] [PASSED] coalesce-same-reg
[01:39:43] [PASSED] no-match-no-add
[01:39:43] [PASSED] match-or
[01:39:43] [PASSED] match-or-xfail
[01:39:43] [PASSED] no-match-no-add-multiple-rules
[01:39:43] [PASSED] two-regs-two-entries
[01:39:43] [PASSED] clr-one-set-other
[01:39:43] [PASSED] set-field
[01:39:43] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[01:39:43] [PASSED] conflict-not-disjoint
[01:39:43] [PASSED] conflict-reg-type
[01:39:43] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[01:39:43] ================== xe_rtp_process_tests  ===================
[01:39:43] [PASSED] active1
[01:39:43] [PASSED] active2
[01:39:43] [PASSED] active-inactive
[01:39:43] [PASSED] inactive-active
[01:39:43] [PASSED] inactive-1st_or_active-inactive
[01:39:43] [PASSED] inactive-2nd_or_active-inactive
[01:39:43] [PASSED] inactive-last_or_active-inactive
[01:39:43] [PASSED] inactive-no_or_active-inactive
[01:39:43] ============== [PASSED] xe_rtp_process_tests ===============
[01:39:43] ===================== [PASSED] xe_rtp ======================
[01:39:43] ==================== xe_wa (1 subtest) =====================
[01:39:43] ======================== xe_wa_gt  =========================
[01:39:43] [PASSED] TIGERLAKE B0
[01:39:43] [PASSED] DG1 A0
[01:39:43] [PASSED] DG1 B0
[01:39:43] [PASSED] ALDERLAKE_S A0
[01:39:43] [PASSED] ALDERLAKE_S B0
[01:39:43] [PASSED] ALDERLAKE_S C0
[01:39:43] [PASSED] ALDERLAKE_S D0
[01:39:43] [PASSED] ALDERLAKE_P A0
[01:39:43] [PASSED] ALDERLAKE_P B0
[01:39:43] [PASSED] ALDERLAKE_P C0
[01:39:43] [PASSED] ALDERLAKE_S RPLS D0
[01:39:43] [PASSED] ALDERLAKE_P RPLU E0
[01:39:43] [PASSED] DG2 G10 C0
[01:39:43] [PASSED] DG2 G11 B1
[01:39:43] [PASSED] DG2 G12 A1
[01:39:43] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:39:43] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:39:43] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[01:39:43] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[01:39:43] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[01:39:43] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[01:39:43] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[01:39:43] ==================== [PASSED] xe_wa_gt =====================
[01:39:43] ====================== [PASSED] xe_wa ======================
[01:39:43] ============================================================
[01:39:43] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[01:39:43] Elapsed time: 36.348s total, 4.295s configuring, 31.383s building, 0.612s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:39:43] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:39:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:40:09] Starting KUnit Kernel (1/1)...
[01:40:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:40:09] ============ drm_test_pick_cmdline (2 subtests) ============
[01:40:09] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:40:09] =============== drm_test_pick_cmdline_named  ===============
[01:40:09] [PASSED] NTSC
[01:40:09] [PASSED] NTSC-J
[01:40:09] [PASSED] PAL
[01:40:09] [PASSED] PAL-M
[01:40:09] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:40:09] ============== [PASSED] drm_test_pick_cmdline ==============
[01:40:09] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[01:40:09] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[01:40:09] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[01:40:09] =========== drm_validate_clone_mode (2 subtests) ===========
[01:40:09] ============== drm_test_check_in_clone_mode  ===============
[01:40:09] [PASSED] in_clone_mode
[01:40:09] [PASSED] not_in_clone_mode
[01:40:09] ========== [PASSED] drm_test_check_in_clone_mode ===========
[01:40:09] =============== drm_test_check_valid_clones  ===============
[01:40:09] [PASSED] not_in_clone_mode
[01:40:09] [PASSED] valid_clone
[01:40:09] [PASSED] invalid_clone
[01:40:09] =========== [PASSED] drm_test_check_valid_clones ===========
[01:40:09] ============= [PASSED] drm_validate_clone_mode =============
[01:40:09] ============= drm_validate_modeset (1 subtest) =============
[01:40:09] [PASSED] drm_test_check_connector_changed_modeset
[01:40:09] ============== [PASSED] drm_validate_modeset ===============
[01:40:09] ====== drm_test_bridge_get_current_state (2 subtests) ======
[01:40:09] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[01:40:09] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[01:40:09] ======== [PASSED] drm_test_bridge_get_current_state ========
[01:40:09] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[01:40:09] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[01:40:09] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[01:40:09] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[01:40:09] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[01:40:09] ============== drm_bridge_alloc (2 subtests) ===============
[01:40:09] [PASSED] drm_test_drm_bridge_alloc_basic
[01:40:09] [PASSED] drm_test_drm_bridge_alloc_get_put
[01:40:09] ================ [PASSED] drm_bridge_alloc =================
[01:40:09] ============= drm_cmdline_parser (40 subtests) =============
[01:40:09] [PASSED] drm_test_cmdline_force_d_only
[01:40:09] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:40:09] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:40:09] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:40:09] [PASSED] drm_test_cmdline_force_e_only
[01:40:09] [PASSED] drm_test_cmdline_res
[01:40:09] [PASSED] drm_test_cmdline_res_vesa
[01:40:09] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:40:09] [PASSED] drm_test_cmdline_res_rblank
[01:40:09] [PASSED] drm_test_cmdline_res_bpp
[01:40:09] [PASSED] drm_test_cmdline_res_refresh
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:40:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:40:09] [PASSED] drm_test_cmdline_res_margins_force_on
[01:40:09] [PASSED] drm_test_cmdline_res_vesa_margins
[01:40:09] [PASSED] drm_test_cmdline_name
[01:40:09] [PASSED] drm_test_cmdline_name_bpp
[01:40:09] [PASSED] drm_test_cmdline_name_option
[01:40:09] [PASSED] drm_test_cmdline_name_bpp_option
[01:40:09] [PASSED] drm_test_cmdline_rotate_0
[01:40:09] [PASSED] drm_test_cmdline_rotate_90
[01:40:09] [PASSED] drm_test_cmdline_rotate_180
[01:40:09] [PASSED] drm_test_cmdline_rotate_270
[01:40:09] [PASSED] drm_test_cmdline_hmirror
[01:40:09] [PASSED] drm_test_cmdline_vmirror
[01:40:09] [PASSED] drm_test_cmdline_margin_options
[01:40:09] [PASSED] drm_test_cmdline_multiple_options
[01:40:09] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:40:09] [PASSED] drm_test_cmdline_extra_and_option
[01:40:09] [PASSED] drm_test_cmdline_freestanding_options
[01:40:09] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:40:09] [PASSED] drm_test_cmdline_panel_orientation
[01:40:09] ================ drm_test_cmdline_invalid  =================
[01:40:09] [PASSED] margin_only
[01:40:09] [PASSED] interlace_only
[01:40:09] [PASSED] res_missing_x
[01:40:09] [PASSED] res_missing_y
[01:40:09] [PASSED] res_bad_y
[01:40:09] [PASSED] res_missing_y_bpp
[01:40:09] [PASSED] res_bad_bpp
[01:40:09] [PASSED] res_bad_refresh
[01:40:09] [PASSED] res_bpp_refresh_force_on_off
[01:40:09] [PASSED] res_invalid_mode
[01:40:09] [PASSED] res_bpp_wrong_place_mode
[01:40:09] [PASSED] name_bpp_refresh
[01:40:09] [PASSED] name_refresh
[01:40:09] [PASSED] name_refresh_wrong_mode
[01:40:09] [PASSED] name_refresh_invalid_mode
[01:40:09] [PASSED] rotate_multiple
[01:40:09] [PASSED] rotate_invalid_val
[01:40:09] [PASSED] rotate_truncated
[01:40:09] [PASSED] invalid_option
[01:40:09] [PASSED] invalid_tv_option
[01:40:09] [PASSED] truncated_tv_option
[01:40:09] ============ [PASSED] drm_test_cmdline_invalid =============
[01:40:09] =============== drm_test_cmdline_tv_options  ===============
[01:40:09] [PASSED] NTSC
[01:40:09] [PASSED] NTSC_443
[01:40:09] [PASSED] NTSC_J
[01:40:09] [PASSED] PAL
[01:40:09] [PASSED] PAL_M
[01:40:09] [PASSED] PAL_N
[01:40:09] [PASSED] SECAM
[01:40:09] [PASSED] MONO_525
[01:40:09] [PASSED] MONO_625
[01:40:09] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:40:09] =============== [PASSED] drm_cmdline_parser ================
[01:40:09] ========== drmm_connector_hdmi_init (20 subtests) ==========
[01:40:09] [PASSED] drm_test_connector_hdmi_init_valid
[01:40:09] [PASSED] drm_test_connector_hdmi_init_bpc_8
[01:40:09] [PASSED] drm_test_connector_hdmi_init_bpc_10
[01:40:09] [PASSED] drm_test_connector_hdmi_init_bpc_12
[01:40:09] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[01:40:09] [PASSED] drm_test_connector_hdmi_init_bpc_null
[01:40:09] [PASSED] drm_test_connector_hdmi_init_formats_empty
[01:40:09] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[01:40:09] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[01:40:09] [PASSED] supported_formats=0x9 yuv420_allowed=1
[01:40:09] [PASSED] supported_formats=0x9 yuv420_allowed=0
[01:40:09] [PASSED] supported_formats=0x5 yuv420_allowed=1
[01:40:09] [PASSED] supported_formats=0x5 yuv420_allowed=0
[01:40:09] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[01:40:09] [PASSED] drm_test_connector_hdmi_init_null_ddc
[01:40:09] [PASSED] drm_test_connector_hdmi_init_null_product
[01:40:09] [PASSED] drm_test_connector_hdmi_init_null_vendor
[01:40:09] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[01:40:09] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[01:40:09] [PASSED] drm_test_connector_hdmi_init_product_valid
[01:40:09] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[01:40:09] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[01:40:09] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[01:40:09] ========= drm_test_connector_hdmi_init_type_valid  =========
[01:40:09] [PASSED] HDMI-A
[01:40:09] [PASSED] HDMI-B
[01:40:09] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[01:40:09] ======== drm_test_connector_hdmi_init_type_invalid  ========
[01:40:09] [PASSED] Unknown
[01:40:09] [PASSED] VGA
[01:40:09] [PASSED] DVI-I
[01:40:09] [PASSED] DVI-D
[01:40:09] [PASSED] DVI-A
[01:40:09] [PASSED] Composite
[01:40:09] [PASSED] SVIDEO
[01:40:09] [PASSED] LVDS
[01:40:09] [PASSED] Component
[01:40:09] [PASSED] DIN
[01:40:09] [PASSED] DP
[01:40:09] [PASSED] TV
[01:40:09] [PASSED] eDP
[01:40:09] [PASSED] Virtual
[01:40:09] [PASSED] DSI
[01:40:09] [PASSED] DPI
[01:40:09] [PASSED] Writeback
[01:40:09] [PASSED] SPI
[01:40:09] [PASSED] USB
[01:40:09] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[01:40:09] ============ [PASSED] drmm_connector_hdmi_init =============
[01:40:09] ============= drmm_connector_init (3 subtests) =============
[01:40:09] [PASSED] drm_test_drmm_connector_init
[01:40:09] [PASSED] drm_test_drmm_connector_init_null_ddc
[01:40:09] ========= drm_test_drmm_connector_init_type_valid  =========
[01:40:09] [PASSED] Unknown
[01:40:09] [PASSED] VGA
[01:40:09] [PASSED] DVI-I
[01:40:09] [PASSED] DVI-D
[01:40:09] [PASSED] DVI-A
[01:40:09] [PASSED] Composite
[01:40:09] [PASSED] SVIDEO
[01:40:09] [PASSED] LVDS
[01:40:09] [PASSED] Component
[01:40:09] [PASSED] DIN
[01:40:09] [PASSED] DP
[01:40:09] [PASSED] HDMI-A
[01:40:09] [PASSED] HDMI-B
[01:40:09] [PASSED] TV
[01:40:09] [PASSED] eDP
[01:40:09] [PASSED] Virtual
[01:40:09] [PASSED] DSI
[01:40:09] [PASSED] DPI
[01:40:09] [PASSED] Writeback
[01:40:09] [PASSED] SPI
[01:40:09] [PASSED] USB
[01:40:09] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[01:40:09] =============== [PASSED] drmm_connector_init ===============
[01:40:09] ========= drm_connector_dynamic_init (6 subtests) ==========
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_init
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_init_properties
[01:40:09] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[01:40:09] [PASSED] Unknown
[01:40:09] [PASSED] VGA
[01:40:09] [PASSED] DVI-I
[01:40:09] [PASSED] DVI-D
[01:40:09] [PASSED] DVI-A
[01:40:09] [PASSED] Composite
[01:40:09] [PASSED] SVIDEO
[01:40:09] [PASSED] LVDS
[01:40:09] [PASSED] Component
[01:40:09] [PASSED] DIN
[01:40:09] [PASSED] DP
[01:40:09] [PASSED] HDMI-A
[01:40:09] [PASSED] HDMI-B
[01:40:09] [PASSED] TV
[01:40:09] [PASSED] eDP
[01:40:09] [PASSED] Virtual
[01:40:09] [PASSED] DSI
[01:40:09] [PASSED] DPI
[01:40:09] [PASSED] Writeback
[01:40:09] [PASSED] SPI
[01:40:09] [PASSED] USB
[01:40:09] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[01:40:09] ======== drm_test_drm_connector_dynamic_init_name  =========
[01:40:09] [PASSED] Unknown
[01:40:09] [PASSED] VGA
[01:40:09] [PASSED] DVI-I
[01:40:09] [PASSED] DVI-D
[01:40:09] [PASSED] DVI-A
[01:40:09] [PASSED] Composite
[01:40:09] [PASSED] SVIDEO
[01:40:09] [PASSED] LVDS
[01:40:09] [PASSED] Component
[01:40:09] [PASSED] DIN
[01:40:09] [PASSED] DP
[01:40:09] [PASSED] HDMI-A
[01:40:09] [PASSED] HDMI-B
[01:40:09] [PASSED] TV
[01:40:09] [PASSED] eDP
[01:40:09] [PASSED] Virtual
[01:40:09] [PASSED] DSI
[01:40:09] [PASSED] DPI
[01:40:09] [PASSED] Writeback
[01:40:09] [PASSED] SPI
[01:40:09] [PASSED] USB
[01:40:09] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[01:40:09] =========== [PASSED] drm_connector_dynamic_init ============
[01:40:09] ==== drm_connector_dynamic_register_early (4 subtests) =====
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[01:40:09] ====== [PASSED] drm_connector_dynamic_register_early =======
[01:40:09] ======= drm_connector_dynamic_register (7 subtests) ========
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[01:40:09] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[01:40:09] ========= [PASSED] drm_connector_dynamic_register ==========
[01:40:09] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[01:40:09] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[01:40:09] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[01:40:09] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[01:40:09] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[01:40:09] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:40:09] [PASSED] NTSC
[01:40:09] [PASSED] NTSC-443
[01:40:09] [PASSED] NTSC-J
[01:40:09] [PASSED] PAL
[01:40:09] [PASSED] PAL-M
[01:40:09] [PASSED] PAL-N
[01:40:09] [PASSED] SECAM
[01:40:09] [PASSED] Mono
[01:40:09] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:40:09] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:40:09] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:40:09] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[01:40:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[01:40:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[01:40:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[01:40:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[01:40:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[01:40:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[01:40:09] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[01:40:09] [PASSED] VIC 96
[01:40:09] [PASSED] VIC 97
[01:40:09] [PASSED] VIC 101
[01:40:09] [PASSED] VIC 102
[01:40:09] [PASSED] VIC 106
[01:40:09] [PASSED] VIC 107
[01:40:09] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[01:40:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[01:40:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[01:40:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[01:40:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[01:40:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[01:40:09] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[01:40:09] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[01:40:09] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[01:40:09] [PASSED] Automatic
[01:40:09] [PASSED] Full
[01:40:09] [PASSED] Limited 16:235
[01:40:09] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[01:40:09] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[01:40:09] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[01:40:09] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[01:40:09] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[01:40:09] [PASSED] RGB
[01:40:09] [PASSED] YUV 4:2:0
[01:40:09] [PASSED] YUV 4:2:2
[01:40:09] [PASSED] YUV 4:4:4
[01:40:09] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[01:40:09] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[01:40:09] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[01:40:09] ============= drm_damage_helper (21 subtests) ==============
[01:40:09] [PASSED] drm_test_damage_iter_no_damage
[01:40:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:40:09] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:40:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:40:09] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:40:09] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:40:09] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:40:09] [PASSED] drm_test_damage_iter_simple_damage
[01:40:09] [PASSED] drm_test_damage_iter_single_damage
[01:40:09] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:40:09] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:40:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:40:09] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:40:09] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:40:09] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:40:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:40:09] [PASSED] drm_test_damage_iter_damage
[01:40:09] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:40:09] [PASSED] drm_test_damage_iter_damage_one_outside
[01:40:09] [PASSED] drm_test_damage_iter_damage_src_moved
[01:40:09] [PASSED] drm_test_damage_iter_damage_not_visible
[01:40:09] ================ [PASSED] drm_damage_helper ================
[01:40:09] ============== drm_dp_mst_helper (3 subtests) ==============
[01:40:09] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:40:09] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:40:09] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:40:09] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:40:09] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:40:09] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:40:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:40:09] ============== drm_test_dp_mst_calc_pbn_div  ===============
[01:40:09] [PASSED] Link rate 2000000 lane count 4
[01:40:09] [PASSED] Link rate 2000000 lane count 2
[01:40:09] [PASSED] Link rate 2000000 lane count 1
[01:40:09] [PASSED] Link rate 1350000 lane count 4
[01:40:09] [PASSED] Link rate 1350000 lane count 2
[01:40:09] [PASSED] Link rate 1350000 lane count 1
[01:40:09] [PASSED] Link rate 1000000 lane count 4
[01:40:09] [PASSED] Link rate 1000000 lane count 2
[01:40:09] [PASSED] Link rate 1000000 lane count 1
[01:40:09] [PASSED] Link rate 810000 lane count 4
[01:40:09] [PASSED] Link rate 810000 lane count 2
[01:40:09] [PASSED] Link rate 810000 lane count 1
[01:40:09] [PASSED] Link rate 540000 lane count 4
[01:40:09] [PASSED] Link rate 540000 lane count 2
[01:40:09] [PASSED] Link rate 540000 lane count 1
[01:40:09] [PASSED] Link rate 270000 lane count 4
[01:40:09] [PASSED] Link rate 270000 lane count 2
[01:40:09] [PASSED] Link rate 270000 lane count 1
[01:40:09] [PASSED] Link rate 162000 lane count 4
[01:40:09] [PASSED] Link rate 162000 lane count 2
[01:40:09] [PASSED] Link rate 162000 lane count 1
[01:40:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[01:40:09] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:40:09] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:40:09] [PASSED] DP_POWER_UP_PHY with port number
[01:40:09] [PASSED] DP_POWER_DOWN_PHY with port number
[01:40:09] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:40:09] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:40:09] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:40:09] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:40:09] [PASSED] DP_QUERY_PAYLOAD with port number
[01:40:09] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:40:09] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:40:09] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:40:09] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:40:09] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:40:09] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:40:09] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:40:09] [PASSED] DP_REMOTE_I2C_READ with port number
[01:40:09] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:40:09] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:40:09] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:40:09] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:40:09] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:40:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:40:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:40:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:40:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:40:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:40:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:40:09] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:40:09] ================ [PASSED] drm_dp_mst_helper ================
[01:40:09] ================== drm_exec (7 subtests) ===================
[01:40:09] [PASSED] sanitycheck
[01:40:09] [PASSED] test_lock
[01:40:09] [PASSED] test_lock_unlock
[01:40:09] [PASSED] test_duplicates
[01:40:09] [PASSED] test_prepare
[01:40:09] [PASSED] test_prepare_array
[01:40:09] [PASSED] test_multiple_loops
[01:40:09] ==================== [PASSED] drm_exec =====================
[01:40:09] =========== drm_format_helper_test (17 subtests) ===========
[01:40:09] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:40:09] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:40:09] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:40:09] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:40:09] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:40:09] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:40:09] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:40:09] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[01:40:09] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:40:09] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:40:09] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:40:09] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:40:09] ==================== drm_test_fb_swab  =====================
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ================ [PASSED] drm_test_fb_swab =================
[01:40:09] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[01:40:09] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[01:40:09] [PASSED] single_pixel_source_buffer
[01:40:09] [PASSED] single_pixel_clip_rectangle
[01:40:09] [PASSED] well_known_colors
[01:40:09] [PASSED] destination_pitch
[01:40:09] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[01:40:09] ================= drm_test_fb_clip_offset  =================
[01:40:09] [PASSED] pass through
[01:40:09] [PASSED] horizontal offset
[01:40:09] [PASSED] vertical offset
[01:40:09] [PASSED] horizontal and vertical offset
[01:40:09] [PASSED] horizontal offset (custom pitch)
[01:40:09] [PASSED] vertical offset (custom pitch)
[01:40:09] [PASSED] horizontal and vertical offset (custom pitch)
[01:40:09] ============= [PASSED] drm_test_fb_clip_offset =============
[01:40:09] =================== drm_test_fb_memcpy  ====================
[01:40:09] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:40:09] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:40:09] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:40:09] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:40:09] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:40:09] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:40:09] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:40:09] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:40:09] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:40:09] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:40:09] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:40:09] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:40:09] =============== [PASSED] drm_test_fb_memcpy ================
[01:40:09] ============= [PASSED] drm_format_helper_test ==============
[01:40:09] ================= drm_format (18 subtests) =================
[01:40:09] [PASSED] drm_test_format_block_width_invalid
[01:40:09] [PASSED] drm_test_format_block_width_one_plane
[01:40:09] [PASSED] drm_test_format_block_width_two_plane
[01:40:09] [PASSED] drm_test_format_block_width_three_plane
[01:40:09] [PASSED] drm_test_format_block_width_tiled
[01:40:09] [PASSED] drm_test_format_block_height_invalid
[01:40:09] [PASSED] drm_test_format_block_height_one_plane
[01:40:09] [PASSED] drm_test_format_block_height_two_plane
[01:40:09] [PASSED] drm_test_format_block_height_three_plane
[01:40:09] [PASSED] drm_test_format_block_height_tiled
[01:40:09] [PASSED] drm_test_format_min_pitch_invalid
[01:40:09] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:40:09] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:40:09] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:40:09] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:40:09] [PASSED] drm_test_format_min_pitch_two_plane
[01:40:09] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:40:09] [PASSED] drm_test_format_min_pitch_tiled
[01:40:09] =================== [PASSED] drm_format ====================
[01:40:09] ============== drm_framebuffer (10 subtests) ===============
[01:40:09] ========== drm_test_framebuffer_check_src_coords  ==========
[01:40:09] [PASSED] Success: source fits into fb
[01:40:09] [PASSED] Fail: overflowing fb with x-axis coordinate
[01:40:09] [PASSED] Fail: overflowing fb with y-axis coordinate
[01:40:09] [PASSED] Fail: overflowing fb with source width
[01:40:09] [PASSED] Fail: overflowing fb with source height
[01:40:09] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[01:40:09] [PASSED] drm_test_framebuffer_cleanup
[01:40:09] =============== drm_test_framebuffer_create  ===============
[01:40:09] [PASSED] ABGR8888 normal sizes
[01:40:09] [PASSED] ABGR8888 max sizes
[01:40:09] [PASSED] ABGR8888 pitch greater than min required
[01:40:09] [PASSED] ABGR8888 pitch less than min required
[01:40:09] [PASSED] ABGR8888 Invalid width
[01:40:09] [PASSED] ABGR8888 Invalid buffer handle
[01:40:09] [PASSED] No pixel format
[01:40:09] [PASSED] ABGR8888 Width 0
[01:40:09] [PASSED] ABGR8888 Height 0
[01:40:09] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:40:09] [PASSED] ABGR8888 Large buffer offset
[01:40:09] [PASSED] ABGR8888 Buffer offset for inexistent plane
[01:40:09] [PASSED] ABGR8888 Invalid flag
[01:40:09] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:40:09] [PASSED] ABGR8888 Valid buffer modifier
[01:40:09] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:40:09] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:40:09] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:40:09] [PASSED] NV12 Normal sizes
[01:40:09] [PASSED] NV12 Max sizes
[01:40:09] [PASSED] NV12 Invalid pitch
[01:40:09] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:40:09] [PASSED] NV12 different  modifier per-plane
[01:40:09] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:40:09] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:40:09] [PASSED] NV12 Modifier for inexistent plane
[01:40:09] [PASSED] NV12 Handle for inexistent plane
[01:40:09] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:40:09] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:40:09] [PASSED] YVU420 Normal sizes
[01:40:09] [PASSED] YVU420 Max sizes
[01:40:09] [PASSED] YVU420 Invalid pitch
[01:40:09] [PASSED] YVU420 Different pitches
[01:40:09] [PASSED] YVU420 Different buffer offsets/pitches
[01:40:09] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:40:09] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:40:09] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:40:09] [PASSED] YVU420 Valid modifier
[01:40:09] [PASSED] YVU420 Different modifiers per plane
[01:40:09] [PASSED] YVU420 Modifier for inexistent plane
[01:40:09] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[01:40:09] [PASSED] X0L2 Normal sizes
[01:40:09] [PASSED] X0L2 Max sizes
[01:40:09] [PASSED] X0L2 Invalid pitch
[01:40:09] [PASSED] X0L2 Pitch greater than minimum required
[01:40:09] [PASSED] X0L2 Handle for inexistent plane
[01:40:09] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:40:09] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:40:09] [PASSED] X0L2 Valid modifier
[01:40:09] [PASSED] X0L2 Modifier for inexistent plane
[01:40:09] =========== [PASSED] drm_test_framebuffer_create ===========
[01:40:09] [PASSED] drm_test_framebuffer_free
[01:40:09] [PASSED] drm_test_framebuffer_init
[01:40:09] [PASSED] drm_test_framebuffer_init_bad_format
[01:40:09] [PASSED] drm_test_framebuffer_init_dev_mismatch
[01:40:09] [PASSED] drm_test_framebuffer_lookup
[01:40:09] [PASSED] drm_test_framebuffer_lookup_inexistent
[01:40:09] [PASSED] drm_test_framebuffer_modifiers_not_supported
[01:40:09] ================= [PASSED] drm_framebuffer =================
[01:40:09] ================ drm_gem_shmem (8 subtests) ================
[01:40:09] [PASSED] drm_gem_shmem_test_obj_create
[01:40:09] [PASSED] drm_gem_shmem_test_obj_create_private
[01:40:09] [PASSED] drm_gem_shmem_test_pin_pages
[01:40:09] [PASSED] drm_gem_shmem_test_vmap
[01:40:09] [PASSED] drm_gem_shmem_test_get_sg_table
[01:40:09] [PASSED] drm_gem_shmem_test_get_pages_sgt
[01:40:09] [PASSED] drm_gem_shmem_test_madvise
[01:40:09] [PASSED] drm_gem_shmem_test_purge
[01:40:09] ================== [PASSED] drm_gem_shmem ==================
[01:40:09] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[01:40:09] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[01:40:09] [PASSED] Automatic
[01:40:09] [PASSED] Full
[01:40:09] [PASSED] Limited 16:235
[01:40:09] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[01:40:09] [PASSED] drm_test_check_disable_connector
[01:40:09] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[01:40:09] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[01:40:09] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[01:40:09] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[01:40:09] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[01:40:09] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[01:40:09] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[01:40:09] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[01:40:09] [PASSED] drm_test_check_output_bpc_dvi
[01:40:09] [PASSED] drm_test_check_output_bpc_format_vic_1
[01:40:09] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[01:40:09] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[01:40:09] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[01:40:09] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[01:40:09] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[01:40:09] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[01:40:09] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[01:40:09] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[01:40:09] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[01:40:09] [PASSED] drm_test_check_broadcast_rgb_value
[01:40:09] [PASSED] drm_test_check_bpc_8_value
[01:40:09] [PASSED] drm_test_check_bpc_10_value
[01:40:09] [PASSED] drm_test_check_bpc_12_value
[01:40:09] [PASSED] drm_test_check_format_value
[01:40:09] [PASSED] drm_test_check_tmds_char_value
[01:40:09] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[01:40:09] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[01:40:09] [PASSED] drm_test_check_mode_valid
[01:40:09] [PASSED] drm_test_check_mode_valid_reject
[01:40:09] [PASSED] drm_test_check_mode_valid_reject_rate
[01:40:09] [PASSED] drm_test_check_mode_valid_reject_max_clock
[01:40:09] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[01:40:09] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[01:40:09] [PASSED] drm_test_check_infoframes
[01:40:09] [PASSED] drm_test_check_reject_avi_infoframe
[01:40:09] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[01:40:09] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[01:40:09] [PASSED] drm_test_check_reject_audio_infoframe
[01:40:09] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[01:40:09] ================= drm_managed (2 subtests) =================
[01:40:09] [PASSED] drm_test_managed_release_action
[01:40:09] [PASSED] drm_test_managed_run_action
[01:40:09] =================== [PASSED] drm_managed ===================
[01:40:09] =================== drm_mm (6 subtests) ====================
[01:40:09] [PASSED] drm_test_mm_init
[01:40:09] [PASSED] drm_test_mm_debug
[01:40:09] [PASSED] drm_test_mm_align32
[01:40:09] [PASSED] drm_test_mm_align64
[01:40:09] [PASSED] drm_test_mm_lowest
[01:40:09] [PASSED] drm_test_mm_highest
[01:40:09] ===================== [PASSED] drm_mm ======================
[01:40:09] ============= drm_modes_analog_tv (5 subtests) =============
[01:40:09] [PASSED] drm_test_modes_analog_tv_mono_576i
[01:40:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:40:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:40:09] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:40:09] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:40:09] =============== [PASSED] drm_modes_analog_tv ===============
[01:40:09] ============== drm_plane_helper (2 subtests) ===============
[01:40:09] =============== drm_test_check_plane_state  ================
[01:40:09] [PASSED] clipping_simple
[01:40:09] [PASSED] clipping_rotate_reflect
[01:40:09] [PASSED] positioning_simple
[01:40:09] [PASSED] upscaling
[01:40:09] [PASSED] downscaling
[01:40:09] [PASSED] rounding1
[01:40:09] [PASSED] rounding2
[01:40:09] [PASSED] rounding3
[01:40:09] [PASSED] rounding4
[01:40:09] =========== [PASSED] drm_test_check_plane_state ============
[01:40:09] =========== drm_test_check_invalid_plane_state  ============
[01:40:09] [PASSED] positioning_invalid
[01:40:09] [PASSED] upscaling_invalid
[01:40:09] [PASSED] downscaling_invalid
[01:40:09] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:40:09] ================ [PASSED] drm_plane_helper =================
[01:40:09] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[01:40:09] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:40:09] [PASSED] None
[01:40:09] [PASSED] PAL
[01:40:09] [PASSED] NTSC
[01:40:09] [PASSED] Both, NTSC Default
[01:40:09] [PASSED] Both, PAL Default
[01:40:09] [PASSED] Both, NTSC Default, with PAL on command-line
[01:40:09] [PASSED] Both, PAL Default, with NTSC on command-line
[01:40:09] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:40:09] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:40:09] ================== drm_rect (9 subtests) ===================
[01:40:09] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:40:09] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:40:09] [PASSED] drm_test_rect_clip_scaled_clipped
[01:40:09] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:40:09] ================= drm_test_rect_intersect  =================
[01:40:09] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[01:40:09] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:40:09] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:40:09] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:40:09] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:40:09] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:40:09] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:40:09] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:40:09] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:40:09] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:40:09] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:40:09] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:40:09] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:40:09] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:40:09] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:40:09] ============= [PASSED] drm_test_rect_intersect =============
[01:40:09] ================ drm_test_rect_calc_hscale  ================
[01:40:09] [PASSED] normal use
[01:40:09] [PASSED] out of max range
[01:40:09] [PASSED] out of min range
[01:40:09] [PASSED] zero dst
[01:40:09] [PASSED] negative src
[01:40:09] [PASSED] negative dst
[01:40:09] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:40:09] ================ drm_test_rect_calc_vscale  ================
[01:40:09] [PASSED] normal use
[01:40:09] [PASSED] out of max range
[01:40:09] [PASSED] out of min range
[01:40:09] [PASSED] zero dst
[01:40:09] [PASSED] negative src
[01:40:09] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[01:40:09] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:40:09] ================== drm_test_rect_rotate  ===================
[01:40:09] [PASSED] reflect-x
[01:40:09] [PASSED] reflect-y
[01:40:09] [PASSED] rotate-0
[01:40:09] [PASSED] rotate-90
[01:40:09] [PASSED] rotate-180
[01:40:09] [PASSED] rotate-270
[01:40:09] ============== [PASSED] drm_test_rect_rotate ===============
[01:40:09] ================ drm_test_rect_rotate_inv  =================
[01:40:09] [PASSED] reflect-x
[01:40:09] [PASSED] reflect-y
[01:40:09] [PASSED] rotate-0
[01:40:09] [PASSED] rotate-90
[01:40:09] [PASSED] rotate-180
[01:40:09] [PASSED] rotate-270
[01:40:09] ============ [PASSED] drm_test_rect_rotate_inv =============
[01:40:09] ==================== [PASSED] drm_rect =====================
[01:40:09] ============ drm_sysfb_modeset_test (1 subtest) ============
[01:40:09] ============ drm_test_sysfb_build_fourcc_list  =============
[01:40:09] [PASSED] no native formats
[01:40:09] [PASSED] XRGB8888 as native format
[01:40:09] [PASSED] remove duplicates
[01:40:09] [PASSED] convert alpha formats
[01:40:09] [PASSED] random formats
[01:40:09] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[01:40:09] ============= [PASSED] drm_sysfb_modeset_test ==============
[01:40:09] ================== drm_fixp (2 subtests) ===================
[01:40:09] [PASSED] drm_test_int2fixp
[01:40:09] [PASSED] drm_test_sm2fixp
[01:40:09] ==================== [PASSED] drm_fixp =====================
[01:40:09] ============================================================
[01:40:09] Testing complete. Ran 621 tests: passed: 621
[01:40:09] Elapsed time: 26.320s total, 1.686s configuring, 24.415s building, 0.185s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[01:40:09] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:40:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:40:21] Starting KUnit Kernel (1/1)...
[01:40:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:40:21] ================= ttm_device (5 subtests) ==================
[01:40:21] [PASSED] ttm_device_init_basic
[01:40:21] [PASSED] ttm_device_init_multiple
[01:40:21] [PASSED] ttm_device_fini_basic
[01:40:21] [PASSED] ttm_device_init_no_vma_man
[01:40:21] ================== ttm_device_init_pools  ==================
[01:40:21] [PASSED] No DMA allocations, no DMA32 required
[01:40:21] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[01:40:21] Expected !list_lru_count(&pt.pages) to be false, but is true
[01:40:21] [FAILED] DMA allocations, DMA32 required
[01:40:21] [PASSED] No DMA allocations, DMA32 required
[01:40:21]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[01:40:21]     Expected !list_lru_count(&pt.pages) to be false, but is true
[01:40:21] ------------[ cut here ]------------
[01:40:21] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[01:40:21] refcount_t: underflow; use-after-free.
[01:40:21] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-gb8daa4b3f415 #3 VOLUNTARY
[01:40:21] Tainted: [W]=WARN, [N]=TEST
[01:40:21] Stack:
[01:40:21]  6044ed8b 00000000 00000000 00000001
[01:40:21]  ffffff00 6044ed8b 6032367a 00000009
[01:40:21]  0000001c 60043e88 6002381c da8cbd40
[01:40:21] Call Trace:
[01:40:21]  [<6032367a>] ? devres_release_all+0xaa/0x100
[01:40:21]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[01:40:21]  [<6002381c>] ? _printk+0x0/0x65
[01:40:21]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[01:40:21]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[01:40:21]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[01:40:21]  [<60052e36>] ? um_set_signals+0x36/0x60
[01:40:21]  [<600c5a42>] ? call_rcu+0x52/0x90
[01:40:21]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[01:40:21]  [<60147f50>] ? kfree+0x0/0x250
[01:40:21]  [<6032367a>] ? devres_release_all+0xaa/0x100
[01:40:21]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[01:40:21]  [<6031c3c0>] ? bus_notify+0x0/0x60
[01:40:21]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[01:40:21]  [<60398620>] ? mutex_lock+0x0/0x40
[01:40:21]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[01:40:21]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[01:40:21]  [<60372210>] ? kobject_put+0x0/0x150
[01:40:21]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[01:40:21]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[01:40:21]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[01:40:21]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[01:40:21]  [<60315a8c>] ? device_del+0x1bc/0x600
[01:40:21]  [<60052e00>] ? um_set_signals+0x0/0x60
[01:40:21]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[01:40:21]  [<60052e00>] ? um_set_signals+0x0/0x60
[01:40:21]  [<60315ee4>] ? device_unregister+0x14/0x40
[01:40:21]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[01:40:21]  [<60257d70>] ? kunit_release_action+0x0/0x170
[01:40:21]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[01:40:21]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[01:40:21]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[01:40:21]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[01:40:21]  [<60081e36>] ? kthread+0xe6/0x150
[01:40:21]  [<60046435>] ? new_thread_handler+0x45/0x60
[01:40:21] ---[ end trace 0000000000000000 ]---
[01:40:21] [FAILED] DMA allocations, no DMA32 required
[01:40:21] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[01:40:21] ============== [FAILED] ttm_device_init_pools ==============
[01:40:21]     # module: ttm_device_test
[01:40:21] # ttm_device: pass:4 fail:1 skip:0 total:5
[01:40:21] # Totals: pass:6 fail:2 skip:0 total:8
[01:40:21] =================== [FAILED] ttm_device ====================
[01:40:21] ================== ttm_pool (8 subtests) ===================
[01:40:21] ================== ttm_pool_alloc_basic  ===================
[01:40:21] [PASSED] One page
[01:40:21] [PASSED] More than one page
[01:40:21] [PASSED] Above the allocation limit
[01:40:21] [PASSED] One page, with coherent DMA mappings enabled
[01:40:21] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:40:21] ============== [PASSED] ttm_pool_alloc_basic ===============
[01:40:21] ============== ttm_pool_alloc_basic_dma_addr  ==============
[01:40:21] [PASSED] One page
[01:40:21] [PASSED] More than one page
[01:40:21] [PASSED] Above the allocation limit
[01:40:21] [PASSED] One page, with coherent DMA mappings enabled
[01:40:21] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:40:21] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[01:40:21] [PASSED] ttm_pool_alloc_order_caching_match
[01:40:21] [PASSED] ttm_pool_alloc_caching_mismatch
[01:40:21] [PASSED] ttm_pool_alloc_order_mismatch
[01:40:21] [PASSED] ttm_pool_free_dma_alloc
[01:40:21] [ERROR] Test: ttm_pool: missing expected subtest!
[01:40:21] 
[01:40:21] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-gb8daa4b3f415
[01:40:21] RIP: 0033:list_lru_count_node+0xe/0x20
[01:40:21] RSP: 00000000da8cbed8  EFLAGS: 00010246
[01:40:21] RAX: 0000000000000000 RBX: 00000000da803c90 RCX: 000000009b24c7d8
[01:40:21] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000009b086880
[01:40:21] RBP: 000000009b086800 R08: 00000000d9a10c28 R09: 000000009b050c80
[01:40:21] R10: 0000000000000000 R11: 0000000000000000 R12: 000000009b050c80
[01:40:21] R13: 0000000060440770 R14: 000000006010eb50 R15: 000000009b086880
[01:40:21] Kernel panic - not syncing: Segfault with no mm
[01:40:21] [CRASHED] 
[01:40:21] [ERROR] Test: ttm_pool: missing expected subtest!
[01:40:21] [CRASHED] 
[01:40:21] [ERROR] Test: ttm_pool: missing subtest result line!
[01:40:21] # module: ttm_pool_test
[01:40:21] ==================== [CRASHED] ttm_pool ====================
[01:40:21] [ERROR] Test: main: missing expected subtest!
[01:40:21] [CRASHED] 
[01:40:21] [ERROR] Test: main: missing expected subtest!
[01:40:21] [CRASHED] 
[01:40:21] [ERROR] Test: main: missing expected subtest!
[01:40:21] [CRASHED] 
[01:40:21] [ERROR] Test: main: missing expected subtest!
[01:40:21] [CRASHED] 
[01:40:21] ============================================================
[01:40:21] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[01:40:21] Elapsed time: 11.557s total, 1.726s configuring, 9.563s building, 0.267s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


