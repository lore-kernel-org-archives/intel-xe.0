Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779F6FD5F77
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 05:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ECC10E523;
	Wed,  8 Apr 2026 05:51:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0375E10E513;
 Wed,  8 Apr 2026 05:51:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/i915/color=3A_Enable_SDR_p?=
 =?utf-8?q?lane_color_pipeline_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 05:51:35 -0000
Message-ID: <177562749599.440468.2073114639397993609@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408051514.608781-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260408051514.608781-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/color: Enable SDR plane color pipeline (rev2)
URL   : https://patchwork.freedesktop.org/series/162786/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[05:50:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:50:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:50:54] Starting KUnit Kernel (1/1)...
[05:50:54] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:50:54] ================== guc_buf (11 subtests) ===================
[05:50:54] [PASSED] test_smallest
[05:50:54] [PASSED] test_largest
[05:50:54] [PASSED] test_granular
[05:50:54] [PASSED] test_unique
[05:50:54] [PASSED] test_overlap
[05:50:54] [PASSED] test_reusable
[05:50:54] [PASSED] test_too_big
[05:50:54] [PASSED] test_flush
[05:50:54] [PASSED] test_lookup
[05:50:54] [PASSED] test_data
[05:50:54] [PASSED] test_class
[05:50:54] ===================== [PASSED] guc_buf =====================
[05:50:54] =================== guc_dbm (7 subtests) ===================
[05:50:54] [PASSED] test_empty
[05:50:54] [PASSED] test_default
[05:50:54] ======================== test_size  ========================
[05:50:54] [PASSED] 4
[05:50:54] [PASSED] 8
[05:50:54] [PASSED] 32
[05:50:54] [PASSED] 256
[05:50:54] ==================== [PASSED] test_size ====================
[05:50:54] ======================= test_reuse  ========================
[05:50:54] [PASSED] 4
[05:50:54] [PASSED] 8
[05:50:54] [PASSED] 32
[05:50:54] [PASSED] 256
[05:50:54] =================== [PASSED] test_reuse ====================
[05:50:54] =================== test_range_overlap  ====================
[05:50:54] [PASSED] 4
[05:50:54] [PASSED] 8
[05:50:54] [PASSED] 32
[05:50:54] [PASSED] 256
[05:50:54] =============== [PASSED] test_range_overlap ================
[05:50:54] =================== test_range_compact  ====================
[05:50:54] [PASSED] 4
[05:50:54] [PASSED] 8
[05:50:54] [PASSED] 32
[05:50:54] [PASSED] 256
[05:50:54] =============== [PASSED] test_range_compact ================
[05:50:54] ==================== test_range_spare  =====================
[05:50:54] [PASSED] 4
[05:50:54] [PASSED] 8
[05:50:54] [PASSED] 32
[05:50:54] [PASSED] 256
[05:50:54] ================ [PASSED] test_range_spare =================
[05:50:54] ===================== [PASSED] guc_dbm =====================
[05:50:54] =================== guc_idm (6 subtests) ===================
[05:50:54] [PASSED] bad_init
[05:50:54] [PASSED] no_init
[05:50:54] [PASSED] init_fini
[05:50:54] [PASSED] check_used
[05:50:54] [PASSED] check_quota
[05:50:54] [PASSED] check_all
[05:50:54] ===================== [PASSED] guc_idm =====================
[05:50:54] ================== no_relay (3 subtests) ===================
[05:50:54] [PASSED] xe_drops_guc2pf_if_not_ready
[05:50:54] [PASSED] xe_drops_guc2vf_if_not_ready
[05:50:54] [PASSED] xe_rejects_send_if_not_ready
[05:50:54] ==================== [PASSED] no_relay =====================
[05:50:54] ================== pf_relay (14 subtests) ==================
[05:50:54] [PASSED] pf_rejects_guc2pf_too_short
[05:50:54] [PASSED] pf_rejects_guc2pf_too_long
[05:50:54] [PASSED] pf_rejects_guc2pf_no_payload
[05:50:54] [PASSED] pf_fails_no_payload
[05:50:54] [PASSED] pf_fails_bad_origin
[05:50:54] [PASSED] pf_fails_bad_type
[05:50:54] [PASSED] pf_txn_reports_error
[05:50:54] [PASSED] pf_txn_sends_pf2guc
[05:50:54] [PASSED] pf_sends_pf2guc
[05:50:54] [SKIPPED] pf_loopback_nop
[05:50:54] [SKIPPED] pf_loopback_echo
[05:50:54] [SKIPPED] pf_loopback_fail
[05:50:54] [SKIPPED] pf_loopback_busy
[05:50:54] [SKIPPED] pf_loopback_retry
[05:50:54] ==================== [PASSED] pf_relay =====================
[05:50:54] ================== vf_relay (3 subtests) ===================
[05:50:54] [PASSED] vf_rejects_guc2vf_too_short
[05:50:54] [PASSED] vf_rejects_guc2vf_too_long
[05:50:54] [PASSED] vf_rejects_guc2vf_no_payload
[05:50:54] ==================== [PASSED] vf_relay =====================
[05:50:54] ================ pf_gt_config (9 subtests) =================
[05:50:54] [PASSED] fair_contexts_1vf
[05:50:54] [PASSED] fair_doorbells_1vf
[05:50:54] [PASSED] fair_ggtt_1vf
[05:50:54] ====================== fair_vram_1vf  ======================
[05:50:54] [PASSED] 3.50 GiB
[05:50:54] [PASSED] 11.5 GiB
[05:50:54] [PASSED] 15.5 GiB
[05:50:54] [PASSED] 31.5 GiB
[05:50:54] [PASSED] 63.5 GiB
[05:50:54] [PASSED] 1.91 GiB
[05:50:54] ================== [PASSED] fair_vram_1vf ==================
[05:50:54] ================ fair_vram_1vf_admin_only  =================
[05:50:54] [PASSED] 3.50 GiB
[05:50:54] [PASSED] 11.5 GiB
[05:50:54] [PASSED] 15.5 GiB
[05:50:54] [PASSED] 31.5 GiB
[05:50:54] [PASSED] 63.5 GiB
[05:50:54] [PASSED] 1.91 GiB
[05:50:54] ============ [PASSED] fair_vram_1vf_admin_only =============
[05:50:54] ====================== fair_contexts  ======================
[05:50:54] [PASSED] 1 VF
[05:50:54] [PASSED] 2 VFs
[05:50:54] [PASSED] 3 VFs
[05:50:54] [PASSED] 4 VFs
[05:50:54] [PASSED] 5 VFs
[05:50:54] [PASSED] 6 VFs
[05:50:54] [PASSED] 7 VFs
[05:50:54] [PASSED] 8 VFs
[05:50:54] [PASSED] 9 VFs
[05:50:54] [PASSED] 10 VFs
[05:50:54] [PASSED] 11 VFs
[05:50:54] [PASSED] 12 VFs
[05:50:54] [PASSED] 13 VFs
[05:50:54] [PASSED] 14 VFs
[05:50:54] [PASSED] 15 VFs
[05:50:54] [PASSED] 16 VFs
[05:50:54] [PASSED] 17 VFs
[05:50:54] [PASSED] 18 VFs
[05:50:54] [PASSED] 19 VFs
[05:50:54] [PASSED] 20 VFs
[05:50:54] [PASSED] 21 VFs
[05:50:54] [PASSED] 22 VFs
[05:50:54] [PASSED] 23 VFs
[05:50:54] [PASSED] 24 VFs
[05:50:54] [PASSED] 25 VFs
[05:50:54] [PASSED] 26 VFs
[05:50:54] [PASSED] 27 VFs
[05:50:54] [PASSED] 28 VFs
[05:50:54] [PASSED] 29 VFs
[05:50:54] [PASSED] 30 VFs
[05:50:54] [PASSED] 31 VFs
[05:50:54] [PASSED] 32 VFs
[05:50:54] [PASSED] 33 VFs
[05:50:54] [PASSED] 34 VFs
[05:50:54] [PASSED] 35 VFs
[05:50:54] [PASSED] 36 VFs
[05:50:54] [PASSED] 37 VFs
[05:50:54] [PASSED] 38 VFs
[05:50:54] [PASSED] 39 VFs
[05:50:54] [PASSED] 40 VFs
[05:50:54] [PASSED] 41 VFs
[05:50:54] [PASSED] 42 VFs
[05:50:54] [PASSED] 43 VFs
[05:50:54] [PASSED] 44 VFs
[05:50:54] [PASSED] 45 VFs
[05:50:54] [PASSED] 46 VFs
[05:50:54] [PASSED] 47 VFs
[05:50:54] [PASSED] 48 VFs
[05:50:54] [PASSED] 49 VFs
[05:50:54] [PASSED] 50 VFs
[05:50:54] [PASSED] 51 VFs
[05:50:54] [PASSED] 52 VFs
[05:50:54] [PASSED] 53 VFs
[05:50:54] [PASSED] 54 VFs
[05:50:54] [PASSED] 55 VFs
[05:50:54] [PASSED] 56 VFs
[05:50:54] [PASSED] 57 VFs
[05:50:54] [PASSED] 58 VFs
[05:50:54] [PASSED] 59 VFs
[05:50:54] [PASSED] 60 VFs
[05:50:54] [PASSED] 61 VFs
[05:50:54] [PASSED] 62 VFs
[05:50:54] [PASSED] 63 VFs
[05:50:54] ================== [PASSED] fair_contexts ==================
[05:50:54] ===================== fair_doorbells  ======================
[05:50:54] [PASSED] 1 VF
[05:50:54] [PASSED] 2 VFs
[05:50:54] [PASSED] 3 VFs
[05:50:54] [PASSED] 4 VFs
[05:50:54] [PASSED] 5 VFs
[05:50:54] [PASSED] 6 VFs
[05:50:54] [PASSED] 7 VFs
[05:50:54] [PASSED] 8 VFs
[05:50:54] [PASSED] 9 VFs
[05:50:54] [PASSED] 10 VFs
[05:50:54] [PASSED] 11 VFs
[05:50:54] [PASSED] 12 VFs
[05:50:54] [PASSED] 13 VFs
[05:50:54] [PASSED] 14 VFs
[05:50:54] [PASSED] 15 VFs
[05:50:54] [PASSED] 16 VFs
[05:50:54] [PASSED] 17 VFs
[05:50:54] [PASSED] 18 VFs
[05:50:54] [PASSED] 19 VFs
[05:50:54] [PASSED] 20 VFs
[05:50:54] [PASSED] 21 VFs
[05:50:54] [PASSED] 22 VFs
[05:50:54] [PASSED] 23 VFs
[05:50:54] [PASSED] 24 VFs
[05:50:54] [PASSED] 25 VFs
[05:50:54] [PASSED] 26 VFs
[05:50:54] [PASSED] 27 VFs
[05:50:54] [PASSED] 28 VFs
[05:50:54] [PASSED] 29 VFs
[05:50:54] [PASSED] 30 VFs
[05:50:54] [PASSED] 31 VFs
[05:50:54] [PASSED] 32 VFs
[05:50:54] [PASSED] 33 VFs
[05:50:54] [PASSED] 34 VFs
[05:50:54] [PASSED] 35 VFs
[05:50:54] [PASSED] 36 VFs
[05:50:54] [PASSED] 37 VFs
[05:50:54] [PASSED] 38 VFs
[05:50:54] [PASSED] 39 VFs
[05:50:54] [PASSED] 40 VFs
[05:50:54] [PASSED] 41 VFs
[05:50:54] [PASSED] 42 VFs
[05:50:54] [PASSED] 43 VFs
[05:50:54] [PASSED] 44 VFs
[05:50:54] [PASSED] 45 VFs
[05:50:54] [PASSED] 46 VFs
[05:50:54] [PASSED] 47 VFs
[05:50:54] [PASSED] 48 VFs
[05:50:54] [PASSED] 49 VFs
[05:50:54] [PASSED] 50 VFs
[05:50:54] [PASSED] 51 VFs
[05:50:54] [PASSED] 52 VFs
[05:50:54] [PASSED] 53 VFs
[05:50:54] [PASSED] 54 VFs
[05:50:54] [PASSED] 55 VFs
[05:50:54] [PASSED] 56 VFs
[05:50:54] [PASSED] 57 VFs
[05:50:54] [PASSED] 58 VFs
[05:50:54] [PASSED] 59 VFs
[05:50:54] [PASSED] 60 VFs
[05:50:54] [PASSED] 61 VFs
[05:50:54] [PASSED] 62 VFs
[05:50:54] [PASSED] 63 VFs
[05:50:54] ================= [PASSED] fair_doorbells ==================
[05:50:54] ======================== fair_ggtt  ========================
[05:50:54] [PASSED] 1 VF
[05:50:54] [PASSED] 2 VFs
[05:50:54] [PASSED] 3 VFs
[05:50:54] [PASSED] 4 VFs
[05:50:54] [PASSED] 5 VFs
[05:50:54] [PASSED] 6 VFs
[05:50:54] [PASSED] 7 VFs
[05:50:54] [PASSED] 8 VFs
[05:50:54] [PASSED] 9 VFs
[05:50:54] [PASSED] 10 VFs
[05:50:54] [PASSED] 11 VFs
[05:50:54] [PASSED] 12 VFs
[05:50:54] [PASSED] 13 VFs
[05:50:54] [PASSED] 14 VFs
[05:50:54] [PASSED] 15 VFs
[05:50:54] [PASSED] 16 VFs
[05:50:54] [PASSED] 17 VFs
[05:50:54] [PASSED] 18 VFs
[05:50:54] [PASSED] 19 VFs
[05:50:54] [PASSED] 20 VFs
[05:50:54] [PASSED] 21 VFs
[05:50:54] [PASSED] 22 VFs
[05:50:54] [PASSED] 23 VFs
[05:50:54] [PASSED] 24 VFs
[05:50:54] [PASSED] 25 VFs
[05:50:54] [PASSED] 26 VFs
[05:50:54] [PASSED] 27 VFs
[05:50:54] [PASSED] 28 VFs
[05:50:54] [PASSED] 29 VFs
[05:50:54] [PASSED] 30 VFs
[05:50:54] [PASSED] 31 VFs
[05:50:54] [PASSED] 32 VFs
[05:50:54] [PASSED] 33 VFs
[05:50:54] [PASSED] 34 VFs
[05:50:54] [PASSED] 35 VFs
[05:50:54] [PASSED] 36 VFs
[05:50:54] [PASSED] 37 VFs
[05:50:54] [PASSED] 38 VFs
[05:50:54] [PASSED] 39 VFs
[05:50:54] [PASSED] 40 VFs
[05:50:54] [PASSED] 41 VFs
[05:50:54] [PASSED] 42 VFs
[05:50:54] [PASSED] 43 VFs
[05:50:54] [PASSED] 44 VFs
[05:50:54] [PASSED] 45 VFs
[05:50:54] [PASSED] 46 VFs
[05:50:54] [PASSED] 47 VFs
[05:50:54] [PASSED] 48 VFs
[05:50:54] [PASSED] 49 VFs
[05:50:54] [PASSED] 50 VFs
[05:50:54] [PASSED] 51 VFs
[05:50:54] [PASSED] 52 VFs
[05:50:54] [PASSED] 53 VFs
[05:50:54] [PASSED] 54 VFs
[05:50:54] [PASSED] 55 VFs
[05:50:54] [PASSED] 56 VFs
[05:50:54] [PASSED] 57 VFs
[05:50:54] [PASSED] 58 VFs
[05:50:54] [PASSED] 59 VFs
[05:50:54] [PASSED] 60 VFs
[05:50:54] [PASSED] 61 VFs
[05:50:54] [PASSED] 62 VFs
[05:50:54] [PASSED] 63 VFs
[05:50:54] ==================== [PASSED] fair_ggtt ====================
[05:50:54] ======================== fair_vram  ========================
[05:50:54] [PASSED] 1 VF
[05:50:54] [PASSED] 2 VFs
[05:50:54] [PASSED] 3 VFs
[05:50:54] [PASSED] 4 VFs
[05:50:54] [PASSED] 5 VFs
[05:50:54] [PASSED] 6 VFs
[05:50:54] [PASSED] 7 VFs
[05:50:54] [PASSED] 8 VFs
[05:50:54] [PASSED] 9 VFs
[05:50:54] [PASSED] 10 VFs
[05:50:54] [PASSED] 11 VFs
[05:50:54] [PASSED] 12 VFs
[05:50:54] [PASSED] 13 VFs
[05:50:54] [PASSED] 14 VFs
[05:50:54] [PASSED] 15 VFs
[05:50:54] [PASSED] 16 VFs
[05:50:54] [PASSED] 17 VFs
[05:50:54] [PASSED] 18 VFs
[05:50:54] [PASSED] 19 VFs
[05:50:54] [PASSED] 20 VFs
[05:50:54] [PASSED] 21 VFs
[05:50:54] [PASSED] 22 VFs
[05:50:54] [PASSED] 23 VFs
[05:50:54] [PASSED] 24 VFs
[05:50:54] [PASSED] 25 VFs
[05:50:54] [PASSED] 26 VFs
[05:50:54] [PASSED] 27 VFs
[05:50:54] [PASSED] 28 VFs
[05:50:54] [PASSED] 29 VFs
[05:50:54] [PASSED] 30 VFs
[05:50:54] [PASSED] 31 VFs
[05:50:54] [PASSED] 32 VFs
[05:50:54] [PASSED] 33 VFs
[05:50:54] [PASSED] 34 VFs
[05:50:54] [PASSED] 35 VFs
[05:50:54] [PASSED] 36 VFs
[05:50:54] [PASSED] 37 VFs
[05:50:54] [PASSED] 38 VFs
[05:50:54] [PASSED] 39 VFs
[05:50:54] [PASSED] 40 VFs
[05:50:54] [PASSED] 41 VFs
[05:50:54] [PASSED] 42 VFs
[05:50:54] [PASSED] 43 VFs
[05:50:54] [PASSED] 44 VFs
[05:50:54] [PASSED] 45 VFs
[05:50:54] [PASSED] 46 VFs
[05:50:54] [PASSED] 47 VFs
[05:50:54] [PASSED] 48 VFs
[05:50:54] [PASSED] 49 VFs
[05:50:54] [PASSED] 50 VFs
[05:50:54] [PASSED] 51 VFs
[05:50:54] [PASSED] 52 VFs
[05:50:54] [PASSED] 53 VFs
[05:50:54] [PASSED] 54 VFs
[05:50:54] [PASSED] 55 VFs
[05:50:54] [PASSED] 56 VFs
[05:50:54] [PASSED] 57 VFs
[05:50:54] [PASSED] 58 VFs
[05:50:54] [PASSED] 59 VFs
[05:50:54] [PASSED] 60 VFs
[05:50:54] [PASSED] 61 VFs
[05:50:54] [PASSED] 62 VFs
[05:50:54] [PASSED] 63 VFs
[05:50:54] ==================== [PASSED] fair_vram ====================
[05:50:54] ================== [PASSED] pf_gt_config ===================
[05:50:54] ===================== lmtt (1 subtest) =====================
[05:50:54] ======================== test_ops  =========================
[05:50:54] [PASSED] 2-level
[05:50:54] [PASSED] multi-level
[05:50:54] ==================== [PASSED] test_ops =====================
[05:50:54] ====================== [PASSED] lmtt =======================
[05:50:54] ================= pf_service (11 subtests) =================
[05:50:54] [PASSED] pf_negotiate_any
[05:50:54] [PASSED] pf_negotiate_base_match
[05:50:54] [PASSED] pf_negotiate_base_newer
[05:50:54] [PASSED] pf_negotiate_base_next
[05:50:54] [SKIPPED] pf_negotiate_base_older
[05:50:54] [PASSED] pf_negotiate_base_prev
[05:50:54] [PASSED] pf_negotiate_latest_match
[05:50:54] [PASSED] pf_negotiate_latest_newer
[05:50:54] [PASSED] pf_negotiate_latest_next
[05:50:54] [SKIPPED] pf_negotiate_latest_older
[05:50:54] [SKIPPED] pf_negotiate_latest_prev
[05:50:54] =================== [PASSED] pf_service ====================
[05:50:54] ================= xe_guc_g2g (2 subtests) ==================
[05:50:54] ============== xe_live_guc_g2g_kunit_default  ==============
[05:50:54] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[05:50:54] ============== xe_live_guc_g2g_kunit_allmem  ===============
[05:50:54] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[05:50:54] =================== [SKIPPED] xe_guc_g2g ===================
[05:50:54] =================== xe_mocs (2 subtests) ===================
[05:50:54] ================ xe_live_mocs_kernel_kunit  ================
[05:50:54] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[05:50:54] ================ xe_live_mocs_reset_kunit  =================
[05:50:54] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[05:50:54] ==================== [SKIPPED] xe_mocs =====================
[05:50:54] ================= xe_migrate (2 subtests) ==================
[05:50:54] ================= xe_migrate_sanity_kunit  =================
[05:50:54] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[05:50:54] ================== xe_validate_ccs_kunit  ==================
[05:50:54] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[05:50:54] =================== [SKIPPED] xe_migrate ===================
[05:50:54] ================== xe_dma_buf (1 subtest) ==================
[05:50:54] ==================== xe_dma_buf_kunit  =====================
[05:50:54] ================ [SKIPPED] xe_dma_buf_kunit ================
[05:50:54] =================== [SKIPPED] xe_dma_buf ===================
[05:50:54] ================= xe_bo_shrink (1 subtest) =================
[05:50:54] =================== xe_bo_shrink_kunit  ====================
[05:50:54] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[05:50:54] ================== [SKIPPED] xe_bo_shrink ==================
[05:50:54] ==================== xe_bo (2 subtests) ====================
[05:50:54] ================== xe_ccs_migrate_kunit  ===================
[05:50:54] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[05:50:54] ==================== xe_bo_evict_kunit  ====================
[05:50:54] =============== [SKIPPED] xe_bo_evict_kunit ================
[05:50:54] ===================== [SKIPPED] xe_bo ======================
[05:50:54] ==================== args (13 subtests) ====================
[05:50:54] [PASSED] count_args_test
[05:50:54] [PASSED] call_args_example
[05:50:54] [PASSED] call_args_test
[05:50:54] [PASSED] drop_first_arg_example
[05:50:54] [PASSED] drop_first_arg_test
[05:50:54] [PASSED] first_arg_example
[05:50:54] [PASSED] first_arg_test
[05:50:54] [PASSED] last_arg_example
[05:50:54] [PASSED] last_arg_test
[05:50:54] [PASSED] pick_arg_example
[05:50:54] [PASSED] if_args_example
[05:50:54] [PASSED] if_args_test
[05:50:54] [PASSED] sep_comma_example
[05:50:54] ====================== [PASSED] args =======================
[05:50:54] =================== xe_pci (3 subtests) ====================
[05:50:54] ==================== check_graphics_ip  ====================
[05:50:54] [PASSED] 12.00 Xe_LP
[05:50:54] [PASSED] 12.10 Xe_LP+
[05:50:54] [PASSED] 12.55 Xe_HPG
[05:50:54] [PASSED] 12.60 Xe_HPC
[05:50:54] [PASSED] 12.70 Xe_LPG
[05:50:54] [PASSED] 12.71 Xe_LPG
[05:50:54] [PASSED] 12.74 Xe_LPG+
[05:50:54] [PASSED] 20.01 Xe2_HPG
[05:50:54] [PASSED] 20.02 Xe2_HPG
[05:50:54] [PASSED] 20.04 Xe2_LPG
[05:50:54] [PASSED] 30.00 Xe3_LPG
[05:50:54] [PASSED] 30.01 Xe3_LPG
[05:50:54] [PASSED] 30.03 Xe3_LPG
[05:50:54] [PASSED] 30.04 Xe3_LPG
[05:50:54] [PASSED] 30.05 Xe3_LPG
[05:50:54] [PASSED] 35.10 Xe3p_LPG
[05:50:54] [PASSED] 35.11 Xe3p_XPC
[05:50:54] ================ [PASSED] check_graphics_ip ================
[05:50:54] ===================== check_media_ip  ======================
[05:50:54] [PASSED] 12.00 Xe_M
[05:50:54] [PASSED] 12.55 Xe_HPM
[05:50:54] [PASSED] 13.00 Xe_LPM+
[05:50:54] [PASSED] 13.01 Xe2_HPM
[05:50:54] [PASSED] 20.00 Xe2_LPM
[05:50:54] [PASSED] 30.00 Xe3_LPM
[05:50:54] [PASSED] 30.02 Xe3_LPM
[05:50:54] [PASSED] 35.00 Xe3p_LPM
[05:50:54] [PASSED] 35.03 Xe3p_HPM
[05:50:54] ================= [PASSED] check_media_ip ==================
[05:50:54] =================== check_platform_desc  ===================
[05:50:54] [PASSED] 0x9A60 (TIGERLAKE)
[05:50:54] [PASSED] 0x9A68 (TIGERLAKE)
[05:50:54] [PASSED] 0x9A70 (TIGERLAKE)
[05:50:54] [PASSED] 0x9A40 (TIGERLAKE)
[05:50:54] [PASSED] 0x9A49 (TIGERLAKE)
[05:50:54] [PASSED] 0x9A59 (TIGERLAKE)
[05:50:54] [PASSED] 0x9A78 (TIGERLAKE)
[05:50:54] [PASSED] 0x9AC0 (TIGERLAKE)
[05:50:54] [PASSED] 0x9AC9 (TIGERLAKE)
[05:50:54] [PASSED] 0x9AD9 (TIGERLAKE)
[05:50:54] [PASSED] 0x9AF8 (TIGERLAKE)
[05:50:54] [PASSED] 0x4C80 (ROCKETLAKE)
[05:50:54] [PASSED] 0x4C8A (ROCKETLAKE)
[05:50:54] [PASSED] 0x4C8B (ROCKETLAKE)
[05:50:54] [PASSED] 0x4C8C (ROCKETLAKE)
[05:50:54] [PASSED] 0x4C90 (ROCKETLAKE)
[05:50:54] [PASSED] 0x4C9A (ROCKETLAKE)
[05:50:54] [PASSED] 0x4680 (ALDERLAKE_S)
[05:50:54] [PASSED] 0x4682 (ALDERLAKE_S)
[05:50:54] [PASSED] 0x4688 (ALDERLAKE_S)
[05:50:54] [PASSED] 0x468A (ALDERLAKE_S)
[05:50:54] [PASSED] 0x468B (ALDERLAKE_S)
[05:50:54] [PASSED] 0x4690 (ALDERLAKE_S)
[05:50:54] [PASSED] 0x4692 (ALDERLAKE_S)
[05:50:54] [PASSED] 0x4693 (ALDERLAKE_S)
[05:50:54] [PASSED] 0x46A0 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46A1 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46A2 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46A3 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46A6 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46A8 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46AA (ALDERLAKE_P)
[05:50:54] [PASSED] 0x462A (ALDERLAKE_P)
[05:50:54] [PASSED] 0x4626 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x4628 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46B0 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46B1 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46B2 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46B3 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46C0 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46C1 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46C2 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46C3 (ALDERLAKE_P)
[05:50:54] [PASSED] 0x46D0 (ALDERLAKE_N)
[05:50:54] [PASSED] 0x46D1 (ALDERLAKE_N)
[05:50:54] [PASSED] 0x46D2 (ALDERLAKE_N)
[05:50:54] [PASSED] 0x46D3 (ALDERLAKE_N)
[05:50:54] [PASSED] 0x46D4 (ALDERLAKE_N)
[05:50:54] [PASSED] 0xA721 (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7A1 (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7A9 (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7AC (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7AD (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA720 (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7A0 (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7A8 (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7AA (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA7AB (ALDERLAKE_P)
[05:50:54] [PASSED] 0xA780 (ALDERLAKE_S)
[05:50:54] [PASSED] 0xA781 (ALDERLAKE_S)
[05:50:54] [PASSED] 0xA782 (ALDERLAKE_S)
[05:50:54] [PASSED] 0xA783 (ALDERLAKE_S)
[05:50:54] [PASSED] 0xA788 (ALDERLAKE_S)
[05:50:54] [PASSED] 0xA789 (ALDERLAKE_S)
[05:50:54] [PASSED] 0xA78A (ALDERLAKE_S)
[05:50:54] [PASSED] 0xA78B (ALDERLAKE_S)
[05:50:54] [PASSED] 0x4905 (DG1)
[05:50:54] [PASSED] 0x4906 (DG1)
[05:50:54] [PASSED] 0x4907 (DG1)
[05:50:54] [PASSED] 0x4908 (DG1)
[05:50:54] [PASSED] 0x4909 (DG1)
[05:50:54] [PASSED] 0x56C0 (DG2)
[05:50:54] [PASSED] 0x56C2 (DG2)
[05:50:54] [PASSED] 0x56C1 (DG2)
[05:50:54] [PASSED] 0x7D51 (METEORLAKE)
[05:50:54] [PASSED] 0x7DD1 (METEORLAKE)
[05:50:54] [PASSED] 0x7D41 (METEORLAKE)
[05:50:54] [PASSED] 0x7D67 (METEORLAKE)
[05:50:54] [PASSED] 0xB640 (METEORLAKE)
[05:50:54] [PASSED] 0x56A0 (DG2)
[05:50:54] [PASSED] 0x56A1 (DG2)
[05:50:54] [PASSED] 0x56A2 (DG2)
[05:50:54] [PASSED] 0x56BE (DG2)
[05:50:54] [PASSED] 0x56BF (DG2)
[05:50:54] [PASSED] 0x5690 (DG2)
[05:50:54] [PASSED] 0x5691 (DG2)
[05:50:54] [PASSED] 0x5692 (DG2)
[05:50:54] [PASSED] 0x56A5 (DG2)
[05:50:54] [PASSED] 0x56A6 (DG2)
[05:50:54] [PASSED] 0x56B0 (DG2)
[05:50:54] [PASSED] 0x56B1 (DG2)
[05:50:54] [PASSED] 0x56BA (DG2)
[05:50:54] [PASSED] 0x56BB (DG2)
[05:50:54] [PASSED] 0x56BC (DG2)
[05:50:54] [PASSED] 0x56BD (DG2)
[05:50:54] [PASSED] 0x5693 (DG2)
[05:50:54] [PASSED] 0x5694 (DG2)
[05:50:54] [PASSED] 0x5695 (DG2)
[05:50:54] [PASSED] 0x56A3 (DG2)
[05:50:54] [PASSED] 0x56A4 (DG2)
[05:50:54] [PASSED] 0x56B2 (DG2)
[05:50:54] [PASSED] 0x56B3 (DG2)
[05:50:54] [PASSED] 0x5696 (DG2)
[05:50:54] [PASSED] 0x5697 (DG2)
[05:50:54] [PASSED] 0xB69 (PVC)
[05:50:54] [PASSED] 0xB6E (PVC)
[05:50:54] [PASSED] 0xBD4 (PVC)
[05:50:54] [PASSED] 0xBD5 (PVC)
[05:50:54] [PASSED] 0xBD6 (PVC)
[05:50:54] [PASSED] 0xBD7 (PVC)
[05:50:54] [PASSED] 0xBD8 (PVC)
[05:50:54] [PASSED] 0xBD9 (PVC)
[05:50:54] [PASSED] 0xBDA (PVC)
[05:50:54] [PASSED] 0xBDB (PVC)
[05:50:54] [PASSED] 0xBE0 (PVC)
[05:50:54] [PASSED] 0xBE1 (PVC)
[05:50:54] [PASSED] 0xBE5 (PVC)
[05:50:54] [PASSED] 0x7D40 (METEORLAKE)
[05:50:54] [PASSED] 0x7D45 (METEORLAKE)
[05:50:54] [PASSED] 0x7D55 (METEORLAKE)
[05:50:54] [PASSED] 0x7D60 (METEORLAKE)
[05:50:54] [PASSED] 0x7DD5 (METEORLAKE)
[05:50:54] [PASSED] 0x6420 (LUNARLAKE)
[05:50:54] [PASSED] 0x64A0 (LUNARLAKE)
[05:50:54] [PASSED] 0x64B0 (LUNARLAKE)
[05:50:54] [PASSED] 0xE202 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE209 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE20B (BATTLEMAGE)
[05:50:54] [PASSED] 0xE20C (BATTLEMAGE)
[05:50:54] [PASSED] 0xE20D (BATTLEMAGE)
[05:50:54] [PASSED] 0xE210 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE211 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE212 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE216 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE220 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE221 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE222 (BATTLEMAGE)
[05:50:54] [PASSED] 0xE223 (BATTLEMAGE)
[05:50:54] [PASSED] 0xB080 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB081 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB082 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB083 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB084 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB085 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB086 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB087 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB08F (PANTHERLAKE)
[05:50:54] [PASSED] 0xB090 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB0A0 (PANTHERLAKE)
[05:50:54] [PASSED] 0xB0B0 (PANTHERLAKE)
[05:50:54] [PASSED] 0xFD80 (PANTHERLAKE)
[05:50:54] [PASSED] 0xFD81 (PANTHERLAKE)
[05:50:54] [PASSED] 0xD740 (NOVALAKE_S)
[05:50:54] [PASSED] 0xD741 (NOVALAKE_S)
[05:50:54] [PASSED] 0xD742 (NOVALAKE_S)
[05:50:54] [PASSED] 0xD743 (NOVALAKE_S)
[05:50:54] [PASSED] 0xD744 (NOVALAKE_S)
[05:50:54] [PASSED] 0xD745 (NOVALAKE_S)
[05:50:54] [PASSED] 0x674C (CRESCENTISLAND)
[05:50:54] [PASSED] 0xD750 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD751 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD752 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD753 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD754 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD755 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD756 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD757 (NOVALAKE_P)
[05:50:54] [PASSED] 0xD75F (NOVALAKE_P)
[05:50:54] =============== [PASSED] check_platform_desc ===============
[05:50:54] ===================== [PASSED] xe_pci ======================
[05:50:54] =================== xe_rtp (2 subtests) ====================
[05:50:54] =============== xe_rtp_process_to_sr_tests  ================
[05:50:54] [PASSED] coalesce-same-reg
[05:50:54] [PASSED] no-match-no-add
[05:50:54] [PASSED] match-or
[05:50:54] [PASSED] match-or-xfail
[05:50:54] [PASSED] no-match-no-add-multiple-rules
[05:50:54] [PASSED] two-regs-two-entries
[05:50:54] [PASSED] clr-one-set-other
[05:50:54] [PASSED] set-field
[05:50:54] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[05:50:54] [PASSED] conflict-not-disjoint
[05:50:54] [PASSED] conflict-reg-type
[05:50:54] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[05:50:54] ================== xe_rtp_process_tests  ===================
[05:50:54] [PASSED] active1
[05:50:54] [PASSED] active2
[05:50:54] [PASSED] active-inactive
[05:50:54] [PASSED] inactive-active
[05:50:54] [PASSED] inactive-1st_or_active-inactive
[05:50:54] [PASSED] inactive-2nd_or_active-inactive
[05:50:54] [PASSED] inactive-last_or_active-inactive
[05:50:54] [PASSED] inactive-no_or_active-inactive
[05:50:54] ============== [PASSED] xe_rtp_process_tests ===============
[05:50:54] ===================== [PASSED] xe_rtp ======================
[05:50:54] ==================== xe_wa (1 subtest) =====================
[05:50:54] ======================== xe_wa_gt  =========================
[05:50:54] [PASSED] TIGERLAKE B0
[05:50:54] [PASSED] DG1 A0
[05:50:54] [PASSED] DG1 B0
[05:50:54] [PASSED] ALDERLAKE_S A0
[05:50:54] [PASSED] ALDERLAKE_S B0
[05:50:54] [PASSED] ALDERLAKE_S C0
[05:50:54] [PASSED] ALDERLAKE_S D0
[05:50:54] [PASSED] ALDERLAKE_P A0
[05:50:54] [PASSED] ALDERLAKE_P B0
[05:50:54] [PASSED] ALDERLAKE_P C0
[05:50:54] [PASSED] ALDERLAKE_S RPLS D0
[05:50:54] [PASSED] ALDERLAKE_P RPLU E0
[05:50:54] [PASSED] DG2 G10 C0
[05:50:54] [PASSED] DG2 G11 B1
[05:50:54] [PASSED] DG2 G12 A1
[05:50:54] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:50:54] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:50:54] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[05:50:54] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[05:50:54] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[05:50:54] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[05:50:54] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[05:50:54] ==================== [PASSED] xe_wa_gt =====================
[05:50:54] ====================== [PASSED] xe_wa ======================
[05:50:54] ============================================================
[05:50:54] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[05:50:54] Elapsed time: 36.239s total, 4.228s configuring, 31.393s building, 0.603s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:50:54] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:50:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:51:21] Starting KUnit Kernel (1/1)...
[05:51:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:51:21] ============ drm_test_pick_cmdline (2 subtests) ============
[05:51:21] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:51:21] =============== drm_test_pick_cmdline_named  ===============
[05:51:21] [PASSED] NTSC
[05:51:21] [PASSED] NTSC-J
[05:51:21] [PASSED] PAL
[05:51:21] [PASSED] PAL-M
[05:51:21] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:51:21] ============== [PASSED] drm_test_pick_cmdline ==============
[05:51:21] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[05:51:21] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[05:51:21] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[05:51:21] =========== drm_validate_clone_mode (2 subtests) ===========
[05:51:21] ============== drm_test_check_in_clone_mode  ===============
[05:51:21] [PASSED] in_clone_mode
[05:51:21] [PASSED] not_in_clone_mode
[05:51:21] ========== [PASSED] drm_test_check_in_clone_mode ===========
[05:51:21] =============== drm_test_check_valid_clones  ===============
[05:51:21] [PASSED] not_in_clone_mode
[05:51:21] [PASSED] valid_clone
[05:51:21] [PASSED] invalid_clone
[05:51:21] =========== [PASSED] drm_test_check_valid_clones ===========
[05:51:21] ============= [PASSED] drm_validate_clone_mode =============
[05:51:21] ============= drm_validate_modeset (1 subtest) =============
[05:51:21] [PASSED] drm_test_check_connector_changed_modeset
[05:51:21] ============== [PASSED] drm_validate_modeset ===============
[05:51:21] ====== drm_test_bridge_get_current_state (2 subtests) ======
[05:51:21] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[05:51:21] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[05:51:21] ======== [PASSED] drm_test_bridge_get_current_state ========
[05:51:21] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[05:51:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[05:51:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[05:51:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[05:51:21] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[05:51:21] ============== drm_bridge_alloc (2 subtests) ===============
[05:51:21] [PASSED] drm_test_drm_bridge_alloc_basic
[05:51:21] [PASSED] drm_test_drm_bridge_alloc_get_put
[05:51:21] ================ [PASSED] drm_bridge_alloc =================
[05:51:21] ============= drm_cmdline_parser (40 subtests) =============
[05:51:21] [PASSED] drm_test_cmdline_force_d_only
[05:51:21] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:51:21] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:51:21] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:51:21] [PASSED] drm_test_cmdline_force_e_only
[05:51:21] [PASSED] drm_test_cmdline_res
[05:51:21] [PASSED] drm_test_cmdline_res_vesa
[05:51:21] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:51:21] [PASSED] drm_test_cmdline_res_rblank
[05:51:21] [PASSED] drm_test_cmdline_res_bpp
[05:51:21] [PASSED] drm_test_cmdline_res_refresh
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:51:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:51:21] [PASSED] drm_test_cmdline_res_margins_force_on
[05:51:21] [PASSED] drm_test_cmdline_res_vesa_margins
[05:51:21] [PASSED] drm_test_cmdline_name
[05:51:21] [PASSED] drm_test_cmdline_name_bpp
[05:51:21] [PASSED] drm_test_cmdline_name_option
[05:51:21] [PASSED] drm_test_cmdline_name_bpp_option
[05:51:21] [PASSED] drm_test_cmdline_rotate_0
[05:51:21] [PASSED] drm_test_cmdline_rotate_90
[05:51:21] [PASSED] drm_test_cmdline_rotate_180
[05:51:21] [PASSED] drm_test_cmdline_rotate_270
[05:51:21] [PASSED] drm_test_cmdline_hmirror
[05:51:21] [PASSED] drm_test_cmdline_vmirror
[05:51:21] [PASSED] drm_test_cmdline_margin_options
[05:51:21] [PASSED] drm_test_cmdline_multiple_options
[05:51:21] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:51:21] [PASSED] drm_test_cmdline_extra_and_option
[05:51:21] [PASSED] drm_test_cmdline_freestanding_options
[05:51:21] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:51:21] [PASSED] drm_test_cmdline_panel_orientation
[05:51:21] ================ drm_test_cmdline_invalid  =================
[05:51:21] [PASSED] margin_only
[05:51:21] [PASSED] interlace_only
[05:51:21] [PASSED] res_missing_x
[05:51:21] [PASSED] res_missing_y
[05:51:21] [PASSED] res_bad_y
[05:51:21] [PASSED] res_missing_y_bpp
[05:51:21] [PASSED] res_bad_bpp
[05:51:21] [PASSED] res_bad_refresh
[05:51:21] [PASSED] res_bpp_refresh_force_on_off
[05:51:21] [PASSED] res_invalid_mode
[05:51:21] [PASSED] res_bpp_wrong_place_mode
[05:51:21] [PASSED] name_bpp_refresh
[05:51:21] [PASSED] name_refresh
[05:51:21] [PASSED] name_refresh_wrong_mode
[05:51:21] [PASSED] name_refresh_invalid_mode
[05:51:21] [PASSED] rotate_multiple
[05:51:21] [PASSED] rotate_invalid_val
[05:51:21] [PASSED] rotate_truncated
[05:51:21] [PASSED] invalid_option
[05:51:21] [PASSED] invalid_tv_option
[05:51:21] [PASSED] truncated_tv_option
[05:51:21] ============ [PASSED] drm_test_cmdline_invalid =============
[05:51:21] =============== drm_test_cmdline_tv_options  ===============
[05:51:21] [PASSED] NTSC
[05:51:21] [PASSED] NTSC_443
[05:51:21] [PASSED] NTSC_J
[05:51:21] [PASSED] PAL
[05:51:21] [PASSED] PAL_M
[05:51:21] [PASSED] PAL_N
[05:51:21] [PASSED] SECAM
[05:51:21] [PASSED] MONO_525
[05:51:21] [PASSED] MONO_625
[05:51:21] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:51:21] =============== [PASSED] drm_cmdline_parser ================
[05:51:21] ========== drmm_connector_hdmi_init (20 subtests) ==========
[05:51:21] [PASSED] drm_test_connector_hdmi_init_valid
[05:51:21] [PASSED] drm_test_connector_hdmi_init_bpc_8
[05:51:21] [PASSED] drm_test_connector_hdmi_init_bpc_10
[05:51:21] [PASSED] drm_test_connector_hdmi_init_bpc_12
[05:51:21] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[05:51:21] [PASSED] drm_test_connector_hdmi_init_bpc_null
[05:51:21] [PASSED] drm_test_connector_hdmi_init_formats_empty
[05:51:21] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[05:51:21] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[05:51:21] [PASSED] supported_formats=0x9 yuv420_allowed=1
[05:51:21] [PASSED] supported_formats=0x9 yuv420_allowed=0
[05:51:21] [PASSED] supported_formats=0x5 yuv420_allowed=1
[05:51:21] [PASSED] supported_formats=0x5 yuv420_allowed=0
[05:51:21] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[05:51:21] [PASSED] drm_test_connector_hdmi_init_null_ddc
[05:51:21] [PASSED] drm_test_connector_hdmi_init_null_product
[05:51:21] [PASSED] drm_test_connector_hdmi_init_null_vendor
[05:51:21] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[05:51:21] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[05:51:21] [PASSED] drm_test_connector_hdmi_init_product_valid
[05:51:21] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[05:51:21] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[05:51:21] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[05:51:21] ========= drm_test_connector_hdmi_init_type_valid  =========
[05:51:21] [PASSED] HDMI-A
[05:51:21] [PASSED] HDMI-B
[05:51:21] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[05:51:21] ======== drm_test_connector_hdmi_init_type_invalid  ========
[05:51:21] [PASSED] Unknown
[05:51:21] [PASSED] VGA
[05:51:21] [PASSED] DVI-I
[05:51:21] [PASSED] DVI-D
[05:51:21] [PASSED] DVI-A
[05:51:21] [PASSED] Composite
[05:51:21] [PASSED] SVIDEO
[05:51:21] [PASSED] LVDS
[05:51:21] [PASSED] Component
[05:51:21] [PASSED] DIN
[05:51:21] [PASSED] DP
[05:51:21] [PASSED] TV
[05:51:21] [PASSED] eDP
[05:51:21] [PASSED] Virtual
[05:51:21] [PASSED] DSI
[05:51:21] [PASSED] DPI
[05:51:21] [PASSED] Writeback
[05:51:21] [PASSED] SPI
[05:51:21] [PASSED] USB
[05:51:21] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[05:51:21] ============ [PASSED] drmm_connector_hdmi_init =============
[05:51:21] ============= drmm_connector_init (3 subtests) =============
[05:51:21] [PASSED] drm_test_drmm_connector_init
[05:51:21] [PASSED] drm_test_drmm_connector_init_null_ddc
[05:51:21] ========= drm_test_drmm_connector_init_type_valid  =========
[05:51:21] [PASSED] Unknown
[05:51:21] [PASSED] VGA
[05:51:21] [PASSED] DVI-I
[05:51:21] [PASSED] DVI-D
[05:51:21] [PASSED] DVI-A
[05:51:21] [PASSED] Composite
[05:51:21] [PASSED] SVIDEO
[05:51:21] [PASSED] LVDS
[05:51:21] [PASSED] Component
[05:51:21] [PASSED] DIN
[05:51:21] [PASSED] DP
[05:51:21] [PASSED] HDMI-A
[05:51:21] [PASSED] HDMI-B
[05:51:21] [PASSED] TV
[05:51:21] [PASSED] eDP
[05:51:21] [PASSED] Virtual
[05:51:21] [PASSED] DSI
[05:51:21] [PASSED] DPI
[05:51:21] [PASSED] Writeback
[05:51:21] [PASSED] SPI
[05:51:21] [PASSED] USB
[05:51:21] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[05:51:21] =============== [PASSED] drmm_connector_init ===============
[05:51:21] ========= drm_connector_dynamic_init (6 subtests) ==========
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_init
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_init_properties
[05:51:21] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[05:51:21] [PASSED] Unknown
[05:51:21] [PASSED] VGA
[05:51:21] [PASSED] DVI-I
[05:51:21] [PASSED] DVI-D
[05:51:21] [PASSED] DVI-A
[05:51:21] [PASSED] Composite
[05:51:21] [PASSED] SVIDEO
[05:51:21] [PASSED] LVDS
[05:51:21] [PASSED] Component
[05:51:21] [PASSED] DIN
[05:51:21] [PASSED] DP
[05:51:21] [PASSED] HDMI-A
[05:51:21] [PASSED] HDMI-B
[05:51:21] [PASSED] TV
[05:51:21] [PASSED] eDP
[05:51:21] [PASSED] Virtual
[05:51:21] [PASSED] DSI
[05:51:21] [PASSED] DPI
[05:51:21] [PASSED] Writeback
[05:51:21] [PASSED] SPI
[05:51:21] [PASSED] USB
[05:51:21] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[05:51:21] ======== drm_test_drm_connector_dynamic_init_name  =========
[05:51:21] [PASSED] Unknown
[05:51:21] [PASSED] VGA
[05:51:21] [PASSED] DVI-I
[05:51:21] [PASSED] DVI-D
[05:51:21] [PASSED] DVI-A
[05:51:21] [PASSED] Composite
[05:51:21] [PASSED] SVIDEO
[05:51:21] [PASSED] LVDS
[05:51:21] [PASSED] Component
[05:51:21] [PASSED] DIN
[05:51:21] [PASSED] DP
[05:51:21] [PASSED] HDMI-A
[05:51:21] [PASSED] HDMI-B
[05:51:21] [PASSED] TV
[05:51:21] [PASSED] eDP
[05:51:21] [PASSED] Virtual
[05:51:21] [PASSED] DSI
[05:51:21] [PASSED] DPI
[05:51:21] [PASSED] Writeback
[05:51:21] [PASSED] SPI
[05:51:21] [PASSED] USB
[05:51:21] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[05:51:21] =========== [PASSED] drm_connector_dynamic_init ============
[05:51:21] ==== drm_connector_dynamic_register_early (4 subtests) =====
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[05:51:21] ====== [PASSED] drm_connector_dynamic_register_early =======
[05:51:21] ======= drm_connector_dynamic_register (7 subtests) ========
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[05:51:21] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[05:51:21] ========= [PASSED] drm_connector_dynamic_register ==========
[05:51:21] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[05:51:21] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[05:51:21] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[05:51:21] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[05:51:21] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:51:21] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:51:21] [PASSED] NTSC
[05:51:21] [PASSED] NTSC-443
[05:51:21] [PASSED] NTSC-J
[05:51:21] [PASSED] PAL
[05:51:21] [PASSED] PAL-M
[05:51:21] [PASSED] PAL-N
[05:51:21] [PASSED] SECAM
[05:51:21] [PASSED] Mono
[05:51:21] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:51:21] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:51:21] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:51:21] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[05:51:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[05:51:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[05:51:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[05:51:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[05:51:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[05:51:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[05:51:21] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[05:51:21] [PASSED] VIC 96
[05:51:21] [PASSED] VIC 97
[05:51:21] [PASSED] VIC 101
[05:51:21] [PASSED] VIC 102
[05:51:21] [PASSED] VIC 106
[05:51:21] [PASSED] VIC 107
[05:51:21] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[05:51:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[05:51:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[05:51:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[05:51:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[05:51:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[05:51:21] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[05:51:21] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[05:51:21] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[05:51:21] [PASSED] Automatic
[05:51:21] [PASSED] Full
[05:51:21] [PASSED] Limited 16:235
[05:51:21] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[05:51:21] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[05:51:21] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[05:51:21] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[05:51:21] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[05:51:21] [PASSED] RGB
[05:51:21] [PASSED] YUV 4:2:0
[05:51:21] [PASSED] YUV 4:2:2
[05:51:21] [PASSED] YUV 4:4:4
[05:51:21] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[05:51:21] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[05:51:21] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[05:51:21] ============= drm_damage_helper (21 subtests) ==============
[05:51:21] [PASSED] drm_test_damage_iter_no_damage
[05:51:21] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:51:21] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:51:21] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:51:21] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:51:21] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:51:21] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:51:21] [PASSED] drm_test_damage_iter_simple_damage
[05:51:21] [PASSED] drm_test_damage_iter_single_damage
[05:51:21] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:51:21] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:51:21] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:51:21] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:51:21] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:51:21] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:51:21] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:51:21] [PASSED] drm_test_damage_iter_damage
[05:51:21] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:51:21] [PASSED] drm_test_damage_iter_damage_one_outside
[05:51:21] [PASSED] drm_test_damage_iter_damage_src_moved
[05:51:21] [PASSED] drm_test_damage_iter_damage_not_visible
[05:51:21] ================ [PASSED] drm_damage_helper ================
[05:51:21] ============== drm_dp_mst_helper (3 subtests) ==============
[05:51:21] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:51:21] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:51:21] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:51:21] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:51:21] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:51:21] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:51:21] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:51:21] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:51:21] [PASSED] Link rate 2000000 lane count 4
[05:51:21] [PASSED] Link rate 2000000 lane count 2
[05:51:21] [PASSED] Link rate 2000000 lane count 1
[05:51:21] [PASSED] Link rate 1350000 lane count 4
[05:51:21] [PASSED] Link rate 1350000 lane count 2
[05:51:21] [PASSED] Link rate 1350000 lane count 1
[05:51:21] [PASSED] Link rate 1000000 lane count 4
[05:51:21] [PASSED] Link rate 1000000 lane count 2
[05:51:21] [PASSED] Link rate 1000000 lane count 1
[05:51:21] [PASSED] Link rate 810000 lane count 4
[05:51:21] [PASSED] Link rate 810000 lane count 2
[05:51:21] [PASSED] Link rate 810000 lane count 1
[05:51:21] [PASSED] Link rate 540000 lane count 4
[05:51:21] [PASSED] Link rate 540000 lane count 2
[05:51:21] [PASSED] Link rate 540000 lane count 1
[05:51:21] [PASSED] Link rate 270000 lane count 4
[05:51:21] [PASSED] Link rate 270000 lane count 2
[05:51:21] [PASSED] Link rate 270000 lane count 1
[05:51:21] [PASSED] Link rate 162000 lane count 4
[05:51:21] [PASSED] Link rate 162000 lane count 2
[05:51:21] [PASSED] Link rate 162000 lane count 1
[05:51:21] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:51:21] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:51:21] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:51:21] [PASSED] DP_POWER_UP_PHY with port number
[05:51:21] [PASSED] DP_POWER_DOWN_PHY with port number
[05:51:21] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:51:21] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:51:21] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:51:21] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:51:21] [PASSED] DP_QUERY_PAYLOAD with port number
[05:51:21] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:51:21] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:51:21] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:51:21] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:51:21] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:51:21] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:51:21] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:51:21] [PASSED] DP_REMOTE_I2C_READ with port number
[05:51:21] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:51:21] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:51:21] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:51:21] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:51:21] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:51:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:51:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:51:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:51:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:51:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:51:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:51:21] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:51:21] ================ [PASSED] drm_dp_mst_helper ================
[05:51:21] ================== drm_exec (7 subtests) ===================
[05:51:21] [PASSED] sanitycheck
[05:51:21] [PASSED] test_lock
[05:51:21] [PASSED] test_lock_unlock
[05:51:21] [PASSED] test_duplicates
[05:51:21] [PASSED] test_prepare
[05:51:21] [PASSED] test_prepare_array
[05:51:21] [PASSED] test_multiple_loops
[05:51:21] ==================== [PASSED] drm_exec =====================
[05:51:21] =========== drm_format_helper_test (17 subtests) ===========
[05:51:21] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:51:21] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:51:21] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:51:21] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:51:21] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:51:21] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:51:21] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:51:21] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[05:51:21] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:51:21] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:51:21] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:51:21] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:51:21] ==================== drm_test_fb_swab  =====================
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ================ [PASSED] drm_test_fb_swab =================
[05:51:21] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:51:21] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:51:21] [PASSED] single_pixel_source_buffer
[05:51:21] [PASSED] single_pixel_clip_rectangle
[05:51:21] [PASSED] well_known_colors
[05:51:21] [PASSED] destination_pitch
[05:51:21] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:51:21] ================= drm_test_fb_clip_offset  =================
[05:51:21] [PASSED] pass through
[05:51:21] [PASSED] horizontal offset
[05:51:21] [PASSED] vertical offset
[05:51:21] [PASSED] horizontal and vertical offset
[05:51:21] [PASSED] horizontal offset (custom pitch)
[05:51:21] [PASSED] vertical offset (custom pitch)
[05:51:21] [PASSED] horizontal and vertical offset (custom pitch)
[05:51:21] ============= [PASSED] drm_test_fb_clip_offset =============
[05:51:21] =================== drm_test_fb_memcpy  ====================
[05:51:21] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:51:21] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:51:21] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:51:21] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:51:21] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:51:21] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:51:21] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:51:21] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:51:21] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:51:21] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:51:21] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:51:21] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:51:21] =============== [PASSED] drm_test_fb_memcpy ================
[05:51:21] ============= [PASSED] drm_format_helper_test ==============
[05:51:21] ================= drm_format (18 subtests) =================
[05:51:21] [PASSED] drm_test_format_block_width_invalid
[05:51:21] [PASSED] drm_test_format_block_width_one_plane
[05:51:21] [PASSED] drm_test_format_block_width_two_plane
[05:51:21] [PASSED] drm_test_format_block_width_three_plane
[05:51:21] [PASSED] drm_test_format_block_width_tiled
[05:51:21] [PASSED] drm_test_format_block_height_invalid
[05:51:21] [PASSED] drm_test_format_block_height_one_plane
[05:51:21] [PASSED] drm_test_format_block_height_two_plane
[05:51:21] [PASSED] drm_test_format_block_height_three_plane
[05:51:21] [PASSED] drm_test_format_block_height_tiled
[05:51:21] [PASSED] drm_test_format_min_pitch_invalid
[05:51:21] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:51:21] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:51:21] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:51:21] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:51:21] [PASSED] drm_test_format_min_pitch_two_plane
[05:51:21] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:51:21] [PASSED] drm_test_format_min_pitch_tiled
[05:51:21] =================== [PASSED] drm_format ====================
[05:51:21] ============== drm_framebuffer (10 subtests) ===============
[05:51:21] ========== drm_test_framebuffer_check_src_coords  ==========
[05:51:21] [PASSED] Success: source fits into fb
[05:51:21] [PASSED] Fail: overflowing fb with x-axis coordinate
[05:51:21] [PASSED] Fail: overflowing fb with y-axis coordinate
[05:51:21] [PASSED] Fail: overflowing fb with source width
[05:51:21] [PASSED] Fail: overflowing fb with source height
[05:51:21] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[05:51:21] [PASSED] drm_test_framebuffer_cleanup
[05:51:21] =============== drm_test_framebuffer_create  ===============
[05:51:21] [PASSED] ABGR8888 normal sizes
[05:51:21] [PASSED] ABGR8888 max sizes
[05:51:21] [PASSED] ABGR8888 pitch greater than min required
[05:51:21] [PASSED] ABGR8888 pitch less than min required
[05:51:21] [PASSED] ABGR8888 Invalid width
[05:51:21] [PASSED] ABGR8888 Invalid buffer handle
[05:51:21] [PASSED] No pixel format
[05:51:21] [PASSED] ABGR8888 Width 0
[05:51:21] [PASSED] ABGR8888 Height 0
[05:51:21] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:51:21] [PASSED] ABGR8888 Large buffer offset
[05:51:21] [PASSED] ABGR8888 Buffer offset for inexistent plane
[05:51:21] [PASSED] ABGR8888 Invalid flag
[05:51:21] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:51:21] [PASSED] ABGR8888 Valid buffer modifier
[05:51:21] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:51:21] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:51:21] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:51:21] [PASSED] NV12 Normal sizes
[05:51:21] [PASSED] NV12 Max sizes
[05:51:21] [PASSED] NV12 Invalid pitch
[05:51:21] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:51:21] [PASSED] NV12 different  modifier per-plane
[05:51:21] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:51:21] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:51:21] [PASSED] NV12 Modifier for inexistent plane
[05:51:21] [PASSED] NV12 Handle for inexistent plane
[05:51:21] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:51:21] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:51:21] [PASSED] YVU420 Normal sizes
[05:51:21] [PASSED] YVU420 Max sizes
[05:51:21] [PASSED] YVU420 Invalid pitch
[05:51:21] [PASSED] YVU420 Different pitches
[05:51:21] [PASSED] YVU420 Different buffer offsets/pitches
[05:51:21] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:51:21] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:51:21] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:51:21] [PASSED] YVU420 Valid modifier
[05:51:21] [PASSED] YVU420 Different modifiers per plane
[05:51:21] [PASSED] YVU420 Modifier for inexistent plane
[05:51:21] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[05:51:21] [PASSED] X0L2 Normal sizes
[05:51:21] [PASSED] X0L2 Max sizes
[05:51:21] [PASSED] X0L2 Invalid pitch
[05:51:21] [PASSED] X0L2 Pitch greater than minimum required
[05:51:21] [PASSED] X0L2 Handle for inexistent plane
[05:51:21] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:51:21] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:51:21] [PASSED] X0L2 Valid modifier
[05:51:21] [PASSED] X0L2 Modifier for inexistent plane
[05:51:21] =========== [PASSED] drm_test_framebuffer_create ===========
[05:51:21] [PASSED] drm_test_framebuffer_free
[05:51:21] [PASSED] drm_test_framebuffer_init
[05:51:21] [PASSED] drm_test_framebuffer_init_bad_format
[05:51:21] [PASSED] drm_test_framebuffer_init_dev_mismatch
[05:51:21] [PASSED] drm_test_framebuffer_lookup
[05:51:21] [PASSED] drm_test_framebuffer_lookup_inexistent
[05:51:21] [PASSED] drm_test_framebuffer_modifiers_not_supported
[05:51:21] ================= [PASSED] drm_framebuffer =================
[05:51:21] ================ drm_gem_shmem (8 subtests) ================
[05:51:21] [PASSED] drm_gem_shmem_test_obj_create
[05:51:21] [PASSED] drm_gem_shmem_test_obj_create_private
[05:51:21] [PASSED] drm_gem_shmem_test_pin_pages
[05:51:21] [PASSED] drm_gem_shmem_test_vmap
[05:51:21] [PASSED] drm_gem_shmem_test_get_sg_table
[05:51:21] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:51:21] [PASSED] drm_gem_shmem_test_madvise
[05:51:21] [PASSED] drm_gem_shmem_test_purge
[05:51:21] ================== [PASSED] drm_gem_shmem ==================
[05:51:21] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[05:51:21] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[05:51:21] [PASSED] Automatic
[05:51:21] [PASSED] Full
[05:51:21] [PASSED] Limited 16:235
[05:51:21] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[05:51:21] [PASSED] drm_test_check_disable_connector
[05:51:21] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[05:51:21] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[05:51:21] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[05:51:21] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[05:51:21] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[05:51:21] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[05:51:21] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[05:51:21] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[05:51:21] [PASSED] drm_test_check_output_bpc_dvi
[05:51:21] [PASSED] drm_test_check_output_bpc_format_vic_1
[05:51:21] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[05:51:21] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[05:51:21] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[05:51:21] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[05:51:21] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[05:51:21] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[05:51:21] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[05:51:21] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[05:51:21] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[05:51:21] [PASSED] drm_test_check_broadcast_rgb_value
[05:51:21] [PASSED] drm_test_check_bpc_8_value
[05:51:21] [PASSED] drm_test_check_bpc_10_value
[05:51:21] [PASSED] drm_test_check_bpc_12_value
[05:51:21] [PASSED] drm_test_check_format_value
[05:51:21] [PASSED] drm_test_check_tmds_char_value
[05:51:21] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[05:51:21] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[05:51:21] [PASSED] drm_test_check_mode_valid
[05:51:21] [PASSED] drm_test_check_mode_valid_reject
[05:51:21] [PASSED] drm_test_check_mode_valid_reject_rate
[05:51:21] [PASSED] drm_test_check_mode_valid_reject_max_clock
[05:51:21] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[05:51:21] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[05:51:21] [PASSED] drm_test_check_infoframes
[05:51:21] [PASSED] drm_test_check_reject_avi_infoframe
[05:51:21] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[05:51:21] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[05:51:21] [PASSED] drm_test_check_reject_audio_infoframe
[05:51:21] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[05:51:21] ================= drm_managed (2 subtests) =================
[05:51:21] [PASSED] drm_test_managed_release_action
[05:51:21] [PASSED] drm_test_managed_run_action
[05:51:21] =================== [PASSED] drm_managed ===================
[05:51:21] =================== drm_mm (6 subtests) ====================
[05:51:21] [PASSED] drm_test_mm_init
[05:51:21] [PASSED] drm_test_mm_debug
[05:51:21] [PASSED] drm_test_mm_align32
[05:51:21] [PASSED] drm_test_mm_align64
[05:51:21] [PASSED] drm_test_mm_lowest
[05:51:21] [PASSED] drm_test_mm_highest
[05:51:21] ===================== [PASSED] drm_mm ======================
[05:51:21] ============= drm_modes_analog_tv (5 subtests) =============
[05:51:21] [PASSED] drm_test_modes_analog_tv_mono_576i
[05:51:21] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:51:21] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:51:21] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:51:21] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:51:21] =============== [PASSED] drm_modes_analog_tv ===============
[05:51:21] ============== drm_plane_helper (2 subtests) ===============
[05:51:21] =============== drm_test_check_plane_state  ================
[05:51:21] [PASSED] clipping_simple
[05:51:21] [PASSED] clipping_rotate_reflect
[05:51:21] [PASSED] positioning_simple
[05:51:21] [PASSED] upscaling
[05:51:21] [PASSED] downscaling
[05:51:21] [PASSED] rounding1
[05:51:21] [PASSED] rounding2
[05:51:21] [PASSED] rounding3
[05:51:21] [PASSED] rounding4
[05:51:21] =========== [PASSED] drm_test_check_plane_state ============
[05:51:21] =========== drm_test_check_invalid_plane_state  ============
[05:51:21] [PASSED] positioning_invalid
[05:51:21] [PASSED] upscaling_invalid
[05:51:21] [PASSED] downscaling_invalid
[05:51:21] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:51:21] ================ [PASSED] drm_plane_helper =================
[05:51:21] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:51:21] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:51:21] [PASSED] None
[05:51:21] [PASSED] PAL
[05:51:21] [PASSED] NTSC
[05:51:21] [PASSED] Both, NTSC Default
[05:51:21] [PASSED] Both, PAL Default
[05:51:21] [PASSED] Both, NTSC Default, with PAL on command-line
[05:51:21] [PASSED] Both, PAL Default, with NTSC on command-line
[05:51:21] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:51:21] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:51:21] ================== drm_rect (9 subtests) ===================
[05:51:21] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:51:21] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:51:21] [PASSED] drm_test_rect_clip_scaled_clipped
[05:51:21] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:51:21] ================= drm_test_rect_intersect  =================
[05:51:21] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:51:21] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:51:21] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:51:21] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:51:21] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:51:21] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:51:21] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:51:21] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:51:21] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:51:21] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:51:21] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:51:21] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:51:21] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:51:21] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:51:21] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:51:21] ============= [PASSED] drm_test_rect_intersect =============
[05:51:21] ================ drm_test_rect_calc_hscale  ================
[05:51:21] [PASSED] normal use
[05:51:21] [PASSED] out of max range
[05:51:21] [PASSED] out of min range
[05:51:21] [PASSED] zero dst
[05:51:21] [PASSED] negative src
[05:51:21] [PASSED] negative dst
[05:51:21] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:51:21] ================ drm_test_rect_calc_vscale  ================
[05:51:21] [PASSED] normal use
[05:51:21] [PASSED] out of max range
[05:51:21] [PASSED] out of min range
[05:51:21] [PASSED] zero dst
[05:51:21] [PASSED] negative src
[05:51:21] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[05:51:21] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:51:21] ================== drm_test_rect_rotate  ===================
[05:51:21] [PASSED] reflect-x
[05:51:21] [PASSED] reflect-y
[05:51:21] [PASSED] rotate-0
[05:51:21] [PASSED] rotate-90
[05:51:21] [PASSED] rotate-180
[05:51:21] [PASSED] rotate-270
[05:51:21] ============== [PASSED] drm_test_rect_rotate ===============
[05:51:21] ================ drm_test_rect_rotate_inv  =================
[05:51:21] [PASSED] reflect-x
[05:51:21] [PASSED] reflect-y
[05:51:21] [PASSED] rotate-0
[05:51:21] [PASSED] rotate-90
[05:51:21] [PASSED] rotate-180
[05:51:21] [PASSED] rotate-270
[05:51:21] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:51:21] ==================== [PASSED] drm_rect =====================
[05:51:21] ============ drm_sysfb_modeset_test (1 subtest) ============
[05:51:21] ============ drm_test_sysfb_build_fourcc_list  =============
[05:51:21] [PASSED] no native formats
[05:51:21] [PASSED] XRGB8888 as native format
[05:51:21] [PASSED] remove duplicates
[05:51:21] [PASSED] convert alpha formats
[05:51:21] [PASSED] random formats
[05:51:21] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[05:51:21] ============= [PASSED] drm_sysfb_modeset_test ==============
[05:51:21] ================== drm_fixp (2 subtests) ===================
[05:51:21] [PASSED] drm_test_int2fixp
[05:51:21] [PASSED] drm_test_sm2fixp
[05:51:21] ==================== [PASSED] drm_fixp =====================
[05:51:21] ============================================================
[05:51:21] Testing complete. Ran 621 tests: passed: 621
[05:51:21] Elapsed time: 26.518s total, 1.739s configuring, 24.611s building, 0.118s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[05:51:21] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:51:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:51:32] Starting KUnit Kernel (1/1)...
[05:51:32] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:51:32] ================= ttm_device (5 subtests) ==================
[05:51:32] [PASSED] ttm_device_init_basic
[05:51:32] [PASSED] ttm_device_init_multiple
[05:51:32] [PASSED] ttm_device_fini_basic
[05:51:32] [PASSED] ttm_device_init_no_vma_man
[05:51:32] ================== ttm_device_init_pools  ==================
[05:51:32] [PASSED] No DMA allocations, no DMA32 required
[05:51:32] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[05:51:32] Expected !list_lru_count(&pt.pages) to be false, but is true
[05:51:32] [FAILED] DMA allocations, DMA32 required
[05:51:32] [PASSED] No DMA allocations, DMA32 required
[05:51:32]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[05:51:32]     Expected !list_lru_count(&pt.pages) to be false, but is true
[05:51:32] ------------[ cut here ]------------
[05:51:32] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[05:51:32] refcount_t: underflow; use-after-free.
[05:51:32] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-gef12e65781ef #3 VOLUNTARY
[05:51:32] Tainted: [W]=WARN, [N]=TEST
[05:51:32] Stack:
[05:51:32]  6044eeae 00000000 00000000 00000001
[05:51:32]  ffffff00 6044eeae 603238ba 00000009
[05:51:32]  0000001c 60043eec 6002381c ae0cbd40
[05:51:32] Call Trace:
[05:51:32]  [<603238ba>] ? devres_release_all+0xaa/0x100
[05:51:32]  [<60043eec>] ? dump_stack_lvl+0x5e/0x7a
[05:51:32]  [<6002381c>] ? _printk+0x0/0x65
[05:51:32]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[05:51:32]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[05:51:32]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[05:51:32]  [<60052e36>] ? um_set_signals+0x36/0x60
[05:51:32]  [<600c5a42>] ? call_rcu+0x52/0x90
[05:51:32]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[05:51:32]  [<60147f50>] ? kfree+0x0/0x250
[05:51:32]  [<603238ba>] ? devres_release_all+0xaa/0x100
[05:51:32]  [<60396df0>] ? mutex_unlock+0x0/0x30
[05:51:32]  [<6031c600>] ? bus_notify+0x0/0x60
[05:51:32]  [<60396df0>] ? mutex_unlock+0x0/0x30
[05:51:32]  [<60398860>] ? mutex_lock+0x0/0x40
[05:51:32]  [<6031cc64>] ? device_unbind_cleanup+0x14/0xb0
[05:51:32]  [<6031e436>] ? device_release_driver_internal+0x256/0x2b0
[05:51:32]  [<60372450>] ? kobject_put+0x0/0x150
[05:51:32]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[05:51:32]  [<6031c24f>] ? bus_remove_device+0x10f/0x1a0
[05:51:32]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[05:51:32]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[05:51:32]  [<60315ccc>] ? device_del+0x1bc/0x600
[05:51:32]  [<60052e00>] ? um_set_signals+0x0/0x60
[05:51:32]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[05:51:32]  [<60052e00>] ? um_set_signals+0x0/0x60
[05:51:32]  [<60316124>] ? device_unregister+0x14/0x40
[05:51:32]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[05:51:32]  [<60257d70>] ? kunit_release_action+0x0/0x170
[05:51:32]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[05:51:32]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[05:51:32]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[05:51:32]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[05:51:32]  [<60081e36>] ? kthread+0xe6/0x150
[05:51:32]  [<60046435>] ? new_thread_handler+0x45/0x60
[05:51:32] ---[ end trace 0000000000000000 ]---
[05:51:32] [FAILED] DMA allocations, no DMA32 required
[05:51:32] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[05:51:32] ============== [FAILED] ttm_device_init_pools ==============
[05:51:32]     # module: ttm_device_test
[05:51:32] # ttm_device: pass:4 fail:1 skip:0 total:5
[05:51:32] # Totals: pass:6 fail:2 skip:0 total:8
[05:51:32] =================== [FAILED] ttm_device ====================
[05:51:32] ================== ttm_pool (8 subtests) ===================
[05:51:32] ================== ttm_pool_alloc_basic  ===================
[05:51:32] [PASSED] One page
[05:51:32] [PASSED] More than one page
[05:51:32] [PASSED] Above the allocation limit
[05:51:32] [PASSED] One page, with coherent DMA mappings enabled
[05:51:32] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:51:32] ============== [PASSED] ttm_pool_alloc_basic ===============
[05:51:32] ============== ttm_pool_alloc_basic_dma_addr  ==============
[05:51:32] [PASSED] One page
[05:51:32] [PASSED] More than one page
[05:51:32] [PASSED] Above the allocation limit
[05:51:32] [PASSED] One page, with coherent DMA mappings enabled
[05:51:32] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:51:32] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[05:51:32] [PASSED] ttm_pool_alloc_order_caching_match
[05:51:32] [PASSED] ttm_pool_alloc_caching_mismatch
[05:51:32] [PASSED] ttm_pool_alloc_order_mismatch
[05:51:32] [PASSED] ttm_pool_free_dma_alloc
[05:51:32] [ERROR] Test: ttm_pool: missing expected subtest!
[05:51:32] 
[05:51:32] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-gef12e65781ef
[05:51:32] RIP: 0033:list_lru_count_node+0xe/0x20
[05:51:32] RSP: 00000000ae0cbed8  EFLAGS: 00010246
[05:51:32] RAX: 0000000000000000 RBX: 00000000ae003c90 RCX: 000000006e64c7d8
[05:51:32] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000006e486880
[05:51:32] RBP: 000000006e486800 R08: 00000000acc4fc28 R09: 000000006e450c80
[05:51:32] R10: 0000000000000000 R11: 0000000000000000 R12: 000000006e450c80
[05:51:32] R13: 0000000060440898 R14: 000000006010eb50 R15: 000000006e486880
[05:51:32] Kernel panic - not syncing: Segfault with no mm
[05:51:32] [CRASHED] 
[05:51:32] [ERROR] Test: ttm_pool: missing expected subtest!
[05:51:32] [CRASHED] 
[05:51:32] [ERROR] Test: ttm_pool: missing subtest result line!
[05:51:32] # module: ttm_pool_test
[05:51:32] ==================== [CRASHED] ttm_pool ====================
[05:51:32] [ERROR] Test: main: missing expected subtest!
[05:51:32] [CRASHED] 
[05:51:32] [ERROR] Test: main: missing expected subtest!
[05:51:32] [CRASHED] 
[05:51:32] [ERROR] Test: main: missing expected subtest!
[05:51:32] [CRASHED] 
[05:51:32] [ERROR] Test: main: missing expected subtest!
[05:51:32] [CRASHED] 
[05:51:32] ============================================================
[05:51:32] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[05:51:32] Elapsed time: 11.526s total, 1.720s configuring, 9.488s building, 0.318s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


