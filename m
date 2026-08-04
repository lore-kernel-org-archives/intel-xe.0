Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86119C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 13:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A70E10EA61;
	Tue,  4 Aug 2026 13:56:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D570A10EA47;
 Tue,  4 Aug 2026 13:56:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/dp=3A_Add_EDP=5F20_rev_def?=
 =?utf-8?q?inition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 13:56:41 -0000
Message-ID: <178585180186.17167.7797008487026316018@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804054806.1110078-1-suraj.kandpal@intel.com>
In-Reply-To: <20260804054806.1110078-1-suraj.kandpal@intel.com>
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

Series: drm/dp: Add EDP_20 rev definition
URL   : https://patchwork.freedesktop.org/series/171548/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:55:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:55:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:55:58] Starting KUnit Kernel (1/1)...
[13:55:58] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:55:58] ================== guc_buf (11 subtests) ===================
[13:55:58] [PASSED] test_smallest
[13:55:58] [PASSED] test_largest
[13:55:58] [PASSED] test_granular
[13:55:58] [PASSED] test_unique
[13:55:58] [PASSED] test_overlap
[13:55:58] [PASSED] test_reusable
[13:55:58] [PASSED] test_too_big
[13:55:58] [PASSED] test_flush
[13:55:58] [PASSED] test_lookup
[13:55:58] [PASSED] test_data
[13:55:58] [PASSED] test_class
[13:55:58] ===================== [PASSED] guc_buf =====================
[13:55:58] =================== guc_dbm (7 subtests) ===================
[13:55:58] [PASSED] test_empty
[13:55:58] [PASSED] test_default
[13:55:58] ======================== test_size  ========================
[13:55:58] [PASSED] 4
[13:55:58] [PASSED] 8
[13:55:58] [PASSED] 32
[13:55:58] [PASSED] 256
[13:55:58] ==================== [PASSED] test_size ====================
[13:55:58] ======================= test_reuse  ========================
[13:55:58] [PASSED] 4
[13:55:58] [PASSED] 8
[13:55:58] [PASSED] 32
[13:55:58] [PASSED] 256
[13:55:58] =================== [PASSED] test_reuse ====================
[13:55:58] =================== test_range_overlap  ====================
[13:55:58] [PASSED] 4
[13:55:58] [PASSED] 8
[13:55:58] [PASSED] 32
[13:55:58] [PASSED] 256
[13:55:58] =============== [PASSED] test_range_overlap ================
[13:55:58] =================== test_range_compact  ====================
[13:55:58] [PASSED] 4
[13:55:58] [PASSED] 8
[13:55:58] [PASSED] 32
[13:55:58] [PASSED] 256
[13:55:58] =============== [PASSED] test_range_compact ================
[13:55:58] ==================== test_range_spare  =====================
[13:55:58] [PASSED] 4
[13:55:58] [PASSED] 8
[13:55:58] [PASSED] 32
[13:55:58] [PASSED] 256
[13:55:58] ================ [PASSED] test_range_spare =================
[13:55:58] ===================== [PASSED] guc_dbm =====================
[13:55:58] =================== guc_idm (6 subtests) ===================
[13:55:58] [PASSED] bad_init
[13:55:58] [PASSED] no_init
[13:55:58] [PASSED] init_fini
[13:55:58] [PASSED] check_used
[13:55:58] [PASSED] check_quota
[13:55:58] [PASSED] check_all
[13:55:58] ===================== [PASSED] guc_idm =====================
[13:55:58] =============== guc_klv_helpers (9 subtests) ===============
[13:55:58] [PASSED] test_count
[13:55:58] [PASSED] test_encode_u32
[13:55:58] [PASSED] test_encode_u64
[13:55:58] [PASSED] test_encode_string
[13:55:58] [PASSED] test_encode_object_raw
[13:55:58] [PASSED] test_encode_object_klv
[13:55:58] [PASSED] test_encode_object_nested
[13:55:58] [PASSED] test_encode_object_basic
[13:55:58] [PASSED] test_print
[13:55:58] ================= [PASSED] guc_klv_helpers =================
[13:55:58] ================== no_relay (3 subtests) ===================
[13:55:58] [PASSED] xe_drops_guc2pf_if_not_ready
[13:55:58] [PASSED] xe_drops_guc2vf_if_not_ready
[13:55:58] [PASSED] xe_rejects_send_if_not_ready
[13:55:58] ==================== [PASSED] no_relay =====================
[13:55:58] ================== pf_relay (14 subtests) ==================
[13:55:58] [PASSED] pf_rejects_guc2pf_too_short
[13:55:58] [PASSED] pf_rejects_guc2pf_too_long
[13:55:58] [PASSED] pf_rejects_guc2pf_no_payload
[13:55:58] [PASSED] pf_fails_no_payload
[13:55:58] [PASSED] pf_fails_bad_origin
[13:55:58] [PASSED] pf_fails_bad_type
[13:55:58] [PASSED] pf_txn_reports_error
[13:55:58] [PASSED] pf_txn_sends_pf2guc
[13:55:58] [PASSED] pf_sends_pf2guc
[13:55:58] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:55:58] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:55:58] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:55:58] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:55:58] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:55:58] ==================== [PASSED] pf_relay =====================
[13:55:58] ================== vf_relay (3 subtests) ===================
[13:55:58] [PASSED] vf_rejects_guc2vf_too_short
[13:55:58] [PASSED] vf_rejects_guc2vf_too_long
[13:55:58] [PASSED] vf_rejects_guc2vf_no_payload
[13:55:58] ==================== [PASSED] vf_relay =====================
[13:55:58] ================ pf_gt_config (9 subtests) =================
[13:55:58] [PASSED] fair_contexts_1vf
[13:55:58] [PASSED] fair_doorbells_1vf
[13:55:58] [PASSED] fair_ggtt_1vf
[13:55:58] ====================== fair_vram_1vf  ======================
[13:55:58] [PASSED] 3.50 GiB
[13:55:58] [PASSED] 11.5 GiB
[13:55:58] [PASSED] 15.5 GiB
[13:55:58] [PASSED] 31.5 GiB
[13:55:58] [PASSED] 63.5 GiB
[13:55:58] [PASSED] 1.91 GiB
[13:55:58] ================== [PASSED] fair_vram_1vf ==================
[13:55:58] ================ fair_vram_1vf_admin_only  =================
[13:55:58] [PASSED] 3.50 GiB
[13:55:58] [PASSED] 11.5 GiB
[13:55:58] [PASSED] 15.5 GiB
[13:55:58] [PASSED] 31.5 GiB
[13:55:58] [PASSED] 63.5 GiB
[13:55:58] [PASSED] 1.91 GiB
[13:55:58] ============ [PASSED] fair_vram_1vf_admin_only =============
[13:55:58] ====================== fair_contexts  ======================
[13:55:58] [PASSED] 1 VF
[13:55:58] [PASSED] 2 VFs
[13:55:58] [PASSED] 3 VFs
[13:55:58] [PASSED] 4 VFs
[13:55:58] [PASSED] 5 VFs
[13:55:58] [PASSED] 6 VFs
[13:55:58] [PASSED] 7 VFs
[13:55:58] [PASSED] 8 VFs
[13:55:58] [PASSED] 9 VFs
[13:55:58] [PASSED] 10 VFs
[13:55:58] [PASSED] 11 VFs
[13:55:58] [PASSED] 12 VFs
[13:55:58] [PASSED] 13 VFs
[13:55:58] [PASSED] 14 VFs
[13:55:58] [PASSED] 15 VFs
[13:55:58] [PASSED] 16 VFs
[13:55:58] [PASSED] 17 VFs
[13:55:58] [PASSED] 18 VFs
[13:55:58] [PASSED] 19 VFs
[13:55:58] [PASSED] 20 VFs
[13:55:58] [PASSED] 21 VFs
[13:55:58] [PASSED] 22 VFs
[13:55:58] [PASSED] 23 VFs
[13:55:58] [PASSED] 24 VFs
[13:55:58] [PASSED] 25 VFs
[13:55:58] [PASSED] 26 VFs
[13:55:58] [PASSED] 27 VFs
[13:55:58] [PASSED] 28 VFs
[13:55:58] [PASSED] 29 VFs
[13:55:58] [PASSED] 30 VFs
[13:55:58] [PASSED] 31 VFs
[13:55:58] [PASSED] 32 VFs
[13:55:58] [PASSED] 33 VFs
[13:55:58] [PASSED] 34 VFs
[13:55:58] [PASSED] 35 VFs
[13:55:58] [PASSED] 36 VFs
[13:55:58] [PASSED] 37 VFs
[13:55:58] [PASSED] 38 VFs
[13:55:58] [PASSED] 39 VFs
[13:55:58] [PASSED] 40 VFs
[13:55:58] [PASSED] 41 VFs
[13:55:58] [PASSED] 42 VFs
[13:55:58] [PASSED] 43 VFs
[13:55:58] [PASSED] 44 VFs
[13:55:58] [PASSED] 45 VFs
[13:55:58] [PASSED] 46 VFs
[13:55:58] [PASSED] 47 VFs
[13:55:58] [PASSED] 48 VFs
[13:55:58] [PASSED] 49 VFs
[13:55:58] [PASSED] 50 VFs
[13:55:58] [PASSED] 51 VFs
[13:55:58] [PASSED] 52 VFs
[13:55:58] [PASSED] 53 VFs
[13:55:58] [PASSED] 54 VFs
[13:55:58] [PASSED] 55 VFs
[13:55:58] [PASSED] 56 VFs
[13:55:58] [PASSED] 57 VFs
[13:55:58] [PASSED] 58 VFs
[13:55:58] [PASSED] 59 VFs
[13:55:58] [PASSED] 60 VFs
[13:55:58] [PASSED] 61 VFs
[13:55:58] [PASSED] 62 VFs
[13:55:58] [PASSED] 63 VFs
[13:55:58] ================== [PASSED] fair_contexts ==================
[13:55:58] ===================== fair_doorbells  ======================
[13:55:58] [PASSED] 1 VF
[13:55:58] [PASSED] 2 VFs
[13:55:58] [PASSED] 3 VFs
[13:55:58] [PASSED] 4 VFs
[13:55:58] [PASSED] 5 VFs
[13:55:58] [PASSED] 6 VFs
[13:55:58] [PASSED] 7 VFs
[13:55:58] [PASSED] 8 VFs
[13:55:58] [PASSED] 9 VFs
[13:55:58] [PASSED] 10 VFs
[13:55:58] [PASSED] 11 VFs
[13:55:58] [PASSED] 12 VFs
[13:55:58] [PASSED] 13 VFs
[13:55:58] [PASSED] 14 VFs
[13:55:58] [PASSED] 15 VFs
[13:55:58] [PASSED] 16 VFs
[13:55:58] [PASSED] 17 VFs
[13:55:58] [PASSED] 18 VFs
[13:55:58] [PASSED] 19 VFs
[13:55:58] [PASSED] 20 VFs
[13:55:58] [PASSED] 21 VFs
[13:55:58] [PASSED] 22 VFs
[13:55:58] [PASSED] 23 VFs
[13:55:58] [PASSED] 24 VFs
[13:55:58] [PASSED] 25 VFs
[13:55:58] [PASSED] 26 VFs
[13:55:58] [PASSED] 27 VFs
[13:55:58] [PASSED] 28 VFs
[13:55:58] [PASSED] 29 VFs
[13:55:58] [PASSED] 30 VFs
[13:55:58] [PASSED] 31 VFs
[13:55:58] [PASSED] 32 VFs
[13:55:58] [PASSED] 33 VFs
[13:55:58] [PASSED] 34 VFs
[13:55:58] [PASSED] 35 VFs
[13:55:58] [PASSED] 36 VFs
[13:55:58] [PASSED] 37 VFs
[13:55:58] [PASSED] 38 VFs
[13:55:58] [PASSED] 39 VFs
[13:55:58] [PASSED] 40 VFs
[13:55:58] [PASSED] 41 VFs
[13:55:58] [PASSED] 42 VFs
[13:55:58] [PASSED] 43 VFs
[13:55:58] [PASSED] 44 VFs
[13:55:58] [PASSED] 45 VFs
[13:55:58] [PASSED] 46 VFs
[13:55:58] [PASSED] 47 VFs
[13:55:58] [PASSED] 48 VFs
[13:55:58] [PASSED] 49 VFs
[13:55:58] [PASSED] 50 VFs
[13:55:58] [PASSED] 51 VFs
[13:55:58] [PASSED] 52 VFs
[13:55:58] [PASSED] 53 VFs
[13:55:58] [PASSED] 54 VFs
[13:55:58] [PASSED] 55 VFs
[13:55:58] [PASSED] 56 VFs
[13:55:58] [PASSED] 57 VFs
[13:55:58] [PASSED] 58 VFs
[13:55:58] [PASSED] 59 VFs
[13:55:58] [PASSED] 60 VFs
[13:55:58] [PASSED] 61 VFs
[13:55:58] [PASSED] 62 VFs
[13:55:58] [PASSED] 63 VFs
[13:55:58] ================= [PASSED] fair_doorbells ==================
[13:55:58] ======================== fair_ggtt  ========================
[13:55:58] [PASSED] 1 VF
[13:55:58] [PASSED] 2 VFs
[13:55:58] [PASSED] 3 VFs
[13:55:58] [PASSED] 4 VFs
[13:55:58] [PASSED] 5 VFs
[13:55:58] [PASSED] 6 VFs
[13:55:58] [PASSED] 7 VFs
[13:55:58] [PASSED] 8 VFs
[13:55:58] [PASSED] 9 VFs
[13:55:58] [PASSED] 10 VFs
[13:55:58] [PASSED] 11 VFs
[13:55:58] [PASSED] 12 VFs
[13:55:58] [PASSED] 13 VFs
[13:55:58] [PASSED] 14 VFs
[13:55:58] [PASSED] 15 VFs
[13:55:58] [PASSED] 16 VFs
[13:55:58] [PASSED] 17 VFs
[13:55:58] [PASSED] 18 VFs
[13:55:58] [PASSED] 19 VFs
[13:55:58] [PASSED] 20 VFs
[13:55:58] [PASSED] 21 VFs
[13:55:58] [PASSED] 22 VFs
[13:55:58] [PASSED] 23 VFs
[13:55:58] [PASSED] 24 VFs
[13:55:58] [PASSED] 25 VFs
[13:55:58] [PASSED] 26 VFs
[13:55:58] [PASSED] 27 VFs
[13:55:58] [PASSED] 28 VFs
[13:55:58] [PASSED] 29 VFs
[13:55:58] [PASSED] 30 VFs
[13:55:58] [PASSED] 31 VFs
[13:55:58] [PASSED] 32 VFs
[13:55:58] [PASSED] 33 VFs
[13:55:58] [PASSED] 34 VFs
[13:55:58] [PASSED] 35 VFs
[13:55:58] [PASSED] 36 VFs
[13:55:58] [PASSED] 37 VFs
[13:55:58] [PASSED] 38 VFs
[13:55:58] [PASSED] 39 VFs
[13:55:58] [PASSED] 40 VFs
[13:55:58] [PASSED] 41 VFs
[13:55:58] [PASSED] 42 VFs
[13:55:58] [PASSED] 43 VFs
[13:55:58] [PASSED] 44 VFs
[13:55:58] [PASSED] 45 VFs
[13:55:58] [PASSED] 46 VFs
[13:55:58] [PASSED] 47 VFs
[13:55:58] [PASSED] 48 VFs
[13:55:58] [PASSED] 49 VFs
[13:55:58] [PASSED] 50 VFs
[13:55:58] [PASSED] 51 VFs
[13:55:58] [PASSED] 52 VFs
[13:55:58] [PASSED] 53 VFs
[13:55:58] [PASSED] 54 VFs
[13:55:58] [PASSED] 55 VFs
[13:55:58] [PASSED] 56 VFs
[13:55:58] [PASSED] 57 VFs
[13:55:58] [PASSED] 58 VFs
[13:55:58] [PASSED] 59 VFs
[13:55:58] [PASSED] 60 VFs
[13:55:58] [PASSED] 61 VFs
[13:55:58] [PASSED] 62 VFs
[13:55:58] [PASSED] 63 VFs
[13:55:58] ==================== [PASSED] fair_ggtt ====================
[13:55:58] ======================== fair_vram  ========================
[13:55:58] [PASSED] 1 VF
[13:55:58] [PASSED] 2 VFs
[13:55:58] [PASSED] 3 VFs
[13:55:58] [PASSED] 4 VFs
[13:55:58] [PASSED] 5 VFs
[13:55:58] [PASSED] 6 VFs
[13:55:58] [PASSED] 7 VFs
[13:55:58] [PASSED] 8 VFs
[13:55:58] [PASSED] 9 VFs
[13:55:58] [PASSED] 10 VFs
[13:55:58] [PASSED] 11 VFs
[13:55:58] [PASSED] 12 VFs
[13:55:58] [PASSED] 13 VFs
[13:55:58] [PASSED] 14 VFs
[13:55:58] [PASSED] 15 VFs
[13:55:58] [PASSED] 16 VFs
[13:55:58] [PASSED] 17 VFs
[13:55:58] [PASSED] 18 VFs
[13:55:58] [PASSED] 19 VFs
[13:55:58] [PASSED] 20 VFs
[13:55:58] [PASSED] 21 VFs
[13:55:58] [PASSED] 22 VFs
[13:55:58] [PASSED] 23 VFs
[13:55:58] [PASSED] 24 VFs
[13:55:58] [PASSED] 25 VFs
[13:55:58] [PASSED] 26 VFs
[13:55:58] [PASSED] 27 VFs
[13:55:58] [PASSED] 28 VFs
[13:55:58] [PASSED] 29 VFs
[13:55:58] [PASSED] 30 VFs
[13:55:58] [PASSED] 31 VFs
[13:55:58] [PASSED] 32 VFs
[13:55:58] [PASSED] 33 VFs
[13:55:58] [PASSED] 34 VFs
[13:55:58] [PASSED] 35 VFs
[13:55:58] [PASSED] 36 VFs
[13:55:58] [PASSED] 37 VFs
[13:55:58] [PASSED] 38 VFs
[13:55:58] [PASSED] 39 VFs
[13:55:58] [PASSED] 40 VFs
[13:55:58] [PASSED] 41 VFs
[13:55:58] [PASSED] 42 VFs
[13:55:58] [PASSED] 43 VFs
[13:55:58] [PASSED] 44 VFs
[13:55:58] [PASSED] 45 VFs
[13:55:58] [PASSED] 46 VFs
[13:55:58] [PASSED] 47 VFs
[13:55:58] [PASSED] 48 VFs
[13:55:58] [PASSED] 49 VFs
[13:55:58] [PASSED] 50 VFs
[13:55:58] [PASSED] 51 VFs
[13:55:58] [PASSED] 52 VFs
[13:55:58] [PASSED] 53 VFs
[13:55:58] [PASSED] 54 VFs
[13:55:58] [PASSED] 55 VFs
[13:55:58] [PASSED] 56 VFs
[13:55:58] [PASSED] 57 VFs
[13:55:58] [PASSED] 58 VFs
[13:55:58] [PASSED] 59 VFs
[13:55:58] [PASSED] 60 VFs
[13:55:58] [PASSED] 61 VFs
[13:55:58] [PASSED] 62 VFs
[13:55:58] [PASSED] 63 VFs
[13:55:58] ==================== [PASSED] fair_vram ====================
[13:55:58] ================== [PASSED] pf_gt_config ===================
[13:55:58] ===================== lmtt (1 subtest) =====================
[13:55:58] ======================== test_ops  =========================
[13:55:58] [PASSED] 2-level
[13:55:58] [PASSED] multi-level
[13:55:58] ==================== [PASSED] test_ops =====================
[13:55:58] ====================== [PASSED] lmtt =======================
[13:55:58] ================= sriov_packet (1 subtest) =================
[13:55:58] [PASSED] test_descriptor_init
[13:55:58] ================== [PASSED] sriov_packet ===================
[13:55:58] ================= pf_service (11 subtests) =================
[13:55:58] [PASSED] pf_negotiate_any
[13:55:58] [PASSED] pf_negotiate_base_match
[13:55:58] [PASSED] pf_negotiate_base_newer
[13:55:58] [PASSED] pf_negotiate_base_next
[13:55:58] [SKIPPED] pf_negotiate_base_older (no older minor)
[13:55:58] [PASSED] pf_negotiate_base_prev
[13:55:58] [PASSED] pf_negotiate_latest_match
[13:55:58] [PASSED] pf_negotiate_latest_newer
[13:55:58] [PASSED] pf_negotiate_latest_next
[13:55:58] [SKIPPED] pf_negotiate_latest_older (no older minor)
[13:55:58] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[13:55:58] =================== [PASSED] pf_service ====================
[13:55:58] ================= xe_guc_g2g (2 subtests) ==================
[13:55:58] ============== xe_live_guc_g2g_kunit_default  ==============
[13:55:58] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[13:55:58] ============== xe_live_guc_g2g_kunit_allmem  ===============
[13:55:58] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[13:55:58] =================== [SKIPPED] xe_guc_g2g ===================
[13:55:58] =================== xe_mocs (2 subtests) ===================
[13:55:58] ================ xe_live_mocs_kernel_kunit  ================
[13:55:58] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[13:55:58] ================ xe_live_mocs_reset_kunit  =================
[13:55:58] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[13:55:58] ==================== [SKIPPED] xe_mocs =====================
[13:55:58] ================= xe_migrate (2 subtests) ==================
[13:55:58] ================= xe_migrate_sanity_kunit  =================
[13:55:58] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[13:55:58] ================== xe_validate_ccs_kunit  ==================
[13:55:58] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[13:55:58] =================== [SKIPPED] xe_migrate ===================
[13:55:58] ================== xe_dma_buf (1 subtest) ==================
[13:55:58] ==================== xe_dma_buf_kunit  =====================
[13:55:58] ================ [SKIPPED] xe_dma_buf_kunit ================
[13:55:58] =================== [SKIPPED] xe_dma_buf ===================
[13:55:58] ================= xe_bo_shrink (1 subtest) =================
[13:55:58] =================== xe_bo_shrink_kunit  ====================
[13:55:58] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[13:55:58] ================== [SKIPPED] xe_bo_shrink ==================
[13:55:58] ==================== xe_bo (2 subtests) ====================
[13:55:58] ================== xe_ccs_migrate_kunit  ===================
[13:55:58] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[13:55:58] ==================== xe_bo_evict_kunit  ====================
[13:55:58] =============== [SKIPPED] xe_bo_evict_kunit ================
[13:55:58] ===================== [SKIPPED] xe_bo ======================
[13:55:58] ==================== args (13 subtests) ====================
[13:55:58] [PASSED] count_args_test
[13:55:58] [PASSED] call_args_example
[13:55:58] [PASSED] call_args_test
[13:55:58] [PASSED] drop_first_arg_example
[13:55:58] [PASSED] drop_first_arg_test
[13:55:58] [PASSED] first_arg_example
[13:55:58] [PASSED] first_arg_test
[13:55:58] [PASSED] last_arg_example
[13:55:58] [PASSED] last_arg_test
[13:55:58] [PASSED] pick_arg_example
[13:55:58] [PASSED] if_args_example
[13:55:58] [PASSED] if_args_test
[13:55:58] [PASSED] sep_comma_example
[13:55:58] ====================== [PASSED] args =======================
[13:55:58] =================== xe_pci (3 subtests) ====================
[13:55:58] ==================== check_graphics_ip  ====================
[13:55:58] [PASSED] 12.00 Xe_LP
[13:55:58] [PASSED] 12.10 Xe_LP+
[13:55:58] [PASSED] 12.55 Xe_HPG
[13:55:58] [PASSED] 12.60 Xe_HPC
[13:55:58] [PASSED] 12.70 Xe_LPG
[13:55:58] [PASSED] 12.71 Xe_LPG
[13:55:58] [PASSED] 12.74 Xe_LPG+
[13:55:58] [PASSED] 20.01 Xe2_HPG
[13:55:58] [PASSED] 20.02 Xe2_HPG
[13:55:58] [PASSED] 20.04 Xe2_LPG
[13:55:58] [PASSED] 30.00 Xe3_LPG
[13:55:58] [PASSED] 30.01 Xe3_LPG
[13:55:58] [PASSED] 30.03 Xe3_LPG
[13:55:58] [PASSED] 30.04 Xe3_LPG
[13:55:58] [PASSED] 30.05 Xe3_LPG
[13:55:58] [PASSED] 35.10 Xe3p_LPG
[13:55:58] [PASSED] 35.11 Xe3p_XPC
[13:55:58] ================ [PASSED] check_graphics_ip ================
[13:55:58] ===================== check_media_ip  ======================
[13:55:58] [PASSED] 12.00 Xe_M
[13:55:58] [PASSED] 12.55 Xe_HPM
[13:55:58] [PASSED] 13.00 Xe_LPM+
[13:55:58] [PASSED] 13.01 Xe2_HPM
[13:55:58] [PASSED] 20.00 Xe2_LPM
[13:55:58] [PASSED] 30.00 Xe3_LPM
[13:55:58] [PASSED] 30.02 Xe3_LPM
[13:55:58] [PASSED] 35.00 Xe3p_LPM
[13:55:58] [PASSED] 35.03 Xe3p_HPM
[13:55:58] ================= [PASSED] check_media_ip ==================
[13:55:58] =================== check_platform_desc  ===================
[13:55:58] [PASSED] 0x9A60 (TIGERLAKE)
[13:55:58] [PASSED] 0x9A68 (TIGERLAKE)
[13:55:58] [PASSED] 0x9A70 (TIGERLAKE)
[13:55:58] [PASSED] 0x9A40 (TIGERLAKE)
[13:55:58] [PASSED] 0x9A49 (TIGERLAKE)
[13:55:58] [PASSED] 0x9A59 (TIGERLAKE)
[13:55:58] [PASSED] 0x9A78 (TIGERLAKE)
[13:55:58] [PASSED] 0x9AC0 (TIGERLAKE)
[13:55:58] [PASSED] 0x9AC9 (TIGERLAKE)
[13:55:58] [PASSED] 0x9AD9 (TIGERLAKE)
[13:55:58] [PASSED] 0x9AF8 (TIGERLAKE)
[13:55:58] [PASSED] 0x4C80 (ROCKETLAKE)
[13:55:58] [PASSED] 0x4C8A (ROCKETLAKE)
[13:55:58] [PASSED] 0x4C8B (ROCKETLAKE)
[13:55:58] [PASSED] 0x4C8C (ROCKETLAKE)
[13:55:58] [PASSED] 0x4C90 (ROCKETLAKE)
[13:55:58] [PASSED] 0x4C9A (ROCKETLAKE)
[13:55:58] [PASSED] 0x4680 (ALDERLAKE_S)
[13:55:58] [PASSED] 0x4682 (ALDERLAKE_S)
[13:55:58] [PASSED] 0x4688 (ALDERLAKE_S)
[13:55:58] [PASSED] 0x468A (ALDERLAKE_S)
[13:55:58] [PASSED] 0x468B (ALDERLAKE_S)
[13:55:58] [PASSED] 0x4690 (ALDERLAKE_S)
[13:55:58] [PASSED] 0x4692 (ALDERLAKE_S)
[13:55:58] [PASSED] 0x4693 (ALDERLAKE_S)
[13:55:58] [PASSED] 0x46A0 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46A1 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46A2 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46A3 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46A6 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46A8 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46AA (ALDERLAKE_P)
[13:55:58] [PASSED] 0x462A (ALDERLAKE_P)
[13:55:58] [PASSED] 0x4626 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x4628 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46B0 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46B1 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46B2 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46B3 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46C0 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46C1 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46C2 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46C3 (ALDERLAKE_P)
[13:55:58] [PASSED] 0x46D0 (ALDERLAKE_N)
[13:55:58] [PASSED] 0x46D1 (ALDERLAKE_N)
[13:55:58] [PASSED] 0x46D2 (ALDERLAKE_N)
[13:55:58] [PASSED] 0x46D3 (ALDERLAKE_N)
[13:55:58] [PASSED] 0x46D4 (ALDERLAKE_N)
[13:55:58] [PASSED] 0xA721 (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7A1 (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7A9 (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7AC (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7AD (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA720 (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7A0 (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7A8 (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7AA (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA7AB (ALDERLAKE_P)
[13:55:58] [PASSED] 0xA780 (ALDERLAKE_S)
[13:55:58] [PASSED] 0xA781 (ALDERLAKE_S)
[13:55:58] [PASSED] 0xA782 (ALDERLAKE_S)
[13:55:58] [PASSED] 0xA783 (ALDERLAKE_S)
[13:55:58] [PASSED] 0xA788 (ALDERLAKE_S)
[13:55:58] [PASSED] 0xA789 (ALDERLAKE_S)
[13:55:58] [PASSED] 0xA78A (ALDERLAKE_S)
[13:55:58] [PASSED] 0xA78B (ALDERLAKE_S)
[13:55:58] [PASSED] 0x4905 (DG1)
[13:55:58] [PASSED] 0x4906 (DG1)
[13:55:58] [PASSED] 0x4907 (DG1)
[13:55:58] [PASSED] 0x4908 (DG1)
[13:55:58] [PASSED] 0x4909 (DG1)
[13:55:58] [PASSED] 0x56C0 (DG2)
[13:55:58] [PASSED] 0x56C2 (DG2)
[13:55:58] [PASSED] 0x56C1 (DG2)
[13:55:58] [PASSED] 0x7D51 (METEORLAKE)
[13:55:58] [PASSED] 0x7DD1 (METEORLAKE)
[13:55:58] [PASSED] 0x7D41 (METEORLAKE)
[13:55:58] [PASSED] 0x7D67 (METEORLAKE)
[13:55:58] [PASSED] 0xB640 (METEORLAKE)
[13:55:58] [PASSED] 0x56A0 (DG2)
[13:55:58] [PASSED] 0x56A1 (DG2)
[13:55:58] [PASSED] 0x56A2 (DG2)
[13:55:58] [PASSED] 0x56BE (DG2)
[13:55:58] [PASSED] 0x56BF (DG2)
[13:55:58] [PASSED] 0x5690 (DG2)
[13:55:58] [PASSED] 0x5691 (DG2)
[13:55:58] [PASSED] 0x5692 (DG2)
[13:55:58] [PASSED] 0x56A5 (DG2)
[13:55:58] [PASSED] 0x56A6 (DG2)
[13:55:58] [PASSED] 0x56B0 (DG2)
[13:55:58] [PASSED] 0x56B1 (DG2)
[13:55:58] [PASSED] 0x56BA (DG2)
[13:55:58] [PASSED] 0x56BB (DG2)
[13:55:58] [PASSED] 0x56BC (DG2)
[13:55:58] [PASSED] 0x56BD (DG2)
[13:55:58] [PASSED] 0x5693 (DG2)
[13:55:58] [PASSED] 0x5694 (DG2)
[13:55:58] [PASSED] 0x5695 (DG2)
[13:55:58] [PASSED] 0x56A3 (DG2)
[13:55:58] [PASSED] 0x56A4 (DG2)
[13:55:58] [PASSED] 0x56B2 (DG2)
[13:55:58] [PASSED] 0x56B3 (DG2)
[13:55:58] [PASSED] 0x5696 (DG2)
[13:55:58] [PASSED] 0x5697 (DG2)
[13:55:58] [PASSED] 0xB69 (PVC)
[13:55:58] [PASSED] 0xB6E (PVC)
[13:55:58] [PASSED] 0xBD4 (PVC)
[13:55:58] [PASSED] 0xBD5 (PVC)
[13:55:58] [PASSED] 0xBD6 (PVC)
[13:55:58] [PASSED] 0xBD7 (PVC)
[13:55:58] [PASSED] 0xBD8 (PVC)
[13:55:58] [PASSED] 0xBD9 (PVC)
[13:55:58] [PASSED] 0xBDA (PVC)
[13:55:58] [PASSED] 0xBDB (PVC)
[13:55:58] [PASSED] 0xBE0 (PVC)
[13:55:58] [PASSED] 0xBE1 (PVC)
[13:55:58] [PASSED] 0xBE5 (PVC)
[13:55:58] [PASSED] 0x7D40 (METEORLAKE)
[13:55:58] [PASSED] 0x7D45 (METEORLAKE)
[13:55:58] [PASSED] 0x7D55 (METEORLAKE)
[13:55:58] [PASSED] 0x7D60 (METEORLAKE)
[13:55:58] [PASSED] 0x7DD5 (METEORLAKE)
[13:55:58] [PASSED] 0x6420 (LUNARLAKE)
[13:55:58] [PASSED] 0x64A0 (LUNARLAKE)
[13:55:58] [PASSED] 0x64B0 (LUNARLAKE)
[13:55:58] [PASSED] 0xE202 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE209 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE20B (BATTLEMAGE)
[13:55:58] [PASSED] 0xE20C (BATTLEMAGE)
[13:55:58] [PASSED] 0xE20D (BATTLEMAGE)
[13:55:58] [PASSED] 0xE210 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE211 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE212 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE216 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE220 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE221 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE222 (BATTLEMAGE)
[13:55:58] [PASSED] 0xE223 (BATTLEMAGE)
[13:55:58] [PASSED] 0xB080 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB081 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB082 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB083 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB084 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB085 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB086 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB087 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB08F (PANTHERLAKE)
[13:55:58] [PASSED] 0xB090 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB0A0 (PANTHERLAKE)
[13:55:58] [PASSED] 0xB0B0 (PANTHERLAKE)
[13:55:58] [PASSED] 0xFD80 (PANTHERLAKE)
[13:55:58] [PASSED] 0xFD81 (PANTHERLAKE)
[13:55:58] [PASSED] 0xD740 (NOVALAKE_S)
[13:55:58] [PASSED] 0xD741 (NOVALAKE_S)
[13:55:58] [PASSED] 0xD742 (NOVALAKE_S)
[13:55:58] [PASSED] 0xD743 (NOVALAKE_S)
[13:55:58] [PASSED] 0xD745 (NOVALAKE_S)
[13:55:58] [PASSED] 0xD74A (NOVALAKE_S)
[13:55:58] [PASSED] 0xD74B (NOVALAKE_S)
[13:55:58] [PASSED] 0x674C (CRESCENTISLAND)
[13:55:58] [PASSED] 0x674D (CRESCENTISLAND)
[13:55:58] [PASSED] 0x674E (CRESCENTISLAND)
[13:55:58] [PASSED] 0x674F (CRESCENTISLAND)
[13:55:58] [PASSED] 0x6750 (CRESCENTISLAND)
[13:55:58] [PASSED] 0xD750 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD751 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD752 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD753 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD754 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD755 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD756 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD757 (NOVALAKE_P)
[13:55:58] [PASSED] 0xD75F (NOVALAKE_P)
[13:55:58] =============== [PASSED] check_platform_desc ===============
[13:55:58] ===================== [PASSED] xe_pci ======================
[13:55:58] ============= xe_rtp_tables_test (5 subtests) ==============
[13:55:58] ================== xe_rtp_table_gt_test  ===================
[13:55:58] [PASSED] gt_was/14011060649
[13:55:58] [PASSED] gt_was/14011059788
[13:55:58] [PASSED] gt_was/14015795083
[13:55:58] [PASSED] gt_was/16021867713
[13:55:58] [PASSED] gt_was/14019449301
[13:55:58] [PASSED] gt_was/16028005424
[13:55:58] [PASSED] gt_was/14026578760
[13:55:58] [PASSED] gt_was/1409420604
[13:55:58] [PASSED] gt_was/1408615072
[13:55:58] [PASSED] gt_was/22010523718
[13:55:58] [PASSED] gt_was/14011006942
[13:55:58] [PASSED] gt_was/14014830051
[13:55:58] [PASSED] gt_was/18018781329
[13:55:58] [PASSED] gt_was/1509235366
[13:55:58] [PASSED] gt_was/18018781329
[13:55:58] [PASSED] gt_was/16016694945
[13:55:58] [PASSED] gt_was/14018575942
[13:55:58] [PASSED] gt_was/22016670082
[13:55:58] [PASSED] gt_was/22016670082
[13:55:58] [PASSED] gt_was/14017421178
[13:55:58] [PASSED] gt_was/16025250150
[13:55:58] [PASSED] gt_was/14021871409
[13:55:58] [PASSED] gt_was/16021865536
[13:55:58] [PASSED] gt_was/14021486841
[13:55:58] [PASSED] gt_was/14025160223
[13:55:58] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[13:55:58] [PASSED] gt_was/14025635424
[13:55:58] [PASSED] gt_was/16028005424
[13:55:58] ============== [PASSED] xe_rtp_table_gt_test ===============
[13:55:58] ================== xe_rtp_table_gt_test  ===================
[13:55:58] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[13:55:58] [PASSED] gt_tunings/Tuning: 32B Access Enable
[13:55:58] [PASSED] gt_tunings/Tuning: L3 cache
[13:55:58] [PASSED] gt_tunings/Tuning: L3 cache - media
[13:55:58] [PASSED] gt_tunings/Tuning: Compression Overfetch
[13:55:58] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[13:55:58] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[13:55:58] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[13:55:58] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[13:55:58] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[13:55:58] [PASSED] gt_tunings/Tuning: Stateless compression control
[13:55:58] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[13:55:58] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[13:55:58] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[13:55:58] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[13:55:58] ============== [PASSED] xe_rtp_table_gt_test ===============
[13:55:58] ================== xe_rtp_table_oob_test  ==================
[13:55:58] [PASSED] oob_was/1607983814
[13:55:58] [PASSED] oob_was/16010904313
[13:55:58] [PASSED] oob_was/18022495364
[13:55:58] [PASSED] oob_was/22012773006
[13:55:58] [PASSED] oob_was/14014475959
[13:55:58] [PASSED] oob_was/22011391025
[13:55:58] [PASSED] oob_was/22012727170
[13:55:58] [PASSED] oob_was/22012727685
[13:55:58] [PASSED] oob_was/22016596838
[13:55:58] [PASSED] oob_was/18020744125
[13:55:58] [PASSED] oob_was/1409600907
[13:55:58] [PASSED] oob_was/22014953428
[13:55:58] [PASSED] oob_was/16017236439
[13:55:58] [PASSED] oob_was/14019821291
[13:55:58] [PASSED] oob_was/14015076503
[13:55:58] [PASSED] oob_was/14018913170
[13:55:58] [PASSED] oob_was/14018094691
[13:55:58] [PASSED] oob_was/18024947630
[13:55:58] [PASSED] oob_was/16022287689
[13:55:58] [PASSED] oob_was/13011645652
[13:55:58] [PASSED] oob_was/14022293748
[13:55:58] [PASSED] oob_was/22019794406
[13:55:58] [PASSED] oob_was/22019338487
[13:55:58] [PASSED] oob_was/16023588340
[13:55:58] [PASSED] oob_was/14019789679
[13:55:58] [PASSED] oob_was/14022866841
[13:55:58] [PASSED] oob_was/16021333562
[13:55:58] [PASSED] oob_was/14016712196
[13:55:58] [PASSED] oob_was/14015568240
[13:55:58] [PASSED] oob_was/18013179988
[13:55:58] [PASSED] oob_was/1508761755
[13:55:58] [PASSED] oob_was/16023105232
[13:55:58] [PASSED] oob_was/16026508708
[13:55:58] [PASSED] oob_was/14020001231
[13:55:58] [PASSED] oob_was/16023683509
[13:55:58] [PASSED] oob_was/14025515070
[13:55:58] [PASSED] oob_was/15015404425_disable
[13:55:58] [PASSED] oob_was/16026007364
[13:55:58] [PASSED] oob_was/14020316580
[13:55:58] [PASSED] oob_was/14025883347
[13:55:58] [PASSED] oob_was/16029380221
[13:55:58] [PASSED] oob_was/22022079272
[13:55:58] [PASSED] oob_was/16029897822
[13:55:58] [PASSED] oob_was/14027054324
[13:55:58] ============== [PASSED] xe_rtp_table_oob_test ==============
[13:55:58] ================ xe_rtp_table_dev_oob_test  ================
[13:55:58] [PASSED] device_oob_was/22010954014
[13:55:58] [PASSED] device_oob_was/15015404425
[13:55:58] [PASSED] device_oob_was/22019338487_display
[13:55:58] [PASSED] device_oob_was/14022085890
[13:55:58] [PASSED] device_oob_was/14026539277
[13:55:58] [PASSED] device_oob_was/14026633728
[13:55:58] [PASSED] device_oob_was/14026746987
[13:55:58] [PASSED] device_oob_was/14026779378
[13:55:58] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[13:55:58] ========== xe_rtp_table_missing_upper_bound_test  ==========
[13:55:58] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[13:55:58] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[13:55:58] [PASSED] register_whitelist/1806527549
[13:55:58] [PASSED] register_whitelist/allow_read_ctx_timestamp
[13:55:58] [PASSED] register_whitelist/allow_read_queue_timestamp
[13:55:58] [PASSED] register_whitelist/16014440446
[13:55:58] [PASSED] register_whitelist/16017236439
[13:55:58] [PASSED] register_whitelist/16020183090
[13:55:58] [PASSED] register_whitelist/14024997852
[13:55:58] [PASSED] register_whitelist/14024997852
[13:55:58] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[13:55:58] =============== [PASSED] xe_rtp_tables_test ================
[13:55:58] =================== xe_rtp (3 subtests) ====================
[13:55:58] =================== xe_rtp_rules_tests  ====================
[13:55:58] [PASSED] no
[13:55:58] [PASSED] yes
[13:55:58] [PASSED] no-and-no
[13:55:58] [PASSED] no-and-yes
[13:55:58] [PASSED] yes-and-no
[13:55:58] [PASSED] yes-and-yes
[13:55:58] [PASSED] no-or-no
[13:55:58] [PASSED] no-or-yes
[13:55:58] [PASSED] yes-or-no
[13:55:58] [PASSED] yes-or-yes
[13:55:58] [PASSED] no-yes-or-yes-no
[13:55:58] [PASSED] no-yes-or-yes-yes
[13:55:58] [PASSED] yes-yes-or-no-yes
[13:55:58] [PASSED] yes-yes-or-yes-yes
[13:55:58] [PASSED] no-no-or-yes-or-no
[13:55:58] [PASSED] or
[13:55:58] [PASSED] or-yes
[13:55:58] [PASSED] or-no
[13:55:58] [PASSED] yes-or
[13:55:58] [PASSED] no-or
[13:55:58] [PASSED] no-or-or-yes
[13:55:58] [PASSED] yes-or-or-no
[13:55:58] [PASSED] no-or-or-no
[13:55:58] [PASSED] missing-context-engine-class
[13:55:58] [PASSED] missing-context-engine-class-or-yes
[13:55:58] [PASSED] missing-context-engine-class-or-or-yes
[13:55:58] =============== [PASSED] xe_rtp_rules_tests ================
[13:55:58] =============== xe_rtp_process_to_sr_tests  ================
[13:55:58] [PASSED] coalesce-same-reg
[13:55:58] [PASSED] coalesce-same-reg-literal-and-func
[13:55:58] [PASSED] no-match-no-add
[13:55:58] [PASSED] two-regs-two-entries
[13:55:58] [PASSED] clr-one-set-other
[13:55:58] [PASSED] set-field
[13:55:58] [PASSED] conflict-duplicate
[13:55:58] [PASSED] conflict-not-disjoint
[13:55:58] [PASSED] conflict-not-disjoint-literal-and-func
[13:55:58] [PASSED] conflict-reg-type
[13:55:58] [PASSED] bad-mcr-reg-forced-to-regular
[13:55:58] [PASSED] bad-regular-reg-forced-to-mcr
[13:55:58] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[13:55:58] ================== xe_rtp_process_tests  ===================
[13:55:58] [PASSED] active1
[13:55:58] [PASSED] active2
[13:55:58] [PASSED] active-inactive
[13:55:58] [PASSED] inactive-active
[13:55:58] [PASSED] inactive-active-inactive
[13:55:58] [PASSED] inactive-inactive-inactive
[13:55:58] ============== [PASSED] xe_rtp_process_tests ===============
[13:55:58] ===================== [PASSED] xe_rtp ======================
[13:55:58] ==================== xe_wa (1 subtest) =====================
[13:55:58] ======================== xe_wa_gt  =========================
[13:55:58] [PASSED] TIGERLAKE B0
[13:55:58] [PASSED] DG1 A0
[13:55:58] [PASSED] DG1 B0
[13:55:58] [PASSED] ALDERLAKE_S A0
[13:55:58] [PASSED] ALDERLAKE_S B0
[13:55:58] [PASSED] ALDERLAKE_S C0
[13:55:58] [PASSED] ALDERLAKE_S D0
[13:55:58] [PASSED] ALDERLAKE_P A0
[13:55:58] [PASSED] ALDERLAKE_P B0
[13:55:58] [PASSED] ALDERLAKE_P C0
[13:55:58] [PASSED] ALDERLAKE_S RPLS D0
[13:55:58] [PASSED] ALDERLAKE_P RPLU E0
[13:55:58] [PASSED] DG2 G10 C0
[13:55:58] [PASSED] DG2 G11 B1
[13:55:58] [PASSED] DG2 G12 A1
[13:55:58] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:55:58] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:55:58] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[13:55:58] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[13:55:58] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[13:55:58] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[13:55:58] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[13:55:58] ==================== [PASSED] xe_wa_gt =====================
[13:55:58] ====================== [PASSED] xe_wa ======================
[13:55:58] ============================================================
[13:55:58] Testing complete. Ran 742 tests: passed: 724, skipped: 18
[13:55:59] Elapsed time: 36.861s total, 4.396s configuring, 31.799s building, 0.631s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:55:59] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:56:01] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:56:25] Starting KUnit Kernel (1/1)...
[13:56:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:56:25] ============ drm_test_pick_cmdline (2 subtests) ============
[13:56:25] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:56:25] =============== drm_test_pick_cmdline_named  ===============
[13:56:25] [PASSED] NTSC
[13:56:25] [PASSED] NTSC-J
[13:56:25] [PASSED] PAL
[13:56:25] [PASSED] PAL-M
[13:56:25] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:56:25] ============== [PASSED] drm_test_pick_cmdline ==============
[13:56:25] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[13:56:25] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[13:56:25] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[13:56:25] =========== drm_validate_clone_mode (2 subtests) ===========
[13:56:25] ============== drm_test_check_in_clone_mode  ===============
[13:56:25] [PASSED] in_clone_mode
[13:56:25] [PASSED] not_in_clone_mode
[13:56:25] ========== [PASSED] drm_test_check_in_clone_mode ===========
[13:56:25] =============== drm_test_check_valid_clones  ===============
[13:56:25] [PASSED] not_in_clone_mode
[13:56:25] [PASSED] valid_clone
[13:56:25] [PASSED] invalid_clone
[13:56:25] =========== [PASSED] drm_test_check_valid_clones ===========
[13:56:25] ============= [PASSED] drm_validate_clone_mode =============
[13:56:25] ============= drm_validate_modeset (1 subtest) =============
[13:56:25] [PASSED] drm_test_check_connector_changed_modeset
[13:56:25] ============== [PASSED] drm_validate_modeset ===============
[13:56:25] ====== drm_test_bridge_get_current_state (1 subtest) =======
[13:56:25] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[13:56:25] ======== [PASSED] drm_test_bridge_get_current_state ========
[13:56:25] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[13:56:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[13:56:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[13:56:25] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[13:56:25] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[13:56:25] ============== drm_bridge_alloc (2 subtests) ===============
[13:56:25] [PASSED] drm_test_drm_bridge_alloc_basic
[13:56:25] [PASSED] drm_test_drm_bridge_alloc_get_put
[13:56:25] ================ [PASSED] drm_bridge_alloc =================
[13:56:25] ============= drm_bridge_bus_fmt (5 subtests) ==============
[13:56:25] [PASSED] drm_test_bridge_rgb_yuv_rgb
[13:56:25] [PASSED] drm_test_bridge_must_convert_to_yuv444
[13:56:25] [PASSED] drm_test_bridge_hdmi_auto_rgb
[13:56:25] [PASSED] drm_test_bridge_auto_first
[13:56:25] [PASSED] drm_test_bridge_rgb_yuv_no_path
[13:56:25] =============== [PASSED] drm_bridge_bus_fmt ================
[13:56:25] ============= drm_cmdline_parser (40 subtests) =============
[13:56:25] [PASSED] drm_test_cmdline_force_d_only
[13:56:25] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:56:25] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:56:25] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:56:25] [PASSED] drm_test_cmdline_force_e_only
[13:56:25] [PASSED] drm_test_cmdline_res
[13:56:25] [PASSED] drm_test_cmdline_res_vesa
[13:56:25] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:56:25] [PASSED] drm_test_cmdline_res_rblank
[13:56:25] [PASSED] drm_test_cmdline_res_bpp
[13:56:25] [PASSED] drm_test_cmdline_res_refresh
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:56:25] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:56:25] [PASSED] drm_test_cmdline_res_margins_force_on
[13:56:25] [PASSED] drm_test_cmdline_res_vesa_margins
[13:56:25] [PASSED] drm_test_cmdline_name
[13:56:25] [PASSED] drm_test_cmdline_name_bpp
[13:56:25] [PASSED] drm_test_cmdline_name_option
[13:56:25] [PASSED] drm_test_cmdline_name_bpp_option
[13:56:25] [PASSED] drm_test_cmdline_rotate_0
[13:56:25] [PASSED] drm_test_cmdline_rotate_90
[13:56:25] [PASSED] drm_test_cmdline_rotate_180
[13:56:25] [PASSED] drm_test_cmdline_rotate_270
[13:56:25] [PASSED] drm_test_cmdline_hmirror
[13:56:25] [PASSED] drm_test_cmdline_vmirror
[13:56:25] [PASSED] drm_test_cmdline_margin_options
[13:56:25] [PASSED] drm_test_cmdline_multiple_options
[13:56:25] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:56:25] [PASSED] drm_test_cmdline_extra_and_option
[13:56:25] [PASSED] drm_test_cmdline_freestanding_options
[13:56:25] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:56:25] [PASSED] drm_test_cmdline_panel_orientation
[13:56:25] ================ drm_test_cmdline_invalid  =================
[13:56:25] [PASSED] margin_only
[13:56:25] [PASSED] interlace_only
[13:56:25] [PASSED] res_missing_x
[13:56:25] [PASSED] res_missing_y
[13:56:25] [PASSED] res_bad_y
[13:56:25] [PASSED] res_missing_y_bpp
[13:56:25] [PASSED] res_bad_bpp
[13:56:25] [PASSED] res_bad_refresh
[13:56:25] [PASSED] res_bpp_refresh_force_on_off
[13:56:25] [PASSED] res_invalid_mode
[13:56:25] [PASSED] res_bpp_wrong_place_mode
[13:56:25] [PASSED] name_bpp_refresh
[13:56:25] [PASSED] name_refresh
[13:56:25] [PASSED] name_refresh_wrong_mode
[13:56:25] [PASSED] name_refresh_invalid_mode
[13:56:25] [PASSED] rotate_multiple
[13:56:25] [PASSED] rotate_invalid_val
[13:56:25] [PASSED] rotate_truncated
[13:56:25] [PASSED] invalid_option
[13:56:25] [PASSED] invalid_tv_option
[13:56:25] [PASSED] truncated_tv_option
[13:56:25] ============ [PASSED] drm_test_cmdline_invalid =============
[13:56:25] =============== drm_test_cmdline_tv_options  ===============
[13:56:25] [PASSED] NTSC
[13:56:25] [PASSED] NTSC_443
[13:56:25] [PASSED] NTSC_J
[13:56:25] [PASSED] PAL
[13:56:25] [PASSED] PAL_M
[13:56:25] [PASSED] PAL_N
[13:56:25] [PASSED] SECAM
[13:56:25] [PASSED] MONO_525
[13:56:25] [PASSED] MONO_625
[13:56:25] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:56:25] =============== [PASSED] drm_cmdline_parser ================
[13:56:25] ========== drmm_connector_hdmi_init (20 subtests) ==========
[13:56:25] [PASSED] drm_test_connector_hdmi_init_valid
[13:56:25] [PASSED] drm_test_connector_hdmi_init_bpc_8
[13:56:25] [PASSED] drm_test_connector_hdmi_init_bpc_10
[13:56:25] [PASSED] drm_test_connector_hdmi_init_bpc_12
[13:56:25] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[13:56:25] [PASSED] drm_test_connector_hdmi_init_bpc_null
[13:56:25] [PASSED] drm_test_connector_hdmi_init_formats_empty
[13:56:25] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[13:56:25] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[13:56:25] [PASSED] supported_formats=0x9 yuv420_allowed=1
[13:56:25] [PASSED] supported_formats=0x9 yuv420_allowed=0
[13:56:25] [PASSED] supported_formats=0x5 yuv420_allowed=1
[13:56:25] [PASSED] supported_formats=0x5 yuv420_allowed=0
[13:56:25] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[13:56:25] [PASSED] drm_test_connector_hdmi_init_null_ddc
[13:56:25] [PASSED] drm_test_connector_hdmi_init_null_product
[13:56:25] [PASSED] drm_test_connector_hdmi_init_null_vendor
[13:56:25] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[13:56:25] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[13:56:25] [PASSED] drm_test_connector_hdmi_init_product_valid
[13:56:25] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[13:56:25] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[13:56:25] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[13:56:25] ========= drm_test_connector_hdmi_init_type_valid  =========
[13:56:25] [PASSED] HDMI-A
[13:56:25] [PASSED] HDMI-B
[13:56:25] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[13:56:25] ======== drm_test_connector_hdmi_init_type_invalid  ========
[13:56:25] [PASSED] Unknown
[13:56:25] [PASSED] VGA
[13:56:25] [PASSED] DVI-I
[13:56:25] [PASSED] DVI-D
[13:56:25] [PASSED] DVI-A
[13:56:25] [PASSED] Composite
[13:56:25] [PASSED] SVIDEO
[13:56:25] [PASSED] LVDS
[13:56:25] [PASSED] Component
[13:56:25] [PASSED] DIN
[13:56:25] [PASSED] DP
[13:56:25] [PASSED] TV
[13:56:25] [PASSED] eDP
[13:56:25] [PASSED] Virtual
[13:56:25] [PASSED] DSI
[13:56:25] [PASSED] DPI
[13:56:25] [PASSED] Writeback
[13:56:25] [PASSED] SPI
[13:56:25] [PASSED] USB
[13:56:25] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[13:56:25] ============ [PASSED] drmm_connector_hdmi_init =============
[13:56:25] ============= drmm_connector_init (3 subtests) =============
[13:56:25] [PASSED] drm_test_drmm_connector_init
[13:56:25] [PASSED] drm_test_drmm_connector_init_null_ddc
[13:56:25] ========= drm_test_drmm_connector_init_type_valid  =========
[13:56:25] [PASSED] Unknown
[13:56:25] [PASSED] VGA
[13:56:25] [PASSED] DVI-I
[13:56:25] [PASSED] DVI-D
[13:56:25] [PASSED] DVI-A
[13:56:25] [PASSED] Composite
[13:56:25] [PASSED] SVIDEO
[13:56:25] [PASSED] LVDS
[13:56:25] [PASSED] Component
[13:56:25] [PASSED] DIN
[13:56:25] [PASSED] DP
[13:56:25] [PASSED] HDMI-A
[13:56:25] [PASSED] HDMI-B
[13:56:25] [PASSED] TV
[13:56:25] [PASSED] eDP
[13:56:25] [PASSED] Virtual
[13:56:25] [PASSED] DSI
[13:56:25] [PASSED] DPI
[13:56:25] [PASSED] Writeback
[13:56:25] [PASSED] SPI
[13:56:25] [PASSED] USB
[13:56:25] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[13:56:25] =============== [PASSED] drmm_connector_init ===============
[13:56:25] ========= drm_connector_dynamic_init (6 subtests) ==========
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_init
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_init_properties
[13:56:25] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[13:56:25] [PASSED] Unknown
[13:56:25] [PASSED] VGA
[13:56:25] [PASSED] DVI-I
[13:56:25] [PASSED] DVI-D
[13:56:25] [PASSED] DVI-A
[13:56:25] [PASSED] Composite
[13:56:25] [PASSED] SVIDEO
[13:56:25] [PASSED] LVDS
[13:56:25] [PASSED] Component
[13:56:25] [PASSED] DIN
[13:56:25] [PASSED] DP
[13:56:25] [PASSED] HDMI-A
[13:56:25] [PASSED] HDMI-B
[13:56:25] [PASSED] TV
[13:56:25] [PASSED] eDP
[13:56:25] [PASSED] Virtual
[13:56:25] [PASSED] DSI
[13:56:25] [PASSED] DPI
[13:56:25] [PASSED] Writeback
[13:56:25] [PASSED] SPI
[13:56:25] [PASSED] USB
[13:56:25] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[13:56:25] ======== drm_test_drm_connector_dynamic_init_name  =========
[13:56:25] [PASSED] Unknown
[13:56:25] [PASSED] VGA
[13:56:25] [PASSED] DVI-I
[13:56:25] [PASSED] DVI-D
[13:56:25] [PASSED] DVI-A
[13:56:25] [PASSED] Composite
[13:56:25] [PASSED] SVIDEO
[13:56:25] [PASSED] LVDS
[13:56:25] [PASSED] Component
[13:56:25] [PASSED] DIN
[13:56:25] [PASSED] DP
[13:56:25] [PASSED] HDMI-A
[13:56:25] [PASSED] HDMI-B
[13:56:25] [PASSED] TV
[13:56:25] [PASSED] eDP
[13:56:25] [PASSED] Virtual
[13:56:25] [PASSED] DSI
[13:56:25] [PASSED] DPI
[13:56:25] [PASSED] Writeback
[13:56:25] [PASSED] SPI
[13:56:25] [PASSED] USB
[13:56:25] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[13:56:25] =========== [PASSED] drm_connector_dynamic_init ============
[13:56:25] ==== drm_connector_dynamic_register_early (4 subtests) =====
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[13:56:25] ====== [PASSED] drm_connector_dynamic_register_early =======
[13:56:25] ======= drm_connector_dynamic_register (7 subtests) ========
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[13:56:25] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[13:56:25] ========= [PASSED] drm_connector_dynamic_register ==========
[13:56:25] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[13:56:25] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[13:56:25] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[13:56:25] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[13:56:25] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:56:25] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:56:25] [PASSED] NTSC
[13:56:25] [PASSED] NTSC-443
[13:56:25] [PASSED] NTSC-J
[13:56:25] [PASSED] PAL
[13:56:25] [PASSED] PAL-M
[13:56:25] [PASSED] PAL-N
[13:56:25] [PASSED] SECAM
[13:56:25] [PASSED] Mono
[13:56:25] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:56:25] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:56:25] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:56:25] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[13:56:25] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[13:56:25] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[13:56:25] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[13:56:25] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[13:56:25] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[13:56:25] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[13:56:25] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[13:56:25] [PASSED] VIC 96
[13:56:25] [PASSED] VIC 97
[13:56:25] [PASSED] VIC 101
[13:56:25] [PASSED] VIC 102
[13:56:25] [PASSED] VIC 106
[13:56:25] [PASSED] VIC 107
[13:56:25] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[13:56:25] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[13:56:25] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[13:56:25] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[13:56:25] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[13:56:25] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[13:56:25] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[13:56:25] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[13:56:25] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[13:56:25] [PASSED] Automatic
[13:56:25] [PASSED] Full
[13:56:25] [PASSED] Limited 16:235
[13:56:25] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[13:56:25] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[13:56:25] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[13:56:25] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[13:56:25] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[13:56:25] [PASSED] RGB
[13:56:25] [PASSED] YUV 4:2:0
[13:56:25] [PASSED] YUV 4:2:2
[13:56:25] [PASSED] YUV 4:4:4
[13:56:25] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[13:56:25] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[13:56:25] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[13:56:25] ============= drm_damage_helper (21 subtests) ==============
[13:56:25] [PASSED] drm_test_damage_iter_no_damage
[13:56:25] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:56:25] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:56:25] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:56:25] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:56:25] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:56:25] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:56:25] [PASSED] drm_test_damage_iter_simple_damage
[13:56:25] [PASSED] drm_test_damage_iter_single_damage
[13:56:25] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:56:25] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:56:25] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:56:25] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:56:25] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:56:25] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:56:25] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:56:25] [PASSED] drm_test_damage_iter_damage
[13:56:25] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:56:25] [PASSED] drm_test_damage_iter_damage_one_outside
[13:56:25] [PASSED] drm_test_damage_iter_damage_src_moved
[13:56:25] [PASSED] drm_test_damage_iter_damage_not_visible
[13:56:25] ================ [PASSED] drm_damage_helper ================
[13:56:25] ============== drm_dp_mst_helper (3 subtests) ==============
[13:56:25] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:56:25] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:56:25] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:56:25] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:56:25] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:56:25] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:56:25] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:56:25] ============== drm_test_dp_mst_calc_pbn_div  ===============
[13:56:25] [PASSED] Link rate 2000000 lane count 4
[13:56:25] [PASSED] Link rate 2000000 lane count 2
[13:56:25] [PASSED] Link rate 2000000 lane count 1
[13:56:25] [PASSED] Link rate 1350000 lane count 4
[13:56:25] [PASSED] Link rate 1350000 lane count 2
[13:56:25] [PASSED] Link rate 1350000 lane count 1
[13:56:25] [PASSED] Link rate 1000000 lane count 4
[13:56:25] [PASSED] Link rate 1000000 lane count 2
[13:56:25] [PASSED] Link rate 1000000 lane count 1
[13:56:25] [PASSED] Link rate 810000 lane count 4
[13:56:25] [PASSED] Link rate 810000 lane count 2
[13:56:25] [PASSED] Link rate 810000 lane count 1
[13:56:25] [PASSED] Link rate 540000 lane count 4
[13:56:25] [PASSED] Link rate 540000 lane count 2
[13:56:25] [PASSED] Link rate 540000 lane count 1
[13:56:25] [PASSED] Link rate 270000 lane count 4
[13:56:25] [PASSED] Link rate 270000 lane count 2
[13:56:25] [PASSED] Link rate 270000 lane count 1
[13:56:25] [PASSED] Link rate 162000 lane count 4
[13:56:25] [PASSED] Link rate 162000 lane count 2
[13:56:25] [PASSED] Link rate 162000 lane count 1
[13:56:25] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[13:56:25] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:56:25] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:56:25] [PASSED] DP_POWER_UP_PHY with port number
[13:56:25] [PASSED] DP_POWER_DOWN_PHY with port number
[13:56:25] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:56:25] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:56:25] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:56:25] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:56:25] [PASSED] DP_QUERY_PAYLOAD with port number
[13:56:25] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:56:25] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:56:25] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:56:25] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:56:25] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:56:25] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:56:25] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:56:25] [PASSED] DP_REMOTE_I2C_READ with port number
[13:56:25] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:56:25] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:56:25] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:56:25] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:56:25] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:56:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:56:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:56:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:56:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:56:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:56:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:56:25] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:56:25] ================ [PASSED] drm_dp_mst_helper ================
[13:56:25] ================== drm_exec (7 subtests) ===================
[13:56:25] [PASSED] sanitycheck
[13:56:25] [PASSED] test_lock
[13:56:25] [PASSED] test_lock_unlock
[13:56:25] [PASSED] test_duplicates
[13:56:25] [PASSED] test_prepare
[13:56:25] [PASSED] test_prepare_array
[13:56:25] [PASSED] test_multiple_loops
[13:56:25] ==================== [PASSED] drm_exec =====================
[13:56:25] =========== drm_format_helper_test (17 subtests) ===========
[13:56:25] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:56:25] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:56:25] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:56:25] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:56:25] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:56:25] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:56:25] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:56:25] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[13:56:25] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:56:25] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:56:25] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:56:25] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:56:25] ==================== drm_test_fb_swab  =====================
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ================ [PASSED] drm_test_fb_swab =================
[13:56:25] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[13:56:25] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[13:56:25] [PASSED] single_pixel_source_buffer
[13:56:25] [PASSED] single_pixel_clip_rectangle
[13:56:25] [PASSED] well_known_colors
[13:56:25] [PASSED] destination_pitch
[13:56:25] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[13:56:25] ================= drm_test_fb_clip_offset  =================
[13:56:25] [PASSED] pass through
[13:56:25] [PASSED] horizontal offset
[13:56:25] [PASSED] vertical offset
[13:56:25] [PASSED] horizontal and vertical offset
[13:56:25] [PASSED] horizontal offset (custom pitch)
[13:56:25] [PASSED] vertical offset (custom pitch)
[13:56:25] [PASSED] horizontal and vertical offset (custom pitch)
[13:56:25] ============= [PASSED] drm_test_fb_clip_offset =============
[13:56:25] =================== drm_test_fb_memcpy  ====================
[13:56:25] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[13:56:25] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[13:56:25] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[13:56:25] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[13:56:25] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[13:56:25] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[13:56:25] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[13:56:25] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[13:56:25] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[13:56:25] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[13:56:25] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[13:56:25] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[13:56:25] =============== [PASSED] drm_test_fb_memcpy ================
[13:56:25] ============= [PASSED] drm_format_helper_test ==============
[13:56:25] ================= drm_format (18 subtests) =================
[13:56:25] [PASSED] drm_test_format_block_width_invalid
[13:56:25] [PASSED] drm_test_format_block_width_one_plane
[13:56:25] [PASSED] drm_test_format_block_width_two_plane
[13:56:25] [PASSED] drm_test_format_block_width_three_plane
[13:56:25] [PASSED] drm_test_format_block_width_tiled
[13:56:25] [PASSED] drm_test_format_block_height_invalid
[13:56:25] [PASSED] drm_test_format_block_height_one_plane
[13:56:25] [PASSED] drm_test_format_block_height_two_plane
[13:56:25] [PASSED] drm_test_format_block_height_three_plane
[13:56:25] [PASSED] drm_test_format_block_height_tiled
[13:56:25] [PASSED] drm_test_format_min_pitch_invalid
[13:56:25] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:56:25] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:56:25] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:56:25] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:56:25] [PASSED] drm_test_format_min_pitch_two_plane
[13:56:25] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:56:25] [PASSED] drm_test_format_min_pitch_tiled
[13:56:25] =================== [PASSED] drm_format ====================
[13:56:25] ============== drm_framebuffer (10 subtests) ===============
[13:56:25] ========== drm_test_framebuffer_check_src_coords  ==========
[13:56:25] [PASSED] Success: source fits into fb
[13:56:25] [PASSED] Fail: overflowing fb with x-axis coordinate
[13:56:25] [PASSED] Fail: overflowing fb with y-axis coordinate
[13:56:25] [PASSED] Fail: overflowing fb with source width
[13:56:25] [PASSED] Fail: overflowing fb with source height
[13:56:25] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[13:56:25] [PASSED] drm_test_framebuffer_cleanup
[13:56:25] =============== drm_test_framebuffer_create  ===============
[13:56:25] [PASSED] ABGR8888 normal sizes
[13:56:25] [PASSED] ABGR8888 max sizes
[13:56:25] [PASSED] ABGR8888 pitch greater than min required
[13:56:25] [PASSED] ABGR8888 pitch less than min required
[13:56:25] [PASSED] ABGR8888 Invalid width
[13:56:25] [PASSED] ABGR8888 Invalid buffer handle
[13:56:25] [PASSED] No pixel format
[13:56:25] [PASSED] ABGR8888 Width 0
[13:56:25] [PASSED] ABGR8888 Height 0
[13:56:25] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:56:25] [PASSED] ABGR8888 Large buffer offset
[13:56:25] [PASSED] ABGR8888 Buffer offset for inexistent plane
[13:56:25] [PASSED] ABGR8888 Invalid flag
[13:56:25] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:56:25] [PASSED] ABGR8888 Valid buffer modifier
[13:56:25] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:56:25] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:56:25] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:56:25] [PASSED] NV12 Normal sizes
[13:56:25] [PASSED] NV12 Max sizes
[13:56:25] [PASSED] NV12 Invalid pitch
[13:56:25] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:56:25] [PASSED] NV12 different  modifier per-plane
[13:56:25] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:56:25] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:56:25] [PASSED] NV12 Modifier for inexistent plane
[13:56:25] [PASSED] NV12 Handle for inexistent plane
[13:56:25] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:56:25] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:56:25] [PASSED] YVU420 Normal sizes
[13:56:25] [PASSED] YVU420 Max sizes
[13:56:25] [PASSED] YVU420 Invalid pitch
[13:56:25] [PASSED] YVU420 Different pitches
[13:56:25] [PASSED] YVU420 Different buffer offsets/pitches
[13:56:25] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:56:25] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:56:25] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:56:25] [PASSED] YVU420 Valid modifier
[13:56:25] [PASSED] YVU420 Different modifiers per plane
[13:56:25] [PASSED] YVU420 Modifier for inexistent plane
[13:56:25] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[13:56:25] [PASSED] X0L2 Normal sizes
[13:56:25] [PASSED] X0L2 Max sizes
[13:56:25] [PASSED] X0L2 Invalid pitch
[13:56:25] [PASSED] X0L2 Pitch greater than minimum required
[13:56:25] [PASSED] X0L2 Handle for inexistent plane
[13:56:25] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:56:25] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:56:25] [PASSED] X0L2 Valid modifier
[13:56:25] [PASSED] X0L2 Modifier for inexistent plane
[13:56:25] =========== [PASSED] drm_test_framebuffer_create ===========
[13:56:25] [PASSED] drm_test_framebuffer_free
[13:56:25] [PASSED] drm_test_framebuffer_init
[13:56:25] [PASSED] drm_test_framebuffer_init_bad_format
[13:56:25] [PASSED] drm_test_framebuffer_init_dev_mismatch
[13:56:25] [PASSED] drm_test_framebuffer_lookup
[13:56:25] [PASSED] drm_test_framebuffer_lookup_inexistent
[13:56:25] [PASSED] drm_test_framebuffer_modifiers_not_supported
[13:56:25] ================= [PASSED] drm_framebuffer =================
[13:56:25] ================ drm_gem_shmem (8 subtests) ================
[13:56:25] [PASSED] drm_gem_shmem_test_obj_create
[13:56:25] [PASSED] drm_gem_shmem_test_obj_create_private
[13:56:25] [PASSED] drm_gem_shmem_test_pin_pages
[13:56:25] [PASSED] drm_gem_shmem_test_vmap
[13:56:25] [PASSED] drm_gem_shmem_test_get_sg_table
[13:56:25] [PASSED] drm_gem_shmem_test_get_pages_sgt
[13:56:25] [PASSED] drm_gem_shmem_test_madvise
[13:56:25] [PASSED] drm_gem_shmem_test_purge
[13:56:25] ================== [PASSED] drm_gem_shmem ==================
[13:56:25] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[13:56:25] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[13:56:25] [PASSED] Automatic
[13:56:25] [PASSED] Full
[13:56:25] [PASSED] Limited 16:235
[13:56:25] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[13:56:25] [PASSED] drm_test_check_disable_connector
[13:56:25] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[13:56:25] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[13:56:25] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[13:56:25] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[13:56:25] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[13:56:25] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[13:56:25] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[13:56:25] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[13:56:25] [PASSED] drm_test_check_output_bpc_dvi
[13:56:25] [PASSED] drm_test_check_output_bpc_format_vic_1
[13:56:25] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[13:56:25] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[13:56:25] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[13:56:25] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[13:56:25] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[13:56:25] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[13:56:25] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[13:56:25] ============ drm_test_check_hdmi_color_format  =============
[13:56:25] [PASSED] AUTO -> RGB
[13:56:25] [PASSED] YCBCR422 -> YUV422
[13:56:25] [PASSED] YCBCR420 -> YUV420
[13:56:25] [PASSED] YCBCR444 -> YUV444
[13:56:25] [PASSED] RGB -> RGB
[13:56:25] ======== [PASSED] drm_test_check_hdmi_color_format =========
[13:56:25] ======== drm_test_check_hdmi_color_format_420_only  ========
[13:56:25] [PASSED] RGB should fail
[13:56:25] [PASSED] YUV444 should fail
[13:56:25] [PASSED] YUV422 should fail
[13:56:25] [PASSED] YUV420 should work
[13:56:25] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[13:56:25] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[13:56:25] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[13:56:25] [PASSED] drm_test_check_broadcast_rgb_value
[13:56:25] [PASSED] drm_test_check_bpc_8_value
[13:56:25] [PASSED] drm_test_check_bpc_10_value
[13:56:25] [PASSED] drm_test_check_bpc_12_value
[13:56:25] [PASSED] drm_test_check_format_value
[13:56:25] [PASSED] drm_test_check_tmds_char_value
[13:56:25] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[13:56:25] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[13:56:25] [PASSED] drm_test_check_mode_valid
[13:56:25] [PASSED] drm_test_check_mode_valid_reject
[13:56:25] [PASSED] drm_test_check_mode_valid_reject_rate
[13:56:25] [PASSED] drm_test_check_mode_valid_reject_max_clock
[13:56:25] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[13:56:25] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[13:56:25] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[13:56:25] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[13:56:25] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[13:56:25] [PASSED] drm_test_check_infoframes
[13:56:25] [PASSED] drm_test_check_reject_avi_infoframe
[13:56:25] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[13:56:25] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[13:56:25] [PASSED] drm_test_check_reject_audio_infoframe
[13:56:25] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[13:56:25] ================= drm_managed (2 subtests) =================
[13:56:25] [PASSED] drm_test_managed_release_action
[13:56:25] [PASSED] drm_test_managed_run_action
[13:56:25] =================== [PASSED] drm_managed ===================
[13:56:25] =================== drm_mm (6 subtests) ====================
[13:56:25] [PASSED] drm_test_mm_init
[13:56:25] [PASSED] drm_test_mm_debug
[13:56:25] [PASSED] drm_test_mm_align32
[13:56:25] [PASSED] drm_test_mm_align64
[13:56:25] [PASSED] drm_test_mm_lowest
[13:56:25] [PASSED] drm_test_mm_highest
[13:56:25] ===================== [PASSED] drm_mm ======================
[13:56:25] ============= drm_modes_analog_tv (5 subtests) =============
[13:56:25] [PASSED] drm_test_modes_analog_tv_mono_576i
[13:56:25] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:56:25] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:56:25] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:56:25] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:56:25] =============== [PASSED] drm_modes_analog_tv ===============
[13:56:25] ============== drm_plane_helper (2 subtests) ===============
[13:56:25] =============== drm_test_check_plane_state  ================
[13:56:25] [PASSED] clipping_simple
[13:56:25] [PASSED] clipping_rotate_reflect
[13:56:25] [PASSED] positioning_simple
[13:56:25] [PASSED] upscaling
[13:56:25] [PASSED] downscaling
[13:56:25] [PASSED] rounding1
[13:56:25] [PASSED] rounding2
[13:56:25] [PASSED] rounding3
[13:56:25] [PASSED] rounding4
[13:56:25] =========== [PASSED] drm_test_check_plane_state ============
[13:56:25] =========== drm_test_check_invalid_plane_state  ============
[13:56:25] [PASSED] positioning_invalid
[13:56:25] [PASSED] upscaling_invalid
[13:56:25] [PASSED] downscaling_invalid
[13:56:25] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:56:25] ================ [PASSED] drm_plane_helper =================
[13:56:25] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:56:25] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:56:25] [PASSED] None
[13:56:25] [PASSED] PAL
[13:56:25] [PASSED] NTSC
[13:56:25] [PASSED] Both, NTSC Default
[13:56:25] [PASSED] Both, PAL Default
[13:56:25] [PASSED] Both, NTSC Default, with PAL on command-line
[13:56:25] [PASSED] Both, PAL Default, with NTSC on command-line
[13:56:25] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:56:25] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:56:25] ================== drm_rect (9 subtests) ===================
[13:56:25] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:56:25] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:56:25] [PASSED] drm_test_rect_clip_scaled_clipped
[13:56:25] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:56:25] ================= drm_test_rect_intersect  =================
[13:56:25] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:56:25] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[13:56:25] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:56:25] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:56:25] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:56:25] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:56:25] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:56:25] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:56:25] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:56:25] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:56:25] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:56:25] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:56:25] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:56:25] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:56:25] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:56:25] ============= [PASSED] drm_test_rect_intersect =============
[13:56:25] ================ drm_test_rect_calc_hscale  ================
[13:56:25] [PASSED] normal use
[13:56:25] [PASSED] out of max range
[13:56:25] [PASSED] out of min range
[13:56:25] [PASSED] zero dst
[13:56:25] [PASSED] negative src
[13:56:25] [PASSED] negative dst
[13:56:25] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:56:25] ================ drm_test_rect_calc_vscale  ================
[13:56:25] [PASSED] normal use
[13:56:25] [PASSED] out of max range
[13:56:25] [PASSED] out of min range
[13:56:25] [PASSED] zero dst
[13:56:25] [PASSED] negative src
[13:56:25] [PASSED] negative dst
[13:56:25] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:56:25] ================== drm_test_rect_rotate  ===================
[13:56:25] [PASSED] reflect-x
[13:56:25] [PASSED] reflect-y
[13:56:25] [PASSED] rotate-0
[13:56:25] [PASSED] rotate-90
[13:56:25] [PASSED] rotate-180
[13:56:25] [PASSED] rotate-270
[13:56:25] ============== [PASSED] drm_test_rect_rotate ===============
[13:56:25] ================ drm_test_rect_rotate_inv  =================
[13:56:25] [PASSED] reflect-x
[13:56:25] [PASSED] reflect-y
[13:56:25] [PASSED] rotate-0
[13:56:25] [PASSED] rotate-90
[13:56:25] [PASSED] rotate-180
[13:56:25] [PASSED] rotate-270
[13:56:25] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:56:25] ==================== [PASSED] drm_rect =====================
[13:56:25] ============ drm_sysfb_modeset_test (1 subtest) ============
[13:56:25] ============ drm_test_sysfb_build_fourcc_list  =============
[13:56:25] [PASSED] no native formats
[13:56:25] [PASSED] XRGB8888 as native format
[13:56:25] [PASSED] remove duplicates
[13:56:25] [PASSED] convert alpha formats
[13:56:25] [PASSED] random formats
[13:56:25] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[13:56:25] ============= [PASSED] drm_sysfb_modeset_test ==============
[13:56:25] ================== drm_fixp (2 subtests) ===================
[13:56:25] [PASSED] drm_test_int2fixp
[13:56:25] [PASSED] drm_test_sm2fixp
[13:56:25] ==================== [PASSED] drm_fixp =====================
[13:56:25] ============================================================
[13:56:25] Testing complete. Ran 637 tests: passed: 637
[13:56:25] Elapsed time: 26.478s total, 1.842s configuring, 24.467s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[13:56:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:56:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:56:37] Starting KUnit Kernel (1/1)...
[13:56:37] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:56:37] ================= ttm_device (5 subtests) ==================
[13:56:37] [PASSED] ttm_device_init_basic
[13:56:37] [PASSED] ttm_device_init_multiple
[13:56:37] [PASSED] ttm_device_fini_basic
[13:56:37] [PASSED] ttm_device_init_no_vma_man
[13:56:37] ================== ttm_device_init_pools  ==================
[13:56:37] [PASSED] No DMA allocations, no DMA32 required
[13:56:37] [PASSED] DMA allocations, DMA32 required
[13:56:37] [PASSED] No DMA allocations, DMA32 required
[13:56:37] [PASSED] DMA allocations, no DMA32 required
[13:56:37] ============== [PASSED] ttm_device_init_pools ==============
[13:56:37] =================== [PASSED] ttm_device ====================
[13:56:37] ================== ttm_pool (8 subtests) ===================
[13:56:37] ================== ttm_pool_alloc_basic  ===================
[13:56:37] [PASSED] One page
[13:56:37] [PASSED] More than one page
[13:56:37] [PASSED] Above the allocation limit
[13:56:37] [PASSED] One page, with coherent DMA mappings enabled
[13:56:37] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:56:37] ============== [PASSED] ttm_pool_alloc_basic ===============
[13:56:37] ============== ttm_pool_alloc_basic_dma_addr  ==============
[13:56:37] [PASSED] One page
[13:56:37] [PASSED] More than one page
[13:56:37] [PASSED] Above the allocation limit
[13:56:37] [PASSED] One page, with coherent DMA mappings enabled
[13:56:37] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:56:37] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[13:56:37] [PASSED] ttm_pool_alloc_order_caching_match
[13:56:37] [PASSED] ttm_pool_alloc_caching_mismatch
[13:56:37] [PASSED] ttm_pool_alloc_order_mismatch
[13:56:37] [PASSED] ttm_pool_free_dma_alloc
[13:56:37] [PASSED] ttm_pool_free_no_dma_alloc
[13:56:37] [PASSED] ttm_pool_fini_basic
[13:56:37] ==================== [PASSED] ttm_pool =====================
[13:56:37] ================ ttm_resource (8 subtests) =================
[13:56:37] ================= ttm_resource_init_basic  =================
[13:56:37] [PASSED] Init resource in TTM_PL_SYSTEM
[13:56:37] [PASSED] Init resource in TTM_PL_VRAM
[13:56:37] [PASSED] Init resource in a private placement
[13:56:37] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[13:56:37] ============= [PASSED] ttm_resource_init_basic =============
[13:56:37] [PASSED] ttm_resource_init_pinned
[13:56:37] [PASSED] ttm_resource_fini_basic
[13:56:37] [PASSED] ttm_resource_manager_init_basic
[13:56:37] [PASSED] ttm_resource_manager_usage_basic
[13:56:37] [PASSED] ttm_resource_manager_set_used_basic
[13:56:37] [PASSED] ttm_sys_man_alloc_basic
[13:56:37] [PASSED] ttm_sys_man_free_basic
[13:56:37] ================== [PASSED] ttm_resource ===================
[13:56:37] =================== ttm_tt (15 subtests) ===================
[13:56:37] ==================== ttm_tt_init_basic  ====================
[13:56:37] [PASSED] Page-aligned size
[13:56:37] [PASSED] Extra pages requested
[13:56:37] ================ [PASSED] ttm_tt_init_basic ================
[13:56:37] [PASSED] ttm_tt_init_misaligned
[13:56:37] [PASSED] ttm_tt_fini_basic
[13:56:37] [PASSED] ttm_tt_fini_sg
[13:56:37] [PASSED] ttm_tt_fini_shmem
[13:56:37] [PASSED] ttm_tt_create_basic
[13:56:37] [PASSED] ttm_tt_create_invalid_bo_type
[13:56:37] [PASSED] ttm_tt_create_ttm_exists
[13:56:37] [PASSED] ttm_tt_create_failed
[13:56:37] [PASSED] ttm_tt_destroy_basic
[13:56:37] [PASSED] ttm_tt_populate_null_ttm
[13:56:37] [PASSED] ttm_tt_populate_populated_ttm
[13:56:37] [PASSED] ttm_tt_unpopulate_basic
[13:56:37] [PASSED] ttm_tt_unpopulate_empty_ttm
[13:56:37] [PASSED] ttm_tt_swapin_basic
[13:56:37] ===================== [PASSED] ttm_tt ======================
[13:56:37] =================== ttm_bo (14 subtests) ===================
[13:56:37] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[13:56:37] [PASSED] Cannot be interrupted and sleeps
[13:56:37] [PASSED] Cannot be interrupted, locks straight away
[13:56:37] [PASSED] Can be interrupted, sleeps
[13:56:37] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[13:56:37] [PASSED] ttm_bo_reserve_locked_no_sleep
[13:56:37] [PASSED] ttm_bo_reserve_no_wait_ticket
[13:56:37] [PASSED] ttm_bo_reserve_double_resv
[13:56:37] [PASSED] ttm_bo_reserve_interrupted
[13:56:37] [PASSED] ttm_bo_reserve_deadlock
[13:56:37] [PASSED] ttm_bo_unreserve_basic
[13:56:37] [PASSED] ttm_bo_unreserve_pinned
[13:56:37] [PASSED] ttm_bo_unreserve_bulk
[13:56:37] [PASSED] ttm_bo_fini_basic
[13:56:37] [PASSED] ttm_bo_fini_shared_resv
[13:56:37] [PASSED] ttm_bo_pin_basic
[13:56:37] [PASSED] ttm_bo_pin_unpin_resource
[13:56:37] [PASSED] ttm_bo_multiple_pin_one_unpin
[13:56:37] ===================== [PASSED] ttm_bo ======================
[13:56:37] ============== ttm_bo_validate (22 subtests) ===============
[13:56:37] ============== ttm_bo_init_reserved_sys_man  ===============
[13:56:37] [PASSED] Buffer object for userspace
[13:56:37] [PASSED] Kernel buffer object
[13:56:37] [PASSED] Shared buffer object
[13:56:37] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[13:56:37] ============== ttm_bo_init_reserved_mock_man  ==============
[13:56:37] [PASSED] Buffer object for userspace
[13:56:37] [PASSED] Kernel buffer object
[13:56:37] [PASSED] Shared buffer object
[13:56:37] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[13:56:37] [PASSED] ttm_bo_init_reserved_resv
[13:56:37] ================== ttm_bo_validate_basic  ==================
[13:56:37] [PASSED] Buffer object for userspace
[13:56:37] [PASSED] Kernel buffer object
[13:56:37] [PASSED] Shared buffer object
[13:56:37] ============== [PASSED] ttm_bo_validate_basic ==============
[13:56:37] [PASSED] ttm_bo_validate_invalid_placement
[13:56:37] ============= ttm_bo_validate_same_placement  ==============
[13:56:37] [PASSED] System manager
[13:56:37] [PASSED] VRAM manager
[13:56:37] ========= [PASSED] ttm_bo_validate_same_placement ==========
[13:56:37] [PASSED] ttm_bo_validate_failed_alloc
[13:56:37] [PASSED] ttm_bo_validate_pinned
[13:56:37] [PASSED] ttm_bo_validate_busy_placement
[13:56:37] ================ ttm_bo_validate_multihop  =================
[13:56:37] [PASSED] Buffer object for userspace
[13:56:37] [PASSED] Kernel buffer object
[13:56:37] [PASSED] Shared buffer object
[13:56:37] ============ [PASSED] ttm_bo_validate_multihop =============
[13:56:37] ========== ttm_bo_validate_no_placement_signaled  ==========
[13:56:37] [PASSED] Buffer object in system domain, no page vector
[13:56:37] [PASSED] Buffer object in system domain with an existing page vector
[13:56:37] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[13:56:37] ======== ttm_bo_validate_no_placement_not_signaled  ========
[13:56:37] [PASSED] Buffer object for userspace
[13:56:37] [PASSED] Kernel buffer object
[13:56:37] [PASSED] Shared buffer object
[13:56:37] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[13:56:37] [PASSED] ttm_bo_validate_move_fence_signaled
[13:56:37] ========= ttm_bo_validate_move_fence_not_signaled  =========
[13:56:37] [PASSED] Waits for GPU
[13:56:37] [PASSED] Tries to lock straight away
[13:56:37] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[13:56:37] [PASSED] ttm_bo_validate_swapout
[13:56:37] [PASSED] ttm_bo_validate_happy_evict
[13:56:37] [PASSED] ttm_bo_validate_all_pinned_evict
[13:56:37] [PASSED] ttm_bo_validate_allowed_only_evict
[13:56:37] [PASSED] ttm_bo_validate_deleted_evict
[13:56:37] [PASSED] ttm_bo_validate_busy_domain_evict
[13:56:37] [PASSED] ttm_bo_validate_evict_gutting
[13:56:37] [PASSED] ttm_bo_validate_recrusive_evict
[13:56:37] ================= [PASSED] ttm_bo_validate =================
[13:56:37] ============================================================
[13:56:37] Testing complete. Ran 102 tests: passed: 102
[13:56:37] Elapsed time: 11.814s total, 1.781s configuring, 9.818s building, 0.183s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


