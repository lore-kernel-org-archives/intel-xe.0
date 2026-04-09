Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E828EA3C23
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 10:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3054510E7BB;
	Thu,  9 Apr 2026 10:23:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D9D10E7BB;
 Thu,  9 Apr 2026 10:23:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/i915/=7Bdp=2C_hdmi=7D=3A_R?=
 =?utf-8?q?estructure_DP/HDMI_sink_format_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 10:23:36 -0000
Message-ID: <177573021678.445249.15342892851848786240@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/{dp, hdmi}: Restructure DP/HDMI sink format handling (rev2)
URL   : https://patchwork.freedesktop.org/series/164123/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[10:22:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:22:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:22:55] Starting KUnit Kernel (1/1)...
[10:22:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:22:55] ================== guc_buf (11 subtests) ===================
[10:22:55] [PASSED] test_smallest
[10:22:55] [PASSED] test_largest
[10:22:55] [PASSED] test_granular
[10:22:55] [PASSED] test_unique
[10:22:55] [PASSED] test_overlap
[10:22:55] [PASSED] test_reusable
[10:22:55] [PASSED] test_too_big
[10:22:55] [PASSED] test_flush
[10:22:55] [PASSED] test_lookup
[10:22:55] [PASSED] test_data
[10:22:55] [PASSED] test_class
[10:22:55] ===================== [PASSED] guc_buf =====================
[10:22:55] =================== guc_dbm (7 subtests) ===================
[10:22:55] [PASSED] test_empty
[10:22:55] [PASSED] test_default
[10:22:55] ======================== test_size  ========================
[10:22:55] [PASSED] 4
[10:22:55] [PASSED] 8
[10:22:55] [PASSED] 32
[10:22:55] [PASSED] 256
[10:22:55] ==================== [PASSED] test_size ====================
[10:22:55] ======================= test_reuse  ========================
[10:22:55] [PASSED] 4
[10:22:55] [PASSED] 8
[10:22:55] [PASSED] 32
[10:22:55] [PASSED] 256
[10:22:55] =================== [PASSED] test_reuse ====================
[10:22:55] =================== test_range_overlap  ====================
[10:22:55] [PASSED] 4
[10:22:55] [PASSED] 8
[10:22:55] [PASSED] 32
[10:22:55] [PASSED] 256
[10:22:55] =============== [PASSED] test_range_overlap ================
[10:22:55] =================== test_range_compact  ====================
[10:22:55] [PASSED] 4
[10:22:55] [PASSED] 8
[10:22:55] [PASSED] 32
[10:22:55] [PASSED] 256
[10:22:55] =============== [PASSED] test_range_compact ================
[10:22:55] ==================== test_range_spare  =====================
[10:22:55] [PASSED] 4
[10:22:55] [PASSED] 8
[10:22:55] [PASSED] 32
[10:22:55] [PASSED] 256
[10:22:55] ================ [PASSED] test_range_spare =================
[10:22:55] ===================== [PASSED] guc_dbm =====================
[10:22:55] =================== guc_idm (6 subtests) ===================
[10:22:55] [PASSED] bad_init
[10:22:55] [PASSED] no_init
[10:22:55] [PASSED] init_fini
[10:22:55] [PASSED] check_used
[10:22:55] [PASSED] check_quota
[10:22:55] [PASSED] check_all
[10:22:55] ===================== [PASSED] guc_idm =====================
[10:22:55] ================== no_relay (3 subtests) ===================
[10:22:55] [PASSED] xe_drops_guc2pf_if_not_ready
[10:22:55] [PASSED] xe_drops_guc2vf_if_not_ready
[10:22:55] [PASSED] xe_rejects_send_if_not_ready
[10:22:55] ==================== [PASSED] no_relay =====================
[10:22:55] ================== pf_relay (14 subtests) ==================
[10:22:55] [PASSED] pf_rejects_guc2pf_too_short
[10:22:55] [PASSED] pf_rejects_guc2pf_too_long
[10:22:55] [PASSED] pf_rejects_guc2pf_no_payload
[10:22:55] [PASSED] pf_fails_no_payload
[10:22:55] [PASSED] pf_fails_bad_origin
[10:22:55] [PASSED] pf_fails_bad_type
[10:22:55] [PASSED] pf_txn_reports_error
[10:22:55] [PASSED] pf_txn_sends_pf2guc
[10:22:55] [PASSED] pf_sends_pf2guc
[10:22:55] [SKIPPED] pf_loopback_nop
[10:22:55] [SKIPPED] pf_loopback_echo
[10:22:55] [SKIPPED] pf_loopback_fail
[10:22:55] [SKIPPED] pf_loopback_busy
[10:22:55] [SKIPPED] pf_loopback_retry
[10:22:55] ==================== [PASSED] pf_relay =====================
[10:22:55] ================== vf_relay (3 subtests) ===================
[10:22:55] [PASSED] vf_rejects_guc2vf_too_short
[10:22:55] [PASSED] vf_rejects_guc2vf_too_long
[10:22:55] [PASSED] vf_rejects_guc2vf_no_payload
[10:22:55] ==================== [PASSED] vf_relay =====================
[10:22:55] ================ pf_gt_config (9 subtests) =================
[10:22:55] [PASSED] fair_contexts_1vf
[10:22:55] [PASSED] fair_doorbells_1vf
[10:22:55] [PASSED] fair_ggtt_1vf
[10:22:55] ====================== fair_vram_1vf  ======================
[10:22:55] [PASSED] 3.50 GiB
[10:22:55] [PASSED] 11.5 GiB
[10:22:55] [PASSED] 15.5 GiB
[10:22:55] [PASSED] 31.5 GiB
[10:22:55] [PASSED] 63.5 GiB
[10:22:55] [PASSED] 1.91 GiB
[10:22:55] ================== [PASSED] fair_vram_1vf ==================
[10:22:55] ================ fair_vram_1vf_admin_only  =================
[10:22:55] [PASSED] 3.50 GiB
[10:22:55] [PASSED] 11.5 GiB
[10:22:55] [PASSED] 15.5 GiB
[10:22:55] [PASSED] 31.5 GiB
[10:22:55] [PASSED] 63.5 GiB
[10:22:55] [PASSED] 1.91 GiB
[10:22:55] ============ [PASSED] fair_vram_1vf_admin_only =============
[10:22:55] ====================== fair_contexts  ======================
[10:22:55] [PASSED] 1 VF
[10:22:55] [PASSED] 2 VFs
[10:22:55] [PASSED] 3 VFs
[10:22:55] [PASSED] 4 VFs
[10:22:55] [PASSED] 5 VFs
[10:22:55] [PASSED] 6 VFs
[10:22:55] [PASSED] 7 VFs
[10:22:55] [PASSED] 8 VFs
[10:22:55] [PASSED] 9 VFs
[10:22:55] [PASSED] 10 VFs
[10:22:55] [PASSED] 11 VFs
[10:22:55] [PASSED] 12 VFs
[10:22:55] [PASSED] 13 VFs
[10:22:55] [PASSED] 14 VFs
[10:22:55] [PASSED] 15 VFs
[10:22:55] [PASSED] 16 VFs
[10:22:55] [PASSED] 17 VFs
[10:22:55] [PASSED] 18 VFs
[10:22:55] [PASSED] 19 VFs
[10:22:55] [PASSED] 20 VFs
[10:22:55] [PASSED] 21 VFs
[10:22:55] [PASSED] 22 VFs
[10:22:55] [PASSED] 23 VFs
[10:22:55] [PASSED] 24 VFs
[10:22:55] [PASSED] 25 VFs
[10:22:55] [PASSED] 26 VFs
[10:22:55] [PASSED] 27 VFs
[10:22:55] [PASSED] 28 VFs
[10:22:55] [PASSED] 29 VFs
[10:22:55] [PASSED] 30 VFs
[10:22:55] [PASSED] 31 VFs
[10:22:55] [PASSED] 32 VFs
[10:22:55] [PASSED] 33 VFs
[10:22:55] [PASSED] 34 VFs
[10:22:55] [PASSED] 35 VFs
[10:22:55] [PASSED] 36 VFs
[10:22:55] [PASSED] 37 VFs
[10:22:55] [PASSED] 38 VFs
[10:22:55] [PASSED] 39 VFs
[10:22:55] [PASSED] 40 VFs
[10:22:55] [PASSED] 41 VFs
[10:22:55] [PASSED] 42 VFs
[10:22:55] [PASSED] 43 VFs
[10:22:55] [PASSED] 44 VFs
[10:22:55] [PASSED] 45 VFs
[10:22:55] [PASSED] 46 VFs
[10:22:55] [PASSED] 47 VFs
[10:22:55] [PASSED] 48 VFs
[10:22:55] [PASSED] 49 VFs
[10:22:55] [PASSED] 50 VFs
[10:22:55] [PASSED] 51 VFs
[10:22:55] [PASSED] 52 VFs
[10:22:55] [PASSED] 53 VFs
[10:22:55] [PASSED] 54 VFs
[10:22:55] [PASSED] 55 VFs
[10:22:55] [PASSED] 56 VFs
[10:22:55] [PASSED] 57 VFs
[10:22:55] [PASSED] 58 VFs
[10:22:55] [PASSED] 59 VFs
[10:22:55] [PASSED] 60 VFs
[10:22:55] [PASSED] 61 VFs
[10:22:55] [PASSED] 62 VFs
[10:22:55] [PASSED] 63 VFs
[10:22:55] ================== [PASSED] fair_contexts ==================
[10:22:55] ===================== fair_doorbells  ======================
[10:22:55] [PASSED] 1 VF
[10:22:55] [PASSED] 2 VFs
[10:22:55] [PASSED] 3 VFs
[10:22:55] [PASSED] 4 VFs
[10:22:55] [PASSED] 5 VFs
[10:22:55] [PASSED] 6 VFs
[10:22:55] [PASSED] 7 VFs
[10:22:55] [PASSED] 8 VFs
[10:22:55] [PASSED] 9 VFs
[10:22:55] [PASSED] 10 VFs
[10:22:55] [PASSED] 11 VFs
[10:22:55] [PASSED] 12 VFs
[10:22:55] [PASSED] 13 VFs
[10:22:55] [PASSED] 14 VFs
[10:22:55] [PASSED] 15 VFs
[10:22:55] [PASSED] 16 VFs
[10:22:55] [PASSED] 17 VFs
[10:22:55] [PASSED] 18 VFs
[10:22:55] [PASSED] 19 VFs
[10:22:55] [PASSED] 20 VFs
[10:22:55] [PASSED] 21 VFs
[10:22:55] [PASSED] 22 VFs
[10:22:55] [PASSED] 23 VFs
[10:22:55] [PASSED] 24 VFs
[10:22:55] [PASSED] 25 VFs
[10:22:55] [PASSED] 26 VFs
[10:22:55] [PASSED] 27 VFs
[10:22:55] [PASSED] 28 VFs
[10:22:55] [PASSED] 29 VFs
[10:22:55] [PASSED] 30 VFs
[10:22:55] [PASSED] 31 VFs
[10:22:55] [PASSED] 32 VFs
[10:22:55] [PASSED] 33 VFs
[10:22:55] [PASSED] 34 VFs
[10:22:55] [PASSED] 35 VFs
[10:22:55] [PASSED] 36 VFs
[10:22:55] [PASSED] 37 VFs
[10:22:55] [PASSED] 38 VFs
[10:22:55] [PASSED] 39 VFs
[10:22:55] [PASSED] 40 VFs
[10:22:55] [PASSED] 41 VFs
[10:22:55] [PASSED] 42 VFs
[10:22:55] [PASSED] 43 VFs
[10:22:55] [PASSED] 44 VFs
[10:22:55] [PASSED] 45 VFs
[10:22:55] [PASSED] 46 VFs
[10:22:55] [PASSED] 47 VFs
[10:22:55] [PASSED] 48 VFs
[10:22:55] [PASSED] 49 VFs
[10:22:55] [PASSED] 50 VFs
[10:22:55] [PASSED] 51 VFs
[10:22:55] [PASSED] 52 VFs
[10:22:55] [PASSED] 53 VFs
[10:22:55] [PASSED] 54 VFs
[10:22:55] [PASSED] 55 VFs
[10:22:55] [PASSED] 56 VFs
[10:22:55] [PASSED] 57 VFs
[10:22:55] [PASSED] 58 VFs
[10:22:55] [PASSED] 59 VFs
[10:22:55] [PASSED] 60 VFs
[10:22:55] [PASSED] 61 VFs
[10:22:55] [PASSED] 62 VFs
[10:22:55] [PASSED] 63 VFs
[10:22:55] ================= [PASSED] fair_doorbells ==================
[10:22:55] ======================== fair_ggtt  ========================
[10:22:55] [PASSED] 1 VF
[10:22:55] [PASSED] 2 VFs
[10:22:55] [PASSED] 3 VFs
[10:22:55] [PASSED] 4 VFs
[10:22:55] [PASSED] 5 VFs
[10:22:55] [PASSED] 6 VFs
[10:22:55] [PASSED] 7 VFs
[10:22:55] [PASSED] 8 VFs
[10:22:55] [PASSED] 9 VFs
[10:22:55] [PASSED] 10 VFs
[10:22:55] [PASSED] 11 VFs
[10:22:55] [PASSED] 12 VFs
[10:22:55] [PASSED] 13 VFs
[10:22:55] [PASSED] 14 VFs
[10:22:55] [PASSED] 15 VFs
[10:22:55] [PASSED] 16 VFs
[10:22:55] [PASSED] 17 VFs
[10:22:55] [PASSED] 18 VFs
[10:22:55] [PASSED] 19 VFs
[10:22:55] [PASSED] 20 VFs
[10:22:55] [PASSED] 21 VFs
[10:22:55] [PASSED] 22 VFs
[10:22:55] [PASSED] 23 VFs
[10:22:55] [PASSED] 24 VFs
[10:22:55] [PASSED] 25 VFs
[10:22:55] [PASSED] 26 VFs
[10:22:55] [PASSED] 27 VFs
[10:22:55] [PASSED] 28 VFs
[10:22:55] [PASSED] 29 VFs
[10:22:55] [PASSED] 30 VFs
[10:22:55] [PASSED] 31 VFs
[10:22:55] [PASSED] 32 VFs
[10:22:55] [PASSED] 33 VFs
[10:22:55] [PASSED] 34 VFs
[10:22:55] [PASSED] 35 VFs
[10:22:55] [PASSED] 36 VFs
[10:22:55] [PASSED] 37 VFs
[10:22:55] [PASSED] 38 VFs
[10:22:55] [PASSED] 39 VFs
[10:22:55] [PASSED] 40 VFs
[10:22:55] [PASSED] 41 VFs
[10:22:55] [PASSED] 42 VFs
[10:22:55] [PASSED] 43 VFs
[10:22:55] [PASSED] 44 VFs
[10:22:55] [PASSED] 45 VFs
[10:22:55] [PASSED] 46 VFs
[10:22:55] [PASSED] 47 VFs
[10:22:55] [PASSED] 48 VFs
[10:22:55] [PASSED] 49 VFs
[10:22:55] [PASSED] 50 VFs
[10:22:55] [PASSED] 51 VFs
[10:22:55] [PASSED] 52 VFs
[10:22:55] [PASSED] 53 VFs
[10:22:55] [PASSED] 54 VFs
[10:22:55] [PASSED] 55 VFs
[10:22:55] [PASSED] 56 VFs
[10:22:55] [PASSED] 57 VFs
[10:22:55] [PASSED] 58 VFs
[10:22:55] [PASSED] 59 VFs
[10:22:55] [PASSED] 60 VFs
[10:22:55] [PASSED] 61 VFs
[10:22:55] [PASSED] 62 VFs
[10:22:55] [PASSED] 63 VFs
[10:22:55] ==================== [PASSED] fair_ggtt ====================
[10:22:55] ======================== fair_vram  ========================
[10:22:55] [PASSED] 1 VF
[10:22:55] [PASSED] 2 VFs
[10:22:55] [PASSED] 3 VFs
[10:22:55] [PASSED] 4 VFs
[10:22:55] [PASSED] 5 VFs
[10:22:55] [PASSED] 6 VFs
[10:22:55] [PASSED] 7 VFs
[10:22:55] [PASSED] 8 VFs
[10:22:55] [PASSED] 9 VFs
[10:22:55] [PASSED] 10 VFs
[10:22:56] [PASSED] 11 VFs
[10:22:56] [PASSED] 12 VFs
[10:22:56] [PASSED] 13 VFs
[10:22:56] [PASSED] 14 VFs
[10:22:56] [PASSED] 15 VFs
[10:22:56] [PASSED] 16 VFs
[10:22:56] [PASSED] 17 VFs
[10:22:56] [PASSED] 18 VFs
[10:22:56] [PASSED] 19 VFs
[10:22:56] [PASSED] 20 VFs
[10:22:56] [PASSED] 21 VFs
[10:22:56] [PASSED] 22 VFs
[10:22:56] [PASSED] 23 VFs
[10:22:56] [PASSED] 24 VFs
[10:22:56] [PASSED] 25 VFs
[10:22:56] [PASSED] 26 VFs
[10:22:56] [PASSED] 27 VFs
[10:22:56] [PASSED] 28 VFs
[10:22:56] [PASSED] 29 VFs
[10:22:56] [PASSED] 30 VFs
[10:22:56] [PASSED] 31 VFs
[10:22:56] [PASSED] 32 VFs
[10:22:56] [PASSED] 33 VFs
[10:22:56] [PASSED] 34 VFs
[10:22:56] [PASSED] 35 VFs
[10:22:56] [PASSED] 36 VFs
[10:22:56] [PASSED] 37 VFs
[10:22:56] [PASSED] 38 VFs
[10:22:56] [PASSED] 39 VFs
[10:22:56] [PASSED] 40 VFs
[10:22:56] [PASSED] 41 VFs
[10:22:56] [PASSED] 42 VFs
[10:22:56] [PASSED] 43 VFs
[10:22:56] [PASSED] 44 VFs
[10:22:56] [PASSED] 45 VFs
[10:22:56] [PASSED] 46 VFs
[10:22:56] [PASSED] 47 VFs
[10:22:56] [PASSED] 48 VFs
[10:22:56] [PASSED] 49 VFs
[10:22:56] [PASSED] 50 VFs
[10:22:56] [PASSED] 51 VFs
[10:22:56] [PASSED] 52 VFs
[10:22:56] [PASSED] 53 VFs
[10:22:56] [PASSED] 54 VFs
[10:22:56] [PASSED] 55 VFs
[10:22:56] [PASSED] 56 VFs
[10:22:56] [PASSED] 57 VFs
[10:22:56] [PASSED] 58 VFs
[10:22:56] [PASSED] 59 VFs
[10:22:56] [PASSED] 60 VFs
[10:22:56] [PASSED] 61 VFs
[10:22:56] [PASSED] 62 VFs
[10:22:56] [PASSED] 63 VFs
[10:22:56] ==================== [PASSED] fair_vram ====================
[10:22:56] ================== [PASSED] pf_gt_config ===================
[10:22:56] ===================== lmtt (1 subtest) =====================
[10:22:56] ======================== test_ops  =========================
[10:22:56] [PASSED] 2-level
[10:22:56] [PASSED] multi-level
[10:22:56] ==================== [PASSED] test_ops =====================
[10:22:56] ====================== [PASSED] lmtt =======================
[10:22:56] ================= pf_service (11 subtests) =================
[10:22:56] [PASSED] pf_negotiate_any
[10:22:56] [PASSED] pf_negotiate_base_match
[10:22:56] [PASSED] pf_negotiate_base_newer
[10:22:56] [PASSED] pf_negotiate_base_next
[10:22:56] [SKIPPED] pf_negotiate_base_older
[10:22:56] [PASSED] pf_negotiate_base_prev
[10:22:56] [PASSED] pf_negotiate_latest_match
[10:22:56] [PASSED] pf_negotiate_latest_newer
[10:22:56] [PASSED] pf_negotiate_latest_next
[10:22:56] [SKIPPED] pf_negotiate_latest_older
[10:22:56] [SKIPPED] pf_negotiate_latest_prev
[10:22:56] =================== [PASSED] pf_service ====================
[10:22:56] ================= xe_guc_g2g (2 subtests) ==================
[10:22:56] ============== xe_live_guc_g2g_kunit_default  ==============
[10:22:56] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[10:22:56] ============== xe_live_guc_g2g_kunit_allmem  ===============
[10:22:56] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[10:22:56] =================== [SKIPPED] xe_guc_g2g ===================
[10:22:56] =================== xe_mocs (2 subtests) ===================
[10:22:56] ================ xe_live_mocs_kernel_kunit  ================
[10:22:56] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[10:22:56] ================ xe_live_mocs_reset_kunit  =================
[10:22:56] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[10:22:56] ==================== [SKIPPED] xe_mocs =====================
[10:22:56] ================= xe_migrate (2 subtests) ==================
[10:22:56] ================= xe_migrate_sanity_kunit  =================
[10:22:56] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[10:22:56] ================== xe_validate_ccs_kunit  ==================
[10:22:56] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[10:22:56] =================== [SKIPPED] xe_migrate ===================
[10:22:56] ================== xe_dma_buf (1 subtest) ==================
[10:22:56] ==================== xe_dma_buf_kunit  =====================
[10:22:56] ================ [SKIPPED] xe_dma_buf_kunit ================
[10:22:56] =================== [SKIPPED] xe_dma_buf ===================
[10:22:56] ================= xe_bo_shrink (1 subtest) =================
[10:22:56] =================== xe_bo_shrink_kunit  ====================
[10:22:56] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[10:22:56] ================== [SKIPPED] xe_bo_shrink ==================
[10:22:56] ==================== xe_bo (2 subtests) ====================
[10:22:56] ================== xe_ccs_migrate_kunit  ===================
[10:22:56] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[10:22:56] ==================== xe_bo_evict_kunit  ====================
[10:22:56] =============== [SKIPPED] xe_bo_evict_kunit ================
[10:22:56] ===================== [SKIPPED] xe_bo ======================
[10:22:56] ==================== args (13 subtests) ====================
[10:22:56] [PASSED] count_args_test
[10:22:56] [PASSED] call_args_example
[10:22:56] [PASSED] call_args_test
[10:22:56] [PASSED] drop_first_arg_example
[10:22:56] [PASSED] drop_first_arg_test
[10:22:56] [PASSED] first_arg_example
[10:22:56] [PASSED] first_arg_test
[10:22:56] [PASSED] last_arg_example
[10:22:56] [PASSED] last_arg_test
[10:22:56] [PASSED] pick_arg_example
[10:22:56] [PASSED] if_args_example
[10:22:56] [PASSED] if_args_test
[10:22:56] [PASSED] sep_comma_example
[10:22:56] ====================== [PASSED] args =======================
[10:22:56] =================== xe_pci (3 subtests) ====================
[10:22:56] ==================== check_graphics_ip  ====================
[10:22:56] [PASSED] 12.00 Xe_LP
[10:22:56] [PASSED] 12.10 Xe_LP+
[10:22:56] [PASSED] 12.55 Xe_HPG
[10:22:56] [PASSED] 12.60 Xe_HPC
[10:22:56] [PASSED] 12.70 Xe_LPG
[10:22:56] [PASSED] 12.71 Xe_LPG
[10:22:56] [PASSED] 12.74 Xe_LPG+
[10:22:56] [PASSED] 20.01 Xe2_HPG
[10:22:56] [PASSED] 20.02 Xe2_HPG
[10:22:56] [PASSED] 20.04 Xe2_LPG
[10:22:56] [PASSED] 30.00 Xe3_LPG
[10:22:56] [PASSED] 30.01 Xe3_LPG
[10:22:56] [PASSED] 30.03 Xe3_LPG
[10:22:56] [PASSED] 30.04 Xe3_LPG
[10:22:56] [PASSED] 30.05 Xe3_LPG
[10:22:56] [PASSED] 35.10 Xe3p_LPG
[10:22:56] [PASSED] 35.11 Xe3p_XPC
[10:22:56] ================ [PASSED] check_graphics_ip ================
[10:22:56] ===================== check_media_ip  ======================
[10:22:56] [PASSED] 12.00 Xe_M
[10:22:56] [PASSED] 12.55 Xe_HPM
[10:22:56] [PASSED] 13.00 Xe_LPM+
[10:22:56] [PASSED] 13.01 Xe2_HPM
[10:22:56] [PASSED] 20.00 Xe2_LPM
[10:22:56] [PASSED] 30.00 Xe3_LPM
[10:22:56] [PASSED] 30.02 Xe3_LPM
[10:22:56] [PASSED] 35.00 Xe3p_LPM
[10:22:56] [PASSED] 35.03 Xe3p_HPM
[10:22:56] ================= [PASSED] check_media_ip ==================
[10:22:56] =================== check_platform_desc  ===================
[10:22:56] [PASSED] 0x9A60 (TIGERLAKE)
[10:22:56] [PASSED] 0x9A68 (TIGERLAKE)
[10:22:56] [PASSED] 0x9A70 (TIGERLAKE)
[10:22:56] [PASSED] 0x9A40 (TIGERLAKE)
[10:22:56] [PASSED] 0x9A49 (TIGERLAKE)
[10:22:56] [PASSED] 0x9A59 (TIGERLAKE)
[10:22:56] [PASSED] 0x9A78 (TIGERLAKE)
[10:22:56] [PASSED] 0x9AC0 (TIGERLAKE)
[10:22:56] [PASSED] 0x9AC9 (TIGERLAKE)
[10:22:56] [PASSED] 0x9AD9 (TIGERLAKE)
[10:22:56] [PASSED] 0x9AF8 (TIGERLAKE)
[10:22:56] [PASSED] 0x4C80 (ROCKETLAKE)
[10:22:56] [PASSED] 0x4C8A (ROCKETLAKE)
[10:22:56] [PASSED] 0x4C8B (ROCKETLAKE)
[10:22:56] [PASSED] 0x4C8C (ROCKETLAKE)
[10:22:56] [PASSED] 0x4C90 (ROCKETLAKE)
[10:22:56] [PASSED] 0x4C9A (ROCKETLAKE)
[10:22:56] [PASSED] 0x4680 (ALDERLAKE_S)
[10:22:56] [PASSED] 0x4682 (ALDERLAKE_S)
[10:22:56] [PASSED] 0x4688 (ALDERLAKE_S)
[10:22:56] [PASSED] 0x468A (ALDERLAKE_S)
[10:22:56] [PASSED] 0x468B (ALDERLAKE_S)
[10:22:56] [PASSED] 0x4690 (ALDERLAKE_S)
[10:22:56] [PASSED] 0x4692 (ALDERLAKE_S)
[10:22:56] [PASSED] 0x4693 (ALDERLAKE_S)
[10:22:56] [PASSED] 0x46A0 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46A1 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46A2 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46A3 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46A6 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46A8 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46AA (ALDERLAKE_P)
[10:22:56] [PASSED] 0x462A (ALDERLAKE_P)
[10:22:56] [PASSED] 0x4626 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x4628 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46B0 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46B1 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46B2 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46B3 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46C0 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46C1 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46C2 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46C3 (ALDERLAKE_P)
[10:22:56] [PASSED] 0x46D0 (ALDERLAKE_N)
[10:22:56] [PASSED] 0x46D1 (ALDERLAKE_N)
[10:22:56] [PASSED] 0x46D2 (ALDERLAKE_N)
[10:22:56] [PASSED] 0x46D3 (ALDERLAKE_N)
[10:22:56] [PASSED] 0x46D4 (ALDERLAKE_N)
[10:22:56] [PASSED] 0xA721 (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7A1 (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7A9 (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7AC (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7AD (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA720 (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7A0 (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7A8 (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7AA (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA7AB (ALDERLAKE_P)
[10:22:56] [PASSED] 0xA780 (ALDERLAKE_S)
[10:22:56] [PASSED] 0xA781 (ALDERLAKE_S)
[10:22:56] [PASSED] 0xA782 (ALDERLAKE_S)
[10:22:56] [PASSED] 0xA783 (ALDERLAKE_S)
[10:22:56] [PASSED] 0xA788 (ALDERLAKE_S)
[10:22:56] [PASSED] 0xA789 (ALDERLAKE_S)
[10:22:56] [PASSED] 0xA78A (ALDERLAKE_S)
[10:22:56] [PASSED] 0xA78B (ALDERLAKE_S)
[10:22:56] [PASSED] 0x4905 (DG1)
[10:22:56] [PASSED] 0x4906 (DG1)
[10:22:56] [PASSED] 0x4907 (DG1)
[10:22:56] [PASSED] 0x4908 (DG1)
[10:22:56] [PASSED] 0x4909 (DG1)
[10:22:56] [PASSED] 0x56C0 (DG2)
[10:22:56] [PASSED] 0x56C2 (DG2)
[10:22:56] [PASSED] 0x56C1 (DG2)
[10:22:56] [PASSED] 0x7D51 (METEORLAKE)
[10:22:56] [PASSED] 0x7DD1 (METEORLAKE)
[10:22:56] [PASSED] 0x7D41 (METEORLAKE)
[10:22:56] [PASSED] 0x7D67 (METEORLAKE)
[10:22:56] [PASSED] 0xB640 (METEORLAKE)
[10:22:56] [PASSED] 0x56A0 (DG2)
[10:22:56] [PASSED] 0x56A1 (DG2)
[10:22:56] [PASSED] 0x56A2 (DG2)
[10:22:56] [PASSED] 0x56BE (DG2)
[10:22:56] [PASSED] 0x56BF (DG2)
[10:22:56] [PASSED] 0x5690 (DG2)
[10:22:56] [PASSED] 0x5691 (DG2)
[10:22:56] [PASSED] 0x5692 (DG2)
[10:22:56] [PASSED] 0x56A5 (DG2)
[10:22:56] [PASSED] 0x56A6 (DG2)
[10:22:56] [PASSED] 0x56B0 (DG2)
[10:22:56] [PASSED] 0x56B1 (DG2)
[10:22:56] [PASSED] 0x56BA (DG2)
[10:22:56] [PASSED] 0x56BB (DG2)
[10:22:56] [PASSED] 0x56BC (DG2)
[10:22:56] [PASSED] 0x56BD (DG2)
[10:22:56] [PASSED] 0x5693 (DG2)
[10:22:56] [PASSED] 0x5694 (DG2)
[10:22:56] [PASSED] 0x5695 (DG2)
[10:22:56] [PASSED] 0x56A3 (DG2)
[10:22:56] [PASSED] 0x56A4 (DG2)
[10:22:56] [PASSED] 0x56B2 (DG2)
[10:22:56] [PASSED] 0x56B3 (DG2)
[10:22:56] [PASSED] 0x5696 (DG2)
[10:22:56] [PASSED] 0x5697 (DG2)
[10:22:56] [PASSED] 0xB69 (PVC)
[10:22:56] [PASSED] 0xB6E (PVC)
[10:22:56] [PASSED] 0xBD4 (PVC)
[10:22:56] [PASSED] 0xBD5 (PVC)
[10:22:56] [PASSED] 0xBD6 (PVC)
[10:22:56] [PASSED] 0xBD7 (PVC)
[10:22:56] [PASSED] 0xBD8 (PVC)
[10:22:56] [PASSED] 0xBD9 (PVC)
[10:22:56] [PASSED] 0xBDA (PVC)
[10:22:56] [PASSED] 0xBDB (PVC)
[10:22:56] [PASSED] 0xBE0 (PVC)
[10:22:56] [PASSED] 0xBE1 (PVC)
[10:22:56] [PASSED] 0xBE5 (PVC)
[10:22:56] [PASSED] 0x7D40 (METEORLAKE)
[10:22:56] [PASSED] 0x7D45 (METEORLAKE)
[10:22:56] [PASSED] 0x7D55 (METEORLAKE)
[10:22:56] [PASSED] 0x7D60 (METEORLAKE)
[10:22:56] [PASSED] 0x7DD5 (METEORLAKE)
[10:22:56] [PASSED] 0x6420 (LUNARLAKE)
[10:22:56] [PASSED] 0x64A0 (LUNARLAKE)
[10:22:56] [PASSED] 0x64B0 (LUNARLAKE)
[10:22:56] [PASSED] 0xE202 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE209 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE20B (BATTLEMAGE)
[10:22:56] [PASSED] 0xE20C (BATTLEMAGE)
[10:22:56] [PASSED] 0xE20D (BATTLEMAGE)
[10:22:56] [PASSED] 0xE210 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE211 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE212 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE216 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE220 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE221 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE222 (BATTLEMAGE)
[10:22:56] [PASSED] 0xE223 (BATTLEMAGE)
[10:22:56] [PASSED] 0xB080 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB081 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB082 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB083 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB084 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB085 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB086 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB087 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB08F (PANTHERLAKE)
[10:22:56] [PASSED] 0xB090 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB0A0 (PANTHERLAKE)
[10:22:56] [PASSED] 0xB0B0 (PANTHERLAKE)
[10:22:56] [PASSED] 0xFD80 (PANTHERLAKE)
[10:22:56] [PASSED] 0xFD81 (PANTHERLAKE)
[10:22:56] [PASSED] 0xD740 (NOVALAKE_S)
[10:22:56] [PASSED] 0xD741 (NOVALAKE_S)
[10:22:56] [PASSED] 0xD742 (NOVALAKE_S)
[10:22:56] [PASSED] 0xD743 (NOVALAKE_S)
[10:22:56] [PASSED] 0xD744 (NOVALAKE_S)
[10:22:56] [PASSED] 0xD745 (NOVALAKE_S)
[10:22:56] [PASSED] 0x674C (CRESCENTISLAND)
[10:22:56] [PASSED] 0xD750 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD751 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD752 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD753 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD754 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD755 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD756 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD757 (NOVALAKE_P)
[10:22:56] [PASSED] 0xD75F (NOVALAKE_P)
[10:22:56] =============== [PASSED] check_platform_desc ===============
[10:22:56] ===================== [PASSED] xe_pci ======================
[10:22:56] =================== xe_rtp (2 subtests) ====================
[10:22:56] =============== xe_rtp_process_to_sr_tests  ================
[10:22:56] [PASSED] coalesce-same-reg
[10:22:56] [PASSED] no-match-no-add
[10:22:56] [PASSED] match-or
[10:22:56] [PASSED] match-or-xfail
[10:22:56] [PASSED] no-match-no-add-multiple-rules
[10:22:56] [PASSED] two-regs-two-entries
[10:22:56] [PASSED] clr-one-set-other
[10:22:56] [PASSED] set-field
[10:22:56] [PASSED] conflict-duplicate
stty: 'standard input': Inappropriate ioctl for device
[10:22:56] [PASSED] conflict-not-disjoint
[10:22:56] [PASSED] conflict-reg-type
[10:22:56] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[10:22:56] ================== xe_rtp_process_tests  ===================
[10:22:56] [PASSED] active1
[10:22:56] [PASSED] active2
[10:22:56] [PASSED] active-inactive
[10:22:56] [PASSED] inactive-active
[10:22:56] [PASSED] inactive-1st_or_active-inactive
[10:22:56] [PASSED] inactive-2nd_or_active-inactive
[10:22:56] [PASSED] inactive-last_or_active-inactive
[10:22:56] [PASSED] inactive-no_or_active-inactive
[10:22:56] ============== [PASSED] xe_rtp_process_tests ===============
[10:22:56] ===================== [PASSED] xe_rtp ======================
[10:22:56] ==================== xe_wa (1 subtest) =====================
[10:22:56] ======================== xe_wa_gt  =========================
[10:22:56] [PASSED] TIGERLAKE B0
[10:22:56] [PASSED] DG1 A0
[10:22:56] [PASSED] DG1 B0
[10:22:56] [PASSED] ALDERLAKE_S A0
[10:22:56] [PASSED] ALDERLAKE_S B0
[10:22:56] [PASSED] ALDERLAKE_S C0
[10:22:56] [PASSED] ALDERLAKE_S D0
[10:22:56] [PASSED] ALDERLAKE_P A0
[10:22:56] [PASSED] ALDERLAKE_P B0
[10:22:56] [PASSED] ALDERLAKE_P C0
[10:22:56] [PASSED] ALDERLAKE_S RPLS D0
[10:22:56] [PASSED] ALDERLAKE_P RPLU E0
[10:22:56] [PASSED] DG2 G10 C0
[10:22:56] [PASSED] DG2 G11 B1
[10:22:56] [PASSED] DG2 G12 A1
[10:22:56] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[10:22:56] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[10:22:56] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[10:22:56] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[10:22:56] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[10:22:56] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[10:22:56] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[10:22:56] ==================== [PASSED] xe_wa_gt =====================
[10:22:56] ====================== [PASSED] xe_wa ======================
[10:22:56] ============================================================
[10:22:56] Testing complete. Ran 597 tests: passed: 579, skipped: 18
[10:22:56] Elapsed time: 36.180s total, 4.208s configuring, 31.354s building, 0.602s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:22:56] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:22:57] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:23:21] Starting KUnit Kernel (1/1)...
[10:23:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:23:21] ============ drm_test_pick_cmdline (2 subtests) ============
[10:23:21] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:23:21] =============== drm_test_pick_cmdline_named  ===============
[10:23:21] [PASSED] NTSC
[10:23:21] [PASSED] NTSC-J
[10:23:21] [PASSED] PAL
[10:23:21] [PASSED] PAL-M
[10:23:21] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:23:21] ============== [PASSED] drm_test_pick_cmdline ==============
[10:23:21] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[10:23:21] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[10:23:21] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[10:23:21] =========== drm_validate_clone_mode (2 subtests) ===========
[10:23:21] ============== drm_test_check_in_clone_mode  ===============
[10:23:21] [PASSED] in_clone_mode
[10:23:21] [PASSED] not_in_clone_mode
[10:23:21] ========== [PASSED] drm_test_check_in_clone_mode ===========
[10:23:21] =============== drm_test_check_valid_clones  ===============
[10:23:21] [PASSED] not_in_clone_mode
[10:23:21] [PASSED] valid_clone
[10:23:21] [PASSED] invalid_clone
[10:23:21] =========== [PASSED] drm_test_check_valid_clones ===========
[10:23:21] ============= [PASSED] drm_validate_clone_mode =============
[10:23:21] ============= drm_validate_modeset (1 subtest) =============
[10:23:21] [PASSED] drm_test_check_connector_changed_modeset
[10:23:21] ============== [PASSED] drm_validate_modeset ===============
[10:23:21] ====== drm_test_bridge_get_current_state (2 subtests) ======
[10:23:21] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[10:23:21] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[10:23:21] ======== [PASSED] drm_test_bridge_get_current_state ========
[10:23:21] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[10:23:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[10:23:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[10:23:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[10:23:21] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[10:23:21] ============== drm_bridge_alloc (2 subtests) ===============
[10:23:21] [PASSED] drm_test_drm_bridge_alloc_basic
[10:23:21] [PASSED] drm_test_drm_bridge_alloc_get_put
[10:23:21] ================ [PASSED] drm_bridge_alloc =================
[10:23:21] ============= drm_cmdline_parser (40 subtests) =============
[10:23:21] [PASSED] drm_test_cmdline_force_d_only
[10:23:21] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:23:21] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:23:21] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:23:21] [PASSED] drm_test_cmdline_force_e_only
[10:23:21] [PASSED] drm_test_cmdline_res
[10:23:21] [PASSED] drm_test_cmdline_res_vesa
[10:23:21] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:23:21] [PASSED] drm_test_cmdline_res_rblank
[10:23:21] [PASSED] drm_test_cmdline_res_bpp
[10:23:21] [PASSED] drm_test_cmdline_res_refresh
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:23:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:23:21] [PASSED] drm_test_cmdline_res_margins_force_on
[10:23:21] [PASSED] drm_test_cmdline_res_vesa_margins
[10:23:21] [PASSED] drm_test_cmdline_name
[10:23:21] [PASSED] drm_test_cmdline_name_bpp
[10:23:21] [PASSED] drm_test_cmdline_name_option
[10:23:21] [PASSED] drm_test_cmdline_name_bpp_option
[10:23:21] [PASSED] drm_test_cmdline_rotate_0
[10:23:21] [PASSED] drm_test_cmdline_rotate_90
[10:23:21] [PASSED] drm_test_cmdline_rotate_180
[10:23:21] [PASSED] drm_test_cmdline_rotate_270
[10:23:21] [PASSED] drm_test_cmdline_hmirror
[10:23:21] [PASSED] drm_test_cmdline_vmirror
[10:23:21] [PASSED] drm_test_cmdline_margin_options
[10:23:21] [PASSED] drm_test_cmdline_multiple_options
[10:23:21] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:23:21] [PASSED] drm_test_cmdline_extra_and_option
[10:23:21] [PASSED] drm_test_cmdline_freestanding_options
[10:23:21] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:23:21] [PASSED] drm_test_cmdline_panel_orientation
[10:23:21] ================ drm_test_cmdline_invalid  =================
[10:23:21] [PASSED] margin_only
[10:23:22] [PASSED] interlace_only
[10:23:22] [PASSED] res_missing_x
[10:23:22] [PASSED] res_missing_y
[10:23:22] [PASSED] res_bad_y
[10:23:22] [PASSED] res_missing_y_bpp
[10:23:22] [PASSED] res_bad_bpp
[10:23:22] [PASSED] res_bad_refresh
[10:23:22] [PASSED] res_bpp_refresh_force_on_off
[10:23:22] [PASSED] res_invalid_mode
[10:23:22] [PASSED] res_bpp_wrong_place_mode
[10:23:22] [PASSED] name_bpp_refresh
[10:23:22] [PASSED] name_refresh
[10:23:22] [PASSED] name_refresh_wrong_mode
[10:23:22] [PASSED] name_refresh_invalid_mode
[10:23:22] [PASSED] rotate_multiple
[10:23:22] [PASSED] rotate_invalid_val
[10:23:22] [PASSED] rotate_truncated
[10:23:22] [PASSED] invalid_option
[10:23:22] [PASSED] invalid_tv_option
[10:23:22] [PASSED] truncated_tv_option
[10:23:22] ============ [PASSED] drm_test_cmdline_invalid =============
[10:23:22] =============== drm_test_cmdline_tv_options  ===============
[10:23:22] [PASSED] NTSC
[10:23:22] [PASSED] NTSC_443
[10:23:22] [PASSED] NTSC_J
[10:23:22] [PASSED] PAL
[10:23:22] [PASSED] PAL_M
[10:23:22] [PASSED] PAL_N
[10:23:22] [PASSED] SECAM
[10:23:22] [PASSED] MONO_525
[10:23:22] [PASSED] MONO_625
[10:23:22] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:23:22] =============== [PASSED] drm_cmdline_parser ================
[10:23:22] ========== drmm_connector_hdmi_init (20 subtests) ==========
[10:23:22] [PASSED] drm_test_connector_hdmi_init_valid
[10:23:22] [PASSED] drm_test_connector_hdmi_init_bpc_8
[10:23:22] [PASSED] drm_test_connector_hdmi_init_bpc_10
[10:23:22] [PASSED] drm_test_connector_hdmi_init_bpc_12
[10:23:22] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[10:23:22] [PASSED] drm_test_connector_hdmi_init_bpc_null
[10:23:22] [PASSED] drm_test_connector_hdmi_init_formats_empty
[10:23:22] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[10:23:22] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[10:23:22] [PASSED] supported_formats=0x9 yuv420_allowed=1
[10:23:22] [PASSED] supported_formats=0x9 yuv420_allowed=0
[10:23:22] [PASSED] supported_formats=0x5 yuv420_allowed=1
[10:23:22] [PASSED] supported_formats=0x5 yuv420_allowed=0
[10:23:22] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[10:23:22] [PASSED] drm_test_connector_hdmi_init_null_ddc
[10:23:22] [PASSED] drm_test_connector_hdmi_init_null_product
[10:23:22] [PASSED] drm_test_connector_hdmi_init_null_vendor
[10:23:22] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[10:23:22] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[10:23:22] [PASSED] drm_test_connector_hdmi_init_product_valid
[10:23:22] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[10:23:22] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[10:23:22] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[10:23:22] ========= drm_test_connector_hdmi_init_type_valid  =========
[10:23:22] [PASSED] HDMI-A
[10:23:22] [PASSED] HDMI-B
[10:23:22] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[10:23:22] ======== drm_test_connector_hdmi_init_type_invalid  ========
[10:23:22] [PASSED] Unknown
[10:23:22] [PASSED] VGA
[10:23:22] [PASSED] DVI-I
[10:23:22] [PASSED] DVI-D
[10:23:22] [PASSED] DVI-A
[10:23:22] [PASSED] Composite
[10:23:22] [PASSED] SVIDEO
[10:23:22] [PASSED] LVDS
[10:23:22] [PASSED] Component
[10:23:22] [PASSED] DIN
[10:23:22] [PASSED] DP
[10:23:22] [PASSED] TV
[10:23:22] [PASSED] eDP
[10:23:22] [PASSED] Virtual
[10:23:22] [PASSED] DSI
[10:23:22] [PASSED] DPI
[10:23:22] [PASSED] Writeback
[10:23:22] [PASSED] SPI
[10:23:22] [PASSED] USB
[10:23:22] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[10:23:22] ============ [PASSED] drmm_connector_hdmi_init =============
[10:23:22] ============= drmm_connector_init (3 subtests) =============
[10:23:22] [PASSED] drm_test_drmm_connector_init
[10:23:22] [PASSED] drm_test_drmm_connector_init_null_ddc
[10:23:22] ========= drm_test_drmm_connector_init_type_valid  =========
[10:23:22] [PASSED] Unknown
[10:23:22] [PASSED] VGA
[10:23:22] [PASSED] DVI-I
[10:23:22] [PASSED] DVI-D
[10:23:22] [PASSED] DVI-A
[10:23:22] [PASSED] Composite
[10:23:22] [PASSED] SVIDEO
[10:23:22] [PASSED] LVDS
[10:23:22] [PASSED] Component
[10:23:22] [PASSED] DIN
[10:23:22] [PASSED] DP
[10:23:22] [PASSED] HDMI-A
[10:23:22] [PASSED] HDMI-B
[10:23:22] [PASSED] TV
[10:23:22] [PASSED] eDP
[10:23:22] [PASSED] Virtual
[10:23:22] [PASSED] DSI
[10:23:22] [PASSED] DPI
[10:23:22] [PASSED] Writeback
[10:23:22] [PASSED] SPI
[10:23:22] [PASSED] USB
[10:23:22] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[10:23:22] =============== [PASSED] drmm_connector_init ===============
[10:23:22] ========= drm_connector_dynamic_init (6 subtests) ==========
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_init
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_init_properties
[10:23:22] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[10:23:22] [PASSED] Unknown
[10:23:22] [PASSED] VGA
[10:23:22] [PASSED] DVI-I
[10:23:22] [PASSED] DVI-D
[10:23:22] [PASSED] DVI-A
[10:23:22] [PASSED] Composite
[10:23:22] [PASSED] SVIDEO
[10:23:22] [PASSED] LVDS
[10:23:22] [PASSED] Component
[10:23:22] [PASSED] DIN
[10:23:22] [PASSED] DP
[10:23:22] [PASSED] HDMI-A
[10:23:22] [PASSED] HDMI-B
[10:23:22] [PASSED] TV
[10:23:22] [PASSED] eDP
[10:23:22] [PASSED] Virtual
[10:23:22] [PASSED] DSI
[10:23:22] [PASSED] DPI
[10:23:22] [PASSED] Writeback
[10:23:22] [PASSED] SPI
[10:23:22] [PASSED] USB
[10:23:22] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[10:23:22] ======== drm_test_drm_connector_dynamic_init_name  =========
[10:23:22] [PASSED] Unknown
[10:23:22] [PASSED] VGA
[10:23:22] [PASSED] DVI-I
[10:23:22] [PASSED] DVI-D
[10:23:22] [PASSED] DVI-A
[10:23:22] [PASSED] Composite
[10:23:22] [PASSED] SVIDEO
[10:23:22] [PASSED] LVDS
[10:23:22] [PASSED] Component
[10:23:22] [PASSED] DIN
[10:23:22] [PASSED] DP
[10:23:22] [PASSED] HDMI-A
[10:23:22] [PASSED] HDMI-B
[10:23:22] [PASSED] TV
[10:23:22] [PASSED] eDP
[10:23:22] [PASSED] Virtual
[10:23:22] [PASSED] DSI
[10:23:22] [PASSED] DPI
[10:23:22] [PASSED] Writeback
[10:23:22] [PASSED] SPI
[10:23:22] [PASSED] USB
[10:23:22] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[10:23:22] =========== [PASSED] drm_connector_dynamic_init ============
[10:23:22] ==== drm_connector_dynamic_register_early (4 subtests) =====
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[10:23:22] ====== [PASSED] drm_connector_dynamic_register_early =======
[10:23:22] ======= drm_connector_dynamic_register (7 subtests) ========
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[10:23:22] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[10:23:22] ========= [PASSED] drm_connector_dynamic_register ==========
[10:23:22] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[10:23:22] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[10:23:22] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[10:23:22] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[10:23:22] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[10:23:22] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:23:22] [PASSED] NTSC
[10:23:22] [PASSED] NTSC-443
[10:23:22] [PASSED] NTSC-J
[10:23:22] [PASSED] PAL
[10:23:22] [PASSED] PAL-M
[10:23:22] [PASSED] PAL-N
[10:23:22] [PASSED] SECAM
[10:23:22] [PASSED] Mono
[10:23:22] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:23:22] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:23:22] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:23:22] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[10:23:22] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[10:23:22] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[10:23:22] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[10:23:22] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[10:23:22] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[10:23:22] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[10:23:22] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[10:23:22] [PASSED] VIC 96
[10:23:22] [PASSED] VIC 97
[10:23:22] [PASSED] VIC 101
[10:23:22] [PASSED] VIC 102
[10:23:22] [PASSED] VIC 106
[10:23:22] [PASSED] VIC 107
[10:23:22] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[10:23:22] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[10:23:22] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[10:23:22] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[10:23:22] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[10:23:22] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[10:23:22] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[10:23:22] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[10:23:22] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[10:23:22] [PASSED] Automatic
[10:23:22] [PASSED] Full
[10:23:22] [PASSED] Limited 16:235
[10:23:22] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[10:23:22] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[10:23:22] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[10:23:22] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[10:23:22] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[10:23:22] [PASSED] RGB
[10:23:22] [PASSED] YUV 4:2:0
[10:23:22] [PASSED] YUV 4:2:2
[10:23:22] [PASSED] YUV 4:4:4
[10:23:22] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[10:23:22] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[10:23:22] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[10:23:22] ============= drm_damage_helper (21 subtests) ==============
[10:23:22] [PASSED] drm_test_damage_iter_no_damage
[10:23:22] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:23:22] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:23:22] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:23:22] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:23:22] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:23:22] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:23:22] [PASSED] drm_test_damage_iter_simple_damage
[10:23:22] [PASSED] drm_test_damage_iter_single_damage
[10:23:22] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:23:22] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:23:22] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:23:22] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:23:22] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:23:22] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:23:22] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:23:22] [PASSED] drm_test_damage_iter_damage
[10:23:22] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:23:22] [PASSED] drm_test_damage_iter_damage_one_outside
[10:23:22] [PASSED] drm_test_damage_iter_damage_src_moved
[10:23:22] [PASSED] drm_test_damage_iter_damage_not_visible
[10:23:22] ================ [PASSED] drm_damage_helper ================
[10:23:22] ============== drm_dp_mst_helper (3 subtests) ==============
[10:23:22] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:23:22] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:23:22] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:23:22] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:23:22] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:23:22] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:23:22] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:23:22] ============== drm_test_dp_mst_calc_pbn_div  ===============
[10:23:22] [PASSED] Link rate 2000000 lane count 4
[10:23:22] [PASSED] Link rate 2000000 lane count 2
[10:23:22] [PASSED] Link rate 2000000 lane count 1
[10:23:22] [PASSED] Link rate 1350000 lane count 4
[10:23:22] [PASSED] Link rate 1350000 lane count 2
[10:23:22] [PASSED] Link rate 1350000 lane count 1
[10:23:22] [PASSED] Link rate 1000000 lane count 4
[10:23:22] [PASSED] Link rate 1000000 lane count 2
[10:23:22] [PASSED] Link rate 1000000 lane count 1
[10:23:22] [PASSED] Link rate 810000 lane count 4
[10:23:22] [PASSED] Link rate 810000 lane count 2
[10:23:22] [PASSED] Link rate 810000 lane count 1
[10:23:22] [PASSED] Link rate 540000 lane count 4
[10:23:22] [PASSED] Link rate 540000 lane count 2
[10:23:22] [PASSED] Link rate 540000 lane count 1
[10:23:22] [PASSED] Link rate 270000 lane count 4
[10:23:22] [PASSED] Link rate 270000 lane count 2
[10:23:22] [PASSED] Link rate 270000 lane count 1
[10:23:22] [PASSED] Link rate 162000 lane count 4
[10:23:22] [PASSED] Link rate 162000 lane count 2
[10:23:22] [PASSED] Link rate 162000 lane count 1
[10:23:22] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[10:23:22] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:23:22] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:23:22] [PASSED] DP_POWER_UP_PHY with port number
[10:23:22] [PASSED] DP_POWER_DOWN_PHY with port number
[10:23:22] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:23:22] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:23:22] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:23:22] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:23:22] [PASSED] DP_QUERY_PAYLOAD with port number
[10:23:22] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:23:22] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:23:22] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:23:22] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:23:22] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:23:22] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:23:22] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:23:22] [PASSED] DP_REMOTE_I2C_READ with port number
[10:23:22] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:23:22] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:23:22] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:23:22] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:23:22] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:23:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:23:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:23:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:23:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:23:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:23:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:23:22] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:23:22] ================ [PASSED] drm_dp_mst_helper ================
[10:23:22] ================== drm_exec (7 subtests) ===================
[10:23:22] [PASSED] sanitycheck
[10:23:22] [PASSED] test_lock
[10:23:22] [PASSED] test_lock_unlock
[10:23:22] [PASSED] test_duplicates
[10:23:22] [PASSED] test_prepare
[10:23:22] [PASSED] test_prepare_array
[10:23:22] [PASSED] test_multiple_loops
[10:23:22] ==================== [PASSED] drm_exec =====================
[10:23:22] =========== drm_format_helper_test (17 subtests) ===========
[10:23:22] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:23:22] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:23:22] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:23:22] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:23:22] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:23:22] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:23:22] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:23:22] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[10:23:22] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:23:22] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:23:22] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:23:22] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:23:22] ==================== drm_test_fb_swab  =====================
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ================ [PASSED] drm_test_fb_swab =================
[10:23:22] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[10:23:22] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[10:23:22] [PASSED] single_pixel_source_buffer
[10:23:22] [PASSED] single_pixel_clip_rectangle
[10:23:22] [PASSED] well_known_colors
[10:23:22] [PASSED] destination_pitch
[10:23:22] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[10:23:22] ================= drm_test_fb_clip_offset  =================
[10:23:22] [PASSED] pass through
[10:23:22] [PASSED] horizontal offset
[10:23:22] [PASSED] vertical offset
[10:23:22] [PASSED] horizontal and vertical offset
[10:23:22] [PASSED] horizontal offset (custom pitch)
[10:23:22] [PASSED] vertical offset (custom pitch)
[10:23:22] [PASSED] horizontal and vertical offset (custom pitch)
[10:23:22] ============= [PASSED] drm_test_fb_clip_offset =============
[10:23:22] =================== drm_test_fb_memcpy  ====================
[10:23:22] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[10:23:22] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[10:23:22] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[10:23:22] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[10:23:22] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[10:23:22] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[10:23:22] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[10:23:22] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[10:23:22] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[10:23:22] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[10:23:22] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[10:23:22] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[10:23:22] =============== [PASSED] drm_test_fb_memcpy ================
[10:23:22] ============= [PASSED] drm_format_helper_test ==============
[10:23:22] ================= drm_format (18 subtests) =================
[10:23:22] [PASSED] drm_test_format_block_width_invalid
[10:23:22] [PASSED] drm_test_format_block_width_one_plane
[10:23:22] [PASSED] drm_test_format_block_width_two_plane
[10:23:22] [PASSED] drm_test_format_block_width_three_plane
[10:23:22] [PASSED] drm_test_format_block_width_tiled
[10:23:22] [PASSED] drm_test_format_block_height_invalid
[10:23:22] [PASSED] drm_test_format_block_height_one_plane
[10:23:22] [PASSED] drm_test_format_block_height_two_plane
[10:23:22] [PASSED] drm_test_format_block_height_three_plane
[10:23:22] [PASSED] drm_test_format_block_height_tiled
[10:23:22] [PASSED] drm_test_format_min_pitch_invalid
[10:23:22] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:23:22] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:23:22] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:23:22] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:23:22] [PASSED] drm_test_format_min_pitch_two_plane
[10:23:22] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:23:22] [PASSED] drm_test_format_min_pitch_tiled
[10:23:22] =================== [PASSED] drm_format ====================
[10:23:22] ============== drm_framebuffer (10 subtests) ===============
[10:23:22] ========== drm_test_framebuffer_check_src_coords  ==========
[10:23:22] [PASSED] Success: source fits into fb
[10:23:22] [PASSED] Fail: overflowing fb with x-axis coordinate
[10:23:22] [PASSED] Fail: overflowing fb with y-axis coordinate
[10:23:22] [PASSED] Fail: overflowing fb with source width
[10:23:22] [PASSED] Fail: overflowing fb with source height
[10:23:22] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[10:23:22] [PASSED] drm_test_framebuffer_cleanup
[10:23:22] =============== drm_test_framebuffer_create  ===============
[10:23:22] [PASSED] ABGR8888 normal sizes
[10:23:22] [PASSED] ABGR8888 max sizes
[10:23:22] [PASSED] ABGR8888 pitch greater than min required
[10:23:22] [PASSED] ABGR8888 pitch less than min required
[10:23:22] [PASSED] ABGR8888 Invalid width
[10:23:22] [PASSED] ABGR8888 Invalid buffer handle
[10:23:22] [PASSED] No pixel format
[10:23:22] [PASSED] ABGR8888 Width 0
[10:23:22] [PASSED] ABGR8888 Height 0
[10:23:22] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:23:22] [PASSED] ABGR8888 Large buffer offset
[10:23:22] [PASSED] ABGR8888 Buffer offset for inexistent plane
[10:23:22] [PASSED] ABGR8888 Invalid flag
[10:23:22] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:23:22] [PASSED] ABGR8888 Valid buffer modifier
[10:23:22] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:23:22] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:23:22] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:23:22] [PASSED] NV12 Normal sizes
[10:23:22] [PASSED] NV12 Max sizes
[10:23:22] [PASSED] NV12 Invalid pitch
[10:23:22] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:23:22] [PASSED] NV12 different  modifier per-plane
[10:23:22] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:23:22] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:23:22] [PASSED] NV12 Modifier for inexistent plane
[10:23:22] [PASSED] NV12 Handle for inexistent plane
[10:23:22] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:23:22] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:23:22] [PASSED] YVU420 Normal sizes
[10:23:22] [PASSED] YVU420 Max sizes
[10:23:22] [PASSED] YVU420 Invalid pitch
[10:23:22] [PASSED] YVU420 Different pitches
[10:23:22] [PASSED] YVU420 Different buffer offsets/pitches
[10:23:22] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:23:22] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:23:22] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:23:22] [PASSED] YVU420 Valid modifier
[10:23:22] [PASSED] YVU420 Different modifiers per plane
[10:23:22] [PASSED] YVU420 Modifier for inexistent plane
[10:23:22] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[10:23:22] [PASSED] X0L2 Normal sizes
[10:23:22] [PASSED] X0L2 Max sizes
[10:23:22] [PASSED] X0L2 Invalid pitch
[10:23:22] [PASSED] X0L2 Pitch greater than minimum required
[10:23:22] [PASSED] X0L2 Handle for inexistent plane
[10:23:22] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:23:22] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:23:22] [PASSED] X0L2 Valid modifier
[10:23:22] [PASSED] X0L2 Modifier for inexistent plane
[10:23:22] =========== [PASSED] drm_test_framebuffer_create ===========
[10:23:22] [PASSED] drm_test_framebuffer_free
[10:23:22] [PASSED] drm_test_framebuffer_init
[10:23:22] [PASSED] drm_test_framebuffer_init_bad_format
[10:23:22] [PASSED] drm_test_framebuffer_init_dev_mismatch
[10:23:22] [PASSED] drm_test_framebuffer_lookup
[10:23:22] [PASSED] drm_test_framebuffer_lookup_inexistent
[10:23:22] [PASSED] drm_test_framebuffer_modifiers_not_supported
[10:23:22] ================= [PASSED] drm_framebuffer =================
[10:23:22] ================ drm_gem_shmem (8 subtests) ================
[10:23:22] [PASSED] drm_gem_shmem_test_obj_create
[10:23:22] [PASSED] drm_gem_shmem_test_obj_create_private
[10:23:22] [PASSED] drm_gem_shmem_test_pin_pages
[10:23:22] [PASSED] drm_gem_shmem_test_vmap
[10:23:22] [PASSED] drm_gem_shmem_test_get_sg_table
[10:23:22] [PASSED] drm_gem_shmem_test_get_pages_sgt
[10:23:22] [PASSED] drm_gem_shmem_test_madvise
[10:23:22] [PASSED] drm_gem_shmem_test_purge
[10:23:22] ================== [PASSED] drm_gem_shmem ==================
[10:23:22] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[10:23:22] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[10:23:22] [PASSED] Automatic
[10:23:22] [PASSED] Full
[10:23:22] [PASSED] Limited 16:235
[10:23:22] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[10:23:22] [PASSED] drm_test_check_disable_connector
[10:23:22] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[10:23:22] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[10:23:22] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[10:23:22] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[10:23:22] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[10:23:22] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[10:23:22] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[10:23:22] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[10:23:22] [PASSED] drm_test_check_output_bpc_dvi
[10:23:22] [PASSED] drm_test_check_output_bpc_format_vic_1
[10:23:22] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[10:23:22] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[10:23:22] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[10:23:22] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[10:23:22] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[10:23:22] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[10:23:22] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[10:23:22] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[10:23:22] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[10:23:22] [PASSED] drm_test_check_broadcast_rgb_value
[10:23:22] [PASSED] drm_test_check_bpc_8_value
[10:23:22] [PASSED] drm_test_check_bpc_10_value
[10:23:22] [PASSED] drm_test_check_bpc_12_value
[10:23:22] [PASSED] drm_test_check_format_value
[10:23:22] [PASSED] drm_test_check_tmds_char_value
[10:23:22] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[10:23:22] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[10:23:22] [PASSED] drm_test_check_mode_valid
[10:23:22] [PASSED] drm_test_check_mode_valid_reject
[10:23:22] [PASSED] drm_test_check_mode_valid_reject_rate
[10:23:22] [PASSED] drm_test_check_mode_valid_reject_max_clock
[10:23:22] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[10:23:22] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[10:23:22] [PASSED] drm_test_check_infoframes
[10:23:22] [PASSED] drm_test_check_reject_avi_infoframe
[10:23:22] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[10:23:22] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[10:23:22] [PASSED] drm_test_check_reject_audio_infoframe
[10:23:22] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[10:23:22] ================= drm_managed (2 subtests) =================
[10:23:22] [PASSED] drm_test_managed_release_action
[10:23:22] [PASSED] drm_test_managed_run_action
[10:23:22] =================== [PASSED] drm_managed ===================
[10:23:22] =================== drm_mm (6 subtests) ====================
[10:23:22] [PASSED] drm_test_mm_init
[10:23:22] [PASSED] drm_test_mm_debug
[10:23:22] [PASSED] drm_test_mm_align32
[10:23:22] [PASSED] drm_test_mm_align64
[10:23:22] [PASSED] drm_test_mm_lowest
[10:23:22] [PASSED] drm_test_mm_highest
[10:23:22] ===================== [PASSED] drm_mm ======================
[10:23:22] ============= drm_modes_analog_tv (5 subtests) =============
[10:23:22] [PASSED] drm_test_modes_analog_tv_mono_576i
[10:23:22] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:23:22] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:23:22] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:23:22] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:23:22] =============== [PASSED] drm_modes_analog_tv ===============
[10:23:22] ============== drm_plane_helper (2 subtests) ===============
[10:23:22] =============== drm_test_check_plane_state  ================
[10:23:22] [PASSED] clipping_simple
[10:23:22] [PASSED] clipping_rotate_reflect
[10:23:22] [PASSED] positioning_simple
[10:23:22] [PASSED] upscaling
[10:23:22] [PASSED] downscaling
[10:23:22] [PASSED] rounding1
[10:23:22] [PASSED] rounding2
[10:23:22] [PASSED] rounding3
[10:23:22] [PASSED] rounding4
[10:23:22] =========== [PASSED] drm_test_check_plane_state ============
[10:23:22] =========== drm_test_check_invalid_plane_state  ============
[10:23:22] [PASSED] positioning_invalid
[10:23:22] [PASSED] upscaling_invalid
[10:23:22] [PASSED] downscaling_invalid
[10:23:22] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:23:22] ================ [PASSED] drm_plane_helper =================
[10:23:22] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[10:23:22] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:23:22] [PASSED] None
[10:23:22] [PASSED] PAL
[10:23:22] [PASSED] NTSC
[10:23:22] [PASSED] Both, NTSC Default
[10:23:22] [PASSED] Both, PAL Default
[10:23:22] [PASSED] Both, NTSC Default, with PAL on command-line
[10:23:22] [PASSED] Both, PAL Default, with NTSC on command-line
[10:23:22] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:23:22] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:23:22] ================== drm_rect (9 subtests) ===================
[10:23:22] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:23:22] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:23:22] [PASSED] drm_test_rect_clip_scaled_clipped
[10:23:22] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:23:22] ================= drm_test_rect_intersect  =================
[10:23:22] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:23:22] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[10:23:22] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:23:22] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:23:22] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:23:22] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:23:22] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:23:22] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:23:22] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:23:22] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:23:22] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:23:22] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:23:22] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:23:22] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:23:22] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:23:22] ============= [PASSED] drm_test_rect_intersect =============
[10:23:22] ================ drm_test_rect_calc_hscale  ================
[10:23:22] [PASSED] normal use
[10:23:22] [PASSED] out of max range
[10:23:22] [PASSED] out of min range
[10:23:22] [PASSED] zero dst
[10:23:22] [PASSED] negative src
[10:23:22] [PASSED] negative dst
[10:23:22] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:23:22] ================ drm_test_rect_calc_vscale  ================
[10:23:22] [PASSED] normal use
[10:23:22] [PASSED] out of max range
[10:23:22] [PASSED] out of min range
[10:23:22] [PASSED] zero dst
[10:23:22] [PASSED] negative src
[10:23:22] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[10:23:22] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:23:22] ================== drm_test_rect_rotate  ===================
[10:23:22] [PASSED] reflect-x
[10:23:22] [PASSED] reflect-y
[10:23:22] [PASSED] rotate-0
[10:23:22] [PASSED] rotate-90
[10:23:22] [PASSED] rotate-180
[10:23:22] [PASSED] rotate-270
[10:23:22] ============== [PASSED] drm_test_rect_rotate ===============
[10:23:22] ================ drm_test_rect_rotate_inv  =================
[10:23:22] [PASSED] reflect-x
[10:23:22] [PASSED] reflect-y
[10:23:22] [PASSED] rotate-0
[10:23:22] [PASSED] rotate-90
[10:23:22] [PASSED] rotate-180
[10:23:22] [PASSED] rotate-270
[10:23:22] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:23:22] ==================== [PASSED] drm_rect =====================
[10:23:22] ============ drm_sysfb_modeset_test (1 subtest) ============
[10:23:22] ============ drm_test_sysfb_build_fourcc_list  =============
[10:23:22] [PASSED] no native formats
[10:23:22] [PASSED] XRGB8888 as native format
[10:23:22] [PASSED] remove duplicates
[10:23:22] [PASSED] convert alpha formats
[10:23:22] [PASSED] random formats
[10:23:22] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[10:23:22] ============= [PASSED] drm_sysfb_modeset_test ==============
[10:23:22] ================== drm_fixp (2 subtests) ===================
[10:23:22] [PASSED] drm_test_int2fixp
[10:23:22] [PASSED] drm_test_sm2fixp
[10:23:22] ==================== [PASSED] drm_fixp =====================
[10:23:22] ============================================================
[10:23:22] Testing complete. Ran 621 tests: passed: 621
[10:23:22] Elapsed time: 25.861s total, 1.659s configuring, 24.032s building, 0.130s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[10:23:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:23:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:23:33] Starting KUnit Kernel (1/1)...
[10:23:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:23:33] ================= ttm_device (5 subtests) ==================
[10:23:33] [PASSED] ttm_device_init_basic
[10:23:33] [PASSED] ttm_device_init_multiple
[10:23:33] [PASSED] ttm_device_fini_basic
[10:23:33] [PASSED] ttm_device_init_no_vma_man
[10:23:33] ================== ttm_device_init_pools  ==================
[10:23:33] [PASSED] No DMA allocations, no DMA32 required
[10:23:33] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[10:23:33] Expected !list_lru_count(&pt.pages) to be false, but is true
[10:23:33] [FAILED] DMA allocations, DMA32 required
[10:23:33] [PASSED] No DMA allocations, DMA32 required
[10:23:33]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
[10:23:33]     Expected !list_lru_count(&pt.pages) to be false, but is true
[10:23:33] ------------[ cut here ]------------
[10:23:33] WARNING: lib/refcount.c:28 at devres_release_all+0xaa/0x100, CPU#0: kunit_try_catch/46
[10:23:33] refcount_t: underflow; use-after-free.
[10:23:33] CPU: 0 UID: 0 PID: 46 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g221d0418dcfd #3 VOLUNTARY
[10:23:33] Tainted: [W]=WARN, [N]=TEST
[10:23:33] Stack:
[10:23:33]  6044ed8b 00000000 00000000 00000001
[10:23:33]  ffffff00 6044ed8b 6032367a 00000009
[10:23:33]  0000001c 60043e88 6002381c a88cbd40
[10:23:33] Call Trace:
[10:23:33]  [<6032367a>] ? devres_release_all+0xaa/0x100
[10:23:33]  [<60043e88>] ? dump_stack_lvl+0x5e/0x7a
[10:23:33]  [<6002381c>] ? _printk+0x0/0x65
[10:23:33]  [<6001f09f>] ? __warn.cold+0x79/0x11f
[10:23:33]  [<6001f1d9>] ? warn_slowpath_fmt+0x94/0xa1
[10:23:33]  [<601ef1a0>] ? kernfs_free_rcu+0x0/0x70
[10:23:33]  [<60052e36>] ? um_set_signals+0x36/0x60
[10:23:33]  [<600c5a42>] ? call_rcu+0x52/0x90
[10:23:33]  [<6001f145>] ? warn_slowpath_fmt+0x0/0xa1
[10:23:33]  [<60147f50>] ? kfree+0x0/0x250
[10:23:33]  [<6032367a>] ? devres_release_all+0xaa/0x100
[10:23:33]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[10:23:33]  [<6031c3c0>] ? bus_notify+0x0/0x60
[10:23:33]  [<60396bb0>] ? mutex_unlock+0x0/0x30
[10:23:33]  [<60398620>] ? mutex_lock+0x0/0x40
[10:23:33]  [<6031ca24>] ? device_unbind_cleanup+0x14/0xb0
[10:23:33]  [<6031e1f6>] ? device_release_driver_internal+0x256/0x2b0
[10:23:33]  [<60372210>] ? kobject_put+0x0/0x150
[10:23:33]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[10:23:33]  [<6031c00f>] ? bus_remove_device+0x10f/0x1a0
[10:23:33]  [<601f3d40>] ? sysfs_remove_file_ns+0x0/0x20
[10:23:33]  [<601f17b8>] ? kernfs_remove_by_name_ns+0x98/0x130
[10:23:33]  [<60315a8c>] ? device_del+0x1bc/0x600
[10:23:33]  [<60052e00>] ? um_set_signals+0x0/0x60
[10:23:33]  [<6025b2a0>] ? device_unregister_wrapper+0x0/0x10
[10:23:33]  [<60052e00>] ? um_set_signals+0x0/0x60
[10:23:33]  [<60315ee4>] ? device_unregister+0x14/0x40
[10:23:33]  [<60257e66>] ? kunit_release_action+0xf6/0x170
[10:23:33]  [<60257d70>] ? kunit_release_action+0x0/0x170
[10:23:33]  [<6025b2e2>] ? kunit_device_unregister+0x32/0x80
[10:23:33]  [<60259890>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[10:23:33]  [<6025748e>] ? kunit_try_run_case_cleanup+0x2e/0x40
[10:23:33]  [<602598a6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[10:23:33]  [<60081e36>] ? kthread+0xe6/0x150
[10:23:33]  [<60046435>] ? new_thread_handler+0x45/0x60
[10:23:33] ---[ end trace 0000000000000000 ]---
[10:23:33] [FAILED] DMA allocations, no DMA32 required
[10:23:33] # ttm_device_init_pools: pass:2 fail:2 skip:0 total:4
[10:23:33] ============== [FAILED] ttm_device_init_pools ==============
[10:23:33]     # module: ttm_device_test
[10:23:33] # ttm_device: pass:4 fail:1 skip:0 total:5
[10:23:33] # Totals: pass:6 fail:2 skip:0 total:8
[10:23:33] =================== [FAILED] ttm_device ====================
[10:23:33] ================== ttm_pool (8 subtests) ===================
[10:23:33] ================== ttm_pool_alloc_basic  ===================
[10:23:33] [PASSED] One page
[10:23:33] [PASSED] More than one page
[10:23:33] [PASSED] Above the allocation limit
[10:23:33] [PASSED] One page, with coherent DMA mappings enabled
[10:23:33] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:23:33] ============== [PASSED] ttm_pool_alloc_basic ===============
[10:23:33] ============== ttm_pool_alloc_basic_dma_addr  ==============
[10:23:33] [PASSED] One page
[10:23:33] [PASSED] More than one page
[10:23:33] [PASSED] Above the allocation limit
[10:23:33] [PASSED] One page, with coherent DMA mappings enabled
[10:23:33] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:23:33] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[10:23:33] [PASSED] ttm_pool_alloc_order_caching_match
[10:23:33] [PASSED] ttm_pool_alloc_caching_mismatch
[10:23:33] [PASSED] ttm_pool_alloc_order_mismatch
[10:23:33] [PASSED] ttm_pool_free_dma_alloc
[10:23:33] [ERROR] Test: ttm_pool: missing expected subtest!
[10:23:33] 
[10:23:33] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g221d0418dcfd
[10:23:33] RIP: 0033:list_lru_count_node+0xe/0x20
[10:23:33] RSP: 00000000a88cbed8  EFLAGS: 00010246
[10:23:33] RAX: 0000000000000000 RBX: 00000000a8803c90 RCX: 0000000068e4c7d8
[10:23:33] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000068c86880
[10:23:33] RBP: 0000000068c86800 R08: 00000000a7658c28 R09: 0000000068c50c80
[10:23:33] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000068c50c80
[10:23:33] R13: 0000000060440770 R14: 000000006010eb50 R15: 0000000068c86880
[10:23:33] Kernel panic - not syncing: Segfault with no mm
[10:23:33] [CRASHED] 
[10:23:33] [ERROR] Test: ttm_pool: missing expected subtest!
[10:23:33] [CRASHED] 
[10:23:33] [ERROR] Test: ttm_pool: missing subtest result line!
[10:23:33] # module: ttm_pool_test
[10:23:33] ==================== [CRASHED] ttm_pool ====================
[10:23:33] [ERROR] Test: main: missing expected subtest!
[10:23:33] [CRASHED] 
[10:23:33] [ERROR] Test: main: missing expected subtest!
[10:23:33] [CRASHED] 
[10:23:33] [ERROR] Test: main: missing expected subtest!
[10:23:33] [CRASHED] 
[10:23:33] [ERROR] Test: main: missing expected subtest!
[10:23:33] [CRASHED] 
[10:23:33] ============================================================
[10:23:33] Testing complete. Ran 28 tests: passed: 20, failed: 2, crashed: 6, errors: 7
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[10:23:33] Elapsed time: 11.639s total, 1.718s configuring, 9.605s building, 0.317s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


