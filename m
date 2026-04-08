Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0570A10F995C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 18:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2D310E6C3;
	Wed,  8 Apr 2026 18:28:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006410E6C3;
 Wed,  8 Apr 2026 18:28:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/guc=3A_Add_support_for_?=
 =?utf-8?q?NO=5FRESPONSE=5FBUSY_in_CTB_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 18:28:26 -0000
Message-ID: <177567290630.443508.9576422869319101816@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408182130.9305-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260408182130.9305-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB (rev2)
URL   : https://patchwork.freedesktop.org/series/164357/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[18:27:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:27:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:27:44] Starting KUnit Kernel (1/1)...
[18:27:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:27:44] ================== guc_buf (11 subtests) ===================
[18:27:44] [PASSED] test_smallest
[18:27:44] [PASSED] test_largest
[18:27:44] [PASSED] test_granular
[18:27:44] [PASSED] test_unique
[18:27:44] [PASSED] test_overlap
[18:27:44] [PASSED] test_reusable
[18:27:44] [PASSED] test_too_big
[18:27:44] [PASSED] test_flush
[18:27:44] [PASSED] test_lookup
[18:27:44] [PASSED] test_data
[18:27:44] [PASSED] test_class
[18:27:44] ===================== [PASSED] guc_buf =====================
[18:27:44] =================== guc_dbm (7 subtests) ===================
[18:27:44] [PASSED] test_empty
[18:27:44] [PASSED] test_default
[18:27:44] ======================== test_size  ========================
[18:27:44] [PASSED] 4
[18:27:44] [PASSED] 8
[18:27:44] [PASSED] 32
[18:27:44] [PASSED] 256
[18:27:44] ==================== [PASSED] test_size ====================
[18:27:44] ======================= test_reuse  ========================
[18:27:44] [PASSED] 4
[18:27:44] [PASSED] 8
[18:27:44] [PASSED] 32
[18:27:44] [PASSED] 256
[18:27:44] =================== [PASSED] test_reuse ====================
[18:27:44] =================== test_range_overlap  ====================
[18:27:44] [PASSED] 4
[18:27:44] [PASSED] 8
[18:27:44] [PASSED] 32
[18:27:44] [PASSED] 256
[18:27:44] =============== [PASSED] test_range_overlap ================
[18:27:44] =================== test_range_compact  ====================
[18:27:44] [PASSED] 4
[18:27:44] [PASSED] 8
[18:27:44] [PASSED] 32
[18:27:44] [PASSED] 256
[18:27:44] =============== [PASSED] test_range_compact ================
[18:27:44] ==================== test_range_spare  =====================
[18:27:44] [PASSED] 4
[18:27:44] [PASSED] 8
[18:27:44] [PASSED] 32
[18:27:44] [PASSED] 256
[18:27:44] ================ [PASSED] test_range_spare =================
[18:27:44] ===================== [PASSED] guc_dbm =====================
[18:27:44] =================== guc_idm (6 subtests) ===================
[18:27:44] [PASSED] bad_init
[18:27:44] [PASSED] no_init
[18:27:44] [PASSED] init_fini
[18:27:44] [PASSED] check_used
[18:27:44] [PASSED] check_quota
[18:27:44] [PASSED] check_all
[18:27:44] ===================== [PASSED] guc_idm =====================
[18:27:44] ================== no_relay (3 subtests) ===================
[18:27:44] [PASSED] xe_drops_guc2pf_if_not_ready
[18:27:44] [PASSED] xe_drops_guc2vf_if_not_ready
[18:27:44] [PASSED] xe_rejects_send_if_not_ready
[18:27:44] ==================== [PASSED] no_relay =====================
[18:27:44] ================== pf_relay (14 subtests) ==================
[18:27:44] [PASSED] pf_rejects_guc2pf_too_short
[18:27:44] [PASSED] pf_rejects_guc2pf_too_long
[18:27:44] [PASSED] pf_rejects_guc2pf_no_payload
[18:27:44] [PASSED] pf_fails_no_payload
[18:27:44] [PASSED] pf_fails_bad_origin
[18:27:44] [PASSED] pf_fails_bad_type
[18:27:44] [PASSED] pf_txn_reports_error
[18:27:44] [PASSED] pf_txn_sends_pf2guc
[18:27:44] [PASSED] pf_sends_pf2guc
[18:27:44] [SKIPPED] pf_loopback_nop
[18:27:44] [SKIPPED] pf_loopback_echo
[18:27:44] [SKIPPED] pf_loopback_fail
[18:27:44] [SKIPPED] pf_loopback_busy
[18:27:44] [SKIPPED] pf_loopback_retry
[18:27:44] ==================== [PASSED] pf_relay =====================
[18:27:44] ================== vf_relay (3 subtests) ===================
[18:27:44] [PASSED] vf_rejects_guc2vf_too_short
[18:27:44] [PASSED] vf_rejects_guc2vf_too_long
[18:27:44] [PASSED] vf_rejects_guc2vf_no_payload
[18:27:44] ==================== [PASSED] vf_relay =====================
[18:27:44] ================ pf_gt_config (9 subtests) =================
[18:27:44] [PASSED] fair_contexts_1vf
[18:27:44] [PASSED] fair_doorbells_1vf
[18:27:44] [PASSED] fair_ggtt_1vf
[18:27:44] ====================== fair_vram_1vf  ======================
[18:27:44] [PASSED] 3.50 GiB
[18:27:44] [PASSED] 11.5 GiB
[18:27:44] [PASSED] 15.5 GiB
[18:27:44] [PASSED] 31.5 GiB
[18:27:44] [PASSED] 63.5 GiB
[18:27:44] [PASSED] 1.91 GiB
[18:27:44] ================== [PASSED] fair_vram_1vf ==================
[18:27:44] ================ fair_vram_1vf_admin_only  =================
[18:27:44] [PASSED] 3.50 GiB
[18:27:44] [PASSED] 11.5 GiB
[18:27:44] [PASSED] 15.5 GiB
[18:27:44] [PASSED] 31.5 GiB
[18:27:44] [PASSED] 63.5 GiB
[18:27:44] [PASSED] 1.91 GiB
[18:27:44] ============ [PASSED] fair_vram_1vf_admin_only =============
[18:27:44] ====================== fair_contexts  ======================
[18:27:44] [PASSED] 1 VF
[18:27:44] [PASSED] 2 VFs
[18:27:44] [PASSED] 3 VFs
[18:27:44] [PASSED] 4 VFs
[18:27:44] [PASSED] 5 VFs
[18:27:44] [PASSED] 6 VFs
[18:27:44] [PASSED] 7 VFs
[18:27:44] [PASSED] 8 VFs
[18:27:44] [PASSED] 9 VFs
[18:27:44] [PASSED] 10 VFs
[18:27:44] [PASSED] 11 VFs
[18:27:44] [PASSED] 12 VFs
[18:27:44] [PASSED] 13 VFs
[18:27:44] [PASSED] 14 VFs
[18:27:44] [PASSED] 15 VFs
[18:27:44] [PASSED] 16 VFs
[18:27:44] [PASSED] 17 VFs
[18:27:44] [PASSED] 18 VFs
[18:27:44] [PASSED] 19 VFs
[18:27:44] [PASSED] 20 VFs
[18:27:44] [PASSED] 21 VFs
[18:27:44] [PASSED] 22 VFs
[18:27:44] [PASSED] 23 VFs
[18:27:44] [PASSED] 24 VFs
[18:27:44] [PASSED] 25 VFs
[18:27:44] [PASSED] 26 VFs
[18:27:44] [PASSED] 27 VFs
[18:27:44] [PASSED] 28 VFs
[18:27:44] [PASSED] 29 VFs
[18:27:44] [PASSED] 30 VFs
[18:27:44] [PASSED] 31 VFs
[18:27:44] [PASSED] 32 VFs
[18:27:44] [PASSED] 33 VFs
[18:27:44] [PASSED] 34 VFs
[18:27:44] [PASSED] 35 VFs
[18:27:44] [PASSED] 36 VFs
[18:27:44] [PASSED] 37 VFs
[18:27:44] [PASSED] 38 VFs
[18:27:44] [PASSED] 39 VFs
[18:27:44] [PASSED] 40 VFs
[18:27:44] [PASSED] 41 VFs
[18:27:44] [PASSED] 42 VFs
[18:27:44] [PASSED] 43 VFs
[18:27:44] [PASSED] 44 VFs
[18:27:44] [PASSED] 45 VFs
[18:27:44] [PASSED] 46 VFs
[18:27:44] [PASSED] 47 VFs
[18:27:44] [PASSED] 48 VFs
[18:27:44] [PASSED] 49 VFs
[18:27:44] [PASSED] 50 VFs
[18:27:44] [PASSED] 51 VFs
[18:27:44] [PASSED] 52 VFs
[18:27:44] [PASSED] 53 VFs
[18:27:44] [PASSED] 54 VFs
[18:27:44] [PASSED] 55 VFs
[18:27:44] [PASSED] 56 VFs
[18:27:44] [PASSED] 57 VFs
[18:27:44] [PASSED] 58 VFs
[18:27:44] [PASSED] 59 VFs
[18:27:44] [PASSED] 60 VFs
[18:27:44] [PASSED] 61 VFs
[18:27:44] [PASSED] 62 VFs
[18:27:44] [PASSED] 63 VFs
[18:27:44] ================== [PASSED] fair_contexts ==================
[18:27:44] ===================== fair_doorbells  ======================
[18:27:44] [PASSED] 1 VF
[18:27:44] [PASSED] 2 VFs
[18:27:44] [PASSED] 3 VFs
[18:27:44] [PASSED] 4 VFs
[18:27:44] [PASSED] 5 VFs
[18:27:44] [PASSED] 6 VFs
[18:27:44] [PASSED] 7 VFs
[18:27:44] [PASSED] 8 VFs
[18:27:44] [PASSED] 9 VFs
[18:27:44] [PASSED] 10 VFs
[18:27:44] [PASSED] 11 VFs
[18:27:44] [PASSED] 12 VFs
[18:27:44] [PASSED] 13 VFs
[18:27:44] [PASSED] 14 VFs
[18:27:44] [PASSED] 15 VFs
[18:27:44] [PASSED] 16 VFs
[18:27:44] [PASSED] 17 VFs
[18:27:44] [PASSED] 18 VFs
[18:27:44] [PASSED] 19 VFs
[18:27:44] [PASSED] 20 VFs
[18:27:44] [PASSED] 21 VFs
[18:27:44] [PASSED] 22 VFs
[18:27:44] [PASSED] 23 VFs
[18:27:44] [PASSED] 24 VFs
[18:27:44] [PASSED] 25 VFs
[18:27:44] [PASSED] 26 VFs
[18:27:44] [PASSED] 27 VFs
[18:27:44] [PASSED] 28 VFs
[18:27:44] [PASSED] 29 VFs
[18:27:44] [PASSED] 30 VFs
[18:27:44] [PASSED] 31 VFs
[18:27:44] [PASSED] 32 VFs
[18:27:44] [PASSED] 33 VFs
[18:27:44] [PASSED] 34 VFs
[18:27:44] [PASSED] 35 VFs
[18:27:44] [PASSED] 36 VFs
[18:27:44] [PASSED] 37 VFs
[18:27:44] [PASSED] 38 VFs
[18:27:44] [PASSED] 39 VFs
[18:27:44] [PASSED] 40 VFs
[18:27:44] [PASSED] 41 VFs
[18:27:44] [PASSED] 42 VFs
[18:27:44] [PASSED] 43 VFs
[18:27:44] [PASSED] 44 VFs
[18:27:44] [PASSED] 45 VFs
[18:27:44] [PASSED] 46 VFs
[18:27:44] [PASSED] 47 VFs
[18:27:44] [PASSED] 48 VFs
[18:27:44] [PASSED] 49 VFs
[18:27:44] [PASSED] 50 VFs
[18:27:44] [PASSED] 51 VFs
[18:27:44] [PASSED] 52 VFs
[18:27:44] [PASSED] 53 VFs
[18:27:44] [PASSED] 54 VFs
[18:27:44] [PASSED] 55 VFs
[18:27:44] [PASSED] 56 VFs
[18:27:44] [PASSED] 57 VFs
[18:27:44] [PASSED] 58 VFs
[18:27:44] [PASSED] 59 VFs
[18:27:44] [PASSED] 60 VFs
[18:27:44] [PASSED] 61 VFs
[18:27:44] [PASSED] 62 VFs
[18:27:44] [PASSED] 63 VFs
[18:27:44] ================= [PASSED] fair_doorbells ==================
[18:27:44] ======================== fair_ggtt  ========================
[18:27:44] [PASSED] 1 VF
[18:27:44] [PASSED] 2 VFs
[18:27:44] [PASSED] 3 VFs
[18:27:44] [PASSED] 4 VFs
[18:27:44] [PASSED] 5 VFs
[18:27:44] [PASSED] 6 VFs
[18:27:44] [PASSED] 7 VFs
[18:27:44] [PASSED] 8 VFs
[18:27:44] [PASSED] 9 VFs
[18:27:44] [PASSED] 10 VFs
[18:27:44] [PASSED] 11 VFs
[18:27:44] [PASSED] 12 VFs
[18:27:44] [PASSED] 13 VFs
[18:27:44] [PASSED] 14 VFs
[18:27:44] [PASSED] 15 VFs
[18:27:44] [PASSED] 16 VFs
[18:27:44] [PASSED] 17 VFs
[18:27:44] [PASSED] 18 VFs
[18:27:44] [PASSED] 19 VFs
[18:27:44] [PASSED] 20 VFs
[18:27:44] [PASSED] 21 VFs
[18:27:44] [PASSED] 22 VFs
[18:27:44] [PASSED] 23 VFs
[18:27:44] [PASSED] 24 VFs
[18:27:44] [PASSED] 25 VFs
[18:27:44] [PASSED] 26 VFs
[18:27:44] [PASSED] 27 VFs
[18:27:44] [PASSED] 28 VFs
[18:27:44] [PASSED] 29 VFs
[18:27:44] [PASSED] 30 VFs
[18:27:44] [PASSED] 31 VFs
[18:27:44] [PASSED] 32 VFs
[18:27:44] [PASSED] 33 VFs
[18:27:44] [PASSED] 34 VFs
[18:27:44] [PASSED] 35 VFs
[18:27:44] [PASSED] 36 VFs
[18:27:44] [PASSED] 37 VFs
[18:27:44] [PASSED] 38 VFs
[18:27:44] [PASSED] 39 VFs
[18:27:44] [PASSED] 40 VFs
[18:27:44] [PASSED] 41 VFs
[18:27:44] [PASSED] 42 VFs
[18:27:44] [PASSED] 43 VFs
[18:27:44] [PASSED] 44 VFs
[18:27:44] [PASSED] 45 VFs
[18:27:44] [PASSED] 46 VFs
[18:27:44] [PASSED] 47 VFs
[18:27:44] [PASSED] 48 VFs
[18:27:44] [PASSED] 49 VFs
[18:27:44] [PASSED] 50 VFs
[18:27:44] [PASSED] 51 VFs
[18:27:44] [PASSED] 52 VFs
[18:27:44] [PASSED] 53 VFs
[18:27:44] [PASSED] 54 VFs
[18:27:44] [PASSED] 55 VFs
[18:27:44] [PASSED] 56 VFs
[18:27:44] [PASSED] 57 VFs
[18:27:44] [PASSED] 58 VFs
[18:27:44] [PASSED] 59 VFs
[18:27:44] [PASSED] 60 VFs
[18:27:44] [PASSED] 61 VFs
[18:27:44] [PASSED] 62 VFs
[18:27:44] [PASSED] 63 VFs
[18:27:44] ==================== [PASSED] fair_ggtt ====================
[18:27:44] ======================== fair_vram  ========================
[18:27:44] [PASSED] 1 VF
[18:27:44] [PASSED] 2 VFs
[18:27:44] [PASSED] 3 VFs
[18:27:44] [PASSED] 4 VFs
[18:27:44] [PASSED] 5 VFs
[18:27:44] [PASSED] 6 VFs
[18:27:44] [PASSED] 7 VFs
[18:27:45] [PASSED] 8 VFs
[18:27:45] [PASSED] 9 VFs
[18:27:45] [PASSED] 10 VFs
[18:27:45] [PASSED] 11 VFs
[18:27:45] [PASSED] 12 VFs
[18:27:45] [PASSED] 13 VFs
[18:27:45] [PASSED] 14 VFs
[18:27:45] [PASSED] 15 VFs
[18:27:45] [PASSED] 16 VFs
[18:27:45] [PASSED] 17 VFs
[18:27:45] [PASSED] 18 VFs
[18:27:45] [PASSED] 19 VFs
[18:27:45] [PASSED] 20 VFs
[18:27:45] [PASSED] 21 VFs
[18:27:45] [PASSED] 22 VFs
[18:27:45] [PASSED] 23 VFs
[18:27:45] [PASSED] 24 VFs
[18:27:45] [PASSED] 25 VFs
[18:27:45] [PASSED] 26 VFs
[18:27:45] [PASSED] 27 VFs
[18:27:45] [PASSED] 28 VFs
[18:27:45] [PASSED] 29 VFs
[18:27:45] [PASSED] 30 VFs
[18:27:45] [PASSED] 31 VFs
[18:27:45] [PASSED] 32 VFs
[18:27:45] [PASSED] 33 VFs
[18:27:45] [PASSED] 34 VFs
[18:27:45] [PASSED] 35 VFs
[18:27:45] [PASSED] 36 VFs
[18:27:45] [PASSED] 37 VFs
[18:27:45] [PASSED] 38 VFs
[18:27:45] [PASSED] 39 VFs
[18:27:45] [PASSED] 40 VFs
[18:27:45] [PASSED] 41 VFs
[18:27:45] [PASSED] 42 VFs
[18:27:45] [PASSED] 43 VFs
[18:27:45] [PASSED] 44 VFs
[18:27:45] [PASSED] 45 VFs
[18:27:45] [PASSED] 46 VFs
[18:27:45] [PASSED] 47 VFs
[18:27:45] [PASSED] 48 VFs
[18:27:45] [PASSED] 49 VFs
[18:27:45] [PASSED] 50 VFs
[18:27:45] [PASSED] 51 VFs
[18:27:45] [PASSED] 52 VFs
[18:27:45] [PASSED] 53 VFs
[18:27:45] [PASSED] 54 VFs
[18:27:45] [PASSED] 55 VFs
[18:27:45] [PASSED] 56 VFs
[18:27:45] [PASSED] 57 VFs
[18:27:45] [PASSED] 58 VFs
[18:27:45] [PASSED] 59 VFs
[18:27:45] [PASSED] 60 VFs
[18:27:45] [PASSED] 61 VFs
[18:27:45] [PASSED] 62 VFs
[18:27:45] [PASSED] 63 VFs
[18:27:45] ==================== [PASSED] fair_vram ====================
[18:27:45] ================== [PASSED] pf_gt_config ===================
[18:27:45] ===================== lmtt (1 subtest) =====================
[18:27:45] ======================== test_ops  =========================
[18:27:45] [PASSED] 2-level
[18:27:45] [PASSED] multi-level
[18:27:45] ==================== [PASSED] test_ops =====================
[18:27:45] ====================== [PASSED] lmtt =======================
[18:27:45] ================= pf_service (11 subtests) =================
[18:27:45] [PASSED] pf_negotiate_any
[18:27:45] [PASSED] pf_negotiate_base_match
[18:27:45] [PASSED] pf_negotiate_base_newer
[18:27:45] [PASSED] pf_negotiate_base_next
[18:27:45] [SKIPPED] pf_negotiate_base_older
[18:27:45] [PASSED] pf_negotiate_base_prev
[18:27:45] [PASSED] pf_negotiate_latest_match
[18:27:45] [PASSED] pf_negotiate_latest_newer
[18:27:45] [PASSED] pf_negotiate_latest_next
[18:27:45] [SKIPPED] pf_negotiate_latest_older
[18:27:45] [SKIPPED] pf_negotiate_latest_prev
[18:27:45] =================== [PASSED] pf_service ====================
[18:27:45] ================= xe_guc_g2g (2 subtests) ==================
[18:27:45] ============== xe_live_guc_g2g_kunit_default  ==============
[18:27:45] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[18:27:45] ============== xe_live_guc_g2g_kunit_allmem  ===============
[18:27:45] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[18:27:45] =================== [SKIPPED] xe_guc_g2g ===================
[18:27:45] =================== xe_mocs (2 subtests) ===================
[18:27:45] ================ xe_live_mocs_kernel_kunit  ================
[18:27:45] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[18:27:45] ================ xe_live_mocs_reset_kunit  =================
[18:27:45] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[18:27:45] ==================== [SKIPPED] xe_mocs =====================
[18:27:45] ================= xe_migrate (2 subtests) ==================
[18:27:45] ================= xe_migrate_sanity_kunit  =================
[18:27:45] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[18:27:45] ================== xe_validate_ccs_kunit  ==================
[18:27:45] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[18:27:45] =================== [SKIPPED] xe_migrate ===================
[18:27:45] ================== xe_dma_buf (1 subtest) ==================
[18:27:45] ==================== xe_dma_buf_kunit  =====================
[18:27:45] ================ [SKIPPED] xe_dma_buf_kunit ================
[18:27:45] =================== [SKIPPED] xe_dma_buf ===================
[18:27:45] ================= xe_bo_shrink (1 subtest) =================
[18:27:45] =================== xe_bo_shrink_kunit  ====================
[18:27:45] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[18:27:45] ================== [SKIPPED] xe_bo_shrink ==================
[18:27:45] ==================== xe_bo (2 subtests) ====================
[18:27:45] ================== xe_ccs_migrate_kunit  ===================
[18:27:45] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[18:27:45] ==================== xe_bo_evict_kunit  ====================
[18:27:45] =============== [SKIPPED] xe_bo_evict_kunit ================
[18:27:45] ===================== [SKIPPED] xe_bo ======================
[18:27:45] ==================== args (13 subtests) ====================
[18:27:45] [PASSED] count_args_test
[18:27:45] [PASSED] call_args_example
[18:27:45] [PASSED] call_args_test
[18:27:45] [PASSED] drop_first_arg_example
[18:27:45] [PASSED] drop_first_arg_test
[18:27:45] [PASSED] first_arg_example
[18:27:45] [PASSED] first_arg_test
[18:27:45] [PASSED] last_arg_example
[18:27:45] [PASSED] last_arg_test
[18:27:45] [PASSED] pick_arg_example
[18:27:45] [PASSED] if_args_example
[18:27:45] [PASSED] if_args_test
[18:27:45] [PASSED] sep_comma_example
[18:27:45] ====================== [PASSED] args =======================
[18:27:45] =================== xe_pci (3 subtests) ====================
[18:27:45] ==================== check_graphics_ip  ====================
[18:27:45] [PASSED] 12.00 Xe_LP
[18:27:45] [PASSED] 12.10 Xe_LP+
[18:27:45] [PASSED] 12.55 Xe_HPG
[18:27:45] [PASSED] 12.60 Xe_HPC
[18:27:45] [PASSED] 12.70 Xe_LPG
[18:27:45] [PASSED] 12.71 Xe_LPG
[18:27:45] [PASSED] 12.74 Xe_LPG+
[18:27:45] [PASSED] 20.01 Xe2_HPG
[18:27:45] [PASSED] 20.02 Xe2_HPG
[18:27:45] [PASSED] 20.04 Xe2_LPG
[18:27:45] [PASSED] 30.00 Xe3_LPG
[18:27:45] [PASSED] 30.01 Xe3_LPG
[18:27:45] [PASSED] 30.03 Xe3_LPG
[18:27:45] [PASSED] 30.04 Xe3_LPG
[18:27:45] [PASSED] 30.05 Xe3_LPG
[18:27:45] [PASSED] 35.10 Xe3p_LPG
[18:27:45] [PASSED] 35.11 Xe3p_XPC
[18:27:45] ================ [PASSED] check_graphics_ip ================
[18:27:45] ===================== check_media_ip  ======================
[18:27:45] [PASSED] 12.00 Xe_M
[18:27:45] [PASSED] 12.55 Xe_HPM
[18:27:45] [PASSED] 13.00 Xe_LPM+
[18:27:45] [PASSED] 13.01 Xe2_HPM
[18:27:45] [PASSED] 20.00 Xe2_LPM
[18:27:45] [PASSED] 30.00 Xe3_LPM
[18:27:45] [PASSED] 30.02 Xe3_LPM
[18:27:45] [PASSED] 35.00 Xe3p_LPM
[18:27:45] [PASSED] 35.03 Xe3p_HPM
[18:27:45] ================= [PASSED] check_media_ip ==================
[18:27:45] =================== check_platform_desc  ===================
[18:27:45] [PASSED] 0x9A60 (TIGERLAKE)
[18:27:45] [PASSED] 0x9A68 (TIGERLAKE)
[18:27:45] [PASSED] 0x9A70 (TIGERLAKE)
[18:27:45] [PASSED] 0x9A40 (TIGERLAKE)
[18:27:45] [PASSED] 0x9A49 (TIGERLAKE)
[18:27:45] [PASSED] 0x9A59 (TIGERLAKE)
[18:27:45] [PASSED] 0x9A78 (TIGERLAKE)
[18:27:45] [PASSED] 0x9AC0 (TIGERLAKE)
[18:27:45] [PASSED] 0x9AC9 (TIGERLAKE)
[18:27:45] [PASSED] 0x9AD9 (TIGERLAKE)
[18:27:45] [PASSED] 0x9AF8 (TIGERLAKE)
[18:27:45] [PASSED] 0x4C80 (ROCKETLAKE)
[18:27:45] [PASSED] 0x4C8A (ROCKETLAKE)
[18:27:45] [PASSED] 0x4C8B (ROCKETLAKE)
[18:27:45] [PASSED] 0x4C8C (ROCKETLAKE)
[18:27:45] [PASSED] 0x4C90 (ROCKETLAKE)
[18:27:45] [PASSED] 0x4C9A (ROCKETLAKE)
[18:27:45] [PASSED] 0x4680 (ALDERLAKE_S)
[18:27:45] [PASSED] 0x4682 (ALDERLAKE_S)
[18:27:45] [PASSED] 0x4688 (ALDERLAKE_S)
[18:27:45] [PASSED] 0x468A (ALDERLAKE_S)
[18:27:45] [PASSED] 0x468B (ALDERLAKE_S)
[18:27:45] [PASSED] 0x4690 (ALDERLAKE_S)
[18:27:45] [PASSED] 0x4692 (ALDERLAKE_S)
[18:27:45] [PASSED] 0x4693 (ALDERLAKE_S)
[18:27:45] [PASSED] 0x46A0 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46A1 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46A2 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46A3 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46A6 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46A8 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46AA (ALDERLAKE_P)
[18:27:45] [PASSED] 0x462A (ALDERLAKE_P)
[18:27:45] [PASSED] 0x4626 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x4628 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46B0 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46B1 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46B2 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46B3 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46C0 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46C1 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46C2 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46C3 (ALDERLAKE_P)
[18:27:45] [PASSED] 0x46D0 (ALDERLAKE_N)
[18:27:45] [PASSED] 0x46D1 (ALDERLAKE_N)
[18:27:45] [PASSED] 0x46D2 (ALDERLAKE_N)
[18:27:45] [PASSED] 0x46D3 (ALDERLAKE_N)
[18:27:45] [PASSED] 0x46D4 (ALDERLAKE_N)
[18:27:45] [PASSED] 0xA721 (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7A1 (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7A9 (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7AC (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7AD (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA720 (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7A0 (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7A8 (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7AA (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA7AB (ALDERLAKE_P)
[18:27:45] [PASSED] 0xA780 (ALDERLAKE_S)
[18:27:45] [PASSED] 0xA781 (ALDERLAKE_S)
[18:27:45] [PASSED] 0xA782 (ALDERLAKE_S)
[18:27:45] [PASSED] 0xA783 (ALDERLAKE_S)
[18:27:45] [PASSED] 0xA788 (ALDERLAKE_S)
[18:27:45] [PASSED] 0xA789 (ALDERLAKE_S)
[18:27:45] [PASSED] 0xA78A (ALDERLAKE_S)
[18:27:45] [PASSED] 0xA78B (ALDERLAKE_S)
[18:27:45] [PASSED] 0x4905 (DG1)
[18:27:45] [PASSED] 0x4906 (DG1)
[18:27:45] [PASSED] 0x4907 (DG1)
[18:27:45] [PASSED] 0x4908 (DG1)
[18:27:45] [PASSED] 0x4909 (DG1)
[18:27:45] [PASSED] 0x56C0 (DG2)
[18:27:45] [PASSED] 0x56C2 (DG2)
[18:27:45] [PASSED] 0x56C1 (DG2)
[18:27:45] [PASSED] 0x7D51 (METEORLAKE)
[18:27:45] [PASSED] 0x7DD1 (METEORLAKE)
[18:27:45] [PASSED] 0x7D41 (METEORLAKE)
[18:27:45] [PASSED] 0x7D67 (METEORLAKE)
[18:27:45] [PASSED] 0xB640 (METEORLAKE)
[18:27:45] [PASSED] 0x56A0 (DG2)
[18:27:45] [PASSED] 0x56A1 (DG2)
[18:27:45] [PASSED] 0x56A2 (DG2)
[18:27:45] [PASSED] 0x56BE (DG2)
[18:27:45] [PASSED] 0x56BF (DG2)
[18:27:45] [PASSED] 0x5690 (DG2)
[18:27:45] [PASSED] 0x5691 (DG2)
[18:27:45] [PASSED] 0x5692 (DG2)
[18:27:45] [PASSED] 0x56A5 (DG2)
[18:27:45] [PASSED] 0x56A6 (DG2)
[18:27:45] [PASSED] 0x56B0 (DG2)
[18:27:45] [PASSED] 0x56B1 (DG2)
[18:27:45] [PASSED] 0x56BA (DG2)
[18:27:45] [PASSED] 0x56BB (DG2)
[18:27:45] [PASSED] 0x56BC (DG2)
[18:27:45] [PASSED] 0x56BD (DG2)
[18:27:45] [PASSED] 0x5693 (DG2)
[18:27:45] [PASSED] 0x5694 (DG2)
[18:27:45] [PASSED] 0x5695 (DG2)
[18:27:45] [PASSED] 0x56A3 (DG2)
[18:27:45] [PASSED] 0x56A4 (DG2)
[18:27:45] [PASSED] 0x56B2 (DG2)
[18:27:45] [PASSED] 0x56B3 (DG2)
[18:27:45] [PASSED] 0x5696 (DG2)
[18:27:45] [PASSED] 0x5697 (DG2)
[18:27:45] [PASSED] 0xB69 (PVC)
[18:27:45] [PASSED] 0xB6E (PVC)
[18:27:45] [PASSED] 0xBD4 (PVC)
[18:27:45] [PASSED] 0xBD5 (PVC)
[18:27:45] [PASSED] 0xBD6 (PVC)
[18:27:45] [PASSED] 0xBD7 (PVC)
[18:27:45] [PASSED] 0xBD8 (PVC)
[18:27:45] [PASSED] 0xBD9 (PVC)
[18:27:45] [PASSED] 0xBDA (PVC)
[18:27:45] [PASSED] 0xBDB (PVC)
[18:27:45] [PASSED] 0xBE0 (PVC)
[18:27:45] [PASSED] 0xBE1 (PVC)
[18:27:45] [PASSED] 0xBE5 (PVC)
[18:27:45] [PASSED] 0x7D40 (METEORLAKE)
[18:27:45] [PASSED] 0x7D45 (METEORLAKE)
[18:27:45] [PASSED] 0x7D55 (METEORLAKE)
[18:27:45] [PASSED] 0x7D60 (METEORLAKE)
[18:27:45] [PASSED] 0x7DD5 (METEORLAKE)
[18:27:45] [PASSED] 0x6420 (LUNARLAKE)
[18:27:45] [PASSED] 0x64A0 (LUNARLAKE)
[18:27:45] [PASSED] 0x64B0 (LUNARLAKE)
[18:27:45] [PASSED] 0xE202 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE209 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE20B (BATTLEMAGE)
[18:27:45] [PASSED] 0xE20C (BATTLEMAGE)
[18:27:45] [PASSED] 0xE20D (BATTLEMAGE)
[18:27:45] [PASSED] 0xE210 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE211 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE212 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE216 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE220 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE221 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE222 (BATTLEMAGE)
[18:27:45] [PASSED] 0xE223 (BATTLEMAGE)
[18:27:45] [PASSED] 0xB080 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB081 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB082 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB083 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB084 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB085 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB086 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB087 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB08F (PANTHERLAKE)
[18:27:45] [PASSED] 0xB090 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB0A0 (PANTHERLAKE)
[18:27:45] [PASSED] 0xB0B0 (PANTHERLAKE)
[18:27:45] [PASSED] 0xFD80 (PANTHERLAKE)
[18:27:45] [PASSED] 0xFD81 (PANTHERLAKE)
[18:27:45] [PASSED] 0xD740 (NOVALAKE_S)
[18:27:45] [PASSED] 0xD741 (NOVALAKE_S)
[18:27:45] [PASSED] 0xD742 (NOVALAKE_S)
[18:27:45] [PASSED] 0xD743 (NOVALAKE_S)
[18:27:45] [PASSED] 0xD744 (NOVALAKE_S)
[18:27:45] [PASSED] 0xD745 (NOVALAKE_S)
[18:27:45] [PASSED] 0x674C (CRESCENTISLAND)
[18:27:45] [PASSED] 0xD750 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD751 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD752 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD753 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD754 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD755 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD756 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD757 (NOVALAKE_P)
[18:27:45] [PASSED] 0xD75F (NOVALAKE_P)
[18:27:45] =============== [PASSED] check_platform_desc ===============
[18:27:45] ===================== [PASSED] xe_pci ======================
[18:27:45] =================== xe_rtp (2 subtests) ====================
[18:27:45] =============== xe_rtp_process_to_sr_tests  ================
[18:27:45] [PASSED] coalesce-same-reg
[18:27:45] [PASSED] no-match-no-add
[18:27:45] [PASSED] match-or
[18:27:45] [PASSED] match-or-xfail
[18:27:45] [PASSED] no-match-no-add-multiple-rules
[18:27:45] [PASSED] two-regs-two-entries
[18:27:45] [PASSED] clr-one-set-other
[18:27:45] [PASSED] set-field
[18:27:45] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[18:27:45] [PASSED] conflict-not-disjoint
[18:27:45] [PASSED] conflict-reg-type
[18:27:45] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[18:27:45] ================== xe_rtp_process_tests  ===================
[18:27:45] [PASSED] active1
[18:27:45] [PASSED] active2
[18:27:45] [PASSED] active-inactive
[18:27:45] [PASSED] inactive-active
[18:27:45] [PASSED] inactive-1st_or_active-inactive
[18:27:45] [PASSED] inactive-2nd_or_active-inactive
[18:27:45] [PASSED] inactive-last_or_active-inactive
[18:27:45] [PASSED] inactive-no_or_active-inactive
[18:27:45] ============== [PASSED] xe_rtp_process_tests ===============
[18:27:45] ===================== [PASSED] xe_rtp ======================
[18:27:45] ==================== xe_wa (1 subtest) =====================
[18:27:45] ======================== xe_wa_gt  =========================
[18:27:45] [PASSED] TIGERLAKE B0
[18:27:45] [PASSED] DG1 A0
[18:27:45] [PASSED] DG1 B0
[18:27:45] [PASSED] ALDERLAKE_S A0
[18:27:45] [PASSED] ALDERLAKE_S B0
[18:27:45] [PASSED] ALDERLAKE_S C0
[18:27:45] [PASSED] ALDERLAKE_S D0
[18:27:45] [PASSED] ALDERLAKE_P A0
[18:27:45] [PASSED] ALDERLAKE_P B0
[18:27:45] [PASSED] ALDERLAKE_P C0
[18:27:45] [PASSED] ALDERLAKE_S RPLS D0
[18:27:45] [PASSED] ALDERLAKE_P RPLU E0
[18:27:45] [PASSED] DG2 G10 C0
[18:27:45] [PASSED] DG2 G11 B1
[18:27:45] [PASSED] DG2 G12 A1
[18:27:45] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[18:27:45] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[18:27:45] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[18:27:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[18:27:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[18:27:45] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[18:27:45] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[18:27:45] ==================== [PASSED] xe_wa_gt =====================
[18:27:45] ====================== [PASSED] xe_wa ======================
[18:27:45] ============================================================
[18:27:45] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[18:27:45] Elapsed time: 36.170s total, 4.198s configuring, 31.353s building, 0.605s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:27:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:27:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:28:11] Starting KUnit Kernel (1/1)...
[18:28:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:28:11] ============ drm_test_pick_cmdline (2 subtests) ============
[18:28:11] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:28:11] =============== drm_test_pick_cmdline_named  ===============
[18:28:11] [PASSED] NTSC
[18:28:11] [PASSED] NTSC-J
[18:28:11] [PASSED] PAL
[18:28:11] [PASSED] PAL-M
[18:28:11] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:28:11] ============== [PASSED] drm_test_pick_cmdline ==============
[18:28:11] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[18:28:11] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[18:28:11] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[18:28:11] =========== drm_validate_clone_mode (2 subtests) ===========
[18:28:11] ============== drm_test_check_in_clone_mode  ===============
[18:28:11] [PASSED] in_clone_mode
[18:28:11] [PASSED] not_in_clone_mode
[18:28:11] ========== [PASSED] drm_test_check_in_clone_mode ===========
[18:28:11] =============== drm_test_check_valid_clones  ===============
[18:28:11] [PASSED] not_in_clone_mode
[18:28:11] [PASSED] valid_clone
[18:28:11] [PASSED] invalid_clone
[18:28:11] =========== [PASSED] drm_test_check_valid_clones ===========
[18:28:11] ============= [PASSED] drm_validate_clone_mode =============
[18:28:11] ============= drm_validate_modeset (1 subtest) =============
[18:28:11] [PASSED] drm_test_check_connector_changed_modeset
[18:28:11] ============== [PASSED] drm_validate_modeset ===============
[18:28:11] ====== drm_test_bridge_get_current_state (2 subtests) ======
[18:28:11] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[18:28:11] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[18:28:11] ======== [PASSED] drm_test_bridge_get_current_state ========
[18:28:11] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[18:28:11] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[18:28:11] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[18:28:11] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[18:28:11] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[18:28:11] ============== drm_bridge_alloc (2 subtests) ===============
[18:28:11] [PASSED] drm_test_drm_bridge_alloc_basic
[18:28:11] [PASSED] drm_test_drm_bridge_alloc_get_put
[18:28:11] ================ [PASSED] drm_bridge_alloc =================
[18:28:11] ============= drm_cmdline_parser (40 subtests) =============
[18:28:11] [PASSED] drm_test_cmdline_force_d_only
[18:28:11] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:28:11] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:28:11] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:28:11] [PASSED] drm_test_cmdline_force_e_only
[18:28:11] [PASSED] drm_test_cmdline_res
[18:28:11] [PASSED] drm_test_cmdline_res_vesa
[18:28:11] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:28:11] [PASSED] drm_test_cmdline_res_rblank
[18:28:11] [PASSED] drm_test_cmdline_res_bpp
[18:28:11] [PASSED] drm_test_cmdline_res_refresh
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:28:11] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:28:11] [PASSED] drm_test_cmdline_res_margins_force_on
[18:28:11] [PASSED] drm_test_cmdline_res_vesa_margins
[18:28:11] [PASSED] drm_test_cmdline_name
[18:28:11] [PASSED] drm_test_cmdline_name_bpp
[18:28:11] [PASSED] drm_test_cmdline_name_option
[18:28:11] [PASSED] drm_test_cmdline_name_bpp_option
[18:28:11] [PASSED] drm_test_cmdline_rotate_0
[18:28:11] [PASSED] drm_test_cmdline_rotate_90
[18:28:11] [PASSED] drm_test_cmdline_rotate_180
[18:28:11] [PASSED] drm_test_cmdline_rotate_270
[18:28:11] [PASSED] drm_test_cmdline_hmirror
[18:28:11] [PASSED] drm_test_cmdline_vmirror
[18:28:11] [PASSED] drm_test_cmdline_margin_options
[18:28:11] [PASSED] drm_test_cmdline_multiple_options
[18:28:11] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:28:11] [PASSED] drm_test_cmdline_extra_and_option
[18:28:11] [PASSED] drm_test_cmdline_freestanding_options
[18:28:11] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:28:11] [PASSED] drm_test_cmdline_panel_orientation
[18:28:11] ================ drm_test_cmdline_invalid  =================
[18:28:11] [PASSED] margin_only
[18:28:11] [PASSED] interlace_only
[18:28:11] [PASSED] res_missing_x
[18:28:11] [PASSED] res_missing_y
[18:28:11] [PASSED] res_bad_y
[18:28:11] [PASSED] res_missing_y_bpp
[18:28:11] [PASSED] res_bad_bpp
[18:28:11] [PASSED] res_bad_refresh
[18:28:11] [PASSED] res_bpp_refresh_force_on_off
[18:28:11] [PASSED] res_invalid_mode
[18:28:11] [PASSED] res_bpp_wrong_place_mode
[18:28:11] [PASSED] name_bpp_refresh
[18:28:11] [PASSED] name_refresh
[18:28:11] [PASSED] name_refresh_wrong_mode
[18:28:11] [PASSED] name_refresh_invalid_mode
[18:28:11] [PASSED] rotate_multiple
[18:28:11] [PASSED] rotate_invalid_val
[18:28:11] [PASSED] rotate_truncated
[18:28:11] [PASSED] invalid_option
[18:28:11] [PASSED] invalid_tv_option
[18:28:11] [PASSED] truncated_tv_option
[18:28:11] ============ [PASSED] drm_test_cmdline_invalid =============
[18:28:11] =============== drm_test_cmdline_tv_options  ===============
[18:28:11] [PASSED] NTSC
[18:28:11] [PASSED] NTSC_443
[18:28:11] [PASSED] NTSC_J
[18:28:11] [PASSED] PAL
[18:28:11] [PASSED] PAL_M
[18:28:11] [PASSED] PAL_N
[18:28:11] [PASSED] SECAM
[18:28:11] [PASSED] MONO_525
[18:28:11] [PASSED] MONO_625
[18:28:11] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:28:11] =============== [PASSED] drm_cmdline_parser ================
[18:28:11] ========== drmm_connector_hdmi_init (20 subtests) ==========
[18:28:11] [PASSED] drm_test_connector_hdmi_init_valid
[18:28:11] [PASSED] drm_test_connector_hdmi_init_bpc_8
[18:28:11] [PASSED] drm_test_connector_hdmi_init_bpc_10
[18:28:11] [PASSED] drm_test_connector_hdmi_init_bpc_12
[18:28:11] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[18:28:11] [PASSED] drm_test_connector_hdmi_init_bpc_null
[18:28:11] [PASSED] drm_test_connector_hdmi_init_formats_empty
[18:28:11] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[18:28:11] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[18:28:11] [PASSED] supported_formats=0x9 yuv420_allowed=1
[18:28:11] [PASSED] supported_formats=0x9 yuv420_allowed=0
[18:28:11] [PASSED] supported_formats=0x5 yuv420_allowed=1
[18:28:11] [PASSED] supported_formats=0x5 yuv420_allowed=0
[18:28:11] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[18:28:11] [PASSED] drm_test_connector_hdmi_init_null_ddc
[18:28:11] [PASSED] drm_test_connector_hdmi_init_null_product
[18:28:11] [PASSED] drm_test_connector_hdmi_init_null_vendor
[18:28:11] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[18:28:11] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[18:28:11] [PASSED] drm_test_connector_hdmi_init_product_valid
[18:28:11] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[18:28:11] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[18:28:11] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[18:28:11] ========= drm_test_connector_hdmi_init_type_valid  =========
[18:28:11] [PASSED] HDMI-A
[18:28:11] [PASSED] HDMI-B
[18:28:11] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[18:28:11] ======== drm_test_connector_hdmi_init_type_invalid  ========
[18:28:11] [PASSED] Unknown
[18:28:11] [PASSED] VGA
[18:28:11] [PASSED] DVI-I
[18:28:11] [PASSED] DVI-D
[18:28:11] [PASSED] DVI-A
[18:28:11] [PASSED] Composite
[18:28:11] [PASSED] SVIDEO
[18:28:11] [PASSED] LVDS
[18:28:11] [PASSED] Component
[18:28:11] [PASSED] DIN
[18:28:11] [PASSED] DP
[18:28:11] [PASSED] TV
[18:28:11] [PASSED] eDP
[18:28:11] [PASSED] Virtual
[18:28:11] [PASSED] DSI
[18:28:11] [PASSED] DPI
[18:28:11] [PASSED] Writeback
[18:28:11] [PASSED] SPI
[18:28:11] [PASSED] USB
[18:28:11] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[18:28:11] ============ [PASSED] drmm_connector_hdmi_init =============
[18:28:11] ============= drmm_connector_init (3 subtests) =============
[18:28:11] [PASSED] drm_test_drmm_connector_init
[18:28:11] [PASSED] drm_test_drmm_connector_init_null_ddc
[18:28:11] ========= drm_test_drmm_connector_init_type_valid  =========
[18:28:11] [PASSED] Unknown
[18:28:11] [PASSED] VGA
[18:28:11] [PASSED] DVI-I
[18:28:11] [PASSED] DVI-D
[18:28:11] [PASSED] DVI-A
[18:28:11] [PASSED] Composite
[18:28:11] [PASSED] SVIDEO
[18:28:11] [PASSED] LVDS
[18:28:11] [PASSED] Component
[18:28:11] [PASSED] DIN
[18:28:11] [PASSED] DP
[18:28:11] [PASSED] HDMI-A
[18:28:11] [PASSED] HDMI-B
[18:28:11] [PASSED] TV
[18:28:11] [PASSED] eDP
[18:28:11] [PASSED] Virtual
[18:28:11] [PASSED] DSI
[18:28:11] [PASSED] DPI
[18:28:11] [PASSED] Writeback
[18:28:11] [PASSED] SPI
[18:28:11] [PASSED] USB
[18:28:11] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[18:28:11] =============== [PASSED] drmm_connector_init ===============
[18:28:11] ========= drm_connector_dynamic_init (6 subtests) ==========
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_init
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_init_properties
[18:28:11] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[18:28:11] [PASSED] Unknown
[18:28:11] [PASSED] VGA
[18:28:11] [PASSED] DVI-I
[18:28:11] [PASSED] DVI-D
[18:28:11] [PASSED] DVI-A
[18:28:11] [PASSED] Composite
[18:28:11] [PASSED] SVIDEO
[18:28:11] [PASSED] LVDS
[18:28:11] [PASSED] Component
[18:28:11] [PASSED] DIN
[18:28:11] [PASSED] DP
[18:28:11] [PASSED] HDMI-A
[18:28:11] [PASSED] HDMI-B
[18:28:11] [PASSED] TV
[18:28:11] [PASSED] eDP
[18:28:11] [PASSED] Virtual
[18:28:11] [PASSED] DSI
[18:28:11] [PASSED] DPI
[18:28:11] [PASSED] Writeback
[18:28:11] [PASSED] SPI
[18:28:11] [PASSED] USB
[18:28:11] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[18:28:11] ======== drm_test_drm_connector_dynamic_init_name  =========
[18:28:11] [PASSED] Unknown
[18:28:11] [PASSED] VGA
[18:28:11] [PASSED] DVI-I
[18:28:11] [PASSED] DVI-D
[18:28:11] [PASSED] DVI-A
[18:28:11] [PASSED] Composite
[18:28:11] [PASSED] SVIDEO
[18:28:11] [PASSED] LVDS
[18:28:11] [PASSED] Component
[18:28:11] [PASSED] DIN
[18:28:11] [PASSED] DP
[18:28:11] [PASSED] HDMI-A
[18:28:11] [PASSED] HDMI-B
[18:28:11] [PASSED] TV
[18:28:11] [PASSED] eDP
[18:28:11] [PASSED] Virtual
[18:28:11] [PASSED] DSI
[18:28:11] [PASSED] DPI
[18:28:11] [PASSED] Writeback
[18:28:11] [PASSED] SPI
[18:28:11] [PASSED] USB
[18:28:11] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[18:28:11] =========== [PASSED] drm_connector_dynamic_init ============
[18:28:11] ==== drm_connector_dynamic_register_early (4 subtests) =====
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[18:28:11] ====== [PASSED] drm_connector_dynamic_register_early =======
[18:28:11] ======= drm_connector_dynamic_register (7 subtests) ========
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[18:28:11] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[18:28:11] ========= [PASSED] drm_connector_dynamic_register ==========
[18:28:11] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[18:28:11] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[18:28:11] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[18:28:11] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[18:28:11] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:28:11] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:28:11] [PASSED] NTSC
[18:28:11] [PASSED] NTSC-443
[18:28:11] [PASSED] NTSC-J
[18:28:11] [PASSED] PAL
[18:28:11] [PASSED] PAL-M
[18:28:11] [PASSED] PAL-N
[18:28:11] [PASSED] SECAM
[18:28:11] [PASSED] Mono
[18:28:11] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:28:11] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:28:11] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:28:11] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[18:28:11] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[18:28:11] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[18:28:11] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[18:28:11] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[18:28:11] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[18:28:11] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[18:28:11] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[18:28:11] [PASSED] VIC 96
[18:28:11] [PASSED] VIC 97
[18:28:11] [PASSED] VIC 101
[18:28:11] [PASSED] VIC 102
[18:28:11] [PASSED] VIC 106
[18:28:11] [PASSED] VIC 107
[18:28:11] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[18:28:11] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[18:28:11] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[18:28:11] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[18:28:11] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[18:28:11] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[18:28:11] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[18:28:11] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[18:28:11] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[18:28:11] [PASSED] Automatic
[18:28:11] [PASSED] Full
[18:28:11] [PASSED] Limited 16:235
[18:28:11] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[18:28:11] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[18:28:11] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[18:28:11] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[18:28:11] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[18:28:11] [PASSED] RGB
[18:28:11] [PASSED] YUV 4:2:0
[18:28:11] [PASSED] YUV 4:2:2
[18:28:11] [PASSED] YUV 4:4:4
[18:28:11] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[18:28:11] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[18:28:11] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[18:28:11] ============= drm_damage_helper (21 subtests) ==============
[18:28:11] [PASSED] drm_test_damage_iter_no_damage
[18:28:11] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:28:11] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:28:11] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:28:11] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:28:11] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:28:11] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:28:11] [PASSED] drm_test_damage_iter_simple_damage
[18:28:11] [PASSED] drm_test_damage_iter_single_damage
[18:28:11] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:28:11] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:28:11] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:28:11] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:28:11] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:28:11] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:28:11] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:28:11] [PASSED] drm_test_damage_iter_damage
[18:28:11] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:28:11] [PASSED] drm_test_damage_iter_damage_one_outside
[18:28:11] [PASSED] drm_test_damage_iter_damage_src_moved
[18:28:11] [PASSED] drm_test_damage_iter_damage_not_visible
[18:28:11] ================ [PASSED] drm_damage_helper ================
[18:28:11] ============== drm_dp_mst_helper (3 subtests) ==============
[18:28:11] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:28:11] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:28:11] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:28:11] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:28:11] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:28:11] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:28:11] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:28:11] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:28:11] [PASSED] Link rate 2000000 lane count 4
[18:28:11] [PASSED] Link rate 2000000 lane count 2
[18:28:11] [PASSED] Link rate 2000000 lane count 1
[18:28:11] [PASSED] Link rate 1350000 lane count 4
[18:28:11] [PASSED] Link rate 1350000 lane count 2
[18:28:11] [PASSED] Link rate 1350000 lane count 1
[18:28:11] [PASSED] Link rate 1000000 lane count 4
[18:28:11] [PASSED] Link rate 1000000 lane count 2
[18:28:11] [PASSED] Link rate 1000000 lane count 1
[18:28:11] [PASSED] Link rate 810000 lane count 4
[18:28:11] [PASSED] Link rate 810000 lane count 2
[18:28:11] [PASSED] Link rate 810000 lane count 1
[18:28:11] [PASSED] Link rate 540000 lane count 4
[18:28:11] [PASSED] Link rate 540000 lane count 2
[18:28:11] [PASSED] Link rate 540000 lane count 1
[18:28:11] [PASSED] Link rate 270000 lane count 4
[18:28:11] [PASSED] Link rate 270000 lane count 2
[18:28:11] [PASSED] Link rate 270000 lane count 1
[18:28:11] [PASSED] Link rate 162000 lane count 4
[18:28:11] [PASSED] Link rate 162000 lane count 2
[18:28:11] [PASSED] Link rate 162000 lane count 1
[18:28:11] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:28:11] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:28:11] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:28:11] [PASSED] DP_POWER_UP_PHY with port number
[18:28:11] [PASSED] DP_POWER_DOWN_PHY with port number
[18:28:11] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:28:11] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:28:11] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:28:11] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:28:11] [PASSED] DP_QUERY_PAYLOAD with port number
[18:28:11] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:28:11] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:28:11] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:28:11] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:28:11] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:28:11] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:28:11] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:28:11] [PASSED] DP_REMOTE_I2C_READ with port number
[18:28:11] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:28:11] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:28:11] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:28:11] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:28:11] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:28:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:28:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:28:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:28:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:28:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:28:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:28:11] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:28:11] ================ [PASSED] drm_dp_mst_helper ================
[18:28:11] ================== drm_exec (7 subtests) ===================
[18:28:11] [PASSED] sanitycheck
[18:28:11] [PASSED] test_lock
[18:28:11] [PASSED] test_lock_unlock
[18:28:11] [PASSED] test_duplicates
[18:28:11] [PASSED] test_prepare
[18:28:11] [PASSED] test_prepare_array
[18:28:11] [PASSED] test_multiple_loops
[18:28:11] ==================== [PASSED] drm_exec =====================
[18:28:11] =========== drm_format_helper_test (17 subtests) ===========
[18:28:11] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:28:11] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:28:11] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:28:11] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:28:11] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:28:11] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:28:11] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:28:11] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[18:28:11] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:28:11] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:28:11] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:28:11] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:28:11] ==================== drm_test_fb_swab  =====================
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ================ [PASSED] drm_test_fb_swab =================
[18:28:11] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:28:11] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:28:11] [PASSED] single_pixel_source_buffer
[18:28:11] [PASSED] single_pixel_clip_rectangle
[18:28:11] [PASSED] well_known_colors
[18:28:11] [PASSED] destination_pitch
[18:28:11] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:28:11] ================= drm_test_fb_clip_offset  =================
[18:28:11] [PASSED] pass through
[18:28:11] [PASSED] horizontal offset
[18:28:11] [PASSED] vertical offset
[18:28:11] [PASSED] horizontal and vertical offset
[18:28:11] [PASSED] horizontal offset (custom pitch)
[18:28:11] [PASSED] vertical offset (custom pitch)
[18:28:11] [PASSED] horizontal and vertical offset (custom pitch)
[18:28:11] ============= [PASSED] drm_test_fb_clip_offset =============
[18:28:11] =================== drm_test_fb_memcpy  ====================
[18:28:11] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:28:11] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:28:11] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:28:11] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:28:11] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:28:11] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:28:11] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:28:11] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:28:11] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:28:11] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:28:11] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:28:11] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:28:11] =============== [PASSED] drm_test_fb_memcpy ================
[18:28:11] ============= [PASSED] drm_format_helper_test ==============
[18:28:11] ================= drm_format (18 subtests) =================
[18:28:11] [PASSED] drm_test_format_block_width_invalid
[18:28:11] [PASSED] drm_test_format_block_width_one_plane
[18:28:11] [PASSED] drm_test_format_block_width_two_plane
[18:28:11] [PASSED] drm_test_format_block_width_three_plane
[18:28:11] [PASSED] drm_test_format_block_width_tiled
[18:28:11] [PASSED] drm_test_format_block_height_invalid
[18:28:11] [PASSED] drm_test_format_block_height_one_plane
[18:28:11] [PASSED] drm_test_format_block_height_two_plane
[18:28:11] [PASSED] drm_test_format_block_height_three_plane
[18:28:11] [PASSED] drm_test_format_block_height_tiled
[18:28:11] [PASSED] drm_test_format_min_pitch_invalid
[18:28:11] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:28:11] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:28:11] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:28:11] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:28:11] [PASSED] drm_test_format_min_pitch_two_plane
[18:28:11] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:28:11] [PASSED] drm_test_format_min_pitch_tiled
[18:28:11] =================== [PASSED] drm_format ====================
[18:28:11] ============== drm_framebuffer (10 subtests) ===============
[18:28:11] ========== drm_test_framebuffer_check_src_coords  ==========
[18:28:11] [PASSED] Success: source fits into fb
[18:28:11] [PASSED] Fail: overflowing fb with x-axis coordinate
[18:28:11] [PASSED] Fail: overflowing fb with y-axis coordinate
[18:28:11] [PASSED] Fail: overflowing fb with source width
[18:28:11] [PASSED] Fail: overflowing fb with source height
[18:28:11] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[18:28:11] [PASSED] drm_test_framebuffer_cleanup
[18:28:11] =============== drm_test_framebuffer_create  ===============
[18:28:11] [PASSED] ABGR8888 normal sizes
[18:28:11] [PASSED] ABGR8888 max sizes
[18:28:11] [PASSED] ABGR8888 pitch greater than min required
[18:28:11] [PASSED] ABGR8888 pitch less than min required
[18:28:11] [PASSED] ABGR8888 Invalid width
[18:28:11] [PASSED] ABGR8888 Invalid buffer handle
[18:28:11] [PASSED] No pixel format
[18:28:11] [PASSED] ABGR8888 Width 0
[18:28:11] [PASSED] ABGR8888 Height 0
[18:28:11] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:28:11] [PASSED] ABGR8888 Large buffer offset
[18:28:11] [PASSED] ABGR8888 Buffer offset for inexistent plane
[18:28:11] [PASSED] ABGR8888 Invalid flag
[18:28:11] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:28:11] [PASSED] ABGR8888 Valid buffer modifier
[18:28:11] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:28:11] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:28:11] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:28:11] [PASSED] NV12 Normal sizes
[18:28:11] [PASSED] NV12 Max sizes
[18:28:11] [PASSED] NV12 Invalid pitch
[18:28:11] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:28:11] [PASSED] NV12 different  modifier per-plane
[18:28:11] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:28:11] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:28:11] [PASSED] NV12 Modifier for inexistent plane
[18:28:11] [PASSED] NV12 Handle for inexistent plane
[18:28:11] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:28:11] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:28:11] [PASSED] YVU420 Normal sizes
[18:28:11] [PASSED] YVU420 Max sizes
[18:28:11] [PASSED] YVU420 Invalid pitch
[18:28:11] [PASSED] YVU420 Different pitches
[18:28:11] [PASSED] YVU420 Different buffer offsets/pitches
[18:28:11] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:28:11] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:28:11] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:28:11] [PASSED] YVU420 Valid modifier
[18:28:11] [PASSED] YVU420 Different modifiers per plane
[18:28:11] [PASSED] YVU420 Modifier for inexistent plane
[18:28:11] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[18:28:11] [PASSED] X0L2 Normal sizes
[18:28:11] [PASSED] X0L2 Max sizes
[18:28:11] [PASSED] X0L2 Invalid pitch
[18:28:11] [PASSED] X0L2 Pitch greater than minimum required
[18:28:11] [PASSED] X0L2 Handle for inexistent plane
[18:28:11] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:28:11] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:28:11] [PASSED] X0L2 Valid modifier
[18:28:11] [PASSED] X0L2 Modifier for inexistent plane
[18:28:11] =========== [PASSED] drm_test_framebuffer_create ===========
[18:28:11] [PASSED] drm_test_framebuffer_free
[18:28:11] [PASSED] drm_test_framebuffer_init
[18:28:11] [PASSED] drm_test_framebuffer_init_bad_format
[18:28:11] [PASSED] drm_test_framebuffer_init_dev_mismatch
[18:28:11] [PASSED] drm_test_framebuffer_lookup
[18:28:11] [PASSED] drm_test_framebuffer_lookup_inexistent
[18:28:11] [PASSED] drm_test_framebuffer_modifiers_not_supported
[18:28:11] ================= [PASSED] drm_framebuffer =================
[18:28:11] ================ drm_gem_shmem (8 subtests) ================
[18:28:11] [PASSED] drm_gem_shmem_test_obj_create
[18:28:11] [PASSED] drm_gem_shmem_test_obj_create_private
[18:28:11] [PASSED] drm_gem_shmem_test_pin_pages
[18:28:11] [PASSED] drm_gem_shmem_test_vmap
[18:28:11] [PASSED] drm_gem_shmem_test_get_sg_table
[18:28:11] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:28:11] [PASSED] drm_gem_shmem_test_madvise
[18:28:11] [PASSED] drm_gem_shmem_test_purge
[18:28:11] ================== [PASSED] drm_gem_shmem ==================
[18:28:11] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[18:28:11] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[18:28:11] [PASSED] Automatic
[18:28:11] [PASSED] Full
[18:28:11] [PASSED] Limited 16:235
[18:28:11] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[18:28:11] [PASSED] drm_test_check_disable_connector
[18:28:11] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[18:28:11] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[18:28:11] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[18:28:11] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[18:28:11] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[18:28:11] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[18:28:11] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[18:28:11] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[18:28:11] [PASSED] drm_test_check_output_bpc_dvi
[18:28:11] [PASSED] drm_test_check_output_bpc_format_vic_1
[18:28:11] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[18:28:11] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[18:28:11] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[18:28:11] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[18:28:11] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[18:28:11] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[18:28:11] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[18:28:11] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[18:28:11] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[18:28:11] [PASSED] drm_test_check_broadcast_rgb_value
[18:28:11] [PASSED] drm_test_check_bpc_8_value
[18:28:11] [PASSED] drm_test_check_bpc_10_value
[18:28:11] [PASSED] drm_test_check_bpc_12_value
[18:28:11] [PASSED] drm_test_check_format_value
[18:28:11] [PASSED] drm_test_check_tmds_char_value
[18:28:11] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[18:28:11] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[18:28:11] [PASSED] drm_test_check_mode_valid
[18:28:11] [PASSED] drm_test_check_mode_valid_reject
[18:28:11] [PASSED] drm_test_check_mode_valid_reject_rate
[18:28:11] [PASSED] drm_test_check_mode_valid_reject_max_clock
[18:28:11] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[18:28:11] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[18:28:11] [PASSED] drm_test_check_infoframes
[18:28:11] [PASSED] drm_test_check_reject_avi_infoframe
[18:28:11] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[18:28:11] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[18:28:11] [PASSED] drm_test_check_reject_audio_infoframe
[18:28:11] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[18:28:11] ================= drm_managed (2 subtests) =================
[18:28:11] [PASSED] drm_test_managed_release_action
[18:28:11] [PASSED] drm_test_managed_run_action
[18:28:11] =================== [PASSED] drm_managed ===================
[18:28:11] =================== drm_mm (6 subtests) ====================
[18:28:11] [PASSED] drm_test_mm_init
[18:28:11] [PASSED] drm_test_mm_debug
[18:28:11] [PASSED] drm_test_mm_align32
[18:28:11] [PASSED] drm_test_mm_align64
[18:28:11] [PASSED] drm_test_mm_lowest
[18:28:11] [PASSED] drm_test_mm_highest
[18:28:11] ===================== [PASSED] drm_mm ======================
[18:28:11] ============= drm_modes_analog_tv (5 subtests) =============
[18:28:11] [PASSED] drm_test_modes_analog_tv_mono_576i
[18:28:11] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:28:11] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:28:11] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:28:11] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:28:11] =============== [PASSED] drm_modes_analog_tv ===============
[18:28:11] ============== drm_plane_helper (2 subtests) ===============
[18:28:11] =============== drm_test_check_plane_state  ================
[18:28:11] [PASSED] clipping_simple
[18:28:11] [PASSED] clipping_rotate_reflect
[18:28:11] [PASSED] positioning_simple
[18:28:11] [PASSED] upscaling
[18:28:11] [PASSED] downscaling
[18:28:11] [PASSED] rounding1
[18:28:11] [PASSED] rounding2
[18:28:11] [PASSED] rounding3
[18:28:11] [PASSED] rounding4
[18:28:11] =========== [PASSED] drm_test_check_plane_state ============
[18:28:11] =========== drm_test_check_invalid_plane_state  ============
[18:28:11] [PASSED] positioning_invalid
[18:28:11] [PASSED] upscaling_invalid
[18:28:11] [PASSED] downscaling_invalid
[18:28:11] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:28:11] ================ [PASSED] drm_plane_helper =================
[18:28:11] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:28:11] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:28:11] [PASSED] None
[18:28:11] [PASSED] PAL
[18:28:11] [PASSED] NTSC
[18:28:11] [PASSED] Both, NTSC Default
[18:28:11] [PASSED] Both, PAL Default
[18:28:11] [PASSED] Both, NTSC Default, with PAL on command-line
[18:28:11] [PASSED] Both, PAL Default, with NTSC on command-line
[18:28:11] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:28:11] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:28:11] ================== drm_rect (9 subtests) ===================
[18:28:11] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:28:11] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:28:11] [PASSED] drm_test_rect_clip_scaled_clipped
[18:28:11] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:28:11] ================= drm_test_rect_intersect  =================
[18:28:11] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:28:11] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:28:11] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:28:11] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:28:11] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:28:11] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:28:11] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:28:11] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:28:11] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:28:11] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:28:11] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:28:11] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:28:11] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:28:11] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:28:11] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:28:11] ============= [PASSED] drm_test_rect_intersect =============
[18:28:11] ================ drm_test_rect_calc_hscale  ================
[18:28:11] [PASSED] normal use
[18:28:11] [PASSED] out of max range
[18:28:11] [PASSED] out of min range
[18:28:11] [PASSED] zero dst
[18:28:11] [PASSED] negative src
[18:28:11] [PASSED] negative dst
[18:28:11] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:28:11] ================ drm_test_rect_calc_vscale  ================
[18:28:11] [PASSED] normal use
[18:28:11] [PASSED] out of max range
[18:28:11] [PASSED] out of min range
[18:28:11] [PASSED] zero dst
[18:28:11] [PASSED] negative src
[18:28:11] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[18:28:11] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:28:11] ================== drm_test_rect_rotate  ===================
[18:28:11] [PASSED] reflect-x
[18:28:11] [PASSED] reflect-y
[18:28:11] [PASSED] rotate-0
[18:28:11] [PASSED] rotate-90
[18:28:11] [PASSED] rotate-180
[18:28:11] [PASSED] rotate-270
[18:28:11] ============== [PASSED] drm_test_rect_rotate ===============
[18:28:11] ================ drm_test_rect_rotate_inv  =================
[18:28:11] [PASSED] reflect-x
[18:28:11] [PASSED] reflect-y
[18:28:11] [PASSED] rotate-0
[18:28:11] [PASSED] rotate-90
[18:28:11] [PASSED] rotate-180
[18:28:11] [PASSED] rotate-270
[18:28:11] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:28:11] ==================== [PASSED] drm_rect =====================
[18:28:11] ============ drm_sysfb_modeset_test (1 subtest) ============
[18:28:11] ============ drm_test_sysfb_build_fourcc_list  =============
[18:28:11] [PASSED] no native formats
[18:28:11] [PASSED] XRGB8888 as native format
[18:28:11] [PASSED] remove duplicates
[18:28:11] [PASSED] convert alpha formats
[18:28:11] [PASSED] random formats
[18:28:11] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[18:28:11] ============= [PASSED] drm_sysfb_modeset_test ==============
[18:28:11] ================== drm_fixp (2 subtests) ===================
[18:28:11] [PASSED] drm_test_int2fixp
[18:28:11] [PASSED] drm_test_sm2fixp
[18:28:11] ==================== [PASSED] drm_fixp =====================
[18:28:11] ============================================================
[18:28:11] Testing complete. Ran 621 tests: passed: 621
[18:28:11] Elapsed time: 26.251s total, 1.664s configuring, 24.417s building, 0.139s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[18:28:11] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:28:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:28:22] Starting KUnit Kernel (1/1)...
[18:28:22] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:28:22] ================= ttm_device (5 subtests) ==================
[18:28:22] [PASSED] ttm_device_init_basic
[18:28:22] [PASSED] ttm_device_init_multiple
[18:28:22] [PASSED] ttm_device_fini_basic
[18:28:22] [PASSED] ttm_device_init_no_vma_man
[18:28:22] ================== ttm_device_init_pools  ==================
[18:28:22] [PASSED] No DMA allocations, no DMA32 required
[18:28:22] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[18:28:22] Expected !list_lru_count(&pt.pages) to be false, but is true
[18:28:22] [FAILED] DMA allocations, DMA32 required
[18:28:22] [PASSED] No DMA allocations, DMA32 required
[18:28:22]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[18:28:22]     Expected !list_lru_count(&pt.pages) to be false, but is true
[18:28:22] ------------[ cut here ]------------
[18:28:22] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[18:28:22] refcount_t: underflow; use-after-free.
[18:28:22] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g5eac438bb6d1 #3 VOLUNTARY
[18:28:22] Tainted: [W]=WARN, [N]=TEST
[18:28:22] Stack:
[18:28:22]  6044ed8b 00000000 00000000 00000001
[18:28:22]  ffffff00 6044ed8b 6032367a 00000009
[18:28:22]  0000001c 60043e88 6002381c b90cbd40
[18:28:22] Call Trace:
[18:28:22]  [<6032367a>] ? devres_release_all+0xaa/0x100
[18:28:22]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[18:28:22]  [<6002381c>] ? _printk+0x0/0x65
[18:28:22]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[18:28:22]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[18:28:22]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[18:28:22]  [<60052e36>] ? um_set_signals+0x36/0x60
[18:28:22]  [<600c5a42>] ? call_rcu+0x52/0x90
[18:28:22]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[18:28:22]  [<60147f50>] ? kfree+0x0/0x250
[18:28:22]  [<6032367a>] ? devres_release_all+0xaa/0x100
[18:28:22]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[18:28:22]  [<6031c3c0>] ? bus_notify+0x0/0x60
[18:28:22]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[18:28:22]  [<60398620>] ? mutex_lock+0x0/0x40
[18:28:22]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[18:28:22]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[18:28:22]  [<60372210>] ? kobject_put+0x0/0x150
[18:28:22]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[18:28:22]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[18:28:22]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[18:28:22]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[18:28:22]  [<60315a8c>] ? device_del+0x1bc/0x600
[18:28:22]  [<60052e00>] ? um_set_signals+0x0/0x60
[18:28:22]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[18:28:22]  [<60052e00>] ? um_set_signals+0x0/0x60
[18:28:22]  [<60315ee4>] ? device_unregister+0x14/0x40
[18:28:22]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[18:28:22]  [<60257d70>] ? kunit_release_action+0x0/0x170
[18:28:22]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[18:28:22]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[18:28:22]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[18:28:22]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[18:28:22]  [<60081e36>] ? kthread+0xe6/0x150
[18:28:22]  [<60046435>] ? new_thread_handler+0x45/0x60
[18:28:22] ---[ end trace 0000000000000000 ]---
[18:28:22] [FAILED] DMA allocations, no DMA32 required
[18:28:22] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[18:28:22] ============== [FAILED] ttm_device_init_pools ==============
[18:28:22]     # module: ttm_device_test
[18:28:22] # ttm_device: pass:4 fail:1 skip:0 total:5
[18:28:22] # Totals: pass:6 fail:2 skip:0 total:8
[18:28:22] =================== [FAILED] ttm_device ====================
[18:28:22] ================== ttm_pool (8 subtests) ===================
[18:28:22] ================== ttm_pool_alloc_basic  ===================
[18:28:22] [PASSED] One page
[18:28:22] [PASSED] More than one page
[18:28:22] [PASSED] Above the allocation limit
[18:28:22] [PASSED] One page, with coherent DMA mappings enabled
[18:28:22] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:28:22] ============== [PASSED] ttm_pool_alloc_basic ===============
[18:28:22] ============== ttm_pool_alloc_basic_dma_addr  ==============
[18:28:22] [PASSED] One page
[18:28:22] [PASSED] More than one page
[18:28:22] [PASSED] Above the allocation limit
[18:28:22] [PASSED] One page, with coherent DMA mappings enabled
[18:28:22] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:28:22] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[18:28:22] [PASSED] ttm_pool_alloc_order_caching_match
[18:28:22] [PASSED] ttm_pool_alloc_caching_mismatch
[18:28:22] [PASSED] ttm_pool_alloc_order_mismatch
[18:28:22] [PASSED] ttm_pool_free_dma_alloc
[18:28:23] [ERROR] Test: ttm_pool: missing expected subtest!
[18:28:23] 
[18:28:23] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g5eac438bb6d1
[18:28:23] RIP: 0033:list_lru_count_node+0xe/0x20
[18:28:23] RSP: 00000000b90cbed8  EFLAGS: 00010246
[18:28:23] RAX: 0000000000000000 RBX: 00000000b9003c90 RCX: 0000000079a4c7d8
[18:28:23] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000079886880
[18:28:23] RBP: 0000000079886800 R08: 00000000b8190c28 R09: 0000000079850c80
[18:28:23] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000079850c80
[18:28:23] R13: 0000000060440770 R14: 000000006010eb50 R15: 0000000079886880
[18:28:23] Kernel panic - not syncing: Segfault with no mm
[18:28:23] [CRASHED] 
[18:28:23] [ERROR] Test: ttm_pool: missing expected subtest!
[18:28:23] [CRASHED] 
[18:28:23] [ERROR] Test: ttm_pool: missing subtest result line!
[18:28:23] # module: ttm_pool_test
[18:28:23] ==================== [CRASHED] ttm_pool ====================
[18:28:23] [ERROR] Test: main: missing expected subtest!
[18:28:23] [CRASHED] 
[18:28:23] [ERROR] Test: main: missing expected subtest!
[18:28:23] [CRASHED] 
[18:28:23] [ERROR] Test: main: missing expected subtest!
[18:28:23] [CRASHED] 
[18:28:23] [ERROR] Test: main: missing expected subtest!
[18:28:23] [CRASHED] 
[18:28:23] ============================================================
[18:28:23] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[18:28:23] Elapsed time: 11.565s total, 1.745s configuring, 9.503s building, 0.316s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


