Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D414CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 17:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6167A10E2AC;
	Mon, 10 Nov 2025 17:12:21 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978B910E2AC;
 Mon, 10 Nov 2025 17:12:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/vblank=3A_refactoring_and_?=
 =?utf-8?q?cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Nov 2025 17:12:19 -0000
Message-ID: <176279473961.35461.15407875168524298087@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1762791343.git.jani.nikula@intel.com>
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
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

Series: drm/vblank: refactoring and cleanups
URL   : https://patchwork.freedesktop.org/series/157332/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:11:12] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:11:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:11:47] Starting KUnit Kernel (1/1)...
[17:11:47] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:11:47] ================== guc_buf (11 subtests) ===================
[17:11:47] [PASSED] test_smallest
[17:11:47] [PASSED] test_largest
[17:11:47] [PASSED] test_granular
[17:11:47] [PASSED] test_unique
[17:11:47] [PASSED] test_overlap
[17:11:47] [PASSED] test_reusable
[17:11:47] [PASSED] test_too_big
[17:11:47] [PASSED] test_flush
[17:11:47] [PASSED] test_lookup
[17:11:47] [PASSED] test_data
[17:11:47] [PASSED] test_class
[17:11:47] ===================== [PASSED] guc_buf =====================
[17:11:47] =================== guc_dbm (7 subtests) ===================
[17:11:47] [PASSED] test_empty
[17:11:47] [PASSED] test_default
[17:11:47] ======================== test_size  ========================
[17:11:47] [PASSED] 4
[17:11:47] [PASSED] 8
[17:11:47] [PASSED] 32
[17:11:47] [PASSED] 256
[17:11:47] ==================== [PASSED] test_size ====================
[17:11:47] ======================= test_reuse  ========================
[17:11:47] [PASSED] 4
[17:11:47] [PASSED] 8
[17:11:47] [PASSED] 32
[17:11:47] [PASSED] 256
[17:11:47] =================== [PASSED] test_reuse ====================
[17:11:47] =================== test_range_overlap  ====================
[17:11:47] [PASSED] 4
[17:11:47] [PASSED] 8
[17:11:47] [PASSED] 32
[17:11:47] [PASSED] 256
[17:11:47] =============== [PASSED] test_range_overlap ================
[17:11:47] =================== test_range_compact  ====================
[17:11:47] [PASSED] 4
[17:11:47] [PASSED] 8
[17:11:47] [PASSED] 32
[17:11:47] [PASSED] 256
[17:11:47] =============== [PASSED] test_range_compact ================
[17:11:47] ==================== test_range_spare  =====================
[17:11:47] [PASSED] 4
[17:11:47] [PASSED] 8
[17:11:47] [PASSED] 32
[17:11:47] [PASSED] 256
[17:11:47] ================ [PASSED] test_range_spare =================
[17:11:47] ===================== [PASSED] guc_dbm =====================
[17:11:47] =================== guc_idm (6 subtests) ===================
[17:11:47] [PASSED] bad_init
[17:11:47] [PASSED] no_init
[17:11:47] [PASSED] init_fini
[17:11:47] [PASSED] check_used
[17:11:47] [PASSED] check_quota
[17:11:47] [PASSED] check_all
[17:11:47] ===================== [PASSED] guc_idm =====================
[17:11:47] ================== no_relay (3 subtests) ===================
[17:11:47] [PASSED] xe_drops_guc2pf_if_not_ready
[17:11:47] [PASSED] xe_drops_guc2vf_if_not_ready
[17:11:47] [PASSED] xe_rejects_send_if_not_ready
[17:11:47] ==================== [PASSED] no_relay =====================
[17:11:47] ================== pf_relay (14 subtests) ==================
[17:11:47] [PASSED] pf_rejects_guc2pf_too_short
[17:11:47] [PASSED] pf_rejects_guc2pf_too_long
[17:11:47] [PASSED] pf_rejects_guc2pf_no_payload
[17:11:47] [PASSED] pf_fails_no_payload
[17:11:47] [PASSED] pf_fails_bad_origin
[17:11:47] [PASSED] pf_fails_bad_type
[17:11:47] [PASSED] pf_txn_reports_error
[17:11:47] [PASSED] pf_txn_sends_pf2guc
[17:11:47] [PASSED] pf_sends_pf2guc
[17:11:47] [SKIPPED] pf_loopback_nop
[17:11:47] [SKIPPED] pf_loopback_echo
[17:11:47] [SKIPPED] pf_loopback_fail
[17:11:47] [SKIPPED] pf_loopback_busy
[17:11:47] [SKIPPED] pf_loopback_retry
[17:11:47] ==================== [PASSED] pf_relay =====================
[17:11:47] ================== vf_relay (3 subtests) ===================
[17:11:47] [PASSED] vf_rejects_guc2vf_too_short
[17:11:47] [PASSED] vf_rejects_guc2vf_too_long
[17:11:47] [PASSED] vf_rejects_guc2vf_no_payload
[17:11:47] ==================== [PASSED] vf_relay =====================
[17:11:47] ================ pf_gt_config (4 subtests) =================
[17:11:47] [PASSED] fair_contexts_1vf
[17:11:47] [PASSED] fair_doorbells_1vf
[17:11:47] ====================== fair_contexts  ======================
[17:11:47] [PASSED] 1 VF
[17:11:47] [PASSED] 2 VFs
[17:11:47] [PASSED] 3 VFs
[17:11:47] [PASSED] 4 VFs
[17:11:47] [PASSED] 5 VFs
[17:11:47] [PASSED] 6 VFs
[17:11:47] [PASSED] 7 VFs
[17:11:47] [PASSED] 8 VFs
[17:11:47] [PASSED] 9 VFs
[17:11:47] [PASSED] 10 VFs
[17:11:47] [PASSED] 11 VFs
[17:11:47] [PASSED] 12 VFs
[17:11:47] [PASSED] 13 VFs
[17:11:47] [PASSED] 14 VFs
[17:11:47] [PASSED] 15 VFs
[17:11:47] [PASSED] 16 VFs
[17:11:47] [PASSED] 17 VFs
[17:11:47] [PASSED] 18 VFs
[17:11:47] [PASSED] 19 VFs
[17:11:47] [PASSED] 20 VFs
[17:11:47] [PASSED] 21 VFs
[17:11:47] [PASSED] 22 VFs
[17:11:47] [PASSED] 23 VFs
[17:11:47] [PASSED] 24 VFs
[17:11:47] [PASSED] 25 VFs
[17:11:47] [PASSED] 26 VFs
[17:11:47] [PASSED] 27 VFs
[17:11:47] [PASSED] 28 VFs
[17:11:47] [PASSED] 29 VFs
[17:11:47] [PASSED] 30 VFs
[17:11:47] [PASSED] 31 VFs
[17:11:47] [PASSED] 32 VFs
[17:11:47] [PASSED] 33 VFs
[17:11:47] [PASSED] 34 VFs
[17:11:47] [PASSED] 35 VFs
[17:11:47] [PASSED] 36 VFs
[17:11:47] [PASSED] 37 VFs
[17:11:47] [PASSED] 38 VFs
[17:11:47] [PASSED] 39 VFs
[17:11:47] [PASSED] 40 VFs
[17:11:47] [PASSED] 41 VFs
[17:11:47] [PASSED] 42 VFs
[17:11:47] [PASSED] 43 VFs
[17:11:47] [PASSED] 44 VFs
[17:11:47] [PASSED] 45 VFs
[17:11:47] [PASSED] 46 VFs
[17:11:47] [PASSED] 47 VFs
[17:11:47] [PASSED] 48 VFs
[17:11:47] [PASSED] 49 VFs
[17:11:47] [PASSED] 50 VFs
[17:11:47] [PASSED] 51 VFs
[17:11:47] [PASSED] 52 VFs
[17:11:47] [PASSED] 53 VFs
[17:11:47] [PASSED] 54 VFs
[17:11:47] [PASSED] 55 VFs
[17:11:47] [PASSED] 56 VFs
[17:11:47] [PASSED] 57 VFs
[17:11:47] [PASSED] 58 VFs
[17:11:47] [PASSED] 59 VFs
[17:11:47] [PASSED] 60 VFs
[17:11:47] [PASSED] 61 VFs
[17:11:47] [PASSED] 62 VFs
[17:11:47] [PASSED] 63 VFs
[17:11:47] ================== [PASSED] fair_contexts ==================
[17:11:47] ===================== fair_doorbells  ======================
[17:11:47] [PASSED] 1 VF
[17:11:47] [PASSED] 2 VFs
[17:11:47] [PASSED] 3 VFs
[17:11:47] [PASSED] 4 VFs
[17:11:47] [PASSED] 5 VFs
[17:11:47] [PASSED] 6 VFs
[17:11:47] [PASSED] 7 VFs
[17:11:47] [PASSED] 8 VFs
[17:11:47] [PASSED] 9 VFs
[17:11:47] [PASSED] 10 VFs
[17:11:47] [PASSED] 11 VFs
[17:11:47] [PASSED] 12 VFs
[17:11:47] [PASSED] 13 VFs
[17:11:47] [PASSED] 14 VFs
[17:11:47] [PASSED] 15 VFs
[17:11:47] [PASSED] 16 VFs
[17:11:47] [PASSED] 17 VFs
[17:11:47] [PASSED] 18 VFs
[17:11:47] [PASSED] 19 VFs
[17:11:47] [PASSED] 20 VFs
[17:11:47] [PASSED] 21 VFs
[17:11:47] [PASSED] 22 VFs
[17:11:47] [PASSED] 23 VFs
[17:11:47] [PASSED] 24 VFs
[17:11:47] [PASSED] 25 VFs
[17:11:47] [PASSED] 26 VFs
[17:11:47] [PASSED] 27 VFs
[17:11:47] [PASSED] 28 VFs
[17:11:47] [PASSED] 29 VFs
[17:11:47] [PASSED] 30 VFs
[17:11:47] [PASSED] 31 VFs
[17:11:47] [PASSED] 32 VFs
[17:11:47] [PASSED] 33 VFs
[17:11:47] [PASSED] 34 VFs
[17:11:47] [PASSED] 35 VFs
[17:11:47] [PASSED] 36 VFs
[17:11:47] [PASSED] 37 VFs
[17:11:47] [PASSED] 38 VFs
[17:11:47] [PASSED] 39 VFs
[17:11:47] [PASSED] 40 VFs
[17:11:47] [PASSED] 41 VFs
[17:11:47] [PASSED] 42 VFs
[17:11:47] [PASSED] 43 VFs
[17:11:47] [PASSED] 44 VFs
[17:11:47] [PASSED] 45 VFs
[17:11:47] [PASSED] 46 VFs
[17:11:47] [PASSED] 47 VFs
[17:11:47] [PASSED] 48 VFs
[17:11:47] [PASSED] 49 VFs
[17:11:47] [PASSED] 50 VFs
[17:11:47] [PASSED] 51 VFs
[17:11:47] [PASSED] 52 VFs
[17:11:47] [PASSED] 53 VFs
[17:11:47] [PASSED] 54 VFs
[17:11:47] [PASSED] 55 VFs
[17:11:47] [PASSED] 56 VFs
[17:11:47] [PASSED] 57 VFs
[17:11:47] [PASSED] 58 VFs
[17:11:47] [PASSED] 59 VFs
[17:11:47] [PASSED] 60 VFs
[17:11:47] [PASSED] 61 VFs
[17:11:47] [PASSED] 62 VFs
[17:11:47] [PASSED] 63 VFs
[17:11:47] ================= [PASSED] fair_doorbells ==================
[17:11:47] ================== [PASSED] pf_gt_config ===================
[17:11:47] ===================== lmtt (1 subtest) =====================
[17:11:47] ======================== test_ops  =========================
[17:11:47] [PASSED] 2-level
[17:11:47] [PASSED] multi-level
[17:11:47] ==================== [PASSED] test_ops =====================
[17:11:47] ====================== [PASSED] lmtt =======================
[17:11:47] ================= pf_service (11 subtests) =================
[17:11:47] [PASSED] pf_negotiate_any
[17:11:47] [PASSED] pf_negotiate_base_match
[17:11:47] [PASSED] pf_negotiate_base_newer
[17:11:47] [PASSED] pf_negotiate_base_next
[17:11:47] [SKIPPED] pf_negotiate_base_older
[17:11:47] [PASSED] pf_negotiate_base_prev
[17:11:47] [PASSED] pf_negotiate_latest_match
[17:11:47] [PASSED] pf_negotiate_latest_newer
[17:11:47] [PASSED] pf_negotiate_latest_next
[17:11:47] [SKIPPED] pf_negotiate_latest_older
[17:11:47] [SKIPPED] pf_negotiate_latest_prev
[17:11:47] =================== [PASSED] pf_service ====================
[17:11:47] ================= xe_guc_g2g (2 subtests) ==================
[17:11:47] ============== xe_live_guc_g2g_kunit_default  ==============
[17:11:47] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[17:11:47] ============== xe_live_guc_g2g_kunit_allmem  ===============
[17:11:47] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[17:11:47] =================== [SKIPPED] xe_guc_g2g ===================
[17:11:47] =================== xe_mocs (2 subtests) ===================
[17:11:47] ================ xe_live_mocs_kernel_kunit  ================
[17:11:47] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[17:11:47] ================ xe_live_mocs_reset_kunit  =================
[17:11:47] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[17:11:47] ==================== [SKIPPED] xe_mocs =====================
[17:11:47] ================= xe_migrate (2 subtests) ==================
[17:11:47] ================= xe_migrate_sanity_kunit  =================
[17:11:47] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[17:11:47] ================== xe_validate_ccs_kunit  ==================
[17:11:47] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[17:11:47] =================== [SKIPPED] xe_migrate ===================
[17:11:47] ================== xe_dma_buf (1 subtest) ==================
[17:11:47] ==================== xe_dma_buf_kunit  =====================
[17:11:47] ================ [SKIPPED] xe_dma_buf_kunit ================
[17:11:47] =================== [SKIPPED] xe_dma_buf ===================
[17:11:47] ================= xe_bo_shrink (1 subtest) =================
[17:11:47] =================== xe_bo_shrink_kunit  ====================
[17:11:47] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[17:11:47] ================== [SKIPPED] xe_bo_shrink ==================
[17:11:47] ==================== xe_bo (2 subtests) ====================
[17:11:47] ================== xe_ccs_migrate_kunit  ===================
[17:11:47] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[17:11:47] ==================== xe_bo_evict_kunit  ====================
[17:11:47] =============== [SKIPPED] xe_bo_evict_kunit ================
[17:11:47] ===================== [SKIPPED] xe_bo ======================
[17:11:47] ==================== args (11 subtests) ====================
[17:11:47] [PASSED] count_args_test
[17:11:47] [PASSED] call_args_example
[17:11:47] [PASSED] call_args_test
[17:11:47] [PASSED] drop_first_arg_example
[17:11:47] [PASSED] drop_first_arg_test
[17:11:47] [PASSED] first_arg_example
[17:11:47] [PASSED] first_arg_test
[17:11:47] [PASSED] last_arg_example
[17:11:47] [PASSED] last_arg_test
[17:11:47] [PASSED] pick_arg_example
[17:11:47] [PASSED] sep_comma_example
[17:11:47] ====================== [PASSED] args =======================
[17:11:47] =================== xe_pci (3 subtests) ====================
[17:11:47] ==================== check_graphics_ip  ====================
[17:11:47] [PASSED] 12.00 Xe_LP
[17:11:47] [PASSED] 12.10 Xe_LP+
[17:11:47] [PASSED] 12.55 Xe_HPG
[17:11:47] [PASSED] 12.60 Xe_HPC
[17:11:47] [PASSED] 12.70 Xe_LPG
[17:11:47] [PASSED] 12.71 Xe_LPG
[17:11:47] [PASSED] 12.74 Xe_LPG+
[17:11:47] [PASSED] 20.01 Xe2_HPG
[17:11:47] [PASSED] 20.02 Xe2_HPG
[17:11:47] [PASSED] 20.04 Xe2_LPG
[17:11:47] [PASSED] 30.00 Xe3_LPG
[17:11:47] [PASSED] 30.01 Xe3_LPG
[17:11:47] [PASSED] 30.03 Xe3_LPG
[17:11:47] [PASSED] 30.04 Xe3_LPG
[17:11:47] [PASSED] 30.05 Xe3_LPG
[17:11:47] [PASSED] 35.11 Xe3p_XPC
[17:11:47] ================ [PASSED] check_graphics_ip ================
[17:11:47] ===================== check_media_ip  ======================
[17:11:47] [PASSED] 12.00 Xe_M
[17:11:47] [PASSED] 12.55 Xe_HPM
[17:11:47] [PASSED] 13.00 Xe_LPM+
[17:11:47] [PASSED] 13.01 Xe2_HPM
[17:11:47] [PASSED] 20.00 Xe2_LPM
[17:11:47] [PASSED] 30.00 Xe3_LPM
[17:11:47] [PASSED] 30.02 Xe3_LPM
[17:11:47] [PASSED] 35.00 Xe3p_LPM
[17:11:47] [PASSED] 35.03 Xe3p_HPM
[17:11:47] ================= [PASSED] check_media_ip ==================
[17:11:47] =================== check_platform_desc  ===================
[17:11:47] [PASSED] 0x9A60 (TIGERLAKE)
[17:11:47] [PASSED] 0x9A68 (TIGERLAKE)
[17:11:47] [PASSED] 0x9A70 (TIGERLAKE)
[17:11:47] [PASSED] 0x9A40 (TIGERLAKE)
[17:11:47] [PASSED] 0x9A49 (TIGERLAKE)
[17:11:47] [PASSED] 0x9A59 (TIGERLAKE)
[17:11:47] [PASSED] 0x9A78 (TIGERLAKE)
[17:11:47] [PASSED] 0x9AC0 (TIGERLAKE)
[17:11:47] [PASSED] 0x9AC9 (TIGERLAKE)
[17:11:47] [PASSED] 0x9AD9 (TIGERLAKE)
[17:11:47] [PASSED] 0x9AF8 (TIGERLAKE)
[17:11:47] [PASSED] 0x4C80 (ROCKETLAKE)
[17:11:47] [PASSED] 0x4C8A (ROCKETLAKE)
[17:11:47] [PASSED] 0x4C8B (ROCKETLAKE)
[17:11:47] [PASSED] 0x4C8C (ROCKETLAKE)
[17:11:47] [PASSED] 0x4C90 (ROCKETLAKE)
[17:11:47] [PASSED] 0x4C9A (ROCKETLAKE)
[17:11:47] [PASSED] 0x4680 (ALDERLAKE_S)
[17:11:47] [PASSED] 0x4682 (ALDERLAKE_S)
[17:11:47] [PASSED] 0x4688 (ALDERLAKE_S)
[17:11:47] [PASSED] 0x468A (ALDERLAKE_S)
[17:11:47] [PASSED] 0x468B (ALDERLAKE_S)
[17:11:47] [PASSED] 0x4690 (ALDERLAKE_S)
[17:11:47] [PASSED] 0x4692 (ALDERLAKE_S)
[17:11:47] [PASSED] 0x4693 (ALDERLAKE_S)
[17:11:47] [PASSED] 0x46A0 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46A1 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46A2 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46A3 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46A6 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46A8 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46AA (ALDERLAKE_P)
[17:11:47] [PASSED] 0x462A (ALDERLAKE_P)
[17:11:47] [PASSED] 0x4626 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x4628 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46B0 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46B1 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46B2 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46B3 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46C0 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46C1 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46C2 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46C3 (ALDERLAKE_P)
[17:11:47] [PASSED] 0x46D0 (ALDERLAKE_N)
[17:11:47] [PASSED] 0x46D1 (ALDERLAKE_N)
[17:11:47] [PASSED] 0x46D2 (ALDERLAKE_N)
[17:11:47] [PASSED] 0x46D3 (ALDERLAKE_N)
[17:11:47] [PASSED] 0x46D4 (ALDERLAKE_N)
[17:11:47] [PASSED] 0xA721 (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7A1 (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7A9 (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7AC (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7AD (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA720 (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7A0 (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7A8 (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7AA (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA7AB (ALDERLAKE_P)
[17:11:47] [PASSED] 0xA780 (ALDERLAKE_S)
[17:11:47] [PASSED] 0xA781 (ALDERLAKE_S)
[17:11:47] [PASSED] 0xA782 (ALDERLAKE_S)
[17:11:47] [PASSED] 0xA783 (ALDERLAKE_S)
[17:11:47] [PASSED] 0xA788 (ALDERLAKE_S)
[17:11:47] [PASSED] 0xA789 (ALDERLAKE_S)
[17:11:47] [PASSED] 0xA78A (ALDERLAKE_S)
[17:11:47] [PASSED] 0xA78B (ALDERLAKE_S)
[17:11:47] [PASSED] 0x4905 (DG1)
[17:11:47] [PASSED] 0x4906 (DG1)
[17:11:47] [PASSED] 0x4907 (DG1)
[17:11:47] [PASSED] 0x4908 (DG1)
[17:11:47] [PASSED] 0x4909 (DG1)
[17:11:47] [PASSED] 0x56C0 (DG2)
[17:11:47] [PASSED] 0x56C2 (DG2)
[17:11:47] [PASSED] 0x56C1 (DG2)
[17:11:47] [PASSED] 0x7D51 (METEORLAKE)
[17:11:47] [PASSED] 0x7DD1 (METEORLAKE)
[17:11:47] [PASSED] 0x7D41 (METEORLAKE)
[17:11:47] [PASSED] 0x7D67 (METEORLAKE)
[17:11:47] [PASSED] 0xB640 (METEORLAKE)
[17:11:47] [PASSED] 0x56A0 (DG2)
[17:11:47] [PASSED] 0x56A1 (DG2)
[17:11:47] [PASSED] 0x56A2 (DG2)
[17:11:47] [PASSED] 0x56BE (DG2)
[17:11:47] [PASSED] 0x56BF (DG2)
[17:11:47] [PASSED] 0x5690 (DG2)
stty: 'standard input': Inappropriate ioctl for device
[17:11:47] [PASSED] 0x5691 (DG2)
[17:11:47] [PASSED] 0x5692 (DG2)
[17:11:47] [PASSED] 0x56A5 (DG2)
[17:11:47] [PASSED] 0x56A6 (DG2)
[17:11:47] [PASSED] 0x56B0 (DG2)
[17:11:47] [PASSED] 0x56B1 (DG2)
[17:11:47] [PASSED] 0x56BA (DG2)
[17:11:47] [PASSED] 0x56BB (DG2)
[17:11:47] [PASSED] 0x56BC (DG2)
[17:11:47] [PASSED] 0x56BD (DG2)
[17:11:47] [PASSED] 0x5693 (DG2)
[17:11:47] [PASSED] 0x5694 (DG2)
[17:11:47] [PASSED] 0x5695 (DG2)
[17:11:47] [PASSED] 0x56A3 (DG2)
[17:11:47] [PASSED] 0x56A4 (DG2)
[17:11:47] [PASSED] 0x56B2 (DG2)
[17:11:47] [PASSED] 0x56B3 (DG2)
[17:11:47] [PASSED] 0x5696 (DG2)
[17:11:47] [PASSED] 0x5697 (DG2)
[17:11:47] [PASSED] 0xB69 (PVC)
[17:11:47] [PASSED] 0xB6E (PVC)
[17:11:47] [PASSED] 0xBD4 (PVC)
[17:11:47] [PASSED] 0xBD5 (PVC)
[17:11:47] [PASSED] 0xBD6 (PVC)
[17:11:47] [PASSED] 0xBD7 (PVC)
[17:11:47] [PASSED] 0xBD8 (PVC)
[17:11:47] [PASSED] 0xBD9 (PVC)
[17:11:47] [PASSED] 0xBDA (PVC)
[17:11:47] [PASSED] 0xBDB (PVC)
[17:11:47] [PASSED] 0xBE0 (PVC)
[17:11:47] [PASSED] 0xBE1 (PVC)
[17:11:47] [PASSED] 0xBE5 (PVC)
[17:11:47] [PASSED] 0x7D40 (METEORLAKE)
[17:11:47] [PASSED] 0x7D45 (METEORLAKE)
[17:11:47] [PASSED] 0x7D55 (METEORLAKE)
[17:11:47] [PASSED] 0x7D60 (METEORLAKE)
[17:11:47] [PASSED] 0x7DD5 (METEORLAKE)
[17:11:47] [PASSED] 0x6420 (LUNARLAKE)
[17:11:47] [PASSED] 0x64A0 (LUNARLAKE)
[17:11:47] [PASSED] 0x64B0 (LUNARLAKE)
[17:11:47] [PASSED] 0xE202 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE209 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE20B (BATTLEMAGE)
[17:11:47] [PASSED] 0xE20C (BATTLEMAGE)
[17:11:47] [PASSED] 0xE20D (BATTLEMAGE)
[17:11:47] [PASSED] 0xE210 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE211 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE212 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE216 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE220 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE221 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE222 (BATTLEMAGE)
[17:11:47] [PASSED] 0xE223 (BATTLEMAGE)
[17:11:47] [PASSED] 0xB080 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB081 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB082 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB083 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB084 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB085 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB086 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB087 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB08F (PANTHERLAKE)
[17:11:47] [PASSED] 0xB090 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB0A0 (PANTHERLAKE)
[17:11:47] [PASSED] 0xB0B0 (PANTHERLAKE)
[17:11:47] [PASSED] 0xD740 (NOVALAKE_S)
[17:11:47] [PASSED] 0xD741 (NOVALAKE_S)
[17:11:47] [PASSED] 0xD742 (NOVALAKE_S)
[17:11:47] [PASSED] 0xD743 (NOVALAKE_S)
[17:11:47] [PASSED] 0xD744 (NOVALAKE_S)
[17:11:47] [PASSED] 0xD745 (NOVALAKE_S)
[17:11:47] [PASSED] 0x674C (CRESCENTISLAND)
[17:11:47] [PASSED] 0xFD80 (PANTHERLAKE)
[17:11:47] [PASSED] 0xFD81 (PANTHERLAKE)
[17:11:47] =============== [PASSED] check_platform_desc ===============
[17:11:47] ===================== [PASSED] xe_pci ======================
[17:11:47] =================== xe_rtp (2 subtests) ====================
[17:11:47] =============== xe_rtp_process_to_sr_tests  ================
[17:11:47] [PASSED] coalesce-same-reg
[17:11:47] [PASSED] no-match-no-add
[17:11:47] [PASSED] match-or
[17:11:47] [PASSED] match-or-xfail
[17:11:47] [PASSED] no-match-no-add-multiple-rules
[17:11:47] [PASSED] two-regs-two-entries
[17:11:47] [PASSED] clr-one-set-other
[17:11:47] [PASSED] set-field
[17:11:47] [PASSED] conflict-duplicate
[17:11:47] [PASSED] conflict-not-disjoint
[17:11:47] [PASSED] conflict-reg-type
[17:11:47] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[17:11:47] ================== xe_rtp_process_tests  ===================
[17:11:47] [PASSED] active1
[17:11:47] [PASSED] active2
[17:11:47] [PASSED] active-inactive
[17:11:47] [PASSED] inactive-active
[17:11:47] [PASSED] inactive-1st_or_active-inactive
[17:11:47] [PASSED] inactive-2nd_or_active-inactive
[17:11:47] [PASSED] inactive-last_or_active-inactive
[17:11:47] [PASSED] inactive-no_or_active-inactive
[17:11:47] ============== [PASSED] xe_rtp_process_tests ===============
[17:11:47] ===================== [PASSED] xe_rtp ======================
[17:11:47] ==================== xe_wa (1 subtest) =====================
[17:11:47] ======================== xe_wa_gt  =========================
[17:11:47] [PASSED] TIGERLAKE B0
[17:11:47] [PASSED] DG1 A0
[17:11:47] [PASSED] DG1 B0
[17:11:47] [PASSED] ALDERLAKE_S A0
[17:11:47] [PASSED] ALDERLAKE_S B0
[17:11:47] [PASSED] ALDERLAKE_S C0
[17:11:47] [PASSED] ALDERLAKE_S D0
[17:11:47] [PASSED] ALDERLAKE_P A0
[17:11:47] [PASSED] ALDERLAKE_P B0
[17:11:47] [PASSED] ALDERLAKE_P C0
[17:11:47] [PASSED] ALDERLAKE_S RPLS D0
[17:11:47] [PASSED] ALDERLAKE_P RPLU E0
[17:11:47] [PASSED] DG2 G10 C0
[17:11:47] [PASSED] DG2 G11 B1
[17:11:47] [PASSED] DG2 G12 A1
[17:11:47] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:11:47] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:11:47] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[17:11:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[17:11:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[17:11:47] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[17:11:47] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[17:11:47] ==================== [PASSED] xe_wa_gt =====================
[17:11:47] ====================== [PASSED] xe_wa ======================
[17:11:47] ============================================================
[17:11:47] Testing complete. Ran 446 tests: passed: 428, skipped: 18
[17:11:47] Elapsed time: 35.361s total, 4.290s configuring, 30.604s building, 0.418s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[17:11:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:11:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:12:14] Starting KUnit Kernel (1/1)...
[17:12:14] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:12:14] ============ drm_test_pick_cmdline (2 subtests) ============
[17:12:14] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[17:12:14] =============== drm_test_pick_cmdline_named  ===============
[17:12:14] [PASSED] NTSC
[17:12:14] [PASSED] NTSC-J
[17:12:14] [PASSED] PAL
[17:12:14] [PASSED] PAL-M
[17:12:14] =========== [PASSED] drm_test_pick_cmdline_named ===========
[17:12:14] ============== [PASSED] drm_test_pick_cmdline ==============
[17:12:14] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[17:12:14] [ERROR] Test: drm_test_atomic_get_connector_for_encoder: missing expected subtest!
[17:12:14] ------------[ cut here ]------------
[17:12:14] WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/drm_vblank.c:193 drm_crtc_vblank_crtc+0x94/0xa0
[17:12:14] drm-kunit-mock-device drm_test_drm_atomic_get_connector_for_encoder.drm-kunit-mock-device: [drm] drm_WARN_ON(!vblank)
[17:12:14] CPU: 0 UID: 0 PID: 28 Comm: kunit_try_catch Tainted: G        W        N  6.18.0-rc5-g82292f137e2d #2 NONE
[17:12:14] Tainted: [W]=WARN, [N]=TEST
[17:12:14] Stack:
[17:12:14]  604c25af 00000000 00000000 00000001
[17:12:14]  ffffff00 604c25af 602da8d4 00000009
[17:12:14]  000000c1 60046f7a 600237bb ad38bc20
[17:12:14] Call Trace:
[17:12:14]  [<602da8d4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[17:12:14]  [<60046f7a>] ? dump_stack_lvl+0x5b/0x77
[17:12:14]  [<600237bb>] ? _printk+0x0/0x65
[17:12:14]  [<6001f07a>] ? __warn.cold+0x71/0x10b
[17:12:14]  [<6001f1a8>] ? warn_slowpath_fmt+0x94/0xa1
[17:12:14]  [<602a2ad0>] ? drm_atomic_get_connector_state+0x0/0x2f0
[17:12:14]  [<60055bf9>] ? um_set_signals+0x59/0x70
[17:12:14]  [<602d3e50>] ? __drm_dev_dbg+0x0/0xb0
[17:12:14]  [<602da8d4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[17:12:14]  [<602da892>] ? drm_crtc_vblank_crtc+0x52/0xa0
[17:12:14]  [<602dab07>] ? drm_calc_timestamping_constants+0x27/0x170
[17:12:14]  [<60055ba0>] ? um_set_signals+0x0/0x70
[17:12:14]  [<602daae0>] ? drm_calc_timestamping_constants+0x0/0x170
[17:12:14]  [<602d3e50>] ? __drm_dev_dbg+0x0/0xb0
[17:12:14]  [<602eb0fc>] ? drm_atomic_helper_calc_timestamping_constants+0x6c/0x90
[17:12:14]  [<602ee25c>] ? drm_atomic_helper_commit_modeset_disables+0x43c/0x7f0
[17:12:14]  [<600ced10>] ? ktime_get+0x0/0x150
[17:12:14]  [<602ce6f0>] ? drm_modeset_backoff+0x0/0x1d0
[17:12:14]  [<602eef23>] ? drm_atomic_helper_commit_tail+0x23/0xa0
[17:12:14]  [<602f0164>] ? commit_tail+0xf4/0x180
[17:12:14]  [<602ff510>] ? drm_kunit_helper_enable_crtc_connector+0x0/0x140
[17:12:14]  [<602f039f>] ? drm_atomic_helper_commit+0x18f/0x1d0
[17:12:14]  [<602a4af9>] ? drm_atomic_commit+0xb9/0xe0
[17:12:14]  [<6003db45>] ? __drm_printfn_info+0x0/0x23
[17:12:14]  [<602ff870>] ? drm_test_drm_atomic_get_connector_for_encoder+0x220/0x590
[17:12:14]  [<6008b2c6>] ? finish_task_switch.isra.0+0x76/0x1b0
[17:12:14]  [<600cf290>] ? ktime_get_ts64+0x0/0x1a0
[17:12:14]  [<60082650>] ? to_kthread+0x0/0x40
[17:12:14]  [<60252ecf>] ? kunit_try_run_case+0x7f/0x100
[17:12:14]  [<60082650>] ? to_kthread+0x0/0x40
[17:12:14]  [<60255220>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[17:12:14]  [<60255236>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[17:12:14]  [<60083035>] ? kthread+0xf5/0x270
[17:12:14]  [<60049595>] ? new_thread_handler+0x45/0x60
[17:12:14] ---[ end trace 0000000000000000 ]---
[17:12:14] ------------[ cut here ]------------
[17:12:14] WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/drm_vblank.c:193 drm_crtc_vblank_crtc+0x94/0xa0
[17:12:14] drm-kunit-mock-device drm_test_drm_atomic_get_connector_for_encoder.drm-kunit-mock-device: [drm] drm_WARN_ON(!vblank)
[17:12:14] CPU: 0 UID: 0 PID: 28 Comm: kunit_try_catch Tainted: G        W        N  6.18.0-rc5-g82292f137e2d #2 NONE
[17:12:14] Tainted: [W]=WARN, [N]=TEST
[17:12:14] Stack:
[17:12:14]  604c25af 00000000 00000000 00000000
[17:12:14]  ffffff00 604c25af 602da8d4 00000009
[17:12:14]  000000c1 60046f7a 600237bb ad38bc90
[17:12:14] Call Trace:
[17:12:14]  [<602da8d4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[17:12:14]  [<60046f7a>] ? dump_stack_lvl+0x5b/0x77
[17:12:14]  [<600237bb>] ? _printk+0x0/0x65
[17:12:14]  [<6001f07a>] ? __warn.cold+0x71/0x10b
[17:12:14]  [<6001f1a8>] ? warn_slowpath_fmt+0x94/0xa1
[17:12:14]  [<602dab07>] ? drm_calc_timestamping_constants+0x27/0x170
[17:12:14]  [<60055ba0>] ? um_set_signals+0x0/0x70
[17:12:14]  [<602da8d4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[17:12:14]  [<602da892>] ? drm_crtc_vblank_crtc+0x52/0xa0
[17:12:14]  [<602dad7a>] ? drm_crtc_send_vblank_event+0x1a/0x80
[17:12:14]  [<60055ba0>] ? um_set_signals+0x0/0x70
[17:12:14]  [<602eb74c>] ? drm_atomic_helper_fake_vblank+0x8c/0xd0
[17:12:14]  [<600ced10>] ? ktime_get+0x0/0x150
[17:12:14]  [<602ce6f0>] ? drm_modeset_backoff+0x0/0x1d0
[17:12:14]  [<602eef58>] ? drm_atomic_helper_commit_tail+0x58/0xa0
[17:12:14]  [<602f0164>] ? commit_tail+0xf4/0x180
[17:12:14]  [<602ff510>] ? drm_kunit_helper_enable_crtc_connector+0x0/0x140
[17:12:14]  [<602f039f>] ? drm_atomic_helper_commit+0x18f/0x1d0
[17:12:14]  [<602a4af9>] ? drm_atomic_commit+0xb9/0xe0
[17:12:14]  [<6003db45>] ? __drm_printfn_info+0x0/0x23
[17:12:14]  [<602ff870>] ? drm_test_drm_atomic_get_connector_for_encoder+0x220/0x590
[17:12:14]  [<6008b2c6>] ? finish_task_switch.isra.0+0x76/0x1b0
[17:12:14]  [<600cf290>] ? ktime_get_ts64+0x0/0x1a0
[17:12:14]  [<60082650>] ? to_kthread+0x0/0x40
[17:12:14]  [<60252ecf>] ? kunit_try_run_case+0x7f/0x100
[17:12:14]  [<60082650>] ? to_kthread+0x0/0x40
[17:12:14]  [<60255220>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[17:12:14]  [<60255236>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[17:12:14]  [<60083035>] ? kthread+0xf5/0x270
[17:12:14]  [<60049595>] ? new_thread_handler+0x45/0x60
[17:12:14] ---[ end trace 0000000000000000 ]---
[17:12:14] 
[17:12:14] Pid: 28, comm: kunit_try_catch Tainted: G        W        N  6.18.0-rc5-g82292f137e2d
[17:12:14] RIP: 0033:drm_crtc_send_vblank_event+0x3f/0x80
[17:12:14] RSP: 00000000ad38bd30  EFLAGS: 00010246
[17:12:14] RAX: 0000000006041f80 RBX: 0000000000000000 RCX: 0000000006041f80
[17:12:14] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[17:12:14] RBP: 000000006daecd80 R08: 0000000000000000 R09: 0000000000000000
[17:12:14] R10: 0000000000000000 R11: 0000000000000000 R12: 000000006da48000
[17:12:14] R13: 000000006daece00 R14: 000000006d880828 R15: 0000000000000001
[17:12:14] Kernel panic - not syncing: Segfault with no mm
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: drm_test_atomic_get_connector_for_encoder: missing subtest result line!
[17:12:14] # module: drm_atomic_test
[17:12:14] === [CRASHED] drm_test_atomic_get_connector_for_encoder ====
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] [ERROR] Test: main: missing expected subtest!
[17:12:14] [CRASHED] 
[17:12:14] ============================================================
[17:12:14] Testing complete. Ran 40 tests: passed: 5, crashed: 35, errors: 36
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[17:12:14] Elapsed time: 26.922s total, 1.711s configuring, 24.942s building, 0.269s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


