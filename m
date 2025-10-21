Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01BFCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 16:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157110E625;
	Tue, 21 Oct 2025 16:55:08 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D2510E625;
 Tue, 21 Oct 2025 16:55:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm=3A_replace_drm=5Fprint=2Eh?=
 =?utf-8?q?_includes_from_headers_with_a_forward_declaration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 16:55:06 -0000
Message-ID: <176106570685.37279.4516881813870260349@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1761063757.git.jani.nikula@intel.com>
In-Reply-To: <cover.1761063757.git.jani.nikula@intel.com>
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

Series: drm: replace drm_print.h includes from headers with a forward declaration
URL   : https://patchwork.freedesktop.org/series/156268/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[16:53:42] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:53:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[16:54:23] Starting KUnit Kernel (1/1)...
[16:54:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:54:23] ================== guc_buf (11 subtests) ===================
[16:54:23] [PASSED] test_smallest
[16:54:23] [PASSED] test_largest
[16:54:23] [PASSED] test_granular
[16:54:23] [PASSED] test_unique
[16:54:23] [PASSED] test_overlap
[16:54:23] [PASSED] test_reusable
[16:54:23] [PASSED] test_too_big
[16:54:23] [PASSED] test_flush
[16:54:23] [PASSED] test_lookup
[16:54:23] [PASSED] test_data
[16:54:23] [PASSED] test_class
[16:54:23] ===================== [PASSED] guc_buf =====================
[16:54:23] =================== guc_dbm (7 subtests) ===================
[16:54:23] [PASSED] test_empty
[16:54:23] [PASSED] test_default
[16:54:23] ======================== test_size  ========================
[16:54:23] [PASSED] 4
[16:54:23] [PASSED] 8
[16:54:23] [PASSED] 32
[16:54:23] [PASSED] 256
[16:54:23] ==================== [PASSED] test_size ====================
[16:54:23] ======================= test_reuse  ========================
[16:54:23] [PASSED] 4
[16:54:23] [PASSED] 8
[16:54:23] [PASSED] 32
[16:54:23] [PASSED] 256
[16:54:23] =================== [PASSED] test_reuse ====================
[16:54:23] =================== test_range_overlap  ====================
[16:54:23] [PASSED] 4
[16:54:23] [PASSED] 8
[16:54:23] [PASSED] 32
[16:54:23] [PASSED] 256
[16:54:23] =============== [PASSED] test_range_overlap ================
[16:54:23] =================== test_range_compact  ====================
[16:54:23] [PASSED] 4
[16:54:23] [PASSED] 8
[16:54:23] [PASSED] 32
[16:54:23] [PASSED] 256
[16:54:23] =============== [PASSED] test_range_compact ================
[16:54:23] ==================== test_range_spare  =====================
[16:54:23] [PASSED] 4
[16:54:23] [PASSED] 8
[16:54:23] [PASSED] 32
[16:54:23] [PASSED] 256
[16:54:23] ================ [PASSED] test_range_spare =================
[16:54:23] ===================== [PASSED] guc_dbm =====================
[16:54:23] =================== guc_idm (6 subtests) ===================
[16:54:23] [PASSED] bad_init
[16:54:23] [PASSED] no_init
[16:54:23] [PASSED] init_fini
[16:54:23] [PASSED] check_used
[16:54:23] [PASSED] check_quota
[16:54:23] [PASSED] check_all
[16:54:23] ===================== [PASSED] guc_idm =====================
[16:54:23] ================== no_relay (3 subtests) ===================
[16:54:23] [PASSED] xe_drops_guc2pf_if_not_ready
[16:54:23] [PASSED] xe_drops_guc2vf_if_not_ready
[16:54:23] [PASSED] xe_rejects_send_if_not_ready
[16:54:23] ==================== [PASSED] no_relay =====================
[16:54:23] ================== pf_relay (14 subtests) ==================
[16:54:23] [PASSED] pf_rejects_guc2pf_too_short
[16:54:23] [PASSED] pf_rejects_guc2pf_too_long
[16:54:23] [PASSED] pf_rejects_guc2pf_no_payload
[16:54:23] [PASSED] pf_fails_no_payload
[16:54:23] [PASSED] pf_fails_bad_origin
[16:54:23] [PASSED] pf_fails_bad_type
[16:54:23] [PASSED] pf_txn_reports_error
[16:54:23] [PASSED] pf_txn_sends_pf2guc
[16:54:23] [PASSED] pf_sends_pf2guc
[16:54:23] [SKIPPED] pf_loopback_nop
[16:54:23] [SKIPPED] pf_loopback_echo
[16:54:23] [SKIPPED] pf_loopback_fail
[16:54:23] [SKIPPED] pf_loopback_busy
[16:54:23] [SKIPPED] pf_loopback_retry
[16:54:23] ==================== [PASSED] pf_relay =====================
[16:54:23] ================== vf_relay (3 subtests) ===================
[16:54:23] [PASSED] vf_rejects_guc2vf_too_short
[16:54:23] [PASSED] vf_rejects_guc2vf_too_long
[16:54:23] [PASSED] vf_rejects_guc2vf_no_payload
[16:54:23] ==================== [PASSED] vf_relay =====================
[16:54:23] ===================== lmtt (1 subtest) =====================
[16:54:23] ======================== test_ops  =========================
[16:54:23] [PASSED] 2-level
[16:54:23] [PASSED] multi-level
[16:54:23] ==================== [PASSED] test_ops =====================
[16:54:23] ====================== [PASSED] lmtt =======================
[16:54:23] ================= pf_service (11 subtests) =================
[16:54:23] [PASSED] pf_negotiate_any
[16:54:23] [PASSED] pf_negotiate_base_match
[16:54:23] [PASSED] pf_negotiate_base_newer
[16:54:23] [PASSED] pf_negotiate_base_next
[16:54:23] [SKIPPED] pf_negotiate_base_older
[16:54:23] [PASSED] pf_negotiate_base_prev
[16:54:23] [PASSED] pf_negotiate_latest_match
[16:54:23] [PASSED] pf_negotiate_latest_newer
[16:54:23] [PASSED] pf_negotiate_latest_next
[16:54:23] [SKIPPED] pf_negotiate_latest_older
[16:54:23] [SKIPPED] pf_negotiate_latest_prev
[16:54:23] =================== [PASSED] pf_service ====================
[16:54:23] ================= xe_guc_g2g (2 subtests) ==================
[16:54:23] ============== xe_live_guc_g2g_kunit_default  ==============
[16:54:23] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[16:54:23] ============== xe_live_guc_g2g_kunit_allmem  ===============
[16:54:23] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[16:54:23] =================== [SKIPPED] xe_guc_g2g ===================
[16:54:23] =================== xe_mocs (2 subtests) ===================
[16:54:23] ================ xe_live_mocs_kernel_kunit  ================
[16:54:23] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[16:54:23] ================ xe_live_mocs_reset_kunit  =================
[16:54:23] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[16:54:23] ==================== [SKIPPED] xe_mocs =====================
[16:54:23] ================= xe_migrate (2 subtests) ==================
[16:54:23] ================= xe_migrate_sanity_kunit  =================
[16:54:23] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[16:54:23] ================== xe_validate_ccs_kunit  ==================
[16:54:23] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[16:54:23] =================== [SKIPPED] xe_migrate ===================
[16:54:23] ================== xe_dma_buf (1 subtest) ==================
[16:54:23] ==================== xe_dma_buf_kunit  =====================
[16:54:23] ================ [SKIPPED] xe_dma_buf_kunit ================
[16:54:23] =================== [SKIPPED] xe_dma_buf ===================
[16:54:23] ================= xe_bo_shrink (1 subtest) =================
[16:54:23] =================== xe_bo_shrink_kunit  ====================
[16:54:23] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[16:54:23] ================== [SKIPPED] xe_bo_shrink ==================
[16:54:23] ==================== xe_bo (2 subtests) ====================
[16:54:23] ================== xe_ccs_migrate_kunit  ===================
[16:54:23] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[16:54:23] ==================== xe_bo_evict_kunit  ====================
[16:54:23] =============== [SKIPPED] xe_bo_evict_kunit ================
[16:54:23] ===================== [SKIPPED] xe_bo ======================
[16:54:23] ==================== args (11 subtests) ====================
[16:54:23] [PASSED] count_args_test
[16:54:23] [PASSED] call_args_example
[16:54:23] [PASSED] call_args_test
[16:54:23] [PASSED] drop_first_arg_example
[16:54:23] [PASSED] drop_first_arg_test
[16:54:23] [PASSED] first_arg_example
[16:54:23] [PASSED] first_arg_test
[16:54:23] [PASSED] last_arg_example
[16:54:23] [PASSED] last_arg_test
[16:54:23] [PASSED] pick_arg_example
[16:54:23] [PASSED] sep_comma_example
[16:54:23] ====================== [PASSED] args =======================
[16:54:23] =================== xe_pci (3 subtests) ====================
[16:54:23] ==================== check_graphics_ip  ====================
[16:54:23] [PASSED] 12.00 Xe_LP
[16:54:23] [PASSED] 12.10 Xe_LP+
[16:54:23] [PASSED] 12.55 Xe_HPG
[16:54:23] [PASSED] 12.60 Xe_HPC
[16:54:23] [PASSED] 12.70 Xe_LPG
[16:54:23] [PASSED] 12.71 Xe_LPG
[16:54:23] [PASSED] 12.74 Xe_LPG+
[16:54:23] [PASSED] 20.01 Xe2_HPG
[16:54:23] [PASSED] 20.02 Xe2_HPG
[16:54:23] [PASSED] 20.04 Xe2_LPG
[16:54:23] [PASSED] 30.00 Xe3_LPG
[16:54:23] [PASSED] 30.01 Xe3_LPG
[16:54:23] [PASSED] 30.03 Xe3_LPG
[16:54:23] [PASSED] 30.04 Xe3_LPG
[16:54:23] [PASSED] 30.05 Xe3_LPG
[16:54:23] [PASSED] 35.11 Xe3p_XPC
[16:54:23] ================ [PASSED] check_graphics_ip ================
[16:54:23] ===================== check_media_ip  ======================
[16:54:23] [PASSED] 12.00 Xe_M
[16:54:23] [PASSED] 12.55 Xe_HPM
[16:54:23] [PASSED] 13.00 Xe_LPM+
[16:54:23] [PASSED] 13.01 Xe2_HPM
[16:54:23] [PASSED] 20.00 Xe2_LPM
[16:54:23] [PASSED] 30.00 Xe3_LPM
[16:54:23] [PASSED] 30.02 Xe3_LPM
[16:54:23] [PASSED] 35.00 Xe3p_LPM
[16:54:23] [PASSED] 35.03 Xe3p_HPM
[16:54:23] ================= [PASSED] check_media_ip ==================
[16:54:23] ================= check_platform_gt_count  =================
[16:54:23] [PASSED] 0x9A60 (TIGERLAKE)
[16:54:23] [PASSED] 0x9A68 (TIGERLAKE)
[16:54:23] [PASSED] 0x9A70 (TIGERLAKE)
[16:54:23] [PASSED] 0x9A40 (TIGERLAKE)
[16:54:23] [PASSED] 0x9A49 (TIGERLAKE)
[16:54:23] [PASSED] 0x9A59 (TIGERLAKE)
[16:54:23] [PASSED] 0x9A78 (TIGERLAKE)
[16:54:23] [PASSED] 0x9AC0 (TIGERLAKE)
[16:54:23] [PASSED] 0x9AC9 (TIGERLAKE)
[16:54:23] [PASSED] 0x9AD9 (TIGERLAKE)
[16:54:23] [PASSED] 0x9AF8 (TIGERLAKE)
[16:54:23] [PASSED] 0x4C80 (ROCKETLAKE)
[16:54:23] [PASSED] 0x4C8A (ROCKETLAKE)
[16:54:23] [PASSED] 0x4C8B (ROCKETLAKE)
[16:54:23] [PASSED] 0x4C8C (ROCKETLAKE)
[16:54:23] [PASSED] 0x4C90 (ROCKETLAKE)
[16:54:23] [PASSED] 0x4C9A (ROCKETLAKE)
[16:54:23] [PASSED] 0x4680 (ALDERLAKE_S)
[16:54:23] [PASSED] 0x4682 (ALDERLAKE_S)
[16:54:23] [PASSED] 0x4688 (ALDERLAKE_S)
[16:54:23] [PASSED] 0x468A (ALDERLAKE_S)
[16:54:23] [PASSED] 0x468B (ALDERLAKE_S)
[16:54:23] [PASSED] 0x4690 (ALDERLAKE_S)
[16:54:23] [PASSED] 0x4692 (ALDERLAKE_S)
[16:54:23] [PASSED] 0x4693 (ALDERLAKE_S)
[16:54:23] [PASSED] 0x46A0 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46A1 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46A2 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46A3 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46A6 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46A8 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46AA (ALDERLAKE_P)
[16:54:23] [PASSED] 0x462A (ALDERLAKE_P)
[16:54:23] [PASSED] 0x4626 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x4628 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46B0 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46B1 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46B2 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46B3 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46C0 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46C1 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46C2 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46C3 (ALDERLAKE_P)
[16:54:23] [PASSED] 0x46D0 (ALDERLAKE_N)
[16:54:23] [PASSED] 0x46D1 (ALDERLAKE_N)
[16:54:23] [PASSED] 0x46D2 (ALDERLAKE_N)
[16:54:23] [PASSED] 0x46D3 (ALDERLAKE_N)
[16:54:23] [PASSED] 0x46D4 (ALDERLAKE_N)
[16:54:23] [PASSED] 0xA721 (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7A1 (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7A9 (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7AC (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7AD (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA720 (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7A0 (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7A8 (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7AA (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA7AB (ALDERLAKE_P)
[16:54:23] [PASSED] 0xA780 (ALDERLAKE_S)
[16:54:23] [PASSED] 0xA781 (ALDERLAKE_S)
[16:54:23] [PASSED] 0xA782 (ALDERLAKE_S)
[16:54:23] [PASSED] 0xA783 (ALDERLAKE_S)
[16:54:23] [PASSED] 0xA788 (ALDERLAKE_S)
[16:54:23] [PASSED] 0xA789 (ALDERLAKE_S)
[16:54:23] [PASSED] 0xA78A (ALDERLAKE_S)
[16:54:23] [PASSED] 0xA78B (ALDERLAKE_S)
[16:54:23] [PASSED] 0x4905 (DG1)
[16:54:23] [PASSED] 0x4906 (DG1)
[16:54:23] [PASSED] 0x4907 (DG1)
[16:54:23] [PASSED] 0x4908 (DG1)
[16:54:23] [PASSED] 0x4909 (DG1)
[16:54:23] [PASSED] 0x56C0 (DG2)
[16:54:23] [PASSED] 0x56C2 (DG2)
[16:54:23] [PASSED] 0x56C1 (DG2)
[16:54:23] [PASSED] 0x7D51 (METEORLAKE)
[16:54:23] [PASSED] 0x7DD1 (METEORLAKE)
[16:54:23] [PASSED] 0x7D41 (METEORLAKE)
[16:54:23] [PASSED] 0x7D67 (METEORLAKE)
[16:54:23] [PASSED] 0xB640 (METEORLAKE)
[16:54:23] [PASSED] 0x56A0 (DG2)
[16:54:23] [PASSED] 0x56A1 (DG2)
[16:54:23] [PASSED] 0x56A2 (DG2)
[16:54:23] [PASSED] 0x56BE (DG2)
[16:54:23] [PASSED] 0x56BF (DG2)
[16:54:23] [PASSED] 0x5690 (DG2)
[16:54:23] [PASSED] 0x5691 (DG2)
[16:54:23] [PASSED] 0x5692 (DG2)
[16:54:23] [PASSED] 0x56A5 (DG2)
[16:54:23] [PASSED] 0x56A6 (DG2)
[16:54:23] [PASSED] 0x56B0 (DG2)
[16:54:23] [PASSED] 0x56B1 (DG2)
[16:54:23] [PASSED] 0x56BA (DG2)
[16:54:23] [PASSED] 0x56BB (DG2)
[16:54:23] [PASSED] 0x56BC (DG2)
[16:54:23] [PASSED] 0x56BD (DG2)
[16:54:23] [PASSED] 0x5693 (DG2)
[16:54:23] [PASSED] 0x5694 (DG2)
[16:54:23] [PASSED] 0x5695 (DG2)
[16:54:23] [PASSED] 0x56A3 (DG2)
[16:54:23] [PASSED] 0x56A4 (DG2)
[16:54:23] [PASSED] 0x56B2 (DG2)
[16:54:23] [PASSED] 0x56B3 (DG2)
[16:54:23] [PASSED] 0x5696 (DG2)
[16:54:23] [PASSED] 0x5697 (DG2)
[16:54:23] [PASSED] 0xB69 (PVC)
[16:54:23] [PASSED] 0xB6E (PVC)
[16:54:23] [PASSED] 0xBD4 (PVC)
[16:54:23] [PASSED] 0xBD5 (PVC)
[16:54:23] [PASSED] 0xBD6 (PVC)
[16:54:23] [PASSED] 0xBD7 (PVC)
[16:54:23] [PASSED] 0xBD8 (PVC)
[16:54:23] [PASSED] 0xBD9 (PVC)
[16:54:23] [PASSED] 0xBDA (PVC)
[16:54:23] [PASSED] 0xBDB (PVC)
[16:54:23] [PASSED] 0xBE0 (PVC)
[16:54:23] [PASSED] 0xBE1 (PVC)
[16:54:23] [PASSED] 0xBE5 (PVC)
[16:54:23] [PASSED] 0x7D40 (METEORLAKE)
[16:54:23] [PASSED] 0x7D45 (METEORLAKE)
[16:54:23] [PASSED] 0x7D55 (METEORLAKE)
[16:54:23] [PASSED] 0x7D60 (METEORLAKE)
[16:54:23] [PASSED] 0x7DD5 (METEORLAKE)
[16:54:23] [PASSED] 0x6420 (LUNARLAKE)
[16:54:23] [PASSED] 0x64A0 (LUNARLAKE)
[16:54:23] [PASSED] 0x64B0 (LUNARLAKE)
[16:54:23] [PASSED] 0xE202 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE209 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE20B (BATTLEMAGE)
[16:54:23] [PASSED] 0xE20C (BATTLEMAGE)
[16:54:23] [PASSED] 0xE20D (BATTLEMAGE)
[16:54:23] [PASSED] 0xE210 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE211 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE212 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE216 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE220 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE221 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE222 (BATTLEMAGE)
[16:54:23] [PASSED] 0xE223 (BATTLEMAGE)
[16:54:23] [PASSED] 0xB080 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB081 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB082 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB083 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB084 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB085 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB086 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB087 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB08F (PANTHERLAKE)
[16:54:23] [PASSED] 0xB090 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB0A0 (PANTHERLAKE)
[16:54:23] [PASSED] 0xB0B0 (PANTHERLAKE)
[16:54:23] [PASSED] 0xFD80 (PANTHERLAKE)
[16:54:23] [PASSED] 0xFD81 (PANTHERLAKE)
[16:54:23] [PASSED] 0xD740 (NOVALAKE_S)
[16:54:23] [PASSED] 0xD741 (NOVALAKE_S)
[16:54:23] [PASSED] 0xD742 (NOVALAKE_S)
[16:54:23] [PASSED] 0xD743 (NOVALAKE_S)
[16:54:23] [PASSED] 0xD744 (NOVALAKE_S)
[16:54:23] [PASSED] 0xD745 (NOVALAKE_S)
[16:54:23] ============= [PASSED] check_platform_gt_count =============
[16:54:23] ===================== [PASSED] xe_pci ======================
[16:54:23] =================== xe_rtp (2 subtests) ====================
[16:54:23] =============== xe_rtp_process_to_sr_tests  ================
[16:54:23] [PASSED] coalesce-same-reg
[16:54:23] [PASSED] no-match-no-add
[16:54:23] [PASSED] match-or
[16:54:23] [PASSED] match-or-xfail
[16:54:23] [PASSED] no-match-no-add-multiple-rules
[16:54:23] [PASSED] two-regs-two-entries
[16:54:23] [PASSED] clr-one-set-other
[16:54:23] [PASSED] set-field
[16:54:23] [PASSED] conflict-duplicate
[16:54:23] [PASSED] conflict-not-disjoint
[16:54:23] [PASSED] conflict-reg-type
[16:54:23] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[16:54:23] ================== xe_rtp_process_tests  ===================
[16:54:23] [PASSED] active1
[16:54:23] [PASSED] active2
[16:54:23] [PASSED] active-inactive
[16:54:23] [PASSED] inactive-active
[16:54:23] [PASSED] inactive-1st_or_active-inactive
[16:54:23] [PASSED] inactive-2nd_or_active-inactive
[16:54:23] [PASSED] inactive-last_or_active-inactive
[16:54:23] [PASSED] inactive-no_or_active-inactive
stty: 'standard input': Inappropriate ioctl for device
[16:54:23] ============== [PASSED] xe_rtp_process_tests ===============
[16:54:23] ===================== [PASSED] xe_rtp ======================
[16:54:23] ==================== xe_wa (1 subtest) =====================
[16:54:23] ======================== xe_wa_gt  =========================
[16:54:23] [PASSED] TIGERLAKE B0
[16:54:23] [PASSED] DG1 A0
[16:54:23] [PASSED] DG1 B0
[16:54:23] [PASSED] ALDERLAKE_S A0
[16:54:23] [PASSED] ALDERLAKE_S B0
[16:54:23] [PASSED] ALDERLAKE_S C0
[16:54:23] [PASSED] ALDERLAKE_S D0
[16:54:23] [PASSED] ALDERLAKE_P A0
[16:54:23] [PASSED] ALDERLAKE_P B0
[16:54:23] [PASSED] ALDERLAKE_P C0
[16:54:23] [PASSED] ALDERLAKE_S RPLS D0
[16:54:23] [PASSED] ALDERLAKE_P RPLU E0
[16:54:23] [PASSED] DG2 G10 C0
[16:54:23] [PASSED] DG2 G11 B1
[16:54:23] [PASSED] DG2 G12 A1
[16:54:23] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[16:54:23] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[16:54:23] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[16:54:23] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[16:54:23] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[16:54:23] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[16:54:23] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[16:54:23] ==================== [PASSED] xe_wa_gt =====================
[16:54:23] ====================== [PASSED] xe_wa ======================
[16:54:23] ============================================================
[16:54:23] Testing complete. Ran 317 tests: passed: 299, skipped: 18
[16:54:23] Elapsed time: 41.419s total, 4.235s configuring, 36.816s building, 0.316s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:54:23] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:54:25] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[16:54:54] Starting KUnit Kernel (1/1)...
[16:54:54] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:54:54] ============ drm_test_pick_cmdline (2 subtests) ============
[16:54:54] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[16:54:54] =============== drm_test_pick_cmdline_named  ===============
[16:54:54] [PASSED] NTSC
[16:54:54] [PASSED] NTSC-J
[16:54:54] [PASSED] PAL
[16:54:54] [PASSED] PAL-M
[16:54:54] =========== [PASSED] drm_test_pick_cmdline_named ===========
[16:54:54] ============== [PASSED] drm_test_pick_cmdline ==============
[16:54:54] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[16:54:54] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[16:54:54] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[16:54:54] =========== drm_validate_clone_mode (2 subtests) ===========
[16:54:54] ============== drm_test_check_in_clone_mode  ===============
[16:54:54] [PASSED] in_clone_mode
[16:54:54] [PASSED] not_in_clone_mode
[16:54:54] ========== [PASSED] drm_test_check_in_clone_mode ===========
[16:54:54] =============== drm_test_check_valid_clones  ===============
[16:54:54] [PASSED] not_in_clone_mode
[16:54:54] [PASSED] valid_clone
[16:54:54] [PASSED] invalid_clone
[16:54:54] =========== [PASSED] drm_test_check_valid_clones ===========
[16:54:54] ============= [PASSED] drm_validate_clone_mode =============
[16:54:54] ============= drm_validate_modeset (1 subtest) =============
[16:54:54] [PASSED] drm_test_check_connector_changed_modeset
[16:54:54] ============== [PASSED] drm_validate_modeset ===============
[16:54:54] ====== drm_test_bridge_get_current_state (2 subtests) ======
[16:54:54] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[16:54:54] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[16:54:54] ======== [PASSED] drm_test_bridge_get_current_state ========
[16:54:54] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[16:54:54] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[16:54:54] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[16:54:54] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[16:54:54] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[16:54:54] ============== drm_bridge_alloc (2 subtests) ===============
[16:54:54] [PASSED] drm_test_drm_bridge_alloc_basic
[16:54:54] [PASSED] drm_test_drm_bridge_alloc_get_put
[16:54:54] ================ [PASSED] drm_bridge_alloc =================
[16:54:54] ================== drm_buddy (8 subtests) ==================
[16:54:54] [PASSED] drm_test_buddy_alloc_limit
[16:54:54] [PASSED] drm_test_buddy_alloc_optimistic
[16:54:54] [PASSED] drm_test_buddy_alloc_pessimistic
[16:54:54] [PASSED] drm_test_buddy_alloc_pathological
[16:54:54] [PASSED] drm_test_buddy_alloc_contiguous
[16:54:54] [PASSED] drm_test_buddy_alloc_clear
[16:54:55] [PASSED] drm_test_buddy_alloc_range_bias
[16:54:55] [PASSED] drm_test_buddy_fragmentation_performance
[16:54:55] ==================== [PASSED] drm_buddy ====================
[16:54:55] ============= drm_cmdline_parser (40 subtests) =============
[16:54:55] [PASSED] drm_test_cmdline_force_d_only
[16:54:55] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:54:55] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:54:55] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:54:55] [PASSED] drm_test_cmdline_force_e_only
[16:54:55] [PASSED] drm_test_cmdline_res
[16:54:55] [PASSED] drm_test_cmdline_res_vesa
[16:54:55] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:54:55] [PASSED] drm_test_cmdline_res_rblank
[16:54:55] [PASSED] drm_test_cmdline_res_bpp
[16:54:55] [PASSED] drm_test_cmdline_res_refresh
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:54:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:54:55] [PASSED] drm_test_cmdline_res_margins_force_on
[16:54:55] [PASSED] drm_test_cmdline_res_vesa_margins
[16:54:55] [PASSED] drm_test_cmdline_name
[16:54:55] [PASSED] drm_test_cmdline_name_bpp
[16:54:55] [PASSED] drm_test_cmdline_name_option
[16:54:55] [PASSED] drm_test_cmdline_name_bpp_option
[16:54:55] [PASSED] drm_test_cmdline_rotate_0
[16:54:55] [PASSED] drm_test_cmdline_rotate_90
[16:54:55] [PASSED] drm_test_cmdline_rotate_180
[16:54:55] [PASSED] drm_test_cmdline_rotate_270
[16:54:55] [PASSED] drm_test_cmdline_hmirror
[16:54:55] [PASSED] drm_test_cmdline_vmirror
[16:54:55] [PASSED] drm_test_cmdline_margin_options
[16:54:55] [PASSED] drm_test_cmdline_multiple_options
[16:54:55] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:54:55] [PASSED] drm_test_cmdline_extra_and_option
[16:54:55] [PASSED] drm_test_cmdline_freestanding_options
[16:54:55] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:54:55] [PASSED] drm_test_cmdline_panel_orientation
[16:54:55] ================ drm_test_cmdline_invalid  =================
[16:54:55] [PASSED] margin_only
[16:54:55] [PASSED] interlace_only
[16:54:55] [PASSED] res_missing_x
[16:54:55] [PASSED] res_missing_y
[16:54:55] [PASSED] res_bad_y
[16:54:55] [PASSED] res_missing_y_bpp
[16:54:55] [PASSED] res_bad_bpp
[16:54:55] [PASSED] res_bad_refresh
[16:54:55] [PASSED] res_bpp_refresh_force_on_off
[16:54:55] [PASSED] res_invalid_mode
[16:54:55] [PASSED] res_bpp_wrong_place_mode
[16:54:55] [PASSED] name_bpp_refresh
[16:54:55] [PASSED] name_refresh
[16:54:55] [PASSED] name_refresh_wrong_mode
[16:54:55] [PASSED] name_refresh_invalid_mode
[16:54:55] [PASSED] rotate_multiple
[16:54:55] [PASSED] rotate_invalid_val
[16:54:55] [PASSED] rotate_truncated
[16:54:55] [PASSED] invalid_option
[16:54:55] [PASSED] invalid_tv_option
[16:54:55] [PASSED] truncated_tv_option
[16:54:55] ============ [PASSED] drm_test_cmdline_invalid =============
[16:54:55] =============== drm_test_cmdline_tv_options  ===============
[16:54:55] [PASSED] NTSC
[16:54:55] [PASSED] NTSC_443
[16:54:55] [PASSED] NTSC_J
[16:54:55] [PASSED] PAL
[16:54:55] [PASSED] PAL_M
[16:54:55] [PASSED] PAL_N
[16:54:55] [PASSED] SECAM
[16:54:55] [PASSED] MONO_525
[16:54:55] [PASSED] MONO_625
[16:54:55] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:54:55] =============== [PASSED] drm_cmdline_parser ================
[16:54:55] ========== drmm_connector_hdmi_init (20 subtests) ==========
[16:54:55] [PASSED] drm_test_connector_hdmi_init_valid
[16:54:55] [PASSED] drm_test_connector_hdmi_init_bpc_8
[16:54:55] [PASSED] drm_test_connector_hdmi_init_bpc_10
[16:54:55] [PASSED] drm_test_connector_hdmi_init_bpc_12
[16:54:55] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[16:54:55] [PASSED] drm_test_connector_hdmi_init_bpc_null
[16:54:55] [PASSED] drm_test_connector_hdmi_init_formats_empty
[16:54:55] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[16:54:55] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[16:54:55] [PASSED] supported_formats=0x9 yuv420_allowed=1
[16:54:55] [PASSED] supported_formats=0x9 yuv420_allowed=0
[16:54:55] [PASSED] supported_formats=0x3 yuv420_allowed=1
[16:54:55] [PASSED] supported_formats=0x3 yuv420_allowed=0
[16:54:55] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[16:54:55] [PASSED] drm_test_connector_hdmi_init_null_ddc
[16:54:55] [PASSED] drm_test_connector_hdmi_init_null_product
[16:54:55] [PASSED] drm_test_connector_hdmi_init_null_vendor
[16:54:55] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[16:54:55] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[16:54:55] [PASSED] drm_test_connector_hdmi_init_product_valid
[16:54:55] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[16:54:55] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[16:54:55] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[16:54:55] ========= drm_test_connector_hdmi_init_type_valid  =========
[16:54:55] [PASSED] HDMI-A
[16:54:55] [PASSED] HDMI-B
[16:54:55] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[16:54:55] ======== drm_test_connector_hdmi_init_type_invalid  ========
[16:54:55] [PASSED] Unknown
[16:54:55] [PASSED] VGA
[16:54:55] [PASSED] DVI-I
[16:54:55] [PASSED] DVI-D
[16:54:55] [PASSED] DVI-A
[16:54:55] [PASSED] Composite
[16:54:55] [PASSED] SVIDEO
[16:54:55] [PASSED] LVDS
[16:54:55] [PASSED] Component
[16:54:55] [PASSED] DIN
[16:54:55] [PASSED] DP
[16:54:55] [PASSED] TV
[16:54:55] [PASSED] eDP
[16:54:55] [PASSED] Virtual
[16:54:55] [PASSED] DSI
[16:54:55] [PASSED] DPI
[16:54:55] [PASSED] Writeback
[16:54:55] [PASSED] SPI
[16:54:55] [PASSED] USB
[16:54:55] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[16:54:55] ============ [PASSED] drmm_connector_hdmi_init =============
[16:54:55] ============= drmm_connector_init (3 subtests) =============
[16:54:55] [PASSED] drm_test_drmm_connector_init
[16:54:55] [PASSED] drm_test_drmm_connector_init_null_ddc
[16:54:55] ========= drm_test_drmm_connector_init_type_valid  =========
[16:54:55] [PASSED] Unknown
[16:54:55] [PASSED] VGA
[16:54:55] [PASSED] DVI-I
[16:54:55] [PASSED] DVI-D
[16:54:55] [PASSED] DVI-A
[16:54:55] [PASSED] Composite
[16:54:55] [PASSED] SVIDEO
[16:54:55] [PASSED] LVDS
[16:54:55] [PASSED] Component
[16:54:55] [PASSED] DIN
[16:54:55] [PASSED] DP
[16:54:55] [PASSED] HDMI-A
[16:54:55] [PASSED] HDMI-B
[16:54:55] [PASSED] TV
[16:54:55] [PASSED] eDP
[16:54:55] [PASSED] Virtual
[16:54:55] [PASSED] DSI
[16:54:55] [PASSED] DPI
[16:54:55] [PASSED] Writeback
[16:54:55] [PASSED] SPI
[16:54:55] [PASSED] USB
[16:54:55] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[16:54:55] =============== [PASSED] drmm_connector_init ===============
[16:54:55] ========= drm_connector_dynamic_init (6 subtests) ==========
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_init
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_init_properties
[16:54:55] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[16:54:55] [PASSED] Unknown
[16:54:55] [PASSED] VGA
[16:54:55] [PASSED] DVI-I
[16:54:55] [PASSED] DVI-D
[16:54:55] [PASSED] DVI-A
[16:54:55] [PASSED] Composite
[16:54:55] [PASSED] SVIDEO
[16:54:55] [PASSED] LVDS
[16:54:55] [PASSED] Component
[16:54:55] [PASSED] DIN
[16:54:55] [PASSED] DP
[16:54:55] [PASSED] HDMI-A
[16:54:55] [PASSED] HDMI-B
[16:54:55] [PASSED] TV
[16:54:55] [PASSED] eDP
[16:54:55] [PASSED] Virtual
[16:54:55] [PASSED] DSI
[16:54:55] [PASSED] DPI
[16:54:55] [PASSED] Writeback
[16:54:55] [PASSED] SPI
[16:54:55] [PASSED] USB
[16:54:55] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[16:54:55] ======== drm_test_drm_connector_dynamic_init_name  =========
[16:54:55] [PASSED] Unknown
[16:54:55] [PASSED] VGA
[16:54:55] [PASSED] DVI-I
[16:54:55] [PASSED] DVI-D
[16:54:55] [PASSED] DVI-A
[16:54:55] [PASSED] Composite
[16:54:55] [PASSED] SVIDEO
[16:54:55] [PASSED] LVDS
[16:54:55] [PASSED] Component
[16:54:55] [PASSED] DIN
[16:54:55] [PASSED] DP
[16:54:55] [PASSED] HDMI-A
[16:54:55] [PASSED] HDMI-B
[16:54:55] [PASSED] TV
[16:54:55] [PASSED] eDP
[16:54:55] [PASSED] Virtual
[16:54:55] [PASSED] DSI
[16:54:55] [PASSED] DPI
[16:54:55] [PASSED] Writeback
[16:54:55] [PASSED] SPI
[16:54:55] [PASSED] USB
[16:54:55] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[16:54:55] =========== [PASSED] drm_connector_dynamic_init ============
[16:54:55] ==== drm_connector_dynamic_register_early (4 subtests) =====
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[16:54:55] ====== [PASSED] drm_connector_dynamic_register_early =======
[16:54:55] ======= drm_connector_dynamic_register (7 subtests) ========
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[16:54:55] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[16:54:55] ========= [PASSED] drm_connector_dynamic_register ==========
[16:54:55] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[16:54:55] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[16:54:55] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[16:54:55] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[16:54:55] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[16:54:55] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:54:55] [PASSED] NTSC
[16:54:55] [PASSED] NTSC-443
[16:54:55] [PASSED] NTSC-J
[16:54:55] [PASSED] PAL
[16:54:55] [PASSED] PAL-M
[16:54:55] [PASSED] PAL-N
[16:54:55] [PASSED] SECAM
[16:54:55] [PASSED] Mono
[16:54:55] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:54:55] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:54:55] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:54:55] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[16:54:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[16:54:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[16:54:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[16:54:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[16:54:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[16:54:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[16:54:55] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[16:54:55] [PASSED] VIC 96
[16:54:55] [PASSED] VIC 97
[16:54:55] [PASSED] VIC 101
[16:54:55] [PASSED] VIC 102
[16:54:55] [PASSED] VIC 106
[16:54:55] [PASSED] VIC 107
[16:54:55] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[16:54:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[16:54:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[16:54:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[16:54:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[16:54:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[16:54:55] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[16:54:55] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[16:54:55] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[16:54:55] [PASSED] Automatic
[16:54:55] [PASSED] Full
[16:54:55] [PASSED] Limited 16:235
[16:54:55] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[16:54:55] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[16:54:55] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[16:54:55] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[16:54:55] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[16:54:55] [PASSED] RGB
[16:54:55] [PASSED] YUV 4:2:0
[16:54:55] [PASSED] YUV 4:2:2
[16:54:55] [PASSED] YUV 4:4:4
[16:54:55] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[16:54:55] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[16:54:55] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[16:54:55] ============= drm_damage_helper (21 subtests) ==============
[16:54:55] [PASSED] drm_test_damage_iter_no_damage
[16:54:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:54:55] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:54:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:54:55] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:54:55] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:54:55] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:54:55] [PASSED] drm_test_damage_iter_simple_damage
[16:54:55] [PASSED] drm_test_damage_iter_single_damage
[16:54:55] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:54:55] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:54:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:54:55] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:54:55] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:54:55] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:54:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:54:55] [PASSED] drm_test_damage_iter_damage
[16:54:55] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:54:55] [PASSED] drm_test_damage_iter_damage_one_outside
[16:54:55] [PASSED] drm_test_damage_iter_damage_src_moved
[16:54:55] [PASSED] drm_test_damage_iter_damage_not_visible
[16:54:55] ================ [PASSED] drm_damage_helper ================
[16:54:55] ============== drm_dp_mst_helper (3 subtests) ==============
[16:54:55] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:54:55] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:54:55] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:54:55] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:54:55] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:54:55] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:54:55] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:54:55] ============== drm_test_dp_mst_calc_pbn_div  ===============
[16:54:55] [PASSED] Link rate 2000000 lane count 4
[16:54:55] [PASSED] Link rate 2000000 lane count 2
[16:54:55] [PASSED] Link rate 2000000 lane count 1
[16:54:55] [PASSED] Link rate 1350000 lane count 4
[16:54:55] [PASSED] Link rate 1350000 lane count 2
[16:54:55] [PASSED] Link rate 1350000 lane count 1
[16:54:55] [PASSED] Link rate 1000000 lane count 4
[16:54:55] [PASSED] Link rate 1000000 lane count 2
[16:54:55] [PASSED] Link rate 1000000 lane count 1
[16:54:55] [PASSED] Link rate 810000 lane count 4
[16:54:55] [PASSED] Link rate 810000 lane count 2
[16:54:55] [PASSED] Link rate 810000 lane count 1
[16:54:55] [PASSED] Link rate 540000 lane count 4
[16:54:55] [PASSED] Link rate 540000 lane count 2
[16:54:55] [PASSED] Link rate 540000 lane count 1
[16:54:55] [PASSED] Link rate 270000 lane count 4
[16:54:55] [PASSED] Link rate 270000 lane count 2
[16:54:55] [PASSED] Link rate 270000 lane count 1
[16:54:55] [PASSED] Link rate 162000 lane count 4
[16:54:55] [PASSED] Link rate 162000 lane count 2
[16:54:55] [PASSED] Link rate 162000 lane count 1
[16:54:55] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[16:54:55] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:54:55] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:54:55] [PASSED] DP_POWER_UP_PHY with port number
[16:54:55] [PASSED] DP_POWER_DOWN_PHY with port number
[16:54:55] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:54:55] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:54:55] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:54:55] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:54:55] [PASSED] DP_QUERY_PAYLOAD with port number
[16:54:55] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:54:55] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:54:55] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:54:55] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:54:55] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:54:55] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:54:55] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:54:55] [PASSED] DP_REMOTE_I2C_READ with port number
[16:54:55] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:54:55] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:54:55] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:54:55] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:54:55] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:54:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:54:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:54:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:54:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:54:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:54:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:54:55] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:54:55] ================ [PASSED] drm_dp_mst_helper ================
[16:54:55] ================== drm_exec (7 subtests) ===================
[16:54:55] [PASSED] sanitycheck
[16:54:55] [PASSED] test_lock
[16:54:55] [PASSED] test_lock_unlock
[16:54:55] [PASSED] test_duplicates
[16:54:55] [PASSED] test_prepare
[16:54:55] [PASSED] test_prepare_array
[16:54:55] [PASSED] test_multiple_loops
[16:54:55] ==================== [PASSED] drm_exec =====================
[16:54:55] =========== drm_format_helper_test (17 subtests) ===========
[16:54:55] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:54:55] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:54:55] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:54:55] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:54:55] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:54:55] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:54:55] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:54:55] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[16:54:55] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:54:55] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:54:55] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:54:55] ============== drm_test_fb_xrgb8888_to_mono  ===============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[16:54:55] ==================== drm_test_fb_swab  =====================
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ================ [PASSED] drm_test_fb_swab =================
[16:54:55] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[16:54:55] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[16:54:55] [PASSED] single_pixel_source_buffer
[16:54:55] [PASSED] single_pixel_clip_rectangle
[16:54:55] [PASSED] well_known_colors
[16:54:55] [PASSED] destination_pitch
[16:54:55] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[16:54:55] ================= drm_test_fb_clip_offset  =================
[16:54:55] [PASSED] pass through
[16:54:55] [PASSED] horizontal offset
[16:54:55] [PASSED] vertical offset
[16:54:55] [PASSED] horizontal and vertical offset
[16:54:55] [PASSED] horizontal offset (custom pitch)
[16:54:55] [PASSED] vertical offset (custom pitch)
[16:54:55] [PASSED] horizontal and vertical offset (custom pitch)
[16:54:55] ============= [PASSED] drm_test_fb_clip_offset =============
[16:54:55] =================== drm_test_fb_memcpy  ====================
[16:54:55] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[16:54:55] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[16:54:55] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[16:54:55] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[16:54:55] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[16:54:55] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[16:54:55] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[16:54:55] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[16:54:55] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[16:54:55] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[16:54:55] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[16:54:55] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[16:54:55] =============== [PASSED] drm_test_fb_memcpy ================
[16:54:55] ============= [PASSED] drm_format_helper_test ==============
[16:54:55] ================= drm_format (18 subtests) =================
[16:54:55] [PASSED] drm_test_format_block_width_invalid
[16:54:55] [PASSED] drm_test_format_block_width_one_plane
[16:54:55] [PASSED] drm_test_format_block_width_two_plane
[16:54:55] [PASSED] drm_test_format_block_width_three_plane
[16:54:55] [PASSED] drm_test_format_block_width_tiled
[16:54:55] [PASSED] drm_test_format_block_height_invalid
[16:54:55] [PASSED] drm_test_format_block_height_one_plane
[16:54:55] [PASSED] drm_test_format_block_height_two_plane
[16:54:55] [PASSED] drm_test_format_block_height_three_plane
[16:54:55] [PASSED] drm_test_format_block_height_tiled
[16:54:55] [PASSED] drm_test_format_min_pitch_invalid
[16:54:55] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:54:55] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:54:55] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:54:55] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:54:55] [PASSED] drm_test_format_min_pitch_two_plane
[16:54:55] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:54:55] [PASSED] drm_test_format_min_pitch_tiled
[16:54:55] =================== [PASSED] drm_format ====================
[16:54:55] ============== drm_framebuffer (10 subtests) ===============
[16:54:55] ========== drm_test_framebuffer_check_src_coords  ==========
[16:54:55] [PASSED] Success: source fits into fb
[16:54:55] [PASSED] Fail: overflowing fb with x-axis coordinate
[16:54:55] [PASSED] Fail: overflowing fb with y-axis coordinate
[16:54:55] [PASSED] Fail: overflowing fb with source width
[16:54:55] [PASSED] Fail: overflowing fb with source height
[16:54:55] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[16:54:55] [PASSED] drm_test_framebuffer_cleanup
[16:54:55] =============== drm_test_framebuffer_create  ===============
[16:54:55] [PASSED] ABGR8888 normal sizes
[16:54:55] [PASSED] ABGR8888 max sizes
[16:54:55] [PASSED] ABGR8888 pitch greater than min required
[16:54:55] [PASSED] ABGR8888 pitch less than min required
[16:54:55] [PASSED] ABGR8888 Invalid width
[16:54:55] [PASSED] ABGR8888 Invalid buffer handle
[16:54:55] [PASSED] No pixel format
[16:54:55] [PASSED] ABGR8888 Width 0
[16:54:55] [PASSED] ABGR8888 Height 0
[16:54:55] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:54:55] [PASSED] ABGR8888 Large buffer offset
[16:54:55] [PASSED] ABGR8888 Buffer offset for inexistent plane
[16:54:55] [PASSED] ABGR8888 Invalid flag
[16:54:55] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:54:55] [PASSED] ABGR8888 Valid buffer modifier
[16:54:55] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:54:55] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:54:55] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:54:55] [PASSED] NV12 Normal sizes
[16:54:55] [PASSED] NV12 Max sizes
[16:54:55] [PASSED] NV12 Invalid pitch
[16:54:55] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:54:55] [PASSED] NV12 different  modifier per-plane
[16:54:55] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:54:55] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:54:55] [PASSED] NV12 Modifier for inexistent plane
[16:54:55] [PASSED] NV12 Handle for inexistent plane
[16:54:55] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:54:55] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:54:55] [PASSED] YVU420 Normal sizes
[16:54:55] [PASSED] YVU420 Max sizes
[16:54:55] [PASSED] YVU420 Invalid pitch
[16:54:55] [PASSED] YVU420 Different pitches
[16:54:55] [PASSED] YVU420 Different buffer offsets/pitches
[16:54:55] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:54:55] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:54:55] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:54:55] [PASSED] YVU420 Valid modifier
[16:54:55] [PASSED] YVU420 Different modifiers per plane
[16:54:55] [PASSED] YVU420 Modifier for inexistent plane
[16:54:55] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[16:54:55] [PASSED] X0L2 Normal sizes
[16:54:55] [PASSED] X0L2 Max sizes
[16:54:55] [PASSED] X0L2 Invalid pitch
[16:54:55] [PASSED] X0L2 Pitch greater than minimum required
[16:54:55] [PASSED] X0L2 Handle for inexistent plane
[16:54:55] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:54:55] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:54:55] [PASSED] X0L2 Valid modifier
[16:54:55] [PASSED] X0L2 Modifier for inexistent plane
[16:54:55] =========== [PASSED] drm_test_framebuffer_create ===========
[16:54:55] [PASSED] drm_test_framebuffer_free
[16:54:55] [PASSED] drm_test_framebuffer_init
[16:54:55] [PASSED] drm_test_framebuffer_init_bad_format
[16:54:55] [PASSED] drm_test_framebuffer_init_dev_mismatch
[16:54:55] [PASSED] drm_test_framebuffer_lookup
[16:54:55] [PASSED] drm_test_framebuffer_lookup_inexistent
[16:54:55] [PASSED] drm_test_framebuffer_modifiers_not_supported
[16:54:55] ================= [PASSED] drm_framebuffer =================
[16:54:55] ================ drm_gem_shmem (8 subtests) ================
[16:54:55] [PASSED] drm_gem_shmem_test_obj_create
[16:54:55] [PASSED] drm_gem_shmem_test_obj_create_private
[16:54:55] [PASSED] drm_gem_shmem_test_pin_pages
[16:54:55] [PASSED] drm_gem_shmem_test_vmap
[16:54:55] [PASSED] drm_gem_shmem_test_get_pages_sgt
[16:54:55] [PASSED] drm_gem_shmem_test_get_sg_table
[16:54:55] [PASSED] drm_gem_shmem_test_madvise
[16:54:55] [PASSED] drm_gem_shmem_test_purge
[16:54:55] ================== [PASSED] drm_gem_shmem ==================
[16:54:55] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[16:54:55] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[16:54:55] [PASSED] Automatic
[16:54:55] [PASSED] Full
[16:54:55] [PASSED] Limited 16:235
[16:54:55] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[16:54:55] [PASSED] drm_test_check_disable_connector
[16:54:55] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[16:54:55] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[16:54:55] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[16:54:55] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[16:54:55] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[16:54:55] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[16:54:55] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[16:54:55] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[16:54:55] [PASSED] drm_test_check_output_bpc_dvi
[16:54:55] [PASSED] drm_test_check_output_bpc_format_vic_1
[16:54:55] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[16:54:55] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[16:54:55] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[16:54:55] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[16:54:55] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[16:54:55] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[16:54:55] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[16:54:55] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[16:54:55] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[16:54:55] [PASSED] drm_test_check_broadcast_rgb_value
[16:54:55] [PASSED] drm_test_check_bpc_8_value
[16:54:55] [PASSED] drm_test_check_bpc_10_value
[16:54:55] [PASSED] drm_test_check_bpc_12_value
[16:54:55] [PASSED] drm_test_check_format_value
[16:54:55] [PASSED] drm_test_check_tmds_char_value
[16:54:55] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[16:54:55] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[16:54:55] [PASSED] drm_test_check_mode_valid
[16:54:55] [PASSED] drm_test_check_mode_valid_reject
[16:54:55] [PASSED] drm_test_check_mode_valid_reject_rate
[16:54:55] [PASSED] drm_test_check_mode_valid_reject_max_clock
[16:54:55] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[16:54:55] ================= drm_managed (2 subtests) =================
[16:54:55] [PASSED] drm_test_managed_release_action
[16:54:55] [PASSED] drm_test_managed_run_action
[16:54:55] =================== [PASSED] drm_managed ===================
[16:54:55] =================== drm_mm (6 subtests) ====================
[16:54:55] [PASSED] drm_test_mm_init
[16:54:55] [PASSED] drm_test_mm_debug
[16:54:55] [PASSED] drm_test_mm_align32
[16:54:55] [PASSED] drm_test_mm_align64
[16:54:55] [PASSED] drm_test_mm_lowest
[16:54:55] [PASSED] drm_test_mm_highest
[16:54:55] ===================== [PASSED] drm_mm ======================
[16:54:55] ============= drm_modes_analog_tv (5 subtests) =============
[16:54:55] [PASSED] drm_test_modes_analog_tv_mono_576i
[16:54:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:54:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:54:55] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:54:55] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:54:55] =============== [PASSED] drm_modes_analog_tv ===============
[16:54:55] ============== drm_plane_helper (2 subtests) ===============
[16:54:55] =============== drm_test_check_plane_state  ================
[16:54:55] [PASSED] clipping_simple
[16:54:55] [PASSED] clipping_rotate_reflect
[16:54:55] [PASSED] positioning_simple
[16:54:55] [PASSED] upscaling
[16:54:55] [PASSED] downscaling
[16:54:55] [PASSED] rounding1
[16:54:55] [PASSED] rounding2
[16:54:55] [PASSED] rounding3
[16:54:55] [PASSED] rounding4
[16:54:55] =========== [PASSED] drm_test_check_plane_state ============
[16:54:55] =========== drm_test_check_invalid_plane_state  ============
[16:54:55] [PASSED] positioning_invalid
[16:54:55] [PASSED] upscaling_invalid
[16:54:55] [PASSED] downscaling_invalid
[16:54:55] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:54:55] ================ [PASSED] drm_plane_helper =================
[16:54:55] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[16:54:55] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:54:55] [PASSED] None
[16:54:55] [PASSED] PAL
[16:54:55] [PASSED] NTSC
[16:54:55] [PASSED] Both, NTSC Default
[16:54:55] [PASSED] Both, PAL Default
[16:54:55] [PASSED] Both, NTSC Default, with PAL on command-line
[16:54:55] [PASSED] Both, PAL Default, with NTSC on command-line
[16:54:55] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:54:55] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:54:55] ================== drm_rect (9 subtests) ===================
[16:54:55] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:54:55] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:54:55] [PASSED] drm_test_rect_clip_scaled_clipped
[16:54:55] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:54:55] ================= drm_test_rect_intersect  =================
[16:54:55] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[16:54:55] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[16:54:55] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[16:54:55] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[16:54:55] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[16:54:55] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[16:54:55] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[16:54:55] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[16:54:55] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[16:54:55] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[16:54:55] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[16:54:55] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[16:54:55] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[16:54:55] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[16:54:55] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[16:54:55] ============= [PASSED] drm_test_rect_intersect =============
[16:54:55] ================ drm_test_rect_calc_hscale  ================
[16:54:55] [PASSED] normal use
[16:54:55] [PASSED] out of max range
[16:54:55] [PASSED] out of min range
[16:54:55] [PASSED] zero dst
[16:54:55] [PASSED] negative src
[16:54:55] [PASSED] negative dst
[16:54:55] ============ [PASSED] drm_test_rect_calc_hscale ============
[16:54:55] ================ drm_test_rect_calc_vscale  ================
[16:54:55] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[16:54:55] [PASSED] out of max range
[16:54:55] [PASSED] out of min range
[16:54:55] [PASSED] zero dst
[16:54:55] [PASSED] negative src
[16:54:55] [PASSED] negative dst
[16:54:55] ============ [PASSED] drm_test_rect_calc_vscale ============
[16:54:55] ================== drm_test_rect_rotate  ===================
[16:54:55] [PASSED] reflect-x
[16:54:55] [PASSED] reflect-y
[16:54:55] [PASSED] rotate-0
[16:54:55] [PASSED] rotate-90
[16:54:55] [PASSED] rotate-180
[16:54:55] [PASSED] rotate-270
[16:54:55] ============== [PASSED] drm_test_rect_rotate ===============
[16:54:55] ================ drm_test_rect_rotate_inv  =================
[16:54:55] [PASSED] reflect-x
[16:54:55] [PASSED] reflect-y
[16:54:55] [PASSED] rotate-0
[16:54:55] [PASSED] rotate-90
[16:54:55] [PASSED] rotate-180
[16:54:55] [PASSED] rotate-270
[16:54:55] ============ [PASSED] drm_test_rect_rotate_inv =============
[16:54:55] ==================== [PASSED] drm_rect =====================
[16:54:55] ============ drm_sysfb_modeset_test (1 subtest) ============
[16:54:55] ============ drm_test_sysfb_build_fourcc_list  =============
[16:54:55] [PASSED] no native formats
[16:54:55] [PASSED] XRGB8888 as native format
[16:54:55] [PASSED] remove duplicates
[16:54:55] [PASSED] convert alpha formats
[16:54:55] [PASSED] random formats
[16:54:55] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[16:54:55] ============= [PASSED] drm_sysfb_modeset_test ==============
[16:54:55] ============================================================
[16:54:55] Testing complete. Ran 622 tests: passed: 622
[16:54:55] Elapsed time: 31.334s total, 1.620s configuring, 29.196s building, 0.479s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[16:54:55] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:54:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
ERROR:root:../drivers/gpu/drm/ttm/tests/ttm_mock_manager.c:236:20: error: expected declaration specifiers or ‘...’ before string constant
  236 | MODULE_DESCRIPTION("KUnit tests for ttm with mock resource managers");
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_mock_manager.c:237:16: error: expected declaration specifiers or ‘...’ before string constant
  237 | MODULE_LICENSE("GPL and additional rights");
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
make[8]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/ttm/tests/ttm_mock_manager.o] Error 1
make[8]: *** Waiting for unfinished jobs....
make[7]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/ttm/tests] Error 2
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/ttm] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/kernel/Makefile:2010: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


