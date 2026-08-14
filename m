Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8360DC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA7D10E56E;
	Fri, 14 Aug 2026 14:39:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C4710E56E;
 Fri, 14 Aug 2026 14:39:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/pci=5Ferror=3A_Allow_de?=
 =?utf-8?q?bugging_PCI_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 14:39:44 -0000
Message-ID: <178671838492.52536.12434023909262836908@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814143121.390791-1-raag.jadav@intel.com>
In-Reply-To: <20260814143121.390791-1-raag.jadav@intel.com>
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

Series: drm/xe/pci_error: Allow debugging PCI errors
URL   : https://patchwork.freedesktop.org/series/172226/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:38:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:38:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:38:45] Starting KUnit Kernel (1/1)...
[14:38:45] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:38:45] ================== guc_buf (11 subtests) ===================
[14:38:45] [PASSED] test_smallest
[14:38:45] [PASSED] test_largest
[14:38:45] [PASSED] test_granular
[14:38:45] [PASSED] test_unique
[14:38:45] [PASSED] test_overlap
[14:38:45] [PASSED] test_reusable
[14:38:45] [PASSED] test_too_big
[14:38:45] [PASSED] test_flush
[14:38:45] [PASSED] test_lookup
[14:38:45] [PASSED] test_data
[14:38:45] [PASSED] test_class
[14:38:45] ===================== [PASSED] guc_buf =====================
[14:38:45] =================== guc_dbm (7 subtests) ===================
[14:38:45] [PASSED] test_empty
[14:38:45] [PASSED] test_default
[14:38:45] ======================== test_size  ========================
[14:38:45] [PASSED] 4
[14:38:45] [PASSED] 8
[14:38:45] [PASSED] 32
[14:38:45] [PASSED] 256
[14:38:45] ==================== [PASSED] test_size ====================
[14:38:45] ======================= test_reuse  ========================
[14:38:45] [PASSED] 4
[14:38:45] [PASSED] 8
[14:38:45] [PASSED] 32
[14:38:45] [PASSED] 256
[14:38:45] =================== [PASSED] test_reuse ====================
[14:38:45] =================== test_range_overlap  ====================
[14:38:45] [PASSED] 4
[14:38:45] [PASSED] 8
[14:38:45] [PASSED] 32
[14:38:45] [PASSED] 256
[14:38:45] =============== [PASSED] test_range_overlap ================
[14:38:45] =================== test_range_compact  ====================
[14:38:45] [PASSED] 4
[14:38:45] [PASSED] 8
[14:38:45] [PASSED] 32
[14:38:45] [PASSED] 256
[14:38:45] =============== [PASSED] test_range_compact ================
[14:38:45] ==================== test_range_spare  =====================
[14:38:45] [PASSED] 4
[14:38:45] [PASSED] 8
[14:38:45] [PASSED] 32
[14:38:45] [PASSED] 256
[14:38:45] ================ [PASSED] test_range_spare =================
[14:38:45] ===================== [PASSED] guc_dbm =====================
[14:38:45] =================== guc_idm (6 subtests) ===================
[14:38:45] [PASSED] bad_init
[14:38:45] [PASSED] no_init
[14:38:45] [PASSED] init_fini
[14:38:45] [PASSED] check_used
[14:38:45] [PASSED] check_quota
[14:38:45] [PASSED] check_all
[14:38:45] ===================== [PASSED] guc_idm =====================
[14:38:45] =============== guc_klv_helpers (9 subtests) ===============
[14:38:45] [PASSED] test_count
[14:38:45] [PASSED] test_encode_u32
[14:38:45] [PASSED] test_encode_u64
[14:38:45] [PASSED] test_encode_string
[14:38:45] [PASSED] test_encode_object_raw
[14:38:45] [PASSED] test_encode_object_klv
[14:38:45] [PASSED] test_encode_object_nested
[14:38:45] [PASSED] test_encode_object_basic
[14:38:45] [PASSED] test_print
[14:38:45] ================= [PASSED] guc_klv_helpers =================
[14:38:45] ================== no_relay (3 subtests) ===================
[14:38:45] [PASSED] xe_drops_guc2pf_if_not_ready
[14:38:45] [PASSED] xe_drops_guc2vf_if_not_ready
[14:38:45] [PASSED] xe_rejects_send_if_not_ready
[14:38:45] ==================== [PASSED] no_relay =====================
[14:38:45] ================== pf_relay (14 subtests) ==================
[14:38:45] [PASSED] pf_rejects_guc2pf_too_short
[14:38:45] [PASSED] pf_rejects_guc2pf_too_long
[14:38:45] [PASSED] pf_rejects_guc2pf_no_payload
[14:38:45] [PASSED] pf_fails_no_payload
[14:38:45] [PASSED] pf_fails_bad_origin
[14:38:45] [PASSED] pf_fails_bad_type
[14:38:45] [PASSED] pf_txn_reports_error
[14:38:45] [PASSED] pf_txn_sends_pf2guc
[14:38:45] [PASSED] pf_sends_pf2guc
[14:38:45] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:38:45] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:38:45] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:38:45] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:38:45] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:38:45] ==================== [PASSED] pf_relay =====================
[14:38:45] ================== vf_relay (3 subtests) ===================
[14:38:45] [PASSED] vf_rejects_guc2vf_too_short
[14:38:45] [PASSED] vf_rejects_guc2vf_too_long
[14:38:45] [PASSED] vf_rejects_guc2vf_no_payload
[14:38:45] ==================== [PASSED] vf_relay =====================
[14:38:45] ================ pf_gt_config (9 subtests) =================
[14:38:45] [PASSED] fair_contexts_1vf
[14:38:45] [PASSED] fair_doorbells_1vf
[14:38:45] [PASSED] fair_ggtt_1vf
[14:38:45] ====================== fair_vram_1vf  ======================
[14:38:45] [PASSED] 3.50 GiB
[14:38:45] [PASSED] 11.5 GiB
[14:38:45] [PASSED] 15.5 GiB
[14:38:45] [PASSED] 31.5 GiB
[14:38:45] [PASSED] 63.5 GiB
[14:38:45] [PASSED] 1.91 GiB
[14:38:45] ================== [PASSED] fair_vram_1vf ==================
[14:38:45] ================ fair_vram_1vf_admin_only  =================
[14:38:45] [PASSED] 3.50 GiB
[14:38:45] [PASSED] 11.5 GiB
[14:38:45] [PASSED] 15.5 GiB
[14:38:45] [PASSED] 31.5 GiB
[14:38:45] [PASSED] 63.5 GiB
[14:38:45] [PASSED] 1.91 GiB
[14:38:45] ============ [PASSED] fair_vram_1vf_admin_only =============
[14:38:45] ====================== fair_contexts  ======================
[14:38:45] [PASSED] 1 VF
[14:38:45] [PASSED] 2 VFs
[14:38:45] [PASSED] 3 VFs
[14:38:45] [PASSED] 4 VFs
[14:38:45] [PASSED] 5 VFs
[14:38:45] [PASSED] 6 VFs
[14:38:45] [PASSED] 7 VFs
[14:38:45] [PASSED] 8 VFs
[14:38:45] [PASSED] 9 VFs
[14:38:45] [PASSED] 10 VFs
[14:38:45] [PASSED] 11 VFs
[14:38:45] [PASSED] 12 VFs
[14:38:45] [PASSED] 13 VFs
[14:38:45] [PASSED] 14 VFs
[14:38:45] [PASSED] 15 VFs
[14:38:45] [PASSED] 16 VFs
[14:38:45] [PASSED] 17 VFs
[14:38:45] [PASSED] 18 VFs
[14:38:45] [PASSED] 19 VFs
[14:38:45] [PASSED] 20 VFs
[14:38:45] [PASSED] 21 VFs
[14:38:45] [PASSED] 22 VFs
[14:38:45] [PASSED] 23 VFs
[14:38:45] [PASSED] 24 VFs
[14:38:45] [PASSED] 25 VFs
[14:38:45] [PASSED] 26 VFs
[14:38:45] [PASSED] 27 VFs
[14:38:45] [PASSED] 28 VFs
[14:38:45] [PASSED] 29 VFs
[14:38:45] [PASSED] 30 VFs
[14:38:45] [PASSED] 31 VFs
[14:38:45] [PASSED] 32 VFs
[14:38:45] [PASSED] 33 VFs
[14:38:45] [PASSED] 34 VFs
[14:38:45] [PASSED] 35 VFs
[14:38:45] [PASSED] 36 VFs
[14:38:45] [PASSED] 37 VFs
[14:38:45] [PASSED] 38 VFs
[14:38:45] [PASSED] 39 VFs
[14:38:45] [PASSED] 40 VFs
[14:38:45] [PASSED] 41 VFs
[14:38:45] [PASSED] 42 VFs
[14:38:45] [PASSED] 43 VFs
[14:38:45] [PASSED] 44 VFs
[14:38:45] [PASSED] 45 VFs
[14:38:45] [PASSED] 46 VFs
[14:38:45] [PASSED] 47 VFs
[14:38:45] [PASSED] 48 VFs
[14:38:45] [PASSED] 49 VFs
[14:38:45] [PASSED] 50 VFs
[14:38:45] [PASSED] 51 VFs
[14:38:45] [PASSED] 52 VFs
[14:38:45] [PASSED] 53 VFs
[14:38:45] [PASSED] 54 VFs
[14:38:45] [PASSED] 55 VFs
[14:38:45] [PASSED] 56 VFs
[14:38:45] [PASSED] 57 VFs
[14:38:45] [PASSED] 58 VFs
[14:38:45] [PASSED] 59 VFs
[14:38:45] [PASSED] 60 VFs
[14:38:45] [PASSED] 61 VFs
[14:38:45] [PASSED] 62 VFs
[14:38:45] [PASSED] 63 VFs
[14:38:45] ================== [PASSED] fair_contexts ==================
[14:38:45] ===================== fair_doorbells  ======================
[14:38:45] [PASSED] 1 VF
[14:38:45] [PASSED] 2 VFs
[14:38:45] [PASSED] 3 VFs
[14:38:45] [PASSED] 4 VFs
[14:38:45] [PASSED] 5 VFs
[14:38:45] [PASSED] 6 VFs
[14:38:45] [PASSED] 7 VFs
[14:38:45] [PASSED] 8 VFs
[14:38:45] [PASSED] 9 VFs
[14:38:45] [PASSED] 10 VFs
[14:38:45] [PASSED] 11 VFs
[14:38:45] [PASSED] 12 VFs
[14:38:45] [PASSED] 13 VFs
[14:38:45] [PASSED] 14 VFs
[14:38:45] [PASSED] 15 VFs
[14:38:45] [PASSED] 16 VFs
[14:38:45] [PASSED] 17 VFs
[14:38:45] [PASSED] 18 VFs
[14:38:45] [PASSED] 19 VFs
[14:38:45] [PASSED] 20 VFs
[14:38:45] [PASSED] 21 VFs
[14:38:45] [PASSED] 22 VFs
[14:38:45] [PASSED] 23 VFs
[14:38:45] [PASSED] 24 VFs
[14:38:45] [PASSED] 25 VFs
[14:38:45] [PASSED] 26 VFs
[14:38:45] [PASSED] 27 VFs
[14:38:45] [PASSED] 28 VFs
[14:38:45] [PASSED] 29 VFs
[14:38:45] [PASSED] 30 VFs
[14:38:45] [PASSED] 31 VFs
[14:38:45] [PASSED] 32 VFs
[14:38:45] [PASSED] 33 VFs
[14:38:45] [PASSED] 34 VFs
[14:38:45] [PASSED] 35 VFs
[14:38:45] [PASSED] 36 VFs
[14:38:45] [PASSED] 37 VFs
[14:38:45] [PASSED] 38 VFs
[14:38:45] [PASSED] 39 VFs
[14:38:45] [PASSED] 40 VFs
[14:38:45] [PASSED] 41 VFs
[14:38:45] [PASSED] 42 VFs
[14:38:45] [PASSED] 43 VFs
[14:38:45] [PASSED] 44 VFs
[14:38:45] [PASSED] 45 VFs
[14:38:45] [PASSED] 46 VFs
[14:38:45] [PASSED] 47 VFs
[14:38:45] [PASSED] 48 VFs
[14:38:45] [PASSED] 49 VFs
[14:38:45] [PASSED] 50 VFs
[14:38:45] [PASSED] 51 VFs
[14:38:45] [PASSED] 52 VFs
[14:38:45] [PASSED] 53 VFs
[14:38:45] [PASSED] 54 VFs
[14:38:45] [PASSED] 55 VFs
[14:38:45] [PASSED] 56 VFs
[14:38:45] [PASSED] 57 VFs
[14:38:45] [PASSED] 58 VFs
[14:38:45] [PASSED] 59 VFs
[14:38:45] [PASSED] 60 VFs
[14:38:45] [PASSED] 61 VFs
[14:38:45] [PASSED] 62 VFs
[14:38:45] [PASSED] 63 VFs
[14:38:45] ================= [PASSED] fair_doorbells ==================
[14:38:45] ======================== fair_ggtt  ========================
[14:38:45] [PASSED] 1 VF
[14:38:45] [PASSED] 2 VFs
[14:38:45] [PASSED] 3 VFs
[14:38:45] [PASSED] 4 VFs
[14:38:45] [PASSED] 5 VFs
[14:38:45] [PASSED] 6 VFs
[14:38:45] [PASSED] 7 VFs
[14:38:45] [PASSED] 8 VFs
[14:38:45] [PASSED] 9 VFs
[14:38:45] [PASSED] 10 VFs
[14:38:45] [PASSED] 11 VFs
[14:38:45] [PASSED] 12 VFs
[14:38:45] [PASSED] 13 VFs
[14:38:45] [PASSED] 14 VFs
[14:38:45] [PASSED] 15 VFs
[14:38:45] [PASSED] 16 VFs
[14:38:45] [PASSED] 17 VFs
[14:38:45] [PASSED] 18 VFs
[14:38:45] [PASSED] 19 VFs
[14:38:45] [PASSED] 20 VFs
[14:38:45] [PASSED] 21 VFs
[14:38:45] [PASSED] 22 VFs
[14:38:45] [PASSED] 23 VFs
[14:38:45] [PASSED] 24 VFs
[14:38:45] [PASSED] 25 VFs
[14:38:45] [PASSED] 26 VFs
[14:38:45] [PASSED] 27 VFs
[14:38:45] [PASSED] 28 VFs
[14:38:45] [PASSED] 29 VFs
[14:38:45] [PASSED] 30 VFs
[14:38:45] [PASSED] 31 VFs
[14:38:45] [PASSED] 32 VFs
[14:38:45] [PASSED] 33 VFs
[14:38:45] [PASSED] 34 VFs
[14:38:45] [PASSED] 35 VFs
[14:38:45] [PASSED] 36 VFs
[14:38:45] [PASSED] 37 VFs
[14:38:45] [PASSED] 38 VFs
[14:38:45] [PASSED] 39 VFs
[14:38:45] [PASSED] 40 VFs
[14:38:45] [PASSED] 41 VFs
[14:38:45] [PASSED] 42 VFs
[14:38:45] [PASSED] 43 VFs
[14:38:45] [PASSED] 44 VFs
[14:38:45] [PASSED] 45 VFs
[14:38:45] [PASSED] 46 VFs
[14:38:45] [PASSED] 47 VFs
[14:38:45] [PASSED] 48 VFs
[14:38:45] [PASSED] 49 VFs
[14:38:45] [PASSED] 50 VFs
[14:38:45] [PASSED] 51 VFs
[14:38:45] [PASSED] 52 VFs
[14:38:45] [PASSED] 53 VFs
[14:38:45] [PASSED] 54 VFs
[14:38:45] [PASSED] 55 VFs
[14:38:45] [PASSED] 56 VFs
[14:38:45] [PASSED] 57 VFs
[14:38:45] [PASSED] 58 VFs
[14:38:45] [PASSED] 59 VFs
[14:38:45] [PASSED] 60 VFs
[14:38:45] [PASSED] 61 VFs
[14:38:45] [PASSED] 62 VFs
[14:38:45] [PASSED] 63 VFs
[14:38:45] ==================== [PASSED] fair_ggtt ====================
[14:38:45] ======================== fair_vram  ========================
[14:38:45] [PASSED] 1 VF
[14:38:45] [PASSED] 2 VFs
[14:38:45] [PASSED] 3 VFs
[14:38:45] [PASSED] 4 VFs
[14:38:45] [PASSED] 5 VFs
[14:38:45] [PASSED] 6 VFs
[14:38:45] [PASSED] 7 VFs
[14:38:45] [PASSED] 8 VFs
[14:38:45] [PASSED] 9 VFs
[14:38:45] [PASSED] 10 VFs
[14:38:45] [PASSED] 11 VFs
[14:38:45] [PASSED] 12 VFs
[14:38:45] [PASSED] 13 VFs
[14:38:45] [PASSED] 14 VFs
[14:38:45] [PASSED] 15 VFs
[14:38:45] [PASSED] 16 VFs
[14:38:45] [PASSED] 17 VFs
[14:38:45] [PASSED] 18 VFs
[14:38:45] [PASSED] 19 VFs
[14:38:45] [PASSED] 20 VFs
[14:38:45] [PASSED] 21 VFs
[14:38:45] [PASSED] 22 VFs
[14:38:45] [PASSED] 23 VFs
[14:38:45] [PASSED] 24 VFs
[14:38:45] [PASSED] 25 VFs
[14:38:45] [PASSED] 26 VFs
[14:38:45] [PASSED] 27 VFs
[14:38:45] [PASSED] 28 VFs
[14:38:45] [PASSED] 29 VFs
[14:38:45] [PASSED] 30 VFs
[14:38:45] [PASSED] 31 VFs
[14:38:45] [PASSED] 32 VFs
[14:38:45] [PASSED] 33 VFs
[14:38:45] [PASSED] 34 VFs
[14:38:45] [PASSED] 35 VFs
[14:38:45] [PASSED] 36 VFs
[14:38:45] [PASSED] 37 VFs
[14:38:45] [PASSED] 38 VFs
[14:38:45] [PASSED] 39 VFs
[14:38:45] [PASSED] 40 VFs
[14:38:45] [PASSED] 41 VFs
[14:38:45] [PASSED] 42 VFs
[14:38:45] [PASSED] 43 VFs
[14:38:45] [PASSED] 44 VFs
[14:38:45] [PASSED] 45 VFs
[14:38:45] [PASSED] 46 VFs
[14:38:45] [PASSED] 47 VFs
[14:38:45] [PASSED] 48 VFs
[14:38:45] [PASSED] 49 VFs
[14:38:45] [PASSED] 50 VFs
[14:38:45] [PASSED] 51 VFs
[14:38:45] [PASSED] 52 VFs
[14:38:45] [PASSED] 53 VFs
[14:38:45] [PASSED] 54 VFs
[14:38:45] [PASSED] 55 VFs
[14:38:45] [PASSED] 56 VFs
[14:38:45] [PASSED] 57 VFs
[14:38:45] [PASSED] 58 VFs
[14:38:45] [PASSED] 59 VFs
[14:38:45] [PASSED] 60 VFs
[14:38:45] [PASSED] 61 VFs
[14:38:45] [PASSED] 62 VFs
[14:38:45] [PASSED] 63 VFs
[14:38:45] ==================== [PASSED] fair_vram ====================
[14:38:45] ================== [PASSED] pf_gt_config ===================
[14:38:45] ===================== lmtt (1 subtest) =====================
[14:38:45] ======================== test_ops  =========================
[14:38:45] [PASSED] 2-level
[14:38:45] [PASSED] multi-level
[14:38:45] ==================== [PASSED] test_ops =====================
[14:38:45] ====================== [PASSED] lmtt =======================
[14:38:45] ================= sriov_packet (1 subtest) =================
[14:38:45] [PASSED] test_descriptor_init
[14:38:45] ================== [PASSED] sriov_packet ===================
[14:38:45] ================= pf_service (11 subtests) =================
[14:38:45] [PASSED] pf_negotiate_any
[14:38:45] [PASSED] pf_negotiate_base_match
[14:38:45] [PASSED] pf_negotiate_base_newer
[14:38:45] [PASSED] pf_negotiate_base_next
[14:38:45] [SKIPPED] pf_negotiate_base_older (no older minor)
[14:38:45] [PASSED] pf_negotiate_base_prev
[14:38:45] [PASSED] pf_negotiate_latest_match
[14:38:45] [PASSED] pf_negotiate_latest_newer
[14:38:45] [PASSED] pf_negotiate_latest_next
[14:38:45] [SKIPPED] pf_negotiate_latest_older (no older minor)
[14:38:45] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[14:38:45] =================== [PASSED] pf_service ====================
[14:38:45] ================= xe_guc_g2g (2 subtests) ==================
[14:38:45] ============== xe_live_guc_g2g_kunit_default  ==============
[14:38:45] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[14:38:45] ============== xe_live_guc_g2g_kunit_allmem  ===============
[14:38:45] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[14:38:45] =================== [SKIPPED] xe_guc_g2g ===================
[14:38:45] =================== xe_mocs (2 subtests) ===================
[14:38:45] ================ xe_live_mocs_kernel_kunit  ================
[14:38:45] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[14:38:45] ================ xe_live_mocs_reset_kunit  =================
[14:38:45] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[14:38:45] ==================== [SKIPPED] xe_mocs =====================
[14:38:45] ================= xe_migrate (2 subtests) ==================
[14:38:45] ================= xe_migrate_sanity_kunit  =================
[14:38:45] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[14:38:45] ================== xe_validate_ccs_kunit  ==================
[14:38:45] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[14:38:45] =================== [SKIPPED] xe_migrate ===================
[14:38:45] ================== xe_dma_buf (1 subtest) ==================
[14:38:45] ==================== xe_dma_buf_kunit  =====================
[14:38:45] ================ [SKIPPED] xe_dma_buf_kunit ================
[14:38:45] =================== [SKIPPED] xe_dma_buf ===================
[14:38:45] ================= xe_bo_shrink (1 subtest) =================
[14:38:45] =================== xe_bo_shrink_kunit  ====================
[14:38:45] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[14:38:45] ================== [SKIPPED] xe_bo_shrink ==================
[14:38:45] ==================== xe_bo (2 subtests) ====================
[14:38:45] ================== xe_ccs_migrate_kunit  ===================
[14:38:45] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[14:38:45] ==================== xe_bo_evict_kunit  ====================
[14:38:45] =============== [SKIPPED] xe_bo_evict_kunit ================
[14:38:45] ===================== [SKIPPED] xe_bo ======================
[14:38:45] ==================== args (13 subtests) ====================
[14:38:45] [PASSED] count_args_test
[14:38:45] [PASSED] call_args_example
[14:38:45] [PASSED] call_args_test
[14:38:45] [PASSED] drop_first_arg_example
[14:38:45] [PASSED] drop_first_arg_test
[14:38:45] [PASSED] first_arg_example
[14:38:45] [PASSED] first_arg_test
[14:38:45] [PASSED] last_arg_example
[14:38:45] [PASSED] last_arg_test
[14:38:45] [PASSED] pick_arg_example
[14:38:45] [PASSED] if_args_example
[14:38:45] [PASSED] if_args_test
[14:38:45] [PASSED] sep_comma_example
[14:38:45] ====================== [PASSED] args =======================
[14:38:45] =================== xe_pci (3 subtests) ====================
[14:38:45] ==================== check_graphics_ip  ====================
[14:38:45] [PASSED] 12.00 Xe_LP
[14:38:45] [PASSED] 12.10 Xe_LP+
[14:38:45] [PASSED] 12.55 Xe_HPG
[14:38:45] [PASSED] 12.60 Xe_HPC
[14:38:45] [PASSED] 12.70 Xe_LPG
[14:38:45] [PASSED] 12.71 Xe_LPG
[14:38:45] [PASSED] 12.74 Xe_LPG+
[14:38:45] [PASSED] 20.01 Xe2_HPG
[14:38:45] [PASSED] 20.02 Xe2_HPG
[14:38:45] [PASSED] 20.04 Xe2_LPG
[14:38:45] [PASSED] 30.00 Xe3_LPG
[14:38:45] [PASSED] 30.01 Xe3_LPG
[14:38:45] [PASSED] 30.03 Xe3_LPG
[14:38:45] [PASSED] 30.04 Xe3_LPG
[14:38:45] [PASSED] 30.05 Xe3_LPG
[14:38:45] [PASSED] 35.10 Xe3p_LPG
[14:38:45] [PASSED] 35.11 Xe3p_XPC
[14:38:45] ================ [PASSED] check_graphics_ip ================
[14:38:45] ===================== check_media_ip  ======================
[14:38:45] [PASSED] 12.00 Xe_M
[14:38:45] [PASSED] 12.55 Xe_HPM
[14:38:45] [PASSED] 13.00 Xe_LPM+
[14:38:45] [PASSED] 13.01 Xe2_HPM
[14:38:45] [PASSED] 20.00 Xe2_LPM
[14:38:45] [PASSED] 30.00 Xe3_LPM
[14:38:45] [PASSED] 30.02 Xe3_LPM
[14:38:45] [PASSED] 35.00 Xe3p_LPM
[14:38:45] [PASSED] 35.03 Xe3p_HPM
[14:38:45] ================= [PASSED] check_media_ip ==================
[14:38:45] =================== check_platform_desc  ===================
[14:38:45] [PASSED] 0x9A60 (TIGERLAKE)
[14:38:45] [PASSED] 0x9A68 (TIGERLAKE)
[14:38:45] [PASSED] 0x9A70 (TIGERLAKE)
[14:38:45] [PASSED] 0x9A40 (TIGERLAKE)
[14:38:45] [PASSED] 0x9A49 (TIGERLAKE)
[14:38:45] [PASSED] 0x9A59 (TIGERLAKE)
[14:38:45] [PASSED] 0x9A78 (TIGERLAKE)
[14:38:45] [PASSED] 0x9AC0 (TIGERLAKE)
[14:38:45] [PASSED] 0x9AC9 (TIGERLAKE)
[14:38:45] [PASSED] 0x9AD9 (TIGERLAKE)
[14:38:45] [PASSED] 0x9AF8 (TIGERLAKE)
[14:38:45] [PASSED] 0x4C80 (ROCKETLAKE)
[14:38:45] [PASSED] 0x4C8A (ROCKETLAKE)
[14:38:45] [PASSED] 0x4C8B (ROCKETLAKE)
[14:38:45] [PASSED] 0x4C8C (ROCKETLAKE)
[14:38:45] [PASSED] 0x4C90 (ROCKETLAKE)
[14:38:45] [PASSED] 0x4C9A (ROCKETLAKE)
[14:38:45] [PASSED] 0x4680 (ALDERLAKE_S)
[14:38:45] [PASSED] 0x4682 (ALDERLAKE_S)
[14:38:45] [PASSED] 0x4688 (ALDERLAKE_S)
[14:38:45] [PASSED] 0x468A (ALDERLAKE_S)
[14:38:45] [PASSED] 0x468B (ALDERLAKE_S)
[14:38:45] [PASSED] 0x4690 (ALDERLAKE_S)
[14:38:45] [PASSED] 0x4692 (ALDERLAKE_S)
[14:38:45] [PASSED] 0x4693 (ALDERLAKE_S)
[14:38:45] [PASSED] 0x46A0 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46A1 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46A2 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46A3 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46A6 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46A8 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46AA (ALDERLAKE_P)
[14:38:45] [PASSED] 0x462A (ALDERLAKE_P)
[14:38:45] [PASSED] 0x4626 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x4628 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46B0 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46B1 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46B2 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46B3 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46C0 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46C1 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46C2 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46C3 (ALDERLAKE_P)
[14:38:45] [PASSED] 0x46D0 (ALDERLAKE_N)
[14:38:45] [PASSED] 0x46D1 (ALDERLAKE_N)
[14:38:45] [PASSED] 0x46D2 (ALDERLAKE_N)
[14:38:45] [PASSED] 0x46D3 (ALDERLAKE_N)
[14:38:45] [PASSED] 0x46D4 (ALDERLAKE_N)
[14:38:45] [PASSED] 0xA721 (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7A1 (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7A9 (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7AC (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7AD (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA720 (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7A0 (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7A8 (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7AA (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA7AB (ALDERLAKE_P)
[14:38:45] [PASSED] 0xA780 (ALDERLAKE_S)
[14:38:45] [PASSED] 0xA781 (ALDERLAKE_S)
[14:38:45] [PASSED] 0xA782 (ALDERLAKE_S)
[14:38:45] [PASSED] 0xA783 (ALDERLAKE_S)
[14:38:45] [PASSED] 0xA788 (ALDERLAKE_S)
[14:38:45] [PASSED] 0xA789 (ALDERLAKE_S)
[14:38:45] [PASSED] 0xA78A (ALDERLAKE_S)
[14:38:45] [PASSED] 0xA78B (ALDERLAKE_S)
[14:38:45] [PASSED] 0x4905 (DG1)
[14:38:45] [PASSED] 0x4906 (DG1)
[14:38:45] [PASSED] 0x4907 (DG1)
[14:38:45] [PASSED] 0x4908 (DG1)
[14:38:45] [PASSED] 0x4909 (DG1)
[14:38:45] [PASSED] 0x56C0 (DG2)
[14:38:45] [PASSED] 0x56C2 (DG2)
[14:38:45] [PASSED] 0x56C1 (DG2)
[14:38:45] [PASSED] 0x7D51 (METEORLAKE)
[14:38:45] [PASSED] 0x7DD1 (METEORLAKE)
[14:38:45] [PASSED] 0x7D41 (METEORLAKE)
[14:38:45] [PASSED] 0x7D67 (METEORLAKE)
[14:38:45] [PASSED] 0xB640 (METEORLAKE)
[14:38:45] [PASSED] 0x56A0 (DG2)
[14:38:45] [PASSED] 0x56A1 (DG2)
[14:38:45] [PASSED] 0x56A2 (DG2)
[14:38:45] [PASSED] 0x56BE (DG2)
[14:38:45] [PASSED] 0x56BF (DG2)
[14:38:45] [PASSED] 0x5690 (DG2)
[14:38:45] [PASSED] 0x5691 (DG2)
[14:38:45] [PASSED] 0x5692 (DG2)
[14:38:45] [PASSED] 0x56A5 (DG2)
[14:38:45] [PASSED] 0x56A6 (DG2)
[14:38:45] [PASSED] 0x56B0 (DG2)
[14:38:45] [PASSED] 0x56B1 (DG2)
[14:38:45] [PASSED] 0x56BA (DG2)
[14:38:45] [PASSED] 0x56BB (DG2)
[14:38:45] [PASSED] 0x56BC (DG2)
[14:38:45] [PASSED] 0x56BD (DG2)
[14:38:45] [PASSED] 0x5693 (DG2)
[14:38:45] [PASSED] 0x5694 (DG2)
[14:38:45] [PASSED] 0x5695 (DG2)
[14:38:45] [PASSED] 0x56A3 (DG2)
[14:38:45] [PASSED] 0x56A4 (DG2)
[14:38:45] [PASSED] 0x56B2 (DG2)
[14:38:45] [PASSED] 0x56B3 (DG2)
[14:38:45] [PASSED] 0x5696 (DG2)
[14:38:45] [PASSED] 0x5697 (DG2)
[14:38:45] [PASSED] 0xB69 (PVC)
[14:38:45] [PASSED] 0xB6E (PVC)
[14:38:45] [PASSED] 0xBD4 (PVC)
[14:38:45] [PASSED] 0xBD5 (PVC)
[14:38:45] [PASSED] 0xBD6 (PVC)
[14:38:45] [PASSED] 0xBD7 (PVC)
[14:38:45] [PASSED] 0xBD8 (PVC)
[14:38:45] [PASSED] 0xBD9 (PVC)
[14:38:45] [PASSED] 0xBDA (PVC)
[14:38:45] [PASSED] 0xBDB (PVC)
[14:38:45] [PASSED] 0xBE0 (PVC)
[14:38:45] [PASSED] 0xBE1 (PVC)
[14:38:45] [PASSED] 0xBE5 (PVC)
[14:38:45] [PASSED] 0x7D40 (METEORLAKE)
[14:38:45] [PASSED] 0x7D45 (METEORLAKE)
[14:38:45] [PASSED] 0x7D55 (METEORLAKE)
[14:38:45] [PASSED] 0x7D60 (METEORLAKE)
[14:38:45] [PASSED] 0x7DD5 (METEORLAKE)
[14:38:45] [PASSED] 0x6420 (LUNARLAKE)
[14:38:45] [PASSED] 0x64A0 (LUNARLAKE)
[14:38:45] [PASSED] 0x64B0 (LUNARLAKE)
[14:38:45] [PASSED] 0xE202 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE209 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE20B (BATTLEMAGE)
[14:38:45] [PASSED] 0xE20C (BATTLEMAGE)
[14:38:45] [PASSED] 0xE20D (BATTLEMAGE)
[14:38:45] [PASSED] 0xE210 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE211 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE212 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE216 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE220 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE221 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE222 (BATTLEMAGE)
[14:38:45] [PASSED] 0xE223 (BATTLEMAGE)
[14:38:45] [PASSED] 0xB080 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB081 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB082 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB083 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB084 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB085 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB086 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB087 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB08F (PANTHERLAKE)
[14:38:45] [PASSED] 0xB090 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB0A0 (PANTHERLAKE)
[14:38:45] [PASSED] 0xB0B0 (PANTHERLAKE)
[14:38:45] [PASSED] 0xFD80 (PANTHERLAKE)
[14:38:45] [PASSED] 0xFD81 (PANTHERLAKE)
[14:38:45] [PASSED] 0xD740 (NOVALAKE_S)
[14:38:45] [PASSED] 0xD741 (NOVALAKE_S)
[14:38:45] [PASSED] 0xD742 (NOVALAKE_S)
[14:38:45] [PASSED] 0xD743 (NOVALAKE_S)
[14:38:45] [PASSED] 0xD745 (NOVALAKE_S)
[14:38:45] [PASSED] 0xD74A (NOVALAKE_S)
[14:38:45] [PASSED] 0xD74B (NOVALAKE_S)
[14:38:45] [PASSED] 0x674C (CRESCENTISLAND)
[14:38:45] [PASSED] 0x674D (CRESCENTISLAND)
[14:38:45] [PASSED] 0x674E (CRESCENTISLAND)
[14:38:45] [PASSED] 0x674F (CRESCENTISLAND)
[14:38:45] [PASSED] 0x6750 (CRESCENTISLAND)
[14:38:45] [PASSED] 0xD750 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD751 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD752 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD753 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD754 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD755 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD756 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD757 (NOVALAKE_P)
[14:38:45] [PASSED] 0xD75F (NOVALAKE_P)
[14:38:45] =============== [PASSED] check_platform_desc ===============
[14:38:45] ===================== [PASSED] xe_pci ======================
[14:38:45] ============= xe_rtp_tables_test (5 subtests) ==============
[14:38:45] ================== xe_rtp_table_gt_test  ===================
[14:38:45] [PASSED] gt_was/14011060649
[14:38:45] [PASSED] gt_was/14011059788
[14:38:45] [PASSED] gt_was/14015795083
[14:38:45] [PASSED] gt_was/16021867713
[14:38:45] [PASSED] gt_was/14019449301
[14:38:45] [PASSED] gt_was/16028005424
[14:38:45] [PASSED] gt_was/14026578760
[14:38:45] [PASSED] gt_was/1409420604
[14:38:45] [PASSED] gt_was/1408615072
[14:38:45] [PASSED] gt_was/22010523718
[14:38:45] [PASSED] gt_was/14011006942
[14:38:45] [PASSED] gt_was/14014830051
[14:38:45] [PASSED] gt_was/18018781329
[14:38:45] [PASSED] gt_was/1509235366
[14:38:45] [PASSED] gt_was/18018781329
[14:38:45] [PASSED] gt_was/16016694945
[14:38:45] [PASSED] gt_was/14018575942
[14:38:45] [PASSED] gt_was/22016670082
[14:38:45] [PASSED] gt_was/22016670082
[14:38:45] [PASSED] gt_was/14017421178
[14:38:45] [PASSED] gt_was/16025250150
[14:38:45] [PASSED] gt_was/14021871409
[14:38:45] [PASSED] gt_was/16021865536
[14:38:45] [PASSED] gt_was/14021486841
[14:38:45] [PASSED] gt_was/14025160223
[14:38:45] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[14:38:45] [PASSED] gt_was/14025635424
[14:38:45] [PASSED] gt_was/16028005424
[14:38:45] ============== [PASSED] xe_rtp_table_gt_test ===============
[14:38:45] ================== xe_rtp_table_gt_test  ===================
[14:38:45] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[14:38:45] [PASSED] gt_tunings/Tuning: 32B Access Enable
[14:38:45] [PASSED] gt_tunings/Tuning: L3 cache
[14:38:45] [PASSED] gt_tunings/Tuning: L3 cache - media
[14:38:45] [PASSED] gt_tunings/Tuning: Compression Overfetch
[14:38:45] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[14:38:45] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[14:38:45] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[14:38:45] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[14:38:45] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[14:38:45] [PASSED] gt_tunings/Tuning: Stateless compression control
[14:38:45] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[14:38:45] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[14:38:45] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[14:38:45] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[14:38:45] ============== [PASSED] xe_rtp_table_gt_test ===============
[14:38:45] ================== xe_rtp_table_oob_test  ==================
[14:38:45] [PASSED] oob_was/1607983814
[14:38:45] [PASSED] oob_was/16010904313
[14:38:45] [PASSED] oob_was/18022495364
[14:38:45] [PASSED] oob_was/22012773006
[14:38:45] [PASSED] oob_was/14014475959
[14:38:45] [PASSED] oob_was/22011391025
[14:38:45] [PASSED] oob_was/22012727170
[14:38:45] [PASSED] oob_was/22012727685
[14:38:45] [PASSED] oob_was/22016596838
[14:38:45] [PASSED] oob_was/18020744125
[14:38:45] [PASSED] oob_was/1409600907
[14:38:45] [PASSED] oob_was/22014953428
[14:38:45] [PASSED] oob_was/16017236439
[14:38:45] [PASSED] oob_was/14019821291
[14:38:45] [PASSED] oob_was/14015076503
[14:38:45] [PASSED] oob_was/14018913170
[14:38:45] [PASSED] oob_was/14018094691
[14:38:45] [PASSED] oob_was/18024947630
[14:38:45] [PASSED] oob_was/16022287689
[14:38:45] [PASSED] oob_was/13011645652
[14:38:45] [PASSED] oob_was/14022293748
[14:38:45] [PASSED] oob_was/22019794406
[14:38:45] [PASSED] oob_was/22019338487
[14:38:45] [PASSED] oob_was/16023588340
[14:38:45] [PASSED] oob_was/14019789679
[14:38:45] [PASSED] oob_was/14022866841
[14:38:45] [PASSED] oob_was/16021333562
[14:38:45] [PASSED] oob_was/14016712196
[14:38:45] [PASSED] oob_was/14015568240
[14:38:45] [PASSED] oob_was/18013179988
[14:38:45] [PASSED] oob_was/1508761755
[14:38:45] [PASSED] oob_was/16023105232
[14:38:45] [PASSED] oob_was/16026508708
[14:38:45] [PASSED] oob_was/14020001231
[14:38:45] [PASSED] oob_was/16023683509
[14:38:45] [PASSED] oob_was/14025515070
[14:38:45] [PASSED] oob_was/15015404425_disable
[14:38:45] [PASSED] oob_was/16026007364
[14:38:45] [PASSED] oob_was/14020316580
[14:38:45] [PASSED] oob_was/14025883347
[14:38:45] [PASSED] oob_was/16029380221
[14:38:45] [PASSED] oob_was/22022079272
[14:38:45] [PASSED] oob_was/16029897822
[14:38:45] [PASSED] oob_was/14027054324
[14:38:45] ============== [PASSED] xe_rtp_table_oob_test ==============
[14:38:45] ================ xe_rtp_table_dev_oob_test  ================
[14:38:45] [PASSED] device_oob_was/22010954014
[14:38:45] [PASSED] device_oob_was/15015404425
[14:38:45] [PASSED] device_oob_was/22019338487_display
[14:38:45] [PASSED] device_oob_was/14022085890
[14:38:45] [PASSED] device_oob_was/14026539277
[14:38:45] [PASSED] device_oob_was/14026633728
[14:38:45] [PASSED] device_oob_was/14026746987
[14:38:45] [PASSED] device_oob_was/14026779378
[14:38:45] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[14:38:45] ========== xe_rtp_table_missing_upper_bound_test  ==========
[14:38:45] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[14:38:45] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[14:38:45] [PASSED] register_whitelist/1806527549
[14:38:45] [PASSED] register_whitelist/allow_read_ctx_timestamp
[14:38:45] [PASSED] register_whitelist/allow_read_queue_timestamp
[14:38:45] [PASSED] register_whitelist/16014440446
[14:38:45] [PASSED] register_whitelist/16017236439
[14:38:45] [PASSED] register_whitelist/16020183090
[14:38:45] [PASSED] register_whitelist/14024997852
[14:38:45] [PASSED] register_whitelist/14024997852
[14:38:45] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[14:38:45] =============== [PASSED] xe_rtp_tables_test ================
[14:38:45] =================== xe_rtp (3 subtests) ====================
[14:38:45] =================== xe_rtp_rules_tests  ====================
[14:38:45] [PASSED] no
[14:38:45] [PASSED] yes
[14:38:45] [PASSED] no-and-no
[14:38:45] [PASSED] no-and-yes
[14:38:45] [PASSED] yes-and-no
[14:38:45] [PASSED] yes-and-yes
[14:38:45] [PASSED] no-or-no
[14:38:45] [PASSED] no-or-yes
[14:38:45] [PASSED] yes-or-no
[14:38:45] [PASSED] yes-or-yes
[14:38:45] [PASSED] no-yes-or-yes-no
[14:38:45] [PASSED] no-yes-or-yes-yes
[14:38:45] [PASSED] yes-yes-or-no-yes
[14:38:45] [PASSED] yes-yes-or-yes-yes
[14:38:45] [PASSED] no-no-or-yes-or-no
[14:38:45] [PASSED] or
[14:38:45] [PASSED] or-yes
[14:38:45] [PASSED] or-no
[14:38:45] [PASSED] yes-or
[14:38:45] [PASSED] no-or
[14:38:45] [PASSED] no-or-or-yes
[14:38:45] [PASSED] yes-or-or-no
[14:38:45] [PASSED] no-or-or-no
[14:38:45] [PASSED] missing-context-engine-class
[14:38:45] [PASSED] missing-context-engine-class-or-yes
[14:38:45] [PASSED] missing-context-engine-class-or-or-yes
[14:38:45] =============== [PASSED] xe_rtp_rules_tests ================
[14:38:45] =============== xe_rtp_process_to_sr_tests  ================
[14:38:45] [PASSED] coalesce-same-reg
[14:38:45] [PASSED] coalesce-same-reg-literal-and-func
[14:38:45] [PASSED] no-match-no-add
[14:38:45] [PASSED] two-regs-two-entries
[14:38:45] [PASSED] clr-one-set-other
[14:38:45] [PASSED] set-field
[14:38:45] [PASSED] conflict-duplicate
[14:38:45] [PASSED] conflict-not-disjoint
[14:38:45] [PASSED] conflict-not-disjoint-literal-and-func
[14:38:45] [PASSED] conflict-reg-type
[14:38:45] [PASSED] bad-mcr-reg-forced-to-regular
[14:38:45] [PASSED] bad-regular-reg-forced-to-mcr
[14:38:45] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[14:38:45] ================== xe_rtp_process_tests  ===================
[14:38:45] [PASSED] active1
[14:38:45] [PASSED] active2
[14:38:45] [PASSED] active-inactive
[14:38:45] [PASSED] inactive-active
[14:38:45] [PASSED] inactive-active-inactive
[14:38:45] [PASSED] inactive-inactive-inactive
[14:38:45] ============== [PASSED] xe_rtp_process_tests ===============
[14:38:45] ===================== [PASSED] xe_rtp ======================
[14:38:45] ==================== xe_wa (1 subtest) =====================
[14:38:45] ======================== xe_wa_gt  =========================
[14:38:45] [PASSED] TIGERLAKE B0
[14:38:45] [PASSED] DG1 A0
[14:38:45] [PASSED] DG1 B0
[14:38:45] [PASSED] ALDERLAKE_S A0
[14:38:45] [PASSED] ALDERLAKE_S B0
[14:38:45] [PASSED] ALDERLAKE_S C0
[14:38:45] [PASSED] ALDERLAKE_S D0
[14:38:45] [PASSED] ALDERLAKE_P A0
[14:38:45] [PASSED] ALDERLAKE_P B0
[14:38:45] [PASSED] ALDERLAKE_P C0
[14:38:45] [PASSED] ALDERLAKE_S RPLS D0
[14:38:45] [PASSED] ALDERLAKE_P RPLU E0
[14:38:45] [PASSED] DG2 G10 C0
[14:38:45] [PASSED] DG2 G11 B1
[14:38:45] [PASSED] DG2 G12 A1
[14:38:45] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[14:38:45] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[14:38:45] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[14:38:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[14:38:45] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[14:38:45] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[14:38:45] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[14:38:45] ==================== [PASSED] xe_wa_gt =====================
[14:38:45] ====================== [PASSED] xe_wa ======================
[14:38:45] ============================================================
[14:38:45] Testing complete. Ran 742 tests: passed: 724, skipped: 18
[14:38:46] Elapsed time: 37.089s total, 4.419s configuring, 32.004s building, 0.642s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:38:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:38:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:39:12] Starting KUnit Kernel (1/1)...
[14:39:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:39:12] ============ drm_test_pick_cmdline (2 subtests) ============
[14:39:12] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:39:12] =============== drm_test_pick_cmdline_named  ===============
[14:39:12] [PASSED] NTSC
[14:39:12] [PASSED] NTSC-J
[14:39:12] [PASSED] PAL
[14:39:12] [PASSED] PAL-M
[14:39:12] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:39:12] ============== [PASSED] drm_test_pick_cmdline ==============
[14:39:12] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[14:39:12] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[14:39:12] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[14:39:12] =========== drm_validate_clone_mode (2 subtests) ===========
[14:39:12] ============== drm_test_check_in_clone_mode  ===============
[14:39:12] [PASSED] in_clone_mode
[14:39:12] [PASSED] not_in_clone_mode
[14:39:12] ========== [PASSED] drm_test_check_in_clone_mode ===========
[14:39:12] =============== drm_test_check_valid_clones  ===============
[14:39:12] [PASSED] not_in_clone_mode
[14:39:12] [PASSED] valid_clone
[14:39:12] [PASSED] invalid_clone
[14:39:12] =========== [PASSED] drm_test_check_valid_clones ===========
[14:39:12] ============= [PASSED] drm_validate_clone_mode =============
[14:39:12] ============= drm_validate_modeset (1 subtest) =============
[14:39:12] [PASSED] drm_test_check_connector_changed_modeset
[14:39:12] ============== [PASSED] drm_validate_modeset ===============
[14:39:12] ====== drm_test_bridge_get_current_state (1 subtest) =======
[14:39:12] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[14:39:12] ======== [PASSED] drm_test_bridge_get_current_state ========
[14:39:12] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[14:39:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[14:39:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[14:39:12] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[14:39:12] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[14:39:12] ============== drm_bridge_alloc (2 subtests) ===============
[14:39:12] [PASSED] drm_test_drm_bridge_alloc_basic
[14:39:12] [PASSED] drm_test_drm_bridge_alloc_get_put
[14:39:12] ================ [PASSED] drm_bridge_alloc =================
[14:39:12] ============= drm_bridge_bus_fmt (5 subtests) ==============
[14:39:12] [PASSED] drm_test_bridge_rgb_yuv_rgb
[14:39:12] [PASSED] drm_test_bridge_must_convert_to_yuv444
[14:39:12] [PASSED] drm_test_bridge_hdmi_auto_rgb
[14:39:12] [PASSED] drm_test_bridge_auto_first
[14:39:12] [PASSED] drm_test_bridge_rgb_yuv_no_path
[14:39:12] =============== [PASSED] drm_bridge_bus_fmt ================
[14:39:12] ============= drm_cmdline_parser (40 subtests) =============
[14:39:12] [PASSED] drm_test_cmdline_force_d_only
[14:39:12] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:39:12] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:39:12] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:39:12] [PASSED] drm_test_cmdline_force_e_only
[14:39:12] [PASSED] drm_test_cmdline_res
[14:39:12] [PASSED] drm_test_cmdline_res_vesa
[14:39:12] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:39:12] [PASSED] drm_test_cmdline_res_rblank
[14:39:12] [PASSED] drm_test_cmdline_res_bpp
[14:39:12] [PASSED] drm_test_cmdline_res_refresh
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:39:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:39:12] [PASSED] drm_test_cmdline_res_margins_force_on
[14:39:12] [PASSED] drm_test_cmdline_res_vesa_margins
[14:39:12] [PASSED] drm_test_cmdline_name
[14:39:12] [PASSED] drm_test_cmdline_name_bpp
[14:39:12] [PASSED] drm_test_cmdline_name_option
[14:39:12] [PASSED] drm_test_cmdline_name_bpp_option
[14:39:12] [PASSED] drm_test_cmdline_rotate_0
[14:39:12] [PASSED] drm_test_cmdline_rotate_90
[14:39:12] [PASSED] drm_test_cmdline_rotate_180
[14:39:12] [PASSED] drm_test_cmdline_rotate_270
[14:39:12] [PASSED] drm_test_cmdline_hmirror
[14:39:12] [PASSED] drm_test_cmdline_vmirror
[14:39:12] [PASSED] drm_test_cmdline_margin_options
[14:39:12] [PASSED] drm_test_cmdline_multiple_options
[14:39:12] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:39:12] [PASSED] drm_test_cmdline_extra_and_option
[14:39:12] [PASSED] drm_test_cmdline_freestanding_options
[14:39:12] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:39:12] [PASSED] drm_test_cmdline_panel_orientation
[14:39:12] ================ drm_test_cmdline_invalid  =================
[14:39:12] [PASSED] margin_only
[14:39:12] [PASSED] interlace_only
[14:39:12] [PASSED] res_missing_x
[14:39:12] [PASSED] res_missing_y
[14:39:12] [PASSED] res_bad_y
[14:39:12] [PASSED] res_missing_y_bpp
[14:39:12] [PASSED] res_bad_bpp
[14:39:12] [PASSED] res_bad_refresh
[14:39:12] [PASSED] res_bpp_refresh_force_on_off
[14:39:12] [PASSED] res_invalid_mode
[14:39:12] [PASSED] res_bpp_wrong_place_mode
[14:39:12] [PASSED] name_bpp_refresh
[14:39:12] [PASSED] name_refresh
[14:39:12] [PASSED] name_refresh_wrong_mode
[14:39:12] [PASSED] name_refresh_invalid_mode
[14:39:12] [PASSED] rotate_multiple
[14:39:12] [PASSED] rotate_invalid_val
[14:39:12] [PASSED] rotate_truncated
[14:39:12] [PASSED] invalid_option
[14:39:12] [PASSED] invalid_tv_option
[14:39:12] [PASSED] truncated_tv_option
[14:39:12] ============ [PASSED] drm_test_cmdline_invalid =============
[14:39:12] =============== drm_test_cmdline_tv_options  ===============
[14:39:12] [PASSED] NTSC
[14:39:12] [PASSED] NTSC_443
[14:39:12] [PASSED] NTSC_J
[14:39:12] [PASSED] PAL
[14:39:12] [PASSED] PAL_M
[14:39:12] [PASSED] PAL_N
[14:39:12] [PASSED] SECAM
[14:39:12] [PASSED] MONO_525
[14:39:12] [PASSED] MONO_625
[14:39:12] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:39:12] =============== [PASSED] drm_cmdline_parser ================
[14:39:12] ========== drmm_connector_hdmi_init (20 subtests) ==========
[14:39:12] [PASSED] drm_test_connector_hdmi_init_valid
[14:39:12] [PASSED] drm_test_connector_hdmi_init_bpc_8
[14:39:12] [PASSED] drm_test_connector_hdmi_init_bpc_10
[14:39:12] [PASSED] drm_test_connector_hdmi_init_bpc_12
[14:39:12] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[14:39:12] [PASSED] drm_test_connector_hdmi_init_bpc_null
[14:39:12] [PASSED] drm_test_connector_hdmi_init_formats_empty
[14:39:12] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[14:39:12] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[14:39:12] [PASSED] supported_formats=0x9 yuv420_allowed=1
[14:39:12] [PASSED] supported_formats=0x9 yuv420_allowed=0
[14:39:12] [PASSED] supported_formats=0x5 yuv420_allowed=1
[14:39:12] [PASSED] supported_formats=0x5 yuv420_allowed=0
[14:39:12] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[14:39:12] [PASSED] drm_test_connector_hdmi_init_null_ddc
[14:39:12] [PASSED] drm_test_connector_hdmi_init_null_product
[14:39:12] [PASSED] drm_test_connector_hdmi_init_null_vendor
[14:39:12] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[14:39:12] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[14:39:12] [PASSED] drm_test_connector_hdmi_init_product_valid
[14:39:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[14:39:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[14:39:12] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[14:39:12] ========= drm_test_connector_hdmi_init_type_valid  =========
[14:39:12] [PASSED] HDMI-A
[14:39:12] [PASSED] HDMI-B
[14:39:12] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[14:39:12] ======== drm_test_connector_hdmi_init_type_invalid  ========
[14:39:12] [PASSED] Unknown
[14:39:12] [PASSED] VGA
[14:39:12] [PASSED] DVI-I
[14:39:12] [PASSED] DVI-D
[14:39:12] [PASSED] DVI-A
[14:39:12] [PASSED] Composite
[14:39:12] [PASSED] SVIDEO
[14:39:12] [PASSED] LVDS
[14:39:12] [PASSED] Component
[14:39:12] [PASSED] DIN
[14:39:12] [PASSED] DP
[14:39:12] [PASSED] TV
[14:39:12] [PASSED] eDP
[14:39:12] [PASSED] Virtual
[14:39:12] [PASSED] DSI
[14:39:12] [PASSED] DPI
[14:39:12] [PASSED] Writeback
[14:39:12] [PASSED] SPI
[14:39:12] [PASSED] USB
[14:39:12] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[14:39:12] ============ [PASSED] drmm_connector_hdmi_init =============
[14:39:12] ============= drmm_connector_init (3 subtests) =============
[14:39:12] [PASSED] drm_test_drmm_connector_init
[14:39:12] [PASSED] drm_test_drmm_connector_init_null_ddc
[14:39:12] ========= drm_test_drmm_connector_init_type_valid  =========
[14:39:12] [PASSED] Unknown
[14:39:12] [PASSED] VGA
[14:39:12] [PASSED] DVI-I
[14:39:12] [PASSED] DVI-D
[14:39:12] [PASSED] DVI-A
[14:39:12] [PASSED] Composite
[14:39:12] [PASSED] SVIDEO
[14:39:12] [PASSED] LVDS
[14:39:12] [PASSED] Component
[14:39:12] [PASSED] DIN
[14:39:12] [PASSED] DP
[14:39:12] [PASSED] HDMI-A
[14:39:12] [PASSED] HDMI-B
[14:39:12] [PASSED] TV
[14:39:12] [PASSED] eDP
[14:39:12] [PASSED] Virtual
[14:39:12] [PASSED] DSI
[14:39:12] [PASSED] DPI
[14:39:12] [PASSED] Writeback
[14:39:12] [PASSED] SPI
[14:39:12] [PASSED] USB
[14:39:12] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[14:39:12] =============== [PASSED] drmm_connector_init ===============
[14:39:12] ========= drm_connector_dynamic_init (6 subtests) ==========
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_init
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_init_properties
[14:39:12] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[14:39:12] [PASSED] Unknown
[14:39:12] [PASSED] VGA
[14:39:12] [PASSED] DVI-I
[14:39:12] [PASSED] DVI-D
[14:39:12] [PASSED] DVI-A
[14:39:12] [PASSED] Composite
[14:39:12] [PASSED] SVIDEO
[14:39:12] [PASSED] LVDS
[14:39:12] [PASSED] Component
[14:39:12] [PASSED] DIN
[14:39:12] [PASSED] DP
[14:39:12] [PASSED] HDMI-A
[14:39:12] [PASSED] HDMI-B
[14:39:12] [PASSED] TV
[14:39:12] [PASSED] eDP
[14:39:12] [PASSED] Virtual
[14:39:12] [PASSED] DSI
[14:39:12] [PASSED] DPI
[14:39:12] [PASSED] Writeback
[14:39:12] [PASSED] SPI
[14:39:12] [PASSED] USB
[14:39:12] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[14:39:12] ======== drm_test_drm_connector_dynamic_init_name  =========
[14:39:12] [PASSED] Unknown
[14:39:12] [PASSED] VGA
[14:39:12] [PASSED] DVI-I
[14:39:12] [PASSED] DVI-D
[14:39:12] [PASSED] DVI-A
[14:39:12] [PASSED] Composite
[14:39:12] [PASSED] SVIDEO
[14:39:12] [PASSED] LVDS
[14:39:12] [PASSED] Component
[14:39:12] [PASSED] DIN
[14:39:12] [PASSED] DP
[14:39:12] [PASSED] HDMI-A
[14:39:12] [PASSED] HDMI-B
[14:39:12] [PASSED] TV
[14:39:12] [PASSED] eDP
[14:39:12] [PASSED] Virtual
[14:39:12] [PASSED] DSI
[14:39:12] [PASSED] DPI
[14:39:12] [PASSED] Writeback
[14:39:12] [PASSED] SPI
[14:39:12] [PASSED] USB
[14:39:12] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[14:39:12] =========== [PASSED] drm_connector_dynamic_init ============
[14:39:12] ==== drm_connector_dynamic_register_early (4 subtests) =====
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[14:39:12] ====== [PASSED] drm_connector_dynamic_register_early =======
[14:39:12] ======= drm_connector_dynamic_register (7 subtests) ========
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[14:39:12] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[14:39:12] ========= [PASSED] drm_connector_dynamic_register ==========
[14:39:12] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[14:39:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[14:39:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[14:39:12] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[14:39:12] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[14:39:12] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:39:12] [PASSED] NTSC
[14:39:12] [PASSED] NTSC-443
[14:39:12] [PASSED] NTSC-J
[14:39:12] [PASSED] PAL
[14:39:12] [PASSED] PAL-M
[14:39:12] [PASSED] PAL-N
[14:39:12] [PASSED] SECAM
[14:39:12] [PASSED] Mono
[14:39:12] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:39:12] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:39:12] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:39:12] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[14:39:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[14:39:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[14:39:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[14:39:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[14:39:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[14:39:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[14:39:12] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[14:39:12] [PASSED] VIC 96
[14:39:12] [PASSED] VIC 97
[14:39:12] [PASSED] VIC 101
[14:39:12] [PASSED] VIC 102
[14:39:12] [PASSED] VIC 106
[14:39:12] [PASSED] VIC 107
[14:39:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[14:39:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[14:39:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[14:39:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[14:39:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[14:39:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[14:39:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[14:39:12] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[14:39:12] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[14:39:12] [PASSED] Automatic
[14:39:12] [PASSED] Full
[14:39:12] [PASSED] Limited 16:235
[14:39:12] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[14:39:12] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[14:39:12] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[14:39:12] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[14:39:12] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[14:39:12] [PASSED] RGB
[14:39:12] [PASSED] YUV 4:2:0
[14:39:12] [PASSED] YUV 4:2:2
[14:39:12] [PASSED] YUV 4:4:4
[14:39:12] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[14:39:12] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[14:39:12] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[14:39:12] ============= drm_damage_helper (21 subtests) ==============
[14:39:12] [PASSED] drm_test_damage_iter_no_damage
[14:39:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:39:12] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:39:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:39:12] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:39:12] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:39:12] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:39:12] [PASSED] drm_test_damage_iter_simple_damage
[14:39:12] [PASSED] drm_test_damage_iter_single_damage
[14:39:12] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:39:12] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:39:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:39:12] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:39:12] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:39:12] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:39:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:39:12] [PASSED] drm_test_damage_iter_damage
[14:39:12] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:39:12] [PASSED] drm_test_damage_iter_damage_one_outside
[14:39:12] [PASSED] drm_test_damage_iter_damage_src_moved
[14:39:12] [PASSED] drm_test_damage_iter_damage_not_visible
[14:39:12] ================ [PASSED] drm_damage_helper ================
[14:39:12] ============== drm_dp_mst_helper (3 subtests) ==============
[14:39:12] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:39:12] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:39:12] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:39:12] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:39:12] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:39:12] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:39:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:39:12] ============== drm_test_dp_mst_calc_pbn_div  ===============
[14:39:12] [PASSED] Link rate 2000000 lane count 4
[14:39:12] [PASSED] Link rate 2000000 lane count 2
[14:39:12] [PASSED] Link rate 2000000 lane count 1
[14:39:12] [PASSED] Link rate 1350000 lane count 4
[14:39:12] [PASSED] Link rate 1350000 lane count 2
[14:39:12] [PASSED] Link rate 1350000 lane count 1
[14:39:12] [PASSED] Link rate 1000000 lane count 4
[14:39:12] [PASSED] Link rate 1000000 lane count 2
[14:39:12] [PASSED] Link rate 1000000 lane count 1
[14:39:12] [PASSED] Link rate 810000 lane count 4
[14:39:12] [PASSED] Link rate 810000 lane count 2
[14:39:12] [PASSED] Link rate 810000 lane count 1
[14:39:12] [PASSED] Link rate 540000 lane count 4
[14:39:12] [PASSED] Link rate 540000 lane count 2
[14:39:12] [PASSED] Link rate 540000 lane count 1
[14:39:12] [PASSED] Link rate 270000 lane count 4
[14:39:12] [PASSED] Link rate 270000 lane count 2
[14:39:12] [PASSED] Link rate 270000 lane count 1
[14:39:12] [PASSED] Link rate 162000 lane count 4
[14:39:12] [PASSED] Link rate 162000 lane count 2
[14:39:12] [PASSED] Link rate 162000 lane count 1
[14:39:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[14:39:12] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:39:12] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:39:12] [PASSED] DP_POWER_UP_PHY with port number
[14:39:12] [PASSED] DP_POWER_DOWN_PHY with port number
[14:39:12] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:39:12] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:39:12] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:39:12] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:39:12] [PASSED] DP_QUERY_PAYLOAD with port number
[14:39:12] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:39:12] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:39:12] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:39:12] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:39:12] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:39:12] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:39:12] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:39:12] [PASSED] DP_REMOTE_I2C_READ with port number
[14:39:12] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:39:12] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:39:12] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:39:12] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:39:12] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:39:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:39:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:39:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:39:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:39:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:39:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:39:12] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:39:12] ================ [PASSED] drm_dp_mst_helper ================
[14:39:12] ================== drm_exec (7 subtests) ===================
[14:39:12] [PASSED] sanitycheck
[14:39:12] [PASSED] test_lock
[14:39:12] [PASSED] test_lock_unlock
[14:39:12] [PASSED] test_duplicates
[14:39:12] [PASSED] test_prepare
[14:39:12] [PASSED] test_prepare_array
[14:39:12] [PASSED] test_multiple_loops
[14:39:12] ==================== [PASSED] drm_exec =====================
[14:39:12] =========== drm_format_helper_test (17 subtests) ===========
[14:39:12] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:39:12] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:39:12] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:39:12] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:39:12] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:39:12] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:39:12] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:39:12] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[14:39:12] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:39:12] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:39:12] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:39:12] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:39:12] ==================== drm_test_fb_swab  =====================
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ================ [PASSED] drm_test_fb_swab =================
[14:39:12] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[14:39:12] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[14:39:12] [PASSED] single_pixel_source_buffer
[14:39:12] [PASSED] single_pixel_clip_rectangle
[14:39:12] [PASSED] well_known_colors
[14:39:12] [PASSED] destination_pitch
[14:39:12] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[14:39:12] ================= drm_test_fb_clip_offset  =================
[14:39:12] [PASSED] pass through
[14:39:12] [PASSED] horizontal offset
[14:39:12] [PASSED] vertical offset
[14:39:12] [PASSED] horizontal and vertical offset
[14:39:12] [PASSED] horizontal offset (custom pitch)
[14:39:12] [PASSED] vertical offset (custom pitch)
[14:39:12] [PASSED] horizontal and vertical offset (custom pitch)
[14:39:12] ============= [PASSED] drm_test_fb_clip_offset =============
[14:39:12] =================== drm_test_fb_memcpy  ====================
[14:39:12] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:39:12] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:39:12] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:39:12] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:39:12] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:39:12] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:39:12] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:39:12] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:39:12] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:39:12] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:39:12] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:39:12] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:39:12] =============== [PASSED] drm_test_fb_memcpy ================
[14:39:12] ============= [PASSED] drm_format_helper_test ==============
[14:39:12] ================= drm_format (18 subtests) =================
[14:39:12] [PASSED] drm_test_format_block_width_invalid
[14:39:12] [PASSED] drm_test_format_block_width_one_plane
[14:39:12] [PASSED] drm_test_format_block_width_two_plane
[14:39:12] [PASSED] drm_test_format_block_width_three_plane
[14:39:12] [PASSED] drm_test_format_block_width_tiled
[14:39:12] [PASSED] drm_test_format_block_height_invalid
[14:39:12] [PASSED] drm_test_format_block_height_one_plane
[14:39:12] [PASSED] drm_test_format_block_height_two_plane
[14:39:12] [PASSED] drm_test_format_block_height_three_plane
[14:39:12] [PASSED] drm_test_format_block_height_tiled
[14:39:12] [PASSED] drm_test_format_min_pitch_invalid
[14:39:12] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:39:12] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:39:12] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:39:12] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:39:12] [PASSED] drm_test_format_min_pitch_two_plane
[14:39:12] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:39:12] [PASSED] drm_test_format_min_pitch_tiled
[14:39:12] =================== [PASSED] drm_format ====================
[14:39:12] ============== drm_framebuffer (10 subtests) ===============
[14:39:12] ========== drm_test_framebuffer_check_src_coords  ==========
[14:39:12] [PASSED] Success: source fits into fb
[14:39:12] [PASSED] Fail: overflowing fb with x-axis coordinate
[14:39:12] [PASSED] Fail: overflowing fb with y-axis coordinate
[14:39:12] [PASSED] Fail: overflowing fb with source width
[14:39:12] [PASSED] Fail: overflowing fb with source height
[14:39:12] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[14:39:12] [PASSED] drm_test_framebuffer_cleanup
[14:39:12] =============== drm_test_framebuffer_create  ===============
[14:39:12] [PASSED] ABGR8888 normal sizes
[14:39:12] [PASSED] ABGR8888 max sizes
[14:39:12] [PASSED] ABGR8888 pitch greater than min required
[14:39:12] [PASSED] ABGR8888 pitch less than min required
[14:39:12] [PASSED] ABGR8888 Invalid width
[14:39:12] [PASSED] ABGR8888 Invalid buffer handle
[14:39:12] [PASSED] No pixel format
[14:39:12] [PASSED] ABGR8888 Width 0
[14:39:12] [PASSED] ABGR8888 Height 0
[14:39:12] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:39:12] [PASSED] ABGR8888 Large buffer offset
[14:39:12] [PASSED] ABGR8888 Buffer offset for inexistent plane
[14:39:12] [PASSED] ABGR8888 Invalid flag
[14:39:12] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:39:12] [PASSED] ABGR8888 Valid buffer modifier
[14:39:12] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:39:12] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:39:12] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:39:12] [PASSED] NV12 Normal sizes
[14:39:12] [PASSED] NV12 Max sizes
[14:39:12] [PASSED] NV12 Invalid pitch
[14:39:12] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:39:12] [PASSED] NV12 different  modifier per-plane
[14:39:12] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:39:12] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:39:12] [PASSED] NV12 Modifier for inexistent plane
[14:39:12] [PASSED] NV12 Handle for inexistent plane
[14:39:12] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:39:12] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:39:12] [PASSED] YVU420 Normal sizes
[14:39:12] [PASSED] YVU420 Max sizes
[14:39:12] [PASSED] YVU420 Invalid pitch
[14:39:12] [PASSED] YVU420 Different pitches
[14:39:12] [PASSED] YVU420 Different buffer offsets/pitches
[14:39:12] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:39:12] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:39:12] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:39:12] [PASSED] YVU420 Valid modifier
[14:39:12] [PASSED] YVU420 Different modifiers per plane
[14:39:12] [PASSED] YVU420 Modifier for inexistent plane
[14:39:12] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[14:39:12] [PASSED] X0L2 Normal sizes
[14:39:12] [PASSED] X0L2 Max sizes
[14:39:12] [PASSED] X0L2 Invalid pitch
[14:39:12] [PASSED] X0L2 Pitch greater than minimum required
[14:39:12] [PASSED] X0L2 Handle for inexistent plane
[14:39:12] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:39:12] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:39:12] [PASSED] X0L2 Valid modifier
[14:39:12] [PASSED] X0L2 Modifier for inexistent plane
[14:39:12] =========== [PASSED] drm_test_framebuffer_create ===========
[14:39:12] [PASSED] drm_test_framebuffer_free
[14:39:12] [PASSED] drm_test_framebuffer_init
[14:39:12] [PASSED] drm_test_framebuffer_init_bad_format
[14:39:12] [PASSED] drm_test_framebuffer_init_dev_mismatch
[14:39:12] [PASSED] drm_test_framebuffer_lookup
[14:39:12] [PASSED] drm_test_framebuffer_lookup_inexistent
[14:39:12] [PASSED] drm_test_framebuffer_modifiers_not_supported
[14:39:12] ================= [PASSED] drm_framebuffer =================
[14:39:12] ================ drm_gem_shmem (8 subtests) ================
[14:39:12] [PASSED] drm_gem_shmem_test_obj_create
[14:39:12] [PASSED] drm_gem_shmem_test_obj_create_private
[14:39:12] [PASSED] drm_gem_shmem_test_pin_pages
[14:39:12] [PASSED] drm_gem_shmem_test_vmap
[14:39:12] [PASSED] drm_gem_shmem_test_get_sg_table
[14:39:12] [PASSED] drm_gem_shmem_test_get_pages_sgt
[14:39:12] [PASSED] drm_gem_shmem_test_madvise
[14:39:12] [PASSED] drm_gem_shmem_test_purge
[14:39:12] ================== [PASSED] drm_gem_shmem ==================
[14:39:12] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[14:39:12] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[14:39:12] [PASSED] Automatic
[14:39:12] [PASSED] Full
[14:39:12] [PASSED] Limited 16:235
[14:39:12] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[14:39:12] [PASSED] drm_test_check_disable_connector
[14:39:12] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[14:39:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[14:39:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[14:39:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[14:39:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[14:39:12] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[14:39:12] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[14:39:12] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[14:39:12] [PASSED] drm_test_check_output_bpc_dvi
[14:39:12] [PASSED] drm_test_check_output_bpc_format_vic_1
[14:39:12] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[14:39:12] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[14:39:12] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[14:39:12] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[14:39:12] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[14:39:12] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[14:39:12] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[14:39:12] ============ drm_test_check_hdmi_color_format  =============
[14:39:12] [PASSED] AUTO -> RGB
[14:39:12] [PASSED] YCBCR422 -> YUV422
[14:39:12] [PASSED] YCBCR420 -> YUV420
[14:39:12] [PASSED] YCBCR444 -> YUV444
[14:39:12] [PASSED] RGB -> RGB
[14:39:12] ======== [PASSED] drm_test_check_hdmi_color_format =========
[14:39:12] ======== drm_test_check_hdmi_color_format_420_only  ========
[14:39:12] [PASSED] RGB should fail
[14:39:12] [PASSED] YUV444 should fail
[14:39:12] [PASSED] YUV422 should fail
[14:39:12] [PASSED] YUV420 should work
[14:39:12] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[14:39:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[14:39:12] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[14:39:12] [PASSED] drm_test_check_broadcast_rgb_value
[14:39:12] [PASSED] drm_test_check_bpc_8_value
[14:39:12] [PASSED] drm_test_check_bpc_10_value
[14:39:12] [PASSED] drm_test_check_bpc_12_value
[14:39:12] [PASSED] drm_test_check_format_value
[14:39:12] [PASSED] drm_test_check_tmds_char_value
[14:39:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[14:39:12] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[14:39:12] [PASSED] drm_test_check_mode_valid
[14:39:12] [PASSED] drm_test_check_mode_valid_reject
[14:39:12] [PASSED] drm_test_check_mode_valid_reject_rate
[14:39:12] [PASSED] drm_test_check_mode_valid_reject_max_clock
[14:39:12] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[14:39:12] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[14:39:12] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[14:39:12] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[14:39:12] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[14:39:12] [PASSED] drm_test_check_infoframes
[14:39:12] [PASSED] drm_test_check_reject_avi_infoframe
[14:39:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[14:39:12] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[14:39:12] [PASSED] drm_test_check_reject_audio_infoframe
[14:39:12] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[14:39:12] ================= drm_managed (2 subtests) =================
[14:39:12] [PASSED] drm_test_managed_release_action
[14:39:12] [PASSED] drm_test_managed_run_action
[14:39:12] =================== [PASSED] drm_managed ===================
[14:39:12] =================== drm_mm (6 subtests) ====================
[14:39:12] [PASSED] drm_test_mm_init
[14:39:12] [PASSED] drm_test_mm_debug
[14:39:12] [PASSED] drm_test_mm_align32
[14:39:12] [PASSED] drm_test_mm_align64
[14:39:12] [PASSED] drm_test_mm_lowest
[14:39:12] [PASSED] drm_test_mm_highest
[14:39:12] ===================== [PASSED] drm_mm ======================
[14:39:12] ============= drm_modes_analog_tv (5 subtests) =============
[14:39:12] [PASSED] drm_test_modes_analog_tv_mono_576i
[14:39:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:39:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:39:12] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:39:12] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:39:12] =============== [PASSED] drm_modes_analog_tv ===============
[14:39:12] ============== drm_plane_helper (2 subtests) ===============
[14:39:12] =============== drm_test_check_plane_state  ================
[14:39:12] [PASSED] clipping_simple
[14:39:12] [PASSED] clipping_rotate_reflect
[14:39:12] [PASSED] positioning_simple
[14:39:12] [PASSED] upscaling
[14:39:12] [PASSED] downscaling
[14:39:12] [PASSED] rounding1
[14:39:12] [PASSED] rounding2
[14:39:12] [PASSED] rounding3
[14:39:12] [PASSED] rounding4
[14:39:12] =========== [PASSED] drm_test_check_plane_state ============
[14:39:12] =========== drm_test_check_invalid_plane_state  ============
[14:39:12] [PASSED] positioning_invalid
[14:39:12] [PASSED] upscaling_invalid
[14:39:12] [PASSED] downscaling_invalid
[14:39:12] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:39:12] ================ [PASSED] drm_plane_helper =================
[14:39:12] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[14:39:12] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:39:12] [PASSED] None
[14:39:12] [PASSED] PAL
[14:39:12] [PASSED] NTSC
[14:39:12] [PASSED] Both, NTSC Default
[14:39:12] [PASSED] Both, PAL Default
[14:39:12] [PASSED] Both, NTSC Default, with PAL on command-line
[14:39:12] [PASSED] Both, PAL Default, with NTSC on command-line
[14:39:12] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:39:12] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:39:12] ================== drm_rect (9 subtests) ===================
[14:39:12] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:39:12] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:39:12] [PASSED] drm_test_rect_clip_scaled_clipped
[14:39:12] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:39:12] ================= drm_test_rect_intersect  =================
[14:39:12] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:39:12] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:39:12] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:39:12] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:39:12] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:39:12] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:39:12] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:39:12] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:39:12] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:39:12] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:39:12] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:39:12] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:39:12] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:39:12] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:39:12] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:39:12] ============= [PASSED] drm_test_rect_intersect =============
[14:39:12] ================ drm_test_rect_calc_hscale  ================
[14:39:12] [PASSED] normal use
[14:39:12] [PASSED] out of max range
[14:39:12] [PASSED] out of min range
[14:39:12] [PASSED] zero dst
[14:39:12] [PASSED] negative src
[14:39:12] [PASSED] negative dst
[14:39:12] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:39:12] ================ drm_test_rect_calc_vscale  ================
[14:39:12] [PASSED] normal use
[14:39:12] [PASSED] out of max range
[14:39:12] [PASSED] out of min range
[14:39:12] [PASSED] zero dst
[14:39:12] [PASSED] negative src
[14:39:12] [PASSED] negative dst
[14:39:12] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:39:12] ================== drm_test_rect_rotate  ===================
[14:39:12] [PASSED] reflect-x
[14:39:12] [PASSED] reflect-y
[14:39:12] [PASSED] rotate-0
[14:39:12] [PASSED] rotate-90
[14:39:12] [PASSED] rotate-180
[14:39:12] [PASSED] rotate-270
[14:39:12] ============== [PASSED] drm_test_rect_rotate ===============
[14:39:12] ================ drm_test_rect_rotate_inv  =================
[14:39:12] [PASSED] reflect-x
[14:39:12] [PASSED] reflect-y
[14:39:12] [PASSED] rotate-0
[14:39:12] [PASSED] rotate-90
[14:39:12] [PASSED] rotate-180
[14:39:12] [PASSED] rotate-270
[14:39:12] ============ [PASSED] drm_test_rect_rotate_inv =============
[14:39:12] ==================== [PASSED] drm_rect =====================
[14:39:12] ============ drm_sysfb_modeset_test (1 subtest) ============
[14:39:12] ============ drm_test_sysfb_build_fourcc_list  =============
[14:39:12] [PASSED] no native formats
[14:39:12] [PASSED] XRGB8888 as native format
[14:39:12] [PASSED] remove duplicates
[14:39:12] [PASSED] convert alpha formats
[14:39:12] [PASSED] random formats
[14:39:12] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[14:39:12] ============= [PASSED] drm_sysfb_modeset_test ==============
[14:39:12] ================== drm_fixp (2 subtests) ===================
[14:39:12] [PASSED] drm_test_int2fixp
[14:39:12] [PASSED] drm_test_sm2fixp
[14:39:12] ==================== [PASSED] drm_fixp =====================
[14:39:12] ============================================================
[14:39:12] Testing complete. Ran 637 tests: passed: 637
[14:39:12] Elapsed time: 26.797s total, 1.800s configuring, 24.831s building, 0.154s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[14:39:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:39:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:39:24] Starting KUnit Kernel (1/1)...
[14:39:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:39:24] ================= ttm_device (5 subtests) ==================
[14:39:24] [PASSED] ttm_device_init_basic
[14:39:24] [PASSED] ttm_device_init_multiple
[14:39:24] [PASSED] ttm_device_fini_basic
[14:39:24] [PASSED] ttm_device_init_no_vma_man
[14:39:24] ================== ttm_device_init_pools  ==================
[14:39:24] [PASSED] No DMA allocations, no DMA32 required
[14:39:24] [PASSED] DMA allocations, DMA32 required
[14:39:24] [PASSED] No DMA allocations, DMA32 required
[14:39:24] [PASSED] DMA allocations, no DMA32 required
[14:39:24] ============== [PASSED] ttm_device_init_pools ==============
[14:39:24] =================== [PASSED] ttm_device ====================
[14:39:24] ================== ttm_pool (8 subtests) ===================
[14:39:24] ================== ttm_pool_alloc_basic  ===================
[14:39:24] [PASSED] One page
[14:39:24] [PASSED] More than one page
[14:39:24] [PASSED] Above the allocation limit
[14:39:24] [PASSED] One page, with coherent DMA mappings enabled
[14:39:24] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[14:39:24] ============== [PASSED] ttm_pool_alloc_basic ===============
[14:39:24] ============== ttm_pool_alloc_basic_dma_addr  ==============
[14:39:24] [PASSED] One page
[14:39:24] [PASSED] More than one page
[14:39:24] [PASSED] Above the allocation limit
[14:39:24] [PASSED] One page, with coherent DMA mappings enabled
[14:39:24] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[14:39:24] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[14:39:24] [PASSED] ttm_pool_alloc_order_caching_match
[14:39:24] [PASSED] ttm_pool_alloc_caching_mismatch
[14:39:24] [PASSED] ttm_pool_alloc_order_mismatch
[14:39:24] [PASSED] ttm_pool_free_dma_alloc
[14:39:24] [PASSED] ttm_pool_free_no_dma_alloc
[14:39:24] [PASSED] ttm_pool_fini_basic
[14:39:24] ==================== [PASSED] ttm_pool =====================
[14:39:24] ================ ttm_resource (8 subtests) =================
[14:39:24] ================= ttm_resource_init_basic  =================
[14:39:24] [PASSED] Init resource in TTM_PL_SYSTEM
[14:39:24] [PASSED] Init resource in TTM_PL_VRAM
[14:39:24] [PASSED] Init resource in a private placement
[14:39:24] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[14:39:24] ============= [PASSED] ttm_resource_init_basic =============
[14:39:24] [PASSED] ttm_resource_init_pinned
[14:39:24] [PASSED] ttm_resource_fini_basic
[14:39:24] [PASSED] ttm_resource_manager_init_basic
[14:39:24] [PASSED] ttm_resource_manager_usage_basic
[14:39:24] [PASSED] ttm_resource_manager_set_used_basic
[14:39:24] [PASSED] ttm_sys_man_alloc_basic
[14:39:24] [PASSED] ttm_sys_man_free_basic
[14:39:24] ================== [PASSED] ttm_resource ===================
[14:39:24] =================== ttm_tt (15 subtests) ===================
[14:39:24] ==================== ttm_tt_init_basic  ====================
[14:39:24] [PASSED] Page-aligned size
[14:39:24] [PASSED] Extra pages requested
[14:39:24] ================ [PASSED] ttm_tt_init_basic ================
[14:39:24] [PASSED] ttm_tt_init_misaligned
[14:39:24] [PASSED] ttm_tt_fini_basic
[14:39:24] [PASSED] ttm_tt_fini_sg
[14:39:24] [PASSED] ttm_tt_fini_shmem
[14:39:24] [PASSED] ttm_tt_create_basic
[14:39:24] [PASSED] ttm_tt_create_invalid_bo_type
[14:39:24] [PASSED] ttm_tt_create_ttm_exists
[14:39:24] [PASSED] ttm_tt_create_failed
[14:39:24] [PASSED] ttm_tt_destroy_basic
[14:39:24] [PASSED] ttm_tt_populate_null_ttm
[14:39:24] [PASSED] ttm_tt_populate_populated_ttm
[14:39:24] [PASSED] ttm_tt_unpopulate_basic
[14:39:24] [PASSED] ttm_tt_unpopulate_empty_ttm
[14:39:24] [PASSED] ttm_tt_swapin_basic
[14:39:24] ===================== [PASSED] ttm_tt ======================
[14:39:24] =================== ttm_bo (14 subtests) ===================
[14:39:24] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[14:39:24] [PASSED] Cannot be interrupted and sleeps
[14:39:24] [PASSED] Cannot be interrupted, locks straight away
[14:39:24] [PASSED] Can be interrupted, sleeps
[14:39:24] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[14:39:24] [PASSED] ttm_bo_reserve_locked_no_sleep
[14:39:24] [PASSED] ttm_bo_reserve_no_wait_ticket
[14:39:24] [PASSED] ttm_bo_reserve_double_resv
[14:39:24] [PASSED] ttm_bo_reserve_interrupted
[14:39:24] [PASSED] ttm_bo_reserve_deadlock
[14:39:24] [PASSED] ttm_bo_unreserve_basic
[14:39:24] [PASSED] ttm_bo_unreserve_pinned
[14:39:24] [PASSED] ttm_bo_unreserve_bulk
[14:39:24] [PASSED] ttm_bo_fini_basic
[14:39:24] [PASSED] ttm_bo_fini_shared_resv
[14:39:24] [PASSED] ttm_bo_pin_basic
[14:39:24] [PASSED] ttm_bo_pin_unpin_resource
[14:39:24] [PASSED] ttm_bo_multiple_pin_one_unpin
[14:39:24] ===================== [PASSED] ttm_bo ======================
[14:39:24] ============== ttm_bo_validate (22 subtests) ===============
[14:39:24] ============== ttm_bo_init_reserved_sys_man  ===============
[14:39:24] [PASSED] Buffer object for userspace
[14:39:24] [PASSED] Kernel buffer object
[14:39:24] [PASSED] Shared buffer object
[14:39:24] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[14:39:24] ============== ttm_bo_init_reserved_mock_man  ==============
[14:39:24] [PASSED] Buffer object for userspace
[14:39:24] [PASSED] Kernel buffer object
[14:39:24] [PASSED] Shared buffer object
[14:39:24] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[14:39:24] [PASSED] ttm_bo_init_reserved_resv
[14:39:24] ================== ttm_bo_validate_basic  ==================
[14:39:24] [PASSED] Buffer object for userspace
[14:39:24] [PASSED] Kernel buffer object
[14:39:24] [PASSED] Shared buffer object
[14:39:24] ============== [PASSED] ttm_bo_validate_basic ==============
[14:39:24] [PASSED] ttm_bo_validate_invalid_placement
[14:39:24] ============= ttm_bo_validate_same_placement  ==============
[14:39:24] [PASSED] System manager
[14:39:24] [PASSED] VRAM manager
[14:39:24] ========= [PASSED] ttm_bo_validate_same_placement ==========
[14:39:24] [PASSED] ttm_bo_validate_failed_alloc
[14:39:24] [PASSED] ttm_bo_validate_pinned
[14:39:24] [PASSED] ttm_bo_validate_busy_placement
[14:39:24] ================ ttm_bo_validate_multihop  =================
[14:39:24] [PASSED] Buffer object for userspace
[14:39:24] [PASSED] Kernel buffer object
[14:39:24] [PASSED] Shared buffer object
[14:39:24] ============ [PASSED] ttm_bo_validate_multihop =============
[14:39:24] ========== ttm_bo_validate_no_placement_signaled  ==========
[14:39:24] [PASSED] Buffer object in system domain, no page vector
[14:39:24] [PASSED] Buffer object in system domain with an existing page vector
[14:39:24] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[14:39:24] ======== ttm_bo_validate_no_placement_not_signaled  ========
[14:39:24] [PASSED] Buffer object for userspace
[14:39:24] [PASSED] Kernel buffer object
[14:39:24] [PASSED] Shared buffer object
[14:39:24] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[14:39:24] [PASSED] ttm_bo_validate_move_fence_signaled
[14:39:24] ========= ttm_bo_validate_move_fence_not_signaled  =========
[14:39:24] [PASSED] Waits for GPU
[14:39:24] [PASSED] Tries to lock straight away
[14:39:24] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[14:39:24] [PASSED] ttm_bo_validate_swapout
[14:39:24] [PASSED] ttm_bo_validate_happy_evict
[14:39:24] [PASSED] ttm_bo_validate_all_pinned_evict
[14:39:24] [PASSED] ttm_bo_validate_allowed_only_evict
[14:39:24] [PASSED] ttm_bo_validate_deleted_evict
[14:39:24] [PASSED] ttm_bo_validate_busy_domain_evict
[14:39:24] [PASSED] ttm_bo_validate_evict_gutting
[14:39:24] [PASSED] ttm_bo_validate_recrusive_evict
[14:39:24] ================= [PASSED] ttm_bo_validate =================
[14:39:24] ============================================================
[14:39:24] Testing complete. Ran 102 tests: passed: 102
[14:39:24] Elapsed time: 11.872s total, 1.833s configuring, 9.825s building, 0.181s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[14:39:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:39:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:39:35] Starting KUnit Kernel (1/1)...
[14:39:35] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:39:35] =============== dma-buf-fence (12 subtests) ================
[14:39:35] [PASSED] test_sanitycheck
[14:39:35] [PASSED] test_signaling
[14:39:35] [PASSED] test_add_callback
[14:39:35] [PASSED] test_late_add_callback
[14:39:35] [PASSED] test_rm_callback
[14:39:35] [PASSED] test_late_rm_callback
[14:39:35] [PASSED] test_status
[14:39:35] [PASSED] test_error
[14:39:35] [PASSED] test_wait
[14:39:35] [PASSED] test_wait_timeout
[14:39:35] [PASSED] test_stub
[14:39:35] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[14:39:35] ================== [PASSED] dma-buf-fence ==================
[14:39:35] ============ dma-buf-fence-chain (11 subtests) =============
[14:39:35] [PASSED] test_sanitycheck
[14:39:35] [PASSED] test_find_seqno
[14:39:35] [PASSED] test_find_signaled
[14:39:35] [PASSED] test_find_out_of_order
[14:39:40] [PASSED] test_find_gap
[14:39:40] [PASSED] test_find_race
[14:39:40] [PASSED] test_signal_forward
[14:39:40] [PASSED] test_signal_backward
[14:39:40] [PASSED] test_wait_forward
[14:39:40] [PASSED] test_wait_backward
[14:39:40] [PASSED] test_wait_random
[14:39:40] =============== [PASSED] dma-buf-fence-chain ===============
[14:39:40] ============ dma-buf-fence-unwrap (10 subtests) ============
[14:39:40] [PASSED] test_sanitycheck
[14:39:40] [PASSED] test_unwrap_array
[14:39:40] [PASSED] test_unwrap_chain
[14:39:40] [PASSED] test_unwrap_chain_array
[14:39:40] [PASSED] test_unwrap_merge
[14:39:40] [PASSED] test_unwrap_merge_duplicate
[14:39:40] [PASSED] test_unwrap_merge_seqno
[14:39:40] [PASSED] test_unwrap_merge_order
[14:39:40] [PASSED] test_unwrap_merge_complex
[14:39:40] [PASSED] test_unwrap_merge_complex_seqno
[14:39:40] ============== [PASSED] dma-buf-fence-unwrap ===============
[14:39:40] ================ dma-buf-resv (5 subtests) =================
[14:39:40] [PASSED] test_sanitycheck
[14:39:40] ===================== test_signaling  ======================
[14:39:40] [PASSED] kernel
[14:39:40] [PASSED] write
[14:39:40] [PASSED] read
[14:39:40] [PASSED] bookkeep
[14:39:40] ================= [PASSED] test_signaling ==================
[14:39:40] ====================== test_for_each  ======================
[14:39:40] [PASSED] kernel
[14:39:40] [PASSED] write
[14:39:40] [PASSED] read
[14:39:40] [PASSED] bookkeep
[14:39:40] ================== [PASSED] test_for_each ==================
[14:39:40] ================= test_for_each_unlocked  ==================
[14:39:40] [PASSED] kernel
[14:39:40] [PASSED] write
[14:39:40] [PASSED] read
[14:39:40] [PASSED] bookkeep
[14:39:40] ============= [PASSED] test_for_each_unlocked ==============
[14:39:40] ===================== test_get_fences  =====================
[14:39:40] [PASSED] kernel
[14:39:40] [PASSED] write
[14:39:40] [PASSED] read
[14:39:40] [PASSED] bookkeep
[14:39:40] ================= [PASSED] test_get_fences =================
[14:39:40] ================== [PASSED] dma-buf-resv ===================
[14:39:40] ============================================================
[14:39:40] Testing complete. Ran 50 tests: passed: 49, skipped: 1
[14:39:40] Elapsed time: 15.855s total, 1.873s configuring, 8.710s building, 5.270s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


