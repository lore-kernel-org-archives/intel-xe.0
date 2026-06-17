Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E328CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59DF10F0EF;
	Wed, 17 Jun 2026 19:33:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D028110F0EF;
 Wed, 17 Jun 2026 19:33:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Move_RTP_tables_for_engine_ini?=
 =?utf-8?q?t_off_the_stack_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 19:33:28 -0000
Message-ID: <178172480884.91018.6877579933780575711@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
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

Series: Move RTP tables for engine init off the stack (rev2)
URL   : https://patchwork.freedesktop.org/series/168630/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:32:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:32:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:32:46] Starting KUnit Kernel (1/1)...
[19:32:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:32:47] ================== guc_buf (11 subtests) ===================
[19:32:47] [PASSED] test_smallest
[19:32:47] [PASSED] test_largest
[19:32:47] [PASSED] test_granular
[19:32:47] [PASSED] test_unique
[19:32:47] [PASSED] test_overlap
[19:32:47] [PASSED] test_reusable
[19:32:47] [PASSED] test_too_big
[19:32:47] [PASSED] test_flush
[19:32:47] [PASSED] test_lookup
[19:32:47] [PASSED] test_data
[19:32:47] [PASSED] test_class
[19:32:47] ===================== [PASSED] guc_buf =====================
[19:32:47] =================== guc_dbm (7 subtests) ===================
[19:32:47] [PASSED] test_empty
[19:32:47] [PASSED] test_default
[19:32:47] ======================== test_size  ========================
[19:32:47] [PASSED] 4
[19:32:47] [PASSED] 8
[19:32:47] [PASSED] 32
[19:32:47] [PASSED] 256
[19:32:47] ==================== [PASSED] test_size ====================
[19:32:47] ======================= test_reuse  ========================
[19:32:47] [PASSED] 4
[19:32:47] [PASSED] 8
[19:32:47] [PASSED] 32
[19:32:47] [PASSED] 256
[19:32:47] =================== [PASSED] test_reuse ====================
[19:32:47] =================== test_range_overlap  ====================
[19:32:47] [PASSED] 4
[19:32:47] [PASSED] 8
[19:32:47] [PASSED] 32
[19:32:47] [PASSED] 256
[19:32:47] =============== [PASSED] test_range_overlap ================
[19:32:47] =================== test_range_compact  ====================
[19:32:47] [PASSED] 4
[19:32:47] [PASSED] 8
[19:32:47] [PASSED] 32
[19:32:47] [PASSED] 256
[19:32:47] =============== [PASSED] test_range_compact ================
[19:32:47] ==================== test_range_spare  =====================
[19:32:47] [PASSED] 4
[19:32:47] [PASSED] 8
[19:32:47] [PASSED] 32
[19:32:47] [PASSED] 256
[19:32:47] ================ [PASSED] test_range_spare =================
[19:32:47] ===================== [PASSED] guc_dbm =====================
[19:32:47] =================== guc_idm (6 subtests) ===================
[19:32:47] [PASSED] bad_init
[19:32:47] [PASSED] no_init
[19:32:47] [PASSED] init_fini
[19:32:47] [PASSED] check_used
[19:32:47] [PASSED] check_quota
[19:32:47] [PASSED] check_all
[19:32:47] ===================== [PASSED] guc_idm =====================
[19:32:47] ================== no_relay (3 subtests) ===================
[19:32:47] [PASSED] xe_drops_guc2pf_if_not_ready
[19:32:47] [PASSED] xe_drops_guc2vf_if_not_ready
[19:32:47] [PASSED] xe_rejects_send_if_not_ready
[19:32:47] ==================== [PASSED] no_relay =====================
[19:32:47] ================== pf_relay (14 subtests) ==================
[19:32:47] [PASSED] pf_rejects_guc2pf_too_short
[19:32:47] [PASSED] pf_rejects_guc2pf_too_long
[19:32:47] [PASSED] pf_rejects_guc2pf_no_payload
[19:32:47] [PASSED] pf_fails_no_payload
[19:32:47] [PASSED] pf_fails_bad_origin
[19:32:47] [PASSED] pf_fails_bad_type
[19:32:47] [PASSED] pf_txn_reports_error
[19:32:47] [PASSED] pf_txn_sends_pf2guc
[19:32:47] [PASSED] pf_sends_pf2guc
[19:32:47] [SKIPPED] pf_loopback_nop
[19:32:47] [SKIPPED] pf_loopback_echo
[19:32:47] [SKIPPED] pf_loopback_fail
[19:32:47] [SKIPPED] pf_loopback_busy
[19:32:47] [SKIPPED] pf_loopback_retry
[19:32:47] ==================== [PASSED] pf_relay =====================
[19:32:47] ================== vf_relay (3 subtests) ===================
[19:32:47] [PASSED] vf_rejects_guc2vf_too_short
[19:32:47] [PASSED] vf_rejects_guc2vf_too_long
[19:32:47] [PASSED] vf_rejects_guc2vf_no_payload
[19:32:47] ==================== [PASSED] vf_relay =====================
[19:32:47] ================ pf_gt_config (9 subtests) =================
[19:32:47] [PASSED] fair_contexts_1vf
[19:32:47] [PASSED] fair_doorbells_1vf
[19:32:47] [PASSED] fair_ggtt_1vf
[19:32:47] ====================== fair_vram_1vf  ======================
[19:32:47] [PASSED] 3.50 GiB
[19:32:47] [PASSED] 11.5 GiB
[19:32:47] [PASSED] 15.5 GiB
[19:32:47] [PASSED] 31.5 GiB
[19:32:47] [PASSED] 63.5 GiB
[19:32:47] [PASSED] 1.91 GiB
[19:32:47] ================== [PASSED] fair_vram_1vf ==================
[19:32:47] ================ fair_vram_1vf_admin_only  =================
[19:32:47] [PASSED] 3.50 GiB
[19:32:47] [PASSED] 11.5 GiB
[19:32:47] [PASSED] 15.5 GiB
[19:32:47] [PASSED] 31.5 GiB
[19:32:47] [PASSED] 63.5 GiB
[19:32:47] [PASSED] 1.91 GiB
[19:32:47] ============ [PASSED] fair_vram_1vf_admin_only =============
[19:32:47] ====================== fair_contexts  ======================
[19:32:47] [PASSED] 1 VF
[19:32:47] [PASSED] 2 VFs
[19:32:47] [PASSED] 3 VFs
[19:32:47] [PASSED] 4 VFs
[19:32:47] [PASSED] 5 VFs
[19:32:47] [PASSED] 6 VFs
[19:32:47] [PASSED] 7 VFs
[19:32:47] [PASSED] 8 VFs
[19:32:47] [PASSED] 9 VFs
[19:32:47] [PASSED] 10 VFs
[19:32:47] [PASSED] 11 VFs
[19:32:47] [PASSED] 12 VFs
[19:32:47] [PASSED] 13 VFs
[19:32:47] [PASSED] 14 VFs
[19:32:47] [PASSED] 15 VFs
[19:32:47] [PASSED] 16 VFs
[19:32:47] [PASSED] 17 VFs
[19:32:47] [PASSED] 18 VFs
[19:32:47] [PASSED] 19 VFs
[19:32:47] [PASSED] 20 VFs
[19:32:47] [PASSED] 21 VFs
[19:32:47] [PASSED] 22 VFs
[19:32:47] [PASSED] 23 VFs
[19:32:47] [PASSED] 24 VFs
[19:32:47] [PASSED] 25 VFs
[19:32:47] [PASSED] 26 VFs
[19:32:47] [PASSED] 27 VFs
[19:32:47] [PASSED] 28 VFs
[19:32:47] [PASSED] 29 VFs
[19:32:47] [PASSED] 30 VFs
[19:32:47] [PASSED] 31 VFs
[19:32:47] [PASSED] 32 VFs
[19:32:47] [PASSED] 33 VFs
[19:32:47] [PASSED] 34 VFs
[19:32:47] [PASSED] 35 VFs
[19:32:47] [PASSED] 36 VFs
[19:32:47] [PASSED] 37 VFs
[19:32:47] [PASSED] 38 VFs
[19:32:47] [PASSED] 39 VFs
[19:32:47] [PASSED] 40 VFs
[19:32:47] [PASSED] 41 VFs
[19:32:47] [PASSED] 42 VFs
[19:32:47] [PASSED] 43 VFs
[19:32:47] [PASSED] 44 VFs
[19:32:47] [PASSED] 45 VFs
[19:32:47] [PASSED] 46 VFs
[19:32:47] [PASSED] 47 VFs
[19:32:47] [PASSED] 48 VFs
[19:32:47] [PASSED] 49 VFs
[19:32:47] [PASSED] 50 VFs
[19:32:47] [PASSED] 51 VFs
[19:32:47] [PASSED] 52 VFs
[19:32:47] [PASSED] 53 VFs
[19:32:47] [PASSED] 54 VFs
[19:32:47] [PASSED] 55 VFs
[19:32:47] [PASSED] 56 VFs
[19:32:47] [PASSED] 57 VFs
[19:32:47] [PASSED] 58 VFs
[19:32:47] [PASSED] 59 VFs
[19:32:47] [PASSED] 60 VFs
[19:32:47] [PASSED] 61 VFs
[19:32:47] [PASSED] 62 VFs
[19:32:47] [PASSED] 63 VFs
[19:32:47] ================== [PASSED] fair_contexts ==================
[19:32:47] ===================== fair_doorbells  ======================
[19:32:47] [PASSED] 1 VF
[19:32:47] [PASSED] 2 VFs
[19:32:47] [PASSED] 3 VFs
[19:32:47] [PASSED] 4 VFs
[19:32:47] [PASSED] 5 VFs
[19:32:47] [PASSED] 6 VFs
[19:32:47] [PASSED] 7 VFs
[19:32:47] [PASSED] 8 VFs
[19:32:47] [PASSED] 9 VFs
[19:32:47] [PASSED] 10 VFs
[19:32:47] [PASSED] 11 VFs
[19:32:47] [PASSED] 12 VFs
[19:32:47] [PASSED] 13 VFs
[19:32:47] [PASSED] 14 VFs
[19:32:47] [PASSED] 15 VFs
[19:32:47] [PASSED] 16 VFs
[19:32:47] [PASSED] 17 VFs
[19:32:47] [PASSED] 18 VFs
[19:32:47] [PASSED] 19 VFs
[19:32:47] [PASSED] 20 VFs
[19:32:47] [PASSED] 21 VFs
[19:32:47] [PASSED] 22 VFs
[19:32:47] [PASSED] 23 VFs
[19:32:47] [PASSED] 24 VFs
[19:32:47] [PASSED] 25 VFs
[19:32:47] [PASSED] 26 VFs
[19:32:47] [PASSED] 27 VFs
[19:32:47] [PASSED] 28 VFs
[19:32:47] [PASSED] 29 VFs
[19:32:47] [PASSED] 30 VFs
[19:32:47] [PASSED] 31 VFs
[19:32:47] [PASSED] 32 VFs
[19:32:47] [PASSED] 33 VFs
[19:32:47] [PASSED] 34 VFs
[19:32:47] [PASSED] 35 VFs
[19:32:47] [PASSED] 36 VFs
[19:32:47] [PASSED] 37 VFs
[19:32:47] [PASSED] 38 VFs
[19:32:47] [PASSED] 39 VFs
[19:32:47] [PASSED] 40 VFs
[19:32:47] [PASSED] 41 VFs
[19:32:47] [PASSED] 42 VFs
[19:32:47] [PASSED] 43 VFs
[19:32:47] [PASSED] 44 VFs
[19:32:47] [PASSED] 45 VFs
[19:32:47] [PASSED] 46 VFs
[19:32:47] [PASSED] 47 VFs
[19:32:47] [PASSED] 48 VFs
[19:32:47] [PASSED] 49 VFs
[19:32:47] [PASSED] 50 VFs
[19:32:47] [PASSED] 51 VFs
[19:32:47] [PASSED] 52 VFs
[19:32:47] [PASSED] 53 VFs
[19:32:47] [PASSED] 54 VFs
[19:32:47] [PASSED] 55 VFs
[19:32:47] [PASSED] 56 VFs
[19:32:47] [PASSED] 57 VFs
[19:32:47] [PASSED] 58 VFs
[19:32:47] [PASSED] 59 VFs
[19:32:47] [PASSED] 60 VFs
[19:32:47] [PASSED] 61 VFs
[19:32:47] [PASSED] 62 VFs
[19:32:47] [PASSED] 63 VFs
[19:32:47] ================= [PASSED] fair_doorbells ==================
[19:32:47] ======================== fair_ggtt  ========================
[19:32:47] [PASSED] 1 VF
[19:32:47] [PASSED] 2 VFs
[19:32:47] [PASSED] 3 VFs
[19:32:47] [PASSED] 4 VFs
[19:32:47] [PASSED] 5 VFs
[19:32:47] [PASSED] 6 VFs
[19:32:47] [PASSED] 7 VFs
[19:32:47] [PASSED] 8 VFs
[19:32:47] [PASSED] 9 VFs
[19:32:47] [PASSED] 10 VFs
[19:32:47] [PASSED] 11 VFs
[19:32:47] [PASSED] 12 VFs
[19:32:47] [PASSED] 13 VFs
[19:32:47] [PASSED] 14 VFs
[19:32:47] [PASSED] 15 VFs
[19:32:47] [PASSED] 16 VFs
[19:32:47] [PASSED] 17 VFs
[19:32:47] [PASSED] 18 VFs
[19:32:47] [PASSED] 19 VFs
[19:32:47] [PASSED] 20 VFs
[19:32:47] [PASSED] 21 VFs
[19:32:47] [PASSED] 22 VFs
[19:32:47] [PASSED] 23 VFs
[19:32:47] [PASSED] 24 VFs
[19:32:47] [PASSED] 25 VFs
[19:32:47] [PASSED] 26 VFs
[19:32:47] [PASSED] 27 VFs
[19:32:47] [PASSED] 28 VFs
[19:32:47] [PASSED] 29 VFs
[19:32:47] [PASSED] 30 VFs
[19:32:47] [PASSED] 31 VFs
[19:32:47] [PASSED] 32 VFs
[19:32:47] [PASSED] 33 VFs
[19:32:47] [PASSED] 34 VFs
[19:32:47] [PASSED] 35 VFs
[19:32:47] [PASSED] 36 VFs
[19:32:47] [PASSED] 37 VFs
[19:32:47] [PASSED] 38 VFs
[19:32:47] [PASSED] 39 VFs
[19:32:47] [PASSED] 40 VFs
[19:32:47] [PASSED] 41 VFs
[19:32:47] [PASSED] 42 VFs
[19:32:47] [PASSED] 43 VFs
[19:32:47] [PASSED] 44 VFs
[19:32:47] [PASSED] 45 VFs
[19:32:47] [PASSED] 46 VFs
[19:32:47] [PASSED] 47 VFs
[19:32:47] [PASSED] 48 VFs
[19:32:47] [PASSED] 49 VFs
[19:32:47] [PASSED] 50 VFs
[19:32:47] [PASSED] 51 VFs
[19:32:47] [PASSED] 52 VFs
[19:32:47] [PASSED] 53 VFs
[19:32:47] [PASSED] 54 VFs
[19:32:47] [PASSED] 55 VFs
[19:32:47] [PASSED] 56 VFs
[19:32:47] [PASSED] 57 VFs
[19:32:47] [PASSED] 58 VFs
[19:32:47] [PASSED] 59 VFs
[19:32:47] [PASSED] 60 VFs
[19:32:47] [PASSED] 61 VFs
[19:32:47] [PASSED] 62 VFs
[19:32:47] [PASSED] 63 VFs
[19:32:47] ==================== [PASSED] fair_ggtt ====================
[19:32:47] ======================== fair_vram  ========================
[19:32:47] [PASSED] 1 VF
[19:32:47] [PASSED] 2 VFs
[19:32:47] [PASSED] 3 VFs
[19:32:47] [PASSED] 4 VFs
[19:32:47] [PASSED] 5 VFs
[19:32:47] [PASSED] 6 VFs
[19:32:47] [PASSED] 7 VFs
[19:32:47] [PASSED] 8 VFs
[19:32:47] [PASSED] 9 VFs
[19:32:47] [PASSED] 10 VFs
[19:32:47] [PASSED] 11 VFs
[19:32:47] [PASSED] 12 VFs
[19:32:47] [PASSED] 13 VFs
[19:32:47] [PASSED] 14 VFs
[19:32:47] [PASSED] 15 VFs
[19:32:47] [PASSED] 16 VFs
[19:32:47] [PASSED] 17 VFs
[19:32:47] [PASSED] 18 VFs
[19:32:47] [PASSED] 19 VFs
[19:32:47] [PASSED] 20 VFs
[19:32:47] [PASSED] 21 VFs
[19:32:47] [PASSED] 22 VFs
[19:32:47] [PASSED] 23 VFs
[19:32:47] [PASSED] 24 VFs
[19:32:47] [PASSED] 25 VFs
[19:32:47] [PASSED] 26 VFs
[19:32:47] [PASSED] 27 VFs
[19:32:47] [PASSED] 28 VFs
[19:32:47] [PASSED] 29 VFs
[19:32:47] [PASSED] 30 VFs
[19:32:47] [PASSED] 31 VFs
[19:32:47] [PASSED] 32 VFs
[19:32:47] [PASSED] 33 VFs
[19:32:47] [PASSED] 34 VFs
[19:32:47] [PASSED] 35 VFs
[19:32:47] [PASSED] 36 VFs
[19:32:47] [PASSED] 37 VFs
[19:32:47] [PASSED] 38 VFs
[19:32:47] [PASSED] 39 VFs
[19:32:47] [PASSED] 40 VFs
[19:32:47] [PASSED] 41 VFs
[19:32:47] [PASSED] 42 VFs
[19:32:47] [PASSED] 43 VFs
[19:32:47] [PASSED] 44 VFs
[19:32:47] [PASSED] 45 VFs
[19:32:47] [PASSED] 46 VFs
[19:32:47] [PASSED] 47 VFs
[19:32:47] [PASSED] 48 VFs
[19:32:47] [PASSED] 49 VFs
[19:32:47] [PASSED] 50 VFs
[19:32:47] [PASSED] 51 VFs
[19:32:47] [PASSED] 52 VFs
[19:32:47] [PASSED] 53 VFs
[19:32:47] [PASSED] 54 VFs
[19:32:47] [PASSED] 55 VFs
[19:32:47] [PASSED] 56 VFs
[19:32:47] [PASSED] 57 VFs
[19:32:47] [PASSED] 58 VFs
[19:32:47] [PASSED] 59 VFs
[19:32:47] [PASSED] 60 VFs
[19:32:47] [PASSED] 61 VFs
[19:32:47] [PASSED] 62 VFs
[19:32:47] [PASSED] 63 VFs
[19:32:47] ==================== [PASSED] fair_vram ====================
[19:32:47] ================== [PASSED] pf_gt_config ===================
[19:32:47] ===================== lmtt (1 subtest) =====================
[19:32:47] ======================== test_ops  =========================
[19:32:47] [PASSED] 2-level
[19:32:47] [PASSED] multi-level
[19:32:47] ==================== [PASSED] test_ops =====================
[19:32:47] ====================== [PASSED] lmtt =======================
[19:32:47] ================= pf_service (11 subtests) =================
[19:32:47] [PASSED] pf_negotiate_any
[19:32:47] [PASSED] pf_negotiate_base_match
[19:32:47] [PASSED] pf_negotiate_base_newer
[19:32:47] [PASSED] pf_negotiate_base_next
[19:32:47] [SKIPPED] pf_negotiate_base_older
[19:32:47] [PASSED] pf_negotiate_base_prev
[19:32:47] [PASSED] pf_negotiate_latest_match
[19:32:47] [PASSED] pf_negotiate_latest_newer
[19:32:47] [PASSED] pf_negotiate_latest_next
[19:32:47] [SKIPPED] pf_negotiate_latest_older
[19:32:47] [SKIPPED] pf_negotiate_latest_prev
[19:32:47] =================== [PASSED] pf_service ====================
[19:32:47] ================= xe_guc_g2g (2 subtests) ==================
[19:32:47] ============== xe_live_guc_g2g_kunit_default  ==============
[19:32:47] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[19:32:47] ============== xe_live_guc_g2g_kunit_allmem  ===============
[19:32:47] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[19:32:47] =================== [SKIPPED] xe_guc_g2g ===================
[19:32:47] =================== xe_mocs (2 subtests) ===================
[19:32:47] ================ xe_live_mocs_kernel_kunit  ================
[19:32:47] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[19:32:47] ================ xe_live_mocs_reset_kunit  =================
[19:32:47] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[19:32:47] ==================== [SKIPPED] xe_mocs =====================
[19:32:47] ================= xe_migrate (2 subtests) ==================
[19:32:47] ================= xe_migrate_sanity_kunit  =================
[19:32:47] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[19:32:47] ================== xe_validate_ccs_kunit  ==================
[19:32:47] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[19:32:47] =================== [SKIPPED] xe_migrate ===================
[19:32:47] ================== xe_dma_buf (1 subtest) ==================
[19:32:47] ==================== xe_dma_buf_kunit  =====================
[19:32:47] ================ [SKIPPED] xe_dma_buf_kunit ================
[19:32:47] =================== [SKIPPED] xe_dma_buf ===================
[19:32:47] ================= xe_bo_shrink (1 subtest) =================
[19:32:47] =================== xe_bo_shrink_kunit  ====================
[19:32:47] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[19:32:47] ================== [SKIPPED] xe_bo_shrink ==================
[19:32:47] ==================== xe_bo (2 subtests) ====================
[19:32:47] ================== xe_ccs_migrate_kunit  ===================
[19:32:47] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[19:32:47] ==================== xe_bo_evict_kunit  ====================
[19:32:47] =============== [SKIPPED] xe_bo_evict_kunit ================
[19:32:47] ===================== [SKIPPED] xe_bo ======================
[19:32:47] ==================== args (13 subtests) ====================
[19:32:47] [PASSED] count_args_test
[19:32:47] [PASSED] call_args_example
[19:32:47] [PASSED] call_args_test
[19:32:47] [PASSED] drop_first_arg_example
[19:32:47] [PASSED] drop_first_arg_test
[19:32:47] [PASSED] first_arg_example
[19:32:47] [PASSED] first_arg_test
[19:32:47] [PASSED] last_arg_example
[19:32:47] [PASSED] last_arg_test
[19:32:47] [PASSED] pick_arg_example
[19:32:47] [PASSED] if_args_example
[19:32:47] [PASSED] if_args_test
[19:32:47] [PASSED] sep_comma_example
[19:32:47] ====================== [PASSED] args =======================
[19:32:47] =================== xe_pci (3 subtests) ====================
[19:32:47] ==================== check_graphics_ip  ====================
[19:32:47] [PASSED] 12.00 Xe_LP
[19:32:47] [PASSED] 12.10 Xe_LP+
[19:32:47] [PASSED] 12.55 Xe_HPG
[19:32:47] [PASSED] 12.60 Xe_HPC
[19:32:47] [PASSED] 12.70 Xe_LPG
[19:32:47] [PASSED] 12.71 Xe_LPG
[19:32:47] [PASSED] 12.74 Xe_LPG+
[19:32:47] [PASSED] 20.01 Xe2_HPG
[19:32:47] [PASSED] 20.02 Xe2_HPG
[19:32:47] [PASSED] 20.04 Xe2_LPG
[19:32:47] [PASSED] 30.00 Xe3_LPG
[19:32:47] [PASSED] 30.01 Xe3_LPG
[19:32:47] [PASSED] 30.03 Xe3_LPG
[19:32:47] [PASSED] 30.04 Xe3_LPG
[19:32:47] [PASSED] 30.05 Xe3_LPG
[19:32:47] [PASSED] 35.10 Xe3p_LPG
[19:32:47] [PASSED] 35.11 Xe3p_XPC
[19:32:47] ================ [PASSED] check_graphics_ip ================
[19:32:47] ===================== check_media_ip  ======================
[19:32:47] [PASSED] 12.00 Xe_M
[19:32:47] [PASSED] 12.55 Xe_HPM
[19:32:47] [PASSED] 13.00 Xe_LPM+
[19:32:47] [PASSED] 13.01 Xe2_HPM
[19:32:47] [PASSED] 20.00 Xe2_LPM
[19:32:47] [PASSED] 30.00 Xe3_LPM
[19:32:47] [PASSED] 30.02 Xe3_LPM
[19:32:47] [PASSED] 35.00 Xe3p_LPM
[19:32:47] [PASSED] 35.03 Xe3p_HPM
[19:32:47] ================= [PASSED] check_media_ip ==================
[19:32:47] =================== check_platform_desc  ===================
[19:32:47] [PASSED] 0x9A60 (TIGERLAKE)
[19:32:47] [PASSED] 0x9A68 (TIGERLAKE)
[19:32:47] [PASSED] 0x9A70 (TIGERLAKE)
[19:32:47] [PASSED] 0x9A40 (TIGERLAKE)
[19:32:47] [PASSED] 0x9A49 (TIGERLAKE)
[19:32:47] [PASSED] 0x9A59 (TIGERLAKE)
[19:32:47] [PASSED] 0x9A78 (TIGERLAKE)
[19:32:47] [PASSED] 0x9AC0 (TIGERLAKE)
[19:32:47] [PASSED] 0x9AC9 (TIGERLAKE)
[19:32:47] [PASSED] 0x9AD9 (TIGERLAKE)
[19:32:47] [PASSED] 0x9AF8 (TIGERLAKE)
[19:32:47] [PASSED] 0x4C80 (ROCKETLAKE)
[19:32:47] [PASSED] 0x4C8A (ROCKETLAKE)
[19:32:47] [PASSED] 0x4C8B (ROCKETLAKE)
[19:32:47] [PASSED] 0x4C8C (ROCKETLAKE)
[19:32:47] [PASSED] 0x4C90 (ROCKETLAKE)
[19:32:47] [PASSED] 0x4C9A (ROCKETLAKE)
[19:32:47] [PASSED] 0x4680 (ALDERLAKE_S)
[19:32:47] [PASSED] 0x4682 (ALDERLAKE_S)
[19:32:47] [PASSED] 0x4688 (ALDERLAKE_S)
[19:32:47] [PASSED] 0x468A (ALDERLAKE_S)
[19:32:47] [PASSED] 0x468B (ALDERLAKE_S)
[19:32:47] [PASSED] 0x4690 (ALDERLAKE_S)
[19:32:47] [PASSED] 0x4692 (ALDERLAKE_S)
[19:32:47] [PASSED] 0x4693 (ALDERLAKE_S)
[19:32:47] [PASSED] 0x46A0 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46A1 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46A2 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46A3 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46A6 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46A8 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46AA (ALDERLAKE_P)
[19:32:47] [PASSED] 0x462A (ALDERLAKE_P)
[19:32:47] [PASSED] 0x4626 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x4628 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46B0 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46B1 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46B2 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46B3 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46C0 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46C1 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46C2 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46C3 (ALDERLAKE_P)
[19:32:47] [PASSED] 0x46D0 (ALDERLAKE_N)
[19:32:47] [PASSED] 0x46D1 (ALDERLAKE_N)
[19:32:47] [PASSED] 0x46D2 (ALDERLAKE_N)
[19:32:47] [PASSED] 0x46D3 (ALDERLAKE_N)
[19:32:47] [PASSED] 0x46D4 (ALDERLAKE_N)
[19:32:47] [PASSED] 0xA721 (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7A1 (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7A9 (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7AC (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7AD (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA720 (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7A0 (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7A8 (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7AA (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA7AB (ALDERLAKE_P)
[19:32:47] [PASSED] 0xA780 (ALDERLAKE_S)
[19:32:47] [PASSED] 0xA781 (ALDERLAKE_S)
[19:32:47] [PASSED] 0xA782 (ALDERLAKE_S)
[19:32:47] [PASSED] 0xA783 (ALDERLAKE_S)
[19:32:47] [PASSED] 0xA788 (ALDERLAKE_S)
[19:32:47] [PASSED] 0xA789 (ALDERLAKE_S)
[19:32:47] [PASSED] 0xA78A (ALDERLAKE_S)
[19:32:47] [PASSED] 0xA78B (ALDERLAKE_S)
[19:32:47] [PASSED] 0x4905 (DG1)
[19:32:47] [PASSED] 0x4906 (DG1)
[19:32:47] [PASSED] 0x4907 (DG1)
[19:32:47] [PASSED] 0x4908 (DG1)
[19:32:47] [PASSED] 0x4909 (DG1)
[19:32:47] [PASSED] 0x56C0 (DG2)
[19:32:47] [PASSED] 0x56C2 (DG2)
[19:32:47] [PASSED] 0x56C1 (DG2)
[19:32:47] [PASSED] 0x7D51 (METEORLAKE)
[19:32:47] [PASSED] 0x7DD1 (METEORLAKE)
[19:32:47] [PASSED] 0x7D41 (METEORLAKE)
[19:32:47] [PASSED] 0x7D67 (METEORLAKE)
[19:32:47] [PASSED] 0xB640 (METEORLAKE)
[19:32:47] [PASSED] 0x56A0 (DG2)
[19:32:47] [PASSED] 0x56A1 (DG2)
[19:32:47] [PASSED] 0x56A2 (DG2)
[19:32:47] [PASSED] 0x56BE (DG2)
[19:32:47] [PASSED] 0x56BF (DG2)
[19:32:47] [PASSED] 0x5690 (DG2)
[19:32:47] [PASSED] 0x5691 (DG2)
[19:32:47] [PASSED] 0x5692 (DG2)
[19:32:47] [PASSED] 0x56A5 (DG2)
[19:32:47] [PASSED] 0x56A6 (DG2)
[19:32:47] [PASSED] 0x56B0 (DG2)
[19:32:47] [PASSED] 0x56B1 (DG2)
[19:32:47] [PASSED] 0x56BA (DG2)
[19:32:47] [PASSED] 0x56BB (DG2)
[19:32:47] [PASSED] 0x56BC (DG2)
[19:32:47] [PASSED] 0x56BD (DG2)
[19:32:47] [PASSED] 0x5693 (DG2)
[19:32:47] [PASSED] 0x5694 (DG2)
[19:32:47] [PASSED] 0x5695 (DG2)
[19:32:47] [PASSED] 0x56A3 (DG2)
[19:32:47] [PASSED] 0x56A4 (DG2)
[19:32:47] [PASSED] 0x56B2 (DG2)
[19:32:47] [PASSED] 0x56B3 (DG2)
[19:32:47] [PASSED] 0x5696 (DG2)
[19:32:47] [PASSED] 0x5697 (DG2)
[19:32:47] [PASSED] 0xB69 (PVC)
[19:32:47] [PASSED] 0xB6E (PVC)
[19:32:47] [PASSED] 0xBD4 (PVC)
[19:32:47] [PASSED] 0xBD5 (PVC)
[19:32:47] [PASSED] 0xBD6 (PVC)
[19:32:47] [PASSED] 0xBD7 (PVC)
[19:32:47] [PASSED] 0xBD8 (PVC)
[19:32:47] [PASSED] 0xBD9 (PVC)
[19:32:47] [PASSED] 0xBDA (PVC)
[19:32:47] [PASSED] 0xBDB (PVC)
[19:32:47] [PASSED] 0xBE0 (PVC)
[19:32:47] [PASSED] 0xBE1 (PVC)
[19:32:47] [PASSED] 0xBE5 (PVC)
[19:32:47] [PASSED] 0x7D40 (METEORLAKE)
[19:32:47] [PASSED] 0x7D45 (METEORLAKE)
[19:32:47] [PASSED] 0x7D55 (METEORLAKE)
[19:32:47] [PASSED] 0x7D60 (METEORLAKE)
[19:32:47] [PASSED] 0x7DD5 (METEORLAKE)
[19:32:47] [PASSED] 0x6420 (LUNARLAKE)
[19:32:47] [PASSED] 0x64A0 (LUNARLAKE)
[19:32:47] [PASSED] 0x64B0 (LUNARLAKE)
[19:32:47] [PASSED] 0xE202 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE209 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE20B (BATTLEMAGE)
[19:32:47] [PASSED] 0xE20C (BATTLEMAGE)
[19:32:47] [PASSED] 0xE20D (BATTLEMAGE)
[19:32:47] [PASSED] 0xE210 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE211 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE212 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE216 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE220 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE221 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE222 (BATTLEMAGE)
[19:32:47] [PASSED] 0xE223 (BATTLEMAGE)
[19:32:47] [PASSED] 0xB080 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB081 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB082 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB083 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB084 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB085 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB086 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB087 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB08F (PANTHERLAKE)
[19:32:47] [PASSED] 0xB090 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB0A0 (PANTHERLAKE)
[19:32:47] [PASSED] 0xB0B0 (PANTHERLAKE)
[19:32:47] [PASSED] 0xFD80 (PANTHERLAKE)
[19:32:47] [PASSED] 0xFD81 (PANTHERLAKE)
[19:32:47] [PASSED] 0xD740 (NOVALAKE_S)
[19:32:47] [PASSED] 0xD741 (NOVALAKE_S)
[19:32:47] [PASSED] 0xD742 (NOVALAKE_S)
[19:32:47] [PASSED] 0xD743 (NOVALAKE_S)
[19:32:47] [PASSED] 0xD745 (NOVALAKE_S)
[19:32:47] [PASSED] 0xD74A (NOVALAKE_S)
[19:32:47] [PASSED] 0xD74B (NOVALAKE_S)
[19:32:47] [PASSED] 0x674C (CRESCENTISLAND)
[19:32:47] [PASSED] 0x674D (CRESCENTISLAND)
[19:32:47] [PASSED] 0x674E (CRESCENTISLAND)
[19:32:47] [PASSED] 0x674F (CRESCENTISLAND)
[19:32:47] [PASSED] 0x6750 (CRESCENTISLAND)
[19:32:47] [PASSED] 0xD750 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD751 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD752 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD753 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD754 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD755 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD756 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD757 (NOVALAKE_P)
[19:32:47] [PASSED] 0xD75F (NOVALAKE_P)
[19:32:47] =============== [PASSED] check_platform_desc ===============
[19:32:47] ===================== [PASSED] xe_pci ======================
[19:32:47] ============= xe_rtp_tables_test (4 subtests) ==============
[19:32:47] ================== xe_rtp_table_gt_test  ===================
[19:32:47] [PASSED] gt_was/14011060649
[19:32:47] [PASSED] gt_was/14011059788
[19:32:47] [PASSED] gt_was/14015795083
[19:32:47] [PASSED] gt_was/16021867713
[19:32:47] [PASSED] gt_was/14019449301
[19:32:47] [PASSED] gt_was/16028005424
[19:32:47] [PASSED] gt_was/14026578760
[19:32:47] [PASSED] gt_was/1409420604
[19:32:47] [PASSED] gt_was/1408615072
[19:32:47] [PASSED] gt_was/22010523718
[19:32:47] [PASSED] gt_was/14011006942
[19:32:47] [PASSED] gt_was/14014830051
[19:32:47] [PASSED] gt_was/18018781329
[19:32:47] [PASSED] gt_was/1509235366
[19:32:47] [PASSED] gt_was/18018781329
[19:32:47] [PASSED] gt_was/16016694945
[19:32:47] [PASSED] gt_was/14018575942
[19:32:47] [PASSED] gt_was/22016670082
[19:32:47] [PASSED] gt_was/22016670082
[19:32:47] [PASSED] gt_was/14017421178
[19:32:47] [PASSED] gt_was/16025250150
[19:32:47] [PASSED] gt_was/14021871409
[19:32:47] [PASSED] gt_was/16021865536
[19:32:47] [PASSED] gt_was/14021486841
[19:32:47] [PASSED] gt_was/14025160223
[19:32:47] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[19:32:47] [PASSED] gt_was/14025635424
[19:32:47] [PASSED] gt_was/16028005424
[19:32:47] ============== [PASSED] xe_rtp_table_gt_test ===============
[19:32:47] ================== xe_rtp_table_gt_test  ===================
[19:32:47] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[19:32:47] [PASSED] gt_tunings/Tuning: 32B Access Enable
[19:32:47] [PASSED] gt_tunings/Tuning: L3 cache
[19:32:47] [PASSED] gt_tunings/Tuning: L3 cache - media
[19:32:47] [PASSED] gt_tunings/Tuning: Compression Overfetch
[19:32:47] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[19:32:47] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[19:32:47] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[19:32:47] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[19:32:47] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[19:32:47] [PASSED] gt_tunings/Tuning: Stateless compression control
[19:32:47] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[19:32:47] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[19:32:47] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[19:32:47] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[19:32:47] ============== [PASSED] xe_rtp_table_gt_test ===============
[19:32:47] ================== xe_rtp_table_oob_test  ==================
[19:32:47] [PASSED] oob_was/1607983814
[19:32:47] [PASSED] oob_was/16010904313
[19:32:47] [PASSED] oob_was/18022495364
[19:32:47] [PASSED] oob_was/22012773006
[19:32:47] [PASSED] oob_was/14014475959
[19:32:47] [PASSED] oob_was/22011391025
[19:32:47] [PASSED] oob_was/22012727170
[19:32:47] [PASSED] oob_was/22012727685
[19:32:47] [PASSED] oob_was/22016596838
[19:32:47] [PASSED] oob_was/18020744125
[19:32:47] [PASSED] oob_was/1409600907
[19:32:47] [PASSED] oob_was/22014953428
[19:32:47] [PASSED] oob_was/16017236439
[19:32:47] [PASSED] oob_was/14019821291
[19:32:47] [PASSED] oob_was/14015076503
[19:32:47] [PASSED] oob_was/14018913170
[19:32:47] [PASSED] oob_was/14018094691
[19:32:47] [PASSED] oob_was/18024947630
[19:32:47] [PASSED] oob_was/16022287689
[19:32:47] [PASSED] oob_was/13011645652
[19:32:47] [PASSED] oob_was/14022293748
[19:32:47] [PASSED] oob_was/22019794406
[19:32:47] [PASSED] oob_was/22019338487
[19:32:47] [PASSED] oob_was/16023588340
[19:32:47] [PASSED] oob_was/14019789679
[19:32:47] [PASSED] oob_was/14022866841
[19:32:47] [PASSED] oob_was/16021333562
[19:32:47] [PASSED] oob_was/14016712196
[19:32:47] [PASSED] oob_was/14015568240
[19:32:47] [PASSED] oob_was/18013179988
[19:32:47] [PASSED] oob_was/1508761755
[19:32:47] [PASSED] oob_was/16023105232
[19:32:47] [PASSED] oob_was/16026508708
[19:32:47] [PASSED] oob_was/14020001231
[19:32:47] [PASSED] oob_was/16023683509
[19:32:47] [PASSED] oob_was/14025515070
[19:32:47] [PASSED] oob_was/15015404425_disable
[19:32:47] [PASSED] oob_was/16026007364
[19:32:47] [PASSED] oob_was/14020316580
[19:32:47] [PASSED] oob_was/14025883347
[19:32:47] [PASSED] oob_was/16029380221
[19:32:47] ============== [PASSED] xe_rtp_table_oob_test ==============
[19:32:47] ================ xe_rtp_table_dev_oob_test  ================
[19:32:47] [PASSED] device_oob_was/22010954014
[19:32:47] [PASSED] device_oob_was/15015404425
[19:32:47] [PASSED] device_oob_was/22019338487_display
[19:32:47] [PASSED] device_oob_was/14022085890
[19:32:47] [PASSED] device_oob_was/14026539277
[19:32:47] [PASSED] device_oob_was/14026633728
[19:32:47] [PASSED] device_oob_was/14026746987
[19:32:47] [PASSED] device_oob_was/14026779378
[19:32:47] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[19:32:47] =============== [PASSED] xe_rtp_tables_test ================
[19:32:47] =================== xe_rtp (3 subtests) ====================
[19:32:47] =================== xe_rtp_rules_tests  ====================
[19:32:47] [PASSED] no
[19:32:47] [PASSED] yes
[19:32:47] [PASSED] no-and-no
[19:32:47] [PASSED] no-and-yes
[19:32:47] [PASSED] yes-and-no
[19:32:47] [PASSED] yes-and-yes
[19:32:47] [PASSED] no-or-no
[19:32:47] [PASSED] no-or-yes
[19:32:47] [PASSED] yes-or-no
[19:32:47] [PASSED] yes-or-yes
[19:32:47] [PASSED] no-yes-or-yes-no
[19:32:47] [PASSED] no-yes-or-yes-yes
[19:32:47] [PASSED] yes-yes-or-no-yes
[19:32:47] [PASSED] yes-yes-or-yes-yes
[19:32:47] [PASSED] no-no-or-yes-or-no
[19:32:47] [PASSED] or
[19:32:47] [PASSED] or-yes
[19:32:47] [PASSED] or-no
[19:32:47] [PASSED] yes-or
[19:32:47] [PASSED] no-or
[19:32:47] [PASSED] no-or-or-yes
[19:32:47] [PASSED] yes-or-or-no
[19:32:47] [PASSED] no-or-or-no
[19:32:47] [PASSED] missing-context-engine-class
[19:32:47] [PASSED] missing-context-engine-class-or-yes
[19:32:47] [PASSED] missing-context-engine-class-or-or-yes
[19:32:47] =============== [PASSED] xe_rtp_rules_tests ================
[19:32:47] =============== xe_rtp_process_to_sr_tests  ================
[19:32:47] [PASSED] coalesce-same-reg
[19:32:47] [PASSED] coalesce-same-reg-literal-and-func
[19:32:47] [PASSED] no-match-no-add
[19:32:47] [PASSED] two-regs-two-entries
[19:32:47] [PASSED] clr-one-set-other
[19:32:47] [PASSED] set-field
[19:32:47] [PASSED] conflict-duplicate
[19:32:47] [PASSED] conflict-not-disjoint
[19:32:47] [PASSED] conflict-not-disjoint-literal-and-func
[19:32:47] [PASSED] conflict-reg-type
[19:32:47] [PASSED] bad-mcr-reg-forced-to-regular
[19:32:47] [PASSED] bad-regular-reg-forced-to-mcr
[19:32:47] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[19:32:47] ================== xe_rtp_process_tests  ===================
[19:32:47] [PASSED] active1
[19:32:47] [PASSED] active2
[19:32:47] [PASSED] active-inactive
[19:32:47] [PASSED] inactive-active
[19:32:47] [PASSED] inactive-active-inactive
[19:32:47] [PASSED] inactive-inactive-inactive
[19:32:47] ============== [PASSED] xe_rtp_process_tests ===============
[19:32:47] ===================== [PASSED] xe_rtp ======================
[19:32:47] ==================== xe_wa (1 subtest) =====================
[19:32:47] ======================== xe_wa_gt  =========================
[19:32:47] [PASSED] TIGERLAKE B0
[19:32:47] [PASSED] DG1 A0
[19:32:47] [PASSED] DG1 B0
[19:32:47] [PASSED] ALDERLAKE_S A0
[19:32:47] [PASSED] ALDERLAKE_S B0
[19:32:47] [PASSED] ALDERLAKE_S C0
[19:32:47] [PASSED] ALDERLAKE_S D0
[19:32:47] [PASSED] ALDERLAKE_P A0
[19:32:47] [PASSED] ALDERLAKE_P B0
[19:32:47] [PASSED] ALDERLAKE_P C0
[19:32:47] [PASSED] ALDERLAKE_S RPLS D0
[19:32:47] [PASSED] ALDERLAKE_P RPLU E0
[19:32:47] [PASSED] DG2 G10 C0
[19:32:47] [PASSED] DG2 G11 B1
[19:32:47] [PASSED] DG2 G12 A1
[19:32:47] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[19:32:47] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[19:32:47] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[19:32:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[19:32:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[19:32:47] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[19:32:47] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[19:32:47] ==================== [PASSED] xe_wa_gt =====================
[19:32:47] ====================== [PASSED] xe_wa ======================
[19:32:47] ============================================================
[19:32:47] Testing complete. Ran 719 tests: passed: 701, skipped: 18
[19:32:47] Elapsed time: 36.164s total, 4.303s configuring, 31.193s building, 0.649s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:32:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:32:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:33:13] Starting KUnit Kernel (1/1)...
[19:33:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:33:13] ============ drm_test_pick_cmdline (2 subtests) ============
[19:33:13] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:33:13] =============== drm_test_pick_cmdline_named  ===============
[19:33:13] [PASSED] NTSC
[19:33:13] [PASSED] NTSC-J
[19:33:13] [PASSED] PAL
[19:33:13] [PASSED] PAL-M
[19:33:13] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:33:13] ============== [PASSED] drm_test_pick_cmdline ==============
[19:33:13] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[19:33:13] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[19:33:13] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[19:33:13] =========== drm_validate_clone_mode (2 subtests) ===========
[19:33:13] ============== drm_test_check_in_clone_mode  ===============
[19:33:13] [PASSED] in_clone_mode
[19:33:13] [PASSED] not_in_clone_mode
[19:33:13] ========== [PASSED] drm_test_check_in_clone_mode ===========
[19:33:13] =============== drm_test_check_valid_clones  ===============
[19:33:13] [PASSED] not_in_clone_mode
[19:33:13] [PASSED] valid_clone
[19:33:13] [PASSED] invalid_clone
[19:33:13] =========== [PASSED] drm_test_check_valid_clones ===========
[19:33:13] ============= [PASSED] drm_validate_clone_mode =============
[19:33:13] ============= drm_validate_modeset (1 subtest) =============
[19:33:13] [PASSED] drm_test_check_connector_changed_modeset
[19:33:13] ============== [PASSED] drm_validate_modeset ===============
[19:33:13] ====== drm_test_bridge_get_current_state (2 subtests) ======
[19:33:13] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[19:33:13] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[19:33:13] ======== [PASSED] drm_test_bridge_get_current_state ========
[19:33:13] ====== drm_test_bridge_helper_reset_crtc (4 subtests) ======
[19:33:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[19:33:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[19:33:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[19:33:13] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[19:33:13] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[19:33:13] ============== drm_bridge_alloc (2 subtests) ===============
[19:33:13] [PASSED] drm_test_drm_bridge_alloc_basic
[19:33:13] [PASSED] drm_test_drm_bridge_alloc_get_put
[19:33:13] ================ [PASSED] drm_bridge_alloc =================
[19:33:13] ============= drm_bridge_bus_fmt (5 subtests) ==============
[19:33:13] [PASSED] drm_test_bridge_rgb_yuv_rgb
[19:33:13] [PASSED] drm_test_bridge_must_convert_to_yuv444
[19:33:13] [PASSED] drm_test_bridge_hdmi_auto_rgb
[19:33:13] [PASSED] drm_test_bridge_auto_first
[19:33:13] [PASSED] drm_test_bridge_rgb_yuv_no_path
[19:33:13] =============== [PASSED] drm_bridge_bus_fmt ================
[19:33:13] ============= drm_cmdline_parser (40 subtests) =============
[19:33:13] [PASSED] drm_test_cmdline_force_d_only
[19:33:13] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:33:13] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:33:13] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:33:13] [PASSED] drm_test_cmdline_force_e_only
[19:33:13] [PASSED] drm_test_cmdline_res
[19:33:13] [PASSED] drm_test_cmdline_res_vesa
[19:33:13] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:33:13] [PASSED] drm_test_cmdline_res_rblank
[19:33:13] [PASSED] drm_test_cmdline_res_bpp
[19:33:13] [PASSED] drm_test_cmdline_res_refresh
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:33:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:33:13] [PASSED] drm_test_cmdline_res_margins_force_on
[19:33:13] [PASSED] drm_test_cmdline_res_vesa_margins
[19:33:13] [PASSED] drm_test_cmdline_name
[19:33:13] [PASSED] drm_test_cmdline_name_bpp
[19:33:13] [PASSED] drm_test_cmdline_name_option
[19:33:13] [PASSED] drm_test_cmdline_name_bpp_option
[19:33:13] [PASSED] drm_test_cmdline_rotate_0
[19:33:13] [PASSED] drm_test_cmdline_rotate_90
[19:33:13] [PASSED] drm_test_cmdline_rotate_180
[19:33:13] [PASSED] drm_test_cmdline_rotate_270
[19:33:13] [PASSED] drm_test_cmdline_hmirror
[19:33:13] [PASSED] drm_test_cmdline_vmirror
[19:33:13] [PASSED] drm_test_cmdline_margin_options
[19:33:13] [PASSED] drm_test_cmdline_multiple_options
[19:33:13] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:33:13] [PASSED] drm_test_cmdline_extra_and_option
[19:33:13] [PASSED] drm_test_cmdline_freestanding_options
[19:33:13] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:33:13] [PASSED] drm_test_cmdline_panel_orientation
[19:33:13] ================ drm_test_cmdline_invalid  =================
[19:33:13] [PASSED] margin_only
[19:33:13] [PASSED] interlace_only
[19:33:13] [PASSED] res_missing_x
[19:33:13] [PASSED] res_missing_y
[19:33:13] [PASSED] res_bad_y
[19:33:13] [PASSED] res_missing_y_bpp
[19:33:13] [PASSED] res_bad_bpp
[19:33:13] [PASSED] res_bad_refresh
[19:33:13] [PASSED] res_bpp_refresh_force_on_off
[19:33:13] [PASSED] res_invalid_mode
[19:33:13] [PASSED] res_bpp_wrong_place_mode
[19:33:13] [PASSED] name_bpp_refresh
[19:33:13] [PASSED] name_refresh
[19:33:13] [PASSED] name_refresh_wrong_mode
[19:33:13] [PASSED] name_refresh_invalid_mode
[19:33:13] [PASSED] rotate_multiple
[19:33:13] [PASSED] rotate_invalid_val
[19:33:13] [PASSED] rotate_truncated
[19:33:13] [PASSED] invalid_option
[19:33:13] [PASSED] invalid_tv_option
[19:33:13] [PASSED] truncated_tv_option
[19:33:13] ============ [PASSED] drm_test_cmdline_invalid =============
[19:33:13] =============== drm_test_cmdline_tv_options  ===============
[19:33:13] [PASSED] NTSC
[19:33:13] [PASSED] NTSC_443
[19:33:13] [PASSED] NTSC_J
[19:33:13] [PASSED] PAL
[19:33:13] [PASSED] PAL_M
[19:33:13] [PASSED] PAL_N
[19:33:13] [PASSED] SECAM
[19:33:13] [PASSED] MONO_525
[19:33:13] [PASSED] MONO_625
[19:33:13] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:33:13] =============== [PASSED] drm_cmdline_parser ================
[19:33:13] ========== drmm_connector_hdmi_init (20 subtests) ==========
[19:33:13] [PASSED] drm_test_connector_hdmi_init_valid
[19:33:13] [PASSED] drm_test_connector_hdmi_init_bpc_8
[19:33:13] [PASSED] drm_test_connector_hdmi_init_bpc_10
[19:33:13] [PASSED] drm_test_connector_hdmi_init_bpc_12
[19:33:13] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[19:33:13] [PASSED] drm_test_connector_hdmi_init_bpc_null
[19:33:13] [PASSED] drm_test_connector_hdmi_init_formats_empty
[19:33:13] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[19:33:13] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[19:33:13] [PASSED] supported_formats=0x9 yuv420_allowed=1
[19:33:13] [PASSED] supported_formats=0x9 yuv420_allowed=0
[19:33:13] [PASSED] supported_formats=0x5 yuv420_allowed=1
[19:33:13] [PASSED] supported_formats=0x5 yuv420_allowed=0
[19:33:13] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[19:33:13] [PASSED] drm_test_connector_hdmi_init_null_ddc
[19:33:13] [PASSED] drm_test_connector_hdmi_init_null_product
[19:33:13] [PASSED] drm_test_connector_hdmi_init_null_vendor
[19:33:13] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[19:33:13] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[19:33:13] [PASSED] drm_test_connector_hdmi_init_product_valid
[19:33:13] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[19:33:13] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[19:33:13] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[19:33:13] ========= drm_test_connector_hdmi_init_type_valid  =========
[19:33:13] [PASSED] HDMI-A
[19:33:13] [PASSED] HDMI-B
[19:33:13] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[19:33:13] ======== drm_test_connector_hdmi_init_type_invalid  ========
[19:33:13] [PASSED] Unknown
[19:33:13] [PASSED] VGA
[19:33:13] [PASSED] DVI-I
[19:33:13] [PASSED] DVI-D
[19:33:13] [PASSED] DVI-A
[19:33:13] [PASSED] Composite
[19:33:13] [PASSED] SVIDEO
[19:33:13] [PASSED] LVDS
[19:33:13] [PASSED] Component
[19:33:13] [PASSED] DIN
[19:33:13] [PASSED] DP
[19:33:13] [PASSED] TV
[19:33:13] [PASSED] eDP
[19:33:13] [PASSED] Virtual
[19:33:13] [PASSED] DSI
[19:33:13] [PASSED] DPI
[19:33:13] [PASSED] Writeback
[19:33:13] [PASSED] SPI
[19:33:13] [PASSED] USB
[19:33:13] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[19:33:13] ============ [PASSED] drmm_connector_hdmi_init =============
[19:33:13] ============= drmm_connector_init (3 subtests) =============
[19:33:13] [PASSED] drm_test_drmm_connector_init
[19:33:13] [PASSED] drm_test_drmm_connector_init_null_ddc
[19:33:13] ========= drm_test_drmm_connector_init_type_valid  =========
[19:33:13] [PASSED] Unknown
[19:33:13] [PASSED] VGA
[19:33:13] [PASSED] DVI-I
[19:33:13] [PASSED] DVI-D
[19:33:13] [PASSED] DVI-A
[19:33:13] [PASSED] Composite
[19:33:13] [PASSED] SVIDEO
[19:33:13] [PASSED] LVDS
[19:33:13] [PASSED] Component
[19:33:13] [PASSED] DIN
[19:33:13] [PASSED] DP
[19:33:13] [PASSED] HDMI-A
[19:33:13] [PASSED] HDMI-B
[19:33:13] [PASSED] TV
[19:33:13] [PASSED] eDP
[19:33:13] [PASSED] Virtual
[19:33:13] [PASSED] DSI
[19:33:13] [PASSED] DPI
[19:33:13] [PASSED] Writeback
[19:33:13] [PASSED] SPI
[19:33:13] [PASSED] USB
[19:33:13] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[19:33:13] =============== [PASSED] drmm_connector_init ===============
[19:33:13] ========= drm_connector_dynamic_init (6 subtests) ==========
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_init
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_init_properties
[19:33:13] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[19:33:13] [PASSED] Unknown
[19:33:13] [PASSED] VGA
[19:33:13] [PASSED] DVI-I
[19:33:13] [PASSED] DVI-D
[19:33:13] [PASSED] DVI-A
[19:33:13] [PASSED] Composite
[19:33:13] [PASSED] SVIDEO
[19:33:13] [PASSED] LVDS
[19:33:13] [PASSED] Component
[19:33:13] [PASSED] DIN
[19:33:13] [PASSED] DP
[19:33:13] [PASSED] HDMI-A
[19:33:13] [PASSED] HDMI-B
[19:33:13] [PASSED] TV
[19:33:13] [PASSED] eDP
[19:33:13] [PASSED] Virtual
[19:33:13] [PASSED] DSI
[19:33:13] [PASSED] DPI
[19:33:13] [PASSED] Writeback
[19:33:13] [PASSED] SPI
[19:33:13] [PASSED] USB
[19:33:13] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[19:33:13] ======== drm_test_drm_connector_dynamic_init_name  =========
[19:33:13] [PASSED] Unknown
[19:33:13] [PASSED] VGA
[19:33:13] [PASSED] DVI-I
[19:33:13] [PASSED] DVI-D
[19:33:13] [PASSED] DVI-A
[19:33:13] [PASSED] Composite
[19:33:13] [PASSED] SVIDEO
[19:33:13] [PASSED] LVDS
[19:33:13] [PASSED] Component
[19:33:13] [PASSED] DIN
[19:33:13] [PASSED] DP
[19:33:13] [PASSED] HDMI-A
[19:33:13] [PASSED] HDMI-B
[19:33:13] [PASSED] TV
[19:33:13] [PASSED] eDP
[19:33:13] [PASSED] Virtual
[19:33:13] [PASSED] DSI
[19:33:13] [PASSED] DPI
[19:33:13] [PASSED] Writeback
[19:33:13] [PASSED] SPI
[19:33:13] [PASSED] USB
[19:33:13] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[19:33:13] =========== [PASSED] drm_connector_dynamic_init ============
[19:33:13] ==== drm_connector_dynamic_register_early (4 subtests) =====
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[19:33:13] ====== [PASSED] drm_connector_dynamic_register_early =======
[19:33:13] ======= drm_connector_dynamic_register (7 subtests) ========
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[19:33:13] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[19:33:13] ========= [PASSED] drm_connector_dynamic_register ==========
[19:33:13] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[19:33:13] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[19:33:13] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[19:33:13] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[19:33:13] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[19:33:13] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:33:13] [PASSED] NTSC
[19:33:13] [PASSED] NTSC-443
[19:33:13] [PASSED] NTSC-J
[19:33:13] [PASSED] PAL
[19:33:13] [PASSED] PAL-M
[19:33:13] [PASSED] PAL-N
[19:33:13] [PASSED] SECAM
[19:33:13] [PASSED] Mono
[19:33:13] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:33:13] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:33:13] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:33:13] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[19:33:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[19:33:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[19:33:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[19:33:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[19:33:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[19:33:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[19:33:13] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[19:33:13] [PASSED] VIC 96
[19:33:13] [PASSED] VIC 97
[19:33:13] [PASSED] VIC 101
[19:33:13] [PASSED] VIC 102
[19:33:13] [PASSED] VIC 106
[19:33:13] [PASSED] VIC 107
[19:33:13] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[19:33:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[19:33:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[19:33:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[19:33:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[19:33:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[19:33:13] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[19:33:13] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[19:33:13] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[19:33:13] [PASSED] Automatic
[19:33:13] [PASSED] Full
[19:33:13] [PASSED] Limited 16:235
[19:33:13] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[19:33:13] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[19:33:13] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[19:33:13] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[19:33:13] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[19:33:13] [PASSED] RGB
[19:33:13] [PASSED] YUV 4:2:0
[19:33:13] [PASSED] YUV 4:2:2
[19:33:13] [PASSED] YUV 4:4:4
[19:33:13] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[19:33:13] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[19:33:13] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[19:33:13] ============= drm_damage_helper (21 subtests) ==============
[19:33:13] [PASSED] drm_test_damage_iter_no_damage
[19:33:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:33:13] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:33:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:33:13] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:33:13] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:33:13] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:33:13] [PASSED] drm_test_damage_iter_simple_damage
[19:33:13] [PASSED] drm_test_damage_iter_single_damage
[19:33:13] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:33:13] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:33:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:33:13] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:33:13] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:33:13] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:33:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:33:13] [PASSED] drm_test_damage_iter_damage
[19:33:13] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:33:13] [PASSED] drm_test_damage_iter_damage_one_outside
[19:33:13] [PASSED] drm_test_damage_iter_damage_src_moved
[19:33:13] [PASSED] drm_test_damage_iter_damage_not_visible
[19:33:13] ================ [PASSED] drm_damage_helper ================
[19:33:13] ============== drm_dp_mst_helper (3 subtests) ==============
[19:33:13] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:33:13] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:33:13] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:33:13] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:33:13] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:33:13] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:33:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:33:13] ============== drm_test_dp_mst_calc_pbn_div  ===============
[19:33:13] [PASSED] Link rate 2000000 lane count 4
[19:33:13] [PASSED] Link rate 2000000 lane count 2
[19:33:13] [PASSED] Link rate 2000000 lane count 1
[19:33:13] [PASSED] Link rate 1350000 lane count 4
[19:33:13] [PASSED] Link rate 1350000 lane count 2
[19:33:13] [PASSED] Link rate 1350000 lane count 1
[19:33:13] [PASSED] Link rate 1000000 lane count 4
[19:33:13] [PASSED] Link rate 1000000 lane count 2
[19:33:13] [PASSED] Link rate 1000000 lane count 1
[19:33:13] [PASSED] Link rate 810000 lane count 4
[19:33:13] [PASSED] Link rate 810000 lane count 2
[19:33:13] [PASSED] Link rate 810000 lane count 1
[19:33:13] [PASSED] Link rate 540000 lane count 4
[19:33:13] [PASSED] Link rate 540000 lane count 2
[19:33:13] [PASSED] Link rate 540000 lane count 1
[19:33:13] [PASSED] Link rate 270000 lane count 4
[19:33:13] [PASSED] Link rate 270000 lane count 2
[19:33:13] [PASSED] Link rate 270000 lane count 1
[19:33:13] [PASSED] Link rate 162000 lane count 4
[19:33:13] [PASSED] Link rate 162000 lane count 2
[19:33:13] [PASSED] Link rate 162000 lane count 1
[19:33:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[19:33:13] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:33:13] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:33:13] [PASSED] DP_POWER_UP_PHY with port number
[19:33:13] [PASSED] DP_POWER_DOWN_PHY with port number
[19:33:13] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:33:13] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:33:13] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:33:13] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:33:13] [PASSED] DP_QUERY_PAYLOAD with port number
[19:33:13] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:33:13] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:33:13] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:33:13] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:33:13] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:33:13] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:33:13] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:33:13] [PASSED] DP_REMOTE_I2C_READ with port number
[19:33:13] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:33:13] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:33:13] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:33:13] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:33:13] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:33:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:33:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:33:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:33:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:33:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:33:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:33:13] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:33:13] ================ [PASSED] drm_dp_mst_helper ================
[19:33:13] ================== drm_exec (7 subtests) ===================
[19:33:13] [PASSED] sanitycheck
[19:33:13] [PASSED] test_lock
[19:33:13] [PASSED] test_lock_unlock
[19:33:13] [PASSED] test_duplicates
[19:33:13] [PASSED] test_prepare
[19:33:13] [PASSED] test_prepare_array
[19:33:13] [PASSED] test_multiple_loops
[19:33:13] ==================== [PASSED] drm_exec =====================
[19:33:13] =========== drm_format_helper_test (17 subtests) ===========
[19:33:13] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:33:13] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:33:13] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:33:13] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:33:13] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:33:13] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:33:13] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:33:13] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[19:33:13] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:33:13] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:33:13] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:33:13] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:33:13] ==================== drm_test_fb_swab  =====================
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ================ [PASSED] drm_test_fb_swab =================
[19:33:13] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[19:33:13] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[19:33:13] [PASSED] single_pixel_source_buffer
[19:33:13] [PASSED] single_pixel_clip_rectangle
[19:33:13] [PASSED] well_known_colors
[19:33:13] [PASSED] destination_pitch
[19:33:13] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[19:33:13] ================= drm_test_fb_clip_offset  =================
[19:33:13] [PASSED] pass through
[19:33:13] [PASSED] horizontal offset
[19:33:13] [PASSED] vertical offset
[19:33:13] [PASSED] horizontal and vertical offset
[19:33:13] [PASSED] horizontal offset (custom pitch)
[19:33:13] [PASSED] vertical offset (custom pitch)
[19:33:13] [PASSED] horizontal and vertical offset (custom pitch)
[19:33:13] ============= [PASSED] drm_test_fb_clip_offset =============
[19:33:13] =================== drm_test_fb_memcpy  ====================
[19:33:13] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:33:13] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:33:13] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:33:13] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:33:13] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:33:13] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:33:13] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:33:13] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:33:13] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:33:13] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:33:13] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:33:13] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:33:13] =============== [PASSED] drm_test_fb_memcpy ================
[19:33:13] ============= [PASSED] drm_format_helper_test ==============
[19:33:13] ================= drm_format (18 subtests) =================
[19:33:13] [PASSED] drm_test_format_block_width_invalid
[19:33:13] [PASSED] drm_test_format_block_width_one_plane
[19:33:13] [PASSED] drm_test_format_block_width_two_plane
[19:33:13] [PASSED] drm_test_format_block_width_three_plane
[19:33:13] [PASSED] drm_test_format_block_width_tiled
[19:33:13] [PASSED] drm_test_format_block_height_invalid
[19:33:13] [PASSED] drm_test_format_block_height_one_plane
[19:33:13] [PASSED] drm_test_format_block_height_two_plane
[19:33:13] [PASSED] drm_test_format_block_height_three_plane
[19:33:13] [PASSED] drm_test_format_block_height_tiled
[19:33:13] [PASSED] drm_test_format_min_pitch_invalid
[19:33:13] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:33:13] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:33:13] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:33:13] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:33:13] [PASSED] drm_test_format_min_pitch_two_plane
[19:33:13] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:33:13] [PASSED] drm_test_format_min_pitch_tiled
[19:33:13] =================== [PASSED] drm_format ====================
[19:33:13] ============== drm_framebuffer (10 subtests) ===============
[19:33:13] ========== drm_test_framebuffer_check_src_coords  ==========
[19:33:13] [PASSED] Success: source fits into fb
[19:33:13] [PASSED] Fail: overflowing fb with x-axis coordinate
[19:33:13] [PASSED] Fail: overflowing fb with y-axis coordinate
[19:33:13] [PASSED] Fail: overflowing fb with source width
[19:33:13] [PASSED] Fail: overflowing fb with source height
[19:33:13] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[19:33:13] [PASSED] drm_test_framebuffer_cleanup
[19:33:13] =============== drm_test_framebuffer_create  ===============
[19:33:13] [PASSED] ABGR8888 normal sizes
[19:33:13] [PASSED] ABGR8888 max sizes
[19:33:13] [PASSED] ABGR8888 pitch greater than min required
[19:33:13] [PASSED] ABGR8888 pitch less than min required
[19:33:13] [PASSED] ABGR8888 Invalid width
[19:33:13] [PASSED] ABGR8888 Invalid buffer handle
[19:33:13] [PASSED] No pixel format
[19:33:13] [PASSED] ABGR8888 Width 0
[19:33:13] [PASSED] ABGR8888 Height 0
[19:33:13] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:33:13] [PASSED] ABGR8888 Large buffer offset
[19:33:13] [PASSED] ABGR8888 Buffer offset for inexistent plane
[19:33:13] [PASSED] ABGR8888 Invalid flag
[19:33:13] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:33:13] [PASSED] ABGR8888 Valid buffer modifier
[19:33:13] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:33:13] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:33:13] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:33:13] [PASSED] NV12 Normal sizes
[19:33:13] [PASSED] NV12 Max sizes
[19:33:13] [PASSED] NV12 Invalid pitch
[19:33:13] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:33:13] [PASSED] NV12 different  modifier per-plane
[19:33:13] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:33:13] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:33:13] [PASSED] NV12 Modifier for inexistent plane
[19:33:13] [PASSED] NV12 Handle for inexistent plane
[19:33:13] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:33:13] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:33:13] [PASSED] YVU420 Normal sizes
[19:33:13] [PASSED] YVU420 Max sizes
[19:33:13] [PASSED] YVU420 Invalid pitch
[19:33:13] [PASSED] YVU420 Different pitches
[19:33:13] [PASSED] YVU420 Different buffer offsets/pitches
[19:33:13] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:33:13] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:33:13] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:33:13] [PASSED] YVU420 Valid modifier
[19:33:13] [PASSED] YVU420 Different modifiers per plane
[19:33:13] [PASSED] YVU420 Modifier for inexistent plane
[19:33:13] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[19:33:13] [PASSED] X0L2 Normal sizes
[19:33:13] [PASSED] X0L2 Max sizes
[19:33:13] [PASSED] X0L2 Invalid pitch
[19:33:13] [PASSED] X0L2 Pitch greater than minimum required
[19:33:13] [PASSED] X0L2 Handle for inexistent plane
[19:33:13] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:33:13] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:33:13] [PASSED] X0L2 Valid modifier
[19:33:13] [PASSED] X0L2 Modifier for inexistent plane
[19:33:13] =========== [PASSED] drm_test_framebuffer_create ===========
[19:33:13] [PASSED] drm_test_framebuffer_free
[19:33:13] [PASSED] drm_test_framebuffer_init
[19:33:13] [PASSED] drm_test_framebuffer_init_bad_format
[19:33:13] [PASSED] drm_test_framebuffer_init_dev_mismatch
[19:33:13] [PASSED] drm_test_framebuffer_lookup
[19:33:13] [PASSED] drm_test_framebuffer_lookup_inexistent
[19:33:13] [PASSED] drm_test_framebuffer_modifiers_not_supported
[19:33:13] ================= [PASSED] drm_framebuffer =================
[19:33:13] ================ drm_gem_shmem (8 subtests) ================
[19:33:13] [PASSED] drm_gem_shmem_test_obj_create
[19:33:13] [PASSED] drm_gem_shmem_test_obj_create_private
[19:33:13] [PASSED] drm_gem_shmem_test_pin_pages
[19:33:13] [PASSED] drm_gem_shmem_test_vmap
[19:33:13] [PASSED] drm_gem_shmem_test_get_sg_table
[19:33:13] [PASSED] drm_gem_shmem_test_get_pages_sgt
[19:33:13] [PASSED] drm_gem_shmem_test_madvise
[19:33:13] [PASSED] drm_gem_shmem_test_purge
[19:33:13] ================== [PASSED] drm_gem_shmem ==================
[19:33:13] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[19:33:13] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[19:33:13] [PASSED] Automatic
[19:33:13] [PASSED] Full
[19:33:13] [PASSED] Limited 16:235
[19:33:13] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[19:33:13] [PASSED] drm_test_check_disable_connector
[19:33:13] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[19:33:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[19:33:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[19:33:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[19:33:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[19:33:13] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[19:33:13] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[19:33:13] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[19:33:13] [PASSED] drm_test_check_output_bpc_dvi
[19:33:13] [PASSED] drm_test_check_output_bpc_format_vic_1
[19:33:13] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[19:33:13] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[19:33:13] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[19:33:13] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[19:33:13] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[19:33:13] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[19:33:13] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[19:33:13] ============ drm_test_check_hdmi_color_format  =============
[19:33:13] [PASSED] AUTO -> RGB
[19:33:13] [PASSED] YCBCR422 -> YUV422
[19:33:13] [PASSED] YCBCR420 -> YUV420
[19:33:13] [PASSED] YCBCR444 -> YUV444
[19:33:13] [PASSED] RGB -> RGB
[19:33:13] ======== [PASSED] drm_test_check_hdmi_color_format =========
[19:33:13] ======== drm_test_check_hdmi_color_format_420_only  ========
[19:33:13] [PASSED] RGB should fail
[19:33:13] [PASSED] YUV444 should fail
[19:33:13] [PASSED] YUV422 should fail
[19:33:13] [PASSED] YUV420 should work
[19:33:13] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[19:33:13] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[19:33:13] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[19:33:13] [PASSED] drm_test_check_broadcast_rgb_value
[19:33:13] [PASSED] drm_test_check_bpc_8_value
[19:33:13] [PASSED] drm_test_check_bpc_10_value
[19:33:13] [PASSED] drm_test_check_bpc_12_value
[19:33:13] [PASSED] drm_test_check_format_value
[19:33:13] [PASSED] drm_test_check_tmds_char_value
[19:33:13] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[19:33:13] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[19:33:13] [PASSED] drm_test_check_mode_valid
[19:33:13] [PASSED] drm_test_check_mode_valid_reject
[19:33:13] [PASSED] drm_test_check_mode_valid_reject_rate
[19:33:13] [PASSED] drm_test_check_mode_valid_reject_max_clock
[19:33:13] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[19:33:13] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[19:33:13] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[19:33:13] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[19:33:13] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[19:33:13] [PASSED] drm_test_check_infoframes
[19:33:13] [PASSED] drm_test_check_reject_avi_infoframe
[19:33:13] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[19:33:13] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[19:33:13] [PASSED] drm_test_check_reject_audio_infoframe
[19:33:13] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[19:33:13] ================= drm_managed (2 subtests) =================
[19:33:13] [PASSED] drm_test_managed_release_action
[19:33:13] [PASSED] drm_test_managed_run_action
[19:33:13] =================== [PASSED] drm_managed ===================
[19:33:13] =================== drm_mm (6 subtests) ====================
[19:33:13] [PASSED] drm_test_mm_init
[19:33:13] [PASSED] drm_test_mm_debug
[19:33:13] [PASSED] drm_test_mm_align32
[19:33:13] [PASSED] drm_test_mm_align64
[19:33:13] [PASSED] drm_test_mm_lowest
[19:33:13] [PASSED] drm_test_mm_highest
[19:33:13] ===================== [PASSED] drm_mm ======================
[19:33:13] ============= drm_modes_analog_tv (5 subtests) =============
[19:33:13] [PASSED] drm_test_modes_analog_tv_mono_576i
[19:33:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:33:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:33:13] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:33:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:33:13] =============== [PASSED] drm_modes_analog_tv ===============
[19:33:13] ============== drm_plane_helper (2 subtests) ===============
[19:33:13] =============== drm_test_check_plane_state  ================
[19:33:13] [PASSED] clipping_simple
[19:33:13] [PASSED] clipping_rotate_reflect
[19:33:13] [PASSED] positioning_simple
[19:33:13] [PASSED] upscaling
[19:33:13] [PASSED] downscaling
[19:33:13] [PASSED] rounding1
[19:33:13] [PASSED] rounding2
[19:33:13] [PASSED] rounding3
[19:33:13] [PASSED] rounding4
[19:33:13] =========== [PASSED] drm_test_check_plane_state ============
[19:33:13] =========== drm_test_check_invalid_plane_state  ============
[19:33:13] [PASSED] positioning_invalid
[19:33:13] [PASSED] upscaling_invalid
[19:33:13] [PASSED] downscaling_invalid
[19:33:13] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:33:13] ================ [PASSED] drm_plane_helper =================
[19:33:13] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[19:33:13] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:33:13] [PASSED] None
[19:33:13] [PASSED] PAL
[19:33:13] [PASSED] NTSC
[19:33:13] [PASSED] Both, NTSC Default
[19:33:13] [PASSED] Both, PAL Default
[19:33:13] [PASSED] Both, NTSC Default, with PAL on command-line
[19:33:13] [PASSED] Both, PAL Default, with NTSC on command-line
[19:33:13] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:33:13] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:33:13] ================== drm_rect (9 subtests) ===================
[19:33:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:33:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:33:13] [PASSED] drm_test_rect_clip_scaled_clipped
[19:33:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:33:13] ================= drm_test_rect_intersect  =================
[19:33:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:33:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[19:33:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:33:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:33:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:33:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:33:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:33:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:33:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:33:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:33:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:33:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:33:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:33:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:33:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:33:13] ============= [PASSED] drm_test_rect_intersect =============
[19:33:13] ================ drm_test_rect_calc_hscale  ================
[19:33:13] [PASSED] normal use
[19:33:13] [PASSED] out of max range
[19:33:13] [PASSED] out of min range
[19:33:13] [PASSED] zero dst
[19:33:13] [PASSED] negative src
[19:33:13] [PASSED] negative dst
[19:33:13] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:33:13] ================ drm_test_rect_calc_vscale  ================
[19:33:13] [PASSED] normal use
[19:33:13] [PASSED] out of max range
[19:33:13] [PASSED] out of min range
[19:33:13] [PASSED] zero dst
[19:33:13] [PASSED] negative src
[19:33:13] [PASSED] negative dst
[19:33:13] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:33:13] ================== drm_test_rect_rotate  ===================
[19:33:13] [PASSED] reflect-x
[19:33:13] [PASSED] reflect-y
[19:33:13] [PASSED] rotate-0
[19:33:13] [PASSED] rotate-90
[19:33:13] [PASSED] rotate-180
[19:33:13] [PASSED] rotate-270
[19:33:13] ============== [PASSED] drm_test_rect_rotate ===============
[19:33:13] ================ drm_test_rect_rotate_inv  =================
[19:33:13] [PASSED] reflect-x
[19:33:13] [PASSED] reflect-y
[19:33:13] [PASSED] rotate-0
[19:33:13] [PASSED] rotate-90
[19:33:13] [PASSED] rotate-180
[19:33:13] [PASSED] rotate-270
[19:33:13] ============ [PASSED] drm_test_rect_rotate_inv =============
[19:33:13] ==================== [PASSED] drm_rect =====================
[19:33:13] ============ drm_sysfb_modeset_test (1 subtest) ============
[19:33:13] ============ drm_test_sysfb_build_fourcc_list  =============
[19:33:13] [PASSED] no native formats
[19:33:13] [PASSED] XRGB8888 as native format
[19:33:13] [PASSED] remove duplicates
[19:33:13] [PASSED] convert alpha formats
[19:33:13] [PASSED] random formats
[19:33:13] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[19:33:13] ============= [PASSED] drm_sysfb_modeset_test ==============
[19:33:13] ================== drm_fixp (2 subtests) ===================
[19:33:13] [PASSED] drm_test_int2fixp
[19:33:13] [PASSED] drm_test_sm2fixp
[19:33:13] ==================== [PASSED] drm_fixp =====================
[19:33:13] ============================================================
[19:33:13] Testing complete. Ran 639 tests: passed: 639
[19:33:13] Elapsed time: 26.192s total, 1.766s configuring, 24.210s building, 0.194s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[19:33:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:33:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:33:25] Starting KUnit Kernel (1/1)...
[19:33:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:33:25] ================= ttm_device (5 subtests) ==================
[19:33:25] [PASSED] ttm_device_init_basic
[19:33:25] [PASSED] ttm_device_init_multiple
[19:33:25] [PASSED] ttm_device_fini_basic
[19:33:25] [PASSED] ttm_device_init_no_vma_man
[19:33:25] ================== ttm_device_init_pools  ==================
[19:33:25] [PASSED] No DMA allocations, no DMA32 required
[19:33:25] [PASSED] DMA allocations, DMA32 required
[19:33:25] [PASSED] No DMA allocations, DMA32 required
[19:33:25] [PASSED] DMA allocations, no DMA32 required
[19:33:25] ============== [PASSED] ttm_device_init_pools ==============
[19:33:25] =================== [PASSED] ttm_device ====================
[19:33:25] ================== ttm_pool (8 subtests) ===================
[19:33:25] ================== ttm_pool_alloc_basic  ===================
[19:33:25] [PASSED] One page
[19:33:25] [PASSED] More than one page
[19:33:25] [PASSED] Above the allocation limit
[19:33:25] [PASSED] One page, with coherent DMA mappings enabled
[19:33:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[19:33:25] ============== [PASSED] ttm_pool_alloc_basic ===============
[19:33:25] ============== ttm_pool_alloc_basic_dma_addr  ==============
[19:33:25] [PASSED] One page
[19:33:25] [PASSED] More than one page
[19:33:25] [PASSED] Above the allocation limit
[19:33:25] [PASSED] One page, with coherent DMA mappings enabled
[19:33:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[19:33:25] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[19:33:25] [PASSED] ttm_pool_alloc_order_caching_match
[19:33:25] [PASSED] ttm_pool_alloc_caching_mismatch
[19:33:25] [PASSED] ttm_pool_alloc_order_mismatch
[19:33:25] [PASSED] ttm_pool_free_dma_alloc
[19:33:25] [PASSED] ttm_pool_free_no_dma_alloc
[19:33:25] [PASSED] ttm_pool_fini_basic
[19:33:25] ==================== [PASSED] ttm_pool =====================
[19:33:25] ================ ttm_resource (8 subtests) =================
[19:33:25] ================= ttm_resource_init_basic  =================
[19:33:25] [PASSED] Init resource in TTM_PL_SYSTEM
[19:33:25] [PASSED] Init resource in TTM_PL_VRAM
[19:33:25] [PASSED] Init resource in a private placement
[19:33:25] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[19:33:25] ============= [PASSED] ttm_resource_init_basic =============
[19:33:25] [PASSED] ttm_resource_init_pinned
[19:33:25] [PASSED] ttm_resource_fini_basic
[19:33:25] [PASSED] ttm_resource_manager_init_basic
[19:33:25] [PASSED] ttm_resource_manager_usage_basic
[19:33:25] [PASSED] ttm_resource_manager_set_used_basic
[19:33:25] [PASSED] ttm_sys_man_alloc_basic
[19:33:25] [PASSED] ttm_sys_man_free_basic
[19:33:25] ================== [PASSED] ttm_resource ===================
[19:33:25] =================== ttm_tt (15 subtests) ===================
[19:33:25] ==================== ttm_tt_init_basic  ====================
[19:33:25] [PASSED] Page-aligned size
[19:33:25] [PASSED] Extra pages requested
[19:33:25] ================ [PASSED] ttm_tt_init_basic ================
[19:33:25] [PASSED] ttm_tt_init_misaligned
[19:33:25] [PASSED] ttm_tt_fini_basic
[19:33:25] [PASSED] ttm_tt_fini_sg
[19:33:25] [PASSED] ttm_tt_fini_shmem
[19:33:25] [PASSED] ttm_tt_create_basic
[19:33:25] [PASSED] ttm_tt_create_invalid_bo_type
[19:33:25] [PASSED] ttm_tt_create_ttm_exists
[19:33:25] [PASSED] ttm_tt_create_failed
[19:33:25] [PASSED] ttm_tt_destroy_basic
[19:33:25] [PASSED] ttm_tt_populate_null_ttm
[19:33:25] [PASSED] ttm_tt_populate_populated_ttm
[19:33:25] [PASSED] ttm_tt_unpopulate_basic
[19:33:25] [PASSED] ttm_tt_unpopulate_empty_ttm
[19:33:25] [PASSED] ttm_tt_swapin_basic
[19:33:25] ===================== [PASSED] ttm_tt ======================
[19:33:25] =================== ttm_bo (14 subtests) ===================
[19:33:25] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[19:33:25] [PASSED] Cannot be interrupted and sleeps
[19:33:25] [PASSED] Cannot be interrupted, locks straight away
[19:33:25] [PASSED] Can be interrupted, sleeps
[19:33:25] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[19:33:25] [PASSED] ttm_bo_reserve_locked_no_sleep
[19:33:25] [PASSED] ttm_bo_reserve_no_wait_ticket
[19:33:25] [PASSED] ttm_bo_reserve_double_resv
[19:33:25] [PASSED] ttm_bo_reserve_interrupted
[19:33:25] [PASSED] ttm_bo_reserve_deadlock
[19:33:25] [PASSED] ttm_bo_unreserve_basic
[19:33:25] [PASSED] ttm_bo_unreserve_pinned
[19:33:25] [PASSED] ttm_bo_unreserve_bulk
[19:33:25] [PASSED] ttm_bo_fini_basic
[19:33:25] [PASSED] ttm_bo_fini_shared_resv
[19:33:25] [PASSED] ttm_bo_pin_basic
[19:33:25] [PASSED] ttm_bo_pin_unpin_resource
[19:33:25] [PASSED] ttm_bo_multiple_pin_one_unpin
[19:33:25] ===================== [PASSED] ttm_bo ======================
[19:33:25] ============== ttm_bo_validate (22 subtests) ===============
[19:33:25] ============== ttm_bo_init_reserved_sys_man  ===============
[19:33:25] [PASSED] Buffer object for userspace
[19:33:25] [PASSED] Kernel buffer object
[19:33:25] [PASSED] Shared buffer object
[19:33:25] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[19:33:25] ============== ttm_bo_init_reserved_mock_man  ==============
[19:33:25] [PASSED] Buffer object for userspace
[19:33:25] [PASSED] Kernel buffer object
[19:33:25] [PASSED] Shared buffer object
[19:33:25] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[19:33:25] [PASSED] ttm_bo_init_reserved_resv
[19:33:25] ================== ttm_bo_validate_basic  ==================
[19:33:25] [PASSED] Buffer object for userspace
[19:33:25] [PASSED] Kernel buffer object
[19:33:25] [PASSED] Shared buffer object
[19:33:25] ============== [PASSED] ttm_bo_validate_basic ==============
[19:33:25] [PASSED] ttm_bo_validate_invalid_placement
[19:33:25] ============= ttm_bo_validate_same_placement  ==============
[19:33:25] [PASSED] System manager
[19:33:25] [PASSED] VRAM manager
[19:33:25] ========= [PASSED] ttm_bo_validate_same_placement ==========
[19:33:25] [PASSED] ttm_bo_validate_failed_alloc
[19:33:25] [PASSED] ttm_bo_validate_pinned
[19:33:25] [PASSED] ttm_bo_validate_busy_placement
[19:33:25] ================ ttm_bo_validate_multihop  =================
[19:33:25] [PASSED] Buffer object for userspace
[19:33:25] [PASSED] Kernel buffer object
[19:33:25] [PASSED] Shared buffer object
[19:33:25] ============ [PASSED] ttm_bo_validate_multihop =============
[19:33:25] ========== ttm_bo_validate_no_placement_signaled  ==========
[19:33:25] [PASSED] Buffer object in system domain, no page vector
[19:33:25] [PASSED] Buffer object in system domain with an existing page vector
[19:33:25] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[19:33:25] ======== ttm_bo_validate_no_placement_not_signaled  ========
[19:33:25] [PASSED] Buffer object for userspace
[19:33:25] [PASSED] Kernel buffer object
[19:33:25] [PASSED] Shared buffer object
[19:33:25] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[19:33:25] [PASSED] ttm_bo_validate_move_fence_signaled
[19:33:25] ========= ttm_bo_validate_move_fence_not_signaled  =========
[19:33:25] [PASSED] Waits for GPU
[19:33:25] [PASSED] Tries to lock straight away
[19:33:25] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[19:33:25] [PASSED] ttm_bo_validate_swapout
[19:33:25] [PASSED] ttm_bo_validate_happy_evict
[19:33:25] [PASSED] ttm_bo_validate_all_pinned_evict
[19:33:25] [PASSED] ttm_bo_validate_allowed_only_evict
[19:33:25] [PASSED] ttm_bo_validate_deleted_evict
[19:33:25] [PASSED] ttm_bo_validate_busy_domain_evict
[19:33:25] [PASSED] ttm_bo_validate_evict_gutting
[19:33:25] [PASSED] ttm_bo_validate_recrusive_evict
[19:33:25] ================= [PASSED] ttm_bo_validate =================
[19:33:25] ============================================================
[19:33:25] Testing complete. Ran 102 tests: passed: 102
[19:33:25] Elapsed time: 11.663s total, 1.778s configuring, 9.619s building, 0.216s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


