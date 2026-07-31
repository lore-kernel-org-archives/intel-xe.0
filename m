Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD450C5516F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 23:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B7610E26D;
	Fri, 31 Jul 2026 23:33:22 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BB710E26D;
 Fri, 31 Jul 2026 23:33:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/multi=5Fqueue=3A_Handle?=
 =?utf-8?q?_lost_message_during_VF_migration_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jul 2026 23:33:21 -0000
Message-ID: <178554080155.11584.1724412330895383927@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe/multi_queue: Handle lost message during VF migration (rev3)
URL   : https://patchwork.freedesktop.org/series/165324/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[23:32:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:32:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:32:37] Starting KUnit Kernel (1/1)...
[23:32:37] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:32:37] ================== guc_buf (11 subtests) ===================
[23:32:37] [PASSED] test_smallest
[23:32:37] [PASSED] test_largest
[23:32:37] [PASSED] test_granular
[23:32:37] [PASSED] test_unique
[23:32:37] [PASSED] test_overlap
[23:32:37] [PASSED] test_reusable
[23:32:37] [PASSED] test_too_big
[23:32:37] [PASSED] test_flush
[23:32:37] [PASSED] test_lookup
[23:32:37] [PASSED] test_data
[23:32:37] [PASSED] test_class
[23:32:37] ===================== [PASSED] guc_buf =====================
[23:32:37] =================== guc_dbm (7 subtests) ===================
[23:32:37] [PASSED] test_empty
[23:32:37] [PASSED] test_default
[23:32:37] ======================== test_size  ========================
[23:32:37] [PASSED] 4
[23:32:37] [PASSED] 8
[23:32:37] [PASSED] 32
[23:32:37] [PASSED] 256
[23:32:37] ==================== [PASSED] test_size ====================
[23:32:37] ======================= test_reuse  ========================
[23:32:37] [PASSED] 4
[23:32:37] [PASSED] 8
[23:32:37] [PASSED] 32
[23:32:37] [PASSED] 256
[23:32:37] =================== [PASSED] test_reuse ====================
[23:32:37] =================== test_range_overlap  ====================
[23:32:37] [PASSED] 4
[23:32:37] [PASSED] 8
[23:32:37] [PASSED] 32
[23:32:37] [PASSED] 256
[23:32:37] =============== [PASSED] test_range_overlap ================
[23:32:37] =================== test_range_compact  ====================
[23:32:37] [PASSED] 4
[23:32:37] [PASSED] 8
[23:32:37] [PASSED] 32
[23:32:37] [PASSED] 256
[23:32:37] =============== [PASSED] test_range_compact ================
[23:32:37] ==================== test_range_spare  =====================
[23:32:37] [PASSED] 4
[23:32:37] [PASSED] 8
[23:32:37] [PASSED] 32
[23:32:37] [PASSED] 256
[23:32:37] ================ [PASSED] test_range_spare =================
[23:32:37] ===================== [PASSED] guc_dbm =====================
[23:32:37] =================== guc_idm (6 subtests) ===================
[23:32:37] [PASSED] bad_init
[23:32:37] [PASSED] no_init
[23:32:37] [PASSED] init_fini
[23:32:37] [PASSED] check_used
[23:32:37] [PASSED] check_quota
[23:32:37] [PASSED] check_all
[23:32:37] ===================== [PASSED] guc_idm =====================
[23:32:37] =============== guc_klv_helpers (9 subtests) ===============
[23:32:37] [PASSED] test_count
[23:32:37] [PASSED] test_encode_u32
[23:32:37] [PASSED] test_encode_u64
[23:32:37] [PASSED] test_encode_string
[23:32:37] [PASSED] test_encode_object_raw
[23:32:37] [PASSED] test_encode_object_klv
[23:32:37] [PASSED] test_encode_object_nested
[23:32:37] [PASSED] test_encode_object_basic
[23:32:37] [PASSED] test_print
[23:32:37] ================= [PASSED] guc_klv_helpers =================
[23:32:37] ================== no_relay (3 subtests) ===================
[23:32:37] [PASSED] xe_drops_guc2pf_if_not_ready
[23:32:37] [PASSED] xe_drops_guc2vf_if_not_ready
[23:32:37] [PASSED] xe_rejects_send_if_not_ready
[23:32:37] ==================== [PASSED] no_relay =====================
[23:32:37] ================== pf_relay (14 subtests) ==================
[23:32:37] [PASSED] pf_rejects_guc2pf_too_short
[23:32:37] [PASSED] pf_rejects_guc2pf_too_long
[23:32:37] [PASSED] pf_rejects_guc2pf_no_payload
[23:32:37] [PASSED] pf_fails_no_payload
[23:32:37] [PASSED] pf_fails_bad_origin
[23:32:37] [PASSED] pf_fails_bad_type
[23:32:37] [PASSED] pf_txn_reports_error
[23:32:37] [PASSED] pf_txn_sends_pf2guc
[23:32:37] [PASSED] pf_sends_pf2guc
[23:32:37] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:32:37] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:32:37] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:32:37] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:32:37] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:32:37] ==================== [PASSED] pf_relay =====================
[23:32:37] ================== vf_relay (3 subtests) ===================
[23:32:37] [PASSED] vf_rejects_guc2vf_too_short
[23:32:37] [PASSED] vf_rejects_guc2vf_too_long
[23:32:37] [PASSED] vf_rejects_guc2vf_no_payload
[23:32:37] ==================== [PASSED] vf_relay =====================
[23:32:37] ================ pf_gt_config (9 subtests) =================
[23:32:37] [PASSED] fair_contexts_1vf
[23:32:37] [PASSED] fair_doorbells_1vf
[23:32:37] [PASSED] fair_ggtt_1vf
[23:32:37] ====================== fair_vram_1vf  ======================
[23:32:37] [PASSED] 3.50 GiB
[23:32:37] [PASSED] 11.5 GiB
[23:32:37] [PASSED] 15.5 GiB
[23:32:37] [PASSED] 31.5 GiB
[23:32:37] [PASSED] 63.5 GiB
[23:32:37] [PASSED] 1.91 GiB
[23:32:37] ================== [PASSED] fair_vram_1vf ==================
[23:32:37] ================ fair_vram_1vf_admin_only  =================
[23:32:37] [PASSED] 3.50 GiB
[23:32:37] [PASSED] 11.5 GiB
[23:32:37] [PASSED] 15.5 GiB
[23:32:37] [PASSED] 31.5 GiB
[23:32:37] [PASSED] 63.5 GiB
[23:32:37] [PASSED] 1.91 GiB
[23:32:37] ============ [PASSED] fair_vram_1vf_admin_only =============
[23:32:37] ====================== fair_contexts  ======================
[23:32:37] [PASSED] 1 VF
[23:32:37] [PASSED] 2 VFs
[23:32:37] [PASSED] 3 VFs
[23:32:37] [PASSED] 4 VFs
[23:32:37] [PASSED] 5 VFs
[23:32:37] [PASSED] 6 VFs
[23:32:37] [PASSED] 7 VFs
[23:32:37] [PASSED] 8 VFs
[23:32:37] [PASSED] 9 VFs
[23:32:37] [PASSED] 10 VFs
[23:32:37] [PASSED] 11 VFs
[23:32:37] [PASSED] 12 VFs
[23:32:37] [PASSED] 13 VFs
[23:32:37] [PASSED] 14 VFs
[23:32:37] [PASSED] 15 VFs
[23:32:37] [PASSED] 16 VFs
[23:32:37] [PASSED] 17 VFs
[23:32:37] [PASSED] 18 VFs
[23:32:37] [PASSED] 19 VFs
[23:32:37] [PASSED] 20 VFs
[23:32:37] [PASSED] 21 VFs
[23:32:37] [PASSED] 22 VFs
[23:32:37] [PASSED] 23 VFs
[23:32:37] [PASSED] 24 VFs
[23:32:37] [PASSED] 25 VFs
[23:32:37] [PASSED] 26 VFs
[23:32:37] [PASSED] 27 VFs
[23:32:37] [PASSED] 28 VFs
[23:32:37] [PASSED] 29 VFs
[23:32:37] [PASSED] 30 VFs
[23:32:37] [PASSED] 31 VFs
[23:32:37] [PASSED] 32 VFs
[23:32:37] [PASSED] 33 VFs
[23:32:37] [PASSED] 34 VFs
[23:32:37] [PASSED] 35 VFs
[23:32:37] [PASSED] 36 VFs
[23:32:37] [PASSED] 37 VFs
[23:32:37] [PASSED] 38 VFs
[23:32:37] [PASSED] 39 VFs
[23:32:37] [PASSED] 40 VFs
[23:32:37] [PASSED] 41 VFs
[23:32:37] [PASSED] 42 VFs
[23:32:37] [PASSED] 43 VFs
[23:32:37] [PASSED] 44 VFs
[23:32:37] [PASSED] 45 VFs
[23:32:37] [PASSED] 46 VFs
[23:32:37] [PASSED] 47 VFs
[23:32:37] [PASSED] 48 VFs
[23:32:37] [PASSED] 49 VFs
[23:32:37] [PASSED] 50 VFs
[23:32:37] [PASSED] 51 VFs
[23:32:37] [PASSED] 52 VFs
[23:32:37] [PASSED] 53 VFs
[23:32:37] [PASSED] 54 VFs
[23:32:37] [PASSED] 55 VFs
[23:32:37] [PASSED] 56 VFs
[23:32:37] [PASSED] 57 VFs
[23:32:37] [PASSED] 58 VFs
[23:32:37] [PASSED] 59 VFs
[23:32:37] [PASSED] 60 VFs
[23:32:37] [PASSED] 61 VFs
[23:32:37] [PASSED] 62 VFs
[23:32:37] [PASSED] 63 VFs
[23:32:37] ================== [PASSED] fair_contexts ==================
[23:32:37] ===================== fair_doorbells  ======================
[23:32:37] [PASSED] 1 VF
[23:32:37] [PASSED] 2 VFs
[23:32:37] [PASSED] 3 VFs
[23:32:37] [PASSED] 4 VFs
[23:32:37] [PASSED] 5 VFs
[23:32:37] [PASSED] 6 VFs
[23:32:37] [PASSED] 7 VFs
[23:32:37] [PASSED] 8 VFs
[23:32:37] [PASSED] 9 VFs
[23:32:37] [PASSED] 10 VFs
[23:32:37] [PASSED] 11 VFs
[23:32:37] [PASSED] 12 VFs
[23:32:37] [PASSED] 13 VFs
[23:32:37] [PASSED] 14 VFs
[23:32:37] [PASSED] 15 VFs
[23:32:37] [PASSED] 16 VFs
[23:32:37] [PASSED] 17 VFs
[23:32:37] [PASSED] 18 VFs
[23:32:37] [PASSED] 19 VFs
[23:32:37] [PASSED] 20 VFs
[23:32:37] [PASSED] 21 VFs
[23:32:37] [PASSED] 22 VFs
[23:32:37] [PASSED] 23 VFs
[23:32:37] [PASSED] 24 VFs
[23:32:37] [PASSED] 25 VFs
[23:32:37] [PASSED] 26 VFs
[23:32:37] [PASSED] 27 VFs
[23:32:37] [PASSED] 28 VFs
[23:32:37] [PASSED] 29 VFs
[23:32:37] [PASSED] 30 VFs
[23:32:37] [PASSED] 31 VFs
[23:32:37] [PASSED] 32 VFs
[23:32:37] [PASSED] 33 VFs
[23:32:37] [PASSED] 34 VFs
[23:32:37] [PASSED] 35 VFs
[23:32:37] [PASSED] 36 VFs
[23:32:37] [PASSED] 37 VFs
[23:32:37] [PASSED] 38 VFs
[23:32:37] [PASSED] 39 VFs
[23:32:37] [PASSED] 40 VFs
[23:32:37] [PASSED] 41 VFs
[23:32:37] [PASSED] 42 VFs
[23:32:37] [PASSED] 43 VFs
[23:32:37] [PASSED] 44 VFs
[23:32:37] [PASSED] 45 VFs
[23:32:37] [PASSED] 46 VFs
[23:32:37] [PASSED] 47 VFs
[23:32:37] [PASSED] 48 VFs
[23:32:37] [PASSED] 49 VFs
[23:32:37] [PASSED] 50 VFs
[23:32:37] [PASSED] 51 VFs
[23:32:37] [PASSED] 52 VFs
[23:32:37] [PASSED] 53 VFs
[23:32:37] [PASSED] 54 VFs
[23:32:37] [PASSED] 55 VFs
[23:32:37] [PASSED] 56 VFs
[23:32:37] [PASSED] 57 VFs
[23:32:37] [PASSED] 58 VFs
[23:32:37] [PASSED] 59 VFs
[23:32:37] [PASSED] 60 VFs
[23:32:37] [PASSED] 61 VFs
[23:32:37] [PASSED] 62 VFs
[23:32:37] [PASSED] 63 VFs
[23:32:37] ================= [PASSED] fair_doorbells ==================
[23:32:37] ======================== fair_ggtt  ========================
[23:32:37] [PASSED] 1 VF
[23:32:37] [PASSED] 2 VFs
[23:32:37] [PASSED] 3 VFs
[23:32:37] [PASSED] 4 VFs
[23:32:37] [PASSED] 5 VFs
[23:32:37] [PASSED] 6 VFs
[23:32:37] [PASSED] 7 VFs
[23:32:37] [PASSED] 8 VFs
[23:32:37] [PASSED] 9 VFs
[23:32:37] [PASSED] 10 VFs
[23:32:37] [PASSED] 11 VFs
[23:32:37] [PASSED] 12 VFs
[23:32:37] [PASSED] 13 VFs
[23:32:37] [PASSED] 14 VFs
[23:32:37] [PASSED] 15 VFs
[23:32:37] [PASSED] 16 VFs
[23:32:37] [PASSED] 17 VFs
[23:32:37] [PASSED] 18 VFs
[23:32:37] [PASSED] 19 VFs
[23:32:37] [PASSED] 20 VFs
[23:32:37] [PASSED] 21 VFs
[23:32:37] [PASSED] 22 VFs
[23:32:37] [PASSED] 23 VFs
[23:32:37] [PASSED] 24 VFs
[23:32:37] [PASSED] 25 VFs
[23:32:37] [PASSED] 26 VFs
[23:32:37] [PASSED] 27 VFs
[23:32:38] [PASSED] 28 VFs
[23:32:38] [PASSED] 29 VFs
[23:32:38] [PASSED] 30 VFs
[23:32:38] [PASSED] 31 VFs
[23:32:38] [PASSED] 32 VFs
[23:32:38] [PASSED] 33 VFs
[23:32:38] [PASSED] 34 VFs
[23:32:38] [PASSED] 35 VFs
[23:32:38] [PASSED] 36 VFs
[23:32:38] [PASSED] 37 VFs
[23:32:38] [PASSED] 38 VFs
[23:32:38] [PASSED] 39 VFs
[23:32:38] [PASSED] 40 VFs
[23:32:38] [PASSED] 41 VFs
[23:32:38] [PASSED] 42 VFs
[23:32:38] [PASSED] 43 VFs
[23:32:38] [PASSED] 44 VFs
[23:32:38] [PASSED] 45 VFs
[23:32:38] [PASSED] 46 VFs
[23:32:38] [PASSED] 47 VFs
[23:32:38] [PASSED] 48 VFs
[23:32:38] [PASSED] 49 VFs
[23:32:38] [PASSED] 50 VFs
[23:32:38] [PASSED] 51 VFs
[23:32:38] [PASSED] 52 VFs
[23:32:38] [PASSED] 53 VFs
[23:32:38] [PASSED] 54 VFs
[23:32:38] [PASSED] 55 VFs
[23:32:38] [PASSED] 56 VFs
[23:32:38] [PASSED] 57 VFs
[23:32:38] [PASSED] 58 VFs
[23:32:38] [PASSED] 59 VFs
[23:32:38] [PASSED] 60 VFs
[23:32:38] [PASSED] 61 VFs
[23:32:38] [PASSED] 62 VFs
[23:32:38] [PASSED] 63 VFs
[23:32:38] ==================== [PASSED] fair_ggtt ====================
[23:32:38] ======================== fair_vram  ========================
[23:32:38] [PASSED] 1 VF
[23:32:38] [PASSED] 2 VFs
[23:32:38] [PASSED] 3 VFs
[23:32:38] [PASSED] 4 VFs
[23:32:38] [PASSED] 5 VFs
[23:32:38] [PASSED] 6 VFs
[23:32:38] [PASSED] 7 VFs
[23:32:38] [PASSED] 8 VFs
[23:32:38] [PASSED] 9 VFs
[23:32:38] [PASSED] 10 VFs
[23:32:38] [PASSED] 11 VFs
[23:32:38] [PASSED] 12 VFs
[23:32:38] [PASSED] 13 VFs
[23:32:38] [PASSED] 14 VFs
[23:32:38] [PASSED] 15 VFs
[23:32:38] [PASSED] 16 VFs
[23:32:38] [PASSED] 17 VFs
[23:32:38] [PASSED] 18 VFs
[23:32:38] [PASSED] 19 VFs
[23:32:38] [PASSED] 20 VFs
[23:32:38] [PASSED] 21 VFs
[23:32:38] [PASSED] 22 VFs
[23:32:38] [PASSED] 23 VFs
[23:32:38] [PASSED] 24 VFs
[23:32:38] [PASSED] 25 VFs
[23:32:38] [PASSED] 26 VFs
[23:32:38] [PASSED] 27 VFs
[23:32:38] [PASSED] 28 VFs
[23:32:38] [PASSED] 29 VFs
[23:32:38] [PASSED] 30 VFs
[23:32:38] [PASSED] 31 VFs
[23:32:38] [PASSED] 32 VFs
[23:32:38] [PASSED] 33 VFs
[23:32:38] [PASSED] 34 VFs
[23:32:38] [PASSED] 35 VFs
[23:32:38] [PASSED] 36 VFs
[23:32:38] [PASSED] 37 VFs
[23:32:38] [PASSED] 38 VFs
[23:32:38] [PASSED] 39 VFs
[23:32:38] [PASSED] 40 VFs
[23:32:38] [PASSED] 41 VFs
[23:32:38] [PASSED] 42 VFs
[23:32:38] [PASSED] 43 VFs
[23:32:38] [PASSED] 44 VFs
[23:32:38] [PASSED] 45 VFs
[23:32:38] [PASSED] 46 VFs
[23:32:38] [PASSED] 47 VFs
[23:32:38] [PASSED] 48 VFs
[23:32:38] [PASSED] 49 VFs
[23:32:38] [PASSED] 50 VFs
[23:32:38] [PASSED] 51 VFs
[23:32:38] [PASSED] 52 VFs
[23:32:38] [PASSED] 53 VFs
[23:32:38] [PASSED] 54 VFs
[23:32:38] [PASSED] 55 VFs
[23:32:38] [PASSED] 56 VFs
[23:32:38] [PASSED] 57 VFs
[23:32:38] [PASSED] 58 VFs
[23:32:38] [PASSED] 59 VFs
[23:32:38] [PASSED] 60 VFs
[23:32:38] [PASSED] 61 VFs
[23:32:38] [PASSED] 62 VFs
[23:32:38] [PASSED] 63 VFs
[23:32:38] ==================== [PASSED] fair_vram ====================
[23:32:38] ================== [PASSED] pf_gt_config ===================
[23:32:38] ===================== lmtt (1 subtest) =====================
[23:32:38] ======================== test_ops  =========================
[23:32:38] [PASSED] 2-level
[23:32:38] [PASSED] multi-level
[23:32:38] ==================== [PASSED] test_ops =====================
[23:32:38] ====================== [PASSED] lmtt =======================
[23:32:38] ================= sriov_packet (1 subtest) =================
[23:32:38] [PASSED] test_descriptor_init
[23:32:38] ================== [PASSED] sriov_packet ===================
[23:32:38] ================= pf_service (11 subtests) =================
[23:32:38] [PASSED] pf_negotiate_any
[23:32:38] [PASSED] pf_negotiate_base_match
[23:32:38] [PASSED] pf_negotiate_base_newer
[23:32:38] [PASSED] pf_negotiate_base_next
[23:32:38] [SKIPPED] pf_negotiate_base_older (no older minor)
[23:32:38] [PASSED] pf_negotiate_base_prev
[23:32:38] [PASSED] pf_negotiate_latest_match
[23:32:38] [PASSED] pf_negotiate_latest_newer
[23:32:38] [PASSED] pf_negotiate_latest_next
[23:32:38] [SKIPPED] pf_negotiate_latest_older (no older minor)
[23:32:38] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[23:32:38] =================== [PASSED] pf_service ====================
[23:32:38] ================= xe_guc_g2g (2 subtests) ==================
[23:32:38] ============== xe_live_guc_g2g_kunit_default  ==============
[23:32:38] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[23:32:38] ============== xe_live_guc_g2g_kunit_allmem  ===============
[23:32:38] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[23:32:38] =================== [SKIPPED] xe_guc_g2g ===================
[23:32:38] =================== xe_mocs (2 subtests) ===================
[23:32:38] ================ xe_live_mocs_kernel_kunit  ================
[23:32:38] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[23:32:38] ================ xe_live_mocs_reset_kunit  =================
[23:32:38] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[23:32:38] ==================== [SKIPPED] xe_mocs =====================
[23:32:38] ================= xe_migrate (2 subtests) ==================
[23:32:38] ================= xe_migrate_sanity_kunit  =================
[23:32:38] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[23:32:38] ================== xe_validate_ccs_kunit  ==================
[23:32:38] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[23:32:38] =================== [SKIPPED] xe_migrate ===================
[23:32:38] ================== xe_dma_buf (1 subtest) ==================
[23:32:38] ==================== xe_dma_buf_kunit  =====================
[23:32:38] ================ [SKIPPED] xe_dma_buf_kunit ================
[23:32:38] =================== [SKIPPED] xe_dma_buf ===================
[23:32:38] ================= xe_bo_shrink (1 subtest) =================
[23:32:38] =================== xe_bo_shrink_kunit  ====================
[23:32:38] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[23:32:38] ================== [SKIPPED] xe_bo_shrink ==================
[23:32:38] ==================== xe_bo (2 subtests) ====================
[23:32:38] ================== xe_ccs_migrate_kunit  ===================
[23:32:38] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[23:32:38] ==================== xe_bo_evict_kunit  ====================
[23:32:38] =============== [SKIPPED] xe_bo_evict_kunit ================
[23:32:38] ===================== [SKIPPED] xe_bo ======================
[23:32:38] ==================== args (13 subtests) ====================
[23:32:38] [PASSED] count_args_test
[23:32:38] [PASSED] call_args_example
[23:32:38] [PASSED] call_args_test
[23:32:38] [PASSED] drop_first_arg_example
[23:32:38] [PASSED] drop_first_arg_test
[23:32:38] [PASSED] first_arg_example
[23:32:38] [PASSED] first_arg_test
[23:32:38] [PASSED] last_arg_example
[23:32:38] [PASSED] last_arg_test
[23:32:38] [PASSED] pick_arg_example
[23:32:38] [PASSED] if_args_example
[23:32:38] [PASSED] if_args_test
[23:32:38] [PASSED] sep_comma_example
[23:32:38] ====================== [PASSED] args =======================
[23:32:38] =================== xe_pci (3 subtests) ====================
[23:32:38] ==================== check_graphics_ip  ====================
[23:32:38] [PASSED] 12.00 Xe_LP
[23:32:38] [PASSED] 12.10 Xe_LP+
[23:32:38] [PASSED] 12.55 Xe_HPG
[23:32:38] [PASSED] 12.60 Xe_HPC
[23:32:38] [PASSED] 12.70 Xe_LPG
[23:32:38] [PASSED] 12.71 Xe_LPG
[23:32:38] [PASSED] 12.74 Xe_LPG+
[23:32:38] [PASSED] 20.01 Xe2_HPG
[23:32:38] [PASSED] 20.02 Xe2_HPG
[23:32:38] [PASSED] 20.04 Xe2_LPG
[23:32:38] [PASSED] 30.00 Xe3_LPG
[23:32:38] [PASSED] 30.01 Xe3_LPG
[23:32:38] [PASSED] 30.03 Xe3_LPG
[23:32:38] [PASSED] 30.04 Xe3_LPG
[23:32:38] [PASSED] 30.05 Xe3_LPG
[23:32:38] [PASSED] 35.10 Xe3p_LPG
[23:32:38] [PASSED] 35.11 Xe3p_XPC
[23:32:38] ================ [PASSED] check_graphics_ip ================
[23:32:38] ===================== check_media_ip  ======================
[23:32:38] [PASSED] 12.00 Xe_M
[23:32:38] [PASSED] 12.55 Xe_HPM
[23:32:38] [PASSED] 13.00 Xe_LPM+
[23:32:38] [PASSED] 13.01 Xe2_HPM
[23:32:38] [PASSED] 20.00 Xe2_LPM
[23:32:38] [PASSED] 30.00 Xe3_LPM
[23:32:38] [PASSED] 30.02 Xe3_LPM
[23:32:38] [PASSED] 35.00 Xe3p_LPM
[23:32:38] [PASSED] 35.03 Xe3p_HPM
[23:32:38] ================= [PASSED] check_media_ip ==================
[23:32:38] =================== check_platform_desc  ===================
[23:32:38] [PASSED] 0x9A60 (TIGERLAKE)
[23:32:38] [PASSED] 0x9A68 (TIGERLAKE)
[23:32:38] [PASSED] 0x9A70 (TIGERLAKE)
[23:32:38] [PASSED] 0x9A40 (TIGERLAKE)
[23:32:38] [PASSED] 0x9A49 (TIGERLAKE)
[23:32:38] [PASSED] 0x9A59 (TIGERLAKE)
[23:32:38] [PASSED] 0x9A78 (TIGERLAKE)
[23:32:38] [PASSED] 0x9AC0 (TIGERLAKE)
[23:32:38] [PASSED] 0x9AC9 (TIGERLAKE)
[23:32:38] [PASSED] 0x9AD9 (TIGERLAKE)
[23:32:38] [PASSED] 0x9AF8 (TIGERLAKE)
[23:32:38] [PASSED] 0x4C80 (ROCKETLAKE)
[23:32:38] [PASSED] 0x4C8A (ROCKETLAKE)
[23:32:38] [PASSED] 0x4C8B (ROCKETLAKE)
[23:32:38] [PASSED] 0x4C8C (ROCKETLAKE)
[23:32:38] [PASSED] 0x4C90 (ROCKETLAKE)
[23:32:38] [PASSED] 0x4C9A (ROCKETLAKE)
[23:32:38] [PASSED] 0x4680 (ALDERLAKE_S)
[23:32:38] [PASSED] 0x4682 (ALDERLAKE_S)
[23:32:38] [PASSED] 0x4688 (ALDERLAKE_S)
[23:32:38] [PASSED] 0x468A (ALDERLAKE_S)
[23:32:38] [PASSED] 0x468B (ALDERLAKE_S)
[23:32:38] [PASSED] 0x4690 (ALDERLAKE_S)
[23:32:38] [PASSED] 0x4692 (ALDERLAKE_S)
[23:32:38] [PASSED] 0x4693 (ALDERLAKE_S)
[23:32:38] [PASSED] 0x46A0 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46A1 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46A2 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46A3 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46A6 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46A8 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46AA (ALDERLAKE_P)
[23:32:38] [PASSED] 0x462A (ALDERLAKE_P)
[23:32:38] [PASSED] 0x4626 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x4628 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46B0 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46B1 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46B2 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46B3 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46C0 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46C1 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46C2 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46C3 (ALDERLAKE_P)
[23:32:38] [PASSED] 0x46D0 (ALDERLAKE_N)
[23:32:38] [PASSED] 0x46D1 (ALDERLAKE_N)
[23:32:38] [PASSED] 0x46D2 (ALDERLAKE_N)
[23:32:38] [PASSED] 0x46D3 (ALDERLAKE_N)
[23:32:38] [PASSED] 0x46D4 (ALDERLAKE_N)
[23:32:38] [PASSED] 0xA721 (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7A1 (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7A9 (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7AC (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7AD (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA720 (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7A0 (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7A8 (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7AA (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA7AB (ALDERLAKE_P)
[23:32:38] [PASSED] 0xA780 (ALDERLAKE_S)
[23:32:38] [PASSED] 0xA781 (ALDERLAKE_S)
[23:32:38] [PASSED] 0xA782 (ALDERLAKE_S)
[23:32:38] [PASSED] 0xA783 (ALDERLAKE_S)
[23:32:38] [PASSED] 0xA788 (ALDERLAKE_S)
[23:32:38] [PASSED] 0xA789 (ALDERLAKE_S)
[23:32:38] [PASSED] 0xA78A (ALDERLAKE_S)
[23:32:38] [PASSED] 0xA78B (ALDERLAKE_S)
[23:32:38] [PASSED] 0x4905 (DG1)
[23:32:38] [PASSED] 0x4906 (DG1)
[23:32:38] [PASSED] 0x4907 (DG1)
[23:32:38] [PASSED] 0x4908 (DG1)
[23:32:38] [PASSED] 0x4909 (DG1)
[23:32:38] [PASSED] 0x56C0 (DG2)
[23:32:38] [PASSED] 0x56C2 (DG2)
[23:32:38] [PASSED] 0x56C1 (DG2)
[23:32:38] [PASSED] 0x7D51 (METEORLAKE)
[23:32:38] [PASSED] 0x7DD1 (METEORLAKE)
[23:32:38] [PASSED] 0x7D41 (METEORLAKE)
[23:32:38] [PASSED] 0x7D67 (METEORLAKE)
[23:32:38] [PASSED] 0xB640 (METEORLAKE)
[23:32:38] [PASSED] 0x56A0 (DG2)
[23:32:38] [PASSED] 0x56A1 (DG2)
[23:32:38] [PASSED] 0x56A2 (DG2)
[23:32:38] [PASSED] 0x56BE (DG2)
[23:32:38] [PASSED] 0x56BF (DG2)
[23:32:38] [PASSED] 0x5690 (DG2)
[23:32:38] [PASSED] 0x5691 (DG2)
[23:32:38] [PASSED] 0x5692 (DG2)
[23:32:38] [PASSED] 0x56A5 (DG2)
[23:32:38] [PASSED] 0x56A6 (DG2)
[23:32:38] [PASSED] 0x56B0 (DG2)
[23:32:38] [PASSED] 0x56B1 (DG2)
[23:32:38] [PASSED] 0x56BA (DG2)
[23:32:38] [PASSED] 0x56BB (DG2)
[23:32:38] [PASSED] 0x56BC (DG2)
[23:32:38] [PASSED] 0x56BD (DG2)
[23:32:38] [PASSED] 0x5693 (DG2)
[23:32:38] [PASSED] 0x5694 (DG2)
[23:32:38] [PASSED] 0x5695 (DG2)
[23:32:38] [PASSED] 0x56A3 (DG2)
[23:32:38] [PASSED] 0x56A4 (DG2)
[23:32:38] [PASSED] 0x56B2 (DG2)
[23:32:38] [PASSED] 0x56B3 (DG2)
[23:32:38] [PASSED] 0x5696 (DG2)
[23:32:38] [PASSED] 0x5697 (DG2)
[23:32:38] [PASSED] 0xB69 (PVC)
[23:32:38] [PASSED] 0xB6E (PVC)
[23:32:38] [PASSED] 0xBD4 (PVC)
[23:32:38] [PASSED] 0xBD5 (PVC)
[23:32:38] [PASSED] 0xBD6 (PVC)
[23:32:38] [PASSED] 0xBD7 (PVC)
[23:32:38] [PASSED] 0xBD8 (PVC)
[23:32:38] [PASSED] 0xBD9 (PVC)
[23:32:38] [PASSED] 0xBDA (PVC)
[23:32:38] [PASSED] 0xBDB (PVC)
[23:32:38] [PASSED] 0xBE0 (PVC)
[23:32:38] [PASSED] 0xBE1 (PVC)
[23:32:38] [PASSED] 0xBE5 (PVC)
[23:32:38] [PASSED] 0x7D40 (METEORLAKE)
[23:32:38] [PASSED] 0x7D45 (METEORLAKE)
[23:32:38] [PASSED] 0x7D55 (METEORLAKE)
[23:32:38] [PASSED] 0x7D60 (METEORLAKE)
[23:32:38] [PASSED] 0x7DD5 (METEORLAKE)
[23:32:38] [PASSED] 0x6420 (LUNARLAKE)
[23:32:38] [PASSED] 0x64A0 (LUNARLAKE)
[23:32:38] [PASSED] 0x64B0 (LUNARLAKE)
[23:32:38] [PASSED] 0xE202 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE209 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE20B (BATTLEMAGE)
[23:32:38] [PASSED] 0xE20C (BATTLEMAGE)
[23:32:38] [PASSED] 0xE20D (BATTLEMAGE)
[23:32:38] [PASSED] 0xE210 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE211 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE212 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE216 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE220 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE221 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE222 (BATTLEMAGE)
[23:32:38] [PASSED] 0xE223 (BATTLEMAGE)
[23:32:38] [PASSED] 0xB080 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB081 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB082 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB083 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB084 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB085 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB086 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB087 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB08F (PANTHERLAKE)
[23:32:38] [PASSED] 0xB090 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB0A0 (PANTHERLAKE)
[23:32:38] [PASSED] 0xB0B0 (PANTHERLAKE)
[23:32:38] [PASSED] 0xFD80 (PANTHERLAKE)
[23:32:38] [PASSED] 0xFD81 (PANTHERLAKE)
[23:32:38] [PASSED] 0xD740 (NOVALAKE_S)
[23:32:38] [PASSED] 0xD741 (NOVALAKE_S)
[23:32:38] [PASSED] 0xD742 (NOVALAKE_S)
[23:32:38] [PASSED] 0xD743 (NOVALAKE_S)
[23:32:38] [PASSED] 0xD745 (NOVALAKE_S)
[23:32:38] [PASSED] 0xD74A (NOVALAKE_S)
[23:32:38] [PASSED] 0xD74B (NOVALAKE_S)
[23:32:38] [PASSED] 0x674C (CRESCENTISLAND)
[23:32:38] [PASSED] 0x674D (CRESCENTISLAND)
[23:32:38] [PASSED] 0x674E (CRESCENTISLAND)
[23:32:38] [PASSED] 0x674F (CRESCENTISLAND)
[23:32:38] [PASSED] 0x6750 (CRESCENTISLAND)
[23:32:38] [PASSED] 0xD750 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD751 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD752 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD753 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD754 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD755 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD756 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD757 (NOVALAKE_P)
[23:32:38] [PASSED] 0xD75F (NOVALAKE_P)
[23:32:38] =============== [PASSED] check_platform_desc ===============
[23:32:38] ===================== [PASSED] xe_pci ======================
[23:32:38] ============= xe_rtp_tables_test (5 subtests) ==============
[23:32:38] ================== xe_rtp_table_gt_test  ===================
[23:32:38] [PASSED] gt_was/14011060649
[23:32:38] [PASSED] gt_was/14011059788
[23:32:38] [PASSED] gt_was/14015795083
[23:32:38] [PASSED] gt_was/16021867713
[23:32:38] [PASSED] gt_was/14019449301
[23:32:38] [PASSED] gt_was/16028005424
[23:32:38] [PASSED] gt_was/14026578760
[23:32:38] [PASSED] gt_was/1409420604
[23:32:38] [PASSED] gt_was/1408615072
[23:32:38] [PASSED] gt_was/22010523718
[23:32:38] [PASSED] gt_was/14011006942
[23:32:38] [PASSED] gt_was/14014830051
[23:32:38] [PASSED] gt_was/18018781329
[23:32:38] [PASSED] gt_was/1509235366
[23:32:38] [PASSED] gt_was/18018781329
[23:32:38] [PASSED] gt_was/16016694945
[23:32:38] [PASSED] gt_was/14018575942
[23:32:38] [PASSED] gt_was/22016670082
[23:32:38] [PASSED] gt_was/22016670082
[23:32:38] [PASSED] gt_was/14017421178
[23:32:38] [PASSED] gt_was/16025250150
[23:32:38] [PASSED] gt_was/14021871409
[23:32:38] [PASSED] gt_was/16021865536
[23:32:38] [PASSED] gt_was/14021486841
[23:32:38] [PASSED] gt_was/14025160223
[23:32:38] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[23:32:38] [PASSED] gt_was/14025635424
[23:32:38] [PASSED] gt_was/16028005424
[23:32:38] ============== [PASSED] xe_rtp_table_gt_test ===============
[23:32:38] ================== xe_rtp_table_gt_test  ===================
[23:32:38] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[23:32:38] [PASSED] gt_tunings/Tuning: 32B Access Enable
[23:32:38] [PASSED] gt_tunings/Tuning: L3 cache
[23:32:38] [PASSED] gt_tunings/Tuning: L3 cache - media
[23:32:38] [PASSED] gt_tunings/Tuning: Compression Overfetch
[23:32:38] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[23:32:38] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[23:32:38] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[23:32:38] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[23:32:38] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[23:32:38] [PASSED] gt_tunings/Tuning: Stateless compression control
[23:32:38] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[23:32:38] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[23:32:38] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[23:32:38] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[23:32:38] ============== [PASSED] xe_rtp_table_gt_test ===============
[23:32:38] ================== xe_rtp_table_oob_test  ==================
[23:32:38] [PASSED] oob_was/1607983814
[23:32:38] [PASSED] oob_was/16010904313
[23:32:38] [PASSED] oob_was/18022495364
[23:32:38] [PASSED] oob_was/22012773006
[23:32:38] [PASSED] oob_was/14014475959
[23:32:38] [PASSED] oob_was/22011391025
[23:32:38] [PASSED] oob_was/22012727170
[23:32:38] [PASSED] oob_was/22012727685
[23:32:38] [PASSED] oob_was/22016596838
[23:32:38] [PASSED] oob_was/18020744125
[23:32:38] [PASSED] oob_was/1409600907
[23:32:38] [PASSED] oob_was/22014953428
[23:32:38] [PASSED] oob_was/16017236439
[23:32:38] [PASSED] oob_was/14019821291
[23:32:38] [PASSED] oob_was/14015076503
[23:32:38] [PASSED] oob_was/14018913170
[23:32:38] [PASSED] oob_was/14018094691
[23:32:38] [PASSED] oob_was/18024947630
[23:32:38] [PASSED] oob_was/16022287689
[23:32:38] [PASSED] oob_was/13011645652
[23:32:38] [PASSED] oob_was/14022293748
[23:32:38] [PASSED] oob_was/22019794406
[23:32:38] [PASSED] oob_was/22019338487
[23:32:38] [PASSED] oob_was/16023588340
[23:32:38] [PASSED] oob_was/14019789679
[23:32:38] [PASSED] oob_was/14022866841
[23:32:38] [PASSED] oob_was/16021333562
[23:32:38] [PASSED] oob_was/14016712196
[23:32:38] [PASSED] oob_was/14015568240
[23:32:38] [PASSED] oob_was/18013179988
[23:32:38] [PASSED] oob_was/1508761755
[23:32:38] [PASSED] oob_was/16023105232
[23:32:38] [PASSED] oob_was/16026508708
[23:32:38] [PASSED] oob_was/14020001231
[23:32:38] [PASSED] oob_was/16023683509
[23:32:38] [PASSED] oob_was/14025515070
[23:32:38] [PASSED] oob_was/15015404425_disable
[23:32:38] [PASSED] oob_was/16026007364
[23:32:38] [PASSED] oob_was/14020316580
[23:32:38] [PASSED] oob_was/14025883347
[23:32:38] [PASSED] oob_was/16029380221
[23:32:38] [PASSED] oob_was/22022079272
[23:32:38] [PASSED] oob_was/16029897822
[23:32:38] [PASSED] oob_was/14027054324
[23:32:38] ============== [PASSED] xe_rtp_table_oob_test ==============
[23:32:38] ================ xe_rtp_table_dev_oob_test  ================
[23:32:38] [PASSED] device_oob_was/22010954014
[23:32:38] [PASSED] device_oob_was/15015404425
[23:32:38] [PASSED] device_oob_was/22019338487_display
[23:32:38] [PASSED] device_oob_was/14022085890
[23:32:38] [PASSED] device_oob_was/14026539277
[23:32:38] [PASSED] device_oob_was/14026633728
[23:32:38] [PASSED] device_oob_was/14026746987
[23:32:38] [PASSED] device_oob_was/14026779378
[23:32:38] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[23:32:38] ========== xe_rtp_table_missing_upper_bound_test  ==========
[23:32:38] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[23:32:38] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[23:32:38] [PASSED] register_whitelist/1806527549
[23:32:38] [PASSED] register_whitelist/allow_read_ctx_timestamp
[23:32:38] [PASSED] register_whitelist/allow_read_queue_timestamp
[23:32:38] [PASSED] register_whitelist/16014440446
[23:32:38] [PASSED] register_whitelist/16017236439
[23:32:38] [PASSED] register_whitelist/16020183090
[23:32:38] [PASSED] register_whitelist/14024997852
[23:32:38] [PASSED] register_whitelist/14024997852
[23:32:38] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[23:32:38] =============== [PASSED] xe_rtp_tables_test ================
[23:32:38] =================== xe_rtp (3 subtests) ====================
[23:32:38] =================== xe_rtp_rules_tests  ====================
[23:32:38] [PASSED] no
[23:32:38] [PASSED] yes
[23:32:38] [PASSED] no-and-no
[23:32:38] [PASSED] no-and-yes
[23:32:38] [PASSED] yes-and-no
[23:32:38] [PASSED] yes-and-yes
[23:32:38] [PASSED] no-or-no
[23:32:38] [PASSED] no-or-yes
[23:32:38] [PASSED] yes-or-no
[23:32:38] [PASSED] yes-or-yes
[23:32:38] [PASSED] no-yes-or-yes-no
[23:32:38] [PASSED] no-yes-or-yes-yes
[23:32:38] [PASSED] yes-yes-or-no-yes
[23:32:38] [PASSED] yes-yes-or-yes-yes
[23:32:38] [PASSED] no-no-or-yes-or-no
[23:32:38] [PASSED] or
[23:32:38] [PASSED] or-yes
[23:32:38] [PASSED] or-no
[23:32:38] [PASSED] yes-or
[23:32:38] [PASSED] no-or
[23:32:38] [PASSED] no-or-or-yes
[23:32:38] [PASSED] yes-or-or-no
[23:32:38] [PASSED] no-or-or-no
[23:32:38] [PASSED] missing-context-engine-class
[23:32:38] [PASSED] missing-context-engine-class-or-yes
[23:32:38] [PASSED] missing-context-engine-class-or-or-yes
[23:32:38] =============== [PASSED] xe_rtp_rules_tests ================
[23:32:38] =============== xe_rtp_process_to_sr_tests  ================
[23:32:38] [PASSED] coalesce-same-reg
[23:32:38] [PASSED] coalesce-same-reg-literal-and-func
[23:32:38] [PASSED] no-match-no-add
[23:32:38] [PASSED] two-regs-two-entries
[23:32:38] [PASSED] clr-one-set-other
[23:32:38] [PASSED] set-field
[23:32:38] [PASSED] conflict-duplicate
[23:32:38] [PASSED] conflict-not-disjoint
[23:32:38] [PASSED] conflict-not-disjoint-literal-and-func
[23:32:38] [PASSED] conflict-reg-type
[23:32:38] [PASSED] bad-mcr-reg-forced-to-regular
[23:32:38] [PASSED] bad-regular-reg-forced-to-mcr
[23:32:38] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[23:32:38] ================== xe_rtp_process_tests  ===================
[23:32:38] [PASSED] active1
[23:32:38] [PASSED] active2
[23:32:38] [PASSED] active-inactive
[23:32:38] [PASSED] inactive-active
[23:32:38] [PASSED] inactive-active-inactive
[23:32:38] [PASSED] inactive-inactive-inactive
[23:32:38] ============== [PASSED] xe_rtp_process_tests ===============
[23:32:38] ===================== [PASSED] xe_rtp ======================
[23:32:38] ==================== xe_wa (1 subtest) =====================
[23:32:38] ======================== xe_wa_gt  =========================
[23:32:38] [PASSED] TIGERLAKE B0
[23:32:38] [PASSED] DG1 A0
[23:32:38] [PASSED] DG1 B0
[23:32:38] [PASSED] ALDERLAKE_S A0
[23:32:38] [PASSED] ALDERLAKE_S B0
[23:32:38] [PASSED] ALDERLAKE_S C0
[23:32:38] [PASSED] ALDERLAKE_S D0
[23:32:38] [PASSED] ALDERLAKE_P A0
[23:32:38] [PASSED] ALDERLAKE_P B0
[23:32:38] [PASSED] ALDERLAKE_P C0
[23:32:38] [PASSED] ALDERLAKE_S RPLS D0
[23:32:38] [PASSED] ALDERLAKE_P RPLU E0
[23:32:38] [PASSED] DG2 G10 C0
[23:32:38] [PASSED] DG2 G11 B1
[23:32:38] [PASSED] DG2 G12 A1
[23:32:38] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[23:32:38] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[23:32:38] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[23:32:38] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[23:32:38] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[23:32:38] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[23:32:38] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[23:32:38] ==================== [PASSED] xe_wa_gt =====================
[23:32:38] ====================== [PASSED] xe_wa ======================
[23:32:38] ============================================================
[23:32:38] Testing complete. Ran 742 tests: passed: 724, skipped: 18
[23:32:38] Elapsed time: 36.624s total, 4.420s configuring, 31.538s building, 0.635s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:32:38] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:32:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:33:04] Starting KUnit Kernel (1/1)...
[23:33:04] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:33:04] ============ drm_test_pick_cmdline (2 subtests) ============
[23:33:04] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:33:04] =============== drm_test_pick_cmdline_named  ===============
[23:33:04] [PASSED] NTSC
[23:33:04] [PASSED] NTSC-J
[23:33:04] [PASSED] PAL
[23:33:04] [PASSED] PAL-M
[23:33:04] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:33:04] ============== [PASSED] drm_test_pick_cmdline ==============
[23:33:04] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[23:33:04] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[23:33:04] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[23:33:04] =========== drm_validate_clone_mode (2 subtests) ===========
[23:33:04] ============== drm_test_check_in_clone_mode  ===============
[23:33:04] [PASSED] in_clone_mode
[23:33:04] [PASSED] not_in_clone_mode
[23:33:04] ========== [PASSED] drm_test_check_in_clone_mode ===========
[23:33:04] =============== drm_test_check_valid_clones  ===============
[23:33:04] [PASSED] not_in_clone_mode
[23:33:04] [PASSED] valid_clone
[23:33:04] [PASSED] invalid_clone
[23:33:04] =========== [PASSED] drm_test_check_valid_clones ===========
[23:33:04] ============= [PASSED] drm_validate_clone_mode =============
[23:33:04] ============= drm_validate_modeset (1 subtest) =============
[23:33:04] [PASSED] drm_test_check_connector_changed_modeset
[23:33:04] ============== [PASSED] drm_validate_modeset ===============
[23:33:04] ====== drm_test_bridge_get_current_state (1 subtest) =======
[23:33:04] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[23:33:04] ======== [PASSED] drm_test_bridge_get_current_state ========
[23:33:04] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[23:33:04] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[23:33:04] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[23:33:04] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[23:33:04] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[23:33:04] ============== drm_bridge_alloc (2 subtests) ===============
[23:33:04] [PASSED] drm_test_drm_bridge_alloc_basic
[23:33:04] [PASSED] drm_test_drm_bridge_alloc_get_put
[23:33:04] ================ [PASSED] drm_bridge_alloc =================
[23:33:04] ============= drm_bridge_bus_fmt (5 subtests) ==============
[23:33:04] [PASSED] drm_test_bridge_rgb_yuv_rgb
[23:33:04] [PASSED] drm_test_bridge_must_convert_to_yuv444
[23:33:04] [PASSED] drm_test_bridge_hdmi_auto_rgb
[23:33:04] [PASSED] drm_test_bridge_auto_first
[23:33:04] [PASSED] drm_test_bridge_rgb_yuv_no_path
[23:33:04] =============== [PASSED] drm_bridge_bus_fmt ================
[23:33:04] ============= drm_cmdline_parser (40 subtests) =============
[23:33:04] [PASSED] drm_test_cmdline_force_d_only
[23:33:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:33:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:33:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:33:04] [PASSED] drm_test_cmdline_force_e_only
[23:33:04] [PASSED] drm_test_cmdline_res
[23:33:04] [PASSED] drm_test_cmdline_res_vesa
[23:33:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:33:04] [PASSED] drm_test_cmdline_res_rblank
[23:33:04] [PASSED] drm_test_cmdline_res_bpp
[23:33:04] [PASSED] drm_test_cmdline_res_refresh
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:33:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:33:04] [PASSED] drm_test_cmdline_res_margins_force_on
[23:33:04] [PASSED] drm_test_cmdline_res_vesa_margins
[23:33:04] [PASSED] drm_test_cmdline_name
[23:33:04] [PASSED] drm_test_cmdline_name_bpp
[23:33:04] [PASSED] drm_test_cmdline_name_option
[23:33:04] [PASSED] drm_test_cmdline_name_bpp_option
[23:33:04] [PASSED] drm_test_cmdline_rotate_0
[23:33:04] [PASSED] drm_test_cmdline_rotate_90
[23:33:04] [PASSED] drm_test_cmdline_rotate_180
[23:33:04] [PASSED] drm_test_cmdline_rotate_270
[23:33:04] [PASSED] drm_test_cmdline_hmirror
[23:33:04] [PASSED] drm_test_cmdline_vmirror
[23:33:04] [PASSED] drm_test_cmdline_margin_options
[23:33:04] [PASSED] drm_test_cmdline_multiple_options
[23:33:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:33:04] [PASSED] drm_test_cmdline_extra_and_option
[23:33:04] [PASSED] drm_test_cmdline_freestanding_options
[23:33:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:33:04] [PASSED] drm_test_cmdline_panel_orientation
[23:33:04] ================ drm_test_cmdline_invalid  =================
[23:33:04] [PASSED] margin_only
[23:33:04] [PASSED] interlace_only
[23:33:04] [PASSED] res_missing_x
[23:33:04] [PASSED] res_missing_y
[23:33:04] [PASSED] res_bad_y
[23:33:04] [PASSED] res_missing_y_bpp
[23:33:04] [PASSED] res_bad_bpp
[23:33:04] [PASSED] res_bad_refresh
[23:33:04] [PASSED] res_bpp_refresh_force_on_off
[23:33:04] [PASSED] res_invalid_mode
[23:33:04] [PASSED] res_bpp_wrong_place_mode
[23:33:04] [PASSED] name_bpp_refresh
[23:33:04] [PASSED] name_refresh
[23:33:04] [PASSED] name_refresh_wrong_mode
[23:33:04] [PASSED] name_refresh_invalid_mode
[23:33:04] [PASSED] rotate_multiple
[23:33:04] [PASSED] rotate_invalid_val
[23:33:04] [PASSED] rotate_truncated
[23:33:04] [PASSED] invalid_option
[23:33:04] [PASSED] invalid_tv_option
[23:33:04] [PASSED] truncated_tv_option
[23:33:04] ============ [PASSED] drm_test_cmdline_invalid =============
[23:33:04] =============== drm_test_cmdline_tv_options  ===============
[23:33:04] [PASSED] NTSC
[23:33:04] [PASSED] NTSC_443
[23:33:04] [PASSED] NTSC_J
[23:33:04] [PASSED] PAL
[23:33:04] [PASSED] PAL_M
[23:33:04] [PASSED] PAL_N
[23:33:04] [PASSED] SECAM
[23:33:04] [PASSED] MONO_525
[23:33:04] [PASSED] MONO_625
[23:33:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:33:04] =============== [PASSED] drm_cmdline_parser ================
[23:33:04] ========== drmm_connector_hdmi_init (20 subtests) ==========
[23:33:04] [PASSED] drm_test_connector_hdmi_init_valid
[23:33:04] [PASSED] drm_test_connector_hdmi_init_bpc_8
[23:33:04] [PASSED] drm_test_connector_hdmi_init_bpc_10
[23:33:04] [PASSED] drm_test_connector_hdmi_init_bpc_12
[23:33:04] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[23:33:04] [PASSED] drm_test_connector_hdmi_init_bpc_null
[23:33:04] [PASSED] drm_test_connector_hdmi_init_formats_empty
[23:33:04] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[23:33:04] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[23:33:04] [PASSED] supported_formats=0x9 yuv420_allowed=1
[23:33:04] [PASSED] supported_formats=0x9 yuv420_allowed=0
[23:33:04] [PASSED] supported_formats=0x5 yuv420_allowed=1
[23:33:04] [PASSED] supported_formats=0x5 yuv420_allowed=0
[23:33:04] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[23:33:04] [PASSED] drm_test_connector_hdmi_init_null_ddc
[23:33:04] [PASSED] drm_test_connector_hdmi_init_null_product
[23:33:04] [PASSED] drm_test_connector_hdmi_init_null_vendor
[23:33:04] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[23:33:04] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[23:33:04] [PASSED] drm_test_connector_hdmi_init_product_valid
[23:33:04] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[23:33:04] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[23:33:04] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[23:33:04] ========= drm_test_connector_hdmi_init_type_valid  =========
[23:33:04] [PASSED] HDMI-A
[23:33:04] [PASSED] HDMI-B
[23:33:04] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[23:33:04] ======== drm_test_connector_hdmi_init_type_invalid  ========
[23:33:04] [PASSED] Unknown
[23:33:04] [PASSED] VGA
[23:33:04] [PASSED] DVI-I
[23:33:04] [PASSED] DVI-D
[23:33:04] [PASSED] DVI-A
[23:33:04] [PASSED] Composite
[23:33:04] [PASSED] SVIDEO
[23:33:04] [PASSED] LVDS
[23:33:04] [PASSED] Component
[23:33:04] [PASSED] DIN
[23:33:04] [PASSED] DP
[23:33:04] [PASSED] TV
[23:33:04] [PASSED] eDP
[23:33:04] [PASSED] Virtual
[23:33:04] [PASSED] DSI
[23:33:04] [PASSED] DPI
[23:33:04] [PASSED] Writeback
[23:33:04] [PASSED] SPI
[23:33:04] [PASSED] USB
[23:33:04] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[23:33:04] ============ [PASSED] drmm_connector_hdmi_init =============
[23:33:04] ============= drmm_connector_init (3 subtests) =============
[23:33:04] [PASSED] drm_test_drmm_connector_init
[23:33:04] [PASSED] drm_test_drmm_connector_init_null_ddc
[23:33:04] ========= drm_test_drmm_connector_init_type_valid  =========
[23:33:04] [PASSED] Unknown
[23:33:04] [PASSED] VGA
[23:33:04] [PASSED] DVI-I
[23:33:04] [PASSED] DVI-D
[23:33:04] [PASSED] DVI-A
[23:33:04] [PASSED] Composite
[23:33:04] [PASSED] SVIDEO
[23:33:04] [PASSED] LVDS
[23:33:04] [PASSED] Component
[23:33:04] [PASSED] DIN
[23:33:04] [PASSED] DP
[23:33:04] [PASSED] HDMI-A
[23:33:04] [PASSED] HDMI-B
[23:33:04] [PASSED] TV
[23:33:04] [PASSED] eDP
[23:33:04] [PASSED] Virtual
[23:33:04] [PASSED] DSI
[23:33:04] [PASSED] DPI
[23:33:04] [PASSED] Writeback
[23:33:04] [PASSED] SPI
[23:33:04] [PASSED] USB
[23:33:04] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[23:33:04] =============== [PASSED] drmm_connector_init ===============
[23:33:04] ========= drm_connector_dynamic_init (6 subtests) ==========
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_init
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_init_properties
[23:33:04] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[23:33:04] [PASSED] Unknown
[23:33:04] [PASSED] VGA
[23:33:04] [PASSED] DVI-I
[23:33:04] [PASSED] DVI-D
[23:33:04] [PASSED] DVI-A
[23:33:04] [PASSED] Composite
[23:33:04] [PASSED] SVIDEO
[23:33:04] [PASSED] LVDS
[23:33:04] [PASSED] Component
[23:33:04] [PASSED] DIN
[23:33:04] [PASSED] DP
[23:33:04] [PASSED] HDMI-A
[23:33:04] [PASSED] HDMI-B
[23:33:04] [PASSED] TV
[23:33:04] [PASSED] eDP
[23:33:04] [PASSED] Virtual
[23:33:04] [PASSED] DSI
[23:33:04] [PASSED] DPI
[23:33:04] [PASSED] Writeback
[23:33:04] [PASSED] SPI
[23:33:04] [PASSED] USB
[23:33:04] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[23:33:04] ======== drm_test_drm_connector_dynamic_init_name  =========
[23:33:04] [PASSED] Unknown
[23:33:04] [PASSED] VGA
[23:33:04] [PASSED] DVI-I
[23:33:04] [PASSED] DVI-D
[23:33:04] [PASSED] DVI-A
[23:33:04] [PASSED] Composite
[23:33:04] [PASSED] SVIDEO
[23:33:04] [PASSED] LVDS
[23:33:04] [PASSED] Component
[23:33:04] [PASSED] DIN
[23:33:04] [PASSED] DP
[23:33:04] [PASSED] HDMI-A
[23:33:04] [PASSED] HDMI-B
[23:33:04] [PASSED] TV
[23:33:04] [PASSED] eDP
[23:33:04] [PASSED] Virtual
[23:33:04] [PASSED] DSI
[23:33:04] [PASSED] DPI
[23:33:04] [PASSED] Writeback
[23:33:04] [PASSED] SPI
[23:33:04] [PASSED] USB
[23:33:04] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[23:33:04] =========== [PASSED] drm_connector_dynamic_init ============
[23:33:04] ==== drm_connector_dynamic_register_early (4 subtests) =====
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[23:33:04] ====== [PASSED] drm_connector_dynamic_register_early =======
[23:33:04] ======= drm_connector_dynamic_register (7 subtests) ========
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[23:33:04] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[23:33:04] ========= [PASSED] drm_connector_dynamic_register ==========
[23:33:04] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[23:33:04] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[23:33:04] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[23:33:04] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[23:33:04] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:33:04] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:33:04] [PASSED] NTSC
[23:33:04] [PASSED] NTSC-443
[23:33:04] [PASSED] NTSC-J
[23:33:04] [PASSED] PAL
[23:33:04] [PASSED] PAL-M
[23:33:04] [PASSED] PAL-N
[23:33:04] [PASSED] SECAM
[23:33:04] [PASSED] Mono
[23:33:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:33:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:33:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:33:04] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[23:33:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[23:33:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[23:33:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[23:33:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[23:33:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[23:33:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[23:33:04] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[23:33:04] [PASSED] VIC 96
[23:33:04] [PASSED] VIC 97
[23:33:04] [PASSED] VIC 101
[23:33:04] [PASSED] VIC 102
[23:33:04] [PASSED] VIC 106
[23:33:04] [PASSED] VIC 107
[23:33:04] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[23:33:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[23:33:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[23:33:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[23:33:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[23:33:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[23:33:04] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[23:33:04] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[23:33:04] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[23:33:04] [PASSED] Automatic
[23:33:04] [PASSED] Full
[23:33:04] [PASSED] Limited 16:235
[23:33:04] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[23:33:04] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[23:33:04] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[23:33:04] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[23:33:04] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[23:33:04] [PASSED] RGB
[23:33:04] [PASSED] YUV 4:2:0
[23:33:04] [PASSED] YUV 4:2:2
[23:33:04] [PASSED] YUV 4:4:4
[23:33:04] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[23:33:04] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[23:33:04] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[23:33:04] ============= drm_damage_helper (21 subtests) ==============
[23:33:04] [PASSED] drm_test_damage_iter_no_damage
[23:33:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:33:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:33:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:33:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:33:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:33:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:33:04] [PASSED] drm_test_damage_iter_simple_damage
[23:33:04] [PASSED] drm_test_damage_iter_single_damage
[23:33:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:33:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:33:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:33:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:33:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:33:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:33:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:33:04] [PASSED] drm_test_damage_iter_damage
[23:33:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:33:04] [PASSED] drm_test_damage_iter_damage_one_outside
[23:33:04] [PASSED] drm_test_damage_iter_damage_src_moved
[23:33:04] [PASSED] drm_test_damage_iter_damage_not_visible
[23:33:04] ================ [PASSED] drm_damage_helper ================
[23:33:04] ============== drm_dp_mst_helper (3 subtests) ==============
[23:33:04] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:33:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:33:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:33:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:33:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:33:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:33:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:33:04] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:33:04] [PASSED] Link rate 2000000 lane count 4
[23:33:04] [PASSED] Link rate 2000000 lane count 2
[23:33:04] [PASSED] Link rate 2000000 lane count 1
[23:33:04] [PASSED] Link rate 1350000 lane count 4
[23:33:04] [PASSED] Link rate 1350000 lane count 2
[23:33:04] [PASSED] Link rate 1350000 lane count 1
[23:33:04] [PASSED] Link rate 1000000 lane count 4
[23:33:04] [PASSED] Link rate 1000000 lane count 2
[23:33:04] [PASSED] Link rate 1000000 lane count 1
[23:33:04] [PASSED] Link rate 810000 lane count 4
[23:33:04] [PASSED] Link rate 810000 lane count 2
[23:33:04] [PASSED] Link rate 810000 lane count 1
[23:33:04] [PASSED] Link rate 540000 lane count 4
[23:33:04] [PASSED] Link rate 540000 lane count 2
[23:33:04] [PASSED] Link rate 540000 lane count 1
[23:33:04] [PASSED] Link rate 270000 lane count 4
[23:33:04] [PASSED] Link rate 270000 lane count 2
[23:33:04] [PASSED] Link rate 270000 lane count 1
[23:33:04] [PASSED] Link rate 162000 lane count 4
[23:33:04] [PASSED] Link rate 162000 lane count 2
[23:33:04] [PASSED] Link rate 162000 lane count 1
[23:33:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:33:04] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:33:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:33:04] [PASSED] DP_POWER_UP_PHY with port number
[23:33:04] [PASSED] DP_POWER_DOWN_PHY with port number
[23:33:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:33:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:33:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:33:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:33:04] [PASSED] DP_QUERY_PAYLOAD with port number
[23:33:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:33:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:33:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:33:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:33:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:33:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:33:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:33:04] [PASSED] DP_REMOTE_I2C_READ with port number
[23:33:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:33:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:33:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:33:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:33:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:33:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:33:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:33:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:33:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:33:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:33:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:33:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:33:04] ================ [PASSED] drm_dp_mst_helper ================
[23:33:04] ================== drm_exec (7 subtests) ===================
[23:33:04] [PASSED] sanitycheck
[23:33:04] [PASSED] test_lock
[23:33:04] [PASSED] test_lock_unlock
[23:33:04] [PASSED] test_duplicates
[23:33:04] [PASSED] test_prepare
[23:33:04] [PASSED] test_prepare_array
[23:33:04] [PASSED] test_multiple_loops
[23:33:04] ==================== [PASSED] drm_exec =====================
[23:33:04] =========== drm_format_helper_test (17 subtests) ===========
[23:33:04] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:33:04] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:33:04] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:33:04] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:33:04] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:33:04] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:33:04] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:33:04] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[23:33:04] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:33:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:33:04] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:33:04] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:33:04] ==================== drm_test_fb_swab  =====================
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ================ [PASSED] drm_test_fb_swab =================
[23:33:04] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:33:04] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:33:04] [PASSED] single_pixel_source_buffer
[23:33:04] [PASSED] single_pixel_clip_rectangle
[23:33:04] [PASSED] well_known_colors
[23:33:04] [PASSED] destination_pitch
[23:33:04] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:33:04] ================= drm_test_fb_clip_offset  =================
[23:33:04] [PASSED] pass through
[23:33:04] [PASSED] horizontal offset
[23:33:04] [PASSED] vertical offset
[23:33:04] [PASSED] horizontal and vertical offset
[23:33:04] [PASSED] horizontal offset (custom pitch)
[23:33:04] [PASSED] vertical offset (custom pitch)
[23:33:04] [PASSED] horizontal and vertical offset (custom pitch)
[23:33:04] ============= [PASSED] drm_test_fb_clip_offset =============
[23:33:04] =================== drm_test_fb_memcpy  ====================
[23:33:04] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:33:04] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:33:04] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:33:04] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:33:04] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:33:04] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:33:04] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:33:04] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:33:04] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:33:04] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:33:04] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:33:04] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:33:04] =============== [PASSED] drm_test_fb_memcpy ================
[23:33:04] ============= [PASSED] drm_format_helper_test ==============
[23:33:04] ================= drm_format (18 subtests) =================
[23:33:04] [PASSED] drm_test_format_block_width_invalid
[23:33:04] [PASSED] drm_test_format_block_width_one_plane
[23:33:04] [PASSED] drm_test_format_block_width_two_plane
[23:33:04] [PASSED] drm_test_format_block_width_three_plane
[23:33:04] [PASSED] drm_test_format_block_width_tiled
[23:33:04] [PASSED] drm_test_format_block_height_invalid
[23:33:04] [PASSED] drm_test_format_block_height_one_plane
[23:33:04] [PASSED] drm_test_format_block_height_two_plane
[23:33:04] [PASSED] drm_test_format_block_height_three_plane
[23:33:04] [PASSED] drm_test_format_block_height_tiled
[23:33:04] [PASSED] drm_test_format_min_pitch_invalid
[23:33:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:33:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:33:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:33:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:33:04] [PASSED] drm_test_format_min_pitch_two_plane
[23:33:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:33:04] [PASSED] drm_test_format_min_pitch_tiled
[23:33:04] =================== [PASSED] drm_format ====================
[23:33:04] ============== drm_framebuffer (10 subtests) ===============
[23:33:04] ========== drm_test_framebuffer_check_src_coords  ==========
[23:33:04] [PASSED] Success: source fits into fb
[23:33:04] [PASSED] Fail: overflowing fb with x-axis coordinate
[23:33:04] [PASSED] Fail: overflowing fb with y-axis coordinate
[23:33:04] [PASSED] Fail: overflowing fb with source width
[23:33:04] [PASSED] Fail: overflowing fb with source height
[23:33:04] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[23:33:04] [PASSED] drm_test_framebuffer_cleanup
[23:33:04] =============== drm_test_framebuffer_create  ===============
[23:33:04] [PASSED] ABGR8888 normal sizes
[23:33:04] [PASSED] ABGR8888 max sizes
[23:33:04] [PASSED] ABGR8888 pitch greater than min required
[23:33:04] [PASSED] ABGR8888 pitch less than min required
[23:33:04] [PASSED] ABGR8888 Invalid width
[23:33:04] [PASSED] ABGR8888 Invalid buffer handle
[23:33:04] [PASSED] No pixel format
[23:33:04] [PASSED] ABGR8888 Width 0
[23:33:04] [PASSED] ABGR8888 Height 0
[23:33:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:33:04] [PASSED] ABGR8888 Large buffer offset
[23:33:04] [PASSED] ABGR8888 Buffer offset for inexistent plane
[23:33:04] [PASSED] ABGR8888 Invalid flag
[23:33:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:33:04] [PASSED] ABGR8888 Valid buffer modifier
[23:33:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:33:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:33:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:33:04] [PASSED] NV12 Normal sizes
[23:33:04] [PASSED] NV12 Max sizes
[23:33:04] [PASSED] NV12 Invalid pitch
[23:33:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:33:04] [PASSED] NV12 different  modifier per-plane
[23:33:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:33:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:33:04] [PASSED] NV12 Modifier for inexistent plane
[23:33:04] [PASSED] NV12 Handle for inexistent plane
[23:33:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:33:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:33:04] [PASSED] YVU420 Normal sizes
[23:33:04] [PASSED] YVU420 Max sizes
[23:33:04] [PASSED] YVU420 Invalid pitch
[23:33:04] [PASSED] YVU420 Different pitches
[23:33:04] [PASSED] YVU420 Different buffer offsets/pitches
[23:33:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:33:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:33:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:33:04] [PASSED] YVU420 Valid modifier
[23:33:04] [PASSED] YVU420 Different modifiers per plane
[23:33:04] [PASSED] YVU420 Modifier for inexistent plane
[23:33:04] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[23:33:04] [PASSED] X0L2 Normal sizes
[23:33:04] [PASSED] X0L2 Max sizes
[23:33:04] [PASSED] X0L2 Invalid pitch
[23:33:04] [PASSED] X0L2 Pitch greater than minimum required
[23:33:04] [PASSED] X0L2 Handle for inexistent plane
[23:33:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:33:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:33:04] [PASSED] X0L2 Valid modifier
[23:33:04] [PASSED] X0L2 Modifier for inexistent plane
[23:33:04] =========== [PASSED] drm_test_framebuffer_create ===========
[23:33:04] [PASSED] drm_test_framebuffer_free
[23:33:04] [PASSED] drm_test_framebuffer_init
[23:33:04] [PASSED] drm_test_framebuffer_init_bad_format
[23:33:04] [PASSED] drm_test_framebuffer_init_dev_mismatch
[23:33:04] [PASSED] drm_test_framebuffer_lookup
[23:33:04] [PASSED] drm_test_framebuffer_lookup_inexistent
[23:33:04] [PASSED] drm_test_framebuffer_modifiers_not_supported
[23:33:04] ================= [PASSED] drm_framebuffer =================
[23:33:04] ================ drm_gem_shmem (8 subtests) ================
[23:33:04] [PASSED] drm_gem_shmem_test_obj_create
[23:33:04] [PASSED] drm_gem_shmem_test_obj_create_private
[23:33:04] [PASSED] drm_gem_shmem_test_pin_pages
[23:33:04] [PASSED] drm_gem_shmem_test_vmap
[23:33:04] [PASSED] drm_gem_shmem_test_get_sg_table
[23:33:04] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:33:04] [PASSED] drm_gem_shmem_test_madvise
[23:33:04] [PASSED] drm_gem_shmem_test_purge
[23:33:04] ================== [PASSED] drm_gem_shmem ==================
[23:33:04] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[23:33:04] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[23:33:04] [PASSED] Automatic
[23:33:04] [PASSED] Full
[23:33:04] [PASSED] Limited 16:235
[23:33:04] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[23:33:04] [PASSED] drm_test_check_disable_connector
[23:33:04] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[23:33:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[23:33:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[23:33:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[23:33:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[23:33:04] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[23:33:04] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[23:33:04] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[23:33:04] [PASSED] drm_test_check_output_bpc_dvi
[23:33:04] [PASSED] drm_test_check_output_bpc_format_vic_1
[23:33:04] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[23:33:04] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[23:33:04] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[23:33:04] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[23:33:04] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[23:33:04] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[23:33:04] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[23:33:04] ============ drm_test_check_hdmi_color_format  =============
[23:33:04] [PASSED] AUTO -> RGB
[23:33:04] [PASSED] YCBCR422 -> YUV422
[23:33:04] [PASSED] YCBCR420 -> YUV420
[23:33:04] [PASSED] YCBCR444 -> YUV444
[23:33:04] [PASSED] RGB -> RGB
[23:33:04] ======== [PASSED] drm_test_check_hdmi_color_format =========
[23:33:04] ======== drm_test_check_hdmi_color_format_420_only  ========
[23:33:04] [PASSED] RGB should fail
[23:33:04] [PASSED] YUV444 should fail
[23:33:04] [PASSED] YUV422 should fail
[23:33:04] [PASSED] YUV420 should work
[23:33:04] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[23:33:04] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[23:33:04] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[23:33:04] [PASSED] drm_test_check_broadcast_rgb_value
[23:33:04] [PASSED] drm_test_check_bpc_8_value
[23:33:04] [PASSED] drm_test_check_bpc_10_value
[23:33:04] [PASSED] drm_test_check_bpc_12_value
[23:33:04] [PASSED] drm_test_check_format_value
[23:33:04] [PASSED] drm_test_check_tmds_char_value
[23:33:04] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[23:33:04] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[23:33:04] [PASSED] drm_test_check_mode_valid
[23:33:04] [PASSED] drm_test_check_mode_valid_reject
[23:33:04] [PASSED] drm_test_check_mode_valid_reject_rate
[23:33:04] [PASSED] drm_test_check_mode_valid_reject_max_clock
[23:33:04] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[23:33:04] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[23:33:04] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[23:33:04] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[23:33:04] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[23:33:04] [PASSED] drm_test_check_infoframes
[23:33:04] [PASSED] drm_test_check_reject_avi_infoframe
[23:33:04] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[23:33:04] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[23:33:04] [PASSED] drm_test_check_reject_audio_infoframe
[23:33:04] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[23:33:04] ================= drm_managed (2 subtests) =================
[23:33:04] [PASSED] drm_test_managed_release_action
[23:33:04] [PASSED] drm_test_managed_run_action
[23:33:04] =================== [PASSED] drm_managed ===================
[23:33:04] =================== drm_mm (6 subtests) ====================
[23:33:04] [PASSED] drm_test_mm_init
[23:33:04] [PASSED] drm_test_mm_debug
[23:33:04] [PASSED] drm_test_mm_align32
[23:33:04] [PASSED] drm_test_mm_align64
[23:33:04] [PASSED] drm_test_mm_lowest
[23:33:04] [PASSED] drm_test_mm_highest
[23:33:04] ===================== [PASSED] drm_mm ======================
[23:33:04] ============= drm_modes_analog_tv (5 subtests) =============
[23:33:04] [PASSED] drm_test_modes_analog_tv_mono_576i
[23:33:04] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:33:04] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:33:04] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:33:04] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:33:04] =============== [PASSED] drm_modes_analog_tv ===============
[23:33:04] ============== drm_plane_helper (2 subtests) ===============
[23:33:04] =============== drm_test_check_plane_state  ================
[23:33:04] [PASSED] clipping_simple
[23:33:04] [PASSED] clipping_rotate_reflect
[23:33:04] [PASSED] positioning_simple
[23:33:04] [PASSED] upscaling
[23:33:04] [PASSED] downscaling
[23:33:04] [PASSED] rounding1
[23:33:04] [PASSED] rounding2
[23:33:04] [PASSED] rounding3
[23:33:04] [PASSED] rounding4
[23:33:04] =========== [PASSED] drm_test_check_plane_state ============
[23:33:04] =========== drm_test_check_invalid_plane_state  ============
[23:33:04] [PASSED] positioning_invalid
[23:33:04] [PASSED] upscaling_invalid
[23:33:04] [PASSED] downscaling_invalid
[23:33:04] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:33:04] ================ [PASSED] drm_plane_helper =================
[23:33:04] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:33:04] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:33:04] [PASSED] None
[23:33:04] [PASSED] PAL
[23:33:04] [PASSED] NTSC
[23:33:04] [PASSED] Both, NTSC Default
[23:33:04] [PASSED] Both, PAL Default
[23:33:04] [PASSED] Both, NTSC Default, with PAL on command-line
[23:33:04] [PASSED] Both, PAL Default, with NTSC on command-line
[23:33:04] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:33:04] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:33:04] ================== drm_rect (9 subtests) ===================
[23:33:04] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:33:04] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:33:04] [PASSED] drm_test_rect_clip_scaled_clipped
[23:33:04] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:33:04] ================= drm_test_rect_intersect  =================
[23:33:04] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:33:04] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:33:04] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:33:04] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:33:04] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:33:04] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:33:04] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:33:04] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:33:04] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:33:04] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:33:04] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:33:04] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:33:04] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:33:04] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:33:04] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:33:04] ============= [PASSED] drm_test_rect_intersect =============
[23:33:04] ================ drm_test_rect_calc_hscale  ================
[23:33:04] [PASSED] normal use
[23:33:04] [PASSED] out of max range
[23:33:04] [PASSED] out of min range
[23:33:04] [PASSED] zero dst
[23:33:04] [PASSED] negative src
[23:33:04] [PASSED] negative dst
[23:33:04] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:33:04] ================ drm_test_rect_calc_vscale  ================
[23:33:04] [PASSED] normal use
[23:33:04] [PASSED] out of max range
[23:33:04] [PASSED] out of min range
[23:33:04] [PASSED] zero dst
[23:33:04] [PASSED] negative src
[23:33:04] [PASSED] negative dst
[23:33:04] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:33:04] ================== drm_test_rect_rotate  ===================
[23:33:04] [PASSED] reflect-x
[23:33:04] [PASSED] reflect-y
[23:33:04] [PASSED] rotate-0
[23:33:04] [PASSED] rotate-90
[23:33:04] [PASSED] rotate-180
[23:33:04] [PASSED] rotate-270
[23:33:04] ============== [PASSED] drm_test_rect_rotate ===============
[23:33:04] ================ drm_test_rect_rotate_inv  =================
[23:33:04] [PASSED] reflect-x
[23:33:04] [PASSED] reflect-y
[23:33:04] [PASSED] rotate-0
[23:33:04] [PASSED] rotate-90
[23:33:04] [PASSED] rotate-180
[23:33:04] [PASSED] rotate-270
[23:33:04] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:33:04] ==================== [PASSED] drm_rect =====================
[23:33:04] ============ drm_sysfb_modeset_test (1 subtest) ============
[23:33:04] ============ drm_test_sysfb_build_fourcc_list  =============
[23:33:04] [PASSED] no native formats
[23:33:04] [PASSED] XRGB8888 as native format
[23:33:04] [PASSED] remove duplicates
[23:33:04] [PASSED] convert alpha formats
[23:33:04] [PASSED] random formats
[23:33:04] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[23:33:04] ============= [PASSED] drm_sysfb_modeset_test ==============
[23:33:04] ================== drm_fixp (2 subtests) ===================
[23:33:04] [PASSED] drm_test_int2fixp
[23:33:04] [PASSED] drm_test_sm2fixp
[23:33:04] ==================== [PASSED] drm_fixp =====================
[23:33:04] ============================================================
[23:33:04] Testing complete. Ran 637 tests: passed: 637
[23:33:04] Elapsed time: 26.634s total, 1.824s configuring, 24.645s building, 0.149s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[23:33:05] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:33:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:33:17] Starting KUnit Kernel (1/1)...
[23:33:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:33:17] ================= ttm_device (5 subtests) ==================
[23:33:17] [PASSED] ttm_device_init_basic
[23:33:17] [PASSED] ttm_device_init_multiple
[23:33:17] [PASSED] ttm_device_fini_basic
[23:33:17] [PASSED] ttm_device_init_no_vma_man
[23:33:17] ================== ttm_device_init_pools  ==================
[23:33:17] [PASSED] No DMA allocations, no DMA32 required
[23:33:17] [PASSED] DMA allocations, DMA32 required
[23:33:17] [PASSED] No DMA allocations, DMA32 required
[23:33:17] [PASSED] DMA allocations, no DMA32 required
[23:33:17] ============== [PASSED] ttm_device_init_pools ==============
[23:33:17] =================== [PASSED] ttm_device ====================
[23:33:17] ================== ttm_pool (8 subtests) ===================
[23:33:17] ================== ttm_pool_alloc_basic  ===================
[23:33:17] [PASSED] One page
[23:33:17] [PASSED] More than one page
[23:33:17] [PASSED] Above the allocation limit
[23:33:17] [PASSED] One page, with coherent DMA mappings enabled
[23:33:17] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:33:17] ============== [PASSED] ttm_pool_alloc_basic ===============
[23:33:17] ============== ttm_pool_alloc_basic_dma_addr  ==============
[23:33:17] [PASSED] One page
[23:33:17] [PASSED] More than one page
[23:33:17] [PASSED] Above the allocation limit
[23:33:17] [PASSED] One page, with coherent DMA mappings enabled
[23:33:17] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:33:17] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[23:33:17] [PASSED] ttm_pool_alloc_order_caching_match
[23:33:17] [PASSED] ttm_pool_alloc_caching_mismatch
[23:33:17] [PASSED] ttm_pool_alloc_order_mismatch
[23:33:17] [PASSED] ttm_pool_free_dma_alloc
[23:33:17] [PASSED] ttm_pool_free_no_dma_alloc
[23:33:17] [PASSED] ttm_pool_fini_basic
[23:33:17] ==================== [PASSED] ttm_pool =====================
[23:33:17] ================ ttm_resource (8 subtests) =================
[23:33:17] ================= ttm_resource_init_basic  =================
[23:33:17] [PASSED] Init resource in TTM_PL_SYSTEM
[23:33:17] [PASSED] Init resource in TTM_PL_VRAM
[23:33:17] [PASSED] Init resource in a private placement
[23:33:17] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[23:33:17] ============= [PASSED] ttm_resource_init_basic =============
[23:33:17] [PASSED] ttm_resource_init_pinned
[23:33:17] [PASSED] ttm_resource_fini_basic
[23:33:17] [PASSED] ttm_resource_manager_init_basic
[23:33:17] [PASSED] ttm_resource_manager_usage_basic
[23:33:17] [PASSED] ttm_resource_manager_set_used_basic
[23:33:17] [PASSED] ttm_sys_man_alloc_basic
[23:33:17] [PASSED] ttm_sys_man_free_basic
[23:33:17] ================== [PASSED] ttm_resource ===================
[23:33:17] =================== ttm_tt (15 subtests) ===================
[23:33:17] ==================== ttm_tt_init_basic  ====================
[23:33:17] [PASSED] Page-aligned size
[23:33:17] [PASSED] Extra pages requested
[23:33:17] ================ [PASSED] ttm_tt_init_basic ================
[23:33:17] [PASSED] ttm_tt_init_misaligned
[23:33:17] [PASSED] ttm_tt_fini_basic
[23:33:17] [PASSED] ttm_tt_fini_sg
[23:33:17] [PASSED] ttm_tt_fini_shmem
[23:33:17] [PASSED] ttm_tt_create_basic
[23:33:17] [PASSED] ttm_tt_create_invalid_bo_type
[23:33:17] [PASSED] ttm_tt_create_ttm_exists
[23:33:17] [PASSED] ttm_tt_create_failed
[23:33:17] [PASSED] ttm_tt_destroy_basic
[23:33:17] [PASSED] ttm_tt_populate_null_ttm
[23:33:17] [PASSED] ttm_tt_populate_populated_ttm
[23:33:17] [PASSED] ttm_tt_unpopulate_basic
[23:33:17] [PASSED] ttm_tt_unpopulate_empty_ttm
[23:33:17] [PASSED] ttm_tt_swapin_basic
[23:33:17] ===================== [PASSED] ttm_tt ======================
[23:33:17] =================== ttm_bo (14 subtests) ===================
[23:33:17] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[23:33:17] [PASSED] Cannot be interrupted and sleeps
[23:33:17] [PASSED] Cannot be interrupted, locks straight away
[23:33:17] [PASSED] Can be interrupted, sleeps
[23:33:17] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[23:33:17] [PASSED] ttm_bo_reserve_locked_no_sleep
[23:33:17] [PASSED] ttm_bo_reserve_no_wait_ticket
[23:33:17] [PASSED] ttm_bo_reserve_double_resv
[23:33:17] [PASSED] ttm_bo_reserve_interrupted
[23:33:17] [PASSED] ttm_bo_reserve_deadlock
[23:33:17] [PASSED] ttm_bo_unreserve_basic
[23:33:17] [PASSED] ttm_bo_unreserve_pinned
[23:33:17] [PASSED] ttm_bo_unreserve_bulk
[23:33:17] [PASSED] ttm_bo_fini_basic
[23:33:17] [PASSED] ttm_bo_fini_shared_resv
[23:33:17] [PASSED] ttm_bo_pin_basic
[23:33:17] [PASSED] ttm_bo_pin_unpin_resource
[23:33:17] [PASSED] ttm_bo_multiple_pin_one_unpin
[23:33:17] ===================== [PASSED] ttm_bo ======================
[23:33:17] ============== ttm_bo_validate (22 subtests) ===============
[23:33:17] ============== ttm_bo_init_reserved_sys_man  ===============
[23:33:17] [PASSED] Buffer object for userspace
[23:33:17] [PASSED] Kernel buffer object
[23:33:17] [PASSED] Shared buffer object
[23:33:17] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[23:33:17] ============== ttm_bo_init_reserved_mock_man  ==============
[23:33:17] [PASSED] Buffer object for userspace
[23:33:17] [PASSED] Kernel buffer object
[23:33:17] [PASSED] Shared buffer object
[23:33:17] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[23:33:17] [PASSED] ttm_bo_init_reserved_resv
[23:33:17] ================== ttm_bo_validate_basic  ==================
[23:33:17] [PASSED] Buffer object for userspace
[23:33:17] [PASSED] Kernel buffer object
[23:33:17] [PASSED] Shared buffer object
[23:33:17] ============== [PASSED] ttm_bo_validate_basic ==============
[23:33:17] [PASSED] ttm_bo_validate_invalid_placement
[23:33:17] ============= ttm_bo_validate_same_placement  ==============
[23:33:17] [PASSED] System manager
[23:33:17] [PASSED] VRAM manager
[23:33:17] ========= [PASSED] ttm_bo_validate_same_placement ==========
[23:33:17] [PASSED] ttm_bo_validate_failed_alloc
[23:33:17] [PASSED] ttm_bo_validate_pinned
[23:33:17] [PASSED] ttm_bo_validate_busy_placement
[23:33:17] ================ ttm_bo_validate_multihop  =================
[23:33:17] [PASSED] Buffer object for userspace
[23:33:17] [PASSED] Kernel buffer object
[23:33:17] [PASSED] Shared buffer object
[23:33:17] ============ [PASSED] ttm_bo_validate_multihop =============
[23:33:17] ========== ttm_bo_validate_no_placement_signaled  ==========
[23:33:17] [PASSED] Buffer object in system domain, no page vector
[23:33:17] [PASSED] Buffer object in system domain with an existing page vector
[23:33:17] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[23:33:17] ======== ttm_bo_validate_no_placement_not_signaled  ========
[23:33:17] [PASSED] Buffer object for userspace
[23:33:17] [PASSED] Kernel buffer object
[23:33:17] [PASSED] Shared buffer object
[23:33:17] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[23:33:17] [PASSED] ttm_bo_validate_move_fence_signaled
[23:33:17] ========= ttm_bo_validate_move_fence_not_signaled  =========
[23:33:17] [PASSED] Waits for GPU
[23:33:17] [PASSED] Tries to lock straight away
[23:33:17] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[23:33:17] [PASSED] ttm_bo_validate_swapout
[23:33:17] [PASSED] ttm_bo_validate_happy_evict
[23:33:17] [PASSED] ttm_bo_validate_all_pinned_evict
[23:33:17] [PASSED] ttm_bo_validate_allowed_only_evict
[23:33:17] [PASSED] ttm_bo_validate_deleted_evict
[23:33:17] [PASSED] ttm_bo_validate_busy_domain_evict
[23:33:17] [PASSED] ttm_bo_validate_evict_gutting
[23:33:17] [PASSED] ttm_bo_validate_recrusive_evict
[23:33:17] ================= [PASSED] ttm_bo_validate =================
[23:33:17] ============================================================
[23:33:17] Testing complete. Ran 102 tests: passed: 102
[23:33:17] Elapsed time: 12.109s total, 1.802s configuring, 10.093s building, 0.180s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


