Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF007CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B6610E38E;
	Thu, 21 Aug 2025 17:10:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E850210E389;
 Thu, 21 Aug 2025 17:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5Bv3=2C1?=
 =?utf-8?q?/2=5D_drm/buddy=3A_Optimize_free_block_management_with_RB_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 17:10:29 -0000
Message-ID: <175579622994.258356.15017773607044076116@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v3,1/2] drm/buddy: Optimize free block management with RB tree
URL   : https://patchwork.freedesktop.org/series/153302/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:09:27] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:09:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:10:00] Starting KUnit Kernel (1/1)...
[17:10:00] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:10:00] ================== guc_buf (11 subtests) ===================
[17:10:00] [PASSED] test_smallest
[17:10:00] [PASSED] test_largest
[17:10:00] [PASSED] test_granular
[17:10:00] [PASSED] test_unique
[17:10:00] [PASSED] test_overlap
[17:10:00] [PASSED] test_reusable
[17:10:00] [PASSED] test_too_big
[17:10:00] [PASSED] test_flush
[17:10:00] [PASSED] test_lookup
[17:10:00] [PASSED] test_data
[17:10:00] [PASSED] test_class
[17:10:00] ===================== [PASSED] guc_buf =====================
[17:10:00] =================== guc_dbm (7 subtests) ===================
[17:10:00] [PASSED] test_empty
[17:10:00] [PASSED] test_default
[17:10:00] ======================== test_size  ========================
[17:10:00] [PASSED] 4
[17:10:00] [PASSED] 8
[17:10:00] [PASSED] 32
[17:10:00] [PASSED] 256
[17:10:00] ==================== [PASSED] test_size ====================
[17:10:00] ======================= test_reuse  ========================
[17:10:00] [PASSED] 4
[17:10:00] [PASSED] 8
[17:10:00] [PASSED] 32
[17:10:00] [PASSED] 256
[17:10:00] =================== [PASSED] test_reuse ====================
[17:10:00] =================== test_range_overlap  ====================
[17:10:00] [PASSED] 4
[17:10:00] [PASSED] 8
[17:10:00] [PASSED] 32
[17:10:00] [PASSED] 256
[17:10:00] =============== [PASSED] test_range_overlap ================
[17:10:00] =================== test_range_compact  ====================
[17:10:00] [PASSED] 4
[17:10:00] [PASSED] 8
[17:10:00] [PASSED] 32
[17:10:00] [PASSED] 256
[17:10:00] =============== [PASSED] test_range_compact ================
[17:10:00] ==================== test_range_spare  =====================
[17:10:00] [PASSED] 4
[17:10:00] [PASSED] 8
[17:10:00] [PASSED] 32
[17:10:00] [PASSED] 256
[17:10:00] ================ [PASSED] test_range_spare =================
[17:10:00] ===================== [PASSED] guc_dbm =====================
[17:10:00] =================== guc_idm (6 subtests) ===================
[17:10:00] [PASSED] bad_init
[17:10:00] [PASSED] no_init
[17:10:00] [PASSED] init_fini
[17:10:00] [PASSED] check_used
[17:10:00] [PASSED] check_quota
[17:10:00] [PASSED] check_all
[17:10:00] ===================== [PASSED] guc_idm =====================
[17:10:00] ================== no_relay (3 subtests) ===================
[17:10:00] [PASSED] xe_drops_guc2pf_if_not_ready
[17:10:00] [PASSED] xe_drops_guc2vf_if_not_ready
[17:10:00] [PASSED] xe_rejects_send_if_not_ready
[17:10:00] ==================== [PASSED] no_relay =====================
[17:10:00] ================== pf_relay (14 subtests) ==================
[17:10:00] [PASSED] pf_rejects_guc2pf_too_short
[17:10:00] [PASSED] pf_rejects_guc2pf_too_long
[17:10:00] [PASSED] pf_rejects_guc2pf_no_payload
[17:10:00] [PASSED] pf_fails_no_payload
[17:10:00] [PASSED] pf_fails_bad_origin
[17:10:00] [PASSED] pf_fails_bad_type
[17:10:00] [PASSED] pf_txn_reports_error
[17:10:00] [PASSED] pf_txn_sends_pf2guc
[17:10:00] [PASSED] pf_sends_pf2guc
[17:10:00] [SKIPPED] pf_loopback_nop
[17:10:00] [SKIPPED] pf_loopback_echo
[17:10:00] [SKIPPED] pf_loopback_fail
[17:10:00] [SKIPPED] pf_loopback_busy
[17:10:00] [SKIPPED] pf_loopback_retry
[17:10:00] ==================== [PASSED] pf_relay =====================
[17:10:00] ================== vf_relay (3 subtests) ===================
[17:10:00] [PASSED] vf_rejects_guc2vf_too_short
[17:10:00] [PASSED] vf_rejects_guc2vf_too_long
[17:10:00] [PASSED] vf_rejects_guc2vf_no_payload
[17:10:00] ==================== [PASSED] vf_relay =====================
[17:10:00] ===================== lmtt (1 subtest) =====================
[17:10:00] ======================== test_ops  =========================
[17:10:00] [PASSED] 2-level
[17:10:00] [PASSED] multi-level
[17:10:00] ==================== [PASSED] test_ops =====================
[17:10:00] ====================== [PASSED] lmtt =======================
[17:10:00] ================= pf_service (11 subtests) =================
[17:10:00] [PASSED] pf_negotiate_any
[17:10:00] [PASSED] pf_negotiate_base_match
[17:10:00] [PASSED] pf_negotiate_base_newer
[17:10:00] [PASSED] pf_negotiate_base_next
[17:10:00] [SKIPPED] pf_negotiate_base_older
[17:10:00] [PASSED] pf_negotiate_base_prev
[17:10:00] [PASSED] pf_negotiate_latest_match
[17:10:00] [PASSED] pf_negotiate_latest_newer
[17:10:00] [PASSED] pf_negotiate_latest_next
[17:10:00] [SKIPPED] pf_negotiate_latest_older
[17:10:00] [SKIPPED] pf_negotiate_latest_prev
[17:10:00] =================== [PASSED] pf_service ====================
[17:10:00] =================== xe_mocs (2 subtests) ===================
[17:10:00] ================ xe_live_mocs_kernel_kunit  ================
[17:10:00] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[17:10:00] ================ xe_live_mocs_reset_kunit  =================
[17:10:00] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[17:10:00] ==================== [SKIPPED] xe_mocs =====================
[17:10:00] ================= xe_migrate (2 subtests) ==================
[17:10:00] ================= xe_migrate_sanity_kunit  =================
[17:10:00] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[17:10:00] ================== xe_validate_ccs_kunit  ==================
[17:10:00] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[17:10:00] =================== [SKIPPED] xe_migrate ===================
[17:10:00] ================== xe_dma_buf (1 subtest) ==================
[17:10:00] ==================== xe_dma_buf_kunit  =====================
[17:10:00] ================ [SKIPPED] xe_dma_buf_kunit ================
[17:10:00] =================== [SKIPPED] xe_dma_buf ===================
[17:10:00] ================= xe_bo_shrink (1 subtest) =================
[17:10:00] =================== xe_bo_shrink_kunit  ====================
[17:10:00] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[17:10:00] ================== [SKIPPED] xe_bo_shrink ==================
[17:10:00] ==================== xe_bo (2 subtests) ====================
[17:10:00] ================== xe_ccs_migrate_kunit  ===================
[17:10:00] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[17:10:00] ==================== xe_bo_evict_kunit  ====================
[17:10:00] =============== [SKIPPED] xe_bo_evict_kunit ================
[17:10:00] ===================== [SKIPPED] xe_bo ======================
[17:10:00] ==================== args (11 subtests) ====================
[17:10:00] [PASSED] count_args_test
[17:10:00] [PASSED] call_args_example
[17:10:00] [PASSED] call_args_test
[17:10:00] [PASSED] drop_first_arg_example
[17:10:00] [PASSED] drop_first_arg_test
[17:10:00] [PASSED] first_arg_example
[17:10:00] [PASSED] first_arg_test
[17:10:00] [PASSED] last_arg_example
[17:10:00] [PASSED] last_arg_test
[17:10:00] [PASSED] pick_arg_example
[17:10:00] [PASSED] sep_comma_example
[17:10:00] ====================== [PASSED] args =======================
[17:10:00] =================== xe_pci (3 subtests) ====================
[17:10:00] ==================== check_graphics_ip  ====================
[17:10:00] [PASSED] 12.70 Xe_LPG
[17:10:00] [PASSED] 12.71 Xe_LPG
[17:10:00] [PASSED] 12.74 Xe_LPG+
[17:10:00] [PASSED] 20.01 Xe2_HPG
[17:10:00] [PASSED] 20.02 Xe2_HPG
[17:10:00] [PASSED] 20.04 Xe2_LPG
[17:10:00] [PASSED] 30.00 Xe3_LPG
[17:10:00] [PASSED] 30.01 Xe3_LPG
[17:10:00] [PASSED] 30.03 Xe3_LPG
[17:10:00] ================ [PASSED] check_graphics_ip ================
[17:10:00] ===================== check_media_ip  ======================
[17:10:00] [PASSED] 13.00 Xe_LPM+
[17:10:00] [PASSED] 13.01 Xe2_HPM
[17:10:00] [PASSED] 20.00 Xe2_LPM
[17:10:00] [PASSED] 30.00 Xe3_LPM
[17:10:00] [PASSED] 30.02 Xe3_LPM
[17:10:00] ================= [PASSED] check_media_ip ==================
[17:10:00] ================= check_platform_gt_count  =================
[17:10:00] [PASSED] 0x9A60 (TIGERLAKE)
[17:10:00] [PASSED] 0x9A68 (TIGERLAKE)
[17:10:00] [PASSED] 0x9A70 (TIGERLAKE)
[17:10:00] [PASSED] 0x9A40 (TIGERLAKE)
[17:10:00] [PASSED] 0x9A49 (TIGERLAKE)
[17:10:00] [PASSED] 0x9A59 (TIGERLAKE)
[17:10:00] [PASSED] 0x9A78 (TIGERLAKE)
[17:10:00] [PASSED] 0x9AC0 (TIGERLAKE)
[17:10:00] [PASSED] 0x9AC9 (TIGERLAKE)
[17:10:00] [PASSED] 0x9AD9 (TIGERLAKE)
[17:10:00] [PASSED] 0x9AF8 (TIGERLAKE)
[17:10:00] [PASSED] 0x4C80 (ROCKETLAKE)
[17:10:00] [PASSED] 0x4C8A (ROCKETLAKE)
[17:10:00] [PASSED] 0x4C8B (ROCKETLAKE)
[17:10:00] [PASSED] 0x4C8C (ROCKETLAKE)
[17:10:00] [PASSED] 0x4C90 (ROCKETLAKE)
[17:10:00] [PASSED] 0x4C9A (ROCKETLAKE)
[17:10:00] [PASSED] 0x4680 (ALDERLAKE_S)
[17:10:00] [PASSED] 0x4682 (ALDERLAKE_S)
[17:10:00] [PASSED] 0x4688 (ALDERLAKE_S)
[17:10:00] [PASSED] 0x468A (ALDERLAKE_S)
[17:10:00] [PASSED] 0x468B (ALDERLAKE_S)
[17:10:00] [PASSED] 0x4690 (ALDERLAKE_S)
[17:10:00] [PASSED] 0x4692 (ALDERLAKE_S)
[17:10:00] [PASSED] 0x4693 (ALDERLAKE_S)
[17:10:00] [PASSED] 0x46A0 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46A1 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46A2 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46A3 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46A6 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46A8 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46AA (ALDERLAKE_P)
[17:10:00] [PASSED] 0x462A (ALDERLAKE_P)
[17:10:00] [PASSED] 0x4626 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x4628 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46B0 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46B1 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46B2 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46B3 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46C0 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46C1 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46C2 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46C3 (ALDERLAKE_P)
[17:10:00] [PASSED] 0x46D0 (ALDERLAKE_N)
[17:10:00] [PASSED] 0x46D1 (ALDERLAKE_N)
[17:10:00] [PASSED] 0x46D2 (ALDERLAKE_N)
[17:10:00] [PASSED] 0x46D3 (ALDERLAKE_N)
[17:10:00] [PASSED] 0x46D4 (ALDERLAKE_N)
[17:10:00] [PASSED] 0xA721 (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7A1 (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7A9 (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7AC (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7AD (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA720 (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7A0 (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7A8 (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7AA (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA7AB (ALDERLAKE_P)
[17:10:00] [PASSED] 0xA780 (ALDERLAKE_S)
[17:10:00] [PASSED] 0xA781 (ALDERLAKE_S)
[17:10:00] [PASSED] 0xA782 (ALDERLAKE_S)
[17:10:00] [PASSED] 0xA783 (ALDERLAKE_S)
[17:10:00] [PASSED] 0xA788 (ALDERLAKE_S)
[17:10:00] [PASSED] 0xA789 (ALDERLAKE_S)
[17:10:00] [PASSED] 0xA78A (ALDERLAKE_S)
[17:10:00] [PASSED] 0xA78B (ALDERLAKE_S)
[17:10:00] [PASSED] 0x4905 (DG1)
[17:10:00] [PASSED] 0x4906 (DG1)
[17:10:00] [PASSED] 0x4907 (DG1)
[17:10:00] [PASSED] 0x4908 (DG1)
[17:10:00] [PASSED] 0x4909 (DG1)
[17:10:00] [PASSED] 0x56C0 (DG2)
[17:10:00] [PASSED] 0x56C2 (DG2)
[17:10:00] [PASSED] 0x56C1 (DG2)
[17:10:00] [PASSED] 0x7D51 (METEORLAKE)
[17:10:00] [PASSED] 0x7DD1 (METEORLAKE)
[17:10:00] [PASSED] 0x7D41 (METEORLAKE)
[17:10:00] [PASSED] 0x7D67 (METEORLAKE)
[17:10:00] [PASSED] 0xB640 (METEORLAKE)
[17:10:00] [PASSED] 0x56A0 (DG2)
[17:10:00] [PASSED] 0x56A1 (DG2)
[17:10:00] [PASSED] 0x56A2 (DG2)
[17:10:00] [PASSED] 0x56BE (DG2)
[17:10:00] [PASSED] 0x56BF (DG2)
[17:10:00] [PASSED] 0x5690 (DG2)
[17:10:00] [PASSED] 0x5691 (DG2)
[17:10:00] [PASSED] 0x5692 (DG2)
[17:10:00] [PASSED] 0x56A5 (DG2)
[17:10:00] [PASSED] 0x56A6 (DG2)
[17:10:00] [PASSED] 0x56B0 (DG2)
[17:10:00] [PASSED] 0x56B1 (DG2)
[17:10:00] [PASSED] 0x56BA (DG2)
[17:10:00] [PASSED] 0x56BB (DG2)
[17:10:00] [PASSED] 0x56BC (DG2)
[17:10:00] [PASSED] 0x56BD (DG2)
[17:10:00] [PASSED] 0x5693 (DG2)
[17:10:00] [PASSED] 0x5694 (DG2)
[17:10:00] [PASSED] 0x5695 (DG2)
[17:10:00] [PASSED] 0x56A3 (DG2)
[17:10:00] [PASSED] 0x56A4 (DG2)
[17:10:00] [PASSED] 0x56B2 (DG2)
[17:10:00] [PASSED] 0x56B3 (DG2)
[17:10:00] [PASSED] 0x5696 (DG2)
[17:10:00] [PASSED] 0x5697 (DG2)
[17:10:00] [PASSED] 0xB69 (PVC)
[17:10:00] [PASSED] 0xB6E (PVC)
[17:10:00] [PASSED] 0xBD4 (PVC)
[17:10:00] [PASSED] 0xBD5 (PVC)
[17:10:00] [PASSED] 0xBD6 (PVC)
[17:10:00] [PASSED] 0xBD7 (PVC)
[17:10:00] [PASSED] 0xBD8 (PVC)
[17:10:00] [PASSED] 0xBD9 (PVC)
[17:10:00] [PASSED] 0xBDA (PVC)
[17:10:00] [PASSED] 0xBDB (PVC)
[17:10:00] [PASSED] 0xBE0 (PVC)
[17:10:00] [PASSED] 0xBE1 (PVC)
[17:10:00] [PASSED] 0xBE5 (PVC)
[17:10:00] [PASSED] 0x7D40 (METEORLAKE)
[17:10:00] [PASSED] 0x7D45 (METEORLAKE)
[17:10:00] [PASSED] 0x7D55 (METEORLAKE)
[17:10:00] [PASSED] 0x7D60 (METEORLAKE)
[17:10:00] [PASSED] 0x7DD5 (METEORLAKE)
[17:10:00] [PASSED] 0x6420 (LUNARLAKE)
[17:10:00] [PASSED] 0x64A0 (LUNARLAKE)
[17:10:00] [PASSED] 0x64B0 (LUNARLAKE)
[17:10:00] [PASSED] 0xE202 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE209 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE20B (BATTLEMAGE)
[17:10:00] [PASSED] 0xE20C (BATTLEMAGE)
[17:10:00] [PASSED] 0xE20D (BATTLEMAGE)
[17:10:00] [PASSED] 0xE210 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE211 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE212 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE216 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE220 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE221 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE222 (BATTLEMAGE)
[17:10:00] [PASSED] 0xE223 (BATTLEMAGE)
[17:10:00] [PASSED] 0xB080 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB081 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB082 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB083 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB084 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB085 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB086 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB087 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB08F (PANTHERLAKE)
[17:10:00] [PASSED] 0xB090 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB0A0 (PANTHERLAKE)
[17:10:00] [PASSED] 0xB0B0 (PANTHERLAKE)
[17:10:00] [PASSED] 0xFD80 (PANTHERLAKE)
[17:10:00] [PASSED] 0xFD81 (PANTHERLAKE)
[17:10:00] ============= [PASSED] check_platform_gt_count =============
[17:10:00] ===================== [PASSED] xe_pci ======================
[17:10:00] =================== xe_rtp (2 subtests) ====================
[17:10:00] =============== xe_rtp_process_to_sr_tests  ================
[17:10:00] [PASSED] coalesce-same-reg
[17:10:00] [PASSED] no-match-no-add
[17:10:00] [PASSED] match-or
[17:10:00] [PASSED] match-or-xfail
[17:10:00] [PASSED] no-match-no-add-multiple-rules
[17:10:00] [PASSED] two-regs-two-entries
[17:10:00] [PASSED] clr-one-set-other
[17:10:00] [PASSED] set-field
[17:10:00] [PASSED] conflict-duplicate
[17:10:00] [PASSED] conflict-not-disjoint
[17:10:00] [PASSED] conflict-reg-type
[17:10:00] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[17:10:00] ================== xe_rtp_process_tests  ===================
[17:10:00] [PASSED] active1
[17:10:00] [PASSED] active2
[17:10:00] [PASSED] active-inactive
[17:10:00] [PASSED] inactive-active
[17:10:00] [PASSED] inactive-1st_or_active-inactive
[17:10:00] [PASSED] inactive-2nd_or_active-inactive
[17:10:00] [PASSED] inactive-last_or_active-inactive
[17:10:00] [PASSED] inactive-no_or_active-inactive
[17:10:00] ============== [PASSED] xe_rtp_process_tests ===============
[17:10:00] ===================== [PASSED] xe_rtp ======================
[17:10:00] ==================== xe_wa (1 subtest) =====================
[17:10:00] ======================== xe_wa_gt  =========================
[17:10:00] [PASSED] TIGERLAKE (B0)
[17:10:00] [PASSED] DG1 (A0)
[17:10:00] [PASSED] DG1 (B0)
[17:10:00] [PASSED] ALDERLAKE_S (A0)
[17:10:00] [PASSED] ALDERLAKE_S (B0)
[17:10:00] [PASSED] ALDERLAKE_S (C0)
[17:10:00] [PASSED] ALDERLAKE_S (D0)
[17:10:00] [PASSED] ALDERLAKE_P (A0)
[17:10:00] [PASSED] ALDERLAKE_P (B0)
[17:10:00] [PASSED] ALDERLAKE_P (C0)
[17:10:00] [PASSED] ALDERLAKE_S_RPLS (D0)
[17:10:00] [PASSED] ALDERLAKE_P_RPLU (E0)
[17:10:00] [PASSED] DG2_G10 (C0)
[17:10:00] [PASSED] DG2_G11 (B1)
[17:10:00] [PASSED] DG2_G12 (A1)
[17:10:00] [PASSED] METEORLAKE (g:A0, m:A0)
[17:10:00] [PASSED] METEORLAKE (g:A0, m:A0)
[17:10:00] [PASSED] METEORLAKE (g:A0, m:A0)
[17:10:00] [PASSED] LUNARLAKE (g:A0, m:A0)
[17:10:00] [PASSED] LUNARLAKE (g:B0, m:A0)
stty: 'standard input': Inappropriate ioctl for device
[17:10:00] [PASSED] BATTLEMAGE (g:A0, m:A1)
[17:10:00] [PASSED] PANTHERLAKE (g:A0, m:A0)
[17:10:00] ==================== [PASSED] xe_wa_gt =====================
[17:10:00] ====================== [PASSED] xe_wa ======================
[17:10:00] ============================================================
[17:10:00] Testing complete. Ran 298 tests: passed: 282, skipped: 16
[17:10:00] Elapsed time: 33.299s total, 4.277s configuring, 28.656s building, 0.330s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[17:10:00] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:10:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:10:25] Starting KUnit Kernel (1/1)...
[17:10:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:10:25] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[17:10:25] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[17:10:25] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[17:10:25] =========== drm_validate_clone_mode (2 subtests) ===========
[17:10:25] ============== drm_test_check_in_clone_mode  ===============
[17:10:25] [PASSED] in_clone_mode
[17:10:25] [PASSED] not_in_clone_mode
[17:10:25] ========== [PASSED] drm_test_check_in_clone_mode ===========
[17:10:25] =============== drm_test_check_valid_clones  ===============
[17:10:25] [PASSED] not_in_clone_mode
[17:10:25] [PASSED] valid_clone
[17:10:25] [PASSED] invalid_clone
[17:10:25] =========== [PASSED] drm_test_check_valid_clones ===========
[17:10:25] ============= [PASSED] drm_validate_clone_mode =============
[17:10:25] ============= drm_validate_modeset (1 subtest) =============
[17:10:25] [PASSED] drm_test_check_connector_changed_modeset
[17:10:25] ============== [PASSED] drm_validate_modeset ===============
[17:10:25] ====== drm_test_bridge_get_current_state (2 subtests) ======
[17:10:25] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[17:10:25] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[17:10:25] ======== [PASSED] drm_test_bridge_get_current_state ========
[17:10:25] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[17:10:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[17:10:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[17:10:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[17:10:25] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[17:10:25] ============== drm_bridge_alloc (2 subtests) ===============
[17:10:25] [PASSED] drm_test_drm_bridge_alloc_basic
[17:10:25] [PASSED] drm_test_drm_bridge_alloc_get_put
[17:10:25] ================ [PASSED] drm_bridge_alloc =================
[17:10:25] ================== drm_buddy (7 subtests) ==================
[17:10:25] [PASSED] drm_test_buddy_alloc_limit
[17:10:25] [PASSED] drm_test_buddy_alloc_optimistic
[17:10:25] [PASSED] drm_test_buddy_alloc_pessimistic
[17:10:25] [PASSED] drm_test_buddy_alloc_pathological
[17:10:25] [PASSED] drm_test_buddy_alloc_contiguous
[17:10:25] [ERROR] Test: drm_buddy: missing expected subtest!
[17:10:25] 
[17:10:25] Pid: 55, comm: kunit_try_catch Tainted: G        W        N  6.17.0-rc2-gf439559ab901
[17:10:25] RIP: 0033:rb_erase+0x1a8/0x3b0
[17:10:25] RSP: 00000000bf883d98  EFLAGS: 00010246
[17:10:25] RAX: 000000007ff39c59 RBX: 0000000000000000 RCX: 000000007ff39c58
[17:10:25] RDX: 0000000000000000 RSI: 000000007ff39c58 RDI: 000000007ff39c08
[17:10:25] RBP: 00000000bf883ea0 R08: 000000007feeaf88 R09: 000000007ff39501
[17:10:25] R10: 000000007ff39901 R11: 0000000000000fff R12: 000000007ff39a50
[17:10:25] R13: 0000000060674278 R14: 000000007ff39c30 R15: 000000007ff39be0
[17:10:25] Kernel panic - not syncing: Segfault with no mm
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: drm_buddy: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: drm_buddy: missing subtest result line!
[17:10:25] # drm_buddy: Testing DRM buddy manager, with random_seed=0x205330ae
[17:10:25] # module: drm_buddy_test
[17:10:25] =================== [CRASHED] drm_buddy ====================
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] [ERROR] Test: main: missing expected subtest!
[17:10:25] [CRASHED] 
[17:10:25] ============================================================
[17:10:25] Testing complete. Ran 49 tests: passed: 19, crashed: 30, errors: 31
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[17:10:25] Elapsed time: 24.899s total, 1.665s configuring, 22.966s building, 0.268s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


