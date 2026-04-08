Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D17FD5F79
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915E588FF9;
	Wed,  8 Apr 2026 11:15:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB7788FF9;
 Wed,  8 Apr 2026 11:15:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/xe=5Fsysctrl=3A_Drop_re?=
 =?utf-8?q?dundant_endian_conversions_in_mailbox_header_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 11:15:48 -0000
Message-ID: <177564694841.441898.2790153190469145910@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408110759.1407342-2-anoop.c.vijay@intel.com>
In-Reply-To: <20260408110759.1407342-2-anoop.c.vijay@intel.com>
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

Series: drm/xe/xe_sysctrl: Drop redundant endian conversions in mailbox header macros
URL   : https://patchwork.freedesktop.org/series/164526/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[11:14:30] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:14:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[11:15:06] Starting KUnit Kernel (1/1)...
[11:15:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:15:06] ================== guc_buf (11 subtests) ===================
[11:15:06] [PASSED] test_smallest
[11:15:06] [PASSED] test_largest
[11:15:06] [PASSED] test_granular
[11:15:06] [PASSED] test_unique
[11:15:06] [PASSED] test_overlap
[11:15:06] [PASSED] test_reusable
[11:15:06] [PASSED] test_too_big
[11:15:06] [PASSED] test_flush
[11:15:06] [PASSED] test_lookup
[11:15:06] [PASSED] test_data
[11:15:06] [PASSED] test_class
[11:15:06] ===================== [PASSED] guc_buf =====================
[11:15:06] =================== guc_dbm (7 subtests) ===================
[11:15:06] [PASSED] test_empty
[11:15:06] [PASSED] test_default
[11:15:06] ======================== test_size  ========================
[11:15:06] [PASSED] 4
[11:15:06] [PASSED] 8
[11:15:06] [PASSED] 32
[11:15:06] [PASSED] 256
[11:15:06] ==================== [PASSED] test_size ====================
[11:15:06] ======================= test_reuse  ========================
[11:15:06] [PASSED] 4
[11:15:06] [PASSED] 8
[11:15:06] [PASSED] 32
[11:15:06] [PASSED] 256
[11:15:06] =================== [PASSED] test_reuse ====================
[11:15:06] =================== test_range_overlap  ====================
[11:15:06] [PASSED] 4
[11:15:06] [PASSED] 8
[11:15:06] [PASSED] 32
[11:15:06] [PASSED] 256
[11:15:06] =============== [PASSED] test_range_overlap ================
[11:15:06] =================== test_range_compact  ====================
[11:15:06] [PASSED] 4
[11:15:06] [PASSED] 8
[11:15:06] [PASSED] 32
[11:15:06] [PASSED] 256
[11:15:06] =============== [PASSED] test_range_compact ================
[11:15:06] ==================== test_range_spare  =====================
[11:15:06] [PASSED] 4
[11:15:06] [PASSED] 8
[11:15:06] [PASSED] 32
[11:15:06] [PASSED] 256
[11:15:06] ================ [PASSED] test_range_spare =================
[11:15:06] ===================== [PASSED] guc_dbm =====================
[11:15:06] =================== guc_idm (6 subtests) ===================
[11:15:06] [PASSED] bad_init
[11:15:06] [PASSED] no_init
[11:15:06] [PASSED] init_fini
[11:15:06] [PASSED] check_used
[11:15:06] [PASSED] check_quota
[11:15:06] [PASSED] check_all
[11:15:06] ===================== [PASSED] guc_idm =====================
[11:15:06] ================== no_relay (3 subtests) ===================
[11:15:06] [PASSED] xe_drops_guc2pf_if_not_ready
[11:15:06] [PASSED] xe_drops_guc2vf_if_not_ready
[11:15:06] [PASSED] xe_rejects_send_if_not_ready
[11:15:06] ==================== [PASSED] no_relay =====================
[11:15:06] ================== pf_relay (14 subtests) ==================
[11:15:06] [PASSED] pf_rejects_guc2pf_too_short
[11:15:06] [PASSED] pf_rejects_guc2pf_too_long
[11:15:06] [PASSED] pf_rejects_guc2pf_no_payload
[11:15:06] [PASSED] pf_fails_no_payload
[11:15:06] [PASSED] pf_fails_bad_origin
[11:15:06] [PASSED] pf_fails_bad_type
[11:15:06] [PASSED] pf_txn_reports_error
[11:15:06] [PASSED] pf_txn_sends_pf2guc
[11:15:06] [PASSED] pf_sends_pf2guc
[11:15:06] [SKIPPED] pf_loopback_nop
[11:15:06] [SKIPPED] pf_loopback_echo
[11:15:06] [SKIPPED] pf_loopback_fail
[11:15:06] [SKIPPED] pf_loopback_busy
[11:15:06] [SKIPPED] pf_loopback_retry
[11:15:06] ==================== [PASSED] pf_relay =====================
[11:15:06] ================== vf_relay (3 subtests) ===================
[11:15:06] [PASSED] vf_rejects_guc2vf_too_short
[11:15:06] [PASSED] vf_rejects_guc2vf_too_long
[11:15:06] [PASSED] vf_rejects_guc2vf_no_payload
[11:15:06] ==================== [PASSED] vf_relay =====================
[11:15:06] ================ pf_gt_config (9 subtests) =================
[11:15:06] [PASSED] fair_contexts_1vf
[11:15:06] [PASSED] fair_doorbells_1vf
[11:15:06] [PASSED] fair_ggtt_1vf
[11:15:06] ====================== fair_vram_1vf  ======================
[11:15:06] [PASSED] 3.50 GiB
[11:15:06] [PASSED] 11.5 GiB
[11:15:06] [PASSED] 15.5 GiB
[11:15:06] [PASSED] 31.5 GiB
[11:15:06] [PASSED] 63.5 GiB
[11:15:06] [PASSED] 1.91 GiB
[11:15:06] ================== [PASSED] fair_vram_1vf ==================
[11:15:06] ================ fair_vram_1vf_admin_only  =================
[11:15:06] [PASSED] 3.50 GiB
[11:15:06] [PASSED] 11.5 GiB
[11:15:06] [PASSED] 15.5 GiB
[11:15:06] [PASSED] 31.5 GiB
[11:15:06] [PASSED] 63.5 GiB
[11:15:06] [PASSED] 1.91 GiB
[11:15:06] ============ [PASSED] fair_vram_1vf_admin_only =============
[11:15:06] ====================== fair_contexts  ======================
[11:15:06] [PASSED] 1 VF
[11:15:06] [PASSED] 2 VFs
[11:15:06] [PASSED] 3 VFs
[11:15:06] [PASSED] 4 VFs
[11:15:06] [PASSED] 5 VFs
[11:15:06] [PASSED] 6 VFs
[11:15:06] [PASSED] 7 VFs
[11:15:06] [PASSED] 8 VFs
[11:15:06] [PASSED] 9 VFs
[11:15:06] [PASSED] 10 VFs
[11:15:06] [PASSED] 11 VFs
[11:15:06] [PASSED] 12 VFs
[11:15:06] [PASSED] 13 VFs
[11:15:06] [PASSED] 14 VFs
[11:15:06] [PASSED] 15 VFs
[11:15:06] [PASSED] 16 VFs
[11:15:06] [PASSED] 17 VFs
[11:15:06] [PASSED] 18 VFs
[11:15:06] [PASSED] 19 VFs
[11:15:06] [PASSED] 20 VFs
[11:15:06] [PASSED] 21 VFs
[11:15:06] [PASSED] 22 VFs
[11:15:06] [PASSED] 23 VFs
[11:15:06] [PASSED] 24 VFs
[11:15:06] [PASSED] 25 VFs
[11:15:06] [PASSED] 26 VFs
[11:15:06] [PASSED] 27 VFs
[11:15:06] [PASSED] 28 VFs
[11:15:06] [PASSED] 29 VFs
[11:15:06] [PASSED] 30 VFs
[11:15:06] [PASSED] 31 VFs
[11:15:06] [PASSED] 32 VFs
[11:15:06] [PASSED] 33 VFs
[11:15:06] [PASSED] 34 VFs
[11:15:06] [PASSED] 35 VFs
[11:15:06] [PASSED] 36 VFs
[11:15:06] [PASSED] 37 VFs
[11:15:06] [PASSED] 38 VFs
[11:15:06] [PASSED] 39 VFs
[11:15:06] [PASSED] 40 VFs
[11:15:06] [PASSED] 41 VFs
[11:15:06] [PASSED] 42 VFs
[11:15:06] [PASSED] 43 VFs
[11:15:06] [PASSED] 44 VFs
[11:15:06] [PASSED] 45 VFs
[11:15:06] [PASSED] 46 VFs
[11:15:06] [PASSED] 47 VFs
[11:15:06] [PASSED] 48 VFs
[11:15:06] [PASSED] 49 VFs
[11:15:06] [PASSED] 50 VFs
[11:15:06] [PASSED] 51 VFs
[11:15:06] [PASSED] 52 VFs
[11:15:06] [PASSED] 53 VFs
[11:15:06] [PASSED] 54 VFs
[11:15:06] [PASSED] 55 VFs
[11:15:06] [PASSED] 56 VFs
[11:15:06] [PASSED] 57 VFs
[11:15:06] [PASSED] 58 VFs
[11:15:06] [PASSED] 59 VFs
[11:15:06] [PASSED] 60 VFs
[11:15:06] [PASSED] 61 VFs
[11:15:06] [PASSED] 62 VFs
[11:15:06] [PASSED] 63 VFs
[11:15:06] ================== [PASSED] fair_contexts ==================
[11:15:06] ===================== fair_doorbells  ======================
[11:15:06] [PASSED] 1 VF
[11:15:06] [PASSED] 2 VFs
[11:15:06] [PASSED] 3 VFs
[11:15:06] [PASSED] 4 VFs
[11:15:06] [PASSED] 5 VFs
[11:15:06] [PASSED] 6 VFs
[11:15:06] [PASSED] 7 VFs
[11:15:06] [PASSED] 8 VFs
[11:15:06] [PASSED] 9 VFs
[11:15:06] [PASSED] 10 VFs
[11:15:06] [PASSED] 11 VFs
[11:15:06] [PASSED] 12 VFs
[11:15:06] [PASSED] 13 VFs
[11:15:06] [PASSED] 14 VFs
[11:15:06] [PASSED] 15 VFs
[11:15:06] [PASSED] 16 VFs
[11:15:06] [PASSED] 17 VFs
[11:15:06] [PASSED] 18 VFs
[11:15:06] [PASSED] 19 VFs
[11:15:06] [PASSED] 20 VFs
[11:15:06] [PASSED] 21 VFs
[11:15:06] [PASSED] 22 VFs
[11:15:06] [PASSED] 23 VFs
[11:15:06] [PASSED] 24 VFs
[11:15:06] [PASSED] 25 VFs
[11:15:06] [PASSED] 26 VFs
[11:15:06] [PASSED] 27 VFs
[11:15:06] [PASSED] 28 VFs
[11:15:06] [PASSED] 29 VFs
[11:15:06] [PASSED] 30 VFs
[11:15:06] [PASSED] 31 VFs
[11:15:06] [PASSED] 32 VFs
[11:15:06] [PASSED] 33 VFs
[11:15:06] [PASSED] 34 VFs
[11:15:06] [PASSED] 35 VFs
[11:15:06] [PASSED] 36 VFs
[11:15:06] [PASSED] 37 VFs
[11:15:06] [PASSED] 38 VFs
[11:15:06] [PASSED] 39 VFs
[11:15:06] [PASSED] 40 VFs
[11:15:06] [PASSED] 41 VFs
[11:15:06] [PASSED] 42 VFs
[11:15:06] [PASSED] 43 VFs
[11:15:06] [PASSED] 44 VFs
[11:15:06] [PASSED] 45 VFs
[11:15:06] [PASSED] 46 VFs
[11:15:06] [PASSED] 47 VFs
[11:15:06] [PASSED] 48 VFs
[11:15:06] [PASSED] 49 VFs
[11:15:06] [PASSED] 50 VFs
[11:15:06] [PASSED] 51 VFs
[11:15:06] [PASSED] 52 VFs
[11:15:06] [PASSED] 53 VFs
[11:15:06] [PASSED] 54 VFs
[11:15:06] [PASSED] 55 VFs
[11:15:06] [PASSED] 56 VFs
[11:15:06] [PASSED] 57 VFs
[11:15:06] [PASSED] 58 VFs
[11:15:06] [PASSED] 59 VFs
[11:15:06] [PASSED] 60 VFs
[11:15:06] [PASSED] 61 VFs
[11:15:06] [PASSED] 62 VFs
[11:15:06] [PASSED] 63 VFs
[11:15:06] ================= [PASSED] fair_doorbells ==================
[11:15:06] ======================== fair_ggtt  ========================
[11:15:06] [PASSED] 1 VF
[11:15:06] [PASSED] 2 VFs
[11:15:06] [PASSED] 3 VFs
[11:15:06] [PASSED] 4 VFs
[11:15:06] [PASSED] 5 VFs
[11:15:06] [PASSED] 6 VFs
[11:15:06] [PASSED] 7 VFs
[11:15:06] [PASSED] 8 VFs
[11:15:06] [PASSED] 9 VFs
[11:15:06] [PASSED] 10 VFs
[11:15:06] [PASSED] 11 VFs
[11:15:06] [PASSED] 12 VFs
[11:15:06] [PASSED] 13 VFs
[11:15:06] [PASSED] 14 VFs
[11:15:06] [PASSED] 15 VFs
[11:15:06] [PASSED] 16 VFs
[11:15:06] [PASSED] 17 VFs
[11:15:06] [PASSED] 18 VFs
[11:15:06] [PASSED] 19 VFs
[11:15:06] [PASSED] 20 VFs
[11:15:06] [PASSED] 21 VFs
[11:15:06] [PASSED] 22 VFs
[11:15:06] [PASSED] 23 VFs
[11:15:06] [PASSED] 24 VFs
[11:15:06] [PASSED] 25 VFs
[11:15:06] [PASSED] 26 VFs
[11:15:06] [PASSED] 27 VFs
[11:15:06] [PASSED] 28 VFs
[11:15:06] [PASSED] 29 VFs
[11:15:06] [PASSED] 30 VFs
[11:15:06] [PASSED] 31 VFs
[11:15:06] [PASSED] 32 VFs
[11:15:06] [PASSED] 33 VFs
[11:15:06] [PASSED] 34 VFs
[11:15:06] [PASSED] 35 VFs
[11:15:06] [PASSED] 36 VFs
[11:15:06] [PASSED] 37 VFs
[11:15:06] [PASSED] 38 VFs
[11:15:06] [PASSED] 39 VFs
[11:15:06] [PASSED] 40 VFs
[11:15:06] [PASSED] 41 VFs
[11:15:06] [PASSED] 42 VFs
[11:15:06] [PASSED] 43 VFs
[11:15:06] [PASSED] 44 VFs
[11:15:06] [PASSED] 45 VFs
[11:15:06] [PASSED] 46 VFs
[11:15:06] [PASSED] 47 VFs
[11:15:06] [PASSED] 48 VFs
[11:15:06] [PASSED] 49 VFs
[11:15:06] [PASSED] 50 VFs
[11:15:06] [PASSED] 51 VFs
[11:15:06] [PASSED] 52 VFs
[11:15:06] [PASSED] 53 VFs
[11:15:06] [PASSED] 54 VFs
[11:15:06] [PASSED] 55 VFs
[11:15:06] [PASSED] 56 VFs
[11:15:06] [PASSED] 57 VFs
[11:15:06] [PASSED] 58 VFs
[11:15:06] [PASSED] 59 VFs
[11:15:06] [PASSED] 60 VFs
[11:15:06] [PASSED] 61 VFs
[11:15:06] [PASSED] 62 VFs
[11:15:06] [PASSED] 63 VFs
[11:15:06] ==================== [PASSED] fair_ggtt ====================
[11:15:06] ======================== fair_vram  ========================
[11:15:06] [PASSED] 1 VF
[11:15:06] [PASSED] 2 VFs
[11:15:06] [PASSED] 3 VFs
[11:15:06] [PASSED] 4 VFs
[11:15:06] [PASSED] 5 VFs
[11:15:06] [PASSED] 6 VFs
[11:15:06] [PASSED] 7 VFs
[11:15:06] [PASSED] 8 VFs
[11:15:06] [PASSED] 9 VFs
[11:15:06] [PASSED] 10 VFs
[11:15:06] [PASSED] 11 VFs
[11:15:06] [PASSED] 12 VFs
[11:15:06] [PASSED] 13 VFs
[11:15:06] [PASSED] 14 VFs
[11:15:06] [PASSED] 15 VFs
[11:15:06] [PASSED] 16 VFs
[11:15:06] [PASSED] 17 VFs
[11:15:06] [PASSED] 18 VFs
[11:15:06] [PASSED] 19 VFs
[11:15:06] [PASSED] 20 VFs
[11:15:06] [PASSED] 21 VFs
[11:15:06] [PASSED] 22 VFs
[11:15:06] [PASSED] 23 VFs
[11:15:06] [PASSED] 24 VFs
[11:15:06] [PASSED] 25 VFs
[11:15:06] [PASSED] 26 VFs
[11:15:06] [PASSED] 27 VFs
[11:15:06] [PASSED] 28 VFs
[11:15:06] [PASSED] 29 VFs
[11:15:06] [PASSED] 30 VFs
[11:15:06] [PASSED] 31 VFs
[11:15:06] [PASSED] 32 VFs
[11:15:06] [PASSED] 33 VFs
[11:15:06] [PASSED] 34 VFs
[11:15:06] [PASSED] 35 VFs
[11:15:06] [PASSED] 36 VFs
[11:15:06] [PASSED] 37 VFs
[11:15:06] [PASSED] 38 VFs
[11:15:06] [PASSED] 39 VFs
[11:15:06] [PASSED] 40 VFs
[11:15:06] [PASSED] 41 VFs
[11:15:06] [PASSED] 42 VFs
[11:15:06] [PASSED] 43 VFs
[11:15:06] [PASSED] 44 VFs
[11:15:06] [PASSED] 45 VFs
[11:15:06] [PASSED] 46 VFs
[11:15:06] [PASSED] 47 VFs
[11:15:06] [PASSED] 48 VFs
[11:15:06] [PASSED] 49 VFs
[11:15:06] [PASSED] 50 VFs
[11:15:06] [PASSED] 51 VFs
[11:15:06] [PASSED] 52 VFs
[11:15:06] [PASSED] 53 VFs
[11:15:06] [PASSED] 54 VFs
[11:15:06] [PASSED] 55 VFs
[11:15:06] [PASSED] 56 VFs
[11:15:06] [PASSED] 57 VFs
[11:15:06] [PASSED] 58 VFs
[11:15:06] [PASSED] 59 VFs
[11:15:06] [PASSED] 60 VFs
[11:15:06] [PASSED] 61 VFs
[11:15:06] [PASSED] 62 VFs
[11:15:06] [PASSED] 63 VFs
[11:15:06] ==================== [PASSED] fair_vram ====================
[11:15:06] ================== [PASSED] pf_gt_config ===================
[11:15:06] ===================== lmtt (1 subtest) =====================
[11:15:06] ======================== test_ops  =========================
[11:15:06] [PASSED] 2-level
[11:15:06] [PASSED] multi-level
[11:15:06] ==================== [PASSED] test_ops =====================
[11:15:06] ====================== [PASSED] lmtt =======================
[11:15:06] ================= pf_service (11 subtests) =================
[11:15:06] [PASSED] pf_negotiate_any
[11:15:06] [PASSED] pf_negotiate_base_match
[11:15:06] [PASSED] pf_negotiate_base_newer
[11:15:06] [PASSED] pf_negotiate_base_next
[11:15:06] [SKIPPED] pf_negotiate_base_older
[11:15:06] [PASSED] pf_negotiate_base_prev
[11:15:06] [PASSED] pf_negotiate_latest_match
[11:15:06] [PASSED] pf_negotiate_latest_newer
[11:15:06] [PASSED] pf_negotiate_latest_next
[11:15:06] [SKIPPED] pf_negotiate_latest_older
[11:15:06] [SKIPPED] pf_negotiate_latest_prev
[11:15:06] =================== [PASSED] pf_service ====================
[11:15:06] ================= xe_guc_g2g (2 subtests) ==================
[11:15:06] ============== xe_live_guc_g2g_kunit_default  ==============
[11:15:06] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[11:15:06] ============== xe_live_guc_g2g_kunit_allmem  ===============
[11:15:06] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[11:15:06] =================== [SKIPPED] xe_guc_g2g ===================
[11:15:06] =================== xe_mocs (2 subtests) ===================
[11:15:06] ================ xe_live_mocs_kernel_kunit  ================
[11:15:06] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[11:15:06] ================ xe_live_mocs_reset_kunit  =================
[11:15:06] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[11:15:06] ==================== [SKIPPED] xe_mocs =====================
[11:15:06] ================= xe_migrate (2 subtests) ==================
[11:15:06] ================= xe_migrate_sanity_kunit  =================
[11:15:06] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[11:15:06] ================== xe_validate_ccs_kunit  ==================
[11:15:06] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[11:15:06] =================== [SKIPPED] xe_migrate ===================
[11:15:06] ================== xe_dma_buf (1 subtest) ==================
[11:15:06] ==================== xe_dma_buf_kunit  =====================
[11:15:06] ================ [SKIPPED] xe_dma_buf_kunit ================
[11:15:06] =================== [SKIPPED] xe_dma_buf ===================
[11:15:06] ================= xe_bo_shrink (1 subtest) =================
[11:15:06] =================== xe_bo_shrink_kunit  ====================
[11:15:06] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[11:15:06] ================== [SKIPPED] xe_bo_shrink ==================
[11:15:06] ==================== xe_bo (2 subtests) ====================
[11:15:06] ================== xe_ccs_migrate_kunit  ===================
[11:15:06] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[11:15:06] ==================== xe_bo_evict_kunit  ====================
[11:15:06] =============== [SKIPPED] xe_bo_evict_kunit ================
[11:15:06] ===================== [SKIPPED] xe_bo ======================
[11:15:06] ==================== args (13 subtests) ====================
[11:15:06] [PASSED] count_args_test
[11:15:06] [PASSED] call_args_example
[11:15:06] [PASSED] call_args_test
[11:15:06] [PASSED] drop_first_arg_example
[11:15:06] [PASSED] drop_first_arg_test
[11:15:06] [PASSED] first_arg_example
[11:15:06] [PASSED] first_arg_test
[11:15:06] [PASSED] last_arg_example
[11:15:06] [PASSED] last_arg_test
[11:15:06] [PASSED] pick_arg_example
[11:15:06] [PASSED] if_args_example
[11:15:06] [PASSED] if_args_test
[11:15:06] [PASSED] sep_comma_example
[11:15:06] ====================== [PASSED] args =======================
[11:15:06] =================== xe_pci (3 subtests) ====================
[11:15:06] ==================== check_graphics_ip  ====================
[11:15:06] [PASSED] 12.00 Xe_LP
[11:15:06] [PASSED] 12.10 Xe_LP+
[11:15:06] [PASSED] 12.55 Xe_HPG
[11:15:06] [PASSED] 12.60 Xe_HPC
[11:15:06] [PASSED] 12.70 Xe_LPG
[11:15:06] [PASSED] 12.71 Xe_LPG
[11:15:06] [PASSED] 12.74 Xe_LPG+
[11:15:06] [PASSED] 20.01 Xe2_HPG
[11:15:06] [PASSED] 20.02 Xe2_HPG
[11:15:06] [PASSED] 20.04 Xe2_LPG
[11:15:06] [PASSED] 30.00 Xe3_LPG
[11:15:06] [PASSED] 30.01 Xe3_LPG
[11:15:06] [PASSED] 30.03 Xe3_LPG
[11:15:06] [PASSED] 30.04 Xe3_LPG
[11:15:06] [PASSED] 30.05 Xe3_LPG
[11:15:06] [PASSED] 35.10 Xe3p_LPG
[11:15:06] [PASSED] 35.11 Xe3p_XPC
[11:15:06] ================ [PASSED] check_graphics_ip ================
[11:15:06] ===================== check_media_ip  ======================
[11:15:06] [PASSED] 12.00 Xe_M
[11:15:06] [PASSED] 12.55 Xe_HPM
[11:15:06] [PASSED] 13.00 Xe_LPM+
[11:15:06] [PASSED] 13.01 Xe2_HPM
[11:15:06] [PASSED] 20.00 Xe2_LPM
[11:15:06] [PASSED] 30.00 Xe3_LPM
[11:15:06] [PASSED] 30.02 Xe3_LPM
[11:15:06] [PASSED] 35.00 Xe3p_LPM
[11:15:06] [PASSED] 35.03 Xe3p_HPM
[11:15:06] ================= [PASSED] check_media_ip ==================
[11:15:06] =================== check_platform_desc  ===================
[11:15:06] [PASSED] 0x9A60 (TIGERLAKE)
[11:15:06] [PASSED] 0x9A68 (TIGERLAKE)
[11:15:06] [PASSED] 0x9A70 (TIGERLAKE)
[11:15:06] [PASSED] 0x9A40 (TIGERLAKE)
[11:15:06] [PASSED] 0x9A49 (TIGERLAKE)
[11:15:06] [PASSED] 0x9A59 (TIGERLAKE)
[11:15:06] [PASSED] 0x9A78 (TIGERLAKE)
[11:15:06] [PASSED] 0x9AC0 (TIGERLAKE)
[11:15:06] [PASSED] 0x9AC9 (TIGERLAKE)
[11:15:06] [PASSED] 0x9AD9 (TIGERLAKE)
[11:15:06] [PASSED] 0x9AF8 (TIGERLAKE)
[11:15:06] [PASSED] 0x4C80 (ROCKETLAKE)
[11:15:06] [PASSED] 0x4C8A (ROCKETLAKE)
[11:15:06] [PASSED] 0x4C8B (ROCKETLAKE)
[11:15:06] [PASSED] 0x4C8C (ROCKETLAKE)
[11:15:06] [PASSED] 0x4C90 (ROCKETLAKE)
[11:15:06] [PASSED] 0x4C9A (ROCKETLAKE)
[11:15:06] [PASSED] 0x4680 (ALDERLAKE_S)
[11:15:06] [PASSED] 0x4682 (ALDERLAKE_S)
[11:15:06] [PASSED] 0x4688 (ALDERLAKE_S)
[11:15:06] [PASSED] 0x468A (ALDERLAKE_S)
[11:15:06] [PASSED] 0x468B (ALDERLAKE_S)
[11:15:06] [PASSED] 0x4690 (ALDERLAKE_S)
[11:15:06] [PASSED] 0x4692 (ALDERLAKE_S)
[11:15:06] [PASSED] 0x4693 (ALDERLAKE_S)
[11:15:06] [PASSED] 0x46A0 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46A1 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46A2 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46A3 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46A6 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46A8 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46AA (ALDERLAKE_P)
[11:15:06] [PASSED] 0x462A (ALDERLAKE_P)
[11:15:06] [PASSED] 0x4626 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x4628 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46B0 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46B1 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46B2 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46B3 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46C0 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46C1 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46C2 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46C3 (ALDERLAKE_P)
[11:15:06] [PASSED] 0x46D0 (ALDERLAKE_N)
[11:15:06] [PASSED] 0x46D1 (ALDERLAKE_N)
[11:15:06] [PASSED] 0x46D2 (ALDERLAKE_N)
[11:15:06] [PASSED] 0x46D3 (ALDERLAKE_N)
[11:15:06] [PASSED] 0x46D4 (ALDERLAKE_N)
[11:15:06] [PASSED] 0xA721 (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7A1 (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7A9 (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7AC (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7AD (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA720 (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7A0 (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7A8 (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7AA (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA7AB (ALDERLAKE_P)
[11:15:06] [PASSED] 0xA780 (ALDERLAKE_S)
[11:15:06] [PASSED] 0xA781 (ALDERLAKE_S)
[11:15:06] [PASSED] 0xA782 (ALDERLAKE_S)
[11:15:06] [PASSED] 0xA783 (ALDERLAKE_S)
[11:15:06] [PASSED] 0xA788 (ALDERLAKE_S)
[11:15:06] [PASSED] 0xA789 (ALDERLAKE_S)
[11:15:06] [PASSED] 0xA78A (ALDERLAKE_S)
[11:15:06] [PASSED] 0xA78B (ALDERLAKE_S)
[11:15:06] [PASSED] 0x4905 (DG1)
[11:15:06] [PASSED] 0x4906 (DG1)
[11:15:06] [PASSED] 0x4907 (DG1)
[11:15:06] [PASSED] 0x4908 (DG1)
[11:15:06] [PASSED] 0x4909 (DG1)
[11:15:06] [PASSED] 0x56C0 (DG2)
[11:15:06] [PASSED] 0x56C2 (DG2)
[11:15:06] [PASSED] 0x56C1 (DG2)
[11:15:06] [PASSED] 0x7D51 (METEORLAKE)
[11:15:06] [PASSED] 0x7DD1 (METEORLAKE)
[11:15:06] [PASSED] 0x7D41 (METEORLAKE)
[11:15:06] [PASSED] 0x7D67 (METEORLAKE)
[11:15:06] [PASSED] 0xB640 (METEORLAKE)
[11:15:06] [PASSED] 0x56A0 (DG2)
[11:15:06] [PASSED] 0x56A1 (DG2)
[11:15:06] [PASSED] 0x56A2 (DG2)
[11:15:06] [PASSED] 0x56BE (DG2)
[11:15:06] [PASSED] 0x56BF (DG2)
[11:15:06] [PASSED] 0x5690 (DG2)
[11:15:06] [PASSED] 0x5691 (DG2)
[11:15:06] [PASSED] 0x5692 (DG2)
[11:15:06] [PASSED] 0x56A5 (DG2)
[11:15:06] [PASSED] 0x56A6 (DG2)
[11:15:06] [PASSED] 0x56B0 (DG2)
[11:15:06] [PASSED] 0x56B1 (DG2)
[11:15:06] [PASSED] 0x56BA (DG2)
[11:15:06] [PASSED] 0x56BB (DG2)
[11:15:06] [PASSED] 0x56BC (DG2)
[11:15:06] [PASSED] 0x56BD (DG2)
[11:15:06] [PASSED] 0x5693 (DG2)
[11:15:06] [PASSED] 0x5694 (DG2)
[11:15:06] [PASSED] 0x5695 (DG2)
[11:15:06] [PASSED] 0x56A3 (DG2)
[11:15:06] [PASSED] 0x56A4 (DG2)
[11:15:06] [PASSED] 0x56B2 (DG2)
[11:15:06] [PASSED] 0x56B3 (DG2)
[11:15:06] [PASSED] 0x5696 (DG2)
[11:15:06] [PASSED] 0x5697 (DG2)
[11:15:06] [PASSED] 0xB69 (PVC)
[11:15:06] [PASSED] 0xB6E (PVC)
[11:15:06] [PASSED] 0xBD4 (PVC)
[11:15:06] [PASSED] 0xBD5 (PVC)
[11:15:06] [PASSED] 0xBD6 (PVC)
[11:15:06] [PASSED] 0xBD7 (PVC)
[11:15:06] [PASSED] 0xBD8 (PVC)
[11:15:06] [PASSED] 0xBD9 (PVC)
[11:15:06] [PASSED] 0xBDA (PVC)
[11:15:06] [PASSED] 0xBDB (PVC)
[11:15:06] [PASSED] 0xBE0 (PVC)
[11:15:06] [PASSED] 0xBE1 (PVC)
[11:15:06] [PASSED] 0xBE5 (PVC)
[11:15:06] [PASSED] 0x7D40 (METEORLAKE)
[11:15:06] [PASSED] 0x7D45 (METEORLAKE)
[11:15:06] [PASSED] 0x7D55 (METEORLAKE)
[11:15:06] [PASSED] 0x7D60 (METEORLAKE)
[11:15:06] [PASSED] 0x7DD5 (METEORLAKE)
[11:15:06] [PASSED] 0x6420 (LUNARLAKE)
[11:15:06] [PASSED] 0x64A0 (LUNARLAKE)
[11:15:06] [PASSED] 0x64B0 (LUNARLAKE)
[11:15:06] [PASSED] 0xE202 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE209 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE20B (BATTLEMAGE)
[11:15:06] [PASSED] 0xE20C (BATTLEMAGE)
[11:15:06] [PASSED] 0xE20D (BATTLEMAGE)
[11:15:06] [PASSED] 0xE210 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE211 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE212 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE216 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE220 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE221 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE222 (BATTLEMAGE)
[11:15:06] [PASSED] 0xE223 (BATTLEMAGE)
[11:15:06] [PASSED] 0xB080 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB081 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB082 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB083 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB084 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB085 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB086 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB087 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB08F (PANTHERLAKE)
[11:15:06] [PASSED] 0xB090 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB0A0 (PANTHERLAKE)
[11:15:06] [PASSED] 0xB0B0 (PANTHERLAKE)
[11:15:06] [PASSED] 0xFD80 (PANTHERLAKE)
[11:15:06] [PASSED] 0xFD81 (PANTHERLAKE)
[11:15:06] [PASSED] 0xD740 (NOVALAKE_S)
[11:15:06] [PASSED] 0xD741 (NOVALAKE_S)
[11:15:06] [PASSED] 0xD742 (NOVALAKE_S)
[11:15:06] [PASSED] 0xD743 (NOVALAKE_S)
[11:15:06] [PASSED] 0xD744 (NOVALAKE_S)
[11:15:06] [PASSED] 0xD745 (NOVALAKE_S)
[11:15:06] [PASSED] 0x674C (CRESCENTISLAND)
[11:15:06] [PASSED] 0xD750 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD751 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD752 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD753 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD754 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD755 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD756 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD757 (NOVALAKE_P)
[11:15:06] [PASSED] 0xD75F (NOVALAKE_P)
[11:15:06] =============== [PASSED] check_platform_desc ===============
[11:15:06] ===================== [PASSED] xe_pci ======================
[11:15:06] =================== xe_rtp (2 subtests) ====================
[11:15:06] =============== xe_rtp_process_to_sr_tests  ================
[11:15:06] [PASSED] coalesce-same-reg
[11:15:06] [PASSED] no-match-no-add
[11:15:06] [PASSED] match-or
[11:15:06] [PASSED] match-or-xfail
[11:15:06] [PASSED] no-match-no-add-multiple-rules
[11:15:06] [PASSED] two-regs-two-entries
[11:15:06] [PASSED] clr-one-set-other
[11:15:06] [PASSED] set-field
[11:15:06] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[11:15:06] [PASSED] conflict-not-disjoint
[11:15:06] [PASSED] conflict-reg-type
[11:15:06] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[11:15:06] ================== xe_rtp_process_tests  ===================
[11:15:06] [PASSED] active1
[11:15:06] [PASSED] active2
[11:15:06] [PASSED] active-inactive
[11:15:06] [PASSED] inactive-active
[11:15:06] [PASSED] inactive-1st_or_active-inactive
[11:15:06] [PASSED] inactive-2nd_or_active-inactive
[11:15:06] [PASSED] inactive-last_or_active-inactive
[11:15:06] [PASSED] inactive-no_or_active-inactive
[11:15:06] ============== [PASSED] xe_rtp_process_tests ===============
[11:15:06] ===================== [PASSED] xe_rtp ======================
[11:15:06] ==================== xe_wa (1 subtest) =====================
[11:15:06] ======================== xe_wa_gt  =========================
[11:15:06] [PASSED] TIGERLAKE B0
[11:15:06] [PASSED] DG1 A0
[11:15:06] [PASSED] DG1 B0
[11:15:06] [PASSED] ALDERLAKE_S A0
[11:15:06] [PASSED] ALDERLAKE_S B0
[11:15:06] [PASSED] ALDERLAKE_S C0
[11:15:06] [PASSED] ALDERLAKE_S D0
[11:15:06] [PASSED] ALDERLAKE_P A0
[11:15:06] [PASSED] ALDERLAKE_P B0
[11:15:06] [PASSED] ALDERLAKE_P C0
[11:15:06] [PASSED] ALDERLAKE_S RPLS D0
[11:15:06] [PASSED] ALDERLAKE_P RPLU E0
[11:15:06] [PASSED] DG2 G10 C0
[11:15:06] [PASSED] DG2 G11 B1
[11:15:06] [PASSED] DG2 G12 A1
[11:15:06] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[11:15:06] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[11:15:06] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[11:15:06] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[11:15:06] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[11:15:06] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[11:15:06] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[11:15:06] ==================== [PASSED] xe_wa_gt =====================
[11:15:06] ====================== [PASSED] xe_wa ======================
[11:15:06] ============================================================
[11:15:06] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[11:15:06] Elapsed time: 36.121s total, 4.266s configuring, 31.238s building, 0.608s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:15:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:15:08] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[11:15:32] Starting KUnit Kernel (1/1)...
[11:15:32] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:15:33] ============ drm_test_pick_cmdline (2 subtests) ============
[11:15:33] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[11:15:33] =============== drm_test_pick_cmdline_named  ===============
[11:15:33] [PASSED] NTSC
[11:15:33] [PASSED] NTSC-J
[11:15:33] [PASSED] PAL
[11:15:33] [PASSED] PAL-M
[11:15:33] =========== [PASSED] drm_test_pick_cmdline_named ===========
[11:15:33] ============== [PASSED] drm_test_pick_cmdline ==============
[11:15:33] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[11:15:33] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[11:15:33] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[11:15:33] =========== drm_validate_clone_mode (2 subtests) ===========
[11:15:33] ============== drm_test_check_in_clone_mode  ===============
[11:15:33] [PASSED] in_clone_mode
[11:15:33] [PASSED] not_in_clone_mode
[11:15:33] ========== [PASSED] drm_test_check_in_clone_mode ===========
[11:15:33] =============== drm_test_check_valid_clones  ===============
[11:15:33] [PASSED] not_in_clone_mode
[11:15:33] [PASSED] valid_clone
[11:15:33] [PASSED] invalid_clone
[11:15:33] =========== [PASSED] drm_test_check_valid_clones ===========
[11:15:33] ============= [PASSED] drm_validate_clone_mode =============
[11:15:33] ============= drm_validate_modeset (1 subtest) =============
[11:15:33] [PASSED] drm_test_check_connector_changed_modeset
[11:15:33] ============== [PASSED] drm_validate_modeset ===============
[11:15:33] ====== drm_test_bridge_get_current_state (2 subtests) ======
[11:15:33] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[11:15:33] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[11:15:33] ======== [PASSED] drm_test_bridge_get_current_state ========
[11:15:33] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[11:15:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[11:15:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[11:15:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[11:15:33] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[11:15:33] ============== drm_bridge_alloc (2 subtests) ===============
[11:15:33] [PASSED] drm_test_drm_bridge_alloc_basic
[11:15:33] [PASSED] drm_test_drm_bridge_alloc_get_put
[11:15:33] ================ [PASSED] drm_bridge_alloc =================
[11:15:33] ============= drm_cmdline_parser (40 subtests) =============
[11:15:33] [PASSED] drm_test_cmdline_force_d_only
[11:15:33] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:15:33] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:15:33] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:15:33] [PASSED] drm_test_cmdline_force_e_only
[11:15:33] [PASSED] drm_test_cmdline_res
[11:15:33] [PASSED] drm_test_cmdline_res_vesa
[11:15:33] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:15:33] [PASSED] drm_test_cmdline_res_rblank
[11:15:33] [PASSED] drm_test_cmdline_res_bpp
[11:15:33] [PASSED] drm_test_cmdline_res_refresh
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:15:33] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:15:33] [PASSED] drm_test_cmdline_res_margins_force_on
[11:15:33] [PASSED] drm_test_cmdline_res_vesa_margins
[11:15:33] [PASSED] drm_test_cmdline_name
[11:15:33] [PASSED] drm_test_cmdline_name_bpp
[11:15:33] [PASSED] drm_test_cmdline_name_option
[11:15:33] [PASSED] drm_test_cmdline_name_bpp_option
[11:15:33] [PASSED] drm_test_cmdline_rotate_0
[11:15:33] [PASSED] drm_test_cmdline_rotate_90
[11:15:33] [PASSED] drm_test_cmdline_rotate_180
[11:15:33] [PASSED] drm_test_cmdline_rotate_270
[11:15:33] [PASSED] drm_test_cmdline_hmirror
[11:15:33] [PASSED] drm_test_cmdline_vmirror
[11:15:33] [PASSED] drm_test_cmdline_margin_options
[11:15:33] [PASSED] drm_test_cmdline_multiple_options
[11:15:33] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:15:33] [PASSED] drm_test_cmdline_extra_and_option
[11:15:33] [PASSED] drm_test_cmdline_freestanding_options
[11:15:33] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:15:33] [PASSED] drm_test_cmdline_panel_orientation
[11:15:33] ================ drm_test_cmdline_invalid  =================
[11:15:33] [PASSED] margin_only
[11:15:33] [PASSED] interlace_only
[11:15:33] [PASSED] res_missing_x
[11:15:33] [PASSED] res_missing_y
[11:15:33] [PASSED] res_bad_y
[11:15:33] [PASSED] res_missing_y_bpp
[11:15:33] [PASSED] res_bad_bpp
[11:15:33] [PASSED] res_bad_refresh
[11:15:33] [PASSED] res_bpp_refresh_force_on_off
[11:15:33] [PASSED] res_invalid_mode
[11:15:33] [PASSED] res_bpp_wrong_place_mode
[11:15:33] [PASSED] name_bpp_refresh
[11:15:33] [PASSED] name_refresh
[11:15:33] [PASSED] name_refresh_wrong_mode
[11:15:33] [PASSED] name_refresh_invalid_mode
[11:15:33] [PASSED] rotate_multiple
[11:15:33] [PASSED] rotate_invalid_val
[11:15:33] [PASSED] rotate_truncated
[11:15:33] [PASSED] invalid_option
[11:15:33] [PASSED] invalid_tv_option
[11:15:33] [PASSED] truncated_tv_option
[11:15:33] ============ [PASSED] drm_test_cmdline_invalid =============
[11:15:33] =============== drm_test_cmdline_tv_options  ===============
[11:15:33] [PASSED] NTSC
[11:15:33] [PASSED] NTSC_443
[11:15:33] [PASSED] NTSC_J
[11:15:33] [PASSED] PAL
[11:15:33] [PASSED] PAL_M
[11:15:33] [PASSED] PAL_N
[11:15:33] [PASSED] SECAM
[11:15:33] [PASSED] MONO_525
[11:15:33] [PASSED] MONO_625
[11:15:33] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:15:33] =============== [PASSED] drm_cmdline_parser ================
[11:15:33] ========== drmm_connector_hdmi_init (20 subtests) ==========
[11:15:33] [PASSED] drm_test_connector_hdmi_init_valid
[11:15:33] [PASSED] drm_test_connector_hdmi_init_bpc_8
[11:15:33] [PASSED] drm_test_connector_hdmi_init_bpc_10
[11:15:33] [PASSED] drm_test_connector_hdmi_init_bpc_12
[11:15:33] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[11:15:33] [PASSED] drm_test_connector_hdmi_init_bpc_null
[11:15:33] [PASSED] drm_test_connector_hdmi_init_formats_empty
[11:15:33] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[11:15:33] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[11:15:33] [PASSED] supported_formats=0x9 yuv420_allowed=1
[11:15:33] [PASSED] supported_formats=0x9 yuv420_allowed=0
[11:15:33] [PASSED] supported_formats=0x5 yuv420_allowed=1
[11:15:33] [PASSED] supported_formats=0x5 yuv420_allowed=0
[11:15:33] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[11:15:33] [PASSED] drm_test_connector_hdmi_init_null_ddc
[11:15:33] [PASSED] drm_test_connector_hdmi_init_null_product
[11:15:33] [PASSED] drm_test_connector_hdmi_init_null_vendor
[11:15:33] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[11:15:33] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[11:15:33] [PASSED] drm_test_connector_hdmi_init_product_valid
[11:15:33] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[11:15:33] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[11:15:33] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[11:15:33] ========= drm_test_connector_hdmi_init_type_valid  =========
[11:15:33] [PASSED] HDMI-A
[11:15:33] [PASSED] HDMI-B
[11:15:33] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[11:15:33] ======== drm_test_connector_hdmi_init_type_invalid  ========
[11:15:33] [PASSED] Unknown
[11:15:33] [PASSED] VGA
[11:15:33] [PASSED] DVI-I
[11:15:33] [PASSED] DVI-D
[11:15:33] [PASSED] DVI-A
[11:15:33] [PASSED] Composite
[11:15:33] [PASSED] SVIDEO
[11:15:33] [PASSED] LVDS
[11:15:33] [PASSED] Component
[11:15:33] [PASSED] DIN
[11:15:33] [PASSED] DP
[11:15:33] [PASSED] TV
[11:15:33] [PASSED] eDP
[11:15:33] [PASSED] Virtual
[11:15:33] [PASSED] DSI
[11:15:33] [PASSED] DPI
[11:15:33] [PASSED] Writeback
[11:15:33] [PASSED] SPI
[11:15:33] [PASSED] USB
[11:15:33] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[11:15:33] ============ [PASSED] drmm_connector_hdmi_init =============
[11:15:33] ============= drmm_connector_init (3 subtests) =============
[11:15:33] [PASSED] drm_test_drmm_connector_init
[11:15:33] [PASSED] drm_test_drmm_connector_init_null_ddc
[11:15:33] ========= drm_test_drmm_connector_init_type_valid  =========
[11:15:33] [PASSED] Unknown
[11:15:33] [PASSED] VGA
[11:15:33] [PASSED] DVI-I
[11:15:33] [PASSED] DVI-D
[11:15:33] [PASSED] DVI-A
[11:15:33] [PASSED] Composite
[11:15:33] [PASSED] SVIDEO
[11:15:33] [PASSED] LVDS
[11:15:33] [PASSED] Component
[11:15:33] [PASSED] DIN
[11:15:33] [PASSED] DP
[11:15:33] [PASSED] HDMI-A
[11:15:33] [PASSED] HDMI-B
[11:15:33] [PASSED] TV
[11:15:33] [PASSED] eDP
[11:15:33] [PASSED] Virtual
[11:15:33] [PASSED] DSI
[11:15:33] [PASSED] DPI
[11:15:33] [PASSED] Writeback
[11:15:33] [PASSED] SPI
[11:15:33] [PASSED] USB
[11:15:33] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[11:15:33] =============== [PASSED] drmm_connector_init ===============
[11:15:33] ========= drm_connector_dynamic_init (6 subtests) ==========
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_init
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_init_properties
[11:15:33] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[11:15:33] [PASSED] Unknown
[11:15:33] [PASSED] VGA
[11:15:33] [PASSED] DVI-I
[11:15:33] [PASSED] DVI-D
[11:15:33] [PASSED] DVI-A
[11:15:33] [PASSED] Composite
[11:15:33] [PASSED] SVIDEO
[11:15:33] [PASSED] LVDS
[11:15:33] [PASSED] Component
[11:15:33] [PASSED] DIN
[11:15:33] [PASSED] DP
[11:15:33] [PASSED] HDMI-A
[11:15:33] [PASSED] HDMI-B
[11:15:33] [PASSED] TV
[11:15:33] [PASSED] eDP
[11:15:33] [PASSED] Virtual
[11:15:33] [PASSED] DSI
[11:15:33] [PASSED] DPI
[11:15:33] [PASSED] Writeback
[11:15:33] [PASSED] SPI
[11:15:33] [PASSED] USB
[11:15:33] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[11:15:33] ======== drm_test_drm_connector_dynamic_init_name  =========
[11:15:33] [PASSED] Unknown
[11:15:33] [PASSED] VGA
[11:15:33] [PASSED] DVI-I
[11:15:33] [PASSED] DVI-D
[11:15:33] [PASSED] DVI-A
[11:15:33] [PASSED] Composite
[11:15:33] [PASSED] SVIDEO
[11:15:33] [PASSED] LVDS
[11:15:33] [PASSED] Component
[11:15:33] [PASSED] DIN
[11:15:33] [PASSED] DP
[11:15:33] [PASSED] HDMI-A
[11:15:33] [PASSED] HDMI-B
[11:15:33] [PASSED] TV
[11:15:33] [PASSED] eDP
[11:15:33] [PASSED] Virtual
[11:15:33] [PASSED] DSI
[11:15:33] [PASSED] DPI
[11:15:33] [PASSED] Writeback
[11:15:33] [PASSED] SPI
[11:15:33] [PASSED] USB
[11:15:33] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[11:15:33] =========== [PASSED] drm_connector_dynamic_init ============
[11:15:33] ==== drm_connector_dynamic_register_early (4 subtests) =====
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[11:15:33] ====== [PASSED] drm_connector_dynamic_register_early =======
[11:15:33] ======= drm_connector_dynamic_register (7 subtests) ========
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[11:15:33] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[11:15:33] ========= [PASSED] drm_connector_dynamic_register ==========
[11:15:33] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[11:15:33] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[11:15:33] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[11:15:33] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[11:15:33] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[11:15:33] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:15:33] [PASSED] NTSC
[11:15:33] [PASSED] NTSC-443
[11:15:33] [PASSED] NTSC-J
[11:15:33] [PASSED] PAL
[11:15:33] [PASSED] PAL-M
[11:15:33] [PASSED] PAL-N
[11:15:33] [PASSED] SECAM
[11:15:33] [PASSED] Mono
[11:15:33] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:15:33] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:15:33] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:15:33] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[11:15:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[11:15:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[11:15:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[11:15:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[11:15:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[11:15:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[11:15:33] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[11:15:33] [PASSED] VIC 96
[11:15:33] [PASSED] VIC 97
[11:15:33] [PASSED] VIC 101
[11:15:33] [PASSED] VIC 102
[11:15:33] [PASSED] VIC 106
[11:15:33] [PASSED] VIC 107
[11:15:33] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[11:15:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[11:15:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[11:15:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[11:15:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[11:15:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[11:15:33] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[11:15:33] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[11:15:33] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[11:15:33] [PASSED] Automatic
[11:15:33] [PASSED] Full
[11:15:33] [PASSED] Limited 16:235
[11:15:33] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[11:15:33] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[11:15:33] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[11:15:33] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[11:15:33] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[11:15:33] [PASSED] RGB
[11:15:33] [PASSED] YUV 4:2:0
[11:15:33] [PASSED] YUV 4:2:2
[11:15:33] [PASSED] YUV 4:4:4
[11:15:33] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[11:15:33] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[11:15:33] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[11:15:33] ============= drm_damage_helper (21 subtests) ==============
[11:15:33] [PASSED] drm_test_damage_iter_no_damage
[11:15:33] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:15:33] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:15:33] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:15:33] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:15:33] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:15:33] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:15:33] [PASSED] drm_test_damage_iter_simple_damage
[11:15:33] [PASSED] drm_test_damage_iter_single_damage
[11:15:33] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:15:33] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:15:33] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:15:33] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:15:33] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:15:33] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:15:33] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:15:33] [PASSED] drm_test_damage_iter_damage
[11:15:33] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:15:33] [PASSED] drm_test_damage_iter_damage_one_outside
[11:15:33] [PASSED] drm_test_damage_iter_damage_src_moved
[11:15:33] [PASSED] drm_test_damage_iter_damage_not_visible
[11:15:33] ================ [PASSED] drm_damage_helper ================
[11:15:33] ============== drm_dp_mst_helper (3 subtests) ==============
[11:15:33] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:15:33] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:15:33] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:15:33] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:15:33] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:15:33] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:15:33] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:15:33] ============== drm_test_dp_mst_calc_pbn_div  ===============
[11:15:33] [PASSED] Link rate 2000000 lane count 4
[11:15:33] [PASSED] Link rate 2000000 lane count 2
[11:15:33] [PASSED] Link rate 2000000 lane count 1
[11:15:33] [PASSED] Link rate 1350000 lane count 4
[11:15:33] [PASSED] Link rate 1350000 lane count 2
[11:15:33] [PASSED] Link rate 1350000 lane count 1
[11:15:33] [PASSED] Link rate 1000000 lane count 4
[11:15:33] [PASSED] Link rate 1000000 lane count 2
[11:15:33] [PASSED] Link rate 1000000 lane count 1
[11:15:33] [PASSED] Link rate 810000 lane count 4
[11:15:33] [PASSED] Link rate 810000 lane count 2
[11:15:33] [PASSED] Link rate 810000 lane count 1
[11:15:33] [PASSED] Link rate 540000 lane count 4
[11:15:33] [PASSED] Link rate 540000 lane count 2
[11:15:33] [PASSED] Link rate 540000 lane count 1
[11:15:33] [PASSED] Link rate 270000 lane count 4
[11:15:33] [PASSED] Link rate 270000 lane count 2
[11:15:33] [PASSED] Link rate 270000 lane count 1
[11:15:33] [PASSED] Link rate 162000 lane count 4
[11:15:33] [PASSED] Link rate 162000 lane count 2
[11:15:33] [PASSED] Link rate 162000 lane count 1
[11:15:33] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[11:15:33] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:15:33] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:15:33] [PASSED] DP_POWER_UP_PHY with port number
[11:15:33] [PASSED] DP_POWER_DOWN_PHY with port number
[11:15:33] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:15:33] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:15:33] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:15:33] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:15:33] [PASSED] DP_QUERY_PAYLOAD with port number
[11:15:33] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:15:33] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:15:33] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:15:33] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:15:33] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:15:33] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:15:33] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:15:33] [PASSED] DP_REMOTE_I2C_READ with port number
[11:15:33] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:15:33] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:15:33] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:15:33] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:15:33] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:15:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:15:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:15:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:15:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:15:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:15:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:15:33] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:15:33] ================ [PASSED] drm_dp_mst_helper ================
[11:15:33] ================== drm_exec (7 subtests) ===================
[11:15:33] [PASSED] sanitycheck
[11:15:33] [PASSED] test_lock
[11:15:33] [PASSED] test_lock_unlock
[11:15:33] [PASSED] test_duplicates
[11:15:33] [PASSED] test_prepare
[11:15:33] [PASSED] test_prepare_array
[11:15:33] [PASSED] test_multiple_loops
[11:15:33] ==================== [PASSED] drm_exec =====================
[11:15:33] =========== drm_format_helper_test (17 subtests) ===========
[11:15:33] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:15:33] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:15:33] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:15:33] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:15:33] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:15:33] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:15:33] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:15:33] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[11:15:33] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:15:33] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:15:33] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:15:33] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:15:33] ==================== drm_test_fb_swab  =====================
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ================ [PASSED] drm_test_fb_swab =================
[11:15:33] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[11:15:33] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[11:15:33] [PASSED] single_pixel_source_buffer
[11:15:33] [PASSED] single_pixel_clip_rectangle
[11:15:33] [PASSED] well_known_colors
[11:15:33] [PASSED] destination_pitch
[11:15:33] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[11:15:33] ================= drm_test_fb_clip_offset  =================
[11:15:33] [PASSED] pass through
[11:15:33] [PASSED] horizontal offset
[11:15:33] [PASSED] vertical offset
[11:15:33] [PASSED] horizontal and vertical offset
[11:15:33] [PASSED] horizontal offset (custom pitch)
[11:15:33] [PASSED] vertical offset (custom pitch)
[11:15:33] [PASSED] horizontal and vertical offset (custom pitch)
[11:15:33] ============= [PASSED] drm_test_fb_clip_offset =============
[11:15:33] =================== drm_test_fb_memcpy  ====================
[11:15:33] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[11:15:33] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[11:15:33] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[11:15:33] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[11:15:33] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[11:15:33] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[11:15:33] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[11:15:33] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[11:15:33] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[11:15:33] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[11:15:33] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[11:15:33] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[11:15:33] =============== [PASSED] drm_test_fb_memcpy ================
[11:15:33] ============= [PASSED] drm_format_helper_test ==============
[11:15:33] ================= drm_format (18 subtests) =================
[11:15:33] [PASSED] drm_test_format_block_width_invalid
[11:15:33] [PASSED] drm_test_format_block_width_one_plane
[11:15:33] [PASSED] drm_test_format_block_width_two_plane
[11:15:33] [PASSED] drm_test_format_block_width_three_plane
[11:15:33] [PASSED] drm_test_format_block_width_tiled
[11:15:33] [PASSED] drm_test_format_block_height_invalid
[11:15:33] [PASSED] drm_test_format_block_height_one_plane
[11:15:33] [PASSED] drm_test_format_block_height_two_plane
[11:15:33] [PASSED] drm_test_format_block_height_three_plane
[11:15:33] [PASSED] drm_test_format_block_height_tiled
[11:15:33] [PASSED] drm_test_format_min_pitch_invalid
[11:15:33] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:15:33] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:15:33] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:15:33] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:15:33] [PASSED] drm_test_format_min_pitch_two_plane
[11:15:33] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:15:33] [PASSED] drm_test_format_min_pitch_tiled
[11:15:33] =================== [PASSED] drm_format ====================
[11:15:33] ============== drm_framebuffer (10 subtests) ===============
[11:15:33] ========== drm_test_framebuffer_check_src_coords  ==========
[11:15:33] [PASSED] Success: source fits into fb
[11:15:33] [PASSED] Fail: overflowing fb with x-axis coordinate
[11:15:33] [PASSED] Fail: overflowing fb with y-axis coordinate
[11:15:33] [PASSED] Fail: overflowing fb with source width
[11:15:33] [PASSED] Fail: overflowing fb with source height
[11:15:33] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[11:15:33] [PASSED] drm_test_framebuffer_cleanup
[11:15:33] =============== drm_test_framebuffer_create  ===============
[11:15:33] [PASSED] ABGR8888 normal sizes
[11:15:33] [PASSED] ABGR8888 max sizes
[11:15:33] [PASSED] ABGR8888 pitch greater than min required
[11:15:33] [PASSED] ABGR8888 pitch less than min required
[11:15:33] [PASSED] ABGR8888 Invalid width
[11:15:33] [PASSED] ABGR8888 Invalid buffer handle
[11:15:33] [PASSED] No pixel format
[11:15:33] [PASSED] ABGR8888 Width 0
[11:15:33] [PASSED] ABGR8888 Height 0
[11:15:33] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:15:33] [PASSED] ABGR8888 Large buffer offset
[11:15:33] [PASSED] ABGR8888 Buffer offset for inexistent plane
[11:15:33] [PASSED] ABGR8888 Invalid flag
[11:15:33] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:15:33] [PASSED] ABGR8888 Valid buffer modifier
[11:15:33] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:15:33] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:15:33] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:15:33] [PASSED] NV12 Normal sizes
[11:15:33] [PASSED] NV12 Max sizes
[11:15:33] [PASSED] NV12 Invalid pitch
[11:15:33] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:15:33] [PASSED] NV12 different  modifier per-plane
[11:15:33] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:15:33] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:15:33] [PASSED] NV12 Modifier for inexistent plane
[11:15:33] [PASSED] NV12 Handle for inexistent plane
[11:15:33] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:15:33] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:15:33] [PASSED] YVU420 Normal sizes
[11:15:33] [PASSED] YVU420 Max sizes
[11:15:33] [PASSED] YVU420 Invalid pitch
[11:15:33] [PASSED] YVU420 Different pitches
[11:15:33] [PASSED] YVU420 Different buffer offsets/pitches
[11:15:33] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:15:33] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:15:33] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:15:33] [PASSED] YVU420 Valid modifier
[11:15:33] [PASSED] YVU420 Different modifiers per plane
[11:15:33] [PASSED] YVU420 Modifier for inexistent plane
[11:15:33] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[11:15:33] [PASSED] X0L2 Normal sizes
[11:15:33] [PASSED] X0L2 Max sizes
[11:15:33] [PASSED] X0L2 Invalid pitch
[11:15:33] [PASSED] X0L2 Pitch greater than minimum required
[11:15:33] [PASSED] X0L2 Handle for inexistent plane
[11:15:33] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:15:33] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:15:33] [PASSED] X0L2 Valid modifier
[11:15:33] [PASSED] X0L2 Modifier for inexistent plane
[11:15:33] =========== [PASSED] drm_test_framebuffer_create ===========
[11:15:33] [PASSED] drm_test_framebuffer_free
[11:15:33] [PASSED] drm_test_framebuffer_init
[11:15:33] [PASSED] drm_test_framebuffer_init_bad_format
[11:15:33] [PASSED] drm_test_framebuffer_init_dev_mismatch
[11:15:33] [PASSED] drm_test_framebuffer_lookup
[11:15:33] [PASSED] drm_test_framebuffer_lookup_inexistent
[11:15:33] [PASSED] drm_test_framebuffer_modifiers_not_supported
[11:15:33] ================= [PASSED] drm_framebuffer =================
[11:15:33] ================ drm_gem_shmem (8 subtests) ================
[11:15:33] [PASSED] drm_gem_shmem_test_obj_create
[11:15:33] [PASSED] drm_gem_shmem_test_obj_create_private
[11:15:33] [PASSED] drm_gem_shmem_test_pin_pages
[11:15:33] [PASSED] drm_gem_shmem_test_vmap
[11:15:33] [PASSED] drm_gem_shmem_test_get_sg_table
[11:15:33] [PASSED] drm_gem_shmem_test_get_pages_sgt
[11:15:33] [PASSED] drm_gem_shmem_test_madvise
[11:15:33] [PASSED] drm_gem_shmem_test_purge
[11:15:33] ================== [PASSED] drm_gem_shmem ==================
[11:15:33] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[11:15:33] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[11:15:33] [PASSED] Automatic
[11:15:33] [PASSED] Full
[11:15:33] [PASSED] Limited 16:235
[11:15:33] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[11:15:33] [PASSED] drm_test_check_disable_connector
[11:15:33] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[11:15:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[11:15:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[11:15:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[11:15:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[11:15:33] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[11:15:33] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[11:15:33] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[11:15:33] [PASSED] drm_test_check_output_bpc_dvi
[11:15:33] [PASSED] drm_test_check_output_bpc_format_vic_1
[11:15:33] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[11:15:33] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[11:15:33] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[11:15:33] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[11:15:33] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[11:15:33] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[11:15:33] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[11:15:33] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[11:15:33] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[11:15:33] [PASSED] drm_test_check_broadcast_rgb_value
[11:15:33] [PASSED] drm_test_check_bpc_8_value
[11:15:33] [PASSED] drm_test_check_bpc_10_value
[11:15:33] [PASSED] drm_test_check_bpc_12_value
[11:15:33] [PASSED] drm_test_check_format_value
[11:15:33] [PASSED] drm_test_check_tmds_char_value
[11:15:33] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[11:15:33] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[11:15:33] [PASSED] drm_test_check_mode_valid
[11:15:33] [PASSED] drm_test_check_mode_valid_reject
[11:15:33] [PASSED] drm_test_check_mode_valid_reject_rate
[11:15:33] [PASSED] drm_test_check_mode_valid_reject_max_clock
[11:15:33] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[11:15:33] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[11:15:33] [PASSED] drm_test_check_infoframes
[11:15:33] [PASSED] drm_test_check_reject_avi_infoframe
[11:15:33] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[11:15:33] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[11:15:33] [PASSED] drm_test_check_reject_audio_infoframe
[11:15:33] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[11:15:33] ================= drm_managed (2 subtests) =================
[11:15:33] [PASSED] drm_test_managed_release_action
[11:15:33] [PASSED] drm_test_managed_run_action
[11:15:33] =================== [PASSED] drm_managed ===================
[11:15:33] =================== drm_mm (6 subtests) ====================
[11:15:33] [PASSED] drm_test_mm_init
[11:15:33] [PASSED] drm_test_mm_debug
[11:15:33] [PASSED] drm_test_mm_align32
[11:15:33] [PASSED] drm_test_mm_align64
[11:15:33] [PASSED] drm_test_mm_lowest
[11:15:33] [PASSED] drm_test_mm_highest
[11:15:33] ===================== [PASSED] drm_mm ======================
[11:15:33] ============= drm_modes_analog_tv (5 subtests) =============
[11:15:33] [PASSED] drm_test_modes_analog_tv_mono_576i
[11:15:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:15:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:15:33] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:15:33] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:15:33] =============== [PASSED] drm_modes_analog_tv ===============
[11:15:33] ============== drm_plane_helper (2 subtests) ===============
[11:15:33] =============== drm_test_check_plane_state  ================
[11:15:33] [PASSED] clipping_simple
[11:15:33] [PASSED] clipping_rotate_reflect
[11:15:33] [PASSED] positioning_simple
[11:15:33] [PASSED] upscaling
[11:15:33] [PASSED] downscaling
[11:15:33] [PASSED] rounding1
[11:15:33] [PASSED] rounding2
[11:15:33] [PASSED] rounding3
[11:15:33] [PASSED] rounding4
[11:15:33] =========== [PASSED] drm_test_check_plane_state ============
[11:15:33] =========== drm_test_check_invalid_plane_state  ============
[11:15:33] [PASSED] positioning_invalid
[11:15:33] [PASSED] upscaling_invalid
[11:15:33] [PASSED] downscaling_invalid
[11:15:33] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:15:33] ================ [PASSED] drm_plane_helper =================
[11:15:33] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[11:15:33] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:15:33] [PASSED] None
[11:15:33] [PASSED] PAL
[11:15:33] [PASSED] NTSC
[11:15:33] [PASSED] Both, NTSC Default
[11:15:33] [PASSED] Both, PAL Default
[11:15:33] [PASSED] Both, NTSC Default, with PAL on command-line
[11:15:33] [PASSED] Both, PAL Default, with NTSC on command-line
[11:15:33] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:15:33] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:15:33] ================== drm_rect (9 subtests) ===================
[11:15:33] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:15:33] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:15:33] [PASSED] drm_test_rect_clip_scaled_clipped
[11:15:33] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:15:33] ================= drm_test_rect_intersect  =================
[11:15:33] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[11:15:33] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[11:15:33] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[11:15:33] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[11:15:33] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[11:15:33] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[11:15:33] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[11:15:33] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[11:15:33] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[11:15:33] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[11:15:33] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[11:15:33] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[11:15:33] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[11:15:33] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[11:15:33] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[11:15:33] ============= [PASSED] drm_test_rect_intersect =============
[11:15:33] ================ drm_test_rect_calc_hscale  ================
[11:15:33] [PASSED] normal use
[11:15:33] [PASSED] out of max range
[11:15:33] [PASSED] out of min range
[11:15:33] [PASSED] zero dst
[11:15:33] [PASSED] negative src
[11:15:33] [PASSED] negative dst
[11:15:33] ============ [PASSED] drm_test_rect_calc_hscale ============
[11:15:33] ================ drm_test_rect_calc_vscale  ================
[11:15:33] [PASSED] normal use
[11:15:33] [PASSED] out of max range
[11:15:33] [PASSED] out of min range
[11:15:33] [PASSED] zero dst
[11:15:33] [PASSED] negative src
[11:15:33] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[11:15:33] ============ [PASSED] drm_test_rect_calc_vscale ============
[11:15:33] ================== drm_test_rect_rotate  ===================
[11:15:33] [PASSED] reflect-x
[11:15:33] [PASSED] reflect-y
[11:15:33] [PASSED] rotate-0
[11:15:33] [PASSED] rotate-90
[11:15:33] [PASSED] rotate-180
[11:15:33] [PASSED] rotate-270
[11:15:33] ============== [PASSED] drm_test_rect_rotate ===============
[11:15:33] ================ drm_test_rect_rotate_inv  =================
[11:15:33] [PASSED] reflect-x
[11:15:33] [PASSED] reflect-y
[11:15:33] [PASSED] rotate-0
[11:15:33] [PASSED] rotate-90
[11:15:33] [PASSED] rotate-180
[11:15:33] [PASSED] rotate-270
[11:15:33] ============ [PASSED] drm_test_rect_rotate_inv =============
[11:15:33] ==================== [PASSED] drm_rect =====================
[11:15:33] ============ drm_sysfb_modeset_test (1 subtest) ============
[11:15:33] ============ drm_test_sysfb_build_fourcc_list  =============
[11:15:33] [PASSED] no native formats
[11:15:33] [PASSED] XRGB8888 as native format
[11:15:33] [PASSED] remove duplicates
[11:15:33] [PASSED] convert alpha formats
[11:15:33] [PASSED] random formats
[11:15:33] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[11:15:33] ============= [PASSED] drm_sysfb_modeset_test ==============
[11:15:33] ================== drm_fixp (2 subtests) ===================
[11:15:33] [PASSED] drm_test_int2fixp
[11:15:33] [PASSED] drm_test_sm2fixp
[11:15:33] ==================== [PASSED] drm_fixp =====================
[11:15:33] ============================================================
[11:15:33] Testing complete. Ran 621 tests: passed: 621
[11:15:33] Elapsed time: 26.045s total, 1.734s configuring, 24.142s building, 0.134s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[11:15:33] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:15:34] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[11:15:44] Starting KUnit Kernel (1/1)...
[11:15:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:15:44] ================= ttm_device (5 subtests) ==================
[11:15:44] [PASSED] ttm_device_init_basic
[11:15:44] [PASSED] ttm_device_init_multiple
[11:15:44] [PASSED] ttm_device_fini_basic
[11:15:44] [PASSED] ttm_device_init_no_vma_man
[11:15:44] ================== ttm_device_init_pools  ==================
[11:15:44] [PASSED] No DMA allocations, no DMA32 required
[11:15:44] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[11:15:44] Expected !list_lru_count(&pt.pages) to be false, but is true
[11:15:44] [FAILED] DMA allocations, DMA32 required
[11:15:44] [PASSED] No DMA allocations, DMA32 required
[11:15:44]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[11:15:44]     Expected !list_lru_count(&pt.pages) to be false, but is true
[11:15:44] ------------[ cut here ]------------
[11:15:44] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[11:15:44] refcount_t: underflow; use-after-free.
[11:15:44] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g2c06d757b64f #3 VOLUNTARY
[11:15:44] Tainted: [W]=WARN, [N]=TEST
[11:15:44] Stack:
[11:15:44]  6044ed8b 00000000 00000000 00000001
[11:15:44]  ffffff00 6044ed8b 6032367a 00000009
[11:15:44]  0000001c 60043e88 6002381c c90cbd40
[11:15:44] Call Trace:
[11:15:44]  [<6032367a>] ? devres_release_all+0xaa/0x100
[11:15:44]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[11:15:44]  [<6002381c>] ? _printk+0x0/0x65
[11:15:44]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[11:15:44]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[11:15:44]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[11:15:44]  [<60052e36>] ? um_set_signals+0x36/0x60
[11:15:44]  [<600c5a42>] ? call_rcu+0x52/0x90
[11:15:44]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[11:15:44]  [<60147f50>] ? kfree+0x0/0x250
[11:15:44]  [<6032367a>] ? devres_release_all+0xaa/0x100
[11:15:44]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[11:15:44]  [<6031c3c0>] ? bus_notify+0x0/0x60
[11:15:44]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[11:15:44]  [<60398620>] ? mutex_lock+0x0/0x40
[11:15:44]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[11:15:44]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[11:15:44]  [<60372210>] ? kobject_put+0x0/0x150
[11:15:44]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[11:15:44]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[11:15:44]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[11:15:44]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[11:15:44]  [<60315a8c>] ? device_del+0x1bc/0x600
[11:15:44]  [<60052e00>] ? um_set_signals+0x0/0x60
[11:15:44]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[11:15:44]  [<60052e00>] ? um_set_signals+0x0/0x60
[11:15:44]  [<60315ee4>] ? device_unregister+0x14/0x40
[11:15:44]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[11:15:44]  [<60257d70>] ? kunit_release_action+0x0/0x170
[11:15:44]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[11:15:44]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[11:15:44]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[11:15:44]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[11:15:44]  [<60081e36>] ? kthread+0xe6/0x150
[11:15:44]  [<60046435>] ? new_thread_handler+0x45/0x60
[11:15:44] ---[ end trace 0000000000000000 ]---
[11:15:44] [FAILED] DMA allocations, no DMA32 required
[11:15:44] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[11:15:44] ============== [FAILED] ttm_device_init_pools ==============
[11:15:44]     # module: ttm_device_test
[11:15:44] # ttm_device: pass:4 fail:1 skip:0 total:5
[11:15:44] # Totals: pass:6 fail:2 skip:0 total:8
[11:15:44] =================== [FAILED] ttm_device ====================
[11:15:44] ================== ttm_pool (8 subtests) ===================
[11:15:44] ================== ttm_pool_alloc_basic  ===================
[11:15:44] [PASSED] One page
[11:15:44] [PASSED] More than one page
[11:15:44] [PASSED] Above the allocation limit
[11:15:44] [PASSED] One page, with coherent DMA mappings enabled
[11:15:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[11:15:44] ============== [PASSED] ttm_pool_alloc_basic ===============
[11:15:44] ============== ttm_pool_alloc_basic_dma_addr  ==============
[11:15:44] [PASSED] One page
[11:15:44] [PASSED] More than one page
[11:15:44] [PASSED] Above the allocation limit
[11:15:44] [PASSED] One page, with coherent DMA mappings enabled
[11:15:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[11:15:44] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[11:15:44] [PASSED] ttm_pool_alloc_order_caching_match
[11:15:44] [PASSED] ttm_pool_alloc_caching_mismatch
[11:15:44] [PASSED] ttm_pool_alloc_order_mismatch
[11:15:44] [PASSED] ttm_pool_free_dma_alloc
[11:15:44] [ERROR] Test: ttm_pool: missing expected subtest!
[11:15:44] 
[11:15:44] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g2c06d757b64f
[11:15:44] RIP: 0033:list_lru_count_node+0xe/0x20
[11:15:44] RSP: 00000000c90cbed8  EFLAGS: 00010246
[11:15:44] RAX: 0000000000000000 RBX: 00000000c9003c90 RCX: 000000008924c7d8
[11:15:44] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000089086880
[11:15:44] RBP: 0000000089086800 R08: 00000000c7c1ec28 R09: 0000000089050c80
[11:15:44] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000089050c80
[11:15:44] R13: 0000000060440770 R14: 000000006010eb50 R15: 0000000089086880
[11:15:44] Kernel panic - not syncing: Segfault with no mm
[11:15:44] [CRASHED] 
[11:15:44] [ERROR] Test: ttm_pool: missing expected subtest!
[11:15:44] [CRASHED] 
[11:15:44] [ERROR] Test: ttm_pool: missing subtest result line!
[11:15:44] # module: ttm_pool_test
[11:15:44] ==================== [CRASHED] ttm_pool ====================
[11:15:44] [ERROR] Test: main: missing expected subtest!
[11:15:44] [CRASHED] 
[11:15:44] [ERROR] Test: main: missing expected subtest!
[11:15:44] [CRASHED] 
[11:15:44] [ERROR] Test: main: missing expected subtest!
[11:15:44] [CRASHED] 
[11:15:44] [ERROR] Test: main: missing expected subtest!
[11:15:44] [CRASHED] 
[11:15:44] ============================================================
[11:15:44] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[11:15:44] Elapsed time: 11.374s total, 1.728s configuring, 9.379s building, 0.267s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


