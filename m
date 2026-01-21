Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AF9C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7633010E7FD;
	Wed, 21 Jan 2026 13:58:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FA410E7FD;
 Wed, 21 Jan 2026 13:58:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_new_general_DRM_property_?=
 =?utf-8?q?=22color_format=22_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 13:58:19 -0000
Message-ID: <176900389943.178097.6108000384871732066@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
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

Series: Add new general DRM property "color format" (rev3)
URL   : https://patchwork.freedesktop.org/series/157911/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:57:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:57:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:57:51] Starting KUnit Kernel (1/1)...
[13:57:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:57:52] ================== guc_buf (11 subtests) ===================
[13:57:52] [PASSED] test_smallest
[13:57:52] [PASSED] test_largest
[13:57:52] [PASSED] test_granular
[13:57:52] [PASSED] test_unique
[13:57:52] [PASSED] test_overlap
[13:57:52] [PASSED] test_reusable
[13:57:52] [PASSED] test_too_big
[13:57:52] [PASSED] test_flush
[13:57:52] [PASSED] test_lookup
[13:57:52] [PASSED] test_data
[13:57:52] [PASSED] test_class
[13:57:52] ===================== [PASSED] guc_buf =====================
[13:57:52] =================== guc_dbm (7 subtests) ===================
[13:57:52] [PASSED] test_empty
[13:57:52] [PASSED] test_default
[13:57:52] ======================== test_size  ========================
[13:57:52] [PASSED] 4
[13:57:52] [PASSED] 8
[13:57:52] [PASSED] 32
[13:57:52] [PASSED] 256
[13:57:52] ==================== [PASSED] test_size ====================
[13:57:52] ======================= test_reuse  ========================
[13:57:52] [PASSED] 4
[13:57:52] [PASSED] 8
[13:57:52] [PASSED] 32
[13:57:52] [PASSED] 256
[13:57:52] =================== [PASSED] test_reuse ====================
[13:57:52] =================== test_range_overlap  ====================
[13:57:52] [PASSED] 4
[13:57:52] [PASSED] 8
[13:57:52] [PASSED] 32
[13:57:52] [PASSED] 256
[13:57:52] =============== [PASSED] test_range_overlap ================
[13:57:52] =================== test_range_compact  ====================
[13:57:52] [PASSED] 4
[13:57:52] [PASSED] 8
[13:57:52] [PASSED] 32
[13:57:52] [PASSED] 256
[13:57:52] =============== [PASSED] test_range_compact ================
[13:57:52] ==================== test_range_spare  =====================
[13:57:52] [PASSED] 4
[13:57:52] [PASSED] 8
[13:57:52] [PASSED] 32
[13:57:52] [PASSED] 256
[13:57:52] ================ [PASSED] test_range_spare =================
[13:57:52] ===================== [PASSED] guc_dbm =====================
[13:57:52] =================== guc_idm (6 subtests) ===================
[13:57:52] [PASSED] bad_init
[13:57:52] [PASSED] no_init
[13:57:52] [PASSED] init_fini
[13:57:52] [PASSED] check_used
[13:57:52] [PASSED] check_quota
[13:57:52] [PASSED] check_all
[13:57:52] ===================== [PASSED] guc_idm =====================
[13:57:52] ================== no_relay (3 subtests) ===================
[13:57:52] [PASSED] xe_drops_guc2pf_if_not_ready
[13:57:52] [PASSED] xe_drops_guc2vf_if_not_ready
[13:57:52] [PASSED] xe_rejects_send_if_not_ready
[13:57:52] ==================== [PASSED] no_relay =====================
[13:57:52] ================== pf_relay (14 subtests) ==================
[13:57:52] [PASSED] pf_rejects_guc2pf_too_short
[13:57:52] [PASSED] pf_rejects_guc2pf_too_long
[13:57:52] [PASSED] pf_rejects_guc2pf_no_payload
[13:57:52] [PASSED] pf_fails_no_payload
[13:57:52] [PASSED] pf_fails_bad_origin
[13:57:52] [PASSED] pf_fails_bad_type
[13:57:52] [PASSED] pf_txn_reports_error
[13:57:52] [PASSED] pf_txn_sends_pf2guc
[13:57:52] [PASSED] pf_sends_pf2guc
[13:57:52] [SKIPPED] pf_loopback_nop
[13:57:52] [SKIPPED] pf_loopback_echo
[13:57:52] [SKIPPED] pf_loopback_fail
[13:57:52] [SKIPPED] pf_loopback_busy
[13:57:52] [SKIPPED] pf_loopback_retry
[13:57:52] ==================== [PASSED] pf_relay =====================
[13:57:52] ================== vf_relay (3 subtests) ===================
[13:57:52] [PASSED] vf_rejects_guc2vf_too_short
[13:57:52] [PASSED] vf_rejects_guc2vf_too_long
[13:57:52] [PASSED] vf_rejects_guc2vf_no_payload
[13:57:52] ==================== [PASSED] vf_relay =====================
[13:57:52] ================ pf_gt_config (6 subtests) =================
[13:57:52] [PASSED] fair_contexts_1vf
[13:57:52] [PASSED] fair_doorbells_1vf
[13:57:52] [PASSED] fair_ggtt_1vf
[13:57:52] ====================== fair_contexts  ======================
[13:57:52] [PASSED] 1 VF
[13:57:52] [PASSED] 2 VFs
[13:57:52] [PASSED] 3 VFs
[13:57:52] [PASSED] 4 VFs
[13:57:52] [PASSED] 5 VFs
[13:57:52] [PASSED] 6 VFs
[13:57:52] [PASSED] 7 VFs
[13:57:52] [PASSED] 8 VFs
[13:57:52] [PASSED] 9 VFs
[13:57:52] [PASSED] 10 VFs
[13:57:52] [PASSED] 11 VFs
[13:57:52] [PASSED] 12 VFs
[13:57:52] [PASSED] 13 VFs
[13:57:52] [PASSED] 14 VFs
[13:57:52] [PASSED] 15 VFs
[13:57:52] [PASSED] 16 VFs
[13:57:52] [PASSED] 17 VFs
[13:57:52] [PASSED] 18 VFs
[13:57:52] [PASSED] 19 VFs
[13:57:52] [PASSED] 20 VFs
[13:57:52] [PASSED] 21 VFs
[13:57:52] [PASSED] 22 VFs
[13:57:52] [PASSED] 23 VFs
[13:57:52] [PASSED] 24 VFs
[13:57:52] [PASSED] 25 VFs
[13:57:52] [PASSED] 26 VFs
[13:57:52] [PASSED] 27 VFs
[13:57:52] [PASSED] 28 VFs
[13:57:52] [PASSED] 29 VFs
[13:57:52] [PASSED] 30 VFs
[13:57:52] [PASSED] 31 VFs
[13:57:52] [PASSED] 32 VFs
[13:57:52] [PASSED] 33 VFs
[13:57:52] [PASSED] 34 VFs
[13:57:52] [PASSED] 35 VFs
[13:57:52] [PASSED] 36 VFs
[13:57:52] [PASSED] 37 VFs
[13:57:52] [PASSED] 38 VFs
[13:57:52] [PASSED] 39 VFs
[13:57:52] [PASSED] 40 VFs
[13:57:52] [PASSED] 41 VFs
[13:57:52] [PASSED] 42 VFs
[13:57:52] [PASSED] 43 VFs
[13:57:52] [PASSED] 44 VFs
[13:57:52] [PASSED] 45 VFs
[13:57:52] [PASSED] 46 VFs
[13:57:52] [PASSED] 47 VFs
[13:57:52] [PASSED] 48 VFs
[13:57:52] [PASSED] 49 VFs
[13:57:52] [PASSED] 50 VFs
[13:57:52] [PASSED] 51 VFs
[13:57:52] [PASSED] 52 VFs
[13:57:52] [PASSED] 53 VFs
[13:57:52] [PASSED] 54 VFs
[13:57:52] [PASSED] 55 VFs
[13:57:52] [PASSED] 56 VFs
[13:57:52] [PASSED] 57 VFs
[13:57:52] [PASSED] 58 VFs
[13:57:52] [PASSED] 59 VFs
[13:57:52] [PASSED] 60 VFs
[13:57:52] [PASSED] 61 VFs
[13:57:52] [PASSED] 62 VFs
[13:57:52] [PASSED] 63 VFs
[13:57:52] ================== [PASSED] fair_contexts ==================
[13:57:52] ===================== fair_doorbells  ======================
[13:57:52] [PASSED] 1 VF
[13:57:52] [PASSED] 2 VFs
[13:57:52] [PASSED] 3 VFs
[13:57:52] [PASSED] 4 VFs
[13:57:52] [PASSED] 5 VFs
[13:57:52] [PASSED] 6 VFs
[13:57:52] [PASSED] 7 VFs
[13:57:52] [PASSED] 8 VFs
[13:57:52] [PASSED] 9 VFs
[13:57:52] [PASSED] 10 VFs
[13:57:52] [PASSED] 11 VFs
[13:57:52] [PASSED] 12 VFs
[13:57:52] [PASSED] 13 VFs
[13:57:52] [PASSED] 14 VFs
[13:57:52] [PASSED] 15 VFs
[13:57:52] [PASSED] 16 VFs
[13:57:52] [PASSED] 17 VFs
[13:57:52] [PASSED] 18 VFs
[13:57:52] [PASSED] 19 VFs
[13:57:52] [PASSED] 20 VFs
[13:57:52] [PASSED] 21 VFs
[13:57:52] [PASSED] 22 VFs
[13:57:52] [PASSED] 23 VFs
[13:57:52] [PASSED] 24 VFs
[13:57:52] [PASSED] 25 VFs
[13:57:52] [PASSED] 26 VFs
[13:57:52] [PASSED] 27 VFs
[13:57:52] [PASSED] 28 VFs
[13:57:52] [PASSED] 29 VFs
[13:57:52] [PASSED] 30 VFs
[13:57:52] [PASSED] 31 VFs
[13:57:52] [PASSED] 32 VFs
[13:57:52] [PASSED] 33 VFs
[13:57:52] [PASSED] 34 VFs
[13:57:52] [PASSED] 35 VFs
[13:57:52] [PASSED] 36 VFs
[13:57:52] [PASSED] 37 VFs
[13:57:52] [PASSED] 38 VFs
[13:57:52] [PASSED] 39 VFs
[13:57:52] [PASSED] 40 VFs
[13:57:52] [PASSED] 41 VFs
[13:57:52] [PASSED] 42 VFs
[13:57:52] [PASSED] 43 VFs
[13:57:52] [PASSED] 44 VFs
[13:57:52] [PASSED] 45 VFs
[13:57:52] [PASSED] 46 VFs
[13:57:52] [PASSED] 47 VFs
[13:57:52] [PASSED] 48 VFs
[13:57:52] [PASSED] 49 VFs
[13:57:52] [PASSED] 50 VFs
[13:57:52] [PASSED] 51 VFs
[13:57:52] [PASSED] 52 VFs
[13:57:52] [PASSED] 53 VFs
[13:57:52] [PASSED] 54 VFs
[13:57:52] [PASSED] 55 VFs
[13:57:52] [PASSED] 56 VFs
[13:57:52] [PASSED] 57 VFs
[13:57:52] [PASSED] 58 VFs
[13:57:52] [PASSED] 59 VFs
[13:57:52] [PASSED] 60 VFs
[13:57:52] [PASSED] 61 VFs
[13:57:52] [PASSED] 62 VFs
[13:57:52] [PASSED] 63 VFs
[13:57:52] ================= [PASSED] fair_doorbells ==================
[13:57:52] ======================== fair_ggtt  ========================
[13:57:52] [PASSED] 1 VF
[13:57:52] [PASSED] 2 VFs
[13:57:52] [PASSED] 3 VFs
[13:57:52] [PASSED] 4 VFs
[13:57:52] [PASSED] 5 VFs
[13:57:52] [PASSED] 6 VFs
[13:57:52] [PASSED] 7 VFs
[13:57:52] [PASSED] 8 VFs
[13:57:52] [PASSED] 9 VFs
[13:57:52] [PASSED] 10 VFs
[13:57:52] [PASSED] 11 VFs
[13:57:52] [PASSED] 12 VFs
[13:57:52] [PASSED] 13 VFs
[13:57:52] [PASSED] 14 VFs
[13:57:52] [PASSED] 15 VFs
[13:57:52] [PASSED] 16 VFs
[13:57:52] [PASSED] 17 VFs
[13:57:52] [PASSED] 18 VFs
[13:57:52] [PASSED] 19 VFs
[13:57:52] [PASSED] 20 VFs
[13:57:52] [PASSED] 21 VFs
[13:57:52] [PASSED] 22 VFs
[13:57:52] [PASSED] 23 VFs
[13:57:52] [PASSED] 24 VFs
[13:57:52] [PASSED] 25 VFs
[13:57:52] [PASSED] 26 VFs
[13:57:52] [PASSED] 27 VFs
[13:57:52] [PASSED] 28 VFs
[13:57:52] [PASSED] 29 VFs
[13:57:52] [PASSED] 30 VFs
[13:57:52] [PASSED] 31 VFs
[13:57:52] [PASSED] 32 VFs
[13:57:52] [PASSED] 33 VFs
[13:57:52] [PASSED] 34 VFs
[13:57:52] [PASSED] 35 VFs
[13:57:52] [PASSED] 36 VFs
[13:57:52] [PASSED] 37 VFs
[13:57:52] [PASSED] 38 VFs
[13:57:52] [PASSED] 39 VFs
[13:57:52] [PASSED] 40 VFs
[13:57:52] [PASSED] 41 VFs
[13:57:52] [PASSED] 42 VFs
[13:57:52] [PASSED] 43 VFs
[13:57:52] [PASSED] 44 VFs
[13:57:52] [PASSED] 45 VFs
[13:57:52] [PASSED] 46 VFs
[13:57:52] [PASSED] 47 VFs
[13:57:52] [PASSED] 48 VFs
[13:57:52] [PASSED] 49 VFs
[13:57:52] [PASSED] 50 VFs
[13:57:52] [PASSED] 51 VFs
[13:57:52] [PASSED] 52 VFs
[13:57:52] [PASSED] 53 VFs
[13:57:52] [PASSED] 54 VFs
[13:57:52] [PASSED] 55 VFs
[13:57:52] [PASSED] 56 VFs
[13:57:52] [PASSED] 57 VFs
[13:57:52] [PASSED] 58 VFs
[13:57:52] [PASSED] 59 VFs
[13:57:52] [PASSED] 60 VFs
[13:57:52] [PASSED] 61 VFs
[13:57:52] [PASSED] 62 VFs
[13:57:52] [PASSED] 63 VFs
[13:57:52] ==================== [PASSED] fair_ggtt ====================
[13:57:52] ================== [PASSED] pf_gt_config ===================
[13:57:52] ===================== lmtt (1 subtest) =====================
[13:57:52] ======================== test_ops  =========================
[13:57:52] [PASSED] 2-level
[13:57:52] [PASSED] multi-level
[13:57:52] ==================== [PASSED] test_ops =====================
[13:57:52] ====================== [PASSED] lmtt =======================
[13:57:52] ================= pf_service (11 subtests) =================
[13:57:52] [PASSED] pf_negotiate_any
[13:57:52] [PASSED] pf_negotiate_base_match
[13:57:52] [PASSED] pf_negotiate_base_newer
[13:57:52] [PASSED] pf_negotiate_base_next
[13:57:52] [SKIPPED] pf_negotiate_base_older
[13:57:52] [PASSED] pf_negotiate_base_prev
[13:57:52] [PASSED] pf_negotiate_latest_match
[13:57:52] [PASSED] pf_negotiate_latest_newer
[13:57:52] [PASSED] pf_negotiate_latest_next
[13:57:52] [SKIPPED] pf_negotiate_latest_older
[13:57:52] [SKIPPED] pf_negotiate_latest_prev
[13:57:52] =================== [PASSED] pf_service ====================
[13:57:52] ================= xe_guc_g2g (2 subtests) ==================
[13:57:52] ============== xe_live_guc_g2g_kunit_default  ==============
[13:57:52] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[13:57:52] ============== xe_live_guc_g2g_kunit_allmem  ===============
[13:57:52] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[13:57:52] =================== [SKIPPED] xe_guc_g2g ===================
[13:57:52] =================== xe_mocs (2 subtests) ===================
[13:57:52] ================ xe_live_mocs_kernel_kunit  ================
[13:57:52] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[13:57:52] ================ xe_live_mocs_reset_kunit  =================
[13:57:52] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[13:57:52] ==================== [SKIPPED] xe_mocs =====================
[13:57:52] ================= xe_migrate (2 subtests) ==================
[13:57:52] ================= xe_migrate_sanity_kunit  =================
[13:57:52] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[13:57:52] ================== xe_validate_ccs_kunit  ==================
[13:57:52] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[13:57:52] =================== [SKIPPED] xe_migrate ===================
[13:57:52] ================== xe_dma_buf (1 subtest) ==================
[13:57:52] ==================== xe_dma_buf_kunit  =====================
[13:57:52] ================ [SKIPPED] xe_dma_buf_kunit ================
[13:57:52] =================== [SKIPPED] xe_dma_buf ===================
[13:57:52] ================= xe_bo_shrink (1 subtest) =================
[13:57:52] =================== xe_bo_shrink_kunit  ====================
[13:57:52] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[13:57:52] ================== [SKIPPED] xe_bo_shrink ==================
[13:57:52] ==================== xe_bo (2 subtests) ====================
[13:57:52] ================== xe_ccs_migrate_kunit  ===================
[13:57:52] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[13:57:52] ==================== xe_bo_evict_kunit  ====================
[13:57:52] =============== [SKIPPED] xe_bo_evict_kunit ================
[13:57:52] ===================== [SKIPPED] xe_bo ======================
[13:57:52] ==================== args (13 subtests) ====================
[13:57:52] [PASSED] count_args_test
[13:57:52] [PASSED] call_args_example
[13:57:52] [PASSED] call_args_test
[13:57:52] [PASSED] drop_first_arg_example
[13:57:52] [PASSED] drop_first_arg_test
[13:57:52] [PASSED] first_arg_example
[13:57:52] [PASSED] first_arg_test
[13:57:52] [PASSED] last_arg_example
[13:57:52] [PASSED] last_arg_test
[13:57:52] [PASSED] pick_arg_example
[13:57:52] [PASSED] if_args_example
[13:57:52] [PASSED] if_args_test
[13:57:52] [PASSED] sep_comma_example
[13:57:52] ====================== [PASSED] args =======================
[13:57:52] =================== xe_pci (3 subtests) ====================
[13:57:52] ==================== check_graphics_ip  ====================
[13:57:52] [PASSED] 12.00 Xe_LP
[13:57:52] [PASSED] 12.10 Xe_LP+
[13:57:52] [PASSED] 12.55 Xe_HPG
[13:57:52] [PASSED] 12.60 Xe_HPC
[13:57:52] [PASSED] 12.70 Xe_LPG
[13:57:52] [PASSED] 12.71 Xe_LPG
[13:57:52] [PASSED] 12.74 Xe_LPG+
[13:57:52] [PASSED] 20.01 Xe2_HPG
[13:57:52] [PASSED] 20.02 Xe2_HPG
[13:57:52] [PASSED] 20.04 Xe2_LPG
[13:57:52] [PASSED] 30.00 Xe3_LPG
[13:57:52] [PASSED] 30.01 Xe3_LPG
[13:57:52] [PASSED] 30.03 Xe3_LPG
[13:57:52] [PASSED] 30.04 Xe3_LPG
[13:57:52] [PASSED] 30.05 Xe3_LPG
[13:57:52] [PASSED] 35.11 Xe3p_XPC
[13:57:52] ================ [PASSED] check_graphics_ip ================
[13:57:52] ===================== check_media_ip  ======================
[13:57:52] [PASSED] 12.00 Xe_M
[13:57:52] [PASSED] 12.55 Xe_HPM
[13:57:52] [PASSED] 13.00 Xe_LPM+
[13:57:52] [PASSED] 13.01 Xe2_HPM
[13:57:52] [PASSED] 20.00 Xe2_LPM
[13:57:52] [PASSED] 30.00 Xe3_LPM
[13:57:52] [PASSED] 30.02 Xe3_LPM
[13:57:52] [PASSED] 35.00 Xe3p_LPM
[13:57:52] [PASSED] 35.03 Xe3p_HPM
[13:57:52] ================= [PASSED] check_media_ip ==================
[13:57:52] =================== check_platform_desc  ===================
[13:57:52] [PASSED] 0x9A60 (TIGERLAKE)
[13:57:52] [PASSED] 0x9A68 (TIGERLAKE)
[13:57:52] [PASSED] 0x9A70 (TIGERLAKE)
[13:57:52] [PASSED] 0x9A40 (TIGERLAKE)
[13:57:52] [PASSED] 0x9A49 (TIGERLAKE)
[13:57:52] [PASSED] 0x9A59 (TIGERLAKE)
[13:57:52] [PASSED] 0x9A78 (TIGERLAKE)
[13:57:52] [PASSED] 0x9AC0 (TIGERLAKE)
[13:57:52] [PASSED] 0x9AC9 (TIGERLAKE)
[13:57:52] [PASSED] 0x9AD9 (TIGERLAKE)
[13:57:52] [PASSED] 0x9AF8 (TIGERLAKE)
[13:57:52] [PASSED] 0x4C80 (ROCKETLAKE)
[13:57:52] [PASSED] 0x4C8A (ROCKETLAKE)
[13:57:52] [PASSED] 0x4C8B (ROCKETLAKE)
[13:57:52] [PASSED] 0x4C8C (ROCKETLAKE)
[13:57:52] [PASSED] 0x4C90 (ROCKETLAKE)
[13:57:52] [PASSED] 0x4C9A (ROCKETLAKE)
[13:57:52] [PASSED] 0x4680 (ALDERLAKE_S)
[13:57:52] [PASSED] 0x4682 (ALDERLAKE_S)
[13:57:52] [PASSED] 0x4688 (ALDERLAKE_S)
[13:57:52] [PASSED] 0x468A (ALDERLAKE_S)
[13:57:52] [PASSED] 0x468B (ALDERLAKE_S)
[13:57:52] [PASSED] 0x4690 (ALDERLAKE_S)
[13:57:52] [PASSED] 0x4692 (ALDERLAKE_S)
[13:57:52] [PASSED] 0x4693 (ALDERLAKE_S)
[13:57:52] [PASSED] 0x46A0 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46A1 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46A2 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46A3 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46A6 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46A8 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46AA (ALDERLAKE_P)
[13:57:52] [PASSED] 0x462A (ALDERLAKE_P)
[13:57:52] [PASSED] 0x4626 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x4628 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[13:57:52] [PASSED] 0x46B0 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46B1 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46B2 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46B3 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46C0 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46C1 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46C2 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46C3 (ALDERLAKE_P)
[13:57:52] [PASSED] 0x46D0 (ALDERLAKE_N)
[13:57:52] [PASSED] 0x46D1 (ALDERLAKE_N)
[13:57:52] [PASSED] 0x46D2 (ALDERLAKE_N)
[13:57:52] [PASSED] 0x46D3 (ALDERLAKE_N)
[13:57:52] [PASSED] 0x46D4 (ALDERLAKE_N)
[13:57:52] [PASSED] 0xA721 (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7A1 (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7A9 (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7AC (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7AD (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA720 (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7A0 (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7A8 (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7AA (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA7AB (ALDERLAKE_P)
[13:57:52] [PASSED] 0xA780 (ALDERLAKE_S)
[13:57:52] [PASSED] 0xA781 (ALDERLAKE_S)
[13:57:52] [PASSED] 0xA782 (ALDERLAKE_S)
[13:57:52] [PASSED] 0xA783 (ALDERLAKE_S)
[13:57:52] [PASSED] 0xA788 (ALDERLAKE_S)
[13:57:52] [PASSED] 0xA789 (ALDERLAKE_S)
[13:57:52] [PASSED] 0xA78A (ALDERLAKE_S)
[13:57:52] [PASSED] 0xA78B (ALDERLAKE_S)
[13:57:52] [PASSED] 0x4905 (DG1)
[13:57:52] [PASSED] 0x4906 (DG1)
[13:57:52] [PASSED] 0x4907 (DG1)
[13:57:52] [PASSED] 0x4908 (DG1)
[13:57:52] [PASSED] 0x4909 (DG1)
[13:57:52] [PASSED] 0x56C0 (DG2)
[13:57:52] [PASSED] 0x56C2 (DG2)
[13:57:52] [PASSED] 0x56C1 (DG2)
[13:57:52] [PASSED] 0x7D51 (METEORLAKE)
[13:57:52] [PASSED] 0x7DD1 (METEORLAKE)
[13:57:52] [PASSED] 0x7D41 (METEORLAKE)
[13:57:52] [PASSED] 0x7D67 (METEORLAKE)
[13:57:52] [PASSED] 0xB640 (METEORLAKE)
[13:57:52] [PASSED] 0x56A0 (DG2)
[13:57:52] [PASSED] 0x56A1 (DG2)
[13:57:52] [PASSED] 0x56A2 (DG2)
[13:57:52] [PASSED] 0x56BE (DG2)
[13:57:52] [PASSED] 0x56BF (DG2)
[13:57:52] [PASSED] 0x5690 (DG2)
[13:57:52] [PASSED] 0x5691 (DG2)
[13:57:52] [PASSED] 0x5692 (DG2)
[13:57:52] [PASSED] 0x56A5 (DG2)
[13:57:52] [PASSED] 0x56A6 (DG2)
[13:57:52] [PASSED] 0x56B0 (DG2)
[13:57:52] [PASSED] 0x56B1 (DG2)
[13:57:52] [PASSED] 0x56BA (DG2)
[13:57:52] [PASSED] 0x56BB (DG2)
[13:57:52] [PASSED] 0x56BC (DG2)
[13:57:52] [PASSED] 0x56BD (DG2)
[13:57:52] [PASSED] 0x5693 (DG2)
[13:57:52] [PASSED] 0x5694 (DG2)
[13:57:52] [PASSED] 0x5695 (DG2)
[13:57:52] [PASSED] 0x56A3 (DG2)
[13:57:52] [PASSED] 0x56A4 (DG2)
[13:57:52] [PASSED] 0x56B2 (DG2)
[13:57:52] [PASSED] 0x56B3 (DG2)
[13:57:52] [PASSED] 0x5696 (DG2)
[13:57:52] [PASSED] 0x5697 (DG2)
[13:57:52] [PASSED] 0xB69 (PVC)
[13:57:52] [PASSED] 0xB6E (PVC)
[13:57:52] [PASSED] 0xBD4 (PVC)
[13:57:52] [PASSED] 0xBD5 (PVC)
[13:57:52] [PASSED] 0xBD6 (PVC)
[13:57:52] [PASSED] 0xBD7 (PVC)
[13:57:52] [PASSED] 0xBD8 (PVC)
[13:57:52] [PASSED] 0xBD9 (PVC)
[13:57:52] [PASSED] 0xBDA (PVC)
[13:57:52] [PASSED] 0xBDB (PVC)
[13:57:52] [PASSED] 0xBE0 (PVC)
[13:57:52] [PASSED] 0xBE1 (PVC)
[13:57:52] [PASSED] 0xBE5 (PVC)
[13:57:52] [PASSED] 0x7D40 (METEORLAKE)
[13:57:52] [PASSED] 0x7D45 (METEORLAKE)
[13:57:52] [PASSED] 0x7D55 (METEORLAKE)
[13:57:52] [PASSED] 0x7D60 (METEORLAKE)
[13:57:52] [PASSED] 0x7DD5 (METEORLAKE)
[13:57:52] [PASSED] 0x6420 (LUNARLAKE)
[13:57:52] [PASSED] 0x64A0 (LUNARLAKE)
[13:57:52] [PASSED] 0x64B0 (LUNARLAKE)
[13:57:52] [PASSED] 0xE202 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE209 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE20B (BATTLEMAGE)
[13:57:52] [PASSED] 0xE20C (BATTLEMAGE)
[13:57:52] [PASSED] 0xE20D (BATTLEMAGE)
[13:57:52] [PASSED] 0xE210 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE211 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE212 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE216 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE220 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE221 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE222 (BATTLEMAGE)
[13:57:52] [PASSED] 0xE223 (BATTLEMAGE)
[13:57:52] [PASSED] 0xB080 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB081 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB082 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB083 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB084 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB085 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB086 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB087 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB08F (PANTHERLAKE)
[13:57:52] [PASSED] 0xB090 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB0A0 (PANTHERLAKE)
[13:57:52] [PASSED] 0xB0B0 (PANTHERLAKE)
[13:57:52] [PASSED] 0xFD80 (PANTHERLAKE)
[13:57:52] [PASSED] 0xFD81 (PANTHERLAKE)
[13:57:52] [PASSED] 0xD740 (NOVALAKE_S)
[13:57:52] [PASSED] 0xD741 (NOVALAKE_S)
[13:57:52] [PASSED] 0xD742 (NOVALAKE_S)
[13:57:52] [PASSED] 0xD743 (NOVALAKE_S)
[13:57:52] [PASSED] 0xD744 (NOVALAKE_S)
[13:57:52] [PASSED] 0xD745 (NOVALAKE_S)
[13:57:52] [PASSED] 0x674C (CRESCENTISLAND)
[13:57:52] =============== [PASSED] check_platform_desc ===============
[13:57:52] ===================== [PASSED] xe_pci ======================
[13:57:52] =================== xe_rtp (2 subtests) ====================
[13:57:52] =============== xe_rtp_process_to_sr_tests  ================
[13:57:52] [PASSED] coalesce-same-reg
[13:57:52] [PASSED] no-match-no-add
[13:57:52] [PASSED] match-or
[13:57:52] [PASSED] match-or-xfail
[13:57:52] [PASSED] no-match-no-add-multiple-rules
[13:57:52] [PASSED] two-regs-two-entries
[13:57:52] [PASSED] clr-one-set-other
[13:57:52] [PASSED] set-field
[13:57:52] [PASSED] conflict-duplicate
[13:57:52] [PASSED] conflict-not-disjoint
[13:57:52] [PASSED] conflict-reg-type
[13:57:52] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[13:57:52] ================== xe_rtp_process_tests  ===================
[13:57:52] [PASSED] active1
[13:57:52] [PASSED] active2
[13:57:52] [PASSED] active-inactive
[13:57:52] [PASSED] inactive-active
[13:57:52] [PASSED] inactive-1st_or_active-inactive
[13:57:52] [PASSED] inactive-2nd_or_active-inactive
[13:57:52] [PASSED] inactive-last_or_active-inactive
[13:57:52] [PASSED] inactive-no_or_active-inactive
[13:57:52] ============== [PASSED] xe_rtp_process_tests ===============
[13:57:52] ===================== [PASSED] xe_rtp ======================
[13:57:52] ==================== xe_wa (1 subtest) =====================
[13:57:52] ======================== xe_wa_gt  =========================
[13:57:52] [PASSED] TIGERLAKE B0
[13:57:52] [PASSED] DG1 A0
[13:57:52] [PASSED] DG1 B0
[13:57:52] [PASSED] ALDERLAKE_S A0
[13:57:52] [PASSED] ALDERLAKE_S B0
[13:57:52] [PASSED] ALDERLAKE_S C0
[13:57:52] [PASSED] ALDERLAKE_S D0
[13:57:52] [PASSED] ALDERLAKE_P A0
[13:57:52] [PASSED] ALDERLAKE_P B0
[13:57:52] [PASSED] ALDERLAKE_P C0
[13:57:52] [PASSED] ALDERLAKE_S RPLS D0
[13:57:52] [PASSED] ALDERLAKE_P RPLU E0
[13:57:52] [PASSED] DG2 G10 C0
[13:57:52] [PASSED] DG2 G11 B1
[13:57:52] [PASSED] DG2 G12 A1
[13:57:52] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:57:52] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:57:52] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[13:57:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[13:57:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[13:57:52] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[13:57:52] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[13:57:52] ==================== [PASSED] xe_wa_gt =====================
[13:57:52] ====================== [PASSED] xe_wa ======================
[13:57:52] ============================================================
[13:57:52] Testing complete. Ran 512 tests: passed: 494, skipped: 18
[13:57:52] Elapsed time: 36.509s total, 4.164s configuring, 31.829s building, 0.466s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
ERROR:root:../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:340:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  340 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:340:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  340 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:343:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  343 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:343:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  343 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:346:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  346 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_yuv8_or_id);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:346:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  346 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_yuv8_or_id);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:349:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  349 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_to_rgb8_or_id);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:349:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  349 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_to_rgb8_or_id);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:352:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  352 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_producer);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:352:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  352 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_producer);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:355:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  355 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_yuv444_yuv420_producer);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:355:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  355 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_yuv444_yuv420_producer);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:358:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  358 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_id_yuv8_or_yuv8_to_yuv422_yuv420);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:358:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  358 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_id_yuv8_or_yuv8_to_yuv422_yuv420);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:361:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  361 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_yuv444_yuv422_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:361:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  361 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_yuv444_yuv422_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:364:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  364 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC’
  315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,                            \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:364:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT’
  364 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi ## _funcs,                      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI’
  365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:43: error: initialization of ‘u32 * (*)(struct drm_bridge *, struct drm_bridge_state *, struct drm_crtc_state *, struct drm_connector_state *, u32,  unsigned int *)’ {aka ‘unsigned int * (*)(struct drm_bridge *, struct drm_bridge_state *, struct drm_crtc_state *, struct drm_connector_state *, unsigned int,  unsigned int *)’} from incompatible pointer type ‘int (*)(struct drm_bridge *, enum hdmi_infoframe_type,  const u8 *, size_t)’ {aka ‘int (*)(struct drm_bridge *, enum hdmi_infoframe_type,  const unsigned char *, long unsigned int)’} [-Werror=incompatible-pointer-types]
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |                                           ^
../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi ## _funcs,                      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI’
  365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:306:43: note: (near initialization for ‘yuv444_yuv422_rgb8_passthrough_hdmi_funcs.atomic_get_input_bus_fmts’)
  306 |         .hdmi_write_infoframe           = (hdmi_write_infoframe_func),                          \
      |                                           ^
