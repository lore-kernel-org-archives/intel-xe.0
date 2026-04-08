Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0209AFD5F98
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3F210E59C;
	Wed,  8 Apr 2026 08:52:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4810810E59A;
 Wed,  8 Apr 2026 08:52:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/i915/dp=3A_Clear_accumulat?=
 =?utf-8?q?ed_HPD_events_after_link_training?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 08:52:54 -0000
Message-ID: <177563837427.440727.9285103559539882469@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408084509.555045-1-acelan.kao@canonical.com>
In-Reply-To: <20260408084509.555045-1-acelan.kao@canonical.com>
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

Series: drm/i915/dp: Clear accumulated HPD events after link training
URL   : https://patchwork.freedesktop.org/series/164509/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:51:36] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:51:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:52:11] Starting KUnit Kernel (1/1)...
[08:52:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:52:12] ================== guc_buf (11 subtests) ===================
[08:52:12] [PASSED] test_smallest
[08:52:12] [PASSED] test_largest
[08:52:12] [PASSED] test_granular
[08:52:12] [PASSED] test_unique
[08:52:12] [PASSED] test_overlap
[08:52:12] [PASSED] test_reusable
[08:52:12] [PASSED] test_too_big
[08:52:12] [PASSED] test_flush
[08:52:12] [PASSED] test_lookup
[08:52:12] [PASSED] test_data
[08:52:12] [PASSED] test_class
[08:52:12] ===================== [PASSED] guc_buf =====================
[08:52:12] =================== guc_dbm (7 subtests) ===================
[08:52:12] [PASSED] test_empty
[08:52:12] [PASSED] test_default
[08:52:12] ======================== test_size  ========================
[08:52:12] [PASSED] 4
[08:52:12] [PASSED] 8
[08:52:12] [PASSED] 32
[08:52:12] [PASSED] 256
[08:52:12] ==================== [PASSED] test_size ====================
[08:52:12] ======================= test_reuse  ========================
[08:52:12] [PASSED] 4
[08:52:12] [PASSED] 8
[08:52:12] [PASSED] 32
[08:52:12] [PASSED] 256
[08:52:12] =================== [PASSED] test_reuse ====================
[08:52:12] =================== test_range_overlap  ====================
[08:52:12] [PASSED] 4
[08:52:12] [PASSED] 8
[08:52:12] [PASSED] 32
[08:52:12] [PASSED] 256
[08:52:12] =============== [PASSED] test_range_overlap ================
[08:52:12] =================== test_range_compact  ====================
[08:52:12] [PASSED] 4
[08:52:12] [PASSED] 8
[08:52:12] [PASSED] 32
[08:52:12] [PASSED] 256
[08:52:12] =============== [PASSED] test_range_compact ================
[08:52:12] ==================== test_range_spare  =====================
[08:52:12] [PASSED] 4
[08:52:12] [PASSED] 8
[08:52:12] [PASSED] 32
[08:52:12] [PASSED] 256
[08:52:12] ================ [PASSED] test_range_spare =================
[08:52:12] ===================== [PASSED] guc_dbm =====================
[08:52:12] =================== guc_idm (6 subtests) ===================
[08:52:12] [PASSED] bad_init
[08:52:12] [PASSED] no_init
[08:52:12] [PASSED] init_fini
[08:52:12] [PASSED] check_used
[08:52:12] [PASSED] check_quota
[08:52:12] [PASSED] check_all
[08:52:12] ===================== [PASSED] guc_idm =====================
[08:52:12] ================== no_relay (3 subtests) ===================
[08:52:12] [PASSED] xe_drops_guc2pf_if_not_ready
[08:52:12] [PASSED] xe_drops_guc2vf_if_not_ready
[08:52:12] [PASSED] xe_rejects_send_if_not_ready
[08:52:12] ==================== [PASSED] no_relay =====================
[08:52:12] ================== pf_relay (14 subtests) ==================
[08:52:12] [PASSED] pf_rejects_guc2pf_too_short
[08:52:12] [PASSED] pf_rejects_guc2pf_too_long
[08:52:12] [PASSED] pf_rejects_guc2pf_no_payload
[08:52:12] [PASSED] pf_fails_no_payload
[08:52:12] [PASSED] pf_fails_bad_origin
[08:52:12] [PASSED] pf_fails_bad_type
[08:52:12] [PASSED] pf_txn_reports_error
[08:52:12] [PASSED] pf_txn_sends_pf2guc
[08:52:12] [PASSED] pf_sends_pf2guc
[08:52:12] [SKIPPED] pf_loopback_nop
[08:52:12] [SKIPPED] pf_loopback_echo
[08:52:12] [SKIPPED] pf_loopback_fail
[08:52:12] [SKIPPED] pf_loopback_busy
[08:52:12] [SKIPPED] pf_loopback_retry
[08:52:12] ==================== [PASSED] pf_relay =====================
[08:52:12] ================== vf_relay (3 subtests) ===================
[08:52:12] [PASSED] vf_rejects_guc2vf_too_short
[08:52:12] [PASSED] vf_rejects_guc2vf_too_long
[08:52:12] [PASSED] vf_rejects_guc2vf_no_payload
[08:52:12] ==================== [PASSED] vf_relay =====================
[08:52:12] ================ pf_gt_config (9 subtests) =================
[08:52:12] [PASSED] fair_contexts_1vf
[08:52:12] [PASSED] fair_doorbells_1vf
[08:52:12] [PASSED] fair_ggtt_1vf
[08:52:12] ====================== fair_vram_1vf  ======================
[08:52:12] [PASSED] 3.50 GiB
[08:52:12] [PASSED] 11.5 GiB
[08:52:12] [PASSED] 15.5 GiB
[08:52:12] [PASSED] 31.5 GiB
[08:52:12] [PASSED] 63.5 GiB
[08:52:12] [PASSED] 1.91 GiB
[08:52:12] ================== [PASSED] fair_vram_1vf ==================
[08:52:12] ================ fair_vram_1vf_admin_only  =================
[08:52:12] [PASSED] 3.50 GiB
[08:52:12] [PASSED] 11.5 GiB
[08:52:12] [PASSED] 15.5 GiB
[08:52:12] [PASSED] 31.5 GiB
[08:52:12] [PASSED] 63.5 GiB
[08:52:12] [PASSED] 1.91 GiB
[08:52:12] ============ [PASSED] fair_vram_1vf_admin_only =============
[08:52:12] ====================== fair_contexts  ======================
[08:52:12] [PASSED] 1 VF
[08:52:12] [PASSED] 2 VFs
[08:52:12] [PASSED] 3 VFs
[08:52:12] [PASSED] 4 VFs
[08:52:12] [PASSED] 5 VFs
[08:52:12] [PASSED] 6 VFs
[08:52:12] [PASSED] 7 VFs
[08:52:12] [PASSED] 8 VFs
[08:52:12] [PASSED] 9 VFs
[08:52:12] [PASSED] 10 VFs
[08:52:12] [PASSED] 11 VFs
[08:52:12] [PASSED] 12 VFs
[08:52:12] [PASSED] 13 VFs
[08:52:12] [PASSED] 14 VFs
[08:52:12] [PASSED] 15 VFs
[08:52:12] [PASSED] 16 VFs
[08:52:12] [PASSED] 17 VFs
[08:52:12] [PASSED] 18 VFs
[08:52:12] [PASSED] 19 VFs
[08:52:12] [PASSED] 20 VFs
[08:52:12] [PASSED] 21 VFs
[08:52:12] [PASSED] 22 VFs
[08:52:12] [PASSED] 23 VFs
[08:52:12] [PASSED] 24 VFs
[08:52:12] [PASSED] 25 VFs
[08:52:12] [PASSED] 26 VFs
[08:52:12] [PASSED] 27 VFs
[08:52:12] [PASSED] 28 VFs
[08:52:12] [PASSED] 29 VFs
[08:52:12] [PASSED] 30 VFs
[08:52:12] [PASSED] 31 VFs
[08:52:12] [PASSED] 32 VFs
[08:52:12] [PASSED] 33 VFs
[08:52:12] [PASSED] 34 VFs
[08:52:12] [PASSED] 35 VFs
[08:52:12] [PASSED] 36 VFs
[08:52:12] [PASSED] 37 VFs
[08:52:12] [PASSED] 38 VFs
[08:52:12] [PASSED] 39 VFs
[08:52:12] [PASSED] 40 VFs
[08:52:12] [PASSED] 41 VFs
[08:52:12] [PASSED] 42 VFs
[08:52:12] [PASSED] 43 VFs
[08:52:12] [PASSED] 44 VFs
[08:52:12] [PASSED] 45 VFs
[08:52:12] [PASSED] 46 VFs
[08:52:12] [PASSED] 47 VFs
[08:52:12] [PASSED] 48 VFs
[08:52:12] [PASSED] 49 VFs
[08:52:12] [PASSED] 50 VFs
[08:52:12] [PASSED] 51 VFs
[08:52:12] [PASSED] 52 VFs
[08:52:12] [PASSED] 53 VFs
[08:52:12] [PASSED] 54 VFs
[08:52:12] [PASSED] 55 VFs
[08:52:12] [PASSED] 56 VFs
[08:52:12] [PASSED] 57 VFs
[08:52:12] [PASSED] 58 VFs
[08:52:12] [PASSED] 59 VFs
[08:52:12] [PASSED] 60 VFs
[08:52:12] [PASSED] 61 VFs
[08:52:12] [PASSED] 62 VFs
[08:52:12] [PASSED] 63 VFs
[08:52:12] ================== [PASSED] fair_contexts ==================
[08:52:12] ===================== fair_doorbells  ======================
[08:52:12] [PASSED] 1 VF
[08:52:12] [PASSED] 2 VFs
[08:52:12] [PASSED] 3 VFs
[08:52:12] [PASSED] 4 VFs
[08:52:12] [PASSED] 5 VFs
[08:52:12] [PASSED] 6 VFs
[08:52:12] [PASSED] 7 VFs
[08:52:12] [PASSED] 8 VFs
[08:52:12] [PASSED] 9 VFs
[08:52:12] [PASSED] 10 VFs
[08:52:12] [PASSED] 11 VFs
[08:52:12] [PASSED] 12 VFs
[08:52:12] [PASSED] 13 VFs
[08:52:12] [PASSED] 14 VFs
[08:52:12] [PASSED] 15 VFs
[08:52:12] [PASSED] 16 VFs
[08:52:12] [PASSED] 17 VFs
[08:52:12] [PASSED] 18 VFs
[08:52:12] [PASSED] 19 VFs
[08:52:12] [PASSED] 20 VFs
[08:52:12] [PASSED] 21 VFs
[08:52:12] [PASSED] 22 VFs
[08:52:12] [PASSED] 23 VFs
[08:52:12] [PASSED] 24 VFs
[08:52:12] [PASSED] 25 VFs
[08:52:12] [PASSED] 26 VFs
[08:52:12] [PASSED] 27 VFs
[08:52:12] [PASSED] 28 VFs
[08:52:12] [PASSED] 29 VFs
[08:52:12] [PASSED] 30 VFs
[08:52:12] [PASSED] 31 VFs
[08:52:12] [PASSED] 32 VFs
[08:52:12] [PASSED] 33 VFs
[08:52:12] [PASSED] 34 VFs
[08:52:12] [PASSED] 35 VFs
[08:52:12] [PASSED] 36 VFs
[08:52:12] [PASSED] 37 VFs
[08:52:12] [PASSED] 38 VFs
[08:52:12] [PASSED] 39 VFs
[08:52:12] [PASSED] 40 VFs
[08:52:12] [PASSED] 41 VFs
[08:52:12] [PASSED] 42 VFs
[08:52:12] [PASSED] 43 VFs
[08:52:12] [PASSED] 44 VFs
[08:52:12] [PASSED] 45 VFs
[08:52:12] [PASSED] 46 VFs
[08:52:12] [PASSED] 47 VFs
[08:52:12] [PASSED] 48 VFs
[08:52:12] [PASSED] 49 VFs
[08:52:12] [PASSED] 50 VFs
[08:52:12] [PASSED] 51 VFs
[08:52:12] [PASSED] 52 VFs
[08:52:12] [PASSED] 53 VFs
[08:52:12] [PASSED] 54 VFs
[08:52:12] [PASSED] 55 VFs
[08:52:12] [PASSED] 56 VFs
[08:52:12] [PASSED] 57 VFs
[08:52:12] [PASSED] 58 VFs
[08:52:12] [PASSED] 59 VFs
[08:52:12] [PASSED] 60 VFs
[08:52:12] [PASSED] 61 VFs
[08:52:12] [PASSED] 62 VFs
[08:52:12] [PASSED] 63 VFs
[08:52:12] ================= [PASSED] fair_doorbells ==================
[08:52:12] ======================== fair_ggtt  ========================
[08:52:12] [PASSED] 1 VF
[08:52:12] [PASSED] 2 VFs
[08:52:12] [PASSED] 3 VFs
[08:52:12] [PASSED] 4 VFs
[08:52:12] [PASSED] 5 VFs
[08:52:12] [PASSED] 6 VFs
[08:52:12] [PASSED] 7 VFs
[08:52:12] [PASSED] 8 VFs
[08:52:12] [PASSED] 9 VFs
[08:52:12] [PASSED] 10 VFs
[08:52:12] [PASSED] 11 VFs
[08:52:12] [PASSED] 12 VFs
[08:52:12] [PASSED] 13 VFs
[08:52:12] [PASSED] 14 VFs
[08:52:12] [PASSED] 15 VFs
[08:52:12] [PASSED] 16 VFs
[08:52:12] [PASSED] 17 VFs
[08:52:12] [PASSED] 18 VFs
[08:52:12] [PASSED] 19 VFs
[08:52:12] [PASSED] 20 VFs
[08:52:12] [PASSED] 21 VFs
[08:52:12] [PASSED] 22 VFs
[08:52:12] [PASSED] 23 VFs
[08:52:12] [PASSED] 24 VFs
[08:52:12] [PASSED] 25 VFs
[08:52:12] [PASSED] 26 VFs
[08:52:12] [PASSED] 27 VFs
[08:52:12] [PASSED] 28 VFs
[08:52:12] [PASSED] 29 VFs
[08:52:12] [PASSED] 30 VFs
[08:52:12] [PASSED] 31 VFs
[08:52:12] [PASSED] 32 VFs
[08:52:12] [PASSED] 33 VFs
[08:52:12] [PASSED] 34 VFs
[08:52:12] [PASSED] 35 VFs
[08:52:12] [PASSED] 36 VFs
[08:52:12] [PASSED] 37 VFs
[08:52:12] [PASSED] 38 VFs
[08:52:12] [PASSED] 39 VFs
[08:52:12] [PASSED] 40 VFs
[08:52:12] [PASSED] 41 VFs
[08:52:12] [PASSED] 42 VFs
[08:52:12] [PASSED] 43 VFs
[08:52:12] [PASSED] 44 VFs
[08:52:12] [PASSED] 45 VFs
[08:52:12] [PASSED] 46 VFs
[08:52:12] [PASSED] 47 VFs
[08:52:12] [PASSED] 48 VFs
[08:52:12] [PASSED] 49 VFs
[08:52:12] [PASSED] 50 VFs
[08:52:12] [PASSED] 51 VFs
[08:52:12] [PASSED] 52 VFs
[08:52:12] [PASSED] 53 VFs
[08:52:12] [PASSED] 54 VFs
[08:52:12] [PASSED] 55 VFs
[08:52:12] [PASSED] 56 VFs
[08:52:12] [PASSED] 57 VFs
[08:52:12] [PASSED] 58 VFs
[08:52:12] [PASSED] 59 VFs
[08:52:12] [PASSED] 60 VFs
[08:52:12] [PASSED] 61 VFs
[08:52:12] [PASSED] 62 VFs
[08:52:12] [PASSED] 63 VFs
[08:52:12] ==================== [PASSED] fair_ggtt ====================
[08:52:12] ======================== fair_vram  ========================
[08:52:12] [PASSED] 1 VF
[08:52:12] [PASSED] 2 VFs
[08:52:12] [PASSED] 3 VFs
[08:52:12] [PASSED] 4 VFs
[08:52:12] [PASSED] 5 VFs
[08:52:12] [PASSED] 6 VFs
[08:52:12] [PASSED] 7 VFs
[08:52:12] [PASSED] 8 VFs
[08:52:12] [PASSED] 9 VFs
[08:52:12] [PASSED] 10 VFs
[08:52:12] [PASSED] 11 VFs
[08:52:12] [PASSED] 12 VFs
[08:52:12] [PASSED] 13 VFs
[08:52:12] [PASSED] 14 VFs
[08:52:12] [PASSED] 15 VFs
[08:52:12] [PASSED] 16 VFs
[08:52:12] [PASSED] 17 VFs
[08:52:12] [PASSED] 18 VFs
[08:52:12] [PASSED] 19 VFs
[08:52:12] [PASSED] 20 VFs
[08:52:12] [PASSED] 21 VFs
[08:52:12] [PASSED] 22 VFs
[08:52:12] [PASSED] 23 VFs
[08:52:12] [PASSED] 24 VFs
[08:52:12] [PASSED] 25 VFs
[08:52:12] [PASSED] 26 VFs
[08:52:12] [PASSED] 27 VFs
[08:52:12] [PASSED] 28 VFs
[08:52:12] [PASSED] 29 VFs
[08:52:12] [PASSED] 30 VFs
[08:52:12] [PASSED] 31 VFs
[08:52:12] [PASSED] 32 VFs
[08:52:12] [PASSED] 33 VFs
[08:52:12] [PASSED] 34 VFs
[08:52:12] [PASSED] 35 VFs
[08:52:12] [PASSED] 36 VFs
[08:52:12] [PASSED] 37 VFs
[08:52:12] [PASSED] 38 VFs
[08:52:12] [PASSED] 39 VFs
[08:52:12] [PASSED] 40 VFs
[08:52:12] [PASSED] 41 VFs
[08:52:12] [PASSED] 42 VFs
[08:52:12] [PASSED] 43 VFs
[08:52:12] [PASSED] 44 VFs
[08:52:12] [PASSED] 45 VFs
[08:52:12] [PASSED] 46 VFs
[08:52:12] [PASSED] 47 VFs
[08:52:12] [PASSED] 48 VFs
[08:52:12] [PASSED] 49 VFs
[08:52:12] [PASSED] 50 VFs
[08:52:12] [PASSED] 51 VFs
[08:52:12] [PASSED] 52 VFs
[08:52:12] [PASSED] 53 VFs
[08:52:12] [PASSED] 54 VFs
[08:52:12] [PASSED] 55 VFs
[08:52:12] [PASSED] 56 VFs
[08:52:12] [PASSED] 57 VFs
[08:52:12] [PASSED] 58 VFs
[08:52:12] [PASSED] 59 VFs
[08:52:12] [PASSED] 60 VFs
[08:52:12] [PASSED] 61 VFs
[08:52:12] [PASSED] 62 VFs
[08:52:12] [PASSED] 63 VFs
[08:52:12] ==================== [PASSED] fair_vram ====================
[08:52:12] ================== [PASSED] pf_gt_config ===================
[08:52:12] ===================== lmtt (1 subtest) =====================
[08:52:12] ======================== test_ops  =========================
[08:52:12] [PASSED] 2-level
[08:52:12] [PASSED] multi-level
[08:52:12] ==================== [PASSED] test_ops =====================
[08:52:12] ====================== [PASSED] lmtt =======================
[08:52:12] ================= pf_service (11 subtests) =================
[08:52:12] [PASSED] pf_negotiate_any
[08:52:12] [PASSED] pf_negotiate_base_match
[08:52:12] [PASSED] pf_negotiate_base_newer
[08:52:12] [PASSED] pf_negotiate_base_next
[08:52:12] [SKIPPED] pf_negotiate_base_older
[08:52:12] [PASSED] pf_negotiate_base_prev
[08:52:12] [PASSED] pf_negotiate_latest_match
[08:52:12] [PASSED] pf_negotiate_latest_newer
[08:52:12] [PASSED] pf_negotiate_latest_next
[08:52:12] [SKIPPED] pf_negotiate_latest_older
[08:52:12] [SKIPPED] pf_negotiate_latest_prev
[08:52:12] =================== [PASSED] pf_service ====================
[08:52:12] ================= xe_guc_g2g (2 subtests) ==================
[08:52:12] ============== xe_live_guc_g2g_kunit_default  ==============
[08:52:12] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[08:52:12] ============== xe_live_guc_g2g_kunit_allmem  ===============
[08:52:12] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[08:52:12] =================== [SKIPPED] xe_guc_g2g ===================
[08:52:12] =================== xe_mocs (2 subtests) ===================
[08:52:12] ================ xe_live_mocs_kernel_kunit  ================
[08:52:12] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[08:52:12] ================ xe_live_mocs_reset_kunit  =================
[08:52:12] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[08:52:12] ==================== [SKIPPED] xe_mocs =====================
[08:52:12] ================= xe_migrate (2 subtests) ==================
[08:52:12] ================= xe_migrate_sanity_kunit  =================
[08:52:12] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[08:52:12] ================== xe_validate_ccs_kunit  ==================
[08:52:12] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[08:52:12] =================== [SKIPPED] xe_migrate ===================
[08:52:12] ================== xe_dma_buf (1 subtest) ==================
[08:52:12] ==================== xe_dma_buf_kunit  =====================
[08:52:12] ================ [SKIPPED] xe_dma_buf_kunit ================
[08:52:12] =================== [SKIPPED] xe_dma_buf ===================
[08:52:12] ================= xe_bo_shrink (1 subtest) =================
[08:52:12] =================== xe_bo_shrink_kunit  ====================
[08:52:12] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[08:52:12] ================== [SKIPPED] xe_bo_shrink ==================
[08:52:12] ==================== xe_bo (2 subtests) ====================
[08:52:12] ================== xe_ccs_migrate_kunit  ===================
[08:52:12] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[08:52:12] ==================== xe_bo_evict_kunit  ====================
[08:52:12] =============== [SKIPPED] xe_bo_evict_kunit ================
[08:52:12] ===================== [SKIPPED] xe_bo ======================
[08:52:12] ==================== args (13 subtests) ====================
[08:52:12] [PASSED] count_args_test
[08:52:12] [PASSED] call_args_example
[08:52:12] [PASSED] call_args_test
[08:52:12] [PASSED] drop_first_arg_example
[08:52:12] [PASSED] drop_first_arg_test
[08:52:12] [PASSED] first_arg_example
[08:52:12] [PASSED] first_arg_test
[08:52:12] [PASSED] last_arg_example
[08:52:12] [PASSED] last_arg_test
[08:52:12] [PASSED] pick_arg_example
[08:52:12] [PASSED] if_args_example
[08:52:12] [PASSED] if_args_test
[08:52:12] [PASSED] sep_comma_example
[08:52:12] ====================== [PASSED] args =======================
[08:52:12] =================== xe_pci (3 subtests) ====================
[08:52:12] ==================== check_graphics_ip  ====================
[08:52:12] [PASSED] 12.00 Xe_LP
[08:52:12] [PASSED] 12.10 Xe_LP+
[08:52:12] [PASSED] 12.55 Xe_HPG
[08:52:12] [PASSED] 12.60 Xe_HPC
[08:52:12] [PASSED] 12.70 Xe_LPG
[08:52:12] [PASSED] 12.71 Xe_LPG
[08:52:12] [PASSED] 12.74 Xe_LPG+
[08:52:12] [PASSED] 20.01 Xe2_HPG
[08:52:12] [PASSED] 20.02 Xe2_HPG
[08:52:12] [PASSED] 20.04 Xe2_LPG
[08:52:12] [PASSED] 30.00 Xe3_LPG
[08:52:12] [PASSED] 30.01 Xe3_LPG
[08:52:12] [PASSED] 30.03 Xe3_LPG
[08:52:12] [PASSED] 30.04 Xe3_LPG
[08:52:12] [PASSED] 30.05 Xe3_LPG
[08:52:12] [PASSED] 35.10 Xe3p_LPG
[08:52:12] [PASSED] 35.11 Xe3p_XPC
[08:52:12] ================ [PASSED] check_graphics_ip ================
[08:52:12] ===================== check_media_ip  ======================
[08:52:12] [PASSED] 12.00 Xe_M
[08:52:12] [PASSED] 12.55 Xe_HPM
[08:52:12] [PASSED] 13.00 Xe_LPM+
[08:52:12] [PASSED] 13.01 Xe2_HPM
[08:52:12] [PASSED] 20.00 Xe2_LPM
[08:52:12] [PASSED] 30.00 Xe3_LPM
[08:52:12] [PASSED] 30.02 Xe3_LPM
[08:52:12] [PASSED] 35.00 Xe3p_LPM
[08:52:12] [PASSED] 35.03 Xe3p_HPM
[08:52:12] ================= [PASSED] check_media_ip ==================
[08:52:12] =================== check_platform_desc  ===================
[08:52:12] [PASSED] 0x9A60 (TIGERLAKE)
[08:52:12] [PASSED] 0x9A68 (TIGERLAKE)
[08:52:12] [PASSED] 0x9A70 (TIGERLAKE)
[08:52:12] [PASSED] 0x9A40 (TIGERLAKE)
[08:52:12] [PASSED] 0x9A49 (TIGERLAKE)
[08:52:12] [PASSED] 0x9A59 (TIGERLAKE)
[08:52:12] [PASSED] 0x9A78 (TIGERLAKE)
[08:52:12] [PASSED] 0x9AC0 (TIGERLAKE)
[08:52:12] [PASSED] 0x9AC9 (TIGERLAKE)
[08:52:12] [PASSED] 0x9AD9 (TIGERLAKE)
[08:52:12] [PASSED] 0x9AF8 (TIGERLAKE)
[08:52:12] [PASSED] 0x4C80 (ROCKETLAKE)
[08:52:12] [PASSED] 0x4C8A (ROCKETLAKE)
[08:52:12] [PASSED] 0x4C8B (ROCKETLAKE)
[08:52:12] [PASSED] 0x4C8C (ROCKETLAKE)
[08:52:12] [PASSED] 0x4C90 (ROCKETLAKE)
[08:52:12] [PASSED] 0x4C9A (ROCKETLAKE)
[08:52:12] [PASSED] 0x4680 (ALDERLAKE_S)
[08:52:12] [PASSED] 0x4682 (ALDERLAKE_S)
[08:52:12] [PASSED] 0x4688 (ALDERLAKE_S)
[08:52:12] [PASSED] 0x468A (ALDERLAKE_S)
[08:52:12] [PASSED] 0x468B (ALDERLAKE_S)
[08:52:12] [PASSED] 0x4690 (ALDERLAKE_S)
[08:52:12] [PASSED] 0x4692 (ALDERLAKE_S)
[08:52:12] [PASSED] 0x4693 (ALDERLAKE_S)
[08:52:12] [PASSED] 0x46A0 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46A1 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46A2 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46A3 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46A6 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46A8 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46AA (ALDERLAKE_P)
[08:52:12] [PASSED] 0x462A (ALDERLAKE_P)
[08:52:12] [PASSED] 0x4626 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x4628 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46B0 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46B1 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46B2 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46B3 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46C0 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46C1 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46C2 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46C3 (ALDERLAKE_P)
[08:52:12] [PASSED] 0x46D0 (ALDERLAKE_N)
[08:52:12] [PASSED] 0x46D1 (ALDERLAKE_N)
[08:52:12] [PASSED] 0x46D2 (ALDERLAKE_N)
[08:52:12] [PASSED] 0x46D3 (ALDERLAKE_N)
[08:52:12] [PASSED] 0x46D4 (ALDERLAKE_N)
[08:52:12] [PASSED] 0xA721 (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7A1 (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7A9 (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7AC (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7AD (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA720 (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7A0 (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7A8 (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7AA (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA7AB (ALDERLAKE_P)
[08:52:12] [PASSED] 0xA780 (ALDERLAKE_S)
[08:52:12] [PASSED] 0xA781 (ALDERLAKE_S)
[08:52:12] [PASSED] 0xA782 (ALDERLAKE_S)
[08:52:12] [PASSED] 0xA783 (ALDERLAKE_S)
[08:52:12] [PASSED] 0xA788 (ALDERLAKE_S)
[08:52:12] [PASSED] 0xA789 (ALDERLAKE_S)
[08:52:12] [PASSED] 0xA78A (ALDERLAKE_S)
[08:52:12] [PASSED] 0xA78B (ALDERLAKE_S)
[08:52:12] [PASSED] 0x4905 (DG1)
[08:52:12] [PASSED] 0x4906 (DG1)
[08:52:12] [PASSED] 0x4907 (DG1)
[08:52:12] [PASSED] 0x4908 (DG1)
[08:52:12] [PASSED] 0x4909 (DG1)
[08:52:12] [PASSED] 0x56C0 (DG2)
[08:52:12] [PASSED] 0x56C2 (DG2)
[08:52:12] [PASSED] 0x56C1 (DG2)
[08:52:12] [PASSED] 0x7D51 (METEORLAKE)
[08:52:12] [PASSED] 0x7DD1 (METEORLAKE)
[08:52:12] [PASSED] 0x7D41 (METEORLAKE)
[08:52:12] [PASSED] 0x7D67 (METEORLAKE)
[08:52:12] [PASSED] 0xB640 (METEORLAKE)
[08:52:12] [PASSED] 0x56A0 (DG2)
[08:52:12] [PASSED] 0x56A1 (DG2)
[08:52:12] [PASSED] 0x56A2 (DG2)
[08:52:12] [PASSED] 0x56BE (DG2)
[08:52:12] [PASSED] 0x56BF (DG2)
[08:52:12] [PASSED] 0x5690 (DG2)
[08:52:12] [PASSED] 0x5691 (DG2)
[08:52:12] [PASSED] 0x5692 (DG2)
[08:52:12] [PASSED] 0x56A5 (DG2)
[08:52:12] [PASSED] 0x56A6 (DG2)
[08:52:12] [PASSED] 0x56B0 (DG2)
[08:52:12] [PASSED] 0x56B1 (DG2)
[08:52:12] [PASSED] 0x56BA (DG2)
[08:52:12] [PASSED] 0x56BB (DG2)
[08:52:12] [PASSED] 0x56BC (DG2)
[08:52:12] [PASSED] 0x56BD (DG2)
[08:52:12] [PASSED] 0x5693 (DG2)
[08:52:12] [PASSED] 0x5694 (DG2)
[08:52:12] [PASSED] 0x5695 (DG2)
[08:52:12] [PASSED] 0x56A3 (DG2)
[08:52:12] [PASSED] 0x56A4 (DG2)
[08:52:12] [PASSED] 0x56B2 (DG2)
[08:52:12] [PASSED] 0x56B3 (DG2)
[08:52:12] [PASSED] 0x5696 (DG2)
[08:52:12] [PASSED] 0x5697 (DG2)
[08:52:12] [PASSED] 0xB69 (PVC)
[08:52:12] [PASSED] 0xB6E (PVC)
[08:52:12] [PASSED] 0xBD4 (PVC)
[08:52:12] [PASSED] 0xBD5 (PVC)
[08:52:12] [PASSED] 0xBD6 (PVC)
[08:52:12] [PASSED] 0xBD7 (PVC)
[08:52:12] [PASSED] 0xBD8 (PVC)
[08:52:12] [PASSED] 0xBD9 (PVC)
[08:52:12] [PASSED] 0xBDA (PVC)
[08:52:12] [PASSED] 0xBDB (PVC)
[08:52:12] [PASSED] 0xBE0 (PVC)
[08:52:12] [PASSED] 0xBE1 (PVC)
[08:52:12] [PASSED] 0xBE5 (PVC)
[08:52:12] [PASSED] 0x7D40 (METEORLAKE)
[08:52:12] [PASSED] 0x7D45 (METEORLAKE)
[08:52:12] [PASSED] 0x7D55 (METEORLAKE)
[08:52:12] [PASSED] 0x7D60 (METEORLAKE)
[08:52:12] [PASSED] 0x7DD5 (METEORLAKE)
[08:52:12] [PASSED] 0x6420 (LUNARLAKE)
[08:52:12] [PASSED] 0x64A0 (LUNARLAKE)
[08:52:12] [PASSED] 0x64B0 (LUNARLAKE)
[08:52:12] [PASSED] 0xE202 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE209 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE20B (BATTLEMAGE)
[08:52:12] [PASSED] 0xE20C (BATTLEMAGE)
[08:52:12] [PASSED] 0xE20D (BATTLEMAGE)
[08:52:12] [PASSED] 0xE210 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE211 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE212 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE216 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE220 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE221 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE222 (BATTLEMAGE)
[08:52:12] [PASSED] 0xE223 (BATTLEMAGE)
[08:52:12] [PASSED] 0xB080 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB081 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB082 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB083 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB084 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB085 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB086 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB087 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB08F (PANTHERLAKE)
[08:52:12] [PASSED] 0xB090 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB0A0 (PANTHERLAKE)
[08:52:12] [PASSED] 0xB0B0 (PANTHERLAKE)
[08:52:12] [PASSED] 0xFD80 (PANTHERLAKE)
[08:52:12] [PASSED] 0xFD81 (PANTHERLAKE)
[08:52:12] [PASSED] 0xD740 (NOVALAKE_S)
[08:52:12] [PASSED] 0xD741 (NOVALAKE_S)
[08:52:12] [PASSED] 0xD742 (NOVALAKE_S)
[08:52:12] [PASSED] 0xD743 (NOVALAKE_S)
[08:52:12] [PASSED] 0xD744 (NOVALAKE_S)
[08:52:12] [PASSED] 0xD745 (NOVALAKE_S)
[08:52:12] [PASSED] 0x674C (CRESCENTISLAND)
[08:52:12] [PASSED] 0xD750 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD751 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD752 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD753 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD754 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD755 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD756 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD757 (NOVALAKE_P)
[08:52:12] [PASSED] 0xD75F (NOVALAKE_P)
[08:52:12] =============== [PASSED] check_platform_desc ===============
[08:52:12] ===================== [PASSED] xe_pci ======================
[08:52:12] =================== xe_rtp (2 subtests) ====================
[08:52:12] =============== xe_rtp_process_to_sr_tests  ================
[08:52:12] [PASSED] coalesce-same-reg
[08:52:12] [PASSED] no-match-no-add
[08:52:12] [PASSED] match-or
[08:52:12] [PASSED] match-or-xfail
[08:52:12] [PASSED] no-match-no-add-multiple-rules
[08:52:12] [PASSED] two-regs-two-entries
[08:52:12] [PASSED] clr-one-set-other
[08:52:12] [PASSED] set-field
[08:52:12] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[08:52:12] [PASSED] conflict-not-disjoint
[08:52:12] [PASSED] conflict-reg-type
[08:52:12] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[08:52:12] ================== xe_rtp_process_tests  ===================
[08:52:12] [PASSED] active1
[08:52:12] [PASSED] active2
[08:52:12] [PASSED] active-inactive
[08:52:12] [PASSED] inactive-active
[08:52:12] [PASSED] inactive-1st_or_active-inactive
[08:52:12] [PASSED] inactive-2nd_or_active-inactive
[08:52:12] [PASSED] inactive-last_or_active-inactive
[08:52:12] [PASSED] inactive-no_or_active-inactive
[08:52:12] ============== [PASSED] xe_rtp_process_tests ===============
[08:52:12] ===================== [PASSED] xe_rtp ======================
[08:52:12] ==================== xe_wa (1 subtest) =====================
[08:52:12] ======================== xe_wa_gt  =========================
[08:52:12] [PASSED] TIGERLAKE B0
[08:52:12] [PASSED] DG1 A0
[08:52:12] [PASSED] DG1 B0
[08:52:12] [PASSED] ALDERLAKE_S A0
[08:52:12] [PASSED] ALDERLAKE_S B0
[08:52:12] [PASSED] ALDERLAKE_S C0
[08:52:12] [PASSED] ALDERLAKE_S D0
[08:52:12] [PASSED] ALDERLAKE_P A0
[08:52:12] [PASSED] ALDERLAKE_P B0
[08:52:12] [PASSED] ALDERLAKE_P C0
[08:52:12] [PASSED] ALDERLAKE_S RPLS D0
[08:52:12] [PASSED] ALDERLAKE_P RPLU E0
[08:52:12] [PASSED] DG2 G10 C0
[08:52:12] [PASSED] DG2 G11 B1
[08:52:12] [PASSED] DG2 G12 A1
[08:52:12] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[08:52:12] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[08:52:12] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[08:52:12] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[08:52:12] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[08:52:12] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[08:52:12] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[08:52:12] ==================== [PASSED] xe_wa_gt =====================
[08:52:12] ====================== [PASSED] xe_wa ======================
[08:52:12] ============================================================
[08:52:12] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[08:52:12] Elapsed time: 36.112s total, 4.212s configuring, 31.283s building, 0.607s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[08:52:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:52:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:52:38] Starting KUnit Kernel (1/1)...
[08:52:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:52:38] ============ drm_test_pick_cmdline (2 subtests) ============
[08:52:38] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[08:52:38] =============== drm_test_pick_cmdline_named  ===============
[08:52:38] [PASSED] NTSC
[08:52:38] [PASSED] NTSC-J
[08:52:38] [PASSED] PAL
[08:52:38] [PASSED] PAL-M
[08:52:38] =========== [PASSED] drm_test_pick_cmdline_named ===========
[08:52:38] ============== [PASSED] drm_test_pick_cmdline ==============
[08:52:38] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[08:52:38] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[08:52:38] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[08:52:38] =========== drm_validate_clone_mode (2 subtests) ===========
[08:52:38] ============== drm_test_check_in_clone_mode  ===============
[08:52:38] [PASSED] in_clone_mode
[08:52:38] [PASSED] not_in_clone_mode
[08:52:38] ========== [PASSED] drm_test_check_in_clone_mode ===========
[08:52:38] =============== drm_test_check_valid_clones  ===============
[08:52:38] [PASSED] not_in_clone_mode
[08:52:38] [PASSED] valid_clone
[08:52:38] [PASSED] invalid_clone
[08:52:38] =========== [PASSED] drm_test_check_valid_clones ===========
[08:52:38] ============= [PASSED] drm_validate_clone_mode =============
[08:52:38] ============= drm_validate_modeset (1 subtest) =============
[08:52:38] [PASSED] drm_test_check_connector_changed_modeset
[08:52:38] ============== [PASSED] drm_validate_modeset ===============
[08:52:38] ====== drm_test_bridge_get_current_state (2 subtests) ======
[08:52:38] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[08:52:38] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[08:52:38] ======== [PASSED] drm_test_bridge_get_current_state ========
[08:52:38] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[08:52:38] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[08:52:38] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[08:52:38] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[08:52:38] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[08:52:38] ============== drm_bridge_alloc (2 subtests) ===============
[08:52:38] [PASSED] drm_test_drm_bridge_alloc_basic
[08:52:38] [PASSED] drm_test_drm_bridge_alloc_get_put
[08:52:38] ================ [PASSED] drm_bridge_alloc =================
[08:52:38] ============= drm_cmdline_parser (40 subtests) =============
[08:52:38] [PASSED] drm_test_cmdline_force_d_only
[08:52:38] [PASSED] drm_test_cmdline_force_D_only_dvi
[08:52:38] [PASSED] drm_test_cmdline_force_D_only_hdmi
[08:52:38] [PASSED] drm_test_cmdline_force_D_only_not_digital
[08:52:38] [PASSED] drm_test_cmdline_force_e_only
[08:52:38] [PASSED] drm_test_cmdline_res
[08:52:38] [PASSED] drm_test_cmdline_res_vesa
[08:52:38] [PASSED] drm_test_cmdline_res_vesa_rblank
[08:52:38] [PASSED] drm_test_cmdline_res_rblank
[08:52:38] [PASSED] drm_test_cmdline_res_bpp
[08:52:38] [PASSED] drm_test_cmdline_res_refresh
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[08:52:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[08:52:38] [PASSED] drm_test_cmdline_res_margins_force_on
[08:52:38] [PASSED] drm_test_cmdline_res_vesa_margins
[08:52:38] [PASSED] drm_test_cmdline_name
[08:52:38] [PASSED] drm_test_cmdline_name_bpp
[08:52:38] [PASSED] drm_test_cmdline_name_option
[08:52:38] [PASSED] drm_test_cmdline_name_bpp_option
[08:52:38] [PASSED] drm_test_cmdline_rotate_0
[08:52:38] [PASSED] drm_test_cmdline_rotate_90
[08:52:38] [PASSED] drm_test_cmdline_rotate_180
[08:52:38] [PASSED] drm_test_cmdline_rotate_270
[08:52:38] [PASSED] drm_test_cmdline_hmirror
[08:52:38] [PASSED] drm_test_cmdline_vmirror
[08:52:38] [PASSED] drm_test_cmdline_margin_options
[08:52:38] [PASSED] drm_test_cmdline_multiple_options
[08:52:38] [PASSED] drm_test_cmdline_bpp_extra_and_option
[08:52:38] [PASSED] drm_test_cmdline_extra_and_option
[08:52:38] [PASSED] drm_test_cmdline_freestanding_options
[08:52:38] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[08:52:38] [PASSED] drm_test_cmdline_panel_orientation
[08:52:38] ================ drm_test_cmdline_invalid  =================
[08:52:38] [PASSED] margin_only
[08:52:38] [PASSED] interlace_only
[08:52:38] [PASSED] res_missing_x
[08:52:38] [PASSED] res_missing_y
[08:52:38] [PASSED] res_bad_y
[08:52:38] [PASSED] res_missing_y_bpp
[08:52:38] [PASSED] res_bad_bpp
[08:52:38] [PASSED] res_bad_refresh
[08:52:38] [PASSED] res_bpp_refresh_force_on_off
[08:52:38] [PASSED] res_invalid_mode
[08:52:38] [PASSED] res_bpp_wrong_place_mode
[08:52:38] [PASSED] name_bpp_refresh
[08:52:38] [PASSED] name_refresh
[08:52:38] [PASSED] name_refresh_wrong_mode
[08:52:38] [PASSED] name_refresh_invalid_mode
[08:52:38] [PASSED] rotate_multiple
[08:52:38] [PASSED] rotate_invalid_val
[08:52:38] [PASSED] rotate_truncated
[08:52:38] [PASSED] invalid_option
[08:52:38] [PASSED] invalid_tv_option
[08:52:38] [PASSED] truncated_tv_option
[08:52:38] ============ [PASSED] drm_test_cmdline_invalid =============
[08:52:38] =============== drm_test_cmdline_tv_options  ===============
[08:52:38] [PASSED] NTSC
[08:52:38] [PASSED] NTSC_443
[08:52:38] [PASSED] NTSC_J
[08:52:38] [PASSED] PAL
[08:52:38] [PASSED] PAL_M
[08:52:38] [PASSED] PAL_N
[08:52:38] [PASSED] SECAM
[08:52:38] [PASSED] MONO_525
[08:52:38] [PASSED] MONO_625
[08:52:38] =========== [PASSED] drm_test_cmdline_tv_options ===========
[08:52:38] =============== [PASSED] drm_cmdline_parser ================
[08:52:38] ========== drmm_connector_hdmi_init (20 subtests) ==========
[08:52:38] [PASSED] drm_test_connector_hdmi_init_valid
[08:52:38] [PASSED] drm_test_connector_hdmi_init_bpc_8
[08:52:38] [PASSED] drm_test_connector_hdmi_init_bpc_10
[08:52:38] [PASSED] drm_test_connector_hdmi_init_bpc_12
[08:52:38] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[08:52:38] [PASSED] drm_test_connector_hdmi_init_bpc_null
[08:52:38] [PASSED] drm_test_connector_hdmi_init_formats_empty
[08:52:38] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[08:52:38] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[08:52:38] [PASSED] supported_formats=0x9 yuv420_allowed=1
[08:52:38] [PASSED] supported_formats=0x9 yuv420_allowed=0
[08:52:38] [PASSED] supported_formats=0x5 yuv420_allowed=1
[08:52:38] [PASSED] supported_formats=0x5 yuv420_allowed=0
[08:52:38] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[08:52:38] [PASSED] drm_test_connector_hdmi_init_null_ddc
[08:52:38] [PASSED] drm_test_connector_hdmi_init_null_product
[08:52:38] [PASSED] drm_test_connector_hdmi_init_null_vendor
[08:52:38] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[08:52:38] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[08:52:38] [PASSED] drm_test_connector_hdmi_init_product_valid
[08:52:38] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[08:52:38] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[08:52:38] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[08:52:38] ========= drm_test_connector_hdmi_init_type_valid  =========
[08:52:38] [PASSED] HDMI-A
[08:52:38] [PASSED] HDMI-B
[08:52:38] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[08:52:38] ======== drm_test_connector_hdmi_init_type_invalid  ========
[08:52:38] [PASSED] Unknown
[08:52:38] [PASSED] VGA
[08:52:38] [PASSED] DVI-I
[08:52:38] [PASSED] DVI-D
[08:52:38] [PASSED] DVI-A
[08:52:38] [PASSED] Composite
[08:52:38] [PASSED] SVIDEO
[08:52:38] [PASSED] LVDS
[08:52:38] [PASSED] Component
[08:52:38] [PASSED] DIN
[08:52:38] [PASSED] DP
[08:52:38] [PASSED] TV
[08:52:38] [PASSED] eDP
[08:52:38] [PASSED] Virtual
[08:52:38] [PASSED] DSI
[08:52:38] [PASSED] DPI
[08:52:38] [PASSED] Writeback
[08:52:38] [PASSED] SPI
[08:52:38] [PASSED] USB
[08:52:38] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[08:52:38] ============ [PASSED] drmm_connector_hdmi_init =============
[08:52:38] ============= drmm_connector_init (3 subtests) =============
[08:52:38] [PASSED] drm_test_drmm_connector_init
[08:52:38] [PASSED] drm_test_drmm_connector_init_null_ddc
[08:52:38] ========= drm_test_drmm_connector_init_type_valid  =========
[08:52:38] [PASSED] Unknown
[08:52:38] [PASSED] VGA
[08:52:38] [PASSED] DVI-I
[08:52:38] [PASSED] DVI-D
[08:52:38] [PASSED] DVI-A
[08:52:38] [PASSED] Composite
[08:52:38] [PASSED] SVIDEO
[08:52:38] [PASSED] LVDS
[08:52:38] [PASSED] Component
[08:52:38] [PASSED] DIN
[08:52:38] [PASSED] DP
[08:52:38] [PASSED] HDMI-A
[08:52:38] [PASSED] HDMI-B
[08:52:38] [PASSED] TV
[08:52:38] [PASSED] eDP
[08:52:38] [PASSED] Virtual
[08:52:38] [PASSED] DSI
[08:52:38] [PASSED] DPI
[08:52:38] [PASSED] Writeback
[08:52:38] [PASSED] SPI
[08:52:38] [PASSED] USB
[08:52:38] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[08:52:38] =============== [PASSED] drmm_connector_init ===============
[08:52:38] ========= drm_connector_dynamic_init (6 subtests) ==========
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_init
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_init_properties
[08:52:38] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[08:52:38] [PASSED] Unknown
[08:52:38] [PASSED] VGA
[08:52:38] [PASSED] DVI-I
[08:52:38] [PASSED] DVI-D
[08:52:38] [PASSED] DVI-A
[08:52:38] [PASSED] Composite
[08:52:38] [PASSED] SVIDEO
[08:52:38] [PASSED] LVDS
[08:52:38] [PASSED] Component
[08:52:38] [PASSED] DIN
[08:52:38] [PASSED] DP
[08:52:38] [PASSED] HDMI-A
[08:52:38] [PASSED] HDMI-B
[08:52:38] [PASSED] TV
[08:52:38] [PASSED] eDP
[08:52:38] [PASSED] Virtual
[08:52:38] [PASSED] DSI
[08:52:38] [PASSED] DPI
[08:52:38] [PASSED] Writeback
[08:52:38] [PASSED] SPI
[08:52:38] [PASSED] USB
[08:52:38] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[08:52:38] ======== drm_test_drm_connector_dynamic_init_name  =========
[08:52:38] [PASSED] Unknown
[08:52:38] [PASSED] VGA
[08:52:38] [PASSED] DVI-I
[08:52:38] [PASSED] DVI-D
[08:52:38] [PASSED] DVI-A
[08:52:38] [PASSED] Composite
[08:52:38] [PASSED] SVIDEO
[08:52:38] [PASSED] LVDS
[08:52:38] [PASSED] Component
[08:52:38] [PASSED] DIN
[08:52:38] [PASSED] DP
[08:52:38] [PASSED] HDMI-A
[08:52:38] [PASSED] HDMI-B
[08:52:38] [PASSED] TV
[08:52:38] [PASSED] eDP
[08:52:38] [PASSED] Virtual
[08:52:38] [PASSED] DSI
[08:52:38] [PASSED] DPI
[08:52:38] [PASSED] Writeback
[08:52:38] [PASSED] SPI
[08:52:38] [PASSED] USB
[08:52:38] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[08:52:38] =========== [PASSED] drm_connector_dynamic_init ============
[08:52:38] ==== drm_connector_dynamic_register_early (4 subtests) =====
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[08:52:38] ====== [PASSED] drm_connector_dynamic_register_early =======
[08:52:38] ======= drm_connector_dynamic_register (7 subtests) ========
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[08:52:38] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[08:52:38] ========= [PASSED] drm_connector_dynamic_register ==========
[08:52:38] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[08:52:38] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[08:52:38] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[08:52:38] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[08:52:38] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[08:52:38] ========== drm_test_get_tv_mode_from_name_valid  ===========
[08:52:38] [PASSED] NTSC
[08:52:38] [PASSED] NTSC-443
[08:52:38] [PASSED] NTSC-J
[08:52:38] [PASSED] PAL
[08:52:38] [PASSED] PAL-M
[08:52:38] [PASSED] PAL-N
[08:52:38] [PASSED] SECAM
[08:52:38] [PASSED] Mono
[08:52:38] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[08:52:38] [PASSED] drm_test_get_tv_mode_from_name_truncated
[08:52:38] ============ [PASSED] drm_get_tv_mode_from_name ============
[08:52:38] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[08:52:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[08:52:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[08:52:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[08:52:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[08:52:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[08:52:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[08:52:38] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[08:52:38] [PASSED] VIC 96
[08:52:38] [PASSED] VIC 97
[08:52:38] [PASSED] VIC 101
[08:52:38] [PASSED] VIC 102
[08:52:38] [PASSED] VIC 106
[08:52:38] [PASSED] VIC 107
[08:52:38] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[08:52:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[08:52:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[08:52:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[08:52:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[08:52:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[08:52:38] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[08:52:38] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[08:52:38] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[08:52:38] [PASSED] Automatic
[08:52:38] [PASSED] Full
[08:52:38] [PASSED] Limited 16:235
[08:52:38] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[08:52:38] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[08:52:38] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[08:52:38] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[08:52:38] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[08:52:38] [PASSED] RGB
[08:52:38] [PASSED] YUV 4:2:0
[08:52:38] [PASSED] YUV 4:2:2
[08:52:38] [PASSED] YUV 4:4:4
[08:52:38] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[08:52:38] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[08:52:38] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[08:52:38] ============= drm_damage_helper (21 subtests) ==============
[08:52:38] [PASSED] drm_test_damage_iter_no_damage
[08:52:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[08:52:38] [PASSED] drm_test_damage_iter_no_damage_src_moved
[08:52:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[08:52:38] [PASSED] drm_test_damage_iter_no_damage_not_visible
[08:52:38] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[08:52:38] [PASSED] drm_test_damage_iter_no_damage_no_fb
[08:52:38] [PASSED] drm_test_damage_iter_simple_damage
[08:52:38] [PASSED] drm_test_damage_iter_single_damage
[08:52:38] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[08:52:38] [PASSED] drm_test_damage_iter_single_damage_outside_src
[08:52:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[08:52:38] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[08:52:38] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[08:52:38] [PASSED] drm_test_damage_iter_single_damage_src_moved
[08:52:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[08:52:38] [PASSED] drm_test_damage_iter_damage
[08:52:38] [PASSED] drm_test_damage_iter_damage_one_intersect
[08:52:38] [PASSED] drm_test_damage_iter_damage_one_outside
[08:52:38] [PASSED] drm_test_damage_iter_damage_src_moved
[08:52:38] [PASSED] drm_test_damage_iter_damage_not_visible
[08:52:38] ================ [PASSED] drm_damage_helper ================
[08:52:38] ============== drm_dp_mst_helper (3 subtests) ==============
[08:52:38] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[08:52:38] [PASSED] Clock 154000 BPP 30 DSC disabled
[08:52:38] [PASSED] Clock 234000 BPP 30 DSC disabled
[08:52:38] [PASSED] Clock 297000 BPP 24 DSC disabled
[08:52:38] [PASSED] Clock 332880 BPP 24 DSC enabled
[08:52:38] [PASSED] Clock 324540 BPP 24 DSC enabled
[08:52:38] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[08:52:38] ============== drm_test_dp_mst_calc_pbn_div  ===============
[08:52:38] [PASSED] Link rate 2000000 lane count 4
[08:52:38] [PASSED] Link rate 2000000 lane count 2
[08:52:38] [PASSED] Link rate 2000000 lane count 1
[08:52:38] [PASSED] Link rate 1350000 lane count 4
[08:52:38] [PASSED] Link rate 1350000 lane count 2
[08:52:38] [PASSED] Link rate 1350000 lane count 1
[08:52:38] [PASSED] Link rate 1000000 lane count 4
[08:52:38] [PASSED] Link rate 1000000 lane count 2
[08:52:38] [PASSED] Link rate 1000000 lane count 1
[08:52:38] [PASSED] Link rate 810000 lane count 4
[08:52:38] [PASSED] Link rate 810000 lane count 2
[08:52:38] [PASSED] Link rate 810000 lane count 1
[08:52:38] [PASSED] Link rate 540000 lane count 4
[08:52:38] [PASSED] Link rate 540000 lane count 2
[08:52:38] [PASSED] Link rate 540000 lane count 1
[08:52:38] [PASSED] Link rate 270000 lane count 4
[08:52:38] [PASSED] Link rate 270000 lane count 2
[08:52:38] [PASSED] Link rate 270000 lane count 1
[08:52:38] [PASSED] Link rate 162000 lane count 4
[08:52:38] [PASSED] Link rate 162000 lane count 2
[08:52:38] [PASSED] Link rate 162000 lane count 1
[08:52:38] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[08:52:38] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[08:52:38] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[08:52:38] [PASSED] DP_POWER_UP_PHY with port number
[08:52:38] [PASSED] DP_POWER_DOWN_PHY with port number
[08:52:38] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[08:52:38] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[08:52:38] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[08:52:38] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[08:52:38] [PASSED] DP_QUERY_PAYLOAD with port number
[08:52:38] [PASSED] DP_QUERY_PAYLOAD with VCPI
[08:52:38] [PASSED] DP_REMOTE_DPCD_READ with port number
[08:52:38] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[08:52:38] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[08:52:38] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[08:52:38] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[08:52:38] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[08:52:38] [PASSED] DP_REMOTE_I2C_READ with port number
[08:52:38] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[08:52:38] [PASSED] DP_REMOTE_I2C_READ with transactions array
[08:52:38] [PASSED] DP_REMOTE_I2C_WRITE with port number
[08:52:38] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[08:52:38] [PASSED] DP_REMOTE_I2C_WRITE with data array
[08:52:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[08:52:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[08:52:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[08:52:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[08:52:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[08:52:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[08:52:38] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[08:52:38] ================ [PASSED] drm_dp_mst_helper ================
[08:52:38] ================== drm_exec (7 subtests) ===================
[08:52:38] [PASSED] sanitycheck
[08:52:38] [PASSED] test_lock
[08:52:38] [PASSED] test_lock_unlock
[08:52:38] [PASSED] test_duplicates
[08:52:38] [PASSED] test_prepare
[08:52:38] [PASSED] test_prepare_array
[08:52:38] [PASSED] test_multiple_loops
[08:52:38] ==================== [PASSED] drm_exec =====================
[08:52:38] =========== drm_format_helper_test (17 subtests) ===========
[08:52:38] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[08:52:38] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[08:52:38] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[08:52:38] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[08:52:38] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[08:52:38] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[08:52:38] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[08:52:38] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[08:52:38] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[08:52:38] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[08:52:38] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[08:52:38] ============== drm_test_fb_xrgb8888_to_mono  ===============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[08:52:38] ==================== drm_test_fb_swab  =====================
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ================ [PASSED] drm_test_fb_swab =================
[08:52:38] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[08:52:38] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[08:52:38] [PASSED] single_pixel_source_buffer
[08:52:38] [PASSED] single_pixel_clip_rectangle
[08:52:38] [PASSED] well_known_colors
[08:52:38] [PASSED] destination_pitch
[08:52:38] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[08:52:38] ================= drm_test_fb_clip_offset  =================
[08:52:38] [PASSED] pass through
[08:52:38] [PASSED] horizontal offset
[08:52:38] [PASSED] vertical offset
[08:52:38] [PASSED] horizontal and vertical offset
[08:52:38] [PASSED] horizontal offset (custom pitch)
[08:52:38] [PASSED] vertical offset (custom pitch)
[08:52:38] [PASSED] horizontal and vertical offset (custom pitch)
[08:52:38] ============= [PASSED] drm_test_fb_clip_offset =============
[08:52:38] =================== drm_test_fb_memcpy  ====================
[08:52:38] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[08:52:38] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[08:52:38] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[08:52:38] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[08:52:38] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[08:52:38] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[08:52:38] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[08:52:38] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[08:52:38] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[08:52:38] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[08:52:38] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[08:52:38] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[08:52:38] =============== [PASSED] drm_test_fb_memcpy ================
[08:52:38] ============= [PASSED] drm_format_helper_test ==============
[08:52:38] ================= drm_format (18 subtests) =================
[08:52:38] [PASSED] drm_test_format_block_width_invalid
[08:52:38] [PASSED] drm_test_format_block_width_one_plane
[08:52:38] [PASSED] drm_test_format_block_width_two_plane
[08:52:38] [PASSED] drm_test_format_block_width_three_plane
[08:52:38] [PASSED] drm_test_format_block_width_tiled
[08:52:38] [PASSED] drm_test_format_block_height_invalid
[08:52:38] [PASSED] drm_test_format_block_height_one_plane
[08:52:38] [PASSED] drm_test_format_block_height_two_plane
[08:52:38] [PASSED] drm_test_format_block_height_three_plane
[08:52:38] [PASSED] drm_test_format_block_height_tiled
[08:52:38] [PASSED] drm_test_format_min_pitch_invalid
[08:52:38] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[08:52:38] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[08:52:38] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[08:52:38] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[08:52:38] [PASSED] drm_test_format_min_pitch_two_plane
[08:52:38] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[08:52:38] [PASSED] drm_test_format_min_pitch_tiled
[08:52:38] =================== [PASSED] drm_format ====================
[08:52:38] ============== drm_framebuffer (10 subtests) ===============
[08:52:38] ========== drm_test_framebuffer_check_src_coords  ==========
[08:52:38] [PASSED] Success: source fits into fb
[08:52:38] [PASSED] Fail: overflowing fb with x-axis coordinate
[08:52:38] [PASSED] Fail: overflowing fb with y-axis coordinate
[08:52:38] [PASSED] Fail: overflowing fb with source width
[08:52:38] [PASSED] Fail: overflowing fb with source height
[08:52:38] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[08:52:38] [PASSED] drm_test_framebuffer_cleanup
[08:52:38] =============== drm_test_framebuffer_create  ===============
[08:52:38] [PASSED] ABGR8888 normal sizes
[08:52:38] [PASSED] ABGR8888 max sizes
[08:52:38] [PASSED] ABGR8888 pitch greater than min required
[08:52:38] [PASSED] ABGR8888 pitch less than min required
[08:52:38] [PASSED] ABGR8888 Invalid width
[08:52:38] [PASSED] ABGR8888 Invalid buffer handle
[08:52:38] [PASSED] No pixel format
[08:52:38] [PASSED] ABGR8888 Width 0
[08:52:38] [PASSED] ABGR8888 Height 0
[08:52:38] [PASSED] ABGR8888 Out of bound height * pitch combination
[08:52:38] [PASSED] ABGR8888 Large buffer offset
[08:52:38] [PASSED] ABGR8888 Buffer offset for inexistent plane
[08:52:38] [PASSED] ABGR8888 Invalid flag
[08:52:38] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[08:52:38] [PASSED] ABGR8888 Valid buffer modifier
[08:52:38] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[08:52:38] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[08:52:38] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[08:52:38] [PASSED] NV12 Normal sizes
[08:52:38] [PASSED] NV12 Max sizes
[08:52:38] [PASSED] NV12 Invalid pitch
[08:52:38] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[08:52:38] [PASSED] NV12 different  modifier per-plane
[08:52:38] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[08:52:38] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[08:52:38] [PASSED] NV12 Modifier for inexistent plane
[08:52:38] [PASSED] NV12 Handle for inexistent plane
[08:52:38] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[08:52:38] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[08:52:38] [PASSED] YVU420 Normal sizes
[08:52:38] [PASSED] YVU420 Max sizes
[08:52:38] [PASSED] YVU420 Invalid pitch
[08:52:38] [PASSED] YVU420 Different pitches
[08:52:38] [PASSED] YVU420 Different buffer offsets/pitches
[08:52:38] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[08:52:38] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[08:52:38] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[08:52:38] [PASSED] YVU420 Valid modifier
[08:52:38] [PASSED] YVU420 Different modifiers per plane
[08:52:38] [PASSED] YVU420 Modifier for inexistent plane
[08:52:38] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[08:52:38] [PASSED] X0L2 Normal sizes
[08:52:38] [PASSED] X0L2 Max sizes
[08:52:38] [PASSED] X0L2 Invalid pitch
[08:52:38] [PASSED] X0L2 Pitch greater than minimum required
[08:52:38] [PASSED] X0L2 Handle for inexistent plane
[08:52:38] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[08:52:38] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[08:52:38] [PASSED] X0L2 Valid modifier
[08:52:38] [PASSED] X0L2 Modifier for inexistent plane
[08:52:38] =========== [PASSED] drm_test_framebuffer_create ===========
[08:52:38] [PASSED] drm_test_framebuffer_free
[08:52:38] [PASSED] drm_test_framebuffer_init
[08:52:38] [PASSED] drm_test_framebuffer_init_bad_format
[08:52:38] [PASSED] drm_test_framebuffer_init_dev_mismatch
[08:52:38] [PASSED] drm_test_framebuffer_lookup
[08:52:38] [PASSED] drm_test_framebuffer_lookup_inexistent
[08:52:38] [PASSED] drm_test_framebuffer_modifiers_not_supported
[08:52:38] ================= [PASSED] drm_framebuffer =================
[08:52:38] ================ drm_gem_shmem (8 subtests) ================
[08:52:38] [PASSED] drm_gem_shmem_test_obj_create
[08:52:38] [PASSED] drm_gem_shmem_test_obj_create_private
[08:52:38] [PASSED] drm_gem_shmem_test_pin_pages
[08:52:38] [PASSED] drm_gem_shmem_test_vmap
[08:52:38] [PASSED] drm_gem_shmem_test_get_sg_table
[08:52:38] [PASSED] drm_gem_shmem_test_get_pages_sgt
[08:52:38] [PASSED] drm_gem_shmem_test_madvise
[08:52:38] [PASSED] drm_gem_shmem_test_purge
[08:52:38] ================== [PASSED] drm_gem_shmem ==================
[08:52:38] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[08:52:38] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[08:52:38] [PASSED] Automatic
[08:52:38] [PASSED] Full
[08:52:38] [PASSED] Limited 16:235
[08:52:38] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[08:52:38] [PASSED] drm_test_check_disable_connector
[08:52:38] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[08:52:38] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[08:52:38] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[08:52:38] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[08:52:38] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[08:52:38] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[08:52:38] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[08:52:38] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[08:52:38] [PASSED] drm_test_check_output_bpc_dvi
[08:52:38] [PASSED] drm_test_check_output_bpc_format_vic_1
[08:52:38] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[08:52:38] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[08:52:38] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[08:52:38] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[08:52:38] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[08:52:38] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[08:52:38] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[08:52:38] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[08:52:38] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[08:52:38] [PASSED] drm_test_check_broadcast_rgb_value
[08:52:38] [PASSED] drm_test_check_bpc_8_value
[08:52:38] [PASSED] drm_test_check_bpc_10_value
[08:52:38] [PASSED] drm_test_check_bpc_12_value
[08:52:38] [PASSED] drm_test_check_format_value
[08:52:38] [PASSED] drm_test_check_tmds_char_value
[08:52:38] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[08:52:38] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[08:52:38] [PASSED] drm_test_check_mode_valid
[08:52:38] [PASSED] drm_test_check_mode_valid_reject
[08:52:38] [PASSED] drm_test_check_mode_valid_reject_rate
[08:52:38] [PASSED] drm_test_check_mode_valid_reject_max_clock
[08:52:38] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[08:52:38] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[08:52:38] [PASSED] drm_test_check_infoframes
[08:52:38] [PASSED] drm_test_check_reject_avi_infoframe
[08:52:38] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[08:52:38] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[08:52:38] [PASSED] drm_test_check_reject_audio_infoframe
[08:52:38] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[08:52:38] ================= drm_managed (2 subtests) =================
[08:52:38] [PASSED] drm_test_managed_release_action
[08:52:38] [PASSED] drm_test_managed_run_action
[08:52:38] =================== [PASSED] drm_managed ===================
[08:52:38] =================== drm_mm (6 subtests) ====================
[08:52:38] [PASSED] drm_test_mm_init
[08:52:38] [PASSED] drm_test_mm_debug
[08:52:38] [PASSED] drm_test_mm_align32
[08:52:38] [PASSED] drm_test_mm_align64
[08:52:38] [PASSED] drm_test_mm_lowest
[08:52:38] [PASSED] drm_test_mm_highest
[08:52:38] ===================== [PASSED] drm_mm ======================
[08:52:38] ============= drm_modes_analog_tv (5 subtests) =============
[08:52:38] [PASSED] drm_test_modes_analog_tv_mono_576i
[08:52:38] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[08:52:38] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[08:52:38] [PASSED] drm_test_modes_analog_tv_pal_576i
[08:52:38] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[08:52:38] =============== [PASSED] drm_modes_analog_tv ===============
[08:52:38] ============== drm_plane_helper (2 subtests) ===============
[08:52:38] =============== drm_test_check_plane_state  ================
[08:52:38] [PASSED] clipping_simple
[08:52:38] [PASSED] clipping_rotate_reflect
[08:52:38] [PASSED] positioning_simple
[08:52:38] [PASSED] upscaling
[08:52:38] [PASSED] downscaling
[08:52:38] [PASSED] rounding1
[08:52:38] [PASSED] rounding2
[08:52:38] [PASSED] rounding3
[08:52:38] [PASSED] rounding4
[08:52:38] =========== [PASSED] drm_test_check_plane_state ============
[08:52:38] =========== drm_test_check_invalid_plane_state  ============
[08:52:38] [PASSED] positioning_invalid
[08:52:38] [PASSED] upscaling_invalid
[08:52:38] [PASSED] downscaling_invalid
[08:52:38] ======= [PASSED] drm_test_check_invalid_plane_state ========
[08:52:38] ================ [PASSED] drm_plane_helper =================
[08:52:38] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[08:52:38] ====== drm_test_connector_helper_tv_get_modes_check  =======
[08:52:38] [PASSED] None
[08:52:38] [PASSED] PAL
[08:52:38] [PASSED] NTSC
[08:52:38] [PASSED] Both, NTSC Default
[08:52:38] [PASSED] Both, PAL Default
[08:52:38] [PASSED] Both, NTSC Default, with PAL on command-line
[08:52:38] [PASSED] Both, PAL Default, with NTSC on command-line
[08:52:38] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[08:52:38] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[08:52:38] ================== drm_rect (9 subtests) ===================
[08:52:38] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[08:52:38] [PASSED] drm_test_rect_clip_scaled_not_clipped
[08:52:38] [PASSED] drm_test_rect_clip_scaled_clipped
[08:52:38] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[08:52:38] ================= drm_test_rect_intersect  =================
[08:52:38] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[08:52:38] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[08:52:38] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[08:52:38] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[08:52:38] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[08:52:38] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[08:52:38] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[08:52:38] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[08:52:38] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[08:52:38] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[08:52:38] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[08:52:38] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[08:52:38] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[08:52:38] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[08:52:38] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[08:52:38] ============= [PASSED] drm_test_rect_intersect =============
[08:52:38] ================ drm_test_rect_calc_hscale  ================
[08:52:38] [PASSED] normal use
[08:52:38] [PASSED] out of max range
[08:52:38] [PASSED] out of min range
[08:52:38] [PASSED] zero dst
[08:52:38] [PASSED] negative src
[08:52:38] [PASSED] negative dst
[08:52:38] ============ [PASSED] drm_test_rect_calc_hscale ============
[08:52:38] ================ drm_test_rect_calc_vscale  ================
[08:52:38] [PASSED] normal use
[08:52:38] [PASSED] out of max range
[08:52:38] [PASSED] out of min range
[08:52:38] [PASSED] zero dst
[08:52:38] [PASSED] negative src
[08:52:38] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[08:52:38] ============ [PASSED] drm_test_rect_calc_vscale ============
[08:52:38] ================== drm_test_rect_rotate  ===================
[08:52:38] [PASSED] reflect-x
[08:52:38] [PASSED] reflect-y
[08:52:38] [PASSED] rotate-0
[08:52:38] [PASSED] rotate-90
[08:52:38] [PASSED] rotate-180
[08:52:38] [PASSED] rotate-270
[08:52:38] ============== [PASSED] drm_test_rect_rotate ===============
[08:52:38] ================ drm_test_rect_rotate_inv  =================
[08:52:38] [PASSED] reflect-x
[08:52:38] [PASSED] reflect-y
[08:52:38] [PASSED] rotate-0
[08:52:38] [PASSED] rotate-90
[08:52:38] [PASSED] rotate-180
[08:52:38] [PASSED] rotate-270
[08:52:38] ============ [PASSED] drm_test_rect_rotate_inv =============
[08:52:38] ==================== [PASSED] drm_rect =====================
[08:52:38] ============ drm_sysfb_modeset_test (1 subtest) ============
[08:52:38] ============ drm_test_sysfb_build_fourcc_list  =============
[08:52:38] [PASSED] no native formats
[08:52:38] [PASSED] XRGB8888 as native format
[08:52:38] [PASSED] remove duplicates
[08:52:38] [PASSED] convert alpha formats
[08:52:38] [PASSED] random formats
[08:52:38] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[08:52:38] ============= [PASSED] drm_sysfb_modeset_test ==============
[08:52:38] ================== drm_fixp (2 subtests) ===================
[08:52:38] [PASSED] drm_test_int2fixp
[08:52:38] [PASSED] drm_test_sm2fixp
[08:52:38] ==================== [PASSED] drm_fixp =====================
[08:52:38] ============================================================
[08:52:38] Testing complete. Ran 621 tests: passed: 621
[08:52:38] Elapsed time: 26.182s total, 1.677s configuring, 24.328s building, 0.175s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[08:52:38] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:52:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:52:50] Starting KUnit Kernel (1/1)...
[08:52:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:52:50] ================= ttm_device (5 subtests) ==================
[08:52:50] [PASSED] ttm_device_init_basic
[08:52:50] [PASSED] ttm_device_init_multiple
[08:52:50] [PASSED] ttm_device_fini_basic
[08:52:50] [PASSED] ttm_device_init_no_vma_man
[08:52:50] ================== ttm_device_init_pools  ==================
[08:52:50] [PASSED] No DMA allocations, no DMA32 required
[08:52:50] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[08:52:50] Expected !list_lru_count(&pt.pages) to be false, but is true
[08:52:50] [FAILED] DMA allocations, DMA32 required
[08:52:50] [PASSED] No DMA allocations, DMA32 required
[08:52:50]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[08:52:50]     Expected !list_lru_count(&pt.pages) to be false, but is true
[08:52:50] ------------[ cut here ]------------
[08:52:50] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[08:52:50] refcount_t: underflow; use-after-free.
[08:52:50] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g923ed0e932b6 #3 VOLUNTARY
[08:52:50] Tainted: [W]=WARN, [N]=TEST
[08:52:50] Stack:
[08:52:50]  6044ed8b 00000000 00000000 00000001
[08:52:50]  ffffff00 6044ed8b 6032367a 00000009
[08:52:50]  0000001c 60043e88 6002381c dc8cbd40
[08:52:50] Call Trace:
[08:52:50]  [<6032367a>] ? devres_release_all+0xaa/0x100
[08:52:50]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[08:52:50]  [<6002381c>] ? _printk+0x0/0x65
[08:52:50]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[08:52:50]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[08:52:50]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[08:52:50]  [<60052e36>] ? um_set_signals+0x36/0x60
[08:52:50]  [<600c5a42>] ? call_rcu+0x52/0x90
[08:52:50]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[08:52:50]  [<60147f50>] ? kfree+0x0/0x250
[08:52:50]  [<6032367a>] ? devres_release_all+0xaa/0x100
[08:52:50]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[08:52:50]  [<6031c3c0>] ? bus_notify+0x0/0x60
[08:52:50]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[08:52:50]  [<60398620>] ? mutex_lock+0x0/0x40
[08:52:50]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[08:52:50]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[08:52:50]  [<60372210>] ? kobject_put+0x0/0x150
[08:52:50]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[08:52:50]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[08:52:50]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[08:52:50]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[08:52:50]  [<60315a8c>] ? device_del+0x1bc/0x600
[08:52:50]  [<60052e00>] ? um_set_signals+0x0/0x60
[08:52:50]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[08:52:50]  [<60052e00>] ? um_set_signals+0x0/0x60
[08:52:50]  [<60315ee4>] ? device_unregister+0x14/0x40
[08:52:50]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[08:52:50]  [<60257d70>] ? kunit_release_action+0x0/0x170
[08:52:50]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[08:52:50]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[08:52:50]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[08:52:50]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[08:52:50]  [<60081e36>] ? kthread+0xe6/0x150
[08:52:50]  [<60046435>] ? new_thread_handler+0x45/0x60
[08:52:50] ---[ end trace 0000000000000000 ]---
[08:52:50] [FAILED] DMA allocations, no DMA32 required
[08:52:50] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[08:52:50] ============== [FAILED] ttm_device_init_pools ==============
[08:52:50]     # module: ttm_device_test
[08:52:50] # ttm_device: pass:4 fail:1 skip:0 total:5
[08:52:50] # Totals: pass:6 fail:2 skip:0 total:8
[08:52:50] =================== [FAILED] ttm_device ====================
[08:52:50] ================== ttm_pool (8 subtests) ===================
[08:52:50] ================== ttm_pool_alloc_basic  ===================
[08:52:50] [PASSED] One page
[08:52:50] [PASSED] More than one page
[08:52:50] [PASSED] Above the allocation limit
[08:52:50] [PASSED] One page, with coherent DMA mappings enabled
[08:52:50] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:52:50] ============== [PASSED] ttm_pool_alloc_basic ===============
[08:52:50] ============== ttm_pool_alloc_basic_dma_addr  ==============
[08:52:50] [PASSED] One page
[08:52:50] [PASSED] More than one page
[08:52:50] [PASSED] Above the allocation limit
[08:52:50] [PASSED] One page, with coherent DMA mappings enabled
[08:52:50] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:52:50] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[08:52:50] [PASSED] ttm_pool_alloc_order_caching_match
[08:52:50] [PASSED] ttm_pool_alloc_caching_mismatch
[08:52:50] [PASSED] ttm_pool_alloc_order_mismatch
[08:52:50] [PASSED] ttm_pool_free_dma_alloc
[08:52:50] [ERROR] Test: ttm_pool: missing expected subtest!
[08:52:50] 
[08:52:50] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g923ed0e932b6
[08:52:50] RIP: 0033:list_lru_count_node+0xe/0x20
[08:52:50] RSP: 00000000dc8cbed8  EFLAGS: 00010246
[08:52:50] RAX: 0000000000000000 RBX: 00000000dc803c90 RCX: 000000009ce4c7d8
[08:52:50] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000009cc86880
[08:52:50] RBP: 000000009cc86800 R08: 00000000db67cc28 R09: 000000009cc50c80
[08:52:50] R10: 0000000000000000 R11: 0000000000000000 R12: 000000009cc50c80
[08:52:50] R13: 0000000060440770 R14: 000000006010eb50 R15: 000000009cc86880
[08:52:50] Kernel panic - not syncing: Segfault with no mm
[08:52:50] [CRASHED] 
[08:52:50] [ERROR] Test: ttm_pool: missing expected subtest!
[08:52:50] [CRASHED] 
[08:52:50] [ERROR] Test: ttm_pool: missing subtest result line!
[08:52:50] # module: ttm_pool_test
[08:52:50] ==================== [CRASHED] ttm_pool ====================
[08:52:50] [ERROR] Test: main: missing expected subtest!
[08:52:50] [CRASHED] 
[08:52:50] [ERROR] Test: main: missing expected subtest!
[08:52:50] [CRASHED] 
[08:52:50] [ERROR] Test: main: missing expected subtest!
[08:52:50] [CRASHED] 
[08:52:50] [ERROR] Test: main: missing expected subtest!
[08:52:50] [CRASHED] 
[08:52:50] ============================================================
[08:52:50] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[08:52:50] Elapsed time: 11.433s total, 1.712s configuring, 9.455s building, 0.266s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


