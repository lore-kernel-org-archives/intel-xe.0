Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D84C5AD4E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 09:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ED410E76E;
	Mon, 10 Aug 2026 09:35:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDC710E76E;
 Mon, 10 Aug 2026 09:35:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/pagemap=3A_Prevent_double_?=
 =?utf-8?q?migration_of_device_pages_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 09:35:28 -0000
Message-ID: <178635452862.34065.7610621768407622842@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810092845.2776097-1-arvind.yadav@intel.com>
In-Reply-To: <20260810092845.2776097-1-arvind.yadav@intel.com>
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

Series: drm/pagemap: Prevent double migration of device pages (rev7)
URL   : https://patchwork.freedesktop.org/series/171495/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:34:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:34:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:34:45] Starting KUnit Kernel (1/1)...
[09:34:45] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:34:45] ================== guc_buf (11 subtests) ===================
[09:34:45] [PASSED] test_smallest
[09:34:45] [PASSED] test_largest
[09:34:45] [PASSED] test_granular
[09:34:45] [PASSED] test_unique
[09:34:45] [PASSED] test_overlap
[09:34:45] [PASSED] test_reusable
[09:34:45] [PASSED] test_too_big
[09:34:45] [PASSED] test_flush
[09:34:45] [PASSED] test_lookup
[09:34:45] [PASSED] test_data
[09:34:45] [PASSED] test_class
[09:34:45] ===================== [PASSED] guc_buf =====================
[09:34:45] =================== guc_dbm (7 subtests) ===================
[09:34:45] [PASSED] test_empty
[09:34:45] [PASSED] test_default
[09:34:45] ======================== test_size  ========================
[09:34:45] [PASSED] 4
[09:34:45] [PASSED] 8
[09:34:45] [PASSED] 32
[09:34:45] [PASSED] 256
[09:34:45] ==================== [PASSED] test_size ====================
[09:34:45] ======================= test_reuse  ========================
[09:34:45] [PASSED] 4
[09:34:45] [PASSED] 8
[09:34:45] [PASSED] 32
[09:34:45] [PASSED] 256
[09:34:45] =================== [PASSED] test_reuse ====================
[09:34:45] =================== test_range_overlap  ====================
[09:34:45] [PASSED] 4
[09:34:45] [PASSED] 8
[09:34:45] [PASSED] 32
[09:34:45] [PASSED] 256
[09:34:45] =============== [PASSED] test_range_overlap ================
[09:34:45] =================== test_range_compact  ====================
[09:34:45] [PASSED] 4
[09:34:45] [PASSED] 8
[09:34:45] [PASSED] 32
[09:34:45] [PASSED] 256
[09:34:45] =============== [PASSED] test_range_compact ================
[09:34:45] ==================== test_range_spare  =====================
[09:34:45] [PASSED] 4
[09:34:45] [PASSED] 8
[09:34:45] [PASSED] 32
[09:34:45] [PASSED] 256
[09:34:45] ================ [PASSED] test_range_spare =================
[09:34:45] ===================== [PASSED] guc_dbm =====================
[09:34:45] =================== guc_idm (6 subtests) ===================
[09:34:45] [PASSED] bad_init
[09:34:45] [PASSED] no_init
[09:34:45] [PASSED] init_fini
[09:34:45] [PASSED] check_used
[09:34:45] [PASSED] check_quota
[09:34:45] [PASSED] check_all
[09:34:45] ===================== [PASSED] guc_idm =====================
[09:34:45] =============== guc_klv_helpers (9 subtests) ===============
[09:34:45] [PASSED] test_count
[09:34:45] [PASSED] test_encode_u32
[09:34:45] [PASSED] test_encode_u64
[09:34:45] [PASSED] test_encode_string
[09:34:45] [PASSED] test_encode_object_raw
[09:34:45] [PASSED] test_encode_object_klv
[09:34:45] [PASSED] test_encode_object_nested
[09:34:45] [PASSED] test_encode_object_basic
[09:34:45] [PASSED] test_print
[09:34:45] ================= [PASSED] guc_klv_helpers =================
[09:34:45] ================== no_relay (3 subtests) ===================
[09:34:45] [PASSED] xe_drops_guc2pf_if_not_ready
[09:34:45] [PASSED] xe_drops_guc2vf_if_not_ready
[09:34:45] [PASSED] xe_rejects_send_if_not_ready
[09:34:45] ==================== [PASSED] no_relay =====================
[09:34:45] ================== pf_relay (14 subtests) ==================
[09:34:45] [PASSED] pf_rejects_guc2pf_too_short
[09:34:45] [PASSED] pf_rejects_guc2pf_too_long
[09:34:45] [PASSED] pf_rejects_guc2pf_no_payload
[09:34:45] [PASSED] pf_fails_no_payload
[09:34:45] [PASSED] pf_fails_bad_origin
[09:34:45] [PASSED] pf_fails_bad_type
[09:34:45] [PASSED] pf_txn_reports_error
[09:34:45] [PASSED] pf_txn_sends_pf2guc
[09:34:45] [PASSED] pf_sends_pf2guc
[09:34:45] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:34:45] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:34:45] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:34:45] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:34:45] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:34:45] ==================== [PASSED] pf_relay =====================
[09:34:45] ================== vf_relay (3 subtests) ===================
[09:34:45] [PASSED] vf_rejects_guc2vf_too_short
[09:34:45] [PASSED] vf_rejects_guc2vf_too_long
[09:34:45] [PASSED] vf_rejects_guc2vf_no_payload
[09:34:45] ==================== [PASSED] vf_relay =====================
[09:34:45] ================ pf_gt_config (9 subtests) =================
[09:34:45] [PASSED] fair_contexts_1vf
[09:34:45] [PASSED] fair_doorbells_1vf
[09:34:45] [PASSED] fair_ggtt_1vf
[09:34:45] ====================== fair_vram_1vf  ======================
[09:34:45] [PASSED] 3.50 GiB
[09:34:45] [PASSED] 11.5 GiB
[09:34:45] [PASSED] 15.5 GiB
[09:34:45] [PASSED] 31.5 GiB
[09:34:45] [PASSED] 63.5 GiB
[09:34:45] [PASSED] 1.91 GiB
[09:34:45] ================== [PASSED] fair_vram_1vf ==================
[09:34:45] ================ fair_vram_1vf_admin_only  =================
[09:34:45] [PASSED] 3.50 GiB
[09:34:45] [PASSED] 11.5 GiB
[09:34:45] [PASSED] 15.5 GiB
[09:34:45] [PASSED] 31.5 GiB
[09:34:45] [PASSED] 63.5 GiB
[09:34:45] [PASSED] 1.91 GiB
[09:34:45] ============ [PASSED] fair_vram_1vf_admin_only =============
[09:34:45] ====================== fair_contexts  ======================
[09:34:45] [PASSED] 1 VF
[09:34:45] [PASSED] 2 VFs
[09:34:45] [PASSED] 3 VFs
[09:34:45] [PASSED] 4 VFs
[09:34:45] [PASSED] 5 VFs
[09:34:45] [PASSED] 6 VFs
[09:34:45] [PASSED] 7 VFs
[09:34:45] [PASSED] 8 VFs
[09:34:45] [PASSED] 9 VFs
[09:34:45] [PASSED] 10 VFs
[09:34:45] [PASSED] 11 VFs
[09:34:45] [PASSED] 12 VFs
[09:34:45] [PASSED] 13 VFs
[09:34:45] [PASSED] 14 VFs
[09:34:45] [PASSED] 15 VFs
[09:34:45] [PASSED] 16 VFs
[09:34:45] [PASSED] 17 VFs
[09:34:45] [PASSED] 18 VFs
[09:34:45] [PASSED] 19 VFs
[09:34:45] [PASSED] 20 VFs
[09:34:45] [PASSED] 21 VFs
[09:34:45] [PASSED] 22 VFs
[09:34:45] [PASSED] 23 VFs
[09:34:45] [PASSED] 24 VFs
[09:34:45] [PASSED] 25 VFs
[09:34:45] [PASSED] 26 VFs
[09:34:45] [PASSED] 27 VFs
[09:34:45] [PASSED] 28 VFs
[09:34:45] [PASSED] 29 VFs
[09:34:45] [PASSED] 30 VFs
[09:34:45] [PASSED] 31 VFs
[09:34:45] [PASSED] 32 VFs
[09:34:45] [PASSED] 33 VFs
[09:34:45] [PASSED] 34 VFs
[09:34:45] [PASSED] 35 VFs
[09:34:45] [PASSED] 36 VFs
[09:34:45] [PASSED] 37 VFs
[09:34:45] [PASSED] 38 VFs
[09:34:45] [PASSED] 39 VFs
[09:34:45] [PASSED] 40 VFs
[09:34:45] [PASSED] 41 VFs
[09:34:45] [PASSED] 42 VFs
[09:34:45] [PASSED] 43 VFs
[09:34:45] [PASSED] 44 VFs
[09:34:45] [PASSED] 45 VFs
[09:34:45] [PASSED] 46 VFs
[09:34:45] [PASSED] 47 VFs
[09:34:45] [PASSED] 48 VFs
[09:34:45] [PASSED] 49 VFs
[09:34:45] [PASSED] 50 VFs
[09:34:45] [PASSED] 51 VFs
[09:34:45] [PASSED] 52 VFs
[09:34:45] [PASSED] 53 VFs
[09:34:45] [PASSED] 54 VFs
[09:34:45] [PASSED] 55 VFs
[09:34:45] [PASSED] 56 VFs
[09:34:45] [PASSED] 57 VFs
[09:34:45] [PASSED] 58 VFs
[09:34:45] [PASSED] 59 VFs
[09:34:45] [PASSED] 60 VFs
[09:34:45] [PASSED] 61 VFs
[09:34:45] [PASSED] 62 VFs
[09:34:45] [PASSED] 63 VFs
[09:34:45] ================== [PASSED] fair_contexts ==================
[09:34:45] ===================== fair_doorbells  ======================
[09:34:45] [PASSED] 1 VF
[09:34:45] [PASSED] 2 VFs
[09:34:45] [PASSED] 3 VFs
[09:34:45] [PASSED] 4 VFs
[09:34:45] [PASSED] 5 VFs
[09:34:45] [PASSED] 6 VFs
[09:34:45] [PASSED] 7 VFs
[09:34:45] [PASSED] 8 VFs
[09:34:45] [PASSED] 9 VFs
[09:34:45] [PASSED] 10 VFs
[09:34:45] [PASSED] 11 VFs
[09:34:45] [PASSED] 12 VFs
[09:34:45] [PASSED] 13 VFs
[09:34:45] [PASSED] 14 VFs
[09:34:45] [PASSED] 15 VFs
[09:34:45] [PASSED] 16 VFs
[09:34:45] [PASSED] 17 VFs
[09:34:45] [PASSED] 18 VFs
[09:34:45] [PASSED] 19 VFs
[09:34:45] [PASSED] 20 VFs
[09:34:45] [PASSED] 21 VFs
[09:34:45] [PASSED] 22 VFs
[09:34:45] [PASSED] 23 VFs
[09:34:45] [PASSED] 24 VFs
[09:34:45] [PASSED] 25 VFs
[09:34:45] [PASSED] 26 VFs
[09:34:45] [PASSED] 27 VFs
[09:34:45] [PASSED] 28 VFs
[09:34:45] [PASSED] 29 VFs
[09:34:45] [PASSED] 30 VFs
[09:34:45] [PASSED] 31 VFs
[09:34:45] [PASSED] 32 VFs
[09:34:45] [PASSED] 33 VFs
[09:34:45] [PASSED] 34 VFs
[09:34:45] [PASSED] 35 VFs
[09:34:45] [PASSED] 36 VFs
[09:34:45] [PASSED] 37 VFs
[09:34:45] [PASSED] 38 VFs
[09:34:45] [PASSED] 39 VFs
[09:34:45] [PASSED] 40 VFs
[09:34:45] [PASSED] 41 VFs
[09:34:45] [PASSED] 42 VFs
[09:34:45] [PASSED] 43 VFs
[09:34:45] [PASSED] 44 VFs
[09:34:45] [PASSED] 45 VFs
[09:34:45] [PASSED] 46 VFs
[09:34:45] [PASSED] 47 VFs
[09:34:45] [PASSED] 48 VFs
[09:34:45] [PASSED] 49 VFs
[09:34:45] [PASSED] 50 VFs
[09:34:45] [PASSED] 51 VFs
[09:34:45] [PASSED] 52 VFs
[09:34:45] [PASSED] 53 VFs
[09:34:45] [PASSED] 54 VFs
[09:34:45] [PASSED] 55 VFs
[09:34:45] [PASSED] 56 VFs
[09:34:45] [PASSED] 57 VFs
[09:34:45] [PASSED] 58 VFs
[09:34:45] [PASSED] 59 VFs
[09:34:45] [PASSED] 60 VFs
[09:34:45] [PASSED] 61 VFs
[09:34:45] [PASSED] 62 VFs
[09:34:45] [PASSED] 63 VFs
[09:34:45] ================= [PASSED] fair_doorbells ==================
[09:34:45] ======================== fair_ggtt  ========================
[09:34:45] [PASSED] 1 VF
[09:34:45] [PASSED] 2 VFs
[09:34:45] [PASSED] 3 VFs
[09:34:45] [PASSED] 4 VFs
[09:34:45] [PASSED] 5 VFs
[09:34:45] [PASSED] 6 VFs
[09:34:45] [PASSED] 7 VFs
[09:34:45] [PASSED] 8 VFs
[09:34:45] [PASSED] 9 VFs
[09:34:45] [PASSED] 10 VFs
[09:34:45] [PASSED] 11 VFs
[09:34:45] [PASSED] 12 VFs
[09:34:45] [PASSED] 13 VFs
[09:34:45] [PASSED] 14 VFs
[09:34:45] [PASSED] 15 VFs
[09:34:45] [PASSED] 16 VFs
[09:34:45] [PASSED] 17 VFs
[09:34:45] [PASSED] 18 VFs
[09:34:45] [PASSED] 19 VFs
[09:34:45] [PASSED] 20 VFs
[09:34:45] [PASSED] 21 VFs
[09:34:45] [PASSED] 22 VFs
[09:34:45] [PASSED] 23 VFs
[09:34:45] [PASSED] 24 VFs
[09:34:45] [PASSED] 25 VFs
[09:34:45] [PASSED] 26 VFs
[09:34:45] [PASSED] 27 VFs
[09:34:45] [PASSED] 28 VFs
[09:34:45] [PASSED] 29 VFs
[09:34:45] [PASSED] 30 VFs
[09:34:45] [PASSED] 31 VFs
[09:34:45] [PASSED] 32 VFs
[09:34:45] [PASSED] 33 VFs
[09:34:45] [PASSED] 34 VFs
[09:34:45] [PASSED] 35 VFs
[09:34:45] [PASSED] 36 VFs
[09:34:45] [PASSED] 37 VFs
[09:34:45] [PASSED] 38 VFs
[09:34:45] [PASSED] 39 VFs
[09:34:45] [PASSED] 40 VFs
[09:34:45] [PASSED] 41 VFs
[09:34:45] [PASSED] 42 VFs
[09:34:45] [PASSED] 43 VFs
[09:34:45] [PASSED] 44 VFs
[09:34:45] [PASSED] 45 VFs
[09:34:45] [PASSED] 46 VFs
[09:34:45] [PASSED] 47 VFs
[09:34:45] [PASSED] 48 VFs
[09:34:45] [PASSED] 49 VFs
[09:34:45] [PASSED] 50 VFs
[09:34:45] [PASSED] 51 VFs
[09:34:45] [PASSED] 52 VFs
[09:34:45] [PASSED] 53 VFs
[09:34:45] [PASSED] 54 VFs
[09:34:45] [PASSED] 55 VFs
[09:34:45] [PASSED] 56 VFs
[09:34:45] [PASSED] 57 VFs
[09:34:45] [PASSED] 58 VFs
[09:34:45] [PASSED] 59 VFs
[09:34:45] [PASSED] 60 VFs
[09:34:45] [PASSED] 61 VFs
[09:34:45] [PASSED] 62 VFs
[09:34:45] [PASSED] 63 VFs
[09:34:45] ==================== [PASSED] fair_ggtt ====================
[09:34:45] ======================== fair_vram  ========================
[09:34:45] [PASSED] 1 VF
[09:34:45] [PASSED] 2 VFs
[09:34:45] [PASSED] 3 VFs
[09:34:45] [PASSED] 4 VFs
[09:34:45] [PASSED] 5 VFs
[09:34:45] [PASSED] 6 VFs
[09:34:45] [PASSED] 7 VFs
[09:34:45] [PASSED] 8 VFs
[09:34:45] [PASSED] 9 VFs
[09:34:45] [PASSED] 10 VFs
[09:34:45] [PASSED] 11 VFs
[09:34:45] [PASSED] 12 VFs
[09:34:45] [PASSED] 13 VFs
[09:34:45] [PASSED] 14 VFs
[09:34:45] [PASSED] 15 VFs
[09:34:45] [PASSED] 16 VFs
[09:34:45] [PASSED] 17 VFs
[09:34:45] [PASSED] 18 VFs
[09:34:45] [PASSED] 19 VFs
[09:34:45] [PASSED] 20 VFs
[09:34:45] [PASSED] 21 VFs
[09:34:45] [PASSED] 22 VFs
[09:34:45] [PASSED] 23 VFs
[09:34:45] [PASSED] 24 VFs
[09:34:45] [PASSED] 25 VFs
[09:34:45] [PASSED] 26 VFs
[09:34:45] [PASSED] 27 VFs
[09:34:45] [PASSED] 28 VFs
[09:34:45] [PASSED] 29 VFs
[09:34:45] [PASSED] 30 VFs
[09:34:45] [PASSED] 31 VFs
[09:34:45] [PASSED] 32 VFs
[09:34:45] [PASSED] 33 VFs
[09:34:45] [PASSED] 34 VFs
[09:34:45] [PASSED] 35 VFs
[09:34:45] [PASSED] 36 VFs
[09:34:45] [PASSED] 37 VFs
[09:34:45] [PASSED] 38 VFs
[09:34:45] [PASSED] 39 VFs
[09:34:45] [PASSED] 40 VFs
[09:34:45] [PASSED] 41 VFs
[09:34:45] [PASSED] 42 VFs
[09:34:45] [PASSED] 43 VFs
[09:34:45] [PASSED] 44 VFs
[09:34:45] [PASSED] 45 VFs
[09:34:45] [PASSED] 46 VFs
[09:34:45] [PASSED] 47 VFs
[09:34:45] [PASSED] 48 VFs
[09:34:45] [PASSED] 49 VFs
[09:34:45] [PASSED] 50 VFs
[09:34:45] [PASSED] 51 VFs
[09:34:45] [PASSED] 52 VFs
[09:34:45] [PASSED] 53 VFs
[09:34:45] [PASSED] 54 VFs
[09:34:45] [PASSED] 55 VFs
[09:34:45] [PASSED] 56 VFs
[09:34:45] [PASSED] 57 VFs
[09:34:45] [PASSED] 58 VFs
[09:34:45] [PASSED] 59 VFs
[09:34:45] [PASSED] 60 VFs
[09:34:45] [PASSED] 61 VFs
[09:34:45] [PASSED] 62 VFs
[09:34:45] [PASSED] 63 VFs
[09:34:45] ==================== [PASSED] fair_vram ====================
[09:34:45] ================== [PASSED] pf_gt_config ===================
[09:34:45] ===================== lmtt (1 subtest) =====================
[09:34:45] ======================== test_ops  =========================
[09:34:45] [PASSED] 2-level
[09:34:45] [PASSED] multi-level
[09:34:45] ==================== [PASSED] test_ops =====================
[09:34:45] ====================== [PASSED] lmtt =======================
[09:34:45] ================= sriov_packet (1 subtest) =================
[09:34:45] [PASSED] test_descriptor_init
[09:34:45] ================== [PASSED] sriov_packet ===================
[09:34:45] ================= pf_service (11 subtests) =================
[09:34:45] [PASSED] pf_negotiate_any
[09:34:45] [PASSED] pf_negotiate_base_match
[09:34:45] [PASSED] pf_negotiate_base_newer
[09:34:45] [PASSED] pf_negotiate_base_next
[09:34:45] [SKIPPED] pf_negotiate_base_older (no older minor)
[09:34:45] [PASSED] pf_negotiate_base_prev
[09:34:45] [PASSED] pf_negotiate_latest_match
[09:34:45] [PASSED] pf_negotiate_latest_newer
[09:34:45] [PASSED] pf_negotiate_latest_next
[09:34:45] [SKIPPED] pf_negotiate_latest_older (no older minor)
[09:34:45] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[09:34:45] =================== [PASSED] pf_service ====================
[09:34:45] ================= xe_guc_g2g (2 subtests) ==================
[09:34:45] ============== xe_live_guc_g2g_kunit_default  ==============
[09:34:45] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[09:34:45] ============== xe_live_guc_g2g_kunit_allmem  ===============
[09:34:45] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[09:34:45] =================== [SKIPPED] xe_guc_g2g ===================
[09:34:45] =================== xe_mocs (2 subtests) ===================
[09:34:45] ================ xe_live_mocs_kernel_kunit  ================
[09:34:45] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[09:34:45] ================ xe_live_mocs_reset_kunit  =================
[09:34:45] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[09:34:45] ==================== [SKIPPED] xe_mocs =====================
[09:34:45] ================= xe_migrate (2 subtests) ==================
[09:34:45] ================= xe_migrate_sanity_kunit  =================
[09:34:45] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[09:34:45] ================== xe_validate_ccs_kunit  ==================
[09:34:45] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[09:34:45] =================== [SKIPPED] xe_migrate ===================
[09:34:45] ================== xe_dma_buf (1 subtest) ==================
[09:34:45] ==================== xe_dma_buf_kunit  =====================
[09:34:45] ================ [SKIPPED] xe_dma_buf_kunit ================
[09:34:45] =================== [SKIPPED] xe_dma_buf ===================
[09:34:45] ================= xe_bo_shrink (1 subtest) =================
[09:34:45] =================== xe_bo_shrink_kunit  ====================
[09:34:45] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[09:34:45] ================== [SKIPPED] xe_bo_shrink ==================
[09:34:45] ==================== xe_bo (2 subtests) ====================
[09:34:45] ================== xe_ccs_migrate_kunit  ===================
[09:34:45] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[09:34:45] ==================== xe_bo_evict_kunit  ====================
[09:34:45] =============== [SKIPPED] xe_bo_evict_kunit ================
[09:34:45] ===================== [SKIPPED] xe_bo ======================
[09:34:45] ==================== args (13 subtests) ====================
[09:34:45] [PASSED] count_args_test
[09:34:45] [PASSED] call_args_example
[09:34:45] [PASSED] call_args_test
[09:34:45] [PASSED] drop_first_arg_example
[09:34:45] [PASSED] drop_first_arg_test
[09:34:45] [PASSED] first_arg_example
[09:34:45] [PASSED] first_arg_test
[09:34:45] [PASSED] last_arg_example
[09:34:45] [PASSED] last_arg_test
[09:34:45] [PASSED] pick_arg_example
[09:34:45] [PASSED] if_args_example
[09:34:45] [PASSED] if_args_test
[09:34:45] [PASSED] sep_comma_example
[09:34:45] ====================== [PASSED] args =======================
[09:34:45] =================== xe_pci (3 subtests) ====================
[09:34:45] ==================== check_graphics_ip  ====================
[09:34:45] [PASSED] 12.00 Xe_LP
[09:34:45] [PASSED] 12.10 Xe_LP+
[09:34:45] [PASSED] 12.55 Xe_HPG
[09:34:45] [PASSED] 12.60 Xe_HPC
[09:34:45] [PASSED] 12.70 Xe_LPG
[09:34:45] [PASSED] 12.71 Xe_LPG
[09:34:45] [PASSED] 12.74 Xe_LPG+
[09:34:45] [PASSED] 20.01 Xe2_HPG
[09:34:45] [PASSED] 20.02 Xe2_HPG
[09:34:45] [PASSED] 20.04 Xe2_LPG
[09:34:45] [PASSED] 30.00 Xe3_LPG
[09:34:45] [PASSED] 30.01 Xe3_LPG
[09:34:45] [PASSED] 30.03 Xe3_LPG
[09:34:45] [PASSED] 30.04 Xe3_LPG
[09:34:45] [PASSED] 30.05 Xe3_LPG
[09:34:45] [PASSED] 35.10 Xe3p_LPG
[09:34:45] [PASSED] 35.11 Xe3p_XPC
[09:34:45] ================ [PASSED] check_graphics_ip ================
[09:34:45] ===================== check_media_ip  ======================
[09:34:45] [PASSED] 12.00 Xe_M
[09:34:45] [PASSED] 12.55 Xe_HPM
[09:34:45] [PASSED] 13.00 Xe_LPM+
[09:34:45] [PASSED] 13.01 Xe2_HPM
[09:34:45] [PASSED] 20.00 Xe2_LPM
[09:34:45] [PASSED] 30.00 Xe3_LPM
[09:34:45] [PASSED] 30.02 Xe3_LPM
[09:34:45] [PASSED] 35.00 Xe3p_LPM
[09:34:45] [PASSED] 35.03 Xe3p_HPM
[09:34:45] ================= [PASSED] check_media_ip ==================
[09:34:45] =================== check_platform_desc  ===================
[09:34:45] [PASSED] 0x9A60 (TIGERLAKE)
[09:34:45] [PASSED] 0x9A68 (TIGERLAKE)
[09:34:45] [PASSED] 0x9A70 (TIGERLAKE)
[09:34:45] [PASSED] 0x9A40 (TIGERLAKE)
[09:34:45] [PASSED] 0x9A49 (TIGERLAKE)
[09:34:45] [PASSED] 0x9A59 (TIGERLAKE)
[09:34:45] [PASSED] 0x9A78 (TIGERLAKE)
[09:34:45] [PASSED] 0x9AC0 (TIGERLAKE)
[09:34:45] [PASSED] 0x9AC9 (TIGERLAKE)
[09:34:45] [PASSED] 0x9AD9 (TIGERLAKE)
[09:34:45] [PASSED] 0x9AF8 (TIGERLAKE)
[09:34:45] [PASSED] 0x4C80 (ROCKETLAKE)
[09:34:45] [PASSED] 0x4C8A (ROCKETLAKE)
[09:34:45] [PASSED] 0x4C8B (ROCKETLAKE)
[09:34:45] [PASSED] 0x4C8C (ROCKETLAKE)
[09:34:45] [PASSED] 0x4C90 (ROCKETLAKE)
[09:34:45] [PASSED] 0x4C9A (ROCKETLAKE)
[09:34:45] [PASSED] 0x4680 (ALDERLAKE_S)
[09:34:45] [PASSED] 0x4682 (ALDERLAKE_S)
[09:34:45] [PASSED] 0x4688 (ALDERLAKE_S)
[09:34:45] [PASSED] 0x468A (ALDERLAKE_S)
[09:34:45] [PASSED] 0x468B (ALDERLAKE_S)
[09:34:45] [PASSED] 0x4690 (ALDERLAKE_S)
[09:34:45] [PASSED] 0x4692 (ALDERLAKE_S)
[09:34:45] [PASSED] 0x4693 (ALDERLAKE_S)
[09:34:45] [PASSED] 0x46A0 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46A1 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46A2 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46A3 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46A6 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46A8 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46AA (ALDERLAKE_P)
[09:34:45] [PASSED] 0x462A (ALDERLAKE_P)
[09:34:45] [PASSED] 0x4626 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x4628 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46B0 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46B1 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46B2 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46B3 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46C0 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46C1 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46C2 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46C3 (ALDERLAKE_P)
[09:34:45] [PASSED] 0x46D0 (ALDERLAKE_N)
[09:34:45] [PASSED] 0x46D1 (ALDERLAKE_N)
[09:34:45] [PASSED] 0x46D2 (ALDERLAKE_N)
[09:34:45] [PASSED] 0x46D3 (ALDERLAKE_N)
[09:34:45] [PASSED] 0x46D4 (ALDERLAKE_N)
[09:34:45] [PASSED] 0xA721 (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7A1 (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7A9 (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7AC (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7AD (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA720 (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7A0 (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7A8 (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7AA (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA7AB (ALDERLAKE_P)
[09:34:45] [PASSED] 0xA780 (ALDERLAKE_S)
[09:34:45] [PASSED] 0xA781 (ALDERLAKE_S)
[09:34:45] [PASSED] 0xA782 (ALDERLAKE_S)
[09:34:45] [PASSED] 0xA783 (ALDERLAKE_S)
[09:34:45] [PASSED] 0xA788 (ALDERLAKE_S)
[09:34:45] [PASSED] 0xA789 (ALDERLAKE_S)
[09:34:45] [PASSED] 0xA78A (ALDERLAKE_S)
[09:34:45] [PASSED] 0xA78B (ALDERLAKE_S)
[09:34:45] [PASSED] 0x4905 (DG1)
[09:34:45] [PASSED] 0x4906 (DG1)
[09:34:45] [PASSED] 0x4907 (DG1)
[09:34:45] [PASSED] 0x4908 (DG1)
[09:34:45] [PASSED] 0x4909 (DG1)
[09:34:45] [PASSED] 0x56C0 (DG2)
[09:34:45] [PASSED] 0x56C2 (DG2)
[09:34:45] [PASSED] 0x56C1 (DG2)
[09:34:45] [PASSED] 0x7D51 (METEORLAKE)
[09:34:45] [PASSED] 0x7DD1 (METEORLAKE)
[09:34:45] [PASSED] 0x7D41 (METEORLAKE)
[09:34:45] [PASSED] 0x7D67 (METEORLAKE)
[09:34:45] [PASSED] 0xB640 (METEORLAKE)
[09:34:45] [PASSED] 0x56A0 (DG2)
[09:34:45] [PASSED] 0x56A1 (DG2)
[09:34:45] [PASSED] 0x56A2 (DG2)
[09:34:45] [PASSED] 0x56BE (DG2)
[09:34:45] [PASSED] 0x56BF (DG2)
[09:34:45] [PASSED] 0x5690 (DG2)
[09:34:45] [PASSED] 0x5691 (DG2)
[09:34:45] [PASSED] 0x5692 (DG2)
[09:34:45] [PASSED] 0x56A5 (DG2)
[09:34:45] [PASSED] 0x56A6 (DG2)
[09:34:45] [PASSED] 0x56B0 (DG2)
[09:34:45] [PASSED] 0x56B1 (DG2)
[09:34:45] [PASSED] 0x56BA (DG2)
[09:34:45] [PASSED] 0x56BB (DG2)
[09:34:45] [PASSED] 0x56BC (DG2)
[09:34:45] [PASSED] 0x56BD (DG2)
[09:34:45] [PASSED] 0x5693 (DG2)
[09:34:45] [PASSED] 0x5694 (DG2)
[09:34:45] [PASSED] 0x5695 (DG2)
[09:34:45] [PASSED] 0x56A3 (DG2)
[09:34:45] [PASSED] 0x56A4 (DG2)
[09:34:45] [PASSED] 0x56B2 (DG2)
[09:34:45] [PASSED] 0x56B3 (DG2)
[09:34:45] [PASSED] 0x5696 (DG2)
[09:34:45] [PASSED] 0x5697 (DG2)
[09:34:45] [PASSED] 0xB69 (PVC)
[09:34:45] [PASSED] 0xB6E (PVC)
[09:34:45] [PASSED] 0xBD4 (PVC)
[09:34:45] [PASSED] 0xBD5 (PVC)
[09:34:45] [PASSED] 0xBD6 (PVC)
[09:34:45] [PASSED] 0xBD7 (PVC)
[09:34:45] [PASSED] 0xBD8 (PVC)
[09:34:45] [PASSED] 0xBD9 (PVC)
[09:34:45] [PASSED] 0xBDA (PVC)
[09:34:45] [PASSED] 0xBDB (PVC)
[09:34:45] [PASSED] 0xBE0 (PVC)
[09:34:45] [PASSED] 0xBE1 (PVC)
[09:34:45] [PASSED] 0xBE5 (PVC)
[09:34:45] [PASSED] 0x7D40 (METEORLAKE)
[09:34:45] [PASSED] 0x7D45 (METEORLAKE)
[09:34:45] [PASSED] 0x7D55 (METEORLAKE)
[09:34:45] [PASSED] 0x7D60 (METEORLAKE)
[09:34:45] [PASSED] 0x7DD5 (METEORLAKE)
[09:34:45] [PASSED] 0x6420 (LUNARLAKE)
[09:34:45] [PASSED] 0x64A0 (LUNARLAKE)
[09:34:45] [PASSED] 0x64B0 (LUNARLAKE)
[09:34:45] [PASSED] 0xE202 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE209 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE20B (BATTLEMAGE)
[09:34:45] [PASSED] 0xE20C (BATTLEMAGE)
[09:34:45] [PASSED] 0xE20D (BATTLEMAGE)
[09:34:45] [PASSED] 0xE210 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE211 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE212 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE216 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE220 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE221 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE222 (BATTLEMAGE)
[09:34:45] [PASSED] 0xE223 (BATTLEMAGE)
[09:34:45] [PASSED] 0xB080 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB081 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB082 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB083 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB084 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB085 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB086 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB087 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB08F (PANTHERLAKE)
[09:34:45] [PASSED] 0xB090 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB0A0 (PANTHERLAKE)
[09:34:45] [PASSED] 0xB0B0 (PANTHERLAKE)
[09:34:45] [PASSED] 0xFD80 (PANTHERLAKE)
[09:34:45] [PASSED] 0xFD81 (PANTHERLAKE)
[09:34:45] [PASSED] 0xD740 (NOVALAKE_S)
[09:34:45] [PASSED] 0xD741 (NOVALAKE_S)
[09:34:45] [PASSED] 0xD742 (NOVALAKE_S)
[09:34:45] [PASSED] 0xD743 (NOVALAKE_S)
[09:34:45] [PASSED] 0xD745 (NOVALAKE_S)
[09:34:45] [PASSED] 0xD74A (NOVALAKE_S)
[09:34:45] [PASSED] 0xD74B (NOVALAKE_S)
[09:34:45] [PASSED] 0x674C (CRESCENTISLAND)
[09:34:45] [PASSED] 0x674D (CRESCENTISLAND)
[09:34:45] [PASSED] 0x674E (CRESCENTISLAND)
[09:34:45] [PASSED] 0x674F (CRESCENTISLAND)
[09:34:45] [PASSED] 0x6750 (CRESCENTISLAND)
[09:34:45] [PASSED] 0xD750 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD751 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD752 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD753 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD754 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD755 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD756 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD757 (NOVALAKE_P)
[09:34:45] [PASSED] 0xD75F (NOVALAKE_P)
[09:34:45] =============== [PASSED] check_platform_desc ===============
[09:34:45] ===================== [PASSED] xe_pci ======================
[09:34:45] ============= xe_rtp_tables_test (5 subtests) ==============
[09:34:45] ================== xe_rtp_table_gt_test  ===================
[09:34:45] [PASSED] gt_was/14011060649
[09:34:45] [PASSED] gt_was/14011059788
[09:34:45] [PASSED] gt_was/14015795083
[09:34:45] [PASSED] gt_was/16021867713
[09:34:45] [PASSED] gt_was/14019449301
[09:34:45] [PASSED] gt_was/16028005424
[09:34:45] [PASSED] gt_was/14026578760
[09:34:45] [PASSED] gt_was/1409420604
[09:34:45] [PASSED] gt_was/1408615072
[09:34:45] [PASSED] gt_was/22010523718
[09:34:45] [PASSED] gt_was/14011006942
[09:34:45] [PASSED] gt_was/14014830051
[09:34:45] [PASSED] gt_was/18018781329
[09:34:45] [PASSED] gt_was/1509235366
[09:34:45] [PASSED] gt_was/18018781329
[09:34:45] [PASSED] gt_was/16016694945
[09:34:45] [PASSED] gt_was/14018575942
[09:34:45] [PASSED] gt_was/22016670082
[09:34:45] [PASSED] gt_was/22016670082
[09:34:45] [PASSED] gt_was/14017421178
[09:34:45] [PASSED] gt_was/16025250150
[09:34:45] [PASSED] gt_was/14021871409
[09:34:45] [PASSED] gt_was/16021865536
[09:34:45] [PASSED] gt_was/14021486841
[09:34:45] [PASSED] gt_was/14025160223
[09:34:45] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[09:34:45] [PASSED] gt_was/14025635424
[09:34:45] [PASSED] gt_was/16028005424
[09:34:45] ============== [PASSED] xe_rtp_table_gt_test ===============
[09:34:45] ================== xe_rtp_table_gt_test  ===================
[09:34:45] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[09:34:45] [PASSED] gt_tunings/Tuning: 32B Access Enable
[09:34:45] [PASSED] gt_tunings/Tuning: L3 cache
[09:34:45] [PASSED] gt_tunings/Tuning: L3 cache - media
[09:34:45] [PASSED] gt_tunings/Tuning: Compression Overfetch
[09:34:45] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[09:34:45] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[09:34:45] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[09:34:45] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[09:34:45] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[09:34:45] [PASSED] gt_tunings/Tuning: Stateless compression control
[09:34:45] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[09:34:45] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[09:34:45] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[09:34:45] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[09:34:45] ============== [PASSED] xe_rtp_table_gt_test ===============
[09:34:45] ================== xe_rtp_table_oob_test  ==================
[09:34:45] [PASSED] oob_was/1607983814
[09:34:45] [PASSED] oob_was/16010904313
[09:34:45] [PASSED] oob_was/18022495364
[09:34:45] [PASSED] oob_was/22012773006
[09:34:45] [PASSED] oob_was/14014475959
[09:34:45] [PASSED] oob_was/22011391025
[09:34:45] [PASSED] oob_was/22012727170
[09:34:45] [PASSED] oob_was/22012727685
[09:34:45] [PASSED] oob_was/22016596838
[09:34:45] [PASSED] oob_was/18020744125
[09:34:45] [PASSED] oob_was/1409600907
[09:34:45] [PASSED] oob_was/22014953428
[09:34:45] [PASSED] oob_was/16017236439
[09:34:45] [PASSED] oob_was/14019821291
[09:34:45] [PASSED] oob_was/14015076503
[09:34:45] [PASSED] oob_was/14018913170
[09:34:45] [PASSED] oob_was/14018094691
[09:34:45] [PASSED] oob_was/18024947630
[09:34:45] [PASSED] oob_was/16022287689
[09:34:45] [PASSED] oob_was/13011645652
[09:34:45] [PASSED] oob_was/14022293748
[09:34:45] [PASSED] oob_was/22019794406
[09:34:45] [PASSED] oob_was/22019338487
[09:34:45] [PASSED] oob_was/16023588340
[09:34:45] [PASSED] oob_was/14019789679
[09:34:45] [PASSED] oob_was/14022866841
[09:34:45] [PASSED] oob_was/16021333562
[09:34:45] [PASSED] oob_was/14016712196
[09:34:45] [PASSED] oob_was/14015568240
[09:34:45] [PASSED] oob_was/18013179988
[09:34:45] [PASSED] oob_was/1508761755
[09:34:45] [PASSED] oob_was/16023105232
[09:34:45] [PASSED] oob_was/16026508708
[09:34:45] [PASSED] oob_was/14020001231
[09:34:45] [PASSED] oob_was/16023683509
[09:34:45] [PASSED] oob_was/14025515070
[09:34:45] [PASSED] oob_was/15015404425_disable
[09:34:45] [PASSED] oob_was/16026007364
[09:34:45] [PASSED] oob_was/14020316580
[09:34:45] [PASSED] oob_was/14025883347
[09:34:45] [PASSED] oob_was/16029380221
[09:34:45] [PASSED] oob_was/22022079272
[09:34:45] [PASSED] oob_was/16029897822
[09:34:45] [PASSED] oob_was/14027054324
[09:34:45] ============== [PASSED] xe_rtp_table_oob_test ==============
[09:34:45] ================ xe_rtp_table_dev_oob_test  ================
[09:34:45] [PASSED] device_oob_was/22010954014
[09:34:45] [PASSED] device_oob_was/15015404425
[09:34:45] [PASSED] device_oob_was/22019338487_display
[09:34:45] [PASSED] device_oob_was/14022085890
[09:34:45] [PASSED] device_oob_was/14026539277
[09:34:45] [PASSED] device_oob_was/14026633728
[09:34:45] [PASSED] device_oob_was/14026746987
[09:34:45] [PASSED] device_oob_was/14026779378
[09:34:45] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[09:34:45] ========== xe_rtp_table_missing_upper_bound_test  ==========
[09:34:45] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[09:34:45] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[09:34:45] [PASSED] register_whitelist/1806527549
[09:34:45] [PASSED] register_whitelist/allow_read_ctx_timestamp
[09:34:45] [PASSED] register_whitelist/allow_read_queue_timestamp
[09:34:45] [PASSED] register_whitelist/16014440446
[09:34:45] [PASSED] register_whitelist/16017236439
[09:34:45] [PASSED] register_whitelist/16020183090
[09:34:45] [PASSED] register_whitelist/14024997852
[09:34:45] [PASSED] register_whitelist/14024997852
[09:34:45] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[09:34:45] =============== [PASSED] xe_rtp_tables_test ================
[09:34:45] =================== xe_rtp (3 subtests) ====================
[09:34:45] =================== xe_rtp_rules_tests  ====================
[09:34:45] [PASSED] no
[09:34:45] [PASSED] yes
[09:34:45] [PASSED] no-and-no
[09:34:45] [PASSED] no-and-yes
[09:34:45] [PASSED] yes-and-no
[09:34:45] [PASSED] yes-and-yes
[09:34:45] [PASSED] no-or-no
[09:34:45] [PASSED] no-or-yes
[09:34:45] [PASSED] yes-or-no
[09:34:45] [PASSED] yes-or-yes
[09:34:45] [PASSED] no-yes-or-yes-no
[09:34:45] [PASSED] no-yes-or-yes-yes
[09:34:45] [PASSED] yes-yes-or-no-yes
[09:34:45] [PASSED] yes-yes-or-yes-yes
[09:34:45] [PASSED] no-no-or-yes-or-no
[09:34:45] [PASSED] or
[09:34:45] [PASSED] or-yes
[09:34:45] [PASSED] or-no
[09:34:45] [PASSED] yes-or
[09:34:45] [PASSED] no-or
[09:34:45] [PASSED] no-or-or-yes
[09:34:45] [PASSED] yes-or-or-no
[09:34:45] [PASSED] no-or-or-no
[09:34:45] [PASSED] missing-context-engine-class
[09:34:45] [PASSED] missing-context-engine-class-or-yes
[09:34:45] [PASSED] missing-context-engine-class-or-or-yes
[09:34:45] =============== [PASSED] xe_rtp_rules_tests ================
[09:34:45] =============== xe_rtp_process_to_sr_tests  ================
[09:34:45] [PASSED] coalesce-same-reg
[09:34:45] [PASSED] coalesce-same-reg-literal-and-func
[09:34:45] [PASSED] no-match-no-add
[09:34:45] [PASSED] two-regs-two-entries
[09:34:45] [PASSED] clr-one-set-other
[09:34:45] [PASSED] set-field
[09:34:45] [PASSED] conflict-duplicate
[09:34:45] [PASSED] conflict-not-disjoint
[09:34:45] [PASSED] conflict-not-disjoint-literal-and-func
[09:34:45] [PASSED] conflict-reg-type
[09:34:45] [PASSED] bad-mcr-reg-forced-to-regular
[09:34:45] [PASSED] bad-regular-reg-forced-to-mcr
[09:34:45] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[09:34:45] ================== xe_rtp_process_tests  ===================
[09:34:45] [PASSED] active1
[09:34:45] [PASSED] active2
[09:34:45] [PASSED] active-inactive
[09:34:45] [PASSED] inactive-active
[09:34:45] [PASSED] inactive-active-inactive
[09:34:45] [PASSED] inactive-inactive-inactive
[09:34:45] ============== [PASSED] xe_rtp_process_tests ===============
[09:34:45] ===================== [PASSED] xe_rtp ======================
[09:34:45] ==================== xe_wa (1 subtest) =====================
[09:34:45] ======================== xe_wa_gt  =========================
[09:34:45] [PASSED] TIGERLAKE B0
[09:34:45] [PASSED] DG1 A0
[09:34:45] [PASSED] DG1 B0
[09:34:45] [PASSED] ALDERLAKE_S A0
[09:34:45] [PASSED] ALDERLAKE_S B0
[09:34:45] [PASSED] ALDERLAKE_S C0
[09:34:45] [PASSED] ALDERLAKE_S D0
[09:34:45] [PASSED] ALDERLAKE_P A0
[09:34:45] [PASSED] ALDERLAKE_P B0
[09:34:45] [PASSED] ALDERLAKE_P C0
[09:34:45] [PASSED] ALDERLAKE_S RPLS D0
[09:34:45] [PASSED] ALDERLAKE_P RPLU E0
[09:34:45] [PASSED] DG2 G10 C0
[09:34:45] [PASSED] DG2 G11 B1
[09:34:45] [PASSED] DG2 G12 A1
[09:34:45] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[09:34:45] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[09:34:45] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[09:34:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[09:34:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[09:34:45] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[09:34:45] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[09:34:45] ==================== [PASSED] xe_wa_gt =====================
[09:34:45] ====================== [PASSED] xe_wa ======================
[09:34:45] ============================================================
[09:34:45] Testing complete. Ran 742 tests: passed: 724, skipped: 18
[09:34:45] Elapsed time: 36.973s total, 4.337s configuring, 31.970s building, 0.640s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:34:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:34:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:35:12] Starting KUnit Kernel (1/1)...
[09:35:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:35:12] ============ drm_test_pick_cmdline (2 subtests) ============
[09:35:12] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:35:12] =============== drm_test_pick_cmdline_named  ===============
[09:35:12] [PASSED] NTSC
[09:35:12] [PASSED] NTSC-J
[09:35:12] [PASSED] PAL
[09:35:12] [PASSED] PAL-M
[09:35:12] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:35:12] ============== [PASSED] drm_test_pick_cmdline ==============
[09:35:12] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[09:35:12] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[09:35:12] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[09:35:12] =========== drm_validate_clone_mode (2 subtests) ===========
[09:35:12] ============== drm_test_check_in_clone_mode  ===============
[09:35:12] [PASSED] in_clone_mode
[09:35:12] [PASSED] not_in_clone_mode
[09:35:12] ========== [PASSED] drm_test_check_in_clone_mode ===========
[09:35:12] =============== drm_test_check_valid_clones  ===============
[09:35:12] [PASSED] not_in_clone_mode
[09:35:12] [PASSED] valid_clone
[09:35:12] [PASSED] invalid_clone
[09:35:12] =========== [PASSED] drm_test_check_valid_clones ===========
[09:35:12] ============= [PASSED] drm_validate_clone_mode =============
[09:35:12] ============= drm_validate_modeset (1 subtest) =============
[09:35:12] [PASSED] drm_test_check_connector_changed_modeset
[09:35:12] ============== [PASSED] drm_validate_modeset ===============
[09:35:12] ====== drm_test_bridge_get_current_state (1 subtest) =======
[09:35:12] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[09:35:12] ======== [PASSED] drm_test_bridge_get_current_state ========
[09:35:12] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[09:35:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[09:35:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[09:35:12] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[09:35:12] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[09:35:12] ============== drm_bridge_alloc (2 subtests) ===============
[09:35:12] [PASSED] drm_test_drm_bridge_alloc_basic
[09:35:12] [PASSED] drm_test_drm_bridge_alloc_get_put
[09:35:12] ================ [PASSED] drm_bridge_alloc =================
[09:35:12] ============= drm_bridge_bus_fmt (5 subtests) ==============
[09:35:12] [PASSED] drm_test_bridge_rgb_yuv_rgb
[09:35:12] [PASSED] drm_test_bridge_must_convert_to_yuv444
[09:35:12] [PASSED] drm_test_bridge_hdmi_auto_rgb
[09:35:12] [PASSED] drm_test_bridge_auto_first
[09:35:12] [PASSED] drm_test_bridge_rgb_yuv_no_path
[09:35:12] =============== [PASSED] drm_bridge_bus_fmt ================
[09:35:12] ============= drm_cmdline_parser (40 subtests) =============
[09:35:12] [PASSED] drm_test_cmdline_force_d_only
[09:35:12] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:35:12] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:35:12] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:35:12] [PASSED] drm_test_cmdline_force_e_only
[09:35:12] [PASSED] drm_test_cmdline_res
[09:35:12] [PASSED] drm_test_cmdline_res_vesa
[09:35:12] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:35:12] [PASSED] drm_test_cmdline_res_rblank
[09:35:12] [PASSED] drm_test_cmdline_res_bpp
[09:35:12] [PASSED] drm_test_cmdline_res_refresh
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:35:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:35:12] [PASSED] drm_test_cmdline_res_margins_force_on
[09:35:12] [PASSED] drm_test_cmdline_res_vesa_margins
[09:35:12] [PASSED] drm_test_cmdline_name
[09:35:12] [PASSED] drm_test_cmdline_name_bpp
[09:35:12] [PASSED] drm_test_cmdline_name_option
[09:35:12] [PASSED] drm_test_cmdline_name_bpp_option
[09:35:12] [PASSED] drm_test_cmdline_rotate_0
[09:35:12] [PASSED] drm_test_cmdline_rotate_90
[09:35:12] [PASSED] drm_test_cmdline_rotate_180
[09:35:12] [PASSED] drm_test_cmdline_rotate_270
[09:35:12] [PASSED] drm_test_cmdline_hmirror
[09:35:12] [PASSED] drm_test_cmdline_vmirror
[09:35:12] [PASSED] drm_test_cmdline_margin_options
[09:35:12] [PASSED] drm_test_cmdline_multiple_options
[09:35:12] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:35:12] [PASSED] drm_test_cmdline_extra_and_option
[09:35:12] [PASSED] drm_test_cmdline_freestanding_options
[09:35:12] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:35:12] [PASSED] drm_test_cmdline_panel_orientation
[09:35:12] ================ drm_test_cmdline_invalid  =================
[09:35:12] [PASSED] margin_only
[09:35:12] [PASSED] interlace_only
[09:35:12] [PASSED] res_missing_x
[09:35:12] [PASSED] res_missing_y
[09:35:12] [PASSED] res_bad_y
[09:35:12] [PASSED] res_missing_y_bpp
[09:35:12] [PASSED] res_bad_bpp
[09:35:12] [PASSED] res_bad_refresh
[09:35:12] [PASSED] res_bpp_refresh_force_on_off
[09:35:12] [PASSED] res_invalid_mode
[09:35:12] [PASSED] res_bpp_wrong_place_mode
[09:35:12] [PASSED] name_bpp_refresh
[09:35:12] [PASSED] name_refresh
[09:35:12] [PASSED] name_refresh_wrong_mode
[09:35:12] [PASSED] name_refresh_invalid_mode
[09:35:12] [PASSED] rotate_multiple
[09:35:12] [PASSED] rotate_invalid_val
[09:35:12] [PASSED] rotate_truncated
[09:35:12] [PASSED] invalid_option
[09:35:12] [PASSED] invalid_tv_option
[09:35:12] [PASSED] truncated_tv_option
[09:35:12] ============ [PASSED] drm_test_cmdline_invalid =============
[09:35:12] =============== drm_test_cmdline_tv_options  ===============
[09:35:12] [PASSED] NTSC
[09:35:12] [PASSED] NTSC_443
[09:35:12] [PASSED] NTSC_J
[09:35:12] [PASSED] PAL
[09:35:12] [PASSED] PAL_M
[09:35:12] [PASSED] PAL_N
[09:35:12] [PASSED] SECAM
[09:35:12] [PASSED] MONO_525
[09:35:12] [PASSED] MONO_625
[09:35:12] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:35:12] =============== [PASSED] drm_cmdline_parser ================
[09:35:12] ========== drmm_connector_hdmi_init (20 subtests) ==========
[09:35:12] [PASSED] drm_test_connector_hdmi_init_valid
[09:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_8
[09:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_10
[09:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_12
[09:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[09:35:12] [PASSED] drm_test_connector_hdmi_init_bpc_null
[09:35:12] [PASSED] drm_test_connector_hdmi_init_formats_empty
[09:35:12] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[09:35:12] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[09:35:12] [PASSED] supported_formats=0x9 yuv420_allowed=1
[09:35:12] [PASSED] supported_formats=0x9 yuv420_allowed=0
[09:35:12] [PASSED] supported_formats=0x5 yuv420_allowed=1
[09:35:12] [PASSED] supported_formats=0x5 yuv420_allowed=0
[09:35:12] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[09:35:12] [PASSED] drm_test_connector_hdmi_init_null_ddc
[09:35:12] [PASSED] drm_test_connector_hdmi_init_null_product
[09:35:12] [PASSED] drm_test_connector_hdmi_init_null_vendor
[09:35:12] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[09:35:12] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[09:35:12] [PASSED] drm_test_connector_hdmi_init_product_valid
[09:35:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[09:35:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[09:35:12] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[09:35:12] ========= drm_test_connector_hdmi_init_type_valid  =========
[09:35:12] [PASSED] HDMI-A
[09:35:12] [PASSED] HDMI-B
[09:35:12] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[09:35:12] ======== drm_test_connector_hdmi_init_type_invalid  ========
[09:35:12] [PASSED] Unknown
[09:35:12] [PASSED] VGA
[09:35:12] [PASSED] DVI-I
[09:35:12] [PASSED] DVI-D
[09:35:12] [PASSED] DVI-A
[09:35:12] [PASSED] Composite
[09:35:12] [PASSED] SVIDEO
[09:35:12] [PASSED] LVDS
[09:35:12] [PASSED] Component
[09:35:12] [PASSED] DIN
[09:35:12] [PASSED] DP
[09:35:12] [PASSED] TV
[09:35:12] [PASSED] eDP
[09:35:12] [PASSED] Virtual
[09:35:12] [PASSED] DSI
[09:35:12] [PASSED] DPI
[09:35:12] [PASSED] Writeback
[09:35:12] [PASSED] SPI
[09:35:12] [PASSED] USB
[09:35:12] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[09:35:12] ============ [PASSED] drmm_connector_hdmi_init =============
[09:35:12] ============= drmm_connector_init (3 subtests) =============
[09:35:12] [PASSED] drm_test_drmm_connector_init
[09:35:12] [PASSED] drm_test_drmm_connector_init_null_ddc
[09:35:12] ========= drm_test_drmm_connector_init_type_valid  =========
[09:35:12] [PASSED] Unknown
[09:35:12] [PASSED] VGA
[09:35:12] [PASSED] DVI-I
[09:35:12] [PASSED] DVI-D
[09:35:12] [PASSED] DVI-A
[09:35:12] [PASSED] Composite
[09:35:12] [PASSED] SVIDEO
[09:35:12] [PASSED] LVDS
[09:35:12] [PASSED] Component
[09:35:12] [PASSED] DIN
[09:35:12] [PASSED] DP
[09:35:12] [PASSED] HDMI-A
[09:35:12] [PASSED] HDMI-B
[09:35:12] [PASSED] TV
[09:35:12] [PASSED] eDP
[09:35:12] [PASSED] Virtual
[09:35:12] [PASSED] DSI
[09:35:12] [PASSED] DPI
[09:35:12] [PASSED] Writeback
[09:35:12] [PASSED] SPI
[09:35:12] [PASSED] USB
[09:35:12] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[09:35:12] =============== [PASSED] drmm_connector_init ===============
[09:35:12] ========= drm_connector_dynamic_init (6 subtests) ==========
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_init
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_init_properties
[09:35:12] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[09:35:12] [PASSED] Unknown
[09:35:12] [PASSED] VGA
[09:35:12] [PASSED] DVI-I
[09:35:12] [PASSED] DVI-D
[09:35:12] [PASSED] DVI-A
[09:35:12] [PASSED] Composite
[09:35:12] [PASSED] SVIDEO
[09:35:12] [PASSED] LVDS
[09:35:12] [PASSED] Component
[09:35:12] [PASSED] DIN
[09:35:12] [PASSED] DP
[09:35:12] [PASSED] HDMI-A
[09:35:12] [PASSED] HDMI-B
[09:35:12] [PASSED] TV
[09:35:12] [PASSED] eDP
[09:35:12] [PASSED] Virtual
[09:35:12] [PASSED] DSI
[09:35:12] [PASSED] DPI
[09:35:12] [PASSED] Writeback
[09:35:12] [PASSED] SPI
[09:35:12] [PASSED] USB
[09:35:12] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[09:35:12] ======== drm_test_drm_connector_dynamic_init_name  =========
[09:35:12] [PASSED] Unknown
[09:35:12] [PASSED] VGA
[09:35:12] [PASSED] DVI-I
[09:35:12] [PASSED] DVI-D
[09:35:12] [PASSED] DVI-A
[09:35:12] [PASSED] Composite
[09:35:12] [PASSED] SVIDEO
[09:35:12] [PASSED] LVDS
[09:35:12] [PASSED] Component
[09:35:12] [PASSED] DIN
[09:35:12] [PASSED] DP
[09:35:12] [PASSED] HDMI-A
[09:35:12] [PASSED] HDMI-B
[09:35:12] [PASSED] TV
[09:35:12] [PASSED] eDP
[09:35:12] [PASSED] Virtual
[09:35:12] [PASSED] DSI
[09:35:12] [PASSED] DPI
[09:35:12] [PASSED] Writeback
[09:35:12] [PASSED] SPI
[09:35:12] [PASSED] USB
[09:35:12] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[09:35:12] =========== [PASSED] drm_connector_dynamic_init ============
[09:35:12] ==== drm_connector_dynamic_register_early (4 subtests) =====
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[09:35:12] ====== [PASSED] drm_connector_dynamic_register_early =======
[09:35:12] ======= drm_connector_dynamic_register (7 subtests) ========
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[09:35:12] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[09:35:12] ========= [PASSED] drm_connector_dynamic_register ==========
[09:35:12] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[09:35:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[09:35:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[09:35:12] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[09:35:12] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:35:12] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:35:12] [PASSED] NTSC
[09:35:12] [PASSED] NTSC-443
[09:35:12] [PASSED] NTSC-J
[09:35:12] [PASSED] PAL
[09:35:12] [PASSED] PAL-M
[09:35:12] [PASSED] PAL-N
[09:35:12] [PASSED] SECAM
[09:35:12] [PASSED] Mono
[09:35:12] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:35:12] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:35:12] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:35:12] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[09:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[09:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[09:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[09:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[09:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[09:35:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[09:35:12] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[09:35:12] [PASSED] VIC 96
[09:35:12] [PASSED] VIC 97
[09:35:12] [PASSED] VIC 101
[09:35:12] [PASSED] VIC 102
[09:35:12] [PASSED] VIC 106
[09:35:12] [PASSED] VIC 107
[09:35:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[09:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[09:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[09:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[09:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[09:35:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[09:35:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[09:35:12] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[09:35:12] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[09:35:12] [PASSED] Automatic
[09:35:12] [PASSED] Full
[09:35:12] [PASSED] Limited 16:235
[09:35:12] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[09:35:12] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[09:35:12] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[09:35:12] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[09:35:12] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[09:35:12] [PASSED] RGB
[09:35:12] [PASSED] YUV 4:2:0
[09:35:12] [PASSED] YUV 4:2:2
[09:35:12] [PASSED] YUV 4:4:4
[09:35:12] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[09:35:12] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[09:35:12] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[09:35:12] ============= drm_damage_helper (21 subtests) ==============
[09:35:12] [PASSED] drm_test_damage_iter_no_damage
[09:35:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:35:12] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:35:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:35:12] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:35:12] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:35:12] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:35:12] [PASSED] drm_test_damage_iter_simple_damage
[09:35:12] [PASSED] drm_test_damage_iter_single_damage
[09:35:12] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:35:12] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:35:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:35:12] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:35:12] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:35:12] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:35:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:35:12] [PASSED] drm_test_damage_iter_damage
[09:35:12] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:35:12] [PASSED] drm_test_damage_iter_damage_one_outside
[09:35:12] [PASSED] drm_test_damage_iter_damage_src_moved
[09:35:12] [PASSED] drm_test_damage_iter_damage_not_visible
[09:35:12] ================ [PASSED] drm_damage_helper ================
[09:35:12] ============== drm_dp_mst_helper (3 subtests) ==============
[09:35:12] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:35:12] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:35:12] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:35:12] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:35:12] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:35:12] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:35:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:35:12] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:35:12] [PASSED] Link rate 2000000 lane count 4
[09:35:12] [PASSED] Link rate 2000000 lane count 2
[09:35:12] [PASSED] Link rate 2000000 lane count 1
[09:35:12] [PASSED] Link rate 1350000 lane count 4
[09:35:12] [PASSED] Link rate 1350000 lane count 2
[09:35:12] [PASSED] Link rate 1350000 lane count 1
[09:35:12] [PASSED] Link rate 1000000 lane count 4
[09:35:12] [PASSED] Link rate 1000000 lane count 2
[09:35:12] [PASSED] Link rate 1000000 lane count 1
[09:35:12] [PASSED] Link rate 810000 lane count 4
[09:35:12] [PASSED] Link rate 810000 lane count 2
[09:35:12] [PASSED] Link rate 810000 lane count 1
[09:35:12] [PASSED] Link rate 540000 lane count 4
[09:35:12] [PASSED] Link rate 540000 lane count 2
[09:35:12] [PASSED] Link rate 540000 lane count 1
[09:35:12] [PASSED] Link rate 270000 lane count 4
[09:35:12] [PASSED] Link rate 270000 lane count 2
[09:35:12] [PASSED] Link rate 270000 lane count 1
[09:35:12] [PASSED] Link rate 162000 lane count 4
[09:35:12] [PASSED] Link rate 162000 lane count 2
[09:35:12] [PASSED] Link rate 162000 lane count 1
[09:35:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:35:12] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:35:12] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:35:12] [PASSED] DP_POWER_UP_PHY with port number
[09:35:12] [PASSED] DP_POWER_DOWN_PHY with port number
[09:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:35:12] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:35:12] [PASSED] DP_QUERY_PAYLOAD with port number
[09:35:12] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:35:12] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:35:12] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:35:12] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:35:12] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:35:12] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:35:12] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:35:12] [PASSED] DP_REMOTE_I2C_READ with port number
[09:35:12] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:35:12] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:35:12] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:35:12] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:35:12] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:35:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:35:12] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:35:12] ================ [PASSED] drm_dp_mst_helper ================
[09:35:12] ================== drm_exec (7 subtests) ===================
[09:35:12] [PASSED] sanitycheck
[09:35:12] [PASSED] test_lock
[09:35:12] [PASSED] test_lock_unlock
[09:35:12] [PASSED] test_duplicates
[09:35:12] [PASSED] test_prepare
[09:35:12] [PASSED] test_prepare_array
[09:35:12] [PASSED] test_multiple_loops
[09:35:12] ==================== [PASSED] drm_exec =====================
[09:35:12] =========== drm_format_helper_test (17 subtests) ===========
[09:35:12] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:35:12] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:35:12] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:35:12] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:35:12] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:35:12] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:35:12] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:35:12] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[09:35:12] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:35:12] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:35:12] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:35:12] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:35:12] ==================== drm_test_fb_swab  =====================
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ================ [PASSED] drm_test_fb_swab =================
[09:35:12] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:35:12] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:35:12] [PASSED] single_pixel_source_buffer
[09:35:12] [PASSED] single_pixel_clip_rectangle
[09:35:12] [PASSED] well_known_colors
[09:35:12] [PASSED] destination_pitch
[09:35:12] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:35:12] ================= drm_test_fb_clip_offset  =================
[09:35:12] [PASSED] pass through
[09:35:12] [PASSED] horizontal offset
[09:35:12] [PASSED] vertical offset
[09:35:12] [PASSED] horizontal and vertical offset
[09:35:12] [PASSED] horizontal offset (custom pitch)
[09:35:12] [PASSED] vertical offset (custom pitch)
[09:35:12] [PASSED] horizontal and vertical offset (custom pitch)
[09:35:12] ============= [PASSED] drm_test_fb_clip_offset =============
[09:35:12] =================== drm_test_fb_memcpy  ====================
[09:35:12] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:35:12] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:35:12] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:35:12] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:35:12] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:35:12] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:35:12] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:35:12] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:35:12] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:35:12] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:35:12] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:35:12] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:35:12] =============== [PASSED] drm_test_fb_memcpy ================
[09:35:12] ============= [PASSED] drm_format_helper_test ==============
[09:35:12] ================= drm_format (18 subtests) =================
[09:35:12] [PASSED] drm_test_format_block_width_invalid
[09:35:12] [PASSED] drm_test_format_block_width_one_plane
[09:35:12] [PASSED] drm_test_format_block_width_two_plane
[09:35:12] [PASSED] drm_test_format_block_width_three_plane
[09:35:12] [PASSED] drm_test_format_block_width_tiled
[09:35:12] [PASSED] drm_test_format_block_height_invalid
[09:35:12] [PASSED] drm_test_format_block_height_one_plane
[09:35:12] [PASSED] drm_test_format_block_height_two_plane
[09:35:12] [PASSED] drm_test_format_block_height_three_plane
[09:35:12] [PASSED] drm_test_format_block_height_tiled
[09:35:12] [PASSED] drm_test_format_min_pitch_invalid
[09:35:12] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:35:12] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:35:12] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:35:12] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:35:12] [PASSED] drm_test_format_min_pitch_two_plane
[09:35:12] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:35:12] [PASSED] drm_test_format_min_pitch_tiled
[09:35:12] =================== [PASSED] drm_format ====================
[09:35:12] ============== drm_framebuffer (10 subtests) ===============
[09:35:12] ========== drm_test_framebuffer_check_src_coords  ==========
[09:35:12] [PASSED] Success: source fits into fb
[09:35:12] [PASSED] Fail: overflowing fb with x-axis coordinate
[09:35:12] [PASSED] Fail: overflowing fb with y-axis coordinate
[09:35:12] [PASSED] Fail: overflowing fb with source width
[09:35:12] [PASSED] Fail: overflowing fb with source height
[09:35:12] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[09:35:12] [PASSED] drm_test_framebuffer_cleanup
[09:35:12] =============== drm_test_framebuffer_create  ===============
[09:35:12] [PASSED] ABGR8888 normal sizes
[09:35:12] [PASSED] ABGR8888 max sizes
[09:35:12] [PASSED] ABGR8888 pitch greater than min required
[09:35:12] [PASSED] ABGR8888 pitch less than min required
[09:35:12] [PASSED] ABGR8888 Invalid width
[09:35:12] [PASSED] ABGR8888 Invalid buffer handle
[09:35:12] [PASSED] No pixel format
[09:35:12] [PASSED] ABGR8888 Width 0
[09:35:12] [PASSED] ABGR8888 Height 0
[09:35:12] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:35:12] [PASSED] ABGR8888 Large buffer offset
[09:35:12] [PASSED] ABGR8888 Buffer offset for inexistent plane
[09:35:12] [PASSED] ABGR8888 Invalid flag
[09:35:12] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:35:12] [PASSED] ABGR8888 Valid buffer modifier
[09:35:12] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:35:12] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:35:12] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:35:12] [PASSED] NV12 Normal sizes
[09:35:12] [PASSED] NV12 Max sizes
[09:35:12] [PASSED] NV12 Invalid pitch
[09:35:12] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:35:12] [PASSED] NV12 different  modifier per-plane
[09:35:12] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:35:12] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:35:12] [PASSED] NV12 Modifier for inexistent plane
[09:35:12] [PASSED] NV12 Handle for inexistent plane
[09:35:12] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:35:12] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:35:12] [PASSED] YVU420 Normal sizes
[09:35:12] [PASSED] YVU420 Max sizes
[09:35:12] [PASSED] YVU420 Invalid pitch
[09:35:12] [PASSED] YVU420 Different pitches
[09:35:12] [PASSED] YVU420 Different buffer offsets/pitches
[09:35:12] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:35:12] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:35:12] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:35:12] [PASSED] YVU420 Valid modifier
[09:35:12] [PASSED] YVU420 Different modifiers per plane
[09:35:12] [PASSED] YVU420 Modifier for inexistent plane
[09:35:12] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[09:35:12] [PASSED] X0L2 Normal sizes
[09:35:12] [PASSED] X0L2 Max sizes
[09:35:12] [PASSED] X0L2 Invalid pitch
[09:35:12] [PASSED] X0L2 Pitch greater than minimum required
[09:35:12] [PASSED] X0L2 Handle for inexistent plane
[09:35:12] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:35:12] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:35:12] [PASSED] X0L2 Valid modifier
[09:35:12] [PASSED] X0L2 Modifier for inexistent plane
[09:35:12] =========== [PASSED] drm_test_framebuffer_create ===========
[09:35:12] [PASSED] drm_test_framebuffer_free
[09:35:12] [PASSED] drm_test_framebuffer_init
[09:35:12] [PASSED] drm_test_framebuffer_init_bad_format
[09:35:12] [PASSED] drm_test_framebuffer_init_dev_mismatch
[09:35:12] [PASSED] drm_test_framebuffer_lookup
[09:35:12] [PASSED] drm_test_framebuffer_lookup_inexistent
[09:35:12] [PASSED] drm_test_framebuffer_modifiers_not_supported
[09:35:12] ================= [PASSED] drm_framebuffer =================
[09:35:12] ================ drm_gem_shmem (8 subtests) ================
[09:35:12] [PASSED] drm_gem_shmem_test_obj_create
[09:35:12] [PASSED] drm_gem_shmem_test_obj_create_private
[09:35:12] [PASSED] drm_gem_shmem_test_pin_pages
[09:35:12] [PASSED] drm_gem_shmem_test_vmap
[09:35:12] [PASSED] drm_gem_shmem_test_get_sg_table
[09:35:12] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:35:12] [PASSED] drm_gem_shmem_test_madvise
[09:35:12] [PASSED] drm_gem_shmem_test_purge
[09:35:12] ================== [PASSED] drm_gem_shmem ==================
[09:35:12] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[09:35:12] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[09:35:12] [PASSED] Automatic
[09:35:12] [PASSED] Full
[09:35:12] [PASSED] Limited 16:235
[09:35:12] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[09:35:12] [PASSED] drm_test_check_disable_connector
[09:35:12] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[09:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[09:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[09:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[09:35:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[09:35:12] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[09:35:12] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[09:35:12] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[09:35:12] [PASSED] drm_test_check_output_bpc_dvi
[09:35:12] [PASSED] drm_test_check_output_bpc_format_vic_1
[09:35:12] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[09:35:12] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[09:35:12] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[09:35:12] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[09:35:12] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[09:35:12] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[09:35:12] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[09:35:12] ============ drm_test_check_hdmi_color_format  =============
[09:35:12] [PASSED] AUTO -> RGB
[09:35:12] [PASSED] YCBCR422 -> YUV422
[09:35:12] [PASSED] YCBCR420 -> YUV420
[09:35:12] [PASSED] YCBCR444 -> YUV444
[09:35:12] [PASSED] RGB -> RGB
[09:35:12] ======== [PASSED] drm_test_check_hdmi_color_format =========
[09:35:12] ======== drm_test_check_hdmi_color_format_420_only  ========
[09:35:12] [PASSED] RGB should fail
[09:35:12] [PASSED] YUV444 should fail
[09:35:12] [PASSED] YUV422 should fail
[09:35:12] [PASSED] YUV420 should work
[09:35:12] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[09:35:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[09:35:12] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[09:35:12] [PASSED] drm_test_check_broadcast_rgb_value
[09:35:12] [PASSED] drm_test_check_bpc_8_value
[09:35:12] [PASSED] drm_test_check_bpc_10_value
[09:35:12] [PASSED] drm_test_check_bpc_12_value
[09:35:12] [PASSED] drm_test_check_format_value
[09:35:12] [PASSED] drm_test_check_tmds_char_value
[09:35:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[09:35:12] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[09:35:12] [PASSED] drm_test_check_mode_valid
[09:35:12] [PASSED] drm_test_check_mode_valid_reject
[09:35:12] [PASSED] drm_test_check_mode_valid_reject_rate
[09:35:12] [PASSED] drm_test_check_mode_valid_reject_max_clock
[09:35:12] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[09:35:12] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[09:35:12] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[09:35:12] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[09:35:12] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[09:35:12] [PASSED] drm_test_check_infoframes
[09:35:12] [PASSED] drm_test_check_reject_avi_infoframe
[09:35:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[09:35:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[09:35:12] [PASSED] drm_test_check_reject_audio_infoframe
[09:35:12] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[09:35:12] ================= drm_managed (2 subtests) =================
[09:35:12] [PASSED] drm_test_managed_release_action
[09:35:12] [PASSED] drm_test_managed_run_action
[09:35:12] =================== [PASSED] drm_managed ===================
[09:35:12] =================== drm_mm (6 subtests) ====================
[09:35:12] [PASSED] drm_test_mm_init
[09:35:12] [PASSED] drm_test_mm_debug
[09:35:12] [PASSED] drm_test_mm_align32
[09:35:12] [PASSED] drm_test_mm_align64
[09:35:12] [PASSED] drm_test_mm_lowest
[09:35:12] [PASSED] drm_test_mm_highest
[09:35:12] ===================== [PASSED] drm_mm ======================
[09:35:12] ============= drm_modes_analog_tv (5 subtests) =============
[09:35:12] [PASSED] drm_test_modes_analog_tv_mono_576i
[09:35:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:35:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:35:12] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:35:12] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:35:12] =============== [PASSED] drm_modes_analog_tv ===============
[09:35:12] ============== drm_plane_helper (2 subtests) ===============
[09:35:12] =============== drm_test_check_plane_state  ================
[09:35:12] [PASSED] clipping_simple
[09:35:12] [PASSED] clipping_rotate_reflect
[09:35:12] [PASSED] positioning_simple
[09:35:12] [PASSED] upscaling
[09:35:12] [PASSED] downscaling
[09:35:12] [PASSED] rounding1
[09:35:12] [PASSED] rounding2
[09:35:12] [PASSED] rounding3
[09:35:12] [PASSED] rounding4
[09:35:12] =========== [PASSED] drm_test_check_plane_state ============
[09:35:12] =========== drm_test_check_invalid_plane_state  ============
[09:35:12] [PASSED] positioning_invalid
[09:35:12] [PASSED] upscaling_invalid
[09:35:12] [PASSED] downscaling_invalid
[09:35:12] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:35:12] ================ [PASSED] drm_plane_helper =================
[09:35:12] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:35:12] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:35:12] [PASSED] None
[09:35:12] [PASSED] PAL
[09:35:12] [PASSED] NTSC
[09:35:12] [PASSED] Both, NTSC Default
[09:35:12] [PASSED] Both, PAL Default
[09:35:12] [PASSED] Both, NTSC Default, with PAL on command-line
[09:35:12] [PASSED] Both, PAL Default, with NTSC on command-line
[09:35:12] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:35:12] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:35:12] ================== drm_rect (9 subtests) ===================
[09:35:12] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:35:12] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:35:12] [PASSED] drm_test_rect_clip_scaled_clipped
[09:35:12] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:35:12] ================= drm_test_rect_intersect  =================
[09:35:12] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:35:12] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:35:12] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:35:12] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:35:12] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:35:12] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:35:12] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:35:12] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:35:12] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:35:12] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:35:12] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:35:12] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:35:12] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:35:12] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:35:12] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:35:12] ============= [PASSED] drm_test_rect_intersect =============
[09:35:12] ================ drm_test_rect_calc_hscale  ================
[09:35:12] [PASSED] normal use
[09:35:12] [PASSED] out of max range
[09:35:12] [PASSED] out of min range
[09:35:12] [PASSED] zero dst
[09:35:12] [PASSED] negative src
[09:35:12] [PASSED] negative dst
[09:35:12] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:35:12] ================ drm_test_rect_calc_vscale  ================
[09:35:12] [PASSED] normal use
[09:35:12] [PASSED] out of max range
[09:35:12] [PASSED] out of min range
[09:35:12] [PASSED] zero dst
[09:35:12] [PASSED] negative src
[09:35:12] [PASSED] negative dst
[09:35:12] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:35:12] ================== drm_test_rect_rotate  ===================
[09:35:12] [PASSED] reflect-x
[09:35:12] [PASSED] reflect-y
[09:35:12] [PASSED] rotate-0
[09:35:12] [PASSED] rotate-90
[09:35:12] [PASSED] rotate-180
[09:35:12] [PASSED] rotate-270
[09:35:12] ============== [PASSED] drm_test_rect_rotate ===============
[09:35:12] ================ drm_test_rect_rotate_inv  =================
[09:35:12] [PASSED] reflect-x
[09:35:12] [PASSED] reflect-y
[09:35:12] [PASSED] rotate-0
[09:35:12] [PASSED] rotate-90
[09:35:12] [PASSED] rotate-180
[09:35:12] [PASSED] rotate-270
[09:35:12] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:35:12] ==================== [PASSED] drm_rect =====================
[09:35:12] ============ drm_sysfb_modeset_test (1 subtest) ============
[09:35:12] ============ drm_test_sysfb_build_fourcc_list  =============
[09:35:12] [PASSED] no native formats
[09:35:12] [PASSED] XRGB8888 as native format
[09:35:12] [PASSED] remove duplicates
[09:35:12] [PASSED] convert alpha formats
[09:35:12] [PASSED] random formats
[09:35:12] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[09:35:12] ============= [PASSED] drm_sysfb_modeset_test ==============
[09:35:12] ================== drm_fixp (2 subtests) ===================
[09:35:12] [PASSED] drm_test_int2fixp
[09:35:12] [PASSED] drm_test_sm2fixp
[09:35:12] ==================== [PASSED] drm_fixp =====================
[09:35:12] ============================================================
[09:35:12] Testing complete. Ran 637 tests: passed: 637
[09:35:12] Elapsed time: 26.748s total, 1.804s configuring, 24.776s building, 0.149s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[09:35:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:35:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:35:24] Starting KUnit Kernel (1/1)...
[09:35:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:35:24] ================= ttm_device (5 subtests) ==================
[09:35:24] [PASSED] ttm_device_init_basic
[09:35:24] [PASSED] ttm_device_init_multiple
[09:35:24] [PASSED] ttm_device_fini_basic
[09:35:24] [PASSED] ttm_device_init_no_vma_man
[09:35:24] ================== ttm_device_init_pools  ==================
[09:35:24] [PASSED] No DMA allocations, no DMA32 required
[09:35:24] [PASSED] DMA allocations, DMA32 required
[09:35:24] [PASSED] No DMA allocations, DMA32 required
[09:35:24] [PASSED] DMA allocations, no DMA32 required
[09:35:24] ============== [PASSED] ttm_device_init_pools ==============
[09:35:24] =================== [PASSED] ttm_device ====================
[09:35:24] ================== ttm_pool (8 subtests) ===================
[09:35:24] ================== ttm_pool_alloc_basic  ===================
[09:35:24] [PASSED] One page
[09:35:24] [PASSED] More than one page
[09:35:24] [PASSED] Above the allocation limit
[09:35:24] [PASSED] One page, with coherent DMA mappings enabled
[09:35:24] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:35:24] ============== [PASSED] ttm_pool_alloc_basic ===============
[09:35:24] ============== ttm_pool_alloc_basic_dma_addr  ==============
[09:35:24] [PASSED] One page
[09:35:24] [PASSED] More than one page
[09:35:24] [PASSED] Above the allocation limit
[09:35:24] [PASSED] One page, with coherent DMA mappings enabled
[09:35:24] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:35:24] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[09:35:24] [PASSED] ttm_pool_alloc_order_caching_match
[09:35:24] [PASSED] ttm_pool_alloc_caching_mismatch
[09:35:24] [PASSED] ttm_pool_alloc_order_mismatch
[09:35:24] [PASSED] ttm_pool_free_dma_alloc
[09:35:24] [PASSED] ttm_pool_free_no_dma_alloc
[09:35:24] [PASSED] ttm_pool_fini_basic
[09:35:24] ==================== [PASSED] ttm_pool =====================
[09:35:24] ================ ttm_resource (8 subtests) =================
[09:35:24] ================= ttm_resource_init_basic  =================
[09:35:24] [PASSED] Init resource in TTM_PL_SYSTEM
[09:35:24] [PASSED] Init resource in TTM_PL_VRAM
[09:35:24] [PASSED] Init resource in a private placement
[09:35:24] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[09:35:24] ============= [PASSED] ttm_resource_init_basic =============
[09:35:24] [PASSED] ttm_resource_init_pinned
[09:35:24] [PASSED] ttm_resource_fini_basic
[09:35:24] [PASSED] ttm_resource_manager_init_basic
[09:35:24] [PASSED] ttm_resource_manager_usage_basic
[09:35:24] [PASSED] ttm_resource_manager_set_used_basic
[09:35:24] [PASSED] ttm_sys_man_alloc_basic
[09:35:24] [PASSED] ttm_sys_man_free_basic
[09:35:24] ================== [PASSED] ttm_resource ===================
[09:35:24] =================== ttm_tt (15 subtests) ===================
[09:35:24] ==================== ttm_tt_init_basic  ====================
[09:35:24] [PASSED] Page-aligned size
[09:35:24] [PASSED] Extra pages requested
[09:35:24] ================ [PASSED] ttm_tt_init_basic ================
[09:35:24] [PASSED] ttm_tt_init_misaligned
[09:35:24] [PASSED] ttm_tt_fini_basic
[09:35:24] [PASSED] ttm_tt_fini_sg
[09:35:24] [PASSED] ttm_tt_fini_shmem
[09:35:24] [PASSED] ttm_tt_create_basic
[09:35:24] [PASSED] ttm_tt_create_invalid_bo_type
[09:35:24] [PASSED] ttm_tt_create_ttm_exists
[09:35:24] [PASSED] ttm_tt_create_failed
[09:35:24] [PASSED] ttm_tt_destroy_basic
[09:35:24] [PASSED] ttm_tt_populate_null_ttm
[09:35:24] [PASSED] ttm_tt_populate_populated_ttm
[09:35:24] [PASSED] ttm_tt_unpopulate_basic
[09:35:24] [PASSED] ttm_tt_unpopulate_empty_ttm
[09:35:24] [PASSED] ttm_tt_swapin_basic
[09:35:24] ===================== [PASSED] ttm_tt ======================
[09:35:24] =================== ttm_bo (14 subtests) ===================
[09:35:24] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[09:35:24] [PASSED] Cannot be interrupted and sleeps
[09:35:24] [PASSED] Cannot be interrupted, locks straight away
[09:35:24] [PASSED] Can be interrupted, sleeps
[09:35:24] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[09:35:24] [PASSED] ttm_bo_reserve_locked_no_sleep
[09:35:24] [PASSED] ttm_bo_reserve_no_wait_ticket
[09:35:24] [PASSED] ttm_bo_reserve_double_resv
[09:35:24] [PASSED] ttm_bo_reserve_interrupted
[09:35:24] [PASSED] ttm_bo_reserve_deadlock
[09:35:24] [PASSED] ttm_bo_unreserve_basic
[09:35:24] [PASSED] ttm_bo_unreserve_pinned
[09:35:24] [PASSED] ttm_bo_unreserve_bulk
[09:35:24] [PASSED] ttm_bo_fini_basic
[09:35:24] [PASSED] ttm_bo_fini_shared_resv
[09:35:24] [PASSED] ttm_bo_pin_basic
[09:35:24] [PASSED] ttm_bo_pin_unpin_resource
[09:35:24] [PASSED] ttm_bo_multiple_pin_one_unpin
[09:35:24] ===================== [PASSED] ttm_bo ======================
[09:35:24] ============== ttm_bo_validate (22 subtests) ===============
[09:35:24] ============== ttm_bo_init_reserved_sys_man  ===============
[09:35:24] [PASSED] Buffer object for userspace
[09:35:24] [PASSED] Kernel buffer object
[09:35:24] [PASSED] Shared buffer object
[09:35:24] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[09:35:24] ============== ttm_bo_init_reserved_mock_man  ==============
[09:35:24] [PASSED] Buffer object for userspace
[09:35:24] [PASSED] Kernel buffer object
[09:35:24] [PASSED] Shared buffer object
[09:35:24] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[09:35:24] [PASSED] ttm_bo_init_reserved_resv
[09:35:24] ================== ttm_bo_validate_basic  ==================
[09:35:24] [PASSED] Buffer object for userspace
[09:35:24] [PASSED] Kernel buffer object
[09:35:24] [PASSED] Shared buffer object
[09:35:24] ============== [PASSED] ttm_bo_validate_basic ==============
[09:35:24] [PASSED] ttm_bo_validate_invalid_placement
[09:35:24] ============= ttm_bo_validate_same_placement  ==============
[09:35:24] [PASSED] System manager
[09:35:24] [PASSED] VRAM manager
[09:35:24] ========= [PASSED] ttm_bo_validate_same_placement ==========
[09:35:24] [PASSED] ttm_bo_validate_failed_alloc
[09:35:24] [PASSED] ttm_bo_validate_pinned
[09:35:24] [PASSED] ttm_bo_validate_busy_placement
[09:35:24] ================ ttm_bo_validate_multihop  =================
[09:35:24] [PASSED] Buffer object for userspace
[09:35:24] [PASSED] Kernel buffer object
[09:35:24] [PASSED] Shared buffer object
[09:35:24] ============ [PASSED] ttm_bo_validate_multihop =============
[09:35:24] ========== ttm_bo_validate_no_placement_signaled  ==========
[09:35:24] [PASSED] Buffer object in system domain, no page vector
[09:35:24] [PASSED] Buffer object in system domain with an existing page vector
[09:35:24] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[09:35:24] ======== ttm_bo_validate_no_placement_not_signaled  ========
[09:35:24] [PASSED] Buffer object for userspace
[09:35:24] [PASSED] Kernel buffer object
[09:35:24] [PASSED] Shared buffer object
[09:35:24] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[09:35:24] [PASSED] ttm_bo_validate_move_fence_signaled
[09:35:24] ========= ttm_bo_validate_move_fence_not_signaled  =========
[09:35:24] [PASSED] Waits for GPU
[09:35:24] [PASSED] Tries to lock straight away
[09:35:24] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[09:35:24] [PASSED] ttm_bo_validate_swapout
[09:35:24] [PASSED] ttm_bo_validate_happy_evict
[09:35:24] [PASSED] ttm_bo_validate_all_pinned_evict
[09:35:24] [PASSED] ttm_bo_validate_allowed_only_evict
[09:35:24] [PASSED] ttm_bo_validate_deleted_evict
[09:35:24] [PASSED] ttm_bo_validate_busy_domain_evict
[09:35:24] [PASSED] ttm_bo_validate_evict_gutting
[09:35:24] [PASSED] ttm_bo_validate_recrusive_evict
[09:35:24] ================= [PASSED] ttm_bo_validate =================
[09:35:24] ============================================================
[09:35:24] Testing complete. Ran 102 tests: passed: 102
[09:35:24] Elapsed time: 11.722s total, 1.768s configuring, 9.689s building, 0.223s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