../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi ## _funcs,                      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI’
  365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi ## _funcs,                      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI’
  365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:43: error: initialization of ‘int (*)(struct drm_bridge *, struct drm_bridge_state *, struct drm_crtc_state *, struct drm_connector_state *)’ from incompatible pointer type ‘int (*)(struct drm_bridge *, enum hdmi_infoframe_type)’ [-Werror=incompatible-pointer-types]
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |                                           ^
../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi ## _funcs,                      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI’
  365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:307:43: note: (near initialization for ‘yuv444_yuv422_rgb8_passthrough_hdmi_funcs.atomic_check’)
  307 |         .hdmi_clear_infoframe           = (hdmi_clear_infoframe_func),                          \
      |                                           ^
../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC’
  334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi ## _funcs,                      \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of macro ‘DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI’
  365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthrough);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_bridge_test.c: In function ‘drm_test_bridge_chain_init’:
../drivers/gpu/drm/tests/drm_bridge_test.c:520:36: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_clear_infoframe’; did you mean ‘hdmi_clear_avi_infoframe’?
  520 |                 if (bridge->funcs->hdmi_clear_infoframe &&
      |                                    ^~~~~~~~~~~~~~~~~~~~
      |                                    hdmi_clear_avi_infoframe
../drivers/gpu/drm/tests/drm_bridge_test.c:521:36: error: ‘const struct drm_bridge_funcs’ has no member named ‘hdmi_write_infoframe’; did you mean ‘hdmi_write_avi_infoframe’?
  521 |                     bridge->funcs->hdmi_write_infoframe) {
      |                                    ^~~~~~~~~~~~~~~~~~~~
      |                                    hdmi_write_avi_infoframe
In file included from ../drivers/gpu/drm/tests/drm_bridge_test.c:20:
../drivers/gpu/drm/tests/drm_kunit_edid.h: At top level:
../drivers/gpu/drm/tests/drm_kunit_edid.h:958:28: warning: ‘test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz’ defined but not used [-Wunused-const-variable=]
  958 | static const unsigned char test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz[] = {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:726:28: warning: ‘test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz’ defined but not used [-Wunused-const-variable=]
  726 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz[] = {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:612:28: warning: ‘test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz’ defined but not used [-Wunused-const-variable=]
  612 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz[] = {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:498:28: warning: ‘test_edid_hdmi_1080p_rgb_max_340mhz’ defined but not used [-Wunused-const-variable=]
  498 | static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] = {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:390:28: warning: ‘test_edid_hdmi_1080p_rgb_max_200mhz_hdr’ defined but not used [-Wunused-const-variable=]
  390 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[] = {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:271:28: warning: ‘test_edid_hdmi_1080p_rgb_max_200mhz’ defined but not used [-Wunused-const-variable=]
  271 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:163:28: warning: ‘test_edid_hdmi_1080p_rgb_max_100mhz’ defined but not used [-Wunused-const-variable=]
  163 | static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] = {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:57:28: warning: ‘test_edid_dvi_1080p’ defined but not used [-Wunused-const-variable=]
   57 | static const unsigned char test_edid_dvi_1080p[] = {
      |                            ^~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_bridge_test.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:544: drivers/gpu/drm/tests] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:544: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:544: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:544: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2054: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[13:57:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:57:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


