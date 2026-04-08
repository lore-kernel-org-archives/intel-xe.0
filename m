Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E26C1073CB6
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 13:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D7710E0DF;
	Wed,  8 Apr 2026 13:25:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2314C89A5C;
 Wed,  8 Apr 2026 13:25:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/i915/display=3A_start_swit?=
 =?utf-8?q?ching_to_display_specific_reg_types?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 13:25:29 -0000
Message-ID: <177565472912.441898.12219897223876222086@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1775653994.git.jani.nikula@intel.com>
In-Reply-To: <cover.1775653994.git.jani.nikula@intel.com>
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

Series: drm/i915/display: start switching to display specific reg types
URL   : https://patchwork.freedesktop.org/series/164540/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:23:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:23:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:24:12] Starting KUnit Kernel (1/1)...
[13:24:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:24:12] ================== guc_buf (11 subtests) ===================
[13:24:12] [PASSED] test_smallest
[13:24:12] [PASSED] test_largest
[13:24:12] [PASSED] test_granular
[13:24:12] [PASSED] test_unique
[13:24:12] [PASSED] test_overlap
[13:24:12] [PASSED] test_reusable
[13:24:12] [PASSED] test_too_big
[13:24:12] [PASSED] test_flush
[13:24:12] [PASSED] test_lookup
[13:24:12] [PASSED] test_data
[13:24:12] [PASSED] test_class
[13:24:12] ===================== [PASSED] guc_buf =====================
[13:24:12] =================== guc_dbm (7 subtests) ===================
[13:24:12] [PASSED] test_empty
[13:24:12] [PASSED] test_default
[13:24:12] ======================== test_size  ========================
[13:24:12] [PASSED] 4
[13:24:12] [PASSED] 8
[13:24:12] [PASSED] 32
[13:24:12] [PASSED] 256
[13:24:12] ==================== [PASSED] test_size ====================
[13:24:12] ======================= test_reuse  ========================
[13:24:12] [PASSED] 4
[13:24:12] [PASSED] 8
[13:24:12] [PASSED] 32
[13:24:12] [PASSED] 256
[13:24:12] =================== [PASSED] test_reuse ====================
[13:24:12] =================== test_range_overlap  ====================
[13:24:12] [PASSED] 4
[13:24:12] [PASSED] 8
[13:24:12] [PASSED] 32
[13:24:12] [PASSED] 256
[13:24:12] =============== [PASSED] test_range_overlap ================
[13:24:12] =================== test_range_compact  ====================
[13:24:12] [PASSED] 4
[13:24:12] [PASSED] 8
[13:24:12] [PASSED] 32
[13:24:12] [PASSED] 256
[13:24:12] =============== [PASSED] test_range_compact ================
[13:24:12] ==================== test_range_spare  =====================
[13:24:12] [PASSED] 4
[13:24:12] [PASSED] 8
[13:24:12] [PASSED] 32
[13:24:12] [PASSED] 256
[13:24:12] ================ [PASSED] test_range_spare =================
[13:24:12] ===================== [PASSED] guc_dbm =====================
[13:24:12] =================== guc_idm (6 subtests) ===================
[13:24:12] [PASSED] bad_init
[13:24:12] [PASSED] no_init
[13:24:12] [PASSED] init_fini
[13:24:12] [PASSED] check_used
[13:24:12] [PASSED] check_quota
[13:24:12] [PASSED] check_all
[13:24:12] ===================== [PASSED] guc_idm =====================
[13:24:12] ================== no_relay (3 subtests) ===================
[13:24:12] [PASSED] xe_drops_guc2pf_if_not_ready
[13:24:12] [PASSED] xe_drops_guc2vf_if_not_ready
[13:24:12] [PASSED] xe_rejects_send_if_not_ready
[13:24:12] ==================== [PASSED] no_relay =====================
[13:24:12] ================== pf_relay (14 subtests) ==================
[13:24:12] [PASSED] pf_rejects_guc2pf_too_short
[13:24:12] [PASSED] pf_rejects_guc2pf_too_long
[13:24:12] [PASSED] pf_rejects_guc2pf_no_payload
[13:24:12] [PASSED] pf_fails_no_payload
[13:24:12] [PASSED] pf_fails_bad_origin
[13:24:12] [PASSED] pf_fails_bad_type
[13:24:12] [PASSED] pf_txn_reports_error
[13:24:12] [PASSED] pf_txn_sends_pf2guc
[13:24:12] [PASSED] pf_sends_pf2guc
[13:24:12] [SKIPPED] pf_loopback_nop
[13:24:12] [SKIPPED] pf_loopback_echo
[13:24:12] [SKIPPED] pf_loopback_fail
[13:24:12] [SKIPPED] pf_loopback_busy
[13:24:12] [SKIPPED] pf_loopback_retry
[13:24:12] ==================== [PASSED] pf_relay =====================
[13:24:12] ================== vf_relay (3 subtests) ===================
[13:24:12] [PASSED] vf_rejects_guc2vf_too_short
[13:24:12] [PASSED] vf_rejects_guc2vf_too_long
[13:24:12] [PASSED] vf_rejects_guc2vf_no_payload
[13:24:12] ==================== [PASSED] vf_relay =====================
[13:24:12] ================ pf_gt_config (9 subtests) =================
[13:24:12] [PASSED] fair_contexts_1vf
[13:24:12] [PASSED] fair_doorbells_1vf
[13:24:12] [PASSED] fair_ggtt_1vf
[13:24:12] ====================== fair_vram_1vf  ======================
[13:24:12] [PASSED] 3.50 GiB
[13:24:12] [PASSED] 11.5 GiB
[13:24:12] [PASSED] 15.5 GiB
[13:24:12] [PASSED] 31.5 GiB
[13:24:12] [PASSED] 63.5 GiB
[13:24:12] [PASSED] 1.91 GiB
[13:24:12] ================== [PASSED] fair_vram_1vf ==================
[13:24:12] ================ fair_vram_1vf_admin_only  =================
[13:24:12] [PASSED] 3.50 GiB
[13:24:12] [PASSED] 11.5 GiB
[13:24:12] [PASSED] 15.5 GiB
[13:24:12] [PASSED] 31.5 GiB
[13:24:12] [PASSED] 63.5 GiB
[13:24:12] [PASSED] 1.91 GiB
[13:24:12] ============ [PASSED] fair_vram_1vf_admin_only =============
[13:24:12] ====================== fair_contexts  ======================
[13:24:12] [PASSED] 1 VF
[13:24:12] [PASSED] 2 VFs
[13:24:12] [PASSED] 3 VFs
[13:24:12] [PASSED] 4 VFs
[13:24:12] [PASSED] 5 VFs
[13:24:12] [PASSED] 6 VFs
[13:24:12] [PASSED] 7 VFs
[13:24:12] [PASSED] 8 VFs
[13:24:12] [PASSED] 9 VFs
[13:24:12] [PASSED] 10 VFs
[13:24:12] [PASSED] 11 VFs
[13:24:12] [PASSED] 12 VFs
[13:24:12] [PASSED] 13 VFs
[13:24:12] [PASSED] 14 VFs
[13:24:12] [PASSED] 15 VFs
[13:24:12] [PASSED] 16 VFs
[13:24:12] [PASSED] 17 VFs
[13:24:12] [PASSED] 18 VFs
[13:24:12] [PASSED] 19 VFs
[13:24:12] [PASSED] 20 VFs
[13:24:12] [PASSED] 21 VFs
[13:24:12] [PASSED] 22 VFs
[13:24:12] [PASSED] 23 VFs
[13:24:12] [PASSED] 24 VFs
[13:24:12] [PASSED] 25 VFs
[13:24:12] [PASSED] 26 VFs
[13:24:12] [PASSED] 27 VFs
[13:24:12] [PASSED] 28 VFs
[13:24:12] [PASSED] 29 VFs
[13:24:12] [PASSED] 30 VFs
[13:24:12] [PASSED] 31 VFs
[13:24:12] [PASSED] 32 VFs
[13:24:12] [PASSED] 33 VFs
[13:24:12] [PASSED] 34 VFs
[13:24:12] [PASSED] 35 VFs
[13:24:12] [PASSED] 36 VFs
[13:24:12] [PASSED] 37 VFs
[13:24:12] [PASSED] 38 VFs
[13:24:12] [PASSED] 39 VFs
[13:24:12] [PASSED] 40 VFs
[13:24:12] [PASSED] 41 VFs
[13:24:12] [PASSED] 42 VFs
[13:24:12] [PASSED] 43 VFs
[13:24:12] [PASSED] 44 VFs
[13:24:12] [PASSED] 45 VFs
[13:24:12] [PASSED] 46 VFs
[13:24:12] [PASSED] 47 VFs
[13:24:12] [PASSED] 48 VFs
[13:24:12] [PASSED] 49 VFs
[13:24:12] [PASSED] 50 VFs
[13:24:12] [PASSED] 51 VFs
[13:24:12] [PASSED] 52 VFs
[13:24:12] [PASSED] 53 VFs
[13:24:12] [PASSED] 54 VFs
[13:24:12] [PASSED] 55 VFs
[13:24:12] [PASSED] 56 VFs
[13:24:12] [PASSED] 57 VFs
[13:24:12] [PASSED] 58 VFs
[13:24:12] [PASSED] 59 VFs
[13:24:12] [PASSED] 60 VFs
[13:24:12] [PASSED] 61 VFs
[13:24:12] [PASSED] 62 VFs
[13:24:12] [PASSED] 63 VFs
[13:24:12] ================== [PASSED] fair_contexts ==================
[13:24:12] ===================== fair_doorbells  ======================
[13:24:12] [PASSED] 1 VF
[13:24:12] [PASSED] 2 VFs
[13:24:12] [PASSED] 3 VFs
[13:24:12] [PASSED] 4 VFs
[13:24:12] [PASSED] 5 VFs
[13:24:12] [PASSED] 6 VFs
[13:24:12] [PASSED] 7 VFs
[13:24:12] [PASSED] 8 VFs
[13:24:12] [PASSED] 9 VFs
[13:24:12] [PASSED] 10 VFs
[13:24:12] [PASSED] 11 VFs
[13:24:12] [PASSED] 12 VFs
[13:24:12] [PASSED] 13 VFs
[13:24:12] [PASSED] 14 VFs
[13:24:12] [PASSED] 15 VFs
[13:24:12] [PASSED] 16 VFs
[13:24:12] [PASSED] 17 VFs
[13:24:12] [PASSED] 18 VFs
[13:24:12] [PASSED] 19 VFs
[13:24:12] [PASSED] 20 VFs
[13:24:12] [PASSED] 21 VFs
[13:24:12] [PASSED] 22 VFs
[13:24:12] [PASSED] 23 VFs
[13:24:12] [PASSED] 24 VFs
[13:24:12] [PASSED] 25 VFs
[13:24:12] [PASSED] 26 VFs
[13:24:12] [PASSED] 27 VFs
[13:24:12] [PASSED] 28 VFs
[13:24:12] [PASSED] 29 VFs
[13:24:12] [PASSED] 30 VFs
[13:24:12] [PASSED] 31 VFs
[13:24:12] [PASSED] 32 VFs
[13:24:12] [PASSED] 33 VFs
[13:24:13] [PASSED] 34 VFs
[13:24:13] [PASSED] 35 VFs
[13:24:13] [PASSED] 36 VFs
[13:24:13] [PASSED] 37 VFs
[13:24:13] [PASSED] 38 VFs
[13:24:13] [PASSED] 39 VFs
[13:24:13] [PASSED] 40 VFs
[13:24:13] [PASSED] 41 VFs
[13:24:13] [PASSED] 42 VFs
[13:24:13] [PASSED] 43 VFs
[13:24:13] [PASSED] 44 VFs
[13:24:13] [PASSED] 45 VFs
[13:24:13] [PASSED] 46 VFs
[13:24:13] [PASSED] 47 VFs
[13:24:13] [PASSED] 48 VFs
[13:24:13] [PASSED] 49 VFs
[13:24:13] [PASSED] 50 VFs
[13:24:13] [PASSED] 51 VFs
[13:24:13] [PASSED] 52 VFs
[13:24:13] [PASSED] 53 VFs
[13:24:13] [PASSED] 54 VFs
[13:24:13] [PASSED] 55 VFs
[13:24:13] [PASSED] 56 VFs
[13:24:13] [PASSED] 57 VFs
[13:24:13] [PASSED] 58 VFs
[13:24:13] [PASSED] 59 VFs
[13:24:13] [PASSED] 60 VFs
[13:24:13] [PASSED] 61 VFs
[13:24:13] [PASSED] 62 VFs
[13:24:13] [PASSED] 63 VFs
[13:24:13] ================= [PASSED] fair_doorbells ==================
[13:24:13] ======================== fair_ggtt  ========================
[13:24:13] [PASSED] 1 VF
[13:24:13] [PASSED] 2 VFs
[13:24:13] [PASSED] 3 VFs
[13:24:13] [PASSED] 4 VFs
[13:24:13] [PASSED] 5 VFs
[13:24:13] [PASSED] 6 VFs
[13:24:13] [PASSED] 7 VFs
[13:24:13] [PASSED] 8 VFs
[13:24:13] [PASSED] 9 VFs
[13:24:13] [PASSED] 10 VFs
[13:24:13] [PASSED] 11 VFs
[13:24:13] [PASSED] 12 VFs
[13:24:13] [PASSED] 13 VFs
[13:24:13] [PASSED] 14 VFs
[13:24:13] [PASSED] 15 VFs
[13:24:13] [PASSED] 16 VFs
[13:24:13] [PASSED] 17 VFs
[13:24:13] [PASSED] 18 VFs
[13:24:13] [PASSED] 19 VFs
[13:24:13] [PASSED] 20 VFs
[13:24:13] [PASSED] 21 VFs
[13:24:13] [PASSED] 22 VFs
[13:24:13] [PASSED] 23 VFs
[13:24:13] [PASSED] 24 VFs
[13:24:13] [PASSED] 25 VFs
[13:24:13] [PASSED] 26 VFs
[13:24:13] [PASSED] 27 VFs
[13:24:13] [PASSED] 28 VFs
[13:24:13] [PASSED] 29 VFs
[13:24:13] [PASSED] 30 VFs
[13:24:13] [PASSED] 31 VFs
[13:24:13] [PASSED] 32 VFs
[13:24:13] [PASSED] 33 VFs
[13:24:13] [PASSED] 34 VFs
[13:24:13] [PASSED] 35 VFs
[13:24:13] [PASSED] 36 VFs
[13:24:13] [PASSED] 37 VFs
[13:24:13] [PASSED] 38 VFs
[13:24:13] [PASSED] 39 VFs
[13:24:13] [PASSED] 40 VFs
[13:24:13] [PASSED] 41 VFs
[13:24:13] [PASSED] 42 VFs
[13:24:13] [PASSED] 43 VFs
[13:24:13] [PASSED] 44 VFs
[13:24:13] [PASSED] 45 VFs
[13:24:13] [PASSED] 46 VFs
[13:24:13] [PASSED] 47 VFs
[13:24:13] [PASSED] 48 VFs
[13:24:13] [PASSED] 49 VFs
[13:24:13] [PASSED] 50 VFs
[13:24:13] [PASSED] 51 VFs
[13:24:13] [PASSED] 52 VFs
[13:24:13] [PASSED] 53 VFs
[13:24:13] [PASSED] 54 VFs
[13:24:13] [PASSED] 55 VFs
[13:24:13] [PASSED] 56 VFs
[13:24:13] [PASSED] 57 VFs
[13:24:13] [PASSED] 58 VFs
[13:24:13] [PASSED] 59 VFs
[13:24:13] [PASSED] 60 VFs
[13:24:13] [PASSED] 61 VFs
[13:24:13] [PASSED] 62 VFs
[13:24:13] [PASSED] 63 VFs
[13:24:13] ==================== [PASSED] fair_ggtt ====================
[13:24:13] ======================== fair_vram  ========================
[13:24:13] [PASSED] 1 VF
[13:24:13] [PASSED] 2 VFs
[13:24:13] [PASSED] 3 VFs
[13:24:13] [PASSED] 4 VFs
[13:24:13] [PASSED] 5 VFs
[13:24:13] [PASSED] 6 VFs
[13:24:13] [PASSED] 7 VFs
[13:24:13] [PASSED] 8 VFs
[13:24:13] [PASSED] 9 VFs
[13:24:13] [PASSED] 10 VFs
[13:24:13] [PASSED] 11 VFs
[13:24:13] [PASSED] 12 VFs
[13:24:13] [PASSED] 13 VFs
[13:24:13] [PASSED] 14 VFs
[13:24:13] [PASSED] 15 VFs
[13:24:13] [PASSED] 16 VFs
[13:24:13] [PASSED] 17 VFs
[13:24:13] [PASSED] 18 VFs
[13:24:13] [PASSED] 19 VFs
[13:24:13] [PASSED] 20 VFs
[13:24:13] [PASSED] 21 VFs
[13:24:13] [PASSED] 22 VFs
[13:24:13] [PASSED] 23 VFs
[13:24:13] [PASSED] 24 VFs
[13:24:13] [PASSED] 25 VFs
[13:24:13] [PASSED] 26 VFs
[13:24:13] [PASSED] 27 VFs
[13:24:13] [PASSED] 28 VFs
[13:24:13] [PASSED] 29 VFs
[13:24:13] [PASSED] 30 VFs
[13:24:13] [PASSED] 31 VFs
[13:24:13] [PASSED] 32 VFs
[13:24:13] [PASSED] 33 VFs
[13:24:13] [PASSED] 34 VFs
[13:24:13] [PASSED] 35 VFs
[13:24:13] [PASSED] 36 VFs
[13:24:13] [PASSED] 37 VFs
[13:24:13] [PASSED] 38 VFs
[13:24:13] [PASSED] 39 VFs
[13:24:13] [PASSED] 40 VFs
[13:24:13] [PASSED] 41 VFs
[13:24:13] [PASSED] 42 VFs
[13:24:13] [PASSED] 43 VFs
[13:24:13] [PASSED] 44 VFs
[13:24:13] [PASSED] 45 VFs
[13:24:13] [PASSED] 46 VFs
[13:24:13] [PASSED] 47 VFs
[13:24:13] [PASSED] 48 VFs
[13:24:13] [PASSED] 49 VFs
[13:24:13] [PASSED] 50 VFs
[13:24:13] [PASSED] 51 VFs
[13:24:13] [PASSED] 52 VFs
[13:24:13] [PASSED] 53 VFs
[13:24:13] [PASSED] 54 VFs
[13:24:13] [PASSED] 55 VFs
[13:24:13] [PASSED] 56 VFs
[13:24:13] [PASSED] 57 VFs
[13:24:13] [PASSED] 58 VFs
[13:24:13] [PASSED] 59 VFs
[13:24:13] [PASSED] 60 VFs
[13:24:13] [PASSED] 61 VFs
[13:24:13] [PASSED] 62 VFs
[13:24:13] [PASSED] 63 VFs
[13:24:13] ==================== [PASSED] fair_vram ====================
[13:24:13] ================== [PASSED] pf_gt_config ===================
[13:24:13] ===================== lmtt (1 subtest) =====================
[13:24:13] ======================== test_ops  =========================
[13:24:13] [PASSED] 2-level
[13:24:13] [PASSED] multi-level
[13:24:13] ==================== [PASSED] test_ops =====================
[13:24:13] ====================== [PASSED] lmtt =======================
[13:24:13] ================= pf_service (11 subtests) =================
[13:24:13] [PASSED] pf_negotiate_any
[13:24:13] [PASSED] pf_negotiate_base_match
[13:24:13] [PASSED] pf_negotiate_base_newer
[13:24:13] [PASSED] pf_negotiate_base_next
[13:24:13] [SKIPPED] pf_negotiate_base_older
[13:24:13] [PASSED] pf_negotiate_base_prev
[13:24:13] [PASSED] pf_negotiate_latest_match
[13:24:13] [PASSED] pf_negotiate_latest_newer
[13:24:13] [PASSED] pf_negotiate_latest_next
[13:24:13] [SKIPPED] pf_negotiate_latest_older
[13:24:13] [SKIPPED] pf_negotiate_latest_prev
[13:24:13] =================== [PASSED] pf_service ====================
[13:24:13] ================= xe_guc_g2g (2 subtests) ==================
[13:24:13] ============== xe_live_guc_g2g_kunit_default  ==============
[13:24:13] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[13:24:13] ============== xe_live_guc_g2g_kunit_allmem  ===============
[13:24:13] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[13:24:13] =================== [SKIPPED] xe_guc_g2g ===================
[13:24:13] =================== xe_mocs (2 subtests) ===================
[13:24:13] ================ xe_live_mocs_kernel_kunit  ================
[13:24:13] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[13:24:13] ================ xe_live_mocs_reset_kunit  =================
[13:24:13] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[13:24:13] ==================== [SKIPPED] xe_mocs =====================
[13:24:13] ================= xe_migrate (2 subtests) ==================
[13:24:13] ================= xe_migrate_sanity_kunit  =================
[13:24:13] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[13:24:13] ================== xe_validate_ccs_kunit  ==================
[13:24:13] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[13:24:13] =================== [SKIPPED] xe_migrate ===================
[13:24:13] ================== xe_dma_buf (1 subtest) ==================
[13:24:13] ==================== xe_dma_buf_kunit  =====================
[13:24:13] ================ [SKIPPED] xe_dma_buf_kunit ================
[13:24:13] =================== [SKIPPED] xe_dma_buf ===================
[13:24:13] ================= xe_bo_shrink (1 subtest) =================
[13:24:13] =================== xe_bo_shrink_kunit  ====================
[13:24:13] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[13:24:13] ================== [SKIPPED] xe_bo_shrink ==================
[13:24:13] ==================== xe_bo (2 subtests) ====================
[13:24:13] ================== xe_ccs_migrate_kunit  ===================
[13:24:13] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[13:24:13] ==================== xe_bo_evict_kunit  ====================
[13:24:13] =============== [SKIPPED] xe_bo_evict_kunit ================
[13:24:13] ===================== [SKIPPED] xe_bo ======================
[13:24:13] ==================== args (13 subtests) ====================
[13:24:13] [PASSED] count_args_test
[13:24:13] [PASSED] call_args_example
[13:24:13] [PASSED] call_args_test
[13:24:13] [PASSED] drop_first_arg_example
[13:24:13] [PASSED] drop_first_arg_test
[13:24:13] [PASSED] first_arg_example
[13:24:13] [PASSED] first_arg_test
[13:24:13] [PASSED] last_arg_example
[13:24:13] [PASSED] last_arg_test
[13:24:13] [PASSED] pick_arg_example
[13:24:13] [PASSED] if_args_example
[13:24:13] [PASSED] if_args_test
[13:24:13] [PASSED] sep_comma_example
[13:24:13] ====================== [PASSED] args =======================
[13:24:13] =================== xe_pci (3 subtests) ====================
[13:24:13] ==================== check_graphics_ip  ====================
[13:24:13] [PASSED] 12.00 Xe_LP
[13:24:13] [PASSED] 12.10 Xe_LP+
[13:24:13] [PASSED] 12.55 Xe_HPG
[13:24:13] [PASSED] 12.60 Xe_HPC
[13:24:13] [PASSED] 12.70 Xe_LPG
[13:24:13] [PASSED] 12.71 Xe_LPG
[13:24:13] [PASSED] 12.74 Xe_LPG+
[13:24:13] [PASSED] 20.01 Xe2_HPG
[13:24:13] [PASSED] 20.02 Xe2_HPG
[13:24:13] [PASSED] 20.04 Xe2_LPG
[13:24:13] [PASSED] 30.00 Xe3_LPG
[13:24:13] [PASSED] 30.01 Xe3_LPG
[13:24:13] [PASSED] 30.03 Xe3_LPG
[13:24:13] [PASSED] 30.04 Xe3_LPG
[13:24:13] [PASSED] 30.05 Xe3_LPG
[13:24:13] [PASSED] 35.10 Xe3p_LPG
[13:24:13] [PASSED] 35.11 Xe3p_XPC
[13:24:13] ================ [PASSED] check_graphics_ip ================
[13:24:13] ===================== check_media_ip  ======================
[13:24:13] [PASSED] 12.00 Xe_M
[13:24:13] [PASSED] 12.55 Xe_HPM
[13:24:13] [PASSED] 13.00 Xe_LPM+
[13:24:13] [PASSED] 13.01 Xe2_HPM
[13:24:13] [PASSED] 20.00 Xe2_LPM
[13:24:13] [PASSED] 30.00 Xe3_LPM
[13:24:13] [PASSED] 30.02 Xe3_LPM
[13:24:13] [PASSED] 35.00 Xe3p_LPM
[13:24:13] [PASSED] 35.03 Xe3p_HPM
[13:24:13] ================= [PASSED] check_media_ip ==================
[13:24:13] =================== check_platform_desc  ===================
[13:24:13] [PASSED] 0x9A60 (TIGERLAKE)
[13:24:13] [PASSED] 0x9A68 (TIGERLAKE)
[13:24:13] [PASSED] 0x9A70 (TIGERLAKE)
[13:24:13] [PASSED] 0x9A40 (TIGERLAKE)
[13:24:13] [PASSED] 0x9A49 (TIGERLAKE)
[13:24:13] [PASSED] 0x9A59 (TIGERLAKE)
[13:24:13] [PASSED] 0x9A78 (TIGERLAKE)
[13:24:13] [PASSED] 0x9AC0 (TIGERLAKE)
[13:24:13] [PASSED] 0x9AC9 (TIGERLAKE)
[13:24:13] [PASSED] 0x9AD9 (TIGERLAKE)
[13:24:13] [PASSED] 0x9AF8 (TIGERLAKE)
[13:24:13] [PASSED] 0x4C80 (ROCKETLAKE)
[13:24:13] [PASSED] 0x4C8A (ROCKETLAKE)
[13:24:13] [PASSED] 0x4C8B (ROCKETLAKE)
[13:24:13] [PASSED] 0x4C8C (ROCKETLAKE)
[13:24:13] [PASSED] 0x4C90 (ROCKETLAKE)
[13:24:13] [PASSED] 0x4C9A (ROCKETLAKE)
[13:24:13] [PASSED] 0x4680 (ALDERLAKE_S)
[13:24:13] [PASSED] 0x4682 (ALDERLAKE_S)
[13:24:13] [PASSED] 0x4688 (ALDERLAKE_S)
[13:24:13] [PASSED] 0x468A (ALDERLAKE_S)
[13:24:13] [PASSED] 0x468B (ALDERLAKE_S)
[13:24:13] [PASSED] 0x4690 (ALDERLAKE_S)
[13:24:13] [PASSED] 0x4692 (ALDERLAKE_S)
[13:24:13] [PASSED] 0x4693 (ALDERLAKE_S)
[13:24:13] [PASSED] 0x46A0 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46A1 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46A2 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46A3 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46A6 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46A8 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46AA (ALDERLAKE_P)
[13:24:13] [PASSED] 0x462A (ALDERLAKE_P)
[13:24:13] [PASSED] 0x4626 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x4628 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46B0 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46B1 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46B2 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46B3 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46C0 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46C1 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46C2 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46C3 (ALDERLAKE_P)
[13:24:13] [PASSED] 0x46D0 (ALDERLAKE_N)
[13:24:13] [PASSED] 0x46D1 (ALDERLAKE_N)
[13:24:13] [PASSED] 0x46D2 (ALDERLAKE_N)
[13:24:13] [PASSED] 0x46D3 (ALDERLAKE_N)
[13:24:13] [PASSED] 0x46D4 (ALDERLAKE_N)
[13:24:13] [PASSED] 0xA721 (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7A1 (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7A9 (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7AC (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7AD (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA720 (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7A0 (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7A8 (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7AA (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA7AB (ALDERLAKE_P)
[13:24:13] [PASSED] 0xA780 (ALDERLAKE_S)
[13:24:13] [PASSED] 0xA781 (ALDERLAKE_S)
[13:24:13] [PASSED] 0xA782 (ALDERLAKE_S)
[13:24:13] [PASSED] 0xA783 (ALDERLAKE_S)
[13:24:13] [PASSED] 0xA788 (ALDERLAKE_S)
[13:24:13] [PASSED] 0xA789 (ALDERLAKE_S)
[13:24:13] [PASSED] 0xA78A (ALDERLAKE_S)
[13:24:13] [PASSED] 0xA78B (ALDERLAKE_S)
[13:24:13] [PASSED] 0x4905 (DG1)
[13:24:13] [PASSED] 0x4906 (DG1)
[13:24:13] [PASSED] 0x4907 (DG1)
[13:24:13] [PASSED] 0x4908 (DG1)
[13:24:13] [PASSED] 0x4909 (DG1)
[13:24:13] [PASSED] 0x56C0 (DG2)
[13:24:13] [PASSED] 0x56C2 (DG2)
[13:24:13] [PASSED] 0x56C1 (DG2)
[13:24:13] [PASSED] 0x7D51 (METEORLAKE)
[13:24:13] [PASSED] 0x7DD1 (METEORLAKE)
[13:24:13] [PASSED] 0x7D41 (METEORLAKE)
[13:24:13] [PASSED] 0x7D67 (METEORLAKE)
[13:24:13] [PASSED] 0xB640 (METEORLAKE)
[13:24:13] [PASSED] 0x56A0 (DG2)
[13:24:13] [PASSED] 0x56A1 (DG2)
[13:24:13] [PASSED] 0x56A2 (DG2)
[13:24:13] [PASSED] 0x56BE (DG2)
[13:24:13] [PASSED] 0x56BF (DG2)
[13:24:13] [PASSED] 0x5690 (DG2)
[13:24:13] [PASSED] 0x5691 (DG2)
[13:24:13] [PASSED] 0x5692 (DG2)
[13:24:13] [PASSED] 0x56A5 (DG2)
[13:24:13] [PASSED] 0x56A6 (DG2)
[13:24:13] [PASSED] 0x56B0 (DG2)
[13:24:13] [PASSED] 0x56B1 (DG2)
[13:24:13] [PASSED] 0x56BA (DG2)
[13:24:13] [PASSED] 0x56BB (DG2)
[13:24:13] [PASSED] 0x56BC (DG2)
[13:24:13] [PASSED] 0x56BD (DG2)
[13:24:13] [PASSED] 0x5693 (DG2)
[13:24:13] [PASSED] 0x5694 (DG2)
[13:24:13] [PASSED] 0x5695 (DG2)
[13:24:13] [PASSED] 0x56A3 (DG2)
[13:24:13] [PASSED] 0x56A4 (DG2)
[13:24:13] [PASSED] 0x56B2 (DG2)
[13:24:13] [PASSED] 0x56B3 (DG2)
[13:24:13] [PASSED] 0x5696 (DG2)
[13:24:13] [PASSED] 0x5697 (DG2)
[13:24:13] [PASSED] 0xB69 (PVC)
[13:24:13] [PASSED] 0xB6E (PVC)
[13:24:13] [PASSED] 0xBD4 (PVC)
[13:24:13] [PASSED] 0xBD5 (PVC)
[13:24:13] [PASSED] 0xBD6 (PVC)
[13:24:13] [PASSED] 0xBD7 (PVC)
[13:24:13] [PASSED] 0xBD8 (PVC)
[13:24:13] [PASSED] 0xBD9 (PVC)
[13:24:13] [PASSED] 0xBDA (PVC)
[13:24:13] [PASSED] 0xBDB (PVC)
[13:24:13] [PASSED] 0xBE0 (PVC)
[13:24:13] [PASSED] 0xBE1 (PVC)
[13:24:13] [PASSED] 0xBE5 (PVC)
[13:24:13] [PASSED] 0x7D40 (METEORLAKE)
[13:24:13] [PASSED] 0x7D45 (METEORLAKE)
[13:24:13] [PASSED] 0x7D55 (METEORLAKE)
[13:24:13] [PASSED] 0x7D60 (METEORLAKE)
[13:24:13] [PASSED] 0x7DD5 (METEORLAKE)
[13:24:13] [PASSED] 0x6420 (LUNARLAKE)
[13:24:13] [PASSED] 0x64A0 (LUNARLAKE)
[13:24:13] [PASSED] 0x64B0 (LUNARLAKE)
[13:24:13] [PASSED] 0xE202 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE209 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE20B (BATTLEMAGE)
[13:24:13] [PASSED] 0xE20C (BATTLEMAGE)
[13:24:13] [PASSED] 0xE20D (BATTLEMAGE)
[13:24:13] [PASSED] 0xE210 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE211 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE212 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE216 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE220 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE221 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE222 (BATTLEMAGE)
[13:24:13] [PASSED] 0xE223 (BATTLEMAGE)
[13:24:13] [PASSED] 0xB080 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB081 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB082 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB083 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB084 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB085 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB086 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB087 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB08F (PANTHERLAKE)
[13:24:13] [PASSED] 0xB090 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB0A0 (PANTHERLAKE)
[13:24:13] [PASSED] 0xB0B0 (PANTHERLAKE)
[13:24:13] [PASSED] 0xFD80 (PANTHERLAKE)
[13:24:13] [PASSED] 0xFD81 (PANTHERLAKE)
[13:24:13] [PASSED] 0xD740 (NOVALAKE_S)
[13:24:13] [PASSED] 0xD741 (NOVALAKE_S)
[13:24:13] [PASSED] 0xD742 (NOVALAKE_S)
[13:24:13] [PASSED] 0xD743 (NOVALAKE_S)
[13:24:13] [PASSED] 0xD744 (NOVALAKE_S)
[13:24:13] [PASSED] 0xD745 (NOVALAKE_S)
[13:24:13] [PASSED] 0x674C (CRESCENTISLAND)
[13:24:13] [PASSED] 0xD750 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD751 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD752 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD753 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD754 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD755 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD756 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD757 (NOVALAKE_P)
[13:24:13] [PASSED] 0xD75F (NOVALAKE_P)
[13:24:13] =============== [PASSED] check_platform_desc ===============
[13:24:13] ===================== [PASSED] xe_pci ======================
[13:24:13] =================== xe_rtp (2 subtests) ====================
[13:24:13] =============== xe_rtp_process_to_sr_tests  ================
[13:24:13] [PASSED] coalesce-same-reg
[13:24:13] [PASSED] no-match-no-add
[13:24:13] [PASSED] match-or
[13:24:13] [PASSED] match-or-xfail
[13:24:13] [PASSED] no-match-no-add-multiple-rules
[13:24:13] [PASSED] two-regs-two-entries
[13:24:13] [PASSED] clr-one-set-other
[13:24:13] [PASSED] set-field
[13:24:13] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[13:24:13] [PASSED] conflict-not-disjoint
[13:24:13] [PASSED] conflict-reg-type
[13:24:13] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[13:24:13] ================== xe_rtp_process_tests  ===================
[13:24:13] [PASSED] active1
[13:24:13] [PASSED] active2
[13:24:13] [PASSED] active-inactive
[13:24:13] [PASSED] inactive-active
[13:24:13] [PASSED] inactive-1st_or_active-inactive
[13:24:13] [PASSED] inactive-2nd_or_active-inactive
[13:24:13] [PASSED] inactive-last_or_active-inactive
[13:24:13] [PASSED] inactive-no_or_active-inactive
[13:24:13] ============== [PASSED] xe_rtp_process_tests ===============
[13:24:13] ===================== [PASSED] xe_rtp ======================
[13:24:13] ==================== xe_wa (1 subtest) =====================
[13:24:13] ======================== xe_wa_gt  =========================
[13:24:13] [PASSED] TIGERLAKE B0
[13:24:13] [PASSED] DG1 A0
[13:24:13] [PASSED] DG1 B0
[13:24:13] [PASSED] ALDERLAKE_S A0
[13:24:13] [PASSED] ALDERLAKE_S B0
[13:24:13] [PASSED] ALDERLAKE_S C0
[13:24:13] [PASSED] ALDERLAKE_S D0
[13:24:13] [PASSED] ALDERLAKE_P A0
[13:24:13] [PASSED] ALDERLAKE_P B0
[13:24:13] [PASSED] ALDERLAKE_P C0
[13:24:13] [PASSED] ALDERLAKE_S RPLS D0
[13:24:13] [PASSED] ALDERLAKE_P RPLU E0
[13:24:13] [PASSED] DG2 G10 C0
[13:24:13] [PASSED] DG2 G11 B1
[13:24:13] [PASSED] DG2 G12 A1
[13:24:13] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:24:13] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:24:13] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[13:24:13] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[13:24:13] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[13:24:13] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[13:24:13] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[13:24:13] ==================== [PASSED] xe_wa_gt =====================
[13:24:13] ====================== [PASSED] xe_wa ======================
[13:24:13] ============================================================
[13:24:13] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[13:24:13] Elapsed time: 73.066s total, 7.195s configuring, 64.745s building, 1.087s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:24:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:24:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:25:03] Starting KUnit Kernel (1/1)...
[13:25:03] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:25:03] ============ drm_test_pick_cmdline (2 subtests) ============
[13:25:03] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:25:03] =============== drm_test_pick_cmdline_named  ===============
[13:25:03] [PASSED] NTSC
[13:25:03] [PASSED] NTSC-J
[13:25:03] [PASSED] PAL
[13:25:03] [PASSED] PAL-M
[13:25:03] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:25:03] ============== [PASSED] drm_test_pick_cmdline ==============
[13:25:03] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[13:25:03] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[13:25:03] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[13:25:03] =========== drm_validate_clone_mode (2 subtests) ===========
[13:25:03] ============== drm_test_check_in_clone_mode  ===============
[13:25:03] [PASSED] in_clone_mode
[13:25:03] [PASSED] not_in_clone_mode
[13:25:03] ========== [PASSED] drm_test_check_in_clone_mode ===========
[13:25:03] =============== drm_test_check_valid_clones  ===============
[13:25:03] [PASSED] not_in_clone_mode
[13:25:03] [PASSED] valid_clone
[13:25:03] [PASSED] invalid_clone
[13:25:03] =========== [PASSED] drm_test_check_valid_clones ===========
[13:25:03] ============= [PASSED] drm_validate_clone_mode =============
[13:25:03] ============= drm_validate_modeset (1 subtest) =============
[13:25:03] [PASSED] drm_test_check_connector_changed_modeset
[13:25:03] ============== [PASSED] drm_validate_modeset ===============
[13:25:03] ====== drm_test_bridge_get_current_state (2 subtests) ======
[13:25:03] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[13:25:03] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[13:25:03] ======== [PASSED] drm_test_bridge_get_current_state ========
[13:25:03] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[13:25:03] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[13:25:03] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[13:25:03] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[13:25:03] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[13:25:03] ============== drm_bridge_alloc (2 subtests) ===============
[13:25:03] [PASSED] drm_test_drm_bridge_alloc_basic
[13:25:03] [PASSED] drm_test_drm_bridge_alloc_get_put
[13:25:03] ================ [PASSED] drm_bridge_alloc =================
[13:25:03] ============= drm_cmdline_parser (40 subtests) =============
[13:25:03] [PASSED] drm_test_cmdline_force_d_only
[13:25:03] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:25:03] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:25:03] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:25:03] [PASSED] drm_test_cmdline_force_e_only
[13:25:03] [PASSED] drm_test_cmdline_res
[13:25:03] [PASSED] drm_test_cmdline_res_vesa
[13:25:03] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:25:03] [PASSED] drm_test_cmdline_res_rblank
[13:25:03] [PASSED] drm_test_cmdline_res_bpp
[13:25:03] [PASSED] drm_test_cmdline_res_refresh
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:25:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:25:03] [PASSED] drm_test_cmdline_res_margins_force_on
[13:25:03] [PASSED] drm_test_cmdline_res_vesa_margins
[13:25:03] [PASSED] drm_test_cmdline_name
[13:25:03] [PASSED] drm_test_cmdline_name_bpp
[13:25:03] [PASSED] drm_test_cmdline_name_option
[13:25:03] [PASSED] drm_test_cmdline_name_bpp_option
[13:25:03] [PASSED] drm_test_cmdline_rotate_0
[13:25:03] [PASSED] drm_test_cmdline_rotate_90
[13:25:03] [PASSED] drm_test_cmdline_rotate_180
[13:25:03] [PASSED] drm_test_cmdline_rotate_270
[13:25:03] [PASSED] drm_test_cmdline_hmirror
[13:25:03] [PASSED] drm_test_cmdline_vmirror
[13:25:03] [PASSED] drm_test_cmdline_margin_options
[13:25:03] [PASSED] drm_test_cmdline_multiple_options
[13:25:03] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:25:03] [PASSED] drm_test_cmdline_extra_and_option
[13:25:03] [PASSED] drm_test_cmdline_freestanding_options
[13:25:03] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:25:03] [PASSED] drm_test_cmdline_panel_orientation
[13:25:03] ================ drm_test_cmdline_invalid  =================
[13:25:03] [PASSED] margin_only
[13:25:03] [PASSED] interlace_only
[13:25:03] [PASSED] res_missing_x
[13:25:03] [PASSED] res_missing_y
[13:25:03] [PASSED] res_bad_y
[13:25:03] [PASSED] res_missing_y_bpp
[13:25:03] [PASSED] res_bad_bpp
[13:25:03] [PASSED] res_bad_refresh
[13:25:03] [PASSED] res_bpp_refresh_force_on_off
[13:25:03] [PASSED] res_invalid_mode
[13:25:03] [PASSED] res_bpp_wrong_place_mode
[13:25:03] [PASSED] name_bpp_refresh
[13:25:03] [PASSED] name_refresh
[13:25:03] [PASSED] name_refresh_wrong_mode
[13:25:03] [PASSED] name_refresh_invalid_mode
[13:25:03] [PASSED] rotate_multiple
[13:25:03] [PASSED] rotate_invalid_val
[13:25:03] [PASSED] rotate_truncated
[13:25:03] [PASSED] invalid_option
[13:25:03] [PASSED] invalid_tv_option
[13:25:03] [PASSED] truncated_tv_option
[13:25:03] ============ [PASSED] drm_test_cmdline_invalid =============
[13:25:03] =============== drm_test_cmdline_tv_options  ===============
[13:25:03] [PASSED] NTSC
[13:25:03] [PASSED] NTSC_443
[13:25:03] [PASSED] NTSC_J
[13:25:03] [PASSED] PAL
[13:25:03] [PASSED] PAL_M
[13:25:03] [PASSED] PAL_N
[13:25:03] [PASSED] SECAM
[13:25:03] [PASSED] MONO_525
[13:25:03] [PASSED] MONO_625
[13:25:03] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:25:03] =============== [PASSED] drm_cmdline_parser ================
[13:25:03] ========== drmm_connector_hdmi_init (20 subtests) ==========
[13:25:03] [PASSED] drm_test_connector_hdmi_init_valid
[13:25:03] [PASSED] drm_test_connector_hdmi_init_bpc_8
[13:25:03] [PASSED] drm_test_connector_hdmi_init_bpc_10
[13:25:03] [PASSED] drm_test_connector_hdmi_init_bpc_12
[13:25:03] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[13:25:03] [PASSED] drm_test_connector_hdmi_init_bpc_null
[13:25:03] [PASSED] drm_test_connector_hdmi_init_formats_empty
[13:25:03] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[13:25:03] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[13:25:03] [PASSED] supported_formats=0x9 yuv420_allowed=1
[13:25:03] [PASSED] supported_formats=0x9 yuv420_allowed=0
[13:25:03] [PASSED] supported_formats=0x5 yuv420_allowed=1
[13:25:03] [PASSED] supported_formats=0x5 yuv420_allowed=0
[13:25:03] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[13:25:03] [PASSED] drm_test_connector_hdmi_init_null_ddc
[13:25:03] [PASSED] drm_test_connector_hdmi_init_null_product
[13:25:03] [PASSED] drm_test_connector_hdmi_init_null_vendor
[13:25:03] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[13:25:03] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[13:25:03] [PASSED] drm_test_connector_hdmi_init_product_valid
[13:25:03] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[13:25:03] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[13:25:03] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[13:25:03] ========= drm_test_connector_hdmi_init_type_valid  =========
[13:25:03] [PASSED] HDMI-A
[13:25:03] [PASSED] HDMI-B
[13:25:03] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[13:25:03] ======== drm_test_connector_hdmi_init_type_invalid  ========
[13:25:03] [PASSED] Unknown
[13:25:03] [PASSED] VGA
[13:25:03] [PASSED] DVI-I
[13:25:03] [PASSED] DVI-D
[13:25:03] [PASSED] DVI-A
[13:25:03] [PASSED] Composite
[13:25:03] [PASSED] SVIDEO
[13:25:03] [PASSED] LVDS
[13:25:03] [PASSED] Component
[13:25:03] [PASSED] DIN
[13:25:03] [PASSED] DP
[13:25:03] [PASSED] TV
[13:25:03] [PASSED] eDP
[13:25:03] [PASSED] Virtual
[13:25:03] [PASSED] DSI
[13:25:03] [PASSED] DPI
[13:25:03] [PASSED] Writeback
[13:25:03] [PASSED] SPI
[13:25:03] [PASSED] USB
[13:25:03] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[13:25:03] ============ [PASSED] drmm_connector_hdmi_init =============
[13:25:03] ============= drmm_connector_init (3 subtests) =============
[13:25:03] [PASSED] drm_test_drmm_connector_init
[13:25:03] [PASSED] drm_test_drmm_connector_init_null_ddc
[13:25:03] ========= drm_test_drmm_connector_init_type_valid  =========
[13:25:03] [PASSED] Unknown
[13:25:03] [PASSED] VGA
[13:25:03] [PASSED] DVI-I
[13:25:03] [PASSED] DVI-D
[13:25:03] [PASSED] DVI-A
[13:25:03] [PASSED] Composite
[13:25:03] [PASSED] SVIDEO
[13:25:03] [PASSED] LVDS
[13:25:03] [PASSED] Component
[13:25:03] [PASSED] DIN
[13:25:03] [PASSED] DP
[13:25:03] [PASSED] HDMI-A
[13:25:03] [PASSED] HDMI-B
[13:25:03] [PASSED] TV
[13:25:03] [PASSED] eDP
[13:25:03] [PASSED] Virtual
[13:25:03] [PASSED] DSI
[13:25:03] [PASSED] DPI
[13:25:03] [PASSED] Writeback
[13:25:03] [PASSED] SPI
[13:25:03] [PASSED] USB
[13:25:03] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[13:25:03] =============== [PASSED] drmm_connector_init ===============
[13:25:03] ========= drm_connector_dynamic_init (6 subtests) ==========
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_init
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_init_properties
[13:25:03] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[13:25:03] [PASSED] Unknown
[13:25:03] [PASSED] VGA
[13:25:03] [PASSED] DVI-I
[13:25:03] [PASSED] DVI-D
[13:25:03] [PASSED] DVI-A
[13:25:03] [PASSED] Composite
[13:25:03] [PASSED] SVIDEO
[13:25:03] [PASSED] LVDS
[13:25:03] [PASSED] Component
[13:25:03] [PASSED] DIN
[13:25:03] [PASSED] DP
[13:25:03] [PASSED] HDMI-A
[13:25:03] [PASSED] HDMI-B
[13:25:03] [PASSED] TV
[13:25:03] [PASSED] eDP
[13:25:03] [PASSED] Virtual
[13:25:03] [PASSED] DSI
[13:25:03] [PASSED] DPI
[13:25:03] [PASSED] Writeback
[13:25:03] [PASSED] SPI
[13:25:03] [PASSED] USB
[13:25:03] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[13:25:03] ======== drm_test_drm_connector_dynamic_init_name  =========
[13:25:03] [PASSED] Unknown
[13:25:03] [PASSED] VGA
[13:25:03] [PASSED] DVI-I
[13:25:03] [PASSED] DVI-D
[13:25:03] [PASSED] DVI-A
[13:25:03] [PASSED] Composite
[13:25:03] [PASSED] SVIDEO
[13:25:03] [PASSED] LVDS
[13:25:03] [PASSED] Component
[13:25:03] [PASSED] DIN
[13:25:03] [PASSED] DP
[13:25:03] [PASSED] HDMI-A
[13:25:03] [PASSED] HDMI-B
[13:25:03] [PASSED] TV
[13:25:03] [PASSED] eDP
[13:25:03] [PASSED] Virtual
[13:25:03] [PASSED] DSI
[13:25:03] [PASSED] DPI
[13:25:03] [PASSED] Writeback
[13:25:03] [PASSED] SPI
[13:25:03] [PASSED] USB
[13:25:03] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[13:25:03] =========== [PASSED] drm_connector_dynamic_init ============
[13:25:03] ==== drm_connector_dynamic_register_early (4 subtests) =====
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[13:25:03] ====== [PASSED] drm_connector_dynamic_register_early =======
[13:25:03] ======= drm_connector_dynamic_register (7 subtests) ========
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[13:25:03] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[13:25:03] ========= [PASSED] drm_connector_dynamic_register ==========
[13:25:03] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[13:25:03] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[13:25:03] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[13:25:03] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[13:25:03] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:25:03] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:25:03] [PASSED] NTSC
[13:25:03] [PASSED] NTSC-443
[13:25:03] [PASSED] NTSC-J
[13:25:03] [PASSED] PAL
[13:25:03] [PASSED] PAL-M
[13:25:03] [PASSED] PAL-N
[13:25:03] [PASSED] SECAM
[13:25:03] [PASSED] Mono
[13:25:03] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:25:03] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:25:03] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:25:03] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[13:25:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[13:25:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[13:25:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[13:25:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[13:25:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[13:25:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[13:25:03] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[13:25:03] [PASSED] VIC 96
[13:25:03] [PASSED] VIC 97
[13:25:03] [PASSED] VIC 101
[13:25:03] [PASSED] VIC 102
[13:25:03] [PASSED] VIC 106
[13:25:03] [PASSED] VIC 107
[13:25:03] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[13:25:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[13:25:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[13:25:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[13:25:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[13:25:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[13:25:03] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[13:25:03] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[13:25:03] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[13:25:03] [PASSED] Automatic
[13:25:03] [PASSED] Full
[13:25:03] [PASSED] Limited 16:235
[13:25:03] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[13:25:03] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[13:25:03] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[13:25:03] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[13:25:03] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[13:25:03] [PASSED] RGB
[13:25:03] [PASSED] YUV 4:2:0
[13:25:03] [PASSED] YUV 4:2:2
[13:25:03] [PASSED] YUV 4:4:4
[13:25:03] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[13:25:03] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[13:25:03] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[13:25:03] ============= drm_damage_helper (21 subtests) ==============
[13:25:03] [PASSED] drm_test_damage_iter_no_damage
[13:25:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:25:03] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:25:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:25:03] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:25:03] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:25:03] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:25:03] [PASSED] drm_test_damage_iter_simple_damage
[13:25:03] [PASSED] drm_test_damage_iter_single_damage
[13:25:03] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:25:03] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:25:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:25:03] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:25:03] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:25:03] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:25:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:25:03] [PASSED] drm_test_damage_iter_damage
[13:25:03] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:25:03] [PASSED] drm_test_damage_iter_damage_one_outside
[13:25:03] [PASSED] drm_test_damage_iter_damage_src_moved
[13:25:03] [PASSED] drm_test_damage_iter_damage_not_visible
[13:25:03] ================ [PASSED] drm_damage_helper ================
[13:25:03] ============== drm_dp_mst_helper (3 subtests) ==============
[13:25:03] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:25:03] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:25:03] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:25:03] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:25:03] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:25:03] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:25:03] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:25:03] ============== drm_test_dp_mst_calc_pbn_div  ===============
[13:25:03] [PASSED] Link rate 2000000 lane count 4
[13:25:03] [PASSED] Link rate 2000000 lane count 2
[13:25:03] [PASSED] Link rate 2000000 lane count 1
[13:25:03] [PASSED] Link rate 1350000 lane count 4
[13:25:03] [PASSED] Link rate 1350000 lane count 2
[13:25:03] [PASSED] Link rate 1350000 lane count 1
[13:25:03] [PASSED] Link rate 1000000 lane count 4
[13:25:03] [PASSED] Link rate 1000000 lane count 2
[13:25:03] [PASSED] Link rate 1000000 lane count 1
[13:25:03] [PASSED] Link rate 810000 lane count 4
[13:25:03] [PASSED] Link rate 810000 lane count 2
[13:25:03] [PASSED] Link rate 810000 lane count 1
[13:25:03] [PASSED] Link rate 540000 lane count 4
[13:25:03] [PASSED] Link rate 540000 lane count 2
[13:25:03] [PASSED] Link rate 540000 lane count 1
[13:25:03] [PASSED] Link rate 270000 lane count 4
[13:25:03] [PASSED] Link rate 270000 lane count 2
[13:25:03] [PASSED] Link rate 270000 lane count 1
[13:25:03] [PASSED] Link rate 162000 lane count 4
[13:25:03] [PASSED] Link rate 162000 lane count 2
[13:25:03] [PASSED] Link rate 162000 lane count 1
[13:25:03] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[13:25:03] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:25:03] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:25:03] [PASSED] DP_POWER_UP_PHY with port number
[13:25:03] [PASSED] DP_POWER_DOWN_PHY with port number
[13:25:03] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:25:03] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:25:03] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:25:03] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:25:03] [PASSED] DP_QUERY_PAYLOAD with port number
[13:25:03] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:25:03] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:25:03] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:25:03] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:25:03] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:25:03] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:25:03] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:25:03] [PASSED] DP_REMOTE_I2C_READ with port number
[13:25:03] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:25:03] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:25:03] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:25:03] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:25:03] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:25:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:25:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:25:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:25:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:25:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:25:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:25:03] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:25:03] ================ [PASSED] drm_dp_mst_helper ================
[13:25:03] ================== drm_exec (7 subtests) ===================
[13:25:03] [PASSED] sanitycheck
[13:25:03] [PASSED] test_lock
[13:25:03] [PASSED] test_lock_unlock
[13:25:03] [PASSED] test_duplicates
[13:25:03] [PASSED] test_prepare
[13:25:03] [PASSED] test_prepare_array
[13:25:03] [PASSED] test_multiple_loops
[13:25:03] ==================== [PASSED] drm_exec =====================
[13:25:03] =========== drm_format_helper_test (17 subtests) ===========
[13:25:03] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:25:03] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:25:03] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:25:03] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:25:03] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:25:03] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:25:03] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:25:03] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[13:25:03] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:25:03] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:25:03] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:25:03] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:25:03] ==================== drm_test_fb_swab  =====================
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ================ [PASSED] drm_test_fb_swab =================
[13:25:03] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[13:25:03] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[13:25:03] [PASSED] single_pixel_source_buffer
[13:25:03] [PASSED] single_pixel_clip_rectangle
[13:25:03] [PASSED] well_known_colors
[13:25:03] [PASSED] destination_pitch
[13:25:03] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[13:25:03] ================= drm_test_fb_clip_offset  =================
[13:25:03] [PASSED] pass through
[13:25:03] [PASSED] horizontal offset
[13:25:03] [PASSED] vertical offset
[13:25:03] [PASSED] horizontal and vertical offset
[13:25:03] [PASSED] horizontal offset (custom pitch)
[13:25:03] [PASSED] vertical offset (custom pitch)
[13:25:03] [PASSED] horizontal and vertical offset (custom pitch)
[13:25:03] ============= [PASSED] drm_test_fb_clip_offset =============
[13:25:03] =================== drm_test_fb_memcpy  ====================
[13:25:03] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[13:25:03] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[13:25:03] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[13:25:03] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[13:25:03] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[13:25:03] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[13:25:03] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[13:25:03] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[13:25:03] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[13:25:03] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[13:25:03] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[13:25:03] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[13:25:03] =============== [PASSED] drm_test_fb_memcpy ================
[13:25:03] ============= [PASSED] drm_format_helper_test ==============
[13:25:03] ================= drm_format (18 subtests) =================
[13:25:03] [PASSED] drm_test_format_block_width_invalid
[13:25:03] [PASSED] drm_test_format_block_width_one_plane
[13:25:03] [PASSED] drm_test_format_block_width_two_plane
[13:25:03] [PASSED] drm_test_format_block_width_three_plane
[13:25:03] [PASSED] drm_test_format_block_width_tiled
[13:25:03] [PASSED] drm_test_format_block_height_invalid
[13:25:03] [PASSED] drm_test_format_block_height_one_plane
[13:25:03] [PASSED] drm_test_format_block_height_two_plane
[13:25:03] [PASSED] drm_test_format_block_height_three_plane
[13:25:03] [PASSED] drm_test_format_block_height_tiled
[13:25:03] [PASSED] drm_test_format_min_pitch_invalid
[13:25:03] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:25:03] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:25:03] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:25:03] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:25:03] [PASSED] drm_test_format_min_pitch_two_plane
[13:25:03] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:25:03] [PASSED] drm_test_format_min_pitch_tiled
[13:25:03] =================== [PASSED] drm_format ====================
[13:25:03] ============== drm_framebuffer (10 subtests) ===============
[13:25:03] ========== drm_test_framebuffer_check_src_coords  ==========
[13:25:03] [PASSED] Success: source fits into fb
[13:25:03] [PASSED] Fail: overflowing fb with x-axis coordinate
[13:25:03] [PASSED] Fail: overflowing fb with y-axis coordinate
[13:25:03] [PASSED] Fail: overflowing fb with source width
[13:25:03] [PASSED] Fail: overflowing fb with source height
[13:25:03] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[13:25:03] [PASSED] drm_test_framebuffer_cleanup
[13:25:03] =============== drm_test_framebuffer_create  ===============
[13:25:03] [PASSED] ABGR8888 normal sizes
[13:25:03] [PASSED] ABGR8888 max sizes
[13:25:03] [PASSED] ABGR8888 pitch greater than min required
[13:25:03] [PASSED] ABGR8888 pitch less than min required
[13:25:03] [PASSED] ABGR8888 Invalid width
[13:25:03] [PASSED] ABGR8888 Invalid buffer handle
[13:25:03] [PASSED] No pixel format
[13:25:03] [PASSED] ABGR8888 Width 0
[13:25:03] [PASSED] ABGR8888 Height 0
[13:25:03] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:25:03] [PASSED] ABGR8888 Large buffer offset
[13:25:03] [PASSED] ABGR8888 Buffer offset for inexistent plane
[13:25:03] [PASSED] ABGR8888 Invalid flag
[13:25:03] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:25:03] [PASSED] ABGR8888 Valid buffer modifier
[13:25:03] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:25:03] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:25:03] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:25:03] [PASSED] NV12 Normal sizes
[13:25:03] [PASSED] NV12 Max sizes
[13:25:03] [PASSED] NV12 Invalid pitch
[13:25:03] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:25:03] [PASSED] NV12 different  modifier per-plane
[13:25:03] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:25:03] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:25:03] [PASSED] NV12 Modifier for inexistent plane
[13:25:03] [PASSED] NV12 Handle for inexistent plane
[13:25:03] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:25:03] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:25:03] [PASSED] YVU420 Normal sizes
[13:25:03] [PASSED] YVU420 Max sizes
[13:25:03] [PASSED] YVU420 Invalid pitch
[13:25:03] [PASSED] YVU420 Different pitches
[13:25:03] [PASSED] YVU420 Different buffer offsets/pitches
[13:25:03] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:25:03] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:25:03] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:25:03] [PASSED] YVU420 Valid modifier
[13:25:03] [PASSED] YVU420 Different modifiers per plane
[13:25:03] [PASSED] YVU420 Modifier for inexistent plane
[13:25:03] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[13:25:03] [PASSED] X0L2 Normal sizes
[13:25:03] [PASSED] X0L2 Max sizes
[13:25:03] [PASSED] X0L2 Invalid pitch
[13:25:03] [PASSED] X0L2 Pitch greater than minimum required
[13:25:03] [PASSED] X0L2 Handle for inexistent plane
[13:25:03] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:25:03] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:25:03] [PASSED] X0L2 Valid modifier
[13:25:03] [PASSED] X0L2 Modifier for inexistent plane
[13:25:03] =========== [PASSED] drm_test_framebuffer_create ===========
[13:25:03] [PASSED] drm_test_framebuffer_free
[13:25:03] [PASSED] drm_test_framebuffer_init
[13:25:03] [PASSED] drm_test_framebuffer_init_bad_format
[13:25:03] [PASSED] drm_test_framebuffer_init_dev_mismatch
[13:25:03] [PASSED] drm_test_framebuffer_lookup
[13:25:03] [PASSED] drm_test_framebuffer_lookup_inexistent
[13:25:03] [PASSED] drm_test_framebuffer_modifiers_not_supported
[13:25:03] ================= [PASSED] drm_framebuffer =================
[13:25:03] ================ drm_gem_shmem (8 subtests) ================
[13:25:03] [PASSED] drm_gem_shmem_test_obj_create
[13:25:03] [PASSED] drm_gem_shmem_test_obj_create_private
[13:25:03] [PASSED] drm_gem_shmem_test_pin_pages
[13:25:03] [PASSED] drm_gem_shmem_test_vmap
[13:25:03] [PASSED] drm_gem_shmem_test_get_sg_table
[13:25:03] [PASSED] drm_gem_shmem_test_get_pages_sgt
[13:25:03] [PASSED] drm_gem_shmem_test_madvise
[13:25:03] [PASSED] drm_gem_shmem_test_purge
[13:25:03] ================== [PASSED] drm_gem_shmem ==================
[13:25:03] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[13:25:03] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[13:25:03] [PASSED] Automatic
[13:25:03] [PASSED] Full
[13:25:03] [PASSED] Limited 16:235
[13:25:03] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[13:25:03] [PASSED] drm_test_check_disable_connector
[13:25:03] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[13:25:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[13:25:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[13:25:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[13:25:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[13:25:03] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[13:25:03] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[13:25:03] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[13:25:03] [PASSED] drm_test_check_output_bpc_dvi
[13:25:03] [PASSED] drm_test_check_output_bpc_format_vic_1
[13:25:03] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[13:25:03] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[13:25:03] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[13:25:03] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[13:25:03] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[13:25:03] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[13:25:03] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[13:25:03] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[13:25:03] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[13:25:03] [PASSED] drm_test_check_broadcast_rgb_value
[13:25:03] [PASSED] drm_test_check_bpc_8_value
[13:25:03] [PASSED] drm_test_check_bpc_10_value
[13:25:03] [PASSED] drm_test_check_bpc_12_value
[13:25:03] [PASSED] drm_test_check_format_value
[13:25:03] [PASSED] drm_test_check_tmds_char_value
[13:25:03] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[13:25:03] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[13:25:03] [PASSED] drm_test_check_mode_valid
[13:25:03] [PASSED] drm_test_check_mode_valid_reject
[13:25:03] [PASSED] drm_test_check_mode_valid_reject_rate
[13:25:03] [PASSED] drm_test_check_mode_valid_reject_max_clock
[13:25:03] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[13:25:03] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[13:25:03] [PASSED] drm_test_check_infoframes
[13:25:03] [PASSED] drm_test_check_reject_avi_infoframe
[13:25:03] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[13:25:03] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[13:25:03] [PASSED] drm_test_check_reject_audio_infoframe
[13:25:03] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[13:25:03] ================= drm_managed (2 subtests) =================
[13:25:03] [PASSED] drm_test_managed_release_action
[13:25:03] [PASSED] drm_test_managed_run_action
[13:25:03] =================== [PASSED] drm_managed ===================
[13:25:03] =================== drm_mm (6 subtests) ====================
[13:25:03] [PASSED] drm_test_mm_init
[13:25:03] [PASSED] drm_test_mm_debug
[13:25:03] [PASSED] drm_test_mm_align32
[13:25:03] [PASSED] drm_test_mm_align64
[13:25:03] [PASSED] drm_test_mm_lowest
[13:25:03] [PASSED] drm_test_mm_highest
[13:25:03] ===================== [PASSED] drm_mm ======================
[13:25:03] ============= drm_modes_analog_tv (5 subtests) =============
[13:25:03] [PASSED] drm_test_modes_analog_tv_mono_576i
[13:25:03] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:25:03] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:25:03] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:25:03] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:25:03] =============== [PASSED] drm_modes_analog_tv ===============
[13:25:03] ============== drm_plane_helper (2 subtests) ===============
[13:25:03] =============== drm_test_check_plane_state  ================
[13:25:03] [PASSED] clipping_simple
[13:25:03] [PASSED] clipping_rotate_reflect
[13:25:03] [PASSED] positioning_simple
[13:25:03] [PASSED] upscaling
[13:25:03] [PASSED] downscaling
[13:25:03] [PASSED] rounding1
[13:25:03] [PASSED] rounding2
[13:25:03] [PASSED] rounding3
[13:25:03] [PASSED] rounding4
[13:25:03] =========== [PASSED] drm_test_check_plane_state ============
[13:25:03] =========== drm_test_check_invalid_plane_state  ============
[13:25:03] [PASSED] positioning_invalid
[13:25:03] [PASSED] upscaling_invalid
[13:25:03] [PASSED] downscaling_invalid
[13:25:03] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:25:03] ================ [PASSED] drm_plane_helper =================
[13:25:03] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:25:03] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:25:03] [PASSED] None
[13:25:03] [PASSED] PAL
[13:25:03] [PASSED] NTSC
[13:25:03] [PASSED] Both, NTSC Default
[13:25:03] [PASSED] Both, PAL Default
[13:25:03] [PASSED] Both, NTSC Default, with PAL on command-line
[13:25:03] [PASSED] Both, PAL Default, with NTSC on command-line
[13:25:03] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:25:03] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:25:03] ================== drm_rect (9 subtests) ===================
[13:25:03] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:25:03] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:25:03] [PASSED] drm_test_rect_clip_scaled_clipped
[13:25:03] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:25:03] ================= drm_test_rect_intersect  =================
[13:25:03] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:25:03] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[13:25:03] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:25:03] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:25:03] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:25:03] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:25:03] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:25:03] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:25:03] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:25:03] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:25:03] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:25:03] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:25:03] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:25:03] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:25:03] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:25:03] ============= [PASSED] drm_test_rect_intersect =============
[13:25:03] ================ drm_test_rect_calc_hscale  ================
[13:25:03] [PASSED] normal use
[13:25:03] [PASSED] out of max range
[13:25:03] [PASSED] out of min range
[13:25:03] [PASSED] zero dst
[13:25:03] [PASSED] negative src
[13:25:03] [PASSED] negative dst
[13:25:03] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:25:03] ================ drm_test_rect_calc_vscale  ================
[13:25:03] [PASSED] normal use
[13:25:03] [PASSED] out of max range
[13:25:03] [PASSED] out of min range
[13:25:03] [PASSED] zero dst
[13:25:03] [PASSED] negative src
[13:25:03] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[13:25:03] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:25:03] ================== drm_test_rect_rotate  ===================
[13:25:03] [PASSED] reflect-x
[13:25:03] [PASSED] reflect-y
[13:25:03] [PASSED] rotate-0
[13:25:03] [PASSED] rotate-90
[13:25:03] [PASSED] rotate-180
[13:25:03] [PASSED] rotate-270
[13:25:03] ============== [PASSED] drm_test_rect_rotate ===============
[13:25:03] ================ drm_test_rect_rotate_inv  =================
[13:25:03] [PASSED] reflect-x
[13:25:03] [PASSED] reflect-y
[13:25:03] [PASSED] rotate-0
[13:25:03] [PASSED] rotate-90
[13:25:03] [PASSED] rotate-180
[13:25:03] [PASSED] rotate-270
[13:25:03] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:25:03] ==================== [PASSED] drm_rect =====================
[13:25:03] ============ drm_sysfb_modeset_test (1 subtest) ============
[13:25:03] ============ drm_test_sysfb_build_fourcc_list  =============
[13:25:03] [PASSED] no native formats
[13:25:03] [PASSED] XRGB8888 as native format
[13:25:03] [PASSED] remove duplicates
[13:25:03] [PASSED] convert alpha formats
[13:25:03] [PASSED] random formats
[13:25:03] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[13:25:03] ============= [PASSED] drm_sysfb_modeset_test ==============
[13:25:03] ================== drm_fixp (2 subtests) ===================
[13:25:03] [PASSED] drm_test_int2fixp
[13:25:03] [PASSED] drm_test_sm2fixp
[13:25:03] ==================== [PASSED] drm_fixp =====================
[13:25:03] ============================================================
[13:25:03] Testing complete. Ran 621 tests: passed: 621
[13:25:03] Elapsed time: 50.252s total, 2.959s configuring, 47.021s building, 0.256s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[13:25:04] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:25:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:25:24] Starting KUnit Kernel (1/1)...
[13:25:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:25:24] ================= ttm_device (5 subtests) ==================
[13:25:24] [PASSED] ttm_device_init_basic
[13:25:24] [PASSED] ttm_device_init_multiple
[13:25:24] [PASSED] ttm_device_fini_basic
[13:25:24] [PASSED] ttm_device_init_no_vma_man
[13:25:24] ================== ttm_device_init_pools  ==================
[13:25:24] [PASSED] No DMA allocations, no DMA32 required
[13:25:24] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[13:25:24] Expected !list_lru_count(&pt.pages) to be false, but is true
[13:25:24] [FAILED] DMA allocations, DMA32 required
[13:25:24] [PASSED] No DMA allocations, DMA32 required
[13:25:24]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[13:25:24]     Expected !list_lru_count(&pt.pages) to be false, but is true
[13:25:24] ------------[ cut here ]------------
[13:25:24] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[13:25:24] refcount_t: underflow; use-after-free.
[13:25:24] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g206eb51f3379 #3 VOLUNTARY
[13:25:24] Tainted: [W]=WARN, [N]=TEST
[13:25:24] Stack:
[13:25:24]  6044ed8b 00000000 00000000 00000001
[13:25:24]  ffffff00 6044ed8b 6032367a 00000009
[13:25:24]  0000001c 60043e88 6002381c b30cbd40
[13:25:24] Call Trace:
[13:25:24]  [<6032367a>] ? devres_release_all+0xaa/0x100
[13:25:24]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[13:25:24]  [<6002381c>] ? _printk+0x0/0x65
[13:25:24]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[13:25:24]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[13:25:24]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[13:25:24]  [<60052e36>] ? um_set_signals+0x36/0x60
[13:25:24]  [<600c5a42>] ? call_rcu+0x52/0x90
[13:25:24]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[13:25:24]  [<60147f50>] ? kfree+0x0/0x250
[13:25:24]  [<6032367a>] ? devres_release_all+0xaa/0x100
[13:25:24]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[13:25:24]  [<6031c3c0>] ? bus_notify+0x0/0x60
[13:25:24]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[13:25:24]  [<60398620>] ? mutex_lock+0x0/0x40
[13:25:24]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[13:25:24]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[13:25:24]  [<60372210>] ? kobject_put+0x0/0x150
[13:25:24]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[13:25:24]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[13:25:24]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[13:25:24]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[13:25:24]  [<60315a8c>] ? device_del+0x1bc/0x600
[13:25:24]  [<60052e00>] ? um_set_signals+0x0/0x60
[13:25:24]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[13:25:24]  [<60052e00>] ? um_set_signals+0x0/0x60
[13:25:24]  [<60315ee4>] ? device_unregister+0x14/0x40
[13:25:24]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[13:25:24]  [<60257d70>] ? kunit_release_action+0x0/0x170
[13:25:24]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[13:25:24]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[13:25:24]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[13:25:24]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[13:25:24]  [<60081e36>] ? kthread+0xe6/0x150
[13:25:24]  [<60046435>] ? new_thread_handler+0x45/0x60
[13:25:24] ---[ end trace 0000000000000000 ]---
[13:25:24] [FAILED] DMA allocations, no DMA32 required
[13:25:24] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[13:25:24] ============== [FAILED] ttm_device_init_pools ==============
[13:25:24]     # module: ttm_device_test
[13:25:24] # ttm_device: pass:4 fail:1 skip:0 total:5
[13:25:24] # Totals: pass:6 fail:2 skip:0 total:8
[13:25:24] =================== [FAILED] ttm_device ====================
[13:25:24] ================== ttm_pool (8 subtests) ===================
[13:25:24] ================== ttm_pool_alloc_basic  ===================
[13:25:24] [PASSED] One page
[13:25:24] [PASSED] More than one page
[13:25:24] [PASSED] Above the allocation limit
[13:25:24] [PASSED] One page, with coherent DMA mappings enabled
[13:25:24] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:25:24] ============== [PASSED] ttm_pool_alloc_basic ===============
[13:25:24] ============== ttm_pool_alloc_basic_dma_addr  ==============
[13:25:24] [PASSED] One page
[13:25:24] [PASSED] More than one page
[13:25:24] [PASSED] Above the allocation limit
[13:25:24] [PASSED] One page, with coherent DMA mappings enabled
[13:25:24] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:25:24] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[13:25:24] [PASSED] ttm_pool_alloc_order_caching_match
[13:25:24] [PASSED] ttm_pool_alloc_caching_mismatch
[13:25:24] [PASSED] ttm_pool_alloc_order_mismatch
[13:25:24] [PASSED] ttm_pool_free_dma_alloc
[13:25:25] [ERROR] Test: ttm_pool: missing expected subtest!
[13:25:25] 
[13:25:25] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g206eb51f3379
[13:25:25] RIP: 0033:list_lru_count_node+0xe/0x20
[13:25:25] RSP: 00000000b30cbed8  EFLAGS: 00010246
[13:25:25] RAX: 0000000000000000 RBX: 00000000b3003c90 RCX: 000000007324c7d8
[13:25:25] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000073086880
[13:25:25] RBP: 0000000073086800 R08: 00000000b1a68c28 R09: 0000000073050c80
[13:25:25] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000073050c80
[13:25:25] R13: 0000000060440770 R14: 000000006010eb50 R15: 0000000073086880
[13:25:25] Kernel panic - not syncing: Segfault with no mm
[13:25:25] [CRASHED] 
[13:25:25] [ERROR] Test: ttm_pool: missing expected subtest!
[13:25:25] [CRASHED] 
[13:25:25] [ERROR] Test: ttm_pool: missing subtest result line!
[13:25:25] # module: ttm_pool_test
[13:25:25] ==================== [CRASHED] ttm_pool ====================
[13:25:25] [ERROR] Test: main: missing expected subtest!
[13:25:25] [CRASHED] 
[13:25:25] [ERROR] Test: main: missing expected subtest!
[13:25:25] [CRASHED] 
[13:25:25] [ERROR] Test: main: missing expected subtest!
[13:25:25] [CRASHED] 
[13:25:25] [ERROR] Test: main: missing expected subtest!
[13:25:25] [CRASHED] 
[13:25:25] ============================================================
[13:25:25] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[13:25:25] Elapsed time: 21.088s total, 2.994s configuring, 17.672s building, 0.422s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


