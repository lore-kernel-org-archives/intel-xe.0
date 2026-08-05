Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D952C55822
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 05:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2378110ECAF;
	Wed,  5 Aug 2026 05:42:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DEC10ECCB;
 Wed,  5 Aug 2026 05:41:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/pagemap=3A_Fix_folio_alloc?=
 =?utf-8?q?ation_fallback_and_use-after-put_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 05:41:58 -0000
Message-ID: <178590851848.20141.11856721455786844676@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805051744.3481873-1-matthew.brost@intel.com>
In-Reply-To: <20260805051744.3481873-1-matthew.brost@intel.com>
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

Series: drm/pagemap: Fix folio allocation fallback and use-after-put (rev2)
URL   : https://patchwork.freedesktop.org/series/171624/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[05:40:38] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:40:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:41:14] Starting KUnit Kernel (1/1)...
[05:41:14] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:41:14] ================== guc_buf (11 subtests) ===================
[05:41:14] [PASSED] test_smallest
[05:41:14] [PASSED] test_largest
[05:41:14] [PASSED] test_granular
[05:41:14] [PASSED] test_unique
[05:41:14] [PASSED] test_overlap
[05:41:14] [PASSED] test_reusable
[05:41:14] [PASSED] test_too_big
[05:41:14] [PASSED] test_flush
[05:41:14] [PASSED] test_lookup
[05:41:14] [PASSED] test_data
[05:41:14] [PASSED] test_class
[05:41:14] ===================== [PASSED] guc_buf =====================
[05:41:14] =================== guc_dbm (7 subtests) ===================
[05:41:14] [PASSED] test_empty
[05:41:14] [PASSED] test_default
[05:41:14] ======================== test_size  ========================
[05:41:14] [PASSED] 4
[05:41:14] [PASSED] 8
[05:41:14] [PASSED] 32
[05:41:14] [PASSED] 256
[05:41:14] ==================== [PASSED] test_size ====================
[05:41:14] ======================= test_reuse  ========================
[05:41:14] [PASSED] 4
[05:41:14] [PASSED] 8
[05:41:14] [PASSED] 32
[05:41:14] [PASSED] 256
[05:41:14] =================== [PASSED] test_reuse ====================
[05:41:14] =================== test_range_overlap  ====================
[05:41:14] [PASSED] 4
[05:41:14] [PASSED] 8
[05:41:14] [PASSED] 32
[05:41:14] [PASSED] 256
[05:41:14] =============== [PASSED] test_range_overlap ================
[05:41:14] =================== test_range_compact  ====================
[05:41:14] [PASSED] 4
[05:41:14] [PASSED] 8
[05:41:14] [PASSED] 32
[05:41:14] [PASSED] 256
[05:41:14] =============== [PASSED] test_range_compact ================
[05:41:14] ==================== test_range_spare  =====================
[05:41:14] [PASSED] 4
[05:41:14] [PASSED] 8
[05:41:14] [PASSED] 32
[05:41:14] [PASSED] 256
[05:41:14] ================ [PASSED] test_range_spare =================
[05:41:14] ===================== [PASSED] guc_dbm =====================
[05:41:14] =================== guc_idm (6 subtests) ===================
[05:41:14] [PASSED] bad_init
[05:41:14] [PASSED] no_init
[05:41:14] [PASSED] init_fini
[05:41:14] [PASSED] check_used
[05:41:15] [PASSED] check_quota
[05:41:15] [PASSED] check_all
[05:41:15] ===================== [PASSED] guc_idm =====================
[05:41:15] =============== guc_klv_helpers (9 subtests) ===============
[05:41:15] [PASSED] test_count
[05:41:15] [PASSED] test_encode_u32
[05:41:15] [PASSED] test_encode_u64
[05:41:15] [PASSED] test_encode_string
[05:41:15] [PASSED] test_encode_object_raw
[05:41:15] [PASSED] test_encode_object_klv
[05:41:15] [PASSED] test_encode_object_nested
[05:41:15] [PASSED] test_encode_object_basic
[05:41:15] [PASSED] test_print
[05:41:15] ================= [PASSED] guc_klv_helpers =================
[05:41:15] ================== no_relay (3 subtests) ===================
[05:41:15] [PASSED] xe_drops_guc2pf_if_not_ready
[05:41:15] [PASSED] xe_drops_guc2vf_if_not_ready
[05:41:15] [PASSED] xe_rejects_send_if_not_ready
[05:41:15] ==================== [PASSED] no_relay =====================
[05:41:15] ================== pf_relay (14 subtests) ==================
[05:41:15] [PASSED] pf_rejects_guc2pf_too_short
[05:41:15] [PASSED] pf_rejects_guc2pf_too_long
[05:41:15] [PASSED] pf_rejects_guc2pf_no_payload
[05:41:15] [PASSED] pf_fails_no_payload
[05:41:15] [PASSED] pf_fails_bad_origin
[05:41:15] [PASSED] pf_fails_bad_type
[05:41:15] [PASSED] pf_txn_reports_error
[05:41:15] [PASSED] pf_txn_sends_pf2guc
[05:41:15] [PASSED] pf_sends_pf2guc
[05:41:15] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:41:15] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:41:15] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:41:15] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:41:15] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:41:15] ==================== [PASSED] pf_relay =====================
[05:41:15] ================== vf_relay (3 subtests) ===================
[05:41:15] [PASSED] vf_rejects_guc2vf_too_short
[05:41:15] [PASSED] vf_rejects_guc2vf_too_long
[05:41:15] [PASSED] vf_rejects_guc2vf_no_payload
[05:41:15] ==================== [PASSED] vf_relay =====================
[05:41:15] ================ pf_gt_config (9 subtests) =================
[05:41:15] [PASSED] fair_contexts_1vf
[05:41:15] [PASSED] fair_doorbells_1vf
[05:41:15] [PASSED] fair_ggtt_1vf
[05:41:15] ====================== fair_vram_1vf  ======================
[05:41:15] [PASSED] 3.50 GiB
[05:41:15] [PASSED] 11.5 GiB
[05:41:15] [PASSED] 15.5 GiB
[05:41:15] [PASSED] 31.5 GiB
[05:41:15] [PASSED] 63.5 GiB
[05:41:15] [PASSED] 1.91 GiB
[05:41:15] ================== [PASSED] fair_vram_1vf ==================
[05:41:15] ================ fair_vram_1vf_admin_only  =================
[05:41:15] [PASSED] 3.50 GiB
[05:41:15] [PASSED] 11.5 GiB
[05:41:15] [PASSED] 15.5 GiB
[05:41:15] [PASSED] 31.5 GiB
[05:41:15] [PASSED] 63.5 GiB
[05:41:15] [PASSED] 1.91 GiB
[05:41:15] ============ [PASSED] fair_vram_1vf_admin_only =============
[05:41:15] ====================== fair_contexts  ======================
[05:41:15] [PASSED] 1 VF
[05:41:15] [PASSED] 2 VFs
[05:41:15] [PASSED] 3 VFs
[05:41:15] [PASSED] 4 VFs
[05:41:15] [PASSED] 5 VFs
[05:41:15] [PASSED] 6 VFs
[05:41:15] [PASSED] 7 VFs
[05:41:15] [PASSED] 8 VFs
[05:41:15] [PASSED] 9 VFs
[05:41:15] [PASSED] 10 VFs
[05:41:15] [PASSED] 11 VFs
[05:41:15] [PASSED] 12 VFs
[05:41:15] [PASSED] 13 VFs
[05:41:15] [PASSED] 14 VFs
[05:41:15] [PASSED] 15 VFs
[05:41:15] [PASSED] 16 VFs
[05:41:15] [PASSED] 17 VFs
[05:41:15] [PASSED] 18 VFs
[05:41:15] [PASSED] 19 VFs
[05:41:15] [PASSED] 20 VFs
[05:41:15] [PASSED] 21 VFs
[05:41:15] [PASSED] 22 VFs
[05:41:15] [PASSED] 23 VFs
[05:41:15] [PASSED] 24 VFs
[05:41:15] [PASSED] 25 VFs
[05:41:15] [PASSED] 26 VFs
[05:41:15] [PASSED] 27 VFs
[05:41:15] [PASSED] 28 VFs
[05:41:15] [PASSED] 29 VFs
[05:41:15] [PASSED] 30 VFs
[05:41:15] [PASSED] 31 VFs
[05:41:15] [PASSED] 32 VFs
[05:41:15] [PASSED] 33 VFs
[05:41:15] [PASSED] 34 VFs
[05:41:15] [PASSED] 35 VFs
[05:41:15] [PASSED] 36 VFs
[05:41:15] [PASSED] 37 VFs
[05:41:15] [PASSED] 38 VFs
[05:41:15] [PASSED] 39 VFs
[05:41:15] [PASSED] 40 VFs
[05:41:15] [PASSED] 41 VFs
[05:41:15] [PASSED] 42 VFs
[05:41:15] [PASSED] 43 VFs
[05:41:15] [PASSED] 44 VFs
[05:41:15] [PASSED] 45 VFs
[05:41:15] [PASSED] 46 VFs
[05:41:15] [PASSED] 47 VFs
[05:41:15] [PASSED] 48 VFs
[05:41:15] [PASSED] 49 VFs
[05:41:15] [PASSED] 50 VFs
[05:41:15] [PASSED] 51 VFs
[05:41:15] [PASSED] 52 VFs
[05:41:15] [PASSED] 53 VFs
[05:41:15] [PASSED] 54 VFs
[05:41:15] [PASSED] 55 VFs
[05:41:15] [PASSED] 56 VFs
[05:41:15] [PASSED] 57 VFs
[05:41:15] [PASSED] 58 VFs
[05:41:15] [PASSED] 59 VFs
[05:41:15] [PASSED] 60 VFs
[05:41:15] [PASSED] 61 VFs
[05:41:15] [PASSED] 62 VFs
[05:41:15] [PASSED] 63 VFs
[05:41:15] ================== [PASSED] fair_contexts ==================
[05:41:15] ===================== fair_doorbells  ======================
[05:41:15] [PASSED] 1 VF
[05:41:15] [PASSED] 2 VFs
[05:41:15] [PASSED] 3 VFs
[05:41:15] [PASSED] 4 VFs
[05:41:15] [PASSED] 5 VFs
[05:41:15] [PASSED] 6 VFs
[05:41:15] [PASSED] 7 VFs
[05:41:15] [PASSED] 8 VFs
[05:41:15] [PASSED] 9 VFs
[05:41:15] [PASSED] 10 VFs
[05:41:15] [PASSED] 11 VFs
[05:41:15] [PASSED] 12 VFs
[05:41:15] [PASSED] 13 VFs
[05:41:15] [PASSED] 14 VFs
[05:41:15] [PASSED] 15 VFs
[05:41:15] [PASSED] 16 VFs
[05:41:15] [PASSED] 17 VFs
[05:41:15] [PASSED] 18 VFs
[05:41:15] [PASSED] 19 VFs
[05:41:15] [PASSED] 20 VFs
[05:41:15] [PASSED] 21 VFs
[05:41:15] [PASSED] 22 VFs
[05:41:15] [PASSED] 23 VFs
[05:41:15] [PASSED] 24 VFs
[05:41:15] [PASSED] 25 VFs
[05:41:15] [PASSED] 26 VFs
[05:41:15] [PASSED] 27 VFs
[05:41:15] [PASSED] 28 VFs
[05:41:15] [PASSED] 29 VFs
[05:41:15] [PASSED] 30 VFs
[05:41:15] [PASSED] 31 VFs
[05:41:15] [PASSED] 32 VFs
[05:41:15] [PASSED] 33 VFs
[05:41:15] [PASSED] 34 VFs
[05:41:15] [PASSED] 35 VFs
[05:41:15] [PASSED] 36 VFs
[05:41:15] [PASSED] 37 VFs
[05:41:15] [PASSED] 38 VFs
[05:41:15] [PASSED] 39 VFs
[05:41:15] [PASSED] 40 VFs
[05:41:15] [PASSED] 41 VFs
[05:41:15] [PASSED] 42 VFs
[05:41:15] [PASSED] 43 VFs
[05:41:15] [PASSED] 44 VFs
[05:41:15] [PASSED] 45 VFs
[05:41:15] [PASSED] 46 VFs
[05:41:15] [PASSED] 47 VFs
[05:41:15] [PASSED] 48 VFs
[05:41:15] [PASSED] 49 VFs
[05:41:15] [PASSED] 50 VFs
[05:41:15] [PASSED] 51 VFs
[05:41:15] [PASSED] 52 VFs
[05:41:15] [PASSED] 53 VFs
[05:41:15] [PASSED] 54 VFs
[05:41:15] [PASSED] 55 VFs
[05:41:15] [PASSED] 56 VFs
[05:41:15] [PASSED] 57 VFs
[05:41:15] [PASSED] 58 VFs
[05:41:15] [PASSED] 59 VFs
[05:41:15] [PASSED] 60 VFs
[05:41:15] [PASSED] 61 VFs
[05:41:15] [PASSED] 62 VFs
[05:41:15] [PASSED] 63 VFs
[05:41:15] ================= [PASSED] fair_doorbells ==================
[05:41:15] ======================== fair_ggtt  ========================
[05:41:15] [PASSED] 1 VF
[05:41:15] [PASSED] 2 VFs
[05:41:15] [PASSED] 3 VFs
[05:41:15] [PASSED] 4 VFs
[05:41:15] [PASSED] 5 VFs
[05:41:15] [PASSED] 6 VFs
[05:41:15] [PASSED] 7 VFs
[05:41:15] [PASSED] 8 VFs
[05:41:15] [PASSED] 9 VFs
[05:41:15] [PASSED] 10 VFs
[05:41:15] [PASSED] 11 VFs
[05:41:15] [PASSED] 12 VFs
[05:41:15] [PASSED] 13 VFs
[05:41:15] [PASSED] 14 VFs
[05:41:15] [PASSED] 15 VFs
[05:41:15] [PASSED] 16 VFs
[05:41:15] [PASSED] 17 VFs
[05:41:15] [PASSED] 18 VFs
[05:41:15] [PASSED] 19 VFs
[05:41:15] [PASSED] 20 VFs
[05:41:15] [PASSED] 21 VFs
[05:41:15] [PASSED] 22 VFs
[05:41:15] [PASSED] 23 VFs
[05:41:15] [PASSED] 24 VFs
[05:41:15] [PASSED] 25 VFs
[05:41:15] [PASSED] 26 VFs
[05:41:15] [PASSED] 27 VFs
[05:41:15] [PASSED] 28 VFs
[05:41:15] [PASSED] 29 VFs
[05:41:15] [PASSED] 30 VFs
[05:41:15] [PASSED] 31 VFs
[05:41:15] [PASSED] 32 VFs
[05:41:15] [PASSED] 33 VFs
[05:41:15] [PASSED] 34 VFs
[05:41:15] [PASSED] 35 VFs
[05:41:15] [PASSED] 36 VFs
[05:41:15] [PASSED] 37 VFs
[05:41:15] [PASSED] 38 VFs
[05:41:15] [PASSED] 39 VFs
[05:41:15] [PASSED] 40 VFs
[05:41:15] [PASSED] 41 VFs
[05:41:15] [PASSED] 42 VFs
[05:41:15] [PASSED] 43 VFs
[05:41:15] [PASSED] 44 VFs
[05:41:15] [PASSED] 45 VFs
[05:41:15] [PASSED] 46 VFs
[05:41:15] [PASSED] 47 VFs
[05:41:15] [PASSED] 48 VFs
[05:41:15] [PASSED] 49 VFs
[05:41:15] [PASSED] 50 VFs
[05:41:15] [PASSED] 51 VFs
[05:41:15] [PASSED] 52 VFs
[05:41:15] [PASSED] 53 VFs
[05:41:15] [PASSED] 54 VFs
[05:41:15] [PASSED] 55 VFs
[05:41:15] [PASSED] 56 VFs
[05:41:15] [PASSED] 57 VFs
[05:41:15] [PASSED] 58 VFs
[05:41:15] [PASSED] 59 VFs
[05:41:15] [PASSED] 60 VFs
[05:41:15] [PASSED] 61 VFs
[05:41:15] [PASSED] 62 VFs
[05:41:15] [PASSED] 63 VFs
[05:41:15] ==================== [PASSED] fair_ggtt ====================
[05:41:15] ======================== fair_vram  ========================
[05:41:15] [PASSED] 1 VF
[05:41:15] [PASSED] 2 VFs
[05:41:15] [PASSED] 3 VFs
[05:41:15] [PASSED] 4 VFs
[05:41:15] [PASSED] 5 VFs
[05:41:15] [PASSED] 6 VFs
[05:41:15] [PASSED] 7 VFs
[05:41:15] [PASSED] 8 VFs
[05:41:15] [PASSED] 9 VFs
[05:41:15] [PASSED] 10 VFs
[05:41:15] [PASSED] 11 VFs
[05:41:15] [PASSED] 12 VFs
[05:41:15] [PASSED] 13 VFs
[05:41:15] [PASSED] 14 VFs
[05:41:15] [PASSED] 15 VFs
[05:41:15] [PASSED] 16 VFs
[05:41:15] [PASSED] 17 VFs
[05:41:15] [PASSED] 18 VFs
[05:41:15] [PASSED] 19 VFs
[05:41:15] [PASSED] 20 VFs
[05:41:15] [PASSED] 21 VFs
[05:41:15] [PASSED] 22 VFs
[05:41:15] [PASSED] 23 VFs
[05:41:15] [PASSED] 24 VFs
[05:41:15] [PASSED] 25 VFs
[05:41:15] [PASSED] 26 VFs
[05:41:15] [PASSED] 27 VFs
[05:41:15] [PASSED] 28 VFs
[05:41:15] [PASSED] 29 VFs
[05:41:15] [PASSED] 30 VFs
[05:41:15] [PASSED] 31 VFs
[05:41:15] [PASSED] 32 VFs
[05:41:15] [PASSED] 33 VFs
[05:41:15] [PASSED] 34 VFs
[05:41:15] [PASSED] 35 VFs
[05:41:15] [PASSED] 36 VFs
[05:41:15] [PASSED] 37 VFs
[05:41:15] [PASSED] 38 VFs
[05:41:15] [PASSED] 39 VFs
[05:41:15] [PASSED] 40 VFs
[05:41:15] [PASSED] 41 VFs
[05:41:15] [PASSED] 42 VFs
[05:41:15] [PASSED] 43 VFs
[05:41:15] [PASSED] 44 VFs
[05:41:15] [PASSED] 45 VFs
[05:41:15] [PASSED] 46 VFs
[05:41:15] [PASSED] 47 VFs
[05:41:15] [PASSED] 48 VFs
[05:41:15] [PASSED] 49 VFs
[05:41:15] [PASSED] 50 VFs
[05:41:15] [PASSED] 51 VFs
[05:41:15] [PASSED] 52 VFs
[05:41:15] [PASSED] 53 VFs
[05:41:15] [PASSED] 54 VFs
[05:41:15] [PASSED] 55 VFs
[05:41:15] [PASSED] 56 VFs
[05:41:15] [PASSED] 57 VFs
[05:41:15] [PASSED] 58 VFs
[05:41:15] [PASSED] 59 VFs
[05:41:15] [PASSED] 60 VFs
[05:41:15] [PASSED] 61 VFs
[05:41:15] [PASSED] 62 VFs
[05:41:15] [PASSED] 63 VFs
[05:41:15] ==================== [PASSED] fair_vram ====================
[05:41:15] ================== [PASSED] pf_gt_config ===================
[05:41:15] ===================== lmtt (1 subtest) =====================
[05:41:15] ======================== test_ops  =========================
[05:41:15] [PASSED] 2-level
[05:41:15] [PASSED] multi-level
[05:41:15] ==================== [PASSED] test_ops =====================
[05:41:15] ====================== [PASSED] lmtt =======================
[05:41:15] ================= sriov_packet (1 subtest) =================
[05:41:15] [PASSED] test_descriptor_init
[05:41:15] ================== [PASSED] sriov_packet ===================
[05:41:15] ================= pf_service (11 subtests) =================
[05:41:15] [PASSED] pf_negotiate_any
[05:41:15] [PASSED] pf_negotiate_base_match
[05:41:15] [PASSED] pf_negotiate_base_newer
[05:41:15] [PASSED] pf_negotiate_base_next
[05:41:15] [SKIPPED] pf_negotiate_base_older (no older minor)
[05:41:15] [PASSED] pf_negotiate_base_prev
[05:41:15] [PASSED] pf_negotiate_latest_match
[05:41:15] [PASSED] pf_negotiate_latest_newer
[05:41:15] [PASSED] pf_negotiate_latest_next
[05:41:15] [SKIPPED] pf_negotiate_latest_older (no older minor)
[05:41:15] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[05:41:15] =================== [PASSED] pf_service ====================
[05:41:15] ================= xe_guc_g2g (2 subtests) ==================
[05:41:15] ============== xe_live_guc_g2g_kunit_default  ==============
[05:41:15] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[05:41:15] ============== xe_live_guc_g2g_kunit_allmem  ===============
[05:41:15] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[05:41:15] =================== [SKIPPED] xe_guc_g2g ===================
[05:41:15] =================== xe_mocs (2 subtests) ===================
[05:41:15] ================ xe_live_mocs_kernel_kunit  ================
[05:41:15] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[05:41:15] ================ xe_live_mocs_reset_kunit  =================
[05:41:15] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[05:41:15] ==================== [SKIPPED] xe_mocs =====================
[05:41:15] ================= xe_migrate (2 subtests) ==================
[05:41:15] ================= xe_migrate_sanity_kunit  =================
[05:41:15] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[05:41:15] ================== xe_validate_ccs_kunit  ==================
[05:41:15] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[05:41:15] =================== [SKIPPED] xe_migrate ===================
[05:41:15] ================== xe_dma_buf (1 subtest) ==================
[05:41:15] ==================== xe_dma_buf_kunit  =====================
[05:41:15] ================ [SKIPPED] xe_dma_buf_kunit ================
[05:41:15] =================== [SKIPPED] xe_dma_buf ===================
[05:41:15] ================= xe_bo_shrink (1 subtest) =================
[05:41:15] =================== xe_bo_shrink_kunit  ====================
[05:41:15] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[05:41:15] ================== [SKIPPED] xe_bo_shrink ==================
[05:41:15] ==================== xe_bo (2 subtests) ====================
[05:41:15] ================== xe_ccs_migrate_kunit  ===================
[05:41:15] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[05:41:15] ==================== xe_bo_evict_kunit  ====================
[05:41:15] =============== [SKIPPED] xe_bo_evict_kunit ================
[05:41:15] ===================== [SKIPPED] xe_bo ======================
[05:41:15] ==================== args (13 subtests) ====================
[05:41:15] [PASSED] count_args_test
[05:41:15] [PASSED] call_args_example
[05:41:15] [PASSED] call_args_test
[05:41:15] [PASSED] drop_first_arg_example
[05:41:15] [PASSED] drop_first_arg_test
[05:41:15] [PASSED] first_arg_example
[05:41:15] [PASSED] first_arg_test
[05:41:15] [PASSED] last_arg_example
[05:41:15] [PASSED] last_arg_test
[05:41:15] [PASSED] pick_arg_example
[05:41:15] [PASSED] if_args_example
[05:41:15] [PASSED] if_args_test
[05:41:15] [PASSED] sep_comma_example
[05:41:15] ====================== [PASSED] args =======================
[05:41:15] =================== xe_pci (3 subtests) ====================
[05:41:15] ==================== check_graphics_ip  ====================
[05:41:15] [PASSED] 12.00 Xe_LP
[05:41:15] [PASSED] 12.10 Xe_LP+
[05:41:15] [PASSED] 12.55 Xe_HPG
[05:41:15] [PASSED] 12.60 Xe_HPC
[05:41:15] [PASSED] 12.70 Xe_LPG
[05:41:15] [PASSED] 12.71 Xe_LPG
[05:41:15] [PASSED] 12.74 Xe_LPG+
[05:41:15] [PASSED] 20.01 Xe2_HPG
[05:41:15] [PASSED] 20.02 Xe2_HPG
[05:41:15] [PASSED] 20.04 Xe2_LPG
[05:41:15] [PASSED] 30.00 Xe3_LPG
[05:41:15] [PASSED] 30.01 Xe3_LPG
[05:41:15] [PASSED] 30.03 Xe3_LPG
[05:41:15] [PASSED] 30.04 Xe3_LPG
[05:41:15] [PASSED] 30.05 Xe3_LPG
[05:41:15] [PASSED] 35.10 Xe3p_LPG
[05:41:15] [PASSED] 35.11 Xe3p_XPC
[05:41:15] ================ [PASSED] check_graphics_ip ================
[05:41:15] ===================== check_media_ip  ======================
[05:41:15] [PASSED] 12.00 Xe_M
[05:41:15] [PASSED] 12.55 Xe_HPM
[05:41:15] [PASSED] 13.00 Xe_LPM+
[05:41:15] [PASSED] 13.01 Xe2_HPM
[05:41:15] [PASSED] 20.00 Xe2_LPM
[05:41:15] [PASSED] 30.00 Xe3_LPM
[05:41:15] [PASSED] 30.02 Xe3_LPM
[05:41:15] [PASSED] 35.00 Xe3p_LPM
[05:41:15] [PASSED] 35.03 Xe3p_HPM
[05:41:15] ================= [PASSED] check_media_ip ==================
[05:41:15] =================== check_platform_desc  ===================
[05:41:15] [PASSED] 0x9A60 (TIGERLAKE)
[05:41:15] [PASSED] 0x9A68 (TIGERLAKE)
[05:41:15] [PASSED] 0x9A70 (TIGERLAKE)
[05:41:15] [PASSED] 0x9A40 (TIGERLAKE)
[05:41:15] [PASSED] 0x9A49 (TIGERLAKE)
[05:41:15] [PASSED] 0x9A59 (TIGERLAKE)
[05:41:15] [PASSED] 0x9A78 (TIGERLAKE)
[05:41:15] [PASSED] 0x9AC0 (TIGERLAKE)
[05:41:15] [PASSED] 0x9AC9 (TIGERLAKE)
[05:41:15] [PASSED] 0x9AD9 (TIGERLAKE)
[05:41:15] [PASSED] 0x9AF8 (TIGERLAKE)
[05:41:15] [PASSED] 0x4C80 (ROCKETLAKE)
[05:41:15] [PASSED] 0x4C8A (ROCKETLAKE)
[05:41:15] [PASSED] 0x4C8B (ROCKETLAKE)
[05:41:15] [PASSED] 0x4C8C (ROCKETLAKE)
[05:41:15] [PASSED] 0x4C90 (ROCKETLAKE)
[05:41:15] [PASSED] 0x4C9A (ROCKETLAKE)
[05:41:15] [PASSED] 0x4680 (ALDERLAKE_S)
[05:41:15] [PASSED] 0x4682 (ALDERLAKE_S)
[05:41:15] [PASSED] 0x4688 (ALDERLAKE_S)
[05:41:15] [PASSED] 0x468A (ALDERLAKE_S)
[05:41:15] [PASSED] 0x468B (ALDERLAKE_S)
[05:41:15] [PASSED] 0x4690 (ALDERLAKE_S)
[05:41:15] [PASSED] 0x4692 (ALDERLAKE_S)
[05:41:15] [PASSED] 0x4693 (ALDERLAKE_S)
[05:41:15] [PASSED] 0x46A0 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46A1 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46A2 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46A3 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46A6 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46A8 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46AA (ALDERLAKE_P)
[05:41:15] [PASSED] 0x462A (ALDERLAKE_P)
[05:41:15] [PASSED] 0x4626 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x4628 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46B0 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46B1 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46B2 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46B3 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46C0 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46C1 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46C2 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46C3 (ALDERLAKE_P)
[05:41:15] [PASSED] 0x46D0 (ALDERLAKE_N)
[05:41:15] [PASSED] 0x46D1 (ALDERLAKE_N)
[05:41:15] [PASSED] 0x46D2 (ALDERLAKE_N)
[05:41:15] [PASSED] 0x46D3 (ALDERLAKE_N)
[05:41:15] [PASSED] 0x46D4 (ALDERLAKE_N)
[05:41:15] [PASSED] 0xA721 (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7A1 (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7A9 (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7AC (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7AD (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA720 (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7A0 (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7A8 (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7AA (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA7AB (ALDERLAKE_P)
[05:41:15] [PASSED] 0xA780 (ALDERLAKE_S)
[05:41:15] [PASSED] 0xA781 (ALDERLAKE_S)
[05:41:15] [PASSED] 0xA782 (ALDERLAKE_S)
[05:41:15] [PASSED] 0xA783 (ALDERLAKE_S)
[05:41:15] [PASSED] 0xA788 (ALDERLAKE_S)
[05:41:15] [PASSED] 0xA789 (ALDERLAKE_S)
[05:41:15] [PASSED] 0xA78A (ALDERLAKE_S)
[05:41:15] [PASSED] 0xA78B (ALDERLAKE_S)
[05:41:15] [PASSED] 0x4905 (DG1)
[05:41:15] [PASSED] 0x4906 (DG1)
[05:41:15] [PASSED] 0x4907 (DG1)
[05:41:15] [PASSED] 0x4908 (DG1)
[05:41:15] [PASSED] 0x4909 (DG1)
[05:41:15] [PASSED] 0x56C0 (DG2)
[05:41:15] [PASSED] 0x56C2 (DG2)
[05:41:15] [PASSED] 0x56C1 (DG2)
[05:41:15] [PASSED] 0x7D51 (METEORLAKE)
[05:41:15] [PASSED] 0x7DD1 (METEORLAKE)
[05:41:15] [PASSED] 0x7D41 (METEORLAKE)
[05:41:15] [PASSED] 0x7D67 (METEORLAKE)
[05:41:15] [PASSED] 0xB640 (METEORLAKE)
[05:41:15] [PASSED] 0x56A0 (DG2)
[05:41:15] [PASSED] 0x56A1 (DG2)
[05:41:15] [PASSED] 0x56A2 (DG2)
[05:41:15] [PASSED] 0x56BE (DG2)
[05:41:15] [PASSED] 0x56BF (DG2)
[05:41:15] [PASSED] 0x5690 (DG2)
[05:41:15] [PASSED] 0x5691 (DG2)
[05:41:15] [PASSED] 0x5692 (DG2)
[05:41:15] [PASSED] 0x56A5 (DG2)
[05:41:15] [PASSED] 0x56A6 (DG2)
[05:41:15] [PASSED] 0x56B0 (DG2)
[05:41:15] [PASSED] 0x56B1 (DG2)
[05:41:15] [PASSED] 0x56BA (DG2)
[05:41:15] [PASSED] 0x56BB (DG2)
[05:41:15] [PASSED] 0x56BC (DG2)
[05:41:15] [PASSED] 0x56BD (DG2)
[05:41:15] [PASSED] 0x5693 (DG2)
[05:41:15] [PASSED] 0x5694 (DG2)
[05:41:15] [PASSED] 0x5695 (DG2)
[05:41:15] [PASSED] 0x56A3 (DG2)
[05:41:15] [PASSED] 0x56A4 (DG2)
[05:41:15] [PASSED] 0x56B2 (DG2)
[05:41:15] [PASSED] 0x56B3 (DG2)
[05:41:15] [PASSED] 0x5696 (DG2)
[05:41:15] [PASSED] 0x5697 (DG2)
[05:41:15] [PASSED] 0xB69 (PVC)
[05:41:15] [PASSED] 0xB6E (PVC)
[05:41:15] [PASSED] 0xBD4 (PVC)
[05:41:15] [PASSED] 0xBD5 (PVC)
[05:41:15] [PASSED] 0xBD6 (PVC)
[05:41:15] [PASSED] 0xBD7 (PVC)
[05:41:15] [PASSED] 0xBD8 (PVC)
[05:41:15] [PASSED] 0xBD9 (PVC)
[05:41:15] [PASSED] 0xBDA (PVC)
[05:41:15] [PASSED] 0xBDB (PVC)
[05:41:15] [PASSED] 0xBE0 (PVC)
[05:41:15] [PASSED] 0xBE1 (PVC)
[05:41:15] [PASSED] 0xBE5 (PVC)
[05:41:15] [PASSED] 0x7D40 (METEORLAKE)
[05:41:15] [PASSED] 0x7D45 (METEORLAKE)
[05:41:15] [PASSED] 0x7D55 (METEORLAKE)
[05:41:15] [PASSED] 0x7D60 (METEORLAKE)
[05:41:15] [PASSED] 0x7DD5 (METEORLAKE)
[05:41:15] [PASSED] 0x6420 (LUNARLAKE)
[05:41:15] [PASSED] 0x64A0 (LUNARLAKE)
[05:41:15] [PASSED] 0x64B0 (LUNARLAKE)
[05:41:15] [PASSED] 0xE202 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE209 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE20B (BATTLEMAGE)
[05:41:15] [PASSED] 0xE20C (BATTLEMAGE)
[05:41:15] [PASSED] 0xE20D (BATTLEMAGE)
[05:41:15] [PASSED] 0xE210 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE211 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE212 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE216 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE220 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE221 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE222 (BATTLEMAGE)
[05:41:15] [PASSED] 0xE223 (BATTLEMAGE)
[05:41:15] [PASSED] 0xB080 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB081 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB082 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB083 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB084 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB085 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB086 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB087 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB08F (PANTHERLAKE)
[05:41:15] [PASSED] 0xB090 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB0A0 (PANTHERLAKE)
[05:41:15] [PASSED] 0xB0B0 (PANTHERLAKE)
[05:41:15] [PASSED] 0xFD80 (PANTHERLAKE)
[05:41:15] [PASSED] 0xFD81 (PANTHERLAKE)
[05:41:15] [PASSED] 0xD740 (NOVALAKE_S)
[05:41:15] [PASSED] 0xD741 (NOVALAKE_S)
[05:41:15] [PASSED] 0xD742 (NOVALAKE_S)
[05:41:15] [PASSED] 0xD743 (NOVALAKE_S)
[05:41:15] [PASSED] 0xD745 (NOVALAKE_S)
[05:41:15] [PASSED] 0xD74A (NOVALAKE_S)
[05:41:15] [PASSED] 0xD74B (NOVALAKE_S)
[05:41:15] [PASSED] 0x674C (CRESCENTISLAND)
[05:41:15] [PASSED] 0x674D (CRESCENTISLAND)
[05:41:15] [PASSED] 0x674E (CRESCENTISLAND)
[05:41:15] [PASSED] 0x674F (CRESCENTISLAND)
[05:41:15] [PASSED] 0x6750 (CRESCENTISLAND)
[05:41:15] [PASSED] 0xD750 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD751 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD752 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD753 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD754 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD755 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD756 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD757 (NOVALAKE_P)
[05:41:15] [PASSED] 0xD75F (NOVALAKE_P)
[05:41:15] =============== [PASSED] check_platform_desc ===============
[05:41:15] ===================== [PASSED] xe_pci ======================
[05:41:15] ============= xe_rtp_tables_test (5 subtests) ==============
[05:41:15] ================== xe_rtp_table_gt_test  ===================
[05:41:15] [PASSED] gt_was/14011060649
[05:41:15] [PASSED] gt_was/14011059788
[05:41:15] [PASSED] gt_was/14015795083
[05:41:15] [PASSED] gt_was/16021867713
[05:41:15] [PASSED] gt_was/14019449301
[05:41:15] [PASSED] gt_was/16028005424
[05:41:15] [PASSED] gt_was/14026578760
[05:41:15] [PASSED] gt_was/1409420604
[05:41:15] [PASSED] gt_was/1408615072
[05:41:15] [PASSED] gt_was/22010523718
[05:41:15] [PASSED] gt_was/14011006942
[05:41:15] [PASSED] gt_was/14014830051
[05:41:15] [PASSED] gt_was/18018781329
[05:41:15] [PASSED] gt_was/1509235366
[05:41:15] [PASSED] gt_was/18018781329
[05:41:15] [PASSED] gt_was/16016694945
[05:41:15] [PASSED] gt_was/14018575942
[05:41:15] [PASSED] gt_was/22016670082
[05:41:15] [PASSED] gt_was/22016670082
[05:41:15] [PASSED] gt_was/14017421178
[05:41:15] [PASSED] gt_was/16025250150
[05:41:15] [PASSED] gt_was/14021871409
[05:41:15] [PASSED] gt_was/16021865536
[05:41:15] [PASSED] gt_was/14021486841
[05:41:15] [PASSED] gt_was/14025160223
[05:41:15] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[05:41:15] [PASSED] gt_was/14025635424
[05:41:15] [PASSED] gt_was/16028005424
[05:41:15] ============== [PASSED] xe_rtp_table_gt_test ===============
[05:41:15] ================== xe_rtp_table_gt_test  ===================
[05:41:15] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[05:41:15] [PASSED] gt_tunings/Tuning: 32B Access Enable
[05:41:15] [PASSED] gt_tunings/Tuning: L3 cache
[05:41:15] [PASSED] gt_tunings/Tuning: L3 cache - media
[05:41:15] [PASSED] gt_tunings/Tuning: Compression Overfetch
[05:41:15] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[05:41:15] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[05:41:15] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[05:41:15] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[05:41:15] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[05:41:15] [PASSED] gt_tunings/Tuning: Stateless compression control
[05:41:15] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[05:41:15] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[05:41:15] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[05:41:15] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[05:41:15] ============== [PASSED] xe_rtp_table_gt_test ===============
[05:41:15] ================== xe_rtp_table_oob_test  ==================
[05:41:15] [PASSED] oob_was/1607983814
[05:41:15] [PASSED] oob_was/16010904313
[05:41:15] [PASSED] oob_was/18022495364
[05:41:15] [PASSED] oob_was/22012773006
[05:41:15] [PASSED] oob_was/14014475959
[05:41:15] [PASSED] oob_was/22011391025
[05:41:15] [PASSED] oob_was/22012727170
[05:41:15] [PASSED] oob_was/22012727685
[05:41:15] [PASSED] oob_was/22016596838
[05:41:15] [PASSED] oob_was/18020744125
[05:41:15] [PASSED] oob_was/1409600907
[05:41:15] [PASSED] oob_was/22014953428
[05:41:15] [PASSED] oob_was/16017236439
[05:41:15] [PASSED] oob_was/14019821291
[05:41:15] [PASSED] oob_was/14015076503
[05:41:15] [PASSED] oob_was/14018913170
[05:41:15] [PASSED] oob_was/14018094691
[05:41:15] [PASSED] oob_was/18024947630
[05:41:15] [PASSED] oob_was/16022287689
[05:41:15] [PASSED] oob_was/13011645652
[05:41:15] [PASSED] oob_was/14022293748
[05:41:15] [PASSED] oob_was/22019794406
[05:41:15] [PASSED] oob_was/22019338487
[05:41:15] [PASSED] oob_was/16023588340
[05:41:15] [PASSED] oob_was/14019789679
[05:41:15] [PASSED] oob_was/14022866841
[05:41:15] [PASSED] oob_was/16021333562
[05:41:15] [PASSED] oob_was/14016712196
[05:41:15] [PASSED] oob_was/14015568240
[05:41:15] [PASSED] oob_was/18013179988
[05:41:15] [PASSED] oob_was/1508761755
[05:41:15] [PASSED] oob_was/16023105232
[05:41:15] [PASSED] oob_was/16026508708
[05:41:15] [PASSED] oob_was/14020001231
[05:41:15] [PASSED] oob_was/16023683509
[05:41:15] [PASSED] oob_was/14025515070
[05:41:15] [PASSED] oob_was/15015404425_disable
[05:41:15] [PASSED] oob_was/16026007364
[05:41:15] [PASSED] oob_was/14020316580
[05:41:15] [PASSED] oob_was/14025883347
[05:41:15] [PASSED] oob_was/16029380221
[05:41:15] [PASSED] oob_was/22022079272
[05:41:15] [PASSED] oob_was/16029897822
[05:41:15] [PASSED] oob_was/14027054324
[05:41:15] ============== [PASSED] xe_rtp_table_oob_test ==============
[05:41:15] ================ xe_rtp_table_dev_oob_test  ================
[05:41:15] [PASSED] device_oob_was/22010954014
[05:41:15] [PASSED] device_oob_was/15015404425
[05:41:15] [PASSED] device_oob_was/22019338487_display
[05:41:15] [PASSED] device_oob_was/14022085890
[05:41:15] [PASSED] device_oob_was/14026539277
[05:41:15] [PASSED] device_oob_was/14026633728
[05:41:15] [PASSED] device_oob_was/14026746987
[05:41:15] [PASSED] device_oob_was/14026779378
[05:41:15] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[05:41:15] ========== xe_rtp_table_missing_upper_bound_test  ==========
[05:41:15] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[05:41:15] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[05:41:15] [PASSED] register_whitelist/1806527549
[05:41:15] [PASSED] register_whitelist/allow_read_ctx_timestamp
[05:41:15] [PASSED] register_whitelist/allow_read_queue_timestamp
[05:41:15] [PASSED] register_whitelist/16014440446
[05:41:15] [PASSED] register_whitelist/16017236439
[05:41:15] [PASSED] register_whitelist/16020183090
[05:41:15] [PASSED] register_whitelist/14024997852
[05:41:15] [PASSED] register_whitelist/14024997852
[05:41:15] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[05:41:15] =============== [PASSED] xe_rtp_tables_test ================
[05:41:15] =================== xe_rtp (3 subtests) ====================
[05:41:15] =================== xe_rtp_rules_tests  ====================
[05:41:15] [PASSED] no
[05:41:15] [PASSED] yes
[05:41:15] [PASSED] no-and-no
[05:41:15] [PASSED] no-and-yes
[05:41:15] [PASSED] yes-and-no
[05:41:15] [PASSED] yes-and-yes
[05:41:15] [PASSED] no-or-no
[05:41:15] [PASSED] no-or-yes
[05:41:15] [PASSED] yes-or-no
[05:41:15] [PASSED] yes-or-yes
[05:41:15] [PASSED] no-yes-or-yes-no
[05:41:15] [PASSED] no-yes-or-yes-yes
[05:41:15] [PASSED] yes-yes-or-no-yes
[05:41:15] [PASSED] yes-yes-or-yes-yes
[05:41:15] [PASSED] no-no-or-yes-or-no
[05:41:15] [PASSED] or
[05:41:15] [PASSED] or-yes
[05:41:15] [PASSED] or-no
[05:41:15] [PASSED] yes-or
[05:41:15] [PASSED] no-or
[05:41:15] [PASSED] no-or-or-yes
[05:41:15] [PASSED] yes-or-or-no
[05:41:15] [PASSED] no-or-or-no
[05:41:15] [PASSED] missing-context-engine-class
[05:41:15] [PASSED] missing-context-engine-class-or-yes
[05:41:15] [PASSED] missing-context-engine-class-or-or-yes
[05:41:15] =============== [PASSED] xe_rtp_rules_tests ================
[05:41:15] =============== xe_rtp_process_to_sr_tests  ================
[05:41:15] [PASSED] coalesce-same-reg
[05:41:15] [PASSED] coalesce-same-reg-literal-and-func
[05:41:15] [PASSED] no-match-no-add
[05:41:15] [PASSED] two-regs-two-entries
[05:41:15] [PASSED] clr-one-set-other
[05:41:15] [PASSED] set-field
[05:41:15] [PASSED] conflict-duplicate
[05:41:15] [PASSED] conflict-not-disjoint
[05:41:15] [PASSED] conflict-not-disjoint-literal-and-func
[05:41:15] [PASSED] conflict-reg-type
[05:41:15] [PASSED] bad-mcr-reg-forced-to-regular
[05:41:15] [PASSED] bad-regular-reg-forced-to-mcr
[05:41:15] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[05:41:15] ================== xe_rtp_process_tests  ===================
[05:41:15] [PASSED] active1
[05:41:15] [PASSED] active2
[05:41:15] [PASSED] active-inactive
[05:41:15] [PASSED] inactive-active
[05:41:15] [PASSED] inactive-active-inactive
[05:41:15] [PASSED] inactive-inactive-inactive
[05:41:15] ============== [PASSED] xe_rtp_process_tests ===============
[05:41:15] ===================== [PASSED] xe_rtp ======================
[05:41:15] ==================== xe_wa (1 subtest) =====================
[05:41:15] ======================== xe_wa_gt  =========================
[05:41:15] [PASSED] TIGERLAKE B0
[05:41:15] [PASSED] DG1 A0
[05:41:15] [PASSED] DG1 B0
[05:41:15] [PASSED] ALDERLAKE_S A0
[05:41:15] [PASSED] ALDERLAKE_S B0
[05:41:15] [PASSED] ALDERLAKE_S C0
[05:41:15] [PASSED] ALDERLAKE_S D0
[05:41:15] [PASSED] ALDERLAKE_P A0
[05:41:15] [PASSED] ALDERLAKE_P B0
[05:41:15] [PASSED] ALDERLAKE_P C0
[05:41:15] [PASSED] ALDERLAKE_S RPLS D0
[05:41:15] [PASSED] ALDERLAKE_P RPLU E0
[05:41:15] [PASSED] DG2 G10 C0
[05:41:15] [PASSED] DG2 G11 B1
[05:41:15] [PASSED] DG2 G12 A1
[05:41:15] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:41:15] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:41:15] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[05:41:15] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[05:41:15] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[05:41:15] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[05:41:15] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[05:41:15] ==================== [PASSED] xe_wa_gt =====================
[05:41:15] ====================== [PASSED] xe_wa ======================
[05:41:15] ============================================================
[05:41:15] Testing complete. Ran 742 tests: passed: 724, skipped: 18
[05:41:15] Elapsed time: 36.822s total, 4.405s configuring, 31.750s building, 0.653s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:41:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:41:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:41:42] Starting KUnit Kernel (1/1)...
[05:41:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:41:42] ============ drm_test_pick_cmdline (2 subtests) ============
[05:41:42] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:41:42] =============== drm_test_pick_cmdline_named  ===============
[05:41:42] [PASSED] NTSC
[05:41:42] [PASSED] NTSC-J
[05:41:42] [PASSED] PAL
[05:41:42] [PASSED] PAL-M
[05:41:42] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:41:42] ============== [PASSED] drm_test_pick_cmdline ==============
[05:41:42] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[05:41:42] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[05:41:42] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[05:41:42] =========== drm_validate_clone_mode (2 subtests) ===========
[05:41:42] ============== drm_test_check_in_clone_mode  ===============
[05:41:42] [PASSED] in_clone_mode
[05:41:42] [PASSED] not_in_clone_mode
[05:41:42] ========== [PASSED] drm_test_check_in_clone_mode ===========
[05:41:42] =============== drm_test_check_valid_clones  ===============
[05:41:42] [PASSED] not_in_clone_mode
[05:41:42] [PASSED] valid_clone
[05:41:42] [PASSED] invalid_clone
[05:41:42] =========== [PASSED] drm_test_check_valid_clones ===========
[05:41:42] ============= [PASSED] drm_validate_clone_mode =============
[05:41:42] ============= drm_validate_modeset (1 subtest) =============
[05:41:42] [PASSED] drm_test_check_connector_changed_modeset
[05:41:42] ============== [PASSED] drm_validate_modeset ===============
[05:41:42] ====== drm_test_bridge_get_current_state (1 subtest) =======
[05:41:42] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[05:41:42] ======== [PASSED] drm_test_bridge_get_current_state ========
[05:41:42] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[05:41:42] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[05:41:42] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[05:41:42] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[05:41:42] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[05:41:42] ============== drm_bridge_alloc (2 subtests) ===============
[05:41:42] [PASSED] drm_test_drm_bridge_alloc_basic
[05:41:42] [PASSED] drm_test_drm_bridge_alloc_get_put
[05:41:42] ================ [PASSED] drm_bridge_alloc =================
[05:41:42] ============= drm_bridge_bus_fmt (5 subtests) ==============
[05:41:42] [PASSED] drm_test_bridge_rgb_yuv_rgb
[05:41:42] [PASSED] drm_test_bridge_must_convert_to_yuv444
[05:41:42] [PASSED] drm_test_bridge_hdmi_auto_rgb
[05:41:42] [PASSED] drm_test_bridge_auto_first
[05:41:42] [PASSED] drm_test_bridge_rgb_yuv_no_path
[05:41:42] =============== [PASSED] drm_bridge_bus_fmt ================
[05:41:42] ============= drm_cmdline_parser (40 subtests) =============
[05:41:42] [PASSED] drm_test_cmdline_force_d_only
[05:41:42] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:41:42] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:41:42] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:41:42] [PASSED] drm_test_cmdline_force_e_only
[05:41:42] [PASSED] drm_test_cmdline_res
[05:41:42] [PASSED] drm_test_cmdline_res_vesa
[05:41:42] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:41:42] [PASSED] drm_test_cmdline_res_rblank
[05:41:42] [PASSED] drm_test_cmdline_res_bpp
[05:41:42] [PASSED] drm_test_cmdline_res_refresh
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:41:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:41:42] [PASSED] drm_test_cmdline_res_margins_force_on
[05:41:42] [PASSED] drm_test_cmdline_res_vesa_margins
[05:41:42] [PASSED] drm_test_cmdline_name
[05:41:42] [PASSED] drm_test_cmdline_name_bpp
[05:41:42] [PASSED] drm_test_cmdline_name_option
[05:41:42] [PASSED] drm_test_cmdline_name_bpp_option
[05:41:42] [PASSED] drm_test_cmdline_rotate_0
[05:41:42] [PASSED] drm_test_cmdline_rotate_90
[05:41:42] [PASSED] drm_test_cmdline_rotate_180
[05:41:42] [PASSED] drm_test_cmdline_rotate_270
[05:41:42] [PASSED] drm_test_cmdline_hmirror
[05:41:42] [PASSED] drm_test_cmdline_vmirror
[05:41:42] [PASSED] drm_test_cmdline_margin_options
[05:41:42] [PASSED] drm_test_cmdline_multiple_options
[05:41:42] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:41:42] [PASSED] drm_test_cmdline_extra_and_option
[05:41:42] [PASSED] drm_test_cmdline_freestanding_options
[05:41:42] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:41:42] [PASSED] drm_test_cmdline_panel_orientation
[05:41:42] ================ drm_test_cmdline_invalid  =================
[05:41:42] [PASSED] margin_only
[05:41:42] [PASSED] interlace_only
[05:41:42] [PASSED] res_missing_x
[05:41:42] [PASSED] res_missing_y
[05:41:42] [PASSED] res_bad_y
[05:41:42] [PASSED] res_missing_y_bpp
[05:41:42] [PASSED] res_bad_bpp
[05:41:42] [PASSED] res_bad_refresh
[05:41:42] [PASSED] res_bpp_refresh_force_on_off
[05:41:42] [PASSED] res_invalid_mode
[05:41:42] [PASSED] res_bpp_wrong_place_mode
[05:41:42] [PASSED] name_bpp_refresh
[05:41:42] [PASSED] name_refresh
[05:41:42] [PASSED] name_refresh_wrong_mode
[05:41:42] [PASSED] name_refresh_invalid_mode
[05:41:42] [PASSED] rotate_multiple
[05:41:42] [PASSED] rotate_invalid_val
[05:41:42] [PASSED] rotate_truncated
[05:41:42] [PASSED] invalid_option
[05:41:42] [PASSED] invalid_tv_option
[05:41:42] [PASSED] truncated_tv_option
[05:41:42] ============ [PASSED] drm_test_cmdline_invalid =============
[05:41:42] =============== drm_test_cmdline_tv_options  ===============
[05:41:42] [PASSED] NTSC
[05:41:42] [PASSED] NTSC_443
[05:41:42] [PASSED] NTSC_J
[05:41:42] [PASSED] PAL
[05:41:42] [PASSED] PAL_M
[05:41:42] [PASSED] PAL_N
[05:41:42] [PASSED] SECAM
[05:41:42] [PASSED] MONO_525
[05:41:42] [PASSED] MONO_625
[05:41:42] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:41:42] =============== [PASSED] drm_cmdline_parser ================
[05:41:42] ========== drmm_connector_hdmi_init (20 subtests) ==========
[05:41:42] [PASSED] drm_test_connector_hdmi_init_valid
[05:41:42] [PASSED] drm_test_connector_hdmi_init_bpc_8
[05:41:42] [PASSED] drm_test_connector_hdmi_init_bpc_10
[05:41:42] [PASSED] drm_test_connector_hdmi_init_bpc_12
[05:41:42] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[05:41:42] [PASSED] drm_test_connector_hdmi_init_bpc_null
[05:41:42] [PASSED] drm_test_connector_hdmi_init_formats_empty
[05:41:42] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[05:41:42] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[05:41:42] [PASSED] supported_formats=0x9 yuv420_allowed=1
[05:41:42] [PASSED] supported_formats=0x9 yuv420_allowed=0
[05:41:42] [PASSED] supported_formats=0x5 yuv420_allowed=1
[05:41:42] [PASSED] supported_formats=0x5 yuv420_allowed=0
[05:41:42] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[05:41:42] [PASSED] drm_test_connector_hdmi_init_null_ddc
[05:41:42] [PASSED] drm_test_connector_hdmi_init_null_product
[05:41:42] [PASSED] drm_test_connector_hdmi_init_null_vendor
[05:41:42] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[05:41:42] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[05:41:42] [PASSED] drm_test_connector_hdmi_init_product_valid
[05:41:42] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[05:41:42] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[05:41:42] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[05:41:42] ========= drm_test_connector_hdmi_init_type_valid  =========
[05:41:42] [PASSED] HDMI-A
[05:41:42] [PASSED] HDMI-B
[05:41:42] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[05:41:42] ======== drm_test_connector_hdmi_init_type_invalid  ========
[05:41:42] [PASSED] Unknown
[05:41:42] [PASSED] VGA
[05:41:42] [PASSED] DVI-I
[05:41:42] [PASSED] DVI-D
[05:41:42] [PASSED] DVI-A
[05:41:42] [PASSED] Composite
[05:41:42] [PASSED] SVIDEO
[05:41:42] [PASSED] LVDS
[05:41:42] [PASSED] Component
[05:41:42] [PASSED] DIN
[05:41:42] [PASSED] DP
[05:41:42] [PASSED] TV
[05:41:42] [PASSED] eDP
[05:41:42] [PASSED] Virtual
[05:41:42] [PASSED] DSI
[05:41:42] [PASSED] DPI
[05:41:42] [PASSED] Writeback
[05:41:42] [PASSED] SPI
[05:41:42] [PASSED] USB
[05:41:42] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[05:41:42] ============ [PASSED] drmm_connector_hdmi_init =============
[05:41:42] ============= drmm_connector_init (3 subtests) =============
[05:41:42] [PASSED] drm_test_drmm_connector_init
[05:41:42] [PASSED] drm_test_drmm_connector_init_null_ddc
[05:41:42] ========= drm_test_drmm_connector_init_type_valid  =========
[05:41:42] [PASSED] Unknown
[05:41:42] [PASSED] VGA
[05:41:42] [PASSED] DVI-I
[05:41:42] [PASSED] DVI-D
[05:41:42] [PASSED] DVI-A
[05:41:42] [PASSED] Composite
[05:41:42] [PASSED] SVIDEO
[05:41:42] [PASSED] LVDS
[05:41:42] [PASSED] Component
[05:41:42] [PASSED] DIN
[05:41:42] [PASSED] DP
[05:41:42] [PASSED] HDMI-A
[05:41:42] [PASSED] HDMI-B
[05:41:42] [PASSED] TV
[05:41:42] [PASSED] eDP
[05:41:42] [PASSED] Virtual
[05:41:42] [PASSED] DSI
[05:41:42] [PASSED] DPI
[05:41:42] [PASSED] Writeback
[05:41:42] [PASSED] SPI
[05:41:42] [PASSED] USB
[05:41:42] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[05:41:42] =============== [PASSED] drmm_connector_init ===============
[05:41:42] ========= drm_connector_dynamic_init (6 subtests) ==========
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_init
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_init_properties
[05:41:42] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[05:41:42] [PASSED] Unknown
[05:41:42] [PASSED] VGA
[05:41:42] [PASSED] DVI-I
[05:41:42] [PASSED] DVI-D
[05:41:42] [PASSED] DVI-A
[05:41:42] [PASSED] Composite
[05:41:42] [PASSED] SVIDEO
[05:41:42] [PASSED] LVDS
[05:41:42] [PASSED] Component
[05:41:42] [PASSED] DIN
[05:41:42] [PASSED] DP
[05:41:42] [PASSED] HDMI-A
[05:41:42] [PASSED] HDMI-B
[05:41:42] [PASSED] TV
[05:41:42] [PASSED] eDP
[05:41:42] [PASSED] Virtual
[05:41:42] [PASSED] DSI
[05:41:42] [PASSED] DPI
[05:41:42] [PASSED] Writeback
[05:41:42] [PASSED] SPI
[05:41:42] [PASSED] USB
[05:41:42] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[05:41:42] ======== drm_test_drm_connector_dynamic_init_name  =========
[05:41:42] [PASSED] Unknown
[05:41:42] [PASSED] VGA
[05:41:42] [PASSED] DVI-I
[05:41:42] [PASSED] DVI-D
[05:41:42] [PASSED] DVI-A
[05:41:42] [PASSED] Composite
[05:41:42] [PASSED] SVIDEO
[05:41:42] [PASSED] LVDS
[05:41:42] [PASSED] Component
[05:41:42] [PASSED] DIN
[05:41:42] [PASSED] DP
[05:41:42] [PASSED] HDMI-A
[05:41:42] [PASSED] HDMI-B
[05:41:42] [PASSED] TV
[05:41:42] [PASSED] eDP
[05:41:42] [PASSED] Virtual
[05:41:42] [PASSED] DSI
[05:41:42] [PASSED] DPI
[05:41:42] [PASSED] Writeback
[05:41:42] [PASSED] SPI
[05:41:42] [PASSED] USB
[05:41:42] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[05:41:42] =========== [PASSED] drm_connector_dynamic_init ============
[05:41:42] ==== drm_connector_dynamic_register_early (4 subtests) =====
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[05:41:42] ====== [PASSED] drm_connector_dynamic_register_early =======
[05:41:42] ======= drm_connector_dynamic_register (7 subtests) ========
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[05:41:42] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[05:41:42] ========= [PASSED] drm_connector_dynamic_register ==========
[05:41:42] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[05:41:42] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[05:41:42] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[05:41:42] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[05:41:42] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:41:42] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:41:42] [PASSED] NTSC
[05:41:42] [PASSED] NTSC-443
[05:41:42] [PASSED] NTSC-J
[05:41:42] [PASSED] PAL
[05:41:42] [PASSED] PAL-M
[05:41:42] [PASSED] PAL-N
[05:41:42] [PASSED] SECAM
[05:41:42] [PASSED] Mono
[05:41:42] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:41:42] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:41:42] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:41:42] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[05:41:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[05:41:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[05:41:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[05:41:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[05:41:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[05:41:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[05:41:42] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[05:41:42] [PASSED] VIC 96
[05:41:42] [PASSED] VIC 97
[05:41:42] [PASSED] VIC 101
[05:41:42] [PASSED] VIC 102
[05:41:42] [PASSED] VIC 106
[05:41:42] [PASSED] VIC 107
[05:41:42] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[05:41:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[05:41:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[05:41:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[05:41:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[05:41:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[05:41:42] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[05:41:42] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[05:41:42] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[05:41:42] [PASSED] Automatic
[05:41:42] [PASSED] Full
[05:41:42] [PASSED] Limited 16:235
[05:41:42] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[05:41:42] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[05:41:42] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[05:41:42] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[05:41:42] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[05:41:42] [PASSED] RGB
[05:41:42] [PASSED] YUV 4:2:0
[05:41:42] [PASSED] YUV 4:2:2
[05:41:42] [PASSED] YUV 4:4:4
[05:41:42] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[05:41:42] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[05:41:42] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[05:41:42] ============= drm_damage_helper (21 subtests) ==============
[05:41:42] [PASSED] drm_test_damage_iter_no_damage
[05:41:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:41:42] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:41:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:41:42] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:41:42] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:41:42] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:41:42] [PASSED] drm_test_damage_iter_simple_damage
[05:41:42] [PASSED] drm_test_damage_iter_single_damage
[05:41:42] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:41:42] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:41:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:41:42] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:41:42] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:41:42] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:41:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:41:42] [PASSED] drm_test_damage_iter_damage
[05:41:42] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:41:42] [PASSED] drm_test_damage_iter_damage_one_outside
[05:41:42] [PASSED] drm_test_damage_iter_damage_src_moved
[05:41:42] [PASSED] drm_test_damage_iter_damage_not_visible
[05:41:42] ================ [PASSED] drm_damage_helper ================
[05:41:42] ============== drm_dp_mst_helper (3 subtests) ==============
[05:41:42] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:41:42] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:41:42] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:41:42] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:41:42] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:41:42] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:41:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:41:42] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:41:42] [PASSED] Link rate 2000000 lane count 4
[05:41:42] [PASSED] Link rate 2000000 lane count 2
[05:41:42] [PASSED] Link rate 2000000 lane count 1
[05:41:42] [PASSED] Link rate 1350000 lane count 4
[05:41:42] [PASSED] Link rate 1350000 lane count 2
[05:41:42] [PASSED] Link rate 1350000 lane count 1
[05:41:42] [PASSED] Link rate 1000000 lane count 4
[05:41:42] [PASSED] Link rate 1000000 lane count 2
[05:41:42] [PASSED] Link rate 1000000 lane count 1
[05:41:42] [PASSED] Link rate 810000 lane count 4
[05:41:42] [PASSED] Link rate 810000 lane count 2
[05:41:42] [PASSED] Link rate 810000 lane count 1
[05:41:42] [PASSED] Link rate 540000 lane count 4
[05:41:42] [PASSED] Link rate 540000 lane count 2
[05:41:42] [PASSED] Link rate 540000 lane count 1
[05:41:42] [PASSED] Link rate 270000 lane count 4
[05:41:42] [PASSED] Link rate 270000 lane count 2
[05:41:42] [PASSED] Link rate 270000 lane count 1
[05:41:42] [PASSED] Link rate 162000 lane count 4
[05:41:42] [PASSED] Link rate 162000 lane count 2
[05:41:42] [PASSED] Link rate 162000 lane count 1
[05:41:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:41:42] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:41:42] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:41:42] [PASSED] DP_POWER_UP_PHY with port number
[05:41:42] [PASSED] DP_POWER_DOWN_PHY with port number
[05:41:42] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:41:42] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:41:42] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:41:42] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:41:42] [PASSED] DP_QUERY_PAYLOAD with port number
[05:41:42] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:41:42] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:41:42] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:41:42] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:41:42] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:41:42] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:41:42] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:41:42] [PASSED] DP_REMOTE_I2C_READ with port number
[05:41:42] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:41:42] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:41:42] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:41:42] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:41:42] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:41:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:41:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:41:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:41:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:41:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:41:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:41:42] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:41:42] ================ [PASSED] drm_dp_mst_helper ================
[05:41:42] ================== drm_exec (7 subtests) ===================
[05:41:42] [PASSED] sanitycheck
[05:41:42] [PASSED] test_lock
[05:41:42] [PASSED] test_lock_unlock
[05:41:42] [PASSED] test_duplicates
[05:41:42] [PASSED] test_prepare
[05:41:42] [PASSED] test_prepare_array
[05:41:42] [PASSED] test_multiple_loops
[05:41:42] ==================== [PASSED] drm_exec =====================
[05:41:42] =========== drm_format_helper_test (17 subtests) ===========
[05:41:42] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:41:42] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:41:42] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:41:42] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:41:42] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:41:42] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:41:42] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:41:42] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[05:41:42] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:41:42] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:41:42] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:41:42] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:41:42] ==================== drm_test_fb_swab  =====================
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ================ [PASSED] drm_test_fb_swab =================
[05:41:42] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:41:42] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:41:42] [PASSED] single_pixel_source_buffer
[05:41:42] [PASSED] single_pixel_clip_rectangle
[05:41:42] [PASSED] well_known_colors
[05:41:42] [PASSED] destination_pitch
[05:41:42] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:41:42] ================= drm_test_fb_clip_offset  =================
[05:41:42] [PASSED] pass through
[05:41:42] [PASSED] horizontal offset
[05:41:42] [PASSED] vertical offset
[05:41:42] [PASSED] horizontal and vertical offset
[05:41:42] [PASSED] horizontal offset (custom pitch)
[05:41:42] [PASSED] vertical offset (custom pitch)
[05:41:42] [PASSED] horizontal and vertical offset (custom pitch)
[05:41:42] ============= [PASSED] drm_test_fb_clip_offset =============
[05:41:42] =================== drm_test_fb_memcpy  ====================
[05:41:42] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:41:42] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:41:42] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:41:42] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:41:42] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:41:42] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:41:42] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:41:42] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:41:42] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:41:42] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:41:42] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:41:42] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:41:42] =============== [PASSED] drm_test_fb_memcpy ================
[05:41:42] ============= [PASSED] drm_format_helper_test ==============
[05:41:42] ================= drm_format (18 subtests) =================
[05:41:42] [PASSED] drm_test_format_block_width_invalid
[05:41:42] [PASSED] drm_test_format_block_width_one_plane
[05:41:42] [PASSED] drm_test_format_block_width_two_plane
[05:41:42] [PASSED] drm_test_format_block_width_three_plane
[05:41:42] [PASSED] drm_test_format_block_width_tiled
[05:41:42] [PASSED] drm_test_format_block_height_invalid
[05:41:42] [PASSED] drm_test_format_block_height_one_plane
[05:41:42] [PASSED] drm_test_format_block_height_two_plane
[05:41:42] [PASSED] drm_test_format_block_height_three_plane
[05:41:42] [PASSED] drm_test_format_block_height_tiled
[05:41:42] [PASSED] drm_test_format_min_pitch_invalid
[05:41:42] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:41:42] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:41:42] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:41:42] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:41:42] [PASSED] drm_test_format_min_pitch_two_plane
[05:41:42] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:41:42] [PASSED] drm_test_format_min_pitch_tiled
[05:41:42] =================== [PASSED] drm_format ====================
[05:41:42] ============== drm_framebuffer (10 subtests) ===============
[05:41:42] ========== drm_test_framebuffer_check_src_coords  ==========
[05:41:42] [PASSED] Success: source fits into fb
[05:41:42] [PASSED] Fail: overflowing fb with x-axis coordinate
[05:41:42] [PASSED] Fail: overflowing fb with y-axis coordinate
[05:41:42] [PASSED] Fail: overflowing fb with source width
[05:41:42] [PASSED] Fail: overflowing fb with source height
[05:41:42] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[05:41:42] [PASSED] drm_test_framebuffer_cleanup
[05:41:42] =============== drm_test_framebuffer_create  ===============
[05:41:42] [PASSED] ABGR8888 normal sizes
[05:41:42] [PASSED] ABGR8888 max sizes
[05:41:42] [PASSED] ABGR8888 pitch greater than min required
[05:41:42] [PASSED] ABGR8888 pitch less than min required
[05:41:42] [PASSED] ABGR8888 Invalid width
[05:41:42] [PASSED] ABGR8888 Invalid buffer handle
[05:41:42] [PASSED] No pixel format
[05:41:42] [PASSED] ABGR8888 Width 0
[05:41:42] [PASSED] ABGR8888 Height 0
[05:41:42] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:41:42] [PASSED] ABGR8888 Large buffer offset
[05:41:42] [PASSED] ABGR8888 Buffer offset for inexistent plane
[05:41:42] [PASSED] ABGR8888 Invalid flag
[05:41:42] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:41:42] [PASSED] ABGR8888 Valid buffer modifier
[05:41:42] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:41:42] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:41:42] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:41:42] [PASSED] NV12 Normal sizes
[05:41:42] [PASSED] NV12 Max sizes
[05:41:42] [PASSED] NV12 Invalid pitch
[05:41:42] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:41:42] [PASSED] NV12 different  modifier per-plane
[05:41:42] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:41:42] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:41:42] [PASSED] NV12 Modifier for inexistent plane
[05:41:42] [PASSED] NV12 Handle for inexistent plane
[05:41:42] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:41:42] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:41:42] [PASSED] YVU420 Normal sizes
[05:41:42] [PASSED] YVU420 Max sizes
[05:41:42] [PASSED] YVU420 Invalid pitch
[05:41:42] [PASSED] YVU420 Different pitches
[05:41:42] [PASSED] YVU420 Different buffer offsets/pitches
[05:41:42] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:41:42] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:41:42] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:41:42] [PASSED] YVU420 Valid modifier
[05:41:42] [PASSED] YVU420 Different modifiers per plane
[05:41:42] [PASSED] YVU420 Modifier for inexistent plane
[05:41:42] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[05:41:42] [PASSED] X0L2 Normal sizes
[05:41:42] [PASSED] X0L2 Max sizes
[05:41:42] [PASSED] X0L2 Invalid pitch
[05:41:42] [PASSED] X0L2 Pitch greater than minimum required
[05:41:42] [PASSED] X0L2 Handle for inexistent plane
[05:41:42] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:41:42] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:41:42] [PASSED] X0L2 Valid modifier
[05:41:42] [PASSED] X0L2 Modifier for inexistent plane
[05:41:42] =========== [PASSED] drm_test_framebuffer_create ===========
[05:41:42] [PASSED] drm_test_framebuffer_free
[05:41:42] [PASSED] drm_test_framebuffer_init
[05:41:42] [PASSED] drm_test_framebuffer_init_bad_format
[05:41:42] [PASSED] drm_test_framebuffer_init_dev_mismatch
[05:41:42] [PASSED] drm_test_framebuffer_lookup
[05:41:42] [PASSED] drm_test_framebuffer_lookup_inexistent
[05:41:42] [PASSED] drm_test_framebuffer_modifiers_not_supported
[05:41:42] ================= [PASSED] drm_framebuffer =================
[05:41:42] ================ drm_gem_shmem (8 subtests) ================
[05:41:42] [PASSED] drm_gem_shmem_test_obj_create
[05:41:42] [PASSED] drm_gem_shmem_test_obj_create_private
[05:41:42] [PASSED] drm_gem_shmem_test_pin_pages
[05:41:42] [PASSED] drm_gem_shmem_test_vmap
[05:41:42] [PASSED] drm_gem_shmem_test_get_sg_table
[05:41:42] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:41:42] [PASSED] drm_gem_shmem_test_madvise
[05:41:42] [PASSED] drm_gem_shmem_test_purge
[05:41:42] ================== [PASSED] drm_gem_shmem ==================
[05:41:42] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[05:41:42] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[05:41:42] [PASSED] Automatic
[05:41:42] [PASSED] Full
[05:41:42] [PASSED] Limited 16:235
[05:41:42] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[05:41:42] [PASSED] drm_test_check_disable_connector
[05:41:42] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[05:41:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[05:41:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[05:41:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[05:41:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[05:41:42] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[05:41:42] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[05:41:42] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[05:41:42] [PASSED] drm_test_check_output_bpc_dvi
[05:41:42] [PASSED] drm_test_check_output_bpc_format_vic_1
[05:41:42] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[05:41:42] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[05:41:42] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[05:41:42] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[05:41:42] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[05:41:42] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[05:41:42] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[05:41:42] ============ drm_test_check_hdmi_color_format  =============
[05:41:42] [PASSED] AUTO -> RGB
[05:41:42] [PASSED] YCBCR422 -> YUV422
[05:41:42] [PASSED] YCBCR420 -> YUV420
[05:41:42] [PASSED] YCBCR444 -> YUV444
[05:41:42] [PASSED] RGB -> RGB
[05:41:42] ======== [PASSED] drm_test_check_hdmi_color_format =========
[05:41:42] ======== drm_test_check_hdmi_color_format_420_only  ========
[05:41:42] [PASSED] RGB should fail
[05:41:42] [PASSED] YUV444 should fail
[05:41:42] [PASSED] YUV422 should fail
[05:41:42] [PASSED] YUV420 should work
[05:41:42] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[05:41:42] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[05:41:42] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[05:41:42] [PASSED] drm_test_check_broadcast_rgb_value
[05:41:42] [PASSED] drm_test_check_bpc_8_value
[05:41:42] [PASSED] drm_test_check_bpc_10_value
[05:41:42] [PASSED] drm_test_check_bpc_12_value
[05:41:42] [PASSED] drm_test_check_format_value
[05:41:42] [PASSED] drm_test_check_tmds_char_value
[05:41:42] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[05:41:42] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[05:41:42] [PASSED] drm_test_check_mode_valid
[05:41:42] [PASSED] drm_test_check_mode_valid_reject
[05:41:42] [PASSED] drm_test_check_mode_valid_reject_rate
[05:41:42] [PASSED] drm_test_check_mode_valid_reject_max_clock
[05:41:42] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[05:41:42] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[05:41:42] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[05:41:42] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[05:41:42] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[05:41:42] [PASSED] drm_test_check_infoframes
[05:41:42] [PASSED] drm_test_check_reject_avi_infoframe
[05:41:42] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[05:41:42] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[05:41:42] [PASSED] drm_test_check_reject_audio_infoframe
[05:41:42] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[05:41:42] ================= drm_managed (2 subtests) =================
[05:41:42] [PASSED] drm_test_managed_release_action
[05:41:42] [PASSED] drm_test_managed_run_action
[05:41:42] =================== [PASSED] drm_managed ===================
[05:41:42] =================== drm_mm (6 subtests) ====================
[05:41:42] [PASSED] drm_test_mm_init
[05:41:42] [PASSED] drm_test_mm_debug
[05:41:42] [PASSED] drm_test_mm_align32
[05:41:42] [PASSED] drm_test_mm_align64
[05:41:42] [PASSED] drm_test_mm_lowest
[05:41:42] [PASSED] drm_test_mm_highest
[05:41:42] ===================== [PASSED] drm_mm ======================
[05:41:42] ============= drm_modes_analog_tv (5 subtests) =============
[05:41:42] [PASSED] drm_test_modes_analog_tv_mono_576i
[05:41:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:41:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:41:42] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:41:42] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:41:42] =============== [PASSED] drm_modes_analog_tv ===============
[05:41:42] ============== drm_plane_helper (2 subtests) ===============
[05:41:42] =============== drm_test_check_plane_state  ================
[05:41:42] [PASSED] clipping_simple
[05:41:42] [PASSED] clipping_rotate_reflect
[05:41:42] [PASSED] positioning_simple
[05:41:42] [PASSED] upscaling
[05:41:42] [PASSED] downscaling
[05:41:42] [PASSED] rounding1
[05:41:42] [PASSED] rounding2
[05:41:42] [PASSED] rounding3
[05:41:42] [PASSED] rounding4
[05:41:42] =========== [PASSED] drm_test_check_plane_state ============
[05:41:42] =========== drm_test_check_invalid_plane_state  ============
[05:41:42] [PASSED] positioning_invalid
[05:41:42] [PASSED] upscaling_invalid
[05:41:42] [PASSED] downscaling_invalid
[05:41:42] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:41:42] ================ [PASSED] drm_plane_helper =================
[05:41:42] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:41:42] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:41:42] [PASSED] None
[05:41:42] [PASSED] PAL
[05:41:42] [PASSED] NTSC
[05:41:42] [PASSED] Both, NTSC Default
[05:41:42] [PASSED] Both, PAL Default
[05:41:42] [PASSED] Both, NTSC Default, with PAL on command-line
[05:41:42] [PASSED] Both, PAL Default, with NTSC on command-line
[05:41:42] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:41:42] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:41:42] ================== drm_rect (9 subtests) ===================
[05:41:42] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:41:42] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:41:42] [PASSED] drm_test_rect_clip_scaled_clipped
[05:41:42] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:41:42] ================= drm_test_rect_intersect  =================
[05:41:42] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:41:42] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:41:42] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:41:42] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:41:42] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:41:42] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:41:42] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:41:42] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:41:42] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:41:42] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:41:42] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:41:42] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:41:42] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:41:42] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:41:42] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:41:42] ============= [PASSED] drm_test_rect_intersect =============
[05:41:42] ================ drm_test_rect_calc_hscale  ================
[05:41:42] [PASSED] normal use
[05:41:42] [PASSED] out of max range
[05:41:42] [PASSED] out of min range
[05:41:42] [PASSED] zero dst
[05:41:42] [PASSED] negative src
[05:41:42] [PASSED] negative dst
[05:41:42] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:41:42] ================ drm_test_rect_calc_vscale  ================
[05:41:42] [PASSED] normal use
[05:41:42] [PASSED] out of max range
[05:41:42] [PASSED] out of min range
[05:41:42] [PASSED] zero dst
[05:41:42] [PASSED] negative src
[05:41:42] [PASSED] negative dst
[05:41:42] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:41:42] ================== drm_test_rect_rotate  ===================
[05:41:42] [PASSED] reflect-x
[05:41:42] [PASSED] reflect-y
[05:41:42] [PASSED] rotate-0
[05:41:42] [PASSED] rotate-90
[05:41:42] [PASSED] rotate-180
[05:41:42] [PASSED] rotate-270
[05:41:42] ============== [PASSED] drm_test_rect_rotate ===============
[05:41:42] ================ drm_test_rect_rotate_inv  =================
[05:41:42] [PASSED] reflect-x
[05:41:42] [PASSED] reflect-y
[05:41:42] [PASSED] rotate-0
[05:41:42] [PASSED] rotate-90
[05:41:42] [PASSED] rotate-180
[05:41:42] [PASSED] rotate-270
[05:41:42] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:41:42] ==================== [PASSED] drm_rect =====================
[05:41:42] ============ drm_sysfb_modeset_test (1 subtest) ============
[05:41:42] ============ drm_test_sysfb_build_fourcc_list  =============
[05:41:42] [PASSED] no native formats
[05:41:42] [PASSED] XRGB8888 as native format
[05:41:42] [PASSED] remove duplicates
[05:41:42] [PASSED] convert alpha formats
[05:41:42] [PASSED] random formats
[05:41:42] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[05:41:42] ============= [PASSED] drm_sysfb_modeset_test ==============
[05:41:42] ================== drm_fixp (2 subtests) ===================
[05:41:42] [PASSED] drm_test_int2fixp
[05:41:42] [PASSED] drm_test_sm2fixp
[05:41:42] ==================== [PASSED] drm_fixp =====================
[05:41:42] ============================================================
[05:41:42] Testing complete. Ran 637 tests: passed: 637
[05:41:42] Elapsed time: 26.722s total, 1.845s configuring, 24.709s building, 0.150s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[05:41:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:41:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:41:54] Starting KUnit Kernel (1/1)...
[05:41:54] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:41:54] ================= ttm_device (5 subtests) ==================
[05:41:54] [PASSED] ttm_device_init_basic
[05:41:54] [PASSED] ttm_device_init_multiple
[05:41:54] [PASSED] ttm_device_fini_basic
[05:41:54] [PASSED] ttm_device_init_no_vma_man
[05:41:54] ================== ttm_device_init_pools  ==================
[05:41:54] [PASSED] No DMA allocations, no DMA32 required
[05:41:54] [PASSED] DMA allocations, DMA32 required
[05:41:54] [PASSED] No DMA allocations, DMA32 required
[05:41:54] [PASSED] DMA allocations, no DMA32 required
[05:41:54] ============== [PASSED] ttm_device_init_pools ==============
[05:41:54] =================== [PASSED] ttm_device ====================
[05:41:54] ================== ttm_pool (8 subtests) ===================
[05:41:54] ================== ttm_pool_alloc_basic  ===================
[05:41:54] [PASSED] One page
[05:41:54] [PASSED] More than one page
[05:41:54] [PASSED] Above the allocation limit
[05:41:54] [PASSED] One page, with coherent DMA mappings enabled
[05:41:54] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:41:54] ============== [PASSED] ttm_pool_alloc_basic ===============
[05:41:54] ============== ttm_pool_alloc_basic_dma_addr  ==============
[05:41:54] [PASSED] One page
[05:41:54] [PASSED] More than one page
[05:41:54] [PASSED] Above the allocation limit
[05:41:54] [PASSED] One page, with coherent DMA mappings enabled
[05:41:54] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:41:54] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[05:41:54] [PASSED] ttm_pool_alloc_order_caching_match
[05:41:54] [PASSED] ttm_pool_alloc_caching_mismatch
[05:41:54] [PASSED] ttm_pool_alloc_order_mismatch
[05:41:54] [PASSED] ttm_pool_free_dma_alloc
[05:41:54] [PASSED] ttm_pool_free_no_dma_alloc
[05:41:54] [PASSED] ttm_pool_fini_basic
[05:41:54] ==================== [PASSED] ttm_pool =====================
[05:41:54] ================ ttm_resource (8 subtests) =================
[05:41:54] ================= ttm_resource_init_basic  =================
[05:41:54] [PASSED] Init resource in TTM_PL_SYSTEM
[05:41:54] [PASSED] Init resource in TTM_PL_VRAM
[05:41:54] [PASSED] Init resource in a private placement
[05:41:54] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[05:41:54] ============= [PASSED] ttm_resource_init_basic =============
[05:41:54] [PASSED] ttm_resource_init_pinned
[05:41:54] [PASSED] ttm_resource_fini_basic
[05:41:54] [PASSED] ttm_resource_manager_init_basic
[05:41:54] [PASSED] ttm_resource_manager_usage_basic
[05:41:54] [PASSED] ttm_resource_manager_set_used_basic
[05:41:54] [PASSED] ttm_sys_man_alloc_basic
[05:41:54] [PASSED] ttm_sys_man_free_basic
[05:41:54] ================== [PASSED] ttm_resource ===================
[05:41:54] =================== ttm_tt (15 subtests) ===================
[05:41:54] ==================== ttm_tt_init_basic  ====================
[05:41:54] [PASSED] Page-aligned size
[05:41:54] [PASSED] Extra pages requested
[05:41:54] ================ [PASSED] ttm_tt_init_basic ================
[05:41:54] [PASSED] ttm_tt_init_misaligned
[05:41:54] [PASSED] ttm_tt_fini_basic
[05:41:54] [PASSED] ttm_tt_fini_sg
[05:41:54] [PASSED] ttm_tt_fini_shmem
[05:41:54] [PASSED] ttm_tt_create_basic
[05:41:54] [PASSED] ttm_tt_create_invalid_bo_type
[05:41:54] [PASSED] ttm_tt_create_ttm_exists
[05:41:54] [PASSED] ttm_tt_create_failed
[05:41:54] [PASSED] ttm_tt_destroy_basic
[05:41:54] [PASSED] ttm_tt_populate_null_ttm
[05:41:54] [PASSED] ttm_tt_populate_populated_ttm
[05:41:54] [PASSED] ttm_tt_unpopulate_basic
[05:41:54] [PASSED] ttm_tt_unpopulate_empty_ttm
[05:41:54] [PASSED] ttm_tt_swapin_basic
[05:41:54] ===================== [PASSED] ttm_tt ======================
[05:41:54] =================== ttm_bo (14 subtests) ===================
[05:41:54] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[05:41:54] [PASSED] Cannot be interrupted and sleeps
[05:41:54] [PASSED] Cannot be interrupted, locks straight away
[05:41:54] [PASSED] Can be interrupted, sleeps
[05:41:54] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[05:41:54] [PASSED] ttm_bo_reserve_locked_no_sleep
[05:41:54] [PASSED] ttm_bo_reserve_no_wait_ticket
[05:41:54] [PASSED] ttm_bo_reserve_double_resv
[05:41:54] [PASSED] ttm_bo_reserve_interrupted
[05:41:54] [PASSED] ttm_bo_reserve_deadlock
[05:41:54] [PASSED] ttm_bo_unreserve_basic
[05:41:54] [PASSED] ttm_bo_unreserve_pinned
[05:41:54] [PASSED] ttm_bo_unreserve_bulk
[05:41:54] [PASSED] ttm_bo_fini_basic
[05:41:54] [PASSED] ttm_bo_fini_shared_resv
[05:41:54] [PASSED] ttm_bo_pin_basic
[05:41:54] [PASSED] ttm_bo_pin_unpin_resource
[05:41:54] [PASSED] ttm_bo_multiple_pin_one_unpin
[05:41:54] ===================== [PASSED] ttm_bo ======================
[05:41:54] ============== ttm_bo_validate (22 subtests) ===============
[05:41:54] ============== ttm_bo_init_reserved_sys_man  ===============
[05:41:54] [PASSED] Buffer object for userspace
[05:41:54] [PASSED] Kernel buffer object
[05:41:54] [PASSED] Shared buffer object
[05:41:54] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[05:41:54] ============== ttm_bo_init_reserved_mock_man  ==============
[05:41:54] [PASSED] Buffer object for userspace
[05:41:54] [PASSED] Kernel buffer object
[05:41:54] [PASSED] Shared buffer object
[05:41:54] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[05:41:54] [PASSED] ttm_bo_init_reserved_resv
[05:41:54] ================== ttm_bo_validate_basic  ==================
[05:41:54] [PASSED] Buffer object for userspace
[05:41:54] [PASSED] Kernel buffer object
[05:41:54] [PASSED] Shared buffer object
[05:41:54] ============== [PASSED] ttm_bo_validate_basic ==============
[05:41:54] [PASSED] ttm_bo_validate_invalid_placement
[05:41:54] ============= ttm_bo_validate_same_placement  ==============
[05:41:54] [PASSED] System manager
[05:41:54] [PASSED] VRAM manager
[05:41:54] ========= [PASSED] ttm_bo_validate_same_placement ==========
[05:41:54] [PASSED] ttm_bo_validate_failed_alloc
[05:41:54] [PASSED] ttm_bo_validate_pinned
[05:41:54] [PASSED] ttm_bo_validate_busy_placement
[05:41:54] ================ ttm_bo_validate_multihop  =================
[05:41:54] [PASSED] Buffer object for userspace
[05:41:54] [PASSED] Kernel buffer object
[05:41:54] [PASSED] Shared buffer object
[05:41:54] ============ [PASSED] ttm_bo_validate_multihop =============
[05:41:54] ========== ttm_bo_validate_no_placement_signaled  ==========
[05:41:54] [PASSED] Buffer object in system domain, no page vector
[05:41:54] [PASSED] Buffer object in system domain with an existing page vector
[05:41:54] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[05:41:54] ======== ttm_bo_validate_no_placement_not_signaled  ========
[05:41:54] [PASSED] Buffer object for userspace
[05:41:54] [PASSED] Kernel buffer object
[05:41:54] [PASSED] Shared buffer object
[05:41:54] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[05:41:54] [PASSED] ttm_bo_validate_move_fence_signaled
[05:41:54] ========= ttm_bo_validate_move_fence_not_signaled  =========
[05:41:54] [PASSED] Waits for GPU
[05:41:54] [PASSED] Tries to lock straight away
[05:41:54] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[05:41:54] [PASSED] ttm_bo_validate_swapout
[05:41:54] [PASSED] ttm_bo_validate_happy_evict
[05:41:54] [PASSED] ttm_bo_validate_all_pinned_evict
[05:41:54] [PASSED] ttm_bo_validate_allowed_only_evict
[05:41:54] [PASSED] ttm_bo_validate_deleted_evict
[05:41:54] [PASSED] ttm_bo_validate_busy_domain_evict
[05:41:54] [PASSED] ttm_bo_validate_evict_gutting
[05:41:54] [PASSED] ttm_bo_validate_recrusive_evict
[05:41:54] ================= [PASSED] ttm_bo_validate =================
[05:41:54] ============================================================
[05:41:54] Testing complete. Ran 102 tests: passed: 102
[05:41:54] Elapsed time: 11.923s total, 1.772s configuring, 9.936s building, 0.183s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


