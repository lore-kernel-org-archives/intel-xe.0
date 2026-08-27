Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9CBC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCC810E3DA;
	Thu, 27 Aug 2026 10:26:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6410E3DA;
 Thu, 27 Aug 2026 10:26:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Isolate_wedged_devic?=
 =?utf-8?q?es_from_hardware_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 10:26:05 -0000
Message-ID: <178782636537.90750.9715306565869052769@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827101801.1247654-1-arvind.yadav@intel.com>
In-Reply-To: <20260827101801.1247654-1-arvind.yadav@intel.com>
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

Series: drm/xe: Isolate wedged devices from hardware access
URL   : https://patchwork.freedesktop.org/series/172860/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[10:24:27] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:24:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:25:04] Starting KUnit Kernel (1/1)...
[10:25:04] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:25:04] ================== guc_buf (11 subtests) ===================
[10:25:04] [PASSED] test_smallest
[10:25:04] [PASSED] test_largest
[10:25:04] [PASSED] test_granular
[10:25:04] [PASSED] test_unique
[10:25:04] [PASSED] test_overlap
[10:25:04] [PASSED] test_reusable
[10:25:04] [PASSED] test_too_big
[10:25:04] [PASSED] test_flush
[10:25:04] [PASSED] test_lookup
[10:25:04] [PASSED] test_data
[10:25:04] [PASSED] test_class
[10:25:04] ===================== [PASSED] guc_buf =====================
[10:25:04] =================== guc_dbm (7 subtests) ===================
[10:25:04] [PASSED] test_empty
[10:25:04] [PASSED] test_default
[10:25:04] ======================== test_size  ========================
[10:25:04] [PASSED] 4
[10:25:04] [PASSED] 8
[10:25:04] [PASSED] 32
[10:25:04] [PASSED] 256
[10:25:04] ==================== [PASSED] test_size ====================
[10:25:04] ======================= test_reuse  ========================
[10:25:04] [PASSED] 4
[10:25:04] [PASSED] 8
[10:25:04] [PASSED] 32
[10:25:04] [PASSED] 256
[10:25:04] =================== [PASSED] test_reuse ====================
[10:25:04] =================== test_range_overlap  ====================
[10:25:04] [PASSED] 4
[10:25:04] [PASSED] 8
[10:25:04] [PASSED] 32
[10:25:04] [PASSED] 256
[10:25:04] =============== [PASSED] test_range_overlap ================
[10:25:04] =================== test_range_compact  ====================
[10:25:04] [PASSED] 4
[10:25:04] [PASSED] 8
[10:25:04] [PASSED] 32
[10:25:04] [PASSED] 256
[10:25:04] =============== [PASSED] test_range_compact ================
[10:25:04] ==================== test_range_spare  =====================
[10:25:04] [PASSED] 4
[10:25:04] [PASSED] 8
[10:25:04] [PASSED] 32
[10:25:04] [PASSED] 256
[10:25:04] ================ [PASSED] test_range_spare =================
[10:25:04] ===================== [PASSED] guc_dbm =====================
[10:25:04] =================== guc_idm (6 subtests) ===================
[10:25:04] [PASSED] bad_init
[10:25:04] [PASSED] no_init
[10:25:04] [PASSED] init_fini
[10:25:04] [PASSED] check_used
[10:25:04] [PASSED] check_quota
[10:25:04] [PASSED] check_all
[10:25:04] ===================== [PASSED] guc_idm =====================
[10:25:04] =============== guc_klv_helpers (9 subtests) ===============
[10:25:04] [PASSED] test_count
[10:25:04] [PASSED] test_encode_u32
[10:25:04] [PASSED] test_encode_u64
[10:25:04] [PASSED] test_encode_string
[10:25:04] [PASSED] test_encode_object_raw
[10:25:04] [PASSED] test_encode_object_klv
[10:25:04] [PASSED] test_encode_object_nested
[10:25:04] [PASSED] test_encode_object_basic
[10:25:04] [PASSED] test_print
[10:25:04] ================= [PASSED] guc_klv_helpers =================
[10:25:04] =================== xe_log (4 subtests) ====================
[10:25:04] [PASSED] demo_cper
[10:25:04] [PASSED] demo_dmesg
[10:25:04] ======================= test_dmesg  ========================
[10:25:04] [PASSED] test_fatal
[10:25:04] [PASSED] test_fatal_tile
[10:25:04] [PASSED] test_fatal_gt
[10:25:04] [PASSED] test_fatal_comp
[10:25:04] [PASSED] test_fatal_comp_tile
[10:25:04] [PASSED] test_fatal_comp_gt
[10:25:04] [PASSED] test_fatal_all
[10:25:04] [PASSED] test_recoverable
[10:25:04] [PASSED] test_recoverable_tile
[10:25:04] [PASSED] test_recoverable_gt
[10:25:04] [PASSED] test_recoverable_comp
[10:25:04] [PASSED] test_recoverable_comp_tile
[10:25:04] [PASSED] test_recoverable_comp_gt
[10:25:04] [PASSED] test_recoverable_all
[10:25:04] [PASSED] test_info
[10:25:04] [PASSED] test_info_tile
[10:25:04] [PASSED] test_info_gt
[10:25:04] [PASSED] test_info_err
[10:25:04] [PASSED] test_info_comp
[10:25:04] [PASSED] test_info_comp_tile
[10:25:04] [PASSED] test_info_comp_gt
[10:25:04] [PASSED] test_info_all
[10:25:04] [PASSED] test_hw_fatal
[10:25:04] [PASSED] test_hw_recoverable
[10:25:04] [PASSED] test_hw_corrected
[10:25:04] [PASSED] test_hw_informational
[10:25:04] =================== [PASSED] test_dmesg ====================
[10:25:04] ====================== test_invalid  =======================
[10:25:04] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[10:25:04] ================== [SKIPPED] test_invalid ==================
[10:25:04] ===================== [PASSED] xe_log ======================
[10:25:04] ================== no_relay (3 subtests) ===================
[10:25:04] [PASSED] xe_drops_guc2pf_if_not_ready
[10:25:04] [PASSED] xe_drops_guc2vf_if_not_ready
[10:25:04] [PASSED] xe_rejects_send_if_not_ready
[10:25:04] ==================== [PASSED] no_relay =====================
[10:25:04] ================== pf_relay (14 subtests) ==================
[10:25:04] [PASSED] pf_rejects_guc2pf_too_short
[10:25:04] [PASSED] pf_rejects_guc2pf_too_long
[10:25:04] [PASSED] pf_rejects_guc2pf_no_payload
[10:25:04] [PASSED] pf_fails_no_payload
[10:25:04] [PASSED] pf_fails_bad_origin
[10:25:04] [PASSED] pf_fails_bad_type
[10:25:04] [PASSED] pf_txn_reports_error
[10:25:04] [PASSED] pf_txn_sends_pf2guc
[10:25:04] [PASSED] pf_sends_pf2guc
[10:25:04] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:25:04] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:25:04] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:25:04] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:25:04] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:25:04] ==================== [PASSED] pf_relay =====================
[10:25:04] ================== vf_relay (3 subtests) ===================
[10:25:04] [PASSED] vf_rejects_guc2vf_too_short
[10:25:04] [PASSED] vf_rejects_guc2vf_too_long
[10:25:04] [PASSED] vf_rejects_guc2vf_no_payload
[10:25:04] ==================== [PASSED] vf_relay =====================
[10:25:04] ================ pf_gt_config (9 subtests) =================
[10:25:04] [PASSED] fair_contexts_1vf
[10:25:04] [PASSED] fair_doorbells_1vf
[10:25:04] [PASSED] fair_ggtt_1vf
[10:25:04] ====================== fair_vram_1vf  ======================
[10:25:04] [PASSED] 3.50 GiB
[10:25:04] [PASSED] 11.5 GiB
[10:25:04] [PASSED] 15.5 GiB
[10:25:04] [PASSED] 31.5 GiB
[10:25:04] [PASSED] 63.5 GiB
[10:25:04] [PASSED] 1.91 GiB
[10:25:04] ================== [PASSED] fair_vram_1vf ==================
[10:25:04] ================ fair_vram_1vf_admin_only  =================
[10:25:04] [PASSED] 3.50 GiB
[10:25:04] [PASSED] 11.5 GiB
[10:25:04] [PASSED] 15.5 GiB
[10:25:04] [PASSED] 31.5 GiB
[10:25:04] [PASSED] 63.5 GiB
[10:25:04] [PASSED] 1.91 GiB
[10:25:04] ============ [PASSED] fair_vram_1vf_admin_only =============
[10:25:04] ====================== fair_contexts  ======================
[10:25:04] [PASSED] 1 VF
[10:25:04] [PASSED] 2 VFs
[10:25:04] [PASSED] 3 VFs
[10:25:04] [PASSED] 4 VFs
[10:25:04] [PASSED] 5 VFs
[10:25:04] [PASSED] 6 VFs
[10:25:04] [PASSED] 7 VFs
[10:25:04] [PASSED] 8 VFs
[10:25:04] [PASSED] 9 VFs
[10:25:04] [PASSED] 10 VFs
[10:25:04] [PASSED] 11 VFs
[10:25:04] [PASSED] 12 VFs
[10:25:04] [PASSED] 13 VFs
[10:25:04] [PASSED] 14 VFs
[10:25:04] [PASSED] 15 VFs
[10:25:04] [PASSED] 16 VFs
[10:25:04] [PASSED] 17 VFs
[10:25:04] [PASSED] 18 VFs
[10:25:04] [PASSED] 19 VFs
[10:25:04] [PASSED] 20 VFs
[10:25:04] [PASSED] 21 VFs
[10:25:04] [PASSED] 22 VFs
[10:25:04] [PASSED] 23 VFs
[10:25:04] [PASSED] 24 VFs
[10:25:04] [PASSED] 25 VFs
[10:25:04] [PASSED] 26 VFs
[10:25:04] [PASSED] 27 VFs
[10:25:04] [PASSED] 28 VFs
[10:25:04] [PASSED] 29 VFs
[10:25:04] [PASSED] 30 VFs
[10:25:04] [PASSED] 31 VFs
[10:25:04] [PASSED] 32 VFs
[10:25:04] [PASSED] 33 VFs
[10:25:04] [PASSED] 34 VFs
[10:25:04] [PASSED] 35 VFs
[10:25:04] [PASSED] 36 VFs
[10:25:04] [PASSED] 37 VFs
[10:25:04] [PASSED] 38 VFs
[10:25:04] [PASSED] 39 VFs
[10:25:04] [PASSED] 40 VFs
[10:25:04] [PASSED] 41 VFs
[10:25:04] [PASSED] 42 VFs
[10:25:04] [PASSED] 43 VFs
[10:25:04] [PASSED] 44 VFs
[10:25:04] [PASSED] 45 VFs
[10:25:04] [PASSED] 46 VFs
[10:25:04] [PASSED] 47 VFs
[10:25:04] [PASSED] 48 VFs
[10:25:04] [PASSED] 49 VFs
[10:25:04] [PASSED] 50 VFs
[10:25:04] [PASSED] 51 VFs
[10:25:04] [PASSED] 52 VFs
[10:25:04] [PASSED] 53 VFs
[10:25:04] [PASSED] 54 VFs
[10:25:04] [PASSED] 55 VFs
[10:25:04] [PASSED] 56 VFs
[10:25:04] [PASSED] 57 VFs
[10:25:04] [PASSED] 58 VFs
[10:25:04] [PASSED] 59 VFs
[10:25:04] [PASSED] 60 VFs
[10:25:04] [PASSED] 61 VFs
[10:25:04] [PASSED] 62 VFs
[10:25:04] [PASSED] 63 VFs
[10:25:04] ================== [PASSED] fair_contexts ==================
[10:25:04] ===================== fair_doorbells  ======================
[10:25:04] [PASSED] 1 VF
[10:25:04] [PASSED] 2 VFs
[10:25:04] [PASSED] 3 VFs
[10:25:04] [PASSED] 4 VFs
[10:25:04] [PASSED] 5 VFs
[10:25:04] [PASSED] 6 VFs
[10:25:04] [PASSED] 7 VFs
[10:25:04] [PASSED] 8 VFs
[10:25:04] [PASSED] 9 VFs
[10:25:04] [PASSED] 10 VFs
[10:25:04] [PASSED] 11 VFs
[10:25:04] [PASSED] 12 VFs
[10:25:04] [PASSED] 13 VFs
[10:25:04] [PASSED] 14 VFs
[10:25:04] [PASSED] 15 VFs
[10:25:04] [PASSED] 16 VFs
[10:25:04] [PASSED] 17 VFs
[10:25:04] [PASSED] 18 VFs
[10:25:04] [PASSED] 19 VFs
[10:25:04] [PASSED] 20 VFs
[10:25:04] [PASSED] 21 VFs
[10:25:04] [PASSED] 22 VFs
[10:25:04] [PASSED] 23 VFs
[10:25:04] [PASSED] 24 VFs
[10:25:04] [PASSED] 25 VFs
[10:25:04] [PASSED] 26 VFs
[10:25:04] [PASSED] 27 VFs
[10:25:04] [PASSED] 28 VFs
[10:25:04] [PASSED] 29 VFs
[10:25:04] [PASSED] 30 VFs
[10:25:04] [PASSED] 31 VFs
[10:25:04] [PASSED] 32 VFs
[10:25:04] [PASSED] 33 VFs
[10:25:04] [PASSED] 34 VFs
[10:25:04] [PASSED] 35 VFs
[10:25:04] [PASSED] 36 VFs
[10:25:04] [PASSED] 37 VFs
[10:25:04] [PASSED] 38 VFs
[10:25:04] [PASSED] 39 VFs
[10:25:04] [PASSED] 40 VFs
[10:25:04] [PASSED] 41 VFs
[10:25:04] [PASSED] 42 VFs
[10:25:04] [PASSED] 43 VFs
[10:25:04] [PASSED] 44 VFs
[10:25:04] [PASSED] 45 VFs
[10:25:04] [PASSED] 46 VFs
[10:25:04] [PASSED] 47 VFs
[10:25:04] [PASSED] 48 VFs
[10:25:04] [PASSED] 49 VFs
[10:25:04] [PASSED] 50 VFs
[10:25:04] [PASSED] 51 VFs
[10:25:04] [PASSED] 52 VFs
[10:25:04] [PASSED] 53 VFs
[10:25:04] [PASSED] 54 VFs
[10:25:04] [PASSED] 55 VFs
[10:25:04] [PASSED] 56 VFs
[10:25:04] [PASSED] 57 VFs
[10:25:04] [PASSED] 58 VFs
[10:25:04] [PASSED] 59 VFs
[10:25:04] [PASSED] 60 VFs
[10:25:04] [PASSED] 61 VFs
[10:25:04] [PASSED] 62 VFs
[10:25:04] [PASSED] 63 VFs
[10:25:04] ================= [PASSED] fair_doorbells ==================
[10:25:04] ======================== fair_ggtt  ========================
[10:25:04] [PASSED] 1 VF
[10:25:04] [PASSED] 2 VFs
[10:25:04] [PASSED] 3 VFs
[10:25:04] [PASSED] 4 VFs
[10:25:04] [PASSED] 5 VFs
[10:25:04] [PASSED] 6 VFs
[10:25:04] [PASSED] 7 VFs
[10:25:04] [PASSED] 8 VFs
[10:25:04] [PASSED] 9 VFs
[10:25:04] [PASSED] 10 VFs
[10:25:04] [PASSED] 11 VFs
[10:25:04] [PASSED] 12 VFs
[10:25:04] [PASSED] 13 VFs
[10:25:04] [PASSED] 14 VFs
[10:25:04] [PASSED] 15 VFs
[10:25:04] [PASSED] 16 VFs
[10:25:04] [PASSED] 17 VFs
[10:25:04] [PASSED] 18 VFs
[10:25:04] [PASSED] 19 VFs
[10:25:04] [PASSED] 20 VFs
[10:25:04] [PASSED] 21 VFs
[10:25:04] [PASSED] 22 VFs
[10:25:04] [PASSED] 23 VFs
[10:25:04] [PASSED] 24 VFs
[10:25:04] [PASSED] 25 VFs
[10:25:04] [PASSED] 26 VFs
[10:25:04] [PASSED] 27 VFs
[10:25:04] [PASSED] 28 VFs
[10:25:04] [PASSED] 29 VFs
[10:25:04] [PASSED] 30 VFs
[10:25:04] [PASSED] 31 VFs
[10:25:04] [PASSED] 32 VFs
[10:25:04] [PASSED] 33 VFs
[10:25:04] [PASSED] 34 VFs
[10:25:04] [PASSED] 35 VFs
[10:25:04] [PASSED] 36 VFs
[10:25:04] [PASSED] 37 VFs
[10:25:04] [PASSED] 38 VFs
[10:25:04] [PASSED] 39 VFs
[10:25:04] [PASSED] 40 VFs
[10:25:04] [PASSED] 41 VFs
[10:25:04] [PASSED] 42 VFs
[10:25:04] [PASSED] 43 VFs
[10:25:04] [PASSED] 44 VFs
[10:25:04] [PASSED] 45 VFs
[10:25:04] [PASSED] 46 VFs
[10:25:04] [PASSED] 47 VFs
[10:25:04] [PASSED] 48 VFs
[10:25:04] [PASSED] 49 VFs
[10:25:04] [PASSED] 50 VFs
[10:25:04] [PASSED] 51 VFs
[10:25:04] [PASSED] 52 VFs
[10:25:04] [PASSED] 53 VFs
[10:25:04] [PASSED] 54 VFs
[10:25:04] [PASSED] 55 VFs
[10:25:04] [PASSED] 56 VFs
[10:25:04] [PASSED] 57 VFs
[10:25:04] [PASSED] 58 VFs
[10:25:04] [PASSED] 59 VFs
[10:25:04] [PASSED] 60 VFs
[10:25:04] [PASSED] 61 VFs
[10:25:04] [PASSED] 62 VFs
[10:25:04] [PASSED] 63 VFs
[10:25:04] ==================== [PASSED] fair_ggtt ====================
[10:25:04] ======================== fair_vram  ========================
[10:25:04] [PASSED] 1 VF
[10:25:04] [PASSED] 2 VFs
[10:25:04] [PASSED] 3 VFs
[10:25:04] [PASSED] 4 VFs
[10:25:04] [PASSED] 5 VFs
[10:25:04] [PASSED] 6 VFs
[10:25:04] [PASSED] 7 VFs
[10:25:04] [PASSED] 8 VFs
[10:25:04] [PASSED] 9 VFs
[10:25:04] [PASSED] 10 VFs
[10:25:04] [PASSED] 11 VFs
[10:25:04] [PASSED] 12 VFs
[10:25:04] [PASSED] 13 VFs
[10:25:04] [PASSED] 14 VFs
[10:25:04] [PASSED] 15 VFs
[10:25:04] [PASSED] 16 VFs
[10:25:04] [PASSED] 17 VFs
[10:25:04] [PASSED] 18 VFs
[10:25:04] [PASSED] 19 VFs
[10:25:04] [PASSED] 20 VFs
[10:25:04] [PASSED] 21 VFs
[10:25:04] [PASSED] 22 VFs
[10:25:04] [PASSED] 23 VFs
[10:25:04] [PASSED] 24 VFs
[10:25:04] [PASSED] 25 VFs
[10:25:04] [PASSED] 26 VFs
[10:25:04] [PASSED] 27 VFs
[10:25:04] [PASSED] 28 VFs
[10:25:04] [PASSED] 29 VFs
[10:25:04] [PASSED] 30 VFs
[10:25:04] [PASSED] 31 VFs
[10:25:04] [PASSED] 32 VFs
[10:25:04] [PASSED] 33 VFs
[10:25:04] [PASSED] 34 VFs
[10:25:04] [PASSED] 35 VFs
[10:25:04] [PASSED] 36 VFs
[10:25:04] [PASSED] 37 VFs
[10:25:04] [PASSED] 38 VFs
[10:25:04] [PASSED] 39 VFs
[10:25:04] [PASSED] 40 VFs
[10:25:04] [PASSED] 41 VFs
[10:25:04] [PASSED] 42 VFs
[10:25:04] [PASSED] 43 VFs
[10:25:04] [PASSED] 44 VFs
[10:25:04] [PASSED] 45 VFs
[10:25:04] [PASSED] 46 VFs
[10:25:04] [PASSED] 47 VFs
[10:25:04] [PASSED] 48 VFs
[10:25:04] [PASSED] 49 VFs
[10:25:04] [PASSED] 50 VFs
[10:25:04] [PASSED] 51 VFs
[10:25:04] [PASSED] 52 VFs
[10:25:04] [PASSED] 53 VFs
[10:25:04] [PASSED] 54 VFs
[10:25:04] [PASSED] 55 VFs
[10:25:04] [PASSED] 56 VFs
[10:25:04] [PASSED] 57 VFs
[10:25:04] [PASSED] 58 VFs
[10:25:04] [PASSED] 59 VFs
[10:25:04] [PASSED] 60 VFs
[10:25:04] [PASSED] 61 VFs
[10:25:04] [PASSED] 62 VFs
[10:25:04] [PASSED] 63 VFs
[10:25:04] ==================== [PASSED] fair_vram ====================
[10:25:04] ================== [PASSED] pf_gt_config ===================
[10:25:04] ===================== lmtt (1 subtest) =====================
[10:25:04] ======================== test_ops  =========================
[10:25:04] [PASSED] 2-level
[10:25:04] [PASSED] multi-level
[10:25:04] ==================== [PASSED] test_ops =====================
[10:25:04] ====================== [PASSED] lmtt =======================
[10:25:04] ================= sriov_packet (1 subtest) =================
[10:25:04] [PASSED] test_descriptor_init
[10:25:04] ================== [PASSED] sriov_packet ===================
[10:25:04] ================= pf_service (11 subtests) =================
[10:25:04] [PASSED] pf_negotiate_any
[10:25:04] [PASSED] pf_negotiate_base_match
[10:25:04] [PASSED] pf_negotiate_base_newer
[10:25:04] [PASSED] pf_negotiate_base_next
[10:25:04] [SKIPPED] pf_negotiate_base_older (no older minor)
[10:25:04] [PASSED] pf_negotiate_base_prev
[10:25:04] [PASSED] pf_negotiate_latest_match
[10:25:04] [PASSED] pf_negotiate_latest_newer
[10:25:04] [PASSED] pf_negotiate_latest_next
[10:25:04] [SKIPPED] pf_negotiate_latest_older (no older minor)
[10:25:04] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[10:25:04] =================== [PASSED] pf_service ====================
[10:25:04] ================= xe_guc_g2g (2 subtests) ==================
[10:25:04] ============== xe_live_guc_g2g_kunit_default  ==============
[10:25:04] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[10:25:04] ============== xe_live_guc_g2g_kunit_allmem  ===============
[10:25:04] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[10:25:04] =================== [SKIPPED] xe_guc_g2g ===================
[10:25:04] =================== xe_mocs (2 subtests) ===================
[10:25:04] ================ xe_live_mocs_kernel_kunit  ================
[10:25:04] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[10:25:04] ================ xe_live_mocs_reset_kunit  =================
[10:25:04] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[10:25:04] ==================== [SKIPPED] xe_mocs =====================
[10:25:04] ================= xe_migrate (2 subtests) ==================
[10:25:04] ================= xe_migrate_sanity_kunit  =================
[10:25:04] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[10:25:04] ================== xe_validate_ccs_kunit  ==================
[10:25:04] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[10:25:04] =================== [SKIPPED] xe_migrate ===================
[10:25:04] ================== xe_dma_buf (1 subtest) ==================
[10:25:04] ==================== xe_dma_buf_kunit  =====================
[10:25:04] ================ [SKIPPED] xe_dma_buf_kunit ================
[10:25:04] =================== [SKIPPED] xe_dma_buf ===================
[10:25:04] ================= xe_bo_shrink (1 subtest) =================
[10:25:04] =================== xe_bo_shrink_kunit  ====================
[10:25:04] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[10:25:04] ================== [SKIPPED] xe_bo_shrink ==================
[10:25:04] ==================== xe_bo (2 subtests) ====================
[10:25:04] ================== xe_ccs_migrate_kunit  ===================
[10:25:04] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[10:25:04] ==================== xe_bo_evict_kunit  ====================
[10:25:04] =============== [SKIPPED] xe_bo_evict_kunit ================
[10:25:04] ===================== [SKIPPED] xe_bo ======================
[10:25:04] =================== xe_any (9 subtests) ====================
[10:25:04] [PASSED] test_to_xe
[10:25:04] [PASSED] test_to_dev
[10:25:04] [PASSED] test_to_pdev
[10:25:04] [PASSED] test_to_drm
[10:25:04] [PASSED] test_if_pdev
[10:25:04] [PASSED] test_if_xe
[10:25:04] [PASSED] test_if_tile
[10:25:04] [PASSED] test_if_gt
[10:25:04] [PASSED] test_to_id
[10:25:04] ===================== [PASSED] xe_any ======================
[10:25:04] ==================== args (13 subtests) ====================
[10:25:04] [PASSED] count_args_test
[10:25:04] [PASSED] call_args_example
[10:25:04] [PASSED] call_args_test
[10:25:04] [PASSED] drop_first_arg_example
[10:25:04] [PASSED] drop_first_arg_test
[10:25:04] [PASSED] first_arg_example
[10:25:04] [PASSED] first_arg_test
[10:25:04] [PASSED] last_arg_example
[10:25:04] [PASSED] last_arg_test
[10:25:04] [PASSED] pick_arg_example
[10:25:04] [PASSED] if_args_example
[10:25:04] [PASSED] if_args_test
[10:25:04] [PASSED] sep_comma_example
[10:25:04] ====================== [PASSED] args =======================
[10:25:04] =================== xe_pci (3 subtests) ====================
[10:25:04] ==================== check_graphics_ip  ====================
[10:25:04] [PASSED] 12.00 Xe_LP
[10:25:04] [PASSED] 12.10 Xe_LP+
[10:25:04] [PASSED] 12.55 Xe_HPG
[10:25:04] [PASSED] 12.60 Xe_HPC
[10:25:04] [PASSED] 12.70 Xe_LPG
[10:25:04] [PASSED] 12.71 Xe_LPG
[10:25:04] [PASSED] 12.74 Xe_LPG+
[10:25:04] [PASSED] 20.01 Xe2_HPG
[10:25:04] [PASSED] 20.02 Xe2_HPG
[10:25:04] [PASSED] 20.04 Xe2_LPG
[10:25:04] [PASSED] 30.00 Xe3_LPG
[10:25:04] [PASSED] 30.01 Xe3_LPG
[10:25:04] [PASSED] 30.03 Xe3_LPG
[10:25:04] [PASSED] 30.04 Xe3_LPG
[10:25:04] [PASSED] 30.05 Xe3_LPG
[10:25:04] [PASSED] 35.10 Xe3p_LPG
[10:25:04] [PASSED] 35.11 Xe3p_XPC
[10:25:04] ================ [PASSED] check_graphics_ip ================
[10:25:04] ===================== check_media_ip  ======================
[10:25:04] [PASSED] 12.00 Xe_M
[10:25:04] [PASSED] 12.55 Xe_HPM
[10:25:04] [PASSED] 13.00 Xe_LPM+
[10:25:04] [PASSED] 13.01 Xe2_HPM
[10:25:04] [PASSED] 20.00 Xe2_LPM
[10:25:04] [PASSED] 30.00 Xe3_LPM
[10:25:04] [PASSED] 30.02 Xe3_LPM
[10:25:04] [PASSED] 35.00 Xe3p_LPM
[10:25:04] [PASSED] 35.03 Xe3p_HPM
[10:25:04] ================= [PASSED] check_media_ip ==================
[10:25:04] =================== check_platform_desc  ===================
[10:25:04] [PASSED] 0x9A60 (TIGERLAKE)
[10:25:04] [PASSED] 0x9A68 (TIGERLAKE)
[10:25:04] [PASSED] 0x9A70 (TIGERLAKE)
[10:25:04] [PASSED] 0x9A40 (TIGERLAKE)
[10:25:04] [PASSED] 0x9A49 (TIGERLAKE)
[10:25:04] [PASSED] 0x9A59 (TIGERLAKE)
[10:25:04] [PASSED] 0x9A78 (TIGERLAKE)
[10:25:04] [PASSED] 0x9AC0 (TIGERLAKE)
[10:25:04] [PASSED] 0x9AC9 (TIGERLAKE)
[10:25:04] [PASSED] 0x9AD9 (TIGERLAKE)
[10:25:04] [PASSED] 0x9AF8 (TIGERLAKE)
[10:25:04] [PASSED] 0x4C80 (ROCKETLAKE)
[10:25:04] [PASSED] 0x4C8A (ROCKETLAKE)
[10:25:04] [PASSED] 0x4C8B (ROCKETLAKE)
[10:25:04] [PASSED] 0x4C8C (ROCKETLAKE)
[10:25:04] [PASSED] 0x4C90 (ROCKETLAKE)
[10:25:04] [PASSED] 0x4C9A (ROCKETLAKE)
[10:25:04] [PASSED] 0x4680 (ALDERLAKE_S)
[10:25:04] [PASSED] 0x4682 (ALDERLAKE_S)
[10:25:04] [PASSED] 0x4688 (ALDERLAKE_S)
[10:25:04] [PASSED] 0x468A (ALDERLAKE_S)
[10:25:04] [PASSED] 0x468B (ALDERLAKE_S)
[10:25:04] [PASSED] 0x4690 (ALDERLAKE_S)
[10:25:04] [PASSED] 0x4692 (ALDERLAKE_S)
[10:25:04] [PASSED] 0x4693 (ALDERLAKE_S)
[10:25:04] [PASSED] 0x46A0 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46A1 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46A2 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46A3 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46A6 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46A8 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46AA (ALDERLAKE_P)
[10:25:04] [PASSED] 0x462A (ALDERLAKE_P)
[10:25:04] [PASSED] 0x4626 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x4628 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46B0 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46B1 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46B2 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46B3 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46C0 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46C1 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46C2 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46C3 (ALDERLAKE_P)
[10:25:04] [PASSED] 0x46D0 (ALDERLAKE_N)
[10:25:04] [PASSED] 0x46D1 (ALDERLAKE_N)
[10:25:04] [PASSED] 0x46D2 (ALDERLAKE_N)
[10:25:04] [PASSED] 0x46D3 (ALDERLAKE_N)
[10:25:04] [PASSED] 0x46D4 (ALDERLAKE_N)
[10:25:04] [PASSED] 0xA721 (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7A1 (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7A9 (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7AC (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7AD (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA720 (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7A0 (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7A8 (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7AA (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA7AB (ALDERLAKE_P)
[10:25:04] [PASSED] 0xA780 (ALDERLAKE_S)
[10:25:04] [PASSED] 0xA781 (ALDERLAKE_S)
[10:25:04] [PASSED] 0xA782 (ALDERLAKE_S)
[10:25:04] [PASSED] 0xA783 (ALDERLAKE_S)
[10:25:04] [PASSED] 0xA788 (ALDERLAKE_S)
[10:25:04] [PASSED] 0xA789 (ALDERLAKE_S)
[10:25:04] [PASSED] 0xA78A (ALDERLAKE_S)
[10:25:04] [PASSED] 0xA78B (ALDERLAKE_S)
[10:25:04] [PASSED] 0x4905 (DG1)
[10:25:04] [PASSED] 0x4906 (DG1)
[10:25:04] [PASSED] 0x4907 (DG1)
[10:25:04] [PASSED] 0x4908 (DG1)
[10:25:04] [PASSED] 0x4909 (DG1)
[10:25:04] [PASSED] 0x56C0 (DG2)
[10:25:04] [PASSED] 0x56C2 (DG2)
[10:25:04] [PASSED] 0x56C1 (DG2)
[10:25:04] [PASSED] 0x7D51 (METEORLAKE)
[10:25:04] [PASSED] 0x7DD1 (METEORLAKE)
[10:25:04] [PASSED] 0x7D41 (METEORLAKE)
[10:25:04] [PASSED] 0x7D67 (METEORLAKE)
[10:25:04] [PASSED] 0xB640 (METEORLAKE)
[10:25:04] [PASSED] 0x56A0 (DG2)
[10:25:04] [PASSED] 0x56A1 (DG2)
[10:25:04] [PASSED] 0x56A2 (DG2)
[10:25:04] [PASSED] 0x56BE (DG2)
[10:25:04] [PASSED] 0x56BF (DG2)
[10:25:04] [PASSED] 0x5690 (DG2)
[10:25:04] [PASSED] 0x5691 (DG2)
[10:25:04] [PASSED] 0x5692 (DG2)
[10:25:04] [PASSED] 0x56A5 (DG2)
[10:25:04] [PASSED] 0x56A6 (DG2)
[10:25:04] [PASSED] 0x56B0 (DG2)
[10:25:04] [PASSED] 0x56B1 (DG2)
[10:25:04] [PASSED] 0x56BA (DG2)
[10:25:04] [PASSED] 0x56BB (DG2)
[10:25:04] [PASSED] 0x56BC (DG2)
[10:25:04] [PASSED] 0x56BD (DG2)
[10:25:04] [PASSED] 0x5693 (DG2)
[10:25:04] [PASSED] 0x5694 (DG2)
[10:25:04] [PASSED] 0x5695 (DG2)
[10:25:04] [PASSED] 0x56A3 (DG2)
[10:25:04] [PASSED] 0x56A4 (DG2)
[10:25:04] [PASSED] 0x56B2 (DG2)
[10:25:04] [PASSED] 0x56B3 (DG2)
[10:25:04] [PASSED] 0x5696 (DG2)
[10:25:04] [PASSED] 0x5697 (DG2)
[10:25:04] [PASSED] 0xB69 (PVC)
[10:25:04] [PASSED] 0xB6E (PVC)
[10:25:04] [PASSED] 0xBD4 (PVC)
[10:25:04] [PASSED] 0xBD5 (PVC)
[10:25:04] [PASSED] 0xBD6 (PVC)
[10:25:04] [PASSED] 0xBD7 (PVC)
[10:25:04] [PASSED] 0xBD8 (PVC)
[10:25:04] [PASSED] 0xBD9 (PVC)
[10:25:04] [PASSED] 0xBDA (PVC)
[10:25:04] [PASSED] 0xBDB (PVC)
[10:25:04] [PASSED] 0xBE0 (PVC)
[10:25:04] [PASSED] 0xBE1 (PVC)
[10:25:04] [PASSED] 0xBE5 (PVC)
[10:25:04] [PASSED] 0x7D40 (METEORLAKE)
[10:25:04] [PASSED] 0x7D45 (METEORLAKE)
[10:25:04] [PASSED] 0x7D55 (METEORLAKE)
[10:25:04] [PASSED] 0x7D60 (METEORLAKE)
[10:25:04] [PASSED] 0x7DD5 (METEORLAKE)
[10:25:04] [PASSED] 0x6420 (LUNARLAKE)
[10:25:04] [PASSED] 0x64A0 (LUNARLAKE)
[10:25:04] [PASSED] 0x64B0 (LUNARLAKE)
[10:25:04] [PASSED] 0xE202 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE209 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE20B (BATTLEMAGE)
[10:25:04] [PASSED] 0xE20C (BATTLEMAGE)
[10:25:04] [PASSED] 0xE20D (BATTLEMAGE)
[10:25:04] [PASSED] 0xE210 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE211 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE212 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE216 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE220 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE221 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE222 (BATTLEMAGE)
[10:25:04] [PASSED] 0xE223 (BATTLEMAGE)
[10:25:04] [PASSED] 0xB080 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB081 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB082 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB083 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB084 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB085 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB086 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB087 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB08F (PANTHERLAKE)
[10:25:04] [PASSED] 0xB090 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB0A0 (PANTHERLAKE)
[10:25:04] [PASSED] 0xB0B0 (PANTHERLAKE)
[10:25:04] [PASSED] 0xFD80 (PANTHERLAKE)
[10:25:04] [PASSED] 0xFD81 (PANTHERLAKE)
[10:25:04] [PASSED] 0xD740 (NOVALAKE_S)
[10:25:04] [PASSED] 0xD741 (NOVALAKE_S)
[10:25:04] [PASSED] 0xD742 (NOVALAKE_S)
[10:25:04] [PASSED] 0xD743 (NOVALAKE_S)
[10:25:04] [PASSED] 0xD745 (NOVALAKE_S)
[10:25:04] [PASSED] 0xD74A (NOVALAKE_S)
[10:25:04] [PASSED] 0xD74B (NOVALAKE_S)
[10:25:04] [PASSED] 0x674C (CRESCENTISLAND)
[10:25:04] [PASSED] 0x674D (CRESCENTISLAND)
[10:25:04] [PASSED] 0x674E (CRESCENTISLAND)
[10:25:04] [PASSED] 0x674F (CRESCENTISLAND)
[10:25:04] [PASSED] 0x6750 (CRESCENTISLAND)
[10:25:04] [PASSED] 0xD750 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD751 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD752 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD753 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD754 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD755 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD756 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD757 (NOVALAKE_P)
[10:25:04] [PASSED] 0xD75F (NOVALAKE_P)
[10:25:04] =============== [PASSED] check_platform_desc ===============
[10:25:04] ===================== [PASSED] xe_pci ======================
[10:25:04] ============= xe_rtp_tables_test (5 subtests) ==============
[10:25:04] ================== xe_rtp_table_gt_test  ===================
[10:25:04] [PASSED] gt_was/14011060649
[10:25:04] [PASSED] gt_was/14011059788
[10:25:04] [PASSED] gt_was/14015795083
[10:25:04] [PASSED] gt_was/16021867713
[10:25:04] [PASSED] gt_was/14019449301
[10:25:04] [PASSED] gt_was/16028005424
[10:25:04] [PASSED] gt_was/14026578760
[10:25:04] [PASSED] gt_was/1409420604
[10:25:04] [PASSED] gt_was/1408615072
[10:25:04] [PASSED] gt_was/22010523718
[10:25:04] [PASSED] gt_was/14011006942
[10:25:04] [PASSED] gt_was/14014830051
[10:25:04] [PASSED] gt_was/18018781329
[10:25:04] [PASSED] gt_was/1509235366
[10:25:04] [PASSED] gt_was/18018781329
[10:25:04] [PASSED] gt_was/16016694945
[10:25:04] [PASSED] gt_was/14018575942
[10:25:04] [PASSED] gt_was/22016670082
[10:25:04] [PASSED] gt_was/22016670082
[10:25:04] [PASSED] gt_was/14017421178
[10:25:04] [PASSED] gt_was/16025250150
[10:25:04] [PASSED] gt_was/14021871409
[10:25:04] [PASSED] gt_was/16021865536
[10:25:04] [PASSED] gt_was/14021486841
[10:25:04] [PASSED] gt_was/14025160223
[10:25:04] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[10:25:04] [PASSED] gt_was/14025635424
[10:25:04] [PASSED] gt_was/16028005424
[10:25:04] ============== [PASSED] xe_rtp_table_gt_test ===============
[10:25:04] ================== xe_rtp_table_gt_test  ===================
[10:25:04] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[10:25:04] [PASSED] gt_tunings/Tuning: 32B Access Enable
[10:25:04] [PASSED] gt_tunings/Tuning: L3 cache
[10:25:04] [PASSED] gt_tunings/Tuning: L3 cache - media
[10:25:04] [PASSED] gt_tunings/Tuning: Compression Overfetch
[10:25:04] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[10:25:04] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[10:25:04] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[10:25:04] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[10:25:04] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[10:25:04] [PASSED] gt_tunings/Tuning: Stateless compression control
[10:25:04] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[10:25:04] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[10:25:04] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[10:25:04] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[10:25:04] ============== [PASSED] xe_rtp_table_gt_test ===============
[10:25:04] ================== xe_rtp_table_oob_test  ==================
[10:25:04] [PASSED] oob_was/1607983814
[10:25:04] [PASSED] oob_was/16010904313
[10:25:04] [PASSED] oob_was/18022495364
[10:25:04] [PASSED] oob_was/22012773006
[10:25:04] [PASSED] oob_was/14014475959
[10:25:04] [PASSED] oob_was/22011391025
[10:25:04] [PASSED] oob_was/22012727170
[10:25:04] [PASSED] oob_was/22012727685
[10:25:04] [PASSED] oob_was/22016596838
[10:25:04] [PASSED] oob_was/18020744125
[10:25:04] [PASSED] oob_was/1409600907
[10:25:04] [PASSED] oob_was/22014953428
[10:25:04] [PASSED] oob_was/16017236439
[10:25:04] [PASSED] oob_was/14019821291
[10:25:04] [PASSED] oob_was/14015076503
[10:25:04] [PASSED] oob_was/14018913170
[10:25:04] [PASSED] oob_was/14018094691
[10:25:04] [PASSED] oob_was/18024947630
[10:25:04] [PASSED] oob_was/16022287689
[10:25:04] [PASSED] oob_was/13011645652
[10:25:04] [PASSED] oob_was/14022293748
[10:25:04] [PASSED] oob_was/22019794406
[10:25:04] [PASSED] oob_was/22019338487
[10:25:04] [PASSED] oob_was/16023588340
[10:25:04] [PASSED] oob_was/14019789679
[10:25:04] [PASSED] oob_was/14022866841
[10:25:04] [PASSED] oob_was/16021333562
[10:25:04] [PASSED] oob_was/14016712196
[10:25:04] [PASSED] oob_was/14015568240
[10:25:04] [PASSED] oob_was/18013179988
[10:25:04] [PASSED] oob_was/1508761755
[10:25:04] [PASSED] oob_was/16023105232
[10:25:04] [PASSED] oob_was/16026508708
[10:25:04] [PASSED] oob_was/14020001231
[10:25:04] [PASSED] oob_was/16023683509
[10:25:04] [PASSED] oob_was/14025515070
[10:25:04] [PASSED] oob_was/15015404425_disable
[10:25:04] [PASSED] oob_was/16026007364
[10:25:04] [PASSED] oob_was/14020316580
[10:25:04] [PASSED] oob_was/14025883347
[10:25:04] [PASSED] oob_was/16029380221
[10:25:04] [PASSED] oob_was/22022079272
[10:25:04] [PASSED] oob_was/16029897822
[10:25:04] [PASSED] oob_was/14027054324
[10:25:04] ============== [PASSED] xe_rtp_table_oob_test ==============
[10:25:04] ================ xe_rtp_table_dev_oob_test  ================
[10:25:04] [PASSED] device_oob_was/22010954014
[10:25:04] [PASSED] device_oob_was/15015404425
[10:25:04] [PASSED] device_oob_was/22019338487_display
[10:25:04] [PASSED] device_oob_was/14022085890
[10:25:04] [PASSED] device_oob_was/14026539277
[10:25:04] [PASSED] device_oob_was/14026633728
[10:25:04] [PASSED] device_oob_was/14026746987
[10:25:04] [PASSED] device_oob_was/14026779378
[10:25:04] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[10:25:04] ========== xe_rtp_table_missing_upper_bound_test  ==========
[10:25:04] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[10:25:04] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[10:25:04] [PASSED] register_whitelist/1806527549
[10:25:04] [PASSED] register_whitelist/allow_read_ctx_timestamp
[10:25:04] [PASSED] register_whitelist/allow_read_queue_timestamp
[10:25:04] [PASSED] register_whitelist/16014440446
[10:25:04] [PASSED] register_whitelist/16017236439
[10:25:04] [PASSED] register_whitelist/16020183090
[10:25:04] [PASSED] register_whitelist/14024997852
[10:25:04] [PASSED] register_whitelist/14024997852
[10:25:04] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[10:25:04] =============== [PASSED] xe_rtp_tables_test ================
[10:25:04] =================== xe_rtp (3 subtests) ====================
[10:25:04] =================== xe_rtp_rules_tests  ====================
[10:25:04] [PASSED] no
[10:25:04] [PASSED] yes
[10:25:04] [PASSED] no-and-no
[10:25:04] [PASSED] no-and-yes
[10:25:04] [PASSED] yes-and-no
[10:25:04] [PASSED] yes-and-yes
[10:25:04] [PASSED] no-or-no
[10:25:04] [PASSED] no-or-yes
[10:25:04] [PASSED] yes-or-no
[10:25:04] [PASSED] yes-or-yes
[10:25:04] [PASSED] no-yes-or-yes-no
[10:25:04] [PASSED] no-yes-or-yes-yes
[10:25:04] [PASSED] yes-yes-or-no-yes
[10:25:04] [PASSED] yes-yes-or-yes-yes
[10:25:04] [PASSED] no-no-or-yes-or-no
[10:25:04] [PASSED] or
[10:25:04] [PASSED] or-yes
[10:25:04] [PASSED] or-no
[10:25:04] [PASSED] yes-or
[10:25:04] [PASSED] no-or
[10:25:04] [PASSED] no-or-or-yes
[10:25:04] [PASSED] yes-or-or-no
[10:25:04] [PASSED] no-or-or-no
[10:25:04] [PASSED] missing-context-engine-class
[10:25:04] [PASSED] missing-context-engine-class-or-yes
[10:25:04] [PASSED] missing-context-engine-class-or-or-yes
[10:25:04] =============== [PASSED] xe_rtp_rules_tests ================
[10:25:04] =============== xe_rtp_process_to_sr_tests  ================
[10:25:04] [PASSED] coalesce-same-reg
[10:25:04] [PASSED] coalesce-same-reg-literal-and-func
[10:25:04] [PASSED] no-match-no-add
[10:25:04] [PASSED] two-regs-two-entries
[10:25:04] [PASSED] clr-one-set-other
[10:25:04] [PASSED] set-field
[10:25:04] [PASSED] conflict-duplicate
[10:25:04] [PASSED] conflict-not-disjoint
[10:25:04] [PASSED] conflict-not-disjoint-literal-and-func
[10:25:04] [PASSED] conflict-reg-type
[10:25:04] [PASSED] bad-mcr-reg-forced-to-regular
[10:25:04] [PASSED] bad-regular-reg-forced-to-mcr
[10:25:04] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[10:25:04] ================== xe_rtp_process_tests  ===================
[10:25:04] [PASSED] active1
[10:25:04] [PASSED] active2
[10:25:04] [PASSED] active-inactive
[10:25:04] [PASSED] inactive-active
[10:25:04] [PASSED] inactive-active-inactive
[10:25:04] [PASSED] inactive-inactive-inactive
[10:25:04] ============== [PASSED] xe_rtp_process_tests ===============
[10:25:04] ===================== [PASSED] xe_rtp ======================
[10:25:04] ==================== xe_wa (1 subtest) =====================
[10:25:04] ======================== xe_wa_gt  =========================
[10:25:04] [PASSED] TIGERLAKE B0
[10:25:04] [PASSED] DG1 A0
[10:25:04] [PASSED] DG1 B0
[10:25:04] [PASSED] ALDERLAKE_S A0
[10:25:04] [PASSED] ALDERLAKE_S B0
[10:25:04] [PASSED] ALDERLAKE_S C0
[10:25:04] [PASSED] ALDERLAKE_S D0
[10:25:04] [PASSED] ALDERLAKE_P A0
[10:25:04] [PASSED] ALDERLAKE_P B0
[10:25:04] [PASSED] ALDERLAKE_P C0
[10:25:04] [PASSED] ALDERLAKE_S RPLS D0
[10:25:04] [PASSED] ALDERLAKE_P RPLU E0
[10:25:04] [PASSED] DG2 G10 C0
[10:25:04] [PASSED] DG2 G11 B1
[10:25:04] [PASSED] DG2 G12 A1
[10:25:04] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[10:25:04] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[10:25:04] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[10:25:04] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[10:25:04] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[10:25:04] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[10:25:04] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[10:25:04] ==================== [PASSED] xe_wa_gt =====================
[10:25:04] ====================== [PASSED] xe_wa ======================
[10:25:04] ============================================================
[10:25:04] Testing complete. Ran 789 tests: passed: 761, skipped: 28
[10:25:04] Elapsed time: 37.688s total, 4.359s configuring, 32.612s building, 0.684s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:25:05] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:25:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:25:32] Starting KUnit Kernel (1/1)...
[10:25:32] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:25:32] ============ drm_test_pick_cmdline (2 subtests) ============
[10:25:32] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:25:32] =============== drm_test_pick_cmdline_named  ===============
[10:25:32] [PASSED] NTSC
[10:25:32] [PASSED] NTSC-J
[10:25:32] [PASSED] PAL
[10:25:32] [PASSED] PAL-M
[10:25:32] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:25:32] ============== [PASSED] drm_test_pick_cmdline ==============
[10:25:32] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[10:25:32] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[10:25:32] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[10:25:32] =========== drm_validate_clone_mode (2 subtests) ===========
[10:25:32] ============== drm_test_check_in_clone_mode  ===============
[10:25:32] [PASSED] in_clone_mode
[10:25:32] [PASSED] not_in_clone_mode
[10:25:32] ========== [PASSED] drm_test_check_in_clone_mode ===========
[10:25:32] =============== drm_test_check_valid_clones  ===============
[10:25:32] [PASSED] not_in_clone_mode
[10:25:32] [PASSED] valid_clone
[10:25:32] [PASSED] invalid_clone
[10:25:32] =========== [PASSED] drm_test_check_valid_clones ===========
[10:25:32] ============= [PASSED] drm_validate_clone_mode =============
[10:25:32] ============= drm_validate_modeset (1 subtest) =============
[10:25:32] [PASSED] drm_test_check_connector_changed_modeset
[10:25:32] ============== [PASSED] drm_validate_modeset ===============
[10:25:32] ====== drm_test_bridge_get_current_state (1 subtest) =======
[10:25:32] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[10:25:32] ======== [PASSED] drm_test_bridge_get_current_state ========
[10:25:32] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[10:25:32] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[10:25:32] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[10:25:32] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[10:25:32] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[10:25:32] ============== drm_bridge_alloc (2 subtests) ===============
[10:25:32] [PASSED] drm_test_drm_bridge_alloc_basic
[10:25:32] [PASSED] drm_test_drm_bridge_alloc_get_put
[10:25:32] ================ [PASSED] drm_bridge_alloc =================
[10:25:32] ============= drm_bridge_bus_fmt (5 subtests) ==============
[10:25:32] [PASSED] drm_test_bridge_rgb_yuv_rgb
[10:25:32] [PASSED] drm_test_bridge_must_convert_to_yuv444
[10:25:32] [PASSED] drm_test_bridge_hdmi_auto_rgb
[10:25:32] [PASSED] drm_test_bridge_auto_first
[10:25:32] [PASSED] drm_test_bridge_rgb_yuv_no_path
[10:25:32] =============== [PASSED] drm_bridge_bus_fmt ================
[10:25:32] ============= drm_cmdline_parser (40 subtests) =============
[10:25:32] [PASSED] drm_test_cmdline_force_d_only
[10:25:32] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:25:32] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:25:32] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:25:32] [PASSED] drm_test_cmdline_force_e_only
[10:25:32] [PASSED] drm_test_cmdline_res
[10:25:32] [PASSED] drm_test_cmdline_res_vesa
[10:25:32] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:25:32] [PASSED] drm_test_cmdline_res_rblank
[10:25:32] [PASSED] drm_test_cmdline_res_bpp
[10:25:32] [PASSED] drm_test_cmdline_res_refresh
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:25:32] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:25:32] [PASSED] drm_test_cmdline_res_margins_force_on
[10:25:32] [PASSED] drm_test_cmdline_res_vesa_margins
[10:25:32] [PASSED] drm_test_cmdline_name
[10:25:32] [PASSED] drm_test_cmdline_name_bpp
[10:25:32] [PASSED] drm_test_cmdline_name_option
[10:25:32] [PASSED] drm_test_cmdline_name_bpp_option
[10:25:32] [PASSED] drm_test_cmdline_rotate_0
[10:25:32] [PASSED] drm_test_cmdline_rotate_90
[10:25:32] [PASSED] drm_test_cmdline_rotate_180
[10:25:32] [PASSED] drm_test_cmdline_rotate_270
[10:25:32] [PASSED] drm_test_cmdline_hmirror
[10:25:32] [PASSED] drm_test_cmdline_vmirror
[10:25:32] [PASSED] drm_test_cmdline_margin_options
[10:25:32] [PASSED] drm_test_cmdline_multiple_options
[10:25:32] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:25:32] [PASSED] drm_test_cmdline_extra_and_option
[10:25:32] [PASSED] drm_test_cmdline_freestanding_options
[10:25:32] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:25:32] [PASSED] drm_test_cmdline_panel_orientation
[10:25:32] ================ drm_test_cmdline_invalid  =================
[10:25:32] [PASSED] margin_only
[10:25:32] [PASSED] interlace_only
[10:25:32] [PASSED] res_missing_x
[10:25:32] [PASSED] res_missing_y
[10:25:32] [PASSED] res_bad_y
[10:25:32] [PASSED] res_missing_y_bpp
[10:25:32] [PASSED] res_bad_bpp
[10:25:32] [PASSED] res_bad_refresh
[10:25:32] [PASSED] res_bpp_refresh_force_on_off
[10:25:32] [PASSED] res_invalid_mode
[10:25:32] [PASSED] res_bpp_wrong_place_mode
[10:25:32] [PASSED] name_bpp_refresh
[10:25:32] [PASSED] name_refresh
[10:25:32] [PASSED] name_refresh_wrong_mode
[10:25:32] [PASSED] name_refresh_invalid_mode
[10:25:32] [PASSED] rotate_multiple
[10:25:32] [PASSED] rotate_invalid_val
[10:25:32] [PASSED] rotate_truncated
[10:25:32] [PASSED] invalid_option
[10:25:32] [PASSED] invalid_tv_option
[10:25:32] [PASSED] truncated_tv_option
[10:25:32] ============ [PASSED] drm_test_cmdline_invalid =============
[10:25:32] =============== drm_test_cmdline_tv_options  ===============
[10:25:32] [PASSED] NTSC
[10:25:32] [PASSED] NTSC_443
[10:25:32] [PASSED] NTSC_J
[10:25:32] [PASSED] PAL
[10:25:32] [PASSED] PAL_M
[10:25:32] [PASSED] PAL_N
[10:25:32] [PASSED] SECAM
[10:25:32] [PASSED] MONO_525
[10:25:32] [PASSED] MONO_625
[10:25:32] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:25:32] =============== [PASSED] drm_cmdline_parser ================
[10:25:32] ========== drmm_connector_hdmi_init (20 subtests) ==========
[10:25:32] [PASSED] drm_test_connector_hdmi_init_valid
[10:25:32] [PASSED] drm_test_connector_hdmi_init_bpc_8
[10:25:32] [PASSED] drm_test_connector_hdmi_init_bpc_10
[10:25:32] [PASSED] drm_test_connector_hdmi_init_bpc_12
[10:25:32] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[10:25:32] [PASSED] drm_test_connector_hdmi_init_bpc_null
[10:25:32] [PASSED] drm_test_connector_hdmi_init_formats_empty
[10:25:32] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[10:25:32] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[10:25:32] [PASSED] supported_formats=0x9 yuv420_allowed=1
[10:25:32] [PASSED] supported_formats=0x9 yuv420_allowed=0
[10:25:32] [PASSED] supported_formats=0x5 yuv420_allowed=1
[10:25:32] [PASSED] supported_formats=0x5 yuv420_allowed=0
[10:25:32] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[10:25:32] [PASSED] drm_test_connector_hdmi_init_null_ddc
[10:25:32] [PASSED] drm_test_connector_hdmi_init_null_product
[10:25:32] [PASSED] drm_test_connector_hdmi_init_null_vendor
[10:25:32] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[10:25:32] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[10:25:32] [PASSED] drm_test_connector_hdmi_init_product_valid
[10:25:32] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[10:25:32] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[10:25:32] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[10:25:32] ========= drm_test_connector_hdmi_init_type_valid  =========
[10:25:32] [PASSED] HDMI-A
[10:25:32] [PASSED] HDMI-B
[10:25:32] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[10:25:32] ======== drm_test_connector_hdmi_init_type_invalid  ========
[10:25:32] [PASSED] Unknown
[10:25:32] [PASSED] VGA
[10:25:32] [PASSED] DVI-I
[10:25:32] [PASSED] DVI-D
[10:25:32] [PASSED] DVI-A
[10:25:32] [PASSED] Composite
[10:25:32] [PASSED] SVIDEO
[10:25:32] [PASSED] LVDS
[10:25:32] [PASSED] Component
[10:25:32] [PASSED] DIN
[10:25:32] [PASSED] DP
[10:25:32] [PASSED] TV
[10:25:32] [PASSED] eDP
[10:25:32] [PASSED] Virtual
[10:25:32] [PASSED] DSI
[10:25:32] [PASSED] DPI
[10:25:32] [PASSED] Writeback
[10:25:32] [PASSED] SPI
[10:25:32] [PASSED] USB
[10:25:32] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[10:25:32] ============ [PASSED] drmm_connector_hdmi_init =============
[10:25:32] ============= drmm_connector_init (3 subtests) =============
[10:25:32] [PASSED] drm_test_drmm_connector_init
[10:25:32] [PASSED] drm_test_drmm_connector_init_null_ddc
[10:25:32] ========= drm_test_drmm_connector_init_type_valid  =========
[10:25:32] [PASSED] Unknown
[10:25:32] [PASSED] VGA
[10:25:32] [PASSED] DVI-I
[10:25:32] [PASSED] DVI-D
[10:25:32] [PASSED] DVI-A
[10:25:32] [PASSED] Composite
[10:25:32] [PASSED] SVIDEO
[10:25:32] [PASSED] LVDS
[10:25:32] [PASSED] Component
[10:25:32] [PASSED] DIN
[10:25:32] [PASSED] DP
[10:25:32] [PASSED] HDMI-A
[10:25:32] [PASSED] HDMI-B
[10:25:32] [PASSED] TV
[10:25:32] [PASSED] eDP
[10:25:32] [PASSED] Virtual
[10:25:32] [PASSED] DSI
[10:25:32] [PASSED] DPI
[10:25:32] [PASSED] Writeback
[10:25:32] [PASSED] SPI
[10:25:32] [PASSED] USB
[10:25:32] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[10:25:32] =============== [PASSED] drmm_connector_init ===============
[10:25:32] ========= drm_connector_dynamic_init (6 subtests) ==========
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_init
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_init_properties
[10:25:32] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[10:25:32] [PASSED] Unknown
[10:25:32] [PASSED] VGA
[10:25:32] [PASSED] DVI-I
[10:25:32] [PASSED] DVI-D
[10:25:32] [PASSED] DVI-A
[10:25:32] [PASSED] Composite
[10:25:32] [PASSED] SVIDEO
[10:25:32] [PASSED] LVDS
[10:25:32] [PASSED] Component
[10:25:32] [PASSED] DIN
[10:25:32] [PASSED] DP
[10:25:32] [PASSED] HDMI-A
[10:25:32] [PASSED] HDMI-B
[10:25:32] [PASSED] TV
[10:25:32] [PASSED] eDP
[10:25:32] [PASSED] Virtual
[10:25:32] [PASSED] DSI
[10:25:32] [PASSED] DPI
[10:25:32] [PASSED] Writeback
[10:25:32] [PASSED] SPI
[10:25:32] [PASSED] USB
[10:25:32] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[10:25:32] ======== drm_test_drm_connector_dynamic_init_name  =========
[10:25:32] [PASSED] Unknown
[10:25:32] [PASSED] VGA
[10:25:32] [PASSED] DVI-I
[10:25:32] [PASSED] DVI-D
[10:25:32] [PASSED] DVI-A
[10:25:32] [PASSED] Composite
[10:25:32] [PASSED] SVIDEO
[10:25:32] [PASSED] LVDS
[10:25:32] [PASSED] Component
[10:25:32] [PASSED] DIN
[10:25:32] [PASSED] DP
[10:25:32] [PASSED] HDMI-A
[10:25:32] [PASSED] HDMI-B
[10:25:32] [PASSED] TV
[10:25:32] [PASSED] eDP
[10:25:32] [PASSED] Virtual
[10:25:32] [PASSED] DSI
[10:25:32] [PASSED] DPI
[10:25:32] [PASSED] Writeback
[10:25:32] [PASSED] SPI
[10:25:32] [PASSED] USB
[10:25:32] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[10:25:32] =========== [PASSED] drm_connector_dynamic_init ============
[10:25:32] ==== drm_connector_dynamic_register_early (4 subtests) =====
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[10:25:32] ====== [PASSED] drm_connector_dynamic_register_early =======
[10:25:32] ======= drm_connector_dynamic_register (7 subtests) ========
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[10:25:32] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[10:25:32] ========= [PASSED] drm_connector_dynamic_register ==========
[10:25:32] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[10:25:32] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[10:25:32] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[10:25:32] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[10:25:32] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[10:25:32] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:25:32] [PASSED] NTSC
[10:25:32] [PASSED] NTSC-443
[10:25:32] [PASSED] NTSC-J
[10:25:32] [PASSED] PAL
[10:25:32] [PASSED] PAL-M
[10:25:32] [PASSED] PAL-N
[10:25:32] [PASSED] SECAM
[10:25:32] [PASSED] Mono
[10:25:32] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:25:32] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:25:32] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:25:32] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[10:25:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[10:25:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[10:25:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[10:25:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[10:25:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[10:25:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[10:25:32] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[10:25:32] [PASSED] VIC 96
[10:25:32] [PASSED] VIC 97
[10:25:32] [PASSED] VIC 101
[10:25:32] [PASSED] VIC 102
[10:25:32] [PASSED] VIC 106
[10:25:32] [PASSED] VIC 107
[10:25:32] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[10:25:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[10:25:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[10:25:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[10:25:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[10:25:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[10:25:32] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[10:25:32] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[10:25:32] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[10:25:32] [PASSED] Automatic
[10:25:32] [PASSED] Full
[10:25:32] [PASSED] Limited 16:235
[10:25:32] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[10:25:32] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[10:25:32] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[10:25:32] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[10:25:32] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[10:25:32] [PASSED] RGB
[10:25:32] [PASSED] YUV 4:2:0
[10:25:32] [PASSED] YUV 4:2:2
[10:25:32] [PASSED] YUV 4:4:4
[10:25:32] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[10:25:32] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[10:25:32] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[10:25:32] ============= drm_damage_helper (21 subtests) ==============
[10:25:32] [PASSED] drm_test_damage_iter_no_damage
[10:25:32] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:25:32] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:25:32] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:25:32] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:25:32] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:25:32] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:25:32] [PASSED] drm_test_damage_iter_simple_damage
[10:25:32] [PASSED] drm_test_damage_iter_single_damage
[10:25:32] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:25:32] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:25:32] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:25:32] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:25:32] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:25:32] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:25:32] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:25:32] [PASSED] drm_test_damage_iter_damage
[10:25:32] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:25:32] [PASSED] drm_test_damage_iter_damage_one_outside
[10:25:32] [PASSED] drm_test_damage_iter_damage_src_moved
[10:25:32] [PASSED] drm_test_damage_iter_damage_not_visible
[10:25:32] ================ [PASSED] drm_damage_helper ================
[10:25:32] ============== drm_dp_mst_helper (3 subtests) ==============
[10:25:32] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:25:32] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:25:32] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:25:32] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:25:32] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:25:32] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:25:32] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:25:32] ============== drm_test_dp_mst_calc_pbn_div  ===============
[10:25:32] [PASSED] Link rate 2000000 lane count 4
[10:25:32] [PASSED] Link rate 2000000 lane count 2
[10:25:32] [PASSED] Link rate 2000000 lane count 1
[10:25:32] [PASSED] Link rate 1350000 lane count 4
[10:25:32] [PASSED] Link rate 1350000 lane count 2
[10:25:32] [PASSED] Link rate 1350000 lane count 1
[10:25:32] [PASSED] Link rate 1000000 lane count 4
[10:25:32] [PASSED] Link rate 1000000 lane count 2
[10:25:32] [PASSED] Link rate 1000000 lane count 1
[10:25:32] [PASSED] Link rate 810000 lane count 4
[10:25:32] [PASSED] Link rate 810000 lane count 2
[10:25:32] [PASSED] Link rate 810000 lane count 1
[10:25:32] [PASSED] Link rate 540000 lane count 4
[10:25:32] [PASSED] Link rate 540000 lane count 2
[10:25:32] [PASSED] Link rate 540000 lane count 1
[10:25:32] [PASSED] Link rate 270000 lane count 4
[10:25:32] [PASSED] Link rate 270000 lane count 2
[10:25:32] [PASSED] Link rate 270000 lane count 1
[10:25:32] [PASSED] Link rate 162000 lane count 4
[10:25:32] [PASSED] Link rate 162000 lane count 2
[10:25:32] [PASSED] Link rate 162000 lane count 1
[10:25:32] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[10:25:32] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:25:32] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:25:32] [PASSED] DP_POWER_UP_PHY with port number
[10:25:32] [PASSED] DP_POWER_DOWN_PHY with port number
[10:25:32] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:25:32] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:25:32] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:25:32] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:25:32] [PASSED] DP_QUERY_PAYLOAD with port number
[10:25:32] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:25:32] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:25:32] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:25:32] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:25:32] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:25:32] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:25:32] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:25:32] [PASSED] DP_REMOTE_I2C_READ with port number
[10:25:32] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:25:32] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:25:32] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:25:32] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:25:32] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:25:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:25:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:25:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:25:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:25:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:25:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:25:32] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:25:32] ================ [PASSED] drm_dp_mst_helper ================
[10:25:32] ================== drm_exec (7 subtests) ===================
[10:25:32] [PASSED] sanitycheck
[10:25:32] [PASSED] test_lock
[10:25:32] [PASSED] test_lock_unlock
[10:25:32] [PASSED] test_duplicates
[10:25:32] [PASSED] test_prepare
[10:25:32] [PASSED] test_prepare_array
[10:25:32] [PASSED] test_multiple_loops
[10:25:32] ==================== [PASSED] drm_exec =====================
[10:25:32] =========== drm_format_helper_test (17 subtests) ===========
[10:25:32] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:25:32] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:25:32] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:25:32] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:25:32] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:25:32] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:25:32] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:25:32] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[10:25:32] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:25:32] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:25:32] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:25:32] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:25:32] ==================== drm_test_fb_swab  =====================
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ================ [PASSED] drm_test_fb_swab =================
[10:25:32] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[10:25:32] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[10:25:32] [PASSED] single_pixel_source_buffer
[10:25:32] [PASSED] single_pixel_clip_rectangle
[10:25:32] [PASSED] well_known_colors
[10:25:32] [PASSED] destination_pitch
[10:25:32] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[10:25:32] ================= drm_test_fb_clip_offset  =================
[10:25:32] [PASSED] pass through
[10:25:32] [PASSED] horizontal offset
[10:25:32] [PASSED] vertical offset
[10:25:32] [PASSED] horizontal and vertical offset
[10:25:32] [PASSED] horizontal offset (custom pitch)
[10:25:32] [PASSED] vertical offset (custom pitch)
[10:25:32] [PASSED] horizontal and vertical offset (custom pitch)
[10:25:32] ============= [PASSED] drm_test_fb_clip_offset =============
[10:25:32] =================== drm_test_fb_memcpy  ====================
[10:25:32] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[10:25:32] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[10:25:32] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[10:25:32] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[10:25:32] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[10:25:32] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[10:25:32] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[10:25:32] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[10:25:32] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[10:25:32] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[10:25:32] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[10:25:32] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[10:25:32] =============== [PASSED] drm_test_fb_memcpy ================
[10:25:32] ============= [PASSED] drm_format_helper_test ==============
[10:25:32] ================= drm_format (18 subtests) =================
[10:25:32] [PASSED] drm_test_format_block_width_invalid
[10:25:32] [PASSED] drm_test_format_block_width_one_plane
[10:25:32] [PASSED] drm_test_format_block_width_two_plane
[10:25:32] [PASSED] drm_test_format_block_width_three_plane
[10:25:32] [PASSED] drm_test_format_block_width_tiled
[10:25:32] [PASSED] drm_test_format_block_height_invalid
[10:25:32] [PASSED] drm_test_format_block_height_one_plane
[10:25:32] [PASSED] drm_test_format_block_height_two_plane
[10:25:32] [PASSED] drm_test_format_block_height_three_plane
[10:25:32] [PASSED] drm_test_format_block_height_tiled
[10:25:32] [PASSED] drm_test_format_min_pitch_invalid
[10:25:32] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:25:32] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:25:32] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:25:32] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:25:32] [PASSED] drm_test_format_min_pitch_two_plane
[10:25:32] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:25:32] [PASSED] drm_test_format_min_pitch_tiled
[10:25:32] =================== [PASSED] drm_format ====================
[10:25:32] ============== drm_framebuffer (10 subtests) ===============
[10:25:32] ========== drm_test_framebuffer_check_src_coords  ==========
[10:25:32] [PASSED] Success: source fits into fb
[10:25:32] [PASSED] Fail: overflowing fb with x-axis coordinate
[10:25:32] [PASSED] Fail: overflowing fb with y-axis coordinate
[10:25:32] [PASSED] Fail: overflowing fb with source width
[10:25:32] [PASSED] Fail: overflowing fb with source height
[10:25:32] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[10:25:32] [PASSED] drm_test_framebuffer_cleanup
[10:25:32] =============== drm_test_framebuffer_create  ===============
[10:25:32] [PASSED] ABGR8888 normal sizes
[10:25:32] [PASSED] ABGR8888 max sizes
[10:25:32] [PASSED] ABGR8888 pitch greater than min required
[10:25:32] [PASSED] ABGR8888 pitch less than min required
[10:25:32] [PASSED] ABGR8888 Invalid width
[10:25:32] [PASSED] ABGR8888 Invalid buffer handle
[10:25:32] [PASSED] No pixel format
[10:25:32] [PASSED] ABGR8888 Width 0
[10:25:32] [PASSED] ABGR8888 Height 0
[10:25:32] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:25:32] [PASSED] ABGR8888 Large buffer offset
[10:25:32] [PASSED] ABGR8888 Buffer offset for inexistent plane
[10:25:32] [PASSED] ABGR8888 Invalid flag
[10:25:32] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:25:32] [PASSED] ABGR8888 Valid buffer modifier
[10:25:32] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:25:32] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:25:32] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:25:32] [PASSED] NV12 Normal sizes
[10:25:32] [PASSED] NV12 Max sizes
[10:25:32] [PASSED] NV12 Invalid pitch
[10:25:32] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:25:32] [PASSED] NV12 different  modifier per-plane
[10:25:32] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:25:32] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:25:32] [PASSED] NV12 Modifier for inexistent plane
[10:25:32] [PASSED] NV12 Handle for inexistent plane
[10:25:32] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:25:32] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:25:32] [PASSED] YVU420 Normal sizes
[10:25:32] [PASSED] YVU420 Max sizes
[10:25:32] [PASSED] YVU420 Invalid pitch
[10:25:32] [PASSED] YVU420 Different pitches
[10:25:32] [PASSED] YVU420 Different buffer offsets/pitches
[10:25:32] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:25:32] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:25:32] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:25:32] [PASSED] YVU420 Valid modifier
[10:25:32] [PASSED] YVU420 Different modifiers per plane
[10:25:32] [PASSED] YVU420 Modifier for inexistent plane
[10:25:32] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[10:25:32] [PASSED] X0L2 Normal sizes
[10:25:32] [PASSED] X0L2 Max sizes
[10:25:32] [PASSED] X0L2 Invalid pitch
[10:25:32] [PASSED] X0L2 Pitch greater than minimum required
[10:25:32] [PASSED] X0L2 Handle for inexistent plane
[10:25:32] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:25:32] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:25:32] [PASSED] X0L2 Valid modifier
[10:25:32] [PASSED] X0L2 Modifier for inexistent plane
[10:25:32] =========== [PASSED] drm_test_framebuffer_create ===========
[10:25:32] [PASSED] drm_test_framebuffer_free
[10:25:32] [PASSED] drm_test_framebuffer_init
[10:25:32] [PASSED] drm_test_framebuffer_init_bad_format
[10:25:32] [PASSED] drm_test_framebuffer_init_dev_mismatch
[10:25:32] [PASSED] drm_test_framebuffer_lookup
[10:25:32] [PASSED] drm_test_framebuffer_lookup_inexistent
[10:25:32] [PASSED] drm_test_framebuffer_modifiers_not_supported
[10:25:32] ================= [PASSED] drm_framebuffer =================
[10:25:32] ================ drm_gem_shmem (8 subtests) ================
[10:25:32] [PASSED] drm_gem_shmem_test_obj_create
[10:25:32] [PASSED] drm_gem_shmem_test_obj_create_private
[10:25:32] [PASSED] drm_gem_shmem_test_pin_pages
[10:25:32] [PASSED] drm_gem_shmem_test_vmap
[10:25:32] [PASSED] drm_gem_shmem_test_get_sg_table
[10:25:32] [PASSED] drm_gem_shmem_test_get_pages_sgt
[10:25:32] [PASSED] drm_gem_shmem_test_madvise
[10:25:32] [PASSED] drm_gem_shmem_test_purge
[10:25:32] ================== [PASSED] drm_gem_shmem ==================
[10:25:32] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[10:25:32] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[10:25:32] [PASSED] Automatic
[10:25:32] [PASSED] Full
[10:25:32] [PASSED] Limited 16:235
[10:25:32] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[10:25:32] [PASSED] drm_test_check_disable_connector
[10:25:32] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[10:25:32] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[10:25:32] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[10:25:32] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[10:25:32] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[10:25:32] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[10:25:32] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[10:25:32] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[10:25:32] [PASSED] drm_test_check_output_bpc_dvi
[10:25:32] [PASSED] drm_test_check_output_bpc_format_vic_1
[10:25:32] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[10:25:32] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[10:25:32] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[10:25:32] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[10:25:32] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[10:25:32] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[10:25:32] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[10:25:32] ============ drm_test_check_hdmi_color_format  =============
[10:25:32] [PASSED] AUTO -> RGB
[10:25:32] [PASSED] YCBCR422 -> YUV422
[10:25:32] [PASSED] YCBCR420 -> YUV420
[10:25:32] [PASSED] YCBCR444 -> YUV444
[10:25:32] [PASSED] RGB -> RGB
[10:25:32] ======== [PASSED] drm_test_check_hdmi_color_format =========
[10:25:32] ======== drm_test_check_hdmi_color_format_420_only  ========
[10:25:32] [PASSED] RGB should fail
[10:25:32] [PASSED] YUV444 should fail
[10:25:32] [PASSED] YUV422 should fail
[10:25:32] [PASSED] YUV420 should work
[10:25:32] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[10:25:32] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[10:25:32] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[10:25:32] [PASSED] drm_test_check_broadcast_rgb_value
[10:25:32] [PASSED] drm_test_check_bpc_8_value
[10:25:32] [PASSED] drm_test_check_bpc_10_value
[10:25:32] [PASSED] drm_test_check_bpc_12_value
[10:25:32] [PASSED] drm_test_check_format_value
[10:25:32] [PASSED] drm_test_check_tmds_char_value
[10:25:32] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[10:25:32] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[10:25:32] [PASSED] drm_test_check_mode_valid
[10:25:32] [PASSED] drm_test_check_mode_valid_reject
[10:25:32] [PASSED] drm_test_check_mode_valid_reject_rate
[10:25:32] [PASSED] drm_test_check_mode_valid_reject_max_clock
[10:25:32] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[10:25:32] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[10:25:32] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[10:25:32] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[10:25:32] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[10:25:32] [PASSED] drm_test_check_infoframes
[10:25:32] [PASSED] drm_test_check_reject_avi_infoframe
[10:25:32] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[10:25:32] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[10:25:32] [PASSED] drm_test_check_reject_audio_infoframe
[10:25:32] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[10:25:32] ================= drm_managed (2 subtests) =================
[10:25:32] [PASSED] drm_test_managed_release_action
[10:25:32] [PASSED] drm_test_managed_run_action
[10:25:32] =================== [PASSED] drm_managed ===================
[10:25:32] =================== drm_mm (6 subtests) ====================
[10:25:32] [PASSED] drm_test_mm_init
[10:25:32] [PASSED] drm_test_mm_debug
[10:25:32] [PASSED] drm_test_mm_align32
[10:25:32] [PASSED] drm_test_mm_align64
[10:25:32] [PASSED] drm_test_mm_lowest
[10:25:32] [PASSED] drm_test_mm_highest
[10:25:32] ===================== [PASSED] drm_mm ======================
[10:25:32] ============= drm_modes_analog_tv (5 subtests) =============
[10:25:32] [PASSED] drm_test_modes_analog_tv_mono_576i
[10:25:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:25:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:25:32] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:25:32] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:25:32] =============== [PASSED] drm_modes_analog_tv ===============
[10:25:32] ============== drm_plane_helper (2 subtests) ===============
[10:25:32] =============== drm_test_check_plane_state  ================
[10:25:32] [PASSED] clipping_simple
[10:25:32] [PASSED] clipping_rotate_reflect
[10:25:32] [PASSED] positioning_simple
[10:25:32] [PASSED] upscaling
[10:25:32] [PASSED] downscaling
[10:25:32] [PASSED] rounding1
[10:25:32] [PASSED] rounding2
[10:25:32] [PASSED] rounding3
[10:25:32] [PASSED] rounding4
[10:25:32] =========== [PASSED] drm_test_check_plane_state ============
[10:25:32] =========== drm_test_check_invalid_plane_state  ============
[10:25:32] [PASSED] positioning_invalid
[10:25:32] [PASSED] upscaling_invalid
[10:25:32] [PASSED] downscaling_invalid
[10:25:32] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:25:32] ================ [PASSED] drm_plane_helper =================
[10:25:32] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[10:25:32] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:25:32] [PASSED] None
[10:25:32] [PASSED] PAL
[10:25:32] [PASSED] NTSC
[10:25:32] [PASSED] Both, NTSC Default
[10:25:32] [PASSED] Both, PAL Default
[10:25:32] [PASSED] Both, NTSC Default, with PAL on command-line
[10:25:32] [PASSED] Both, PAL Default, with NTSC on command-line
[10:25:32] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:25:32] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:25:32] ================== drm_rect (9 subtests) ===================
[10:25:32] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:25:32] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:25:32] [PASSED] drm_test_rect_clip_scaled_clipped
[10:25:32] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:25:32] ================= drm_test_rect_intersect  =================
[10:25:32] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:25:32] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[10:25:32] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:25:32] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:25:32] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:25:32] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:25:32] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:25:32] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:25:32] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:25:32] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:25:32] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:25:32] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:25:32] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:25:32] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:25:32] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:25:32] ============= [PASSED] drm_test_rect_intersect =============
[10:25:32] ================ drm_test_rect_calc_hscale  ================
[10:25:32] [PASSED] normal use
[10:25:32] [PASSED] out of max range
[10:25:32] [PASSED] out of min range
[10:25:32] [PASSED] zero dst
[10:25:32] [PASSED] negative src
[10:25:32] [PASSED] negative dst
[10:25:32] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:25:32] ================ drm_test_rect_calc_vscale  ================
[10:25:32] [PASSED] normal use
[10:25:32] [PASSED] out of max range
[10:25:32] [PASSED] out of min range
[10:25:32] [PASSED] zero dst
[10:25:32] [PASSED] negative src
[10:25:32] [PASSED] negative dst
[10:25:32] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:25:32] ================== drm_test_rect_rotate  ===================
[10:25:32] [PASSED] reflect-x
[10:25:32] [PASSED] reflect-y
[10:25:32] [PASSED] rotate-0
[10:25:32] [PASSED] rotate-90
[10:25:32] [PASSED] rotate-180
[10:25:32] [PASSED] rotate-270
[10:25:32] ============== [PASSED] drm_test_rect_rotate ===============
[10:25:32] ================ drm_test_rect_rotate_inv  =================
[10:25:32] [PASSED] reflect-x
[10:25:32] [PASSED] reflect-y
[10:25:32] [PASSED] rotate-0
[10:25:32] [PASSED] rotate-90
[10:25:32] [PASSED] rotate-180
[10:25:32] [PASSED] rotate-270
[10:25:32] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:25:32] ==================== [PASSED] drm_rect =====================
[10:25:32] ============ drm_sysfb_modeset_test (1 subtest) ============
[10:25:32] ============ drm_test_sysfb_build_fourcc_list  =============
[10:25:32] [PASSED] no native formats
[10:25:32] [PASSED] XRGB8888 as native format
[10:25:32] [PASSED] remove duplicates
[10:25:32] [PASSED] convert alpha formats
[10:25:32] [PASSED] random formats
[10:25:32] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[10:25:32] ============= [PASSED] drm_sysfb_modeset_test ==============
[10:25:32] ================== drm_fixp (2 subtests) ===================
[10:25:32] [PASSED] drm_test_int2fixp
[10:25:32] [PASSED] drm_test_sm2fixp
[10:25:32] ==================== [PASSED] drm_fixp =====================
[10:25:32] ============================================================
[10:25:32] Testing complete. Ran 637 tests: passed: 637
[10:25:32] Elapsed time: 27.255s total, 1.823s configuring, 25.267s building, 0.138s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[10:25:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:25:34] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:25:44] Starting KUnit Kernel (1/1)...
[10:25:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:25:44] ================= ttm_device (5 subtests) ==================
[10:25:44] [PASSED] ttm_device_init_basic
[10:25:44] [PASSED] ttm_device_init_multiple
[10:25:44] [PASSED] ttm_device_fini_basic
[10:25:44] [PASSED] ttm_device_init_no_vma_man
[10:25:44] ================== ttm_device_init_pools  ==================
[10:25:44] [PASSED] No DMA allocations, no DMA32 required
[10:25:44] [PASSED] DMA allocations, DMA32 required
[10:25:44] [PASSED] No DMA allocations, DMA32 required
[10:25:44] [PASSED] DMA allocations, no DMA32 required
[10:25:44] ============== [PASSED] ttm_device_init_pools ==============
[10:25:44] =================== [PASSED] ttm_device ====================
[10:25:44] ================== ttm_pool (8 subtests) ===================
[10:25:44] ================== ttm_pool_alloc_basic  ===================
[10:25:44] [PASSED] One page
[10:25:44] [PASSED] More than one page
[10:25:44] [PASSED] Above the allocation limit
[10:25:44] [PASSED] One page, with coherent DMA mappings enabled
[10:25:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:25:44] ============== [PASSED] ttm_pool_alloc_basic ===============
[10:25:44] ============== ttm_pool_alloc_basic_dma_addr  ==============
[10:25:44] [PASSED] One page
[10:25:44] [PASSED] More than one page
[10:25:44] [PASSED] Above the allocation limit
[10:25:44] [PASSED] One page, with coherent DMA mappings enabled
[10:25:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:25:44] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[10:25:44] [PASSED] ttm_pool_alloc_order_caching_match
[10:25:44] [PASSED] ttm_pool_alloc_caching_mismatch
[10:25:44] [PASSED] ttm_pool_alloc_order_mismatch
[10:25:44] [PASSED] ttm_pool_free_dma_alloc
[10:25:44] [PASSED] ttm_pool_free_no_dma_alloc
[10:25:44] [PASSED] ttm_pool_fini_basic
[10:25:44] ==================== [PASSED] ttm_pool =====================
[10:25:44] ================ ttm_resource (8 subtests) =================
[10:25:44] ================= ttm_resource_init_basic  =================
[10:25:44] [PASSED] Init resource in TTM_PL_SYSTEM
[10:25:44] [PASSED] Init resource in TTM_PL_VRAM
[10:25:44] [PASSED] Init resource in a private placement
[10:25:44] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[10:25:44] ============= [PASSED] ttm_resource_init_basic =============
[10:25:44] [PASSED] ttm_resource_init_pinned
[10:25:44] [PASSED] ttm_resource_fini_basic
[10:25:44] [PASSED] ttm_resource_manager_init_basic
[10:25:44] [PASSED] ttm_resource_manager_usage_basic
[10:25:44] [PASSED] ttm_resource_manager_set_used_basic
[10:25:44] [PASSED] ttm_sys_man_alloc_basic
[10:25:44] [PASSED] ttm_sys_man_free_basic
[10:25:44] ================== [PASSED] ttm_resource ===================
[10:25:44] =================== ttm_tt (15 subtests) ===================
[10:25:44] ==================== ttm_tt_init_basic  ====================
[10:25:44] [PASSED] Page-aligned size
[10:25:44] [PASSED] Extra pages requested
[10:25:44] ================ [PASSED] ttm_tt_init_basic ================
[10:25:44] [PASSED] ttm_tt_init_misaligned
[10:25:44] [PASSED] ttm_tt_fini_basic
[10:25:44] [PASSED] ttm_tt_fini_sg
[10:25:44] [PASSED] ttm_tt_fini_shmem
[10:25:44] [PASSED] ttm_tt_create_basic
[10:25:44] [PASSED] ttm_tt_create_invalid_bo_type
[10:25:44] [PASSED] ttm_tt_create_ttm_exists
[10:25:44] [PASSED] ttm_tt_create_failed
[10:25:44] [PASSED] ttm_tt_destroy_basic
[10:25:44] [PASSED] ttm_tt_populate_null_ttm
[10:25:44] [PASSED] ttm_tt_populate_populated_ttm
[10:25:44] [PASSED] ttm_tt_unpopulate_basic
[10:25:44] [PASSED] ttm_tt_unpopulate_empty_ttm
[10:25:44] [PASSED] ttm_tt_swapin_basic
[10:25:44] ===================== [PASSED] ttm_tt ======================
[10:25:44] =================== ttm_bo (14 subtests) ===================
[10:25:44] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[10:25:44] [PASSED] Cannot be interrupted and sleeps
[10:25:44] [PASSED] Cannot be interrupted, locks straight away
[10:25:44] [PASSED] Can be interrupted, sleeps
[10:25:44] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[10:25:44] [PASSED] ttm_bo_reserve_locked_no_sleep
[10:25:44] [PASSED] ttm_bo_reserve_no_wait_ticket
[10:25:44] [PASSED] ttm_bo_reserve_double_resv
[10:25:44] [PASSED] ttm_bo_reserve_interrupted
[10:25:44] [PASSED] ttm_bo_reserve_deadlock
[10:25:44] [PASSED] ttm_bo_unreserve_basic
[10:25:44] [PASSED] ttm_bo_unreserve_pinned
[10:25:44] [PASSED] ttm_bo_unreserve_bulk
[10:25:44] [PASSED] ttm_bo_fini_basic
[10:25:44] [PASSED] ttm_bo_fini_shared_resv
[10:25:44] [PASSED] ttm_bo_pin_basic
[10:25:44] [PASSED] ttm_bo_pin_unpin_resource
[10:25:44] [PASSED] ttm_bo_multiple_pin_one_unpin
[10:25:44] ===================== [PASSED] ttm_bo ======================
[10:25:44] ============== ttm_bo_validate (22 subtests) ===============
[10:25:44] ============== ttm_bo_init_reserved_sys_man  ===============
[10:25:44] [PASSED] Buffer object for userspace
[10:25:44] [PASSED] Kernel buffer object
[10:25:44] [PASSED] Shared buffer object
[10:25:44] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[10:25:44] ============== ttm_bo_init_reserved_mock_man  ==============
[10:25:44] [PASSED] Buffer object for userspace
[10:25:44] [PASSED] Kernel buffer object
[10:25:44] [PASSED] Shared buffer object
[10:25:44] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[10:25:44] [PASSED] ttm_bo_init_reserved_resv
[10:25:44] ================== ttm_bo_validate_basic  ==================
[10:25:44] [PASSED] Buffer object for userspace
[10:25:44] [PASSED] Kernel buffer object
[10:25:44] [PASSED] Shared buffer object
[10:25:44] ============== [PASSED] ttm_bo_validate_basic ==============
[10:25:44] [PASSED] ttm_bo_validate_invalid_placement
[10:25:44] ============= ttm_bo_validate_same_placement  ==============
[10:25:44] [PASSED] System manager
[10:25:44] [PASSED] VRAM manager
[10:25:44] ========= [PASSED] ttm_bo_validate_same_placement ==========
[10:25:44] [PASSED] ttm_bo_validate_failed_alloc
[10:25:44] [PASSED] ttm_bo_validate_pinned
[10:25:44] [PASSED] ttm_bo_validate_busy_placement
[10:25:44] ================ ttm_bo_validate_multihop  =================
[10:25:44] [PASSED] Buffer object for userspace
[10:25:44] [PASSED] Kernel buffer object
[10:25:44] [PASSED] Shared buffer object
[10:25:44] ============ [PASSED] ttm_bo_validate_multihop =============
[10:25:44] ========== ttm_bo_validate_no_placement_signaled  ==========
[10:25:44] [PASSED] Buffer object in system domain, no page vector
[10:25:44] [PASSED] Buffer object in system domain with an existing page vector
[10:25:44] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[10:25:44] ======== ttm_bo_validate_no_placement_not_signaled  ========
[10:25:44] [PASSED] Buffer object for userspace
[10:25:44] [PASSED] Kernel buffer object
[10:25:44] [PASSED] Shared buffer object
[10:25:44] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[10:25:44] [PASSED] ttm_bo_validate_move_fence_signaled
[10:25:44] ========= ttm_bo_validate_move_fence_not_signaled  =========
[10:25:44] [PASSED] Waits for GPU
[10:25:44] [PASSED] Tries to lock straight away
[10:25:44] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[10:25:44] [PASSED] ttm_bo_validate_swapout
[10:25:44] [PASSED] ttm_bo_validate_happy_evict
[10:25:44] [PASSED] ttm_bo_validate_all_pinned_evict
[10:25:44] [PASSED] ttm_bo_validate_allowed_only_evict
[10:25:44] [PASSED] ttm_bo_validate_deleted_evict
[10:25:44] [PASSED] ttm_bo_validate_busy_domain_evict
[10:25:44] [PASSED] ttm_bo_validate_evict_gutting
[10:25:44] [PASSED] ttm_bo_validate_recrusive_evict
[10:25:44] ================= [PASSED] ttm_bo_validate =================
[10:25:44] ============================================================
[10:25:44] Testing complete. Ran 102 tests: passed: 102
[10:25:44] Elapsed time: 12.030s total, 1.820s configuring, 9.994s building, 0.180s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[10:25:44] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:25:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:25:55] Starting KUnit Kernel (1/1)...
[10:25:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:25:55] =============== dma-buf-fence (12 subtests) ================
[10:25:55] [PASSED] test_sanitycheck
[10:25:55] [PASSED] test_signaling
[10:25:55] [PASSED] test_add_callback
[10:25:55] [PASSED] test_late_add_callback
[10:25:55] [PASSED] test_rm_callback
[10:25:55] [PASSED] test_late_rm_callback
[10:25:55] [PASSED] test_status
[10:25:55] [PASSED] test_error
[10:25:55] [PASSED] test_wait
[10:25:55] [PASSED] test_wait_timeout
[10:25:55] [PASSED] test_stub
[10:25:55] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[10:25:55] ================== [PASSED] dma-buf-fence ==================
[10:25:55] ============ dma-buf-fence-chain (11 subtests) =============
[10:25:55] [PASSED] test_sanitycheck
[10:25:55] [PASSED] test_find_seqno
[10:25:55] [PASSED] test_find_signaled
[10:25:55] [PASSED] test_find_out_of_order
[10:26:00] [PASSED] test_find_gap
[10:26:00] [PASSED] test_find_race
[10:26:00] [PASSED] test_signal_forward
[10:26:00] [PASSED] test_signal_backward
[10:26:00] [PASSED] test_wait_forward
[10:26:00] [PASSED] test_wait_backward
[10:26:00] [PASSED] test_wait_random
[10:26:00] =============== [PASSED] dma-buf-fence-chain ===============
[10:26:00] ============ dma-buf-fence-unwrap (10 subtests) ============
[10:26:00] [PASSED] test_sanitycheck
[10:26:00] [PASSED] test_unwrap_array
[10:26:00] [PASSED] test_unwrap_chain
[10:26:00] [PASSED] test_unwrap_chain_array
[10:26:00] [PASSED] test_unwrap_merge
[10:26:00] [PASSED] test_unwrap_merge_duplicate
[10:26:00] [PASSED] test_unwrap_merge_seqno
[10:26:00] [PASSED] test_unwrap_merge_order
[10:26:00] [PASSED] test_unwrap_merge_complex
[10:26:00] [PASSED] test_unwrap_merge_complex_seqno
[10:26:00] ============== [PASSED] dma-buf-fence-unwrap ===============
[10:26:00] ================ dma-buf-resv (5 subtests) =================
[10:26:00] [PASSED] test_sanitycheck
[10:26:00] ===================== test_signaling  ======================
[10:26:00] [PASSED] kernel
[10:26:00] [PASSED] write
[10:26:00] [PASSED] read
[10:26:00] [PASSED] bookkeep
[10:26:00] ================= [PASSED] test_signaling ==================
[10:26:00] ====================== test_for_each  ======================
[10:26:00] [PASSED] kernel
[10:26:00] [PASSED] write
[10:26:00] [PASSED] read
[10:26:00] [PASSED] bookkeep
[10:26:00] ================== [PASSED] test_for_each ==================
[10:26:00] ================= test_for_each_unlocked  ==================
[10:26:00] [PASSED] kernel
[10:26:00] [PASSED] write
[10:26:00] [PASSED] read
[10:26:00] [PASSED] bookkeep
[10:26:00] ============= [PASSED] test_for_each_unlocked ==============
[10:26:00] ===================== test_get_fences  =====================
[10:26:00] [PASSED] kernel
[10:26:00] [PASSED] write
[10:26:00] [PASSED] read
[10:26:00] [PASSED] bookkeep
[10:26:00] ================= [PASSED] test_get_fences =================
[10:26:00] ================== [PASSED] dma-buf-resv ===================
[10:26:00] ============================================================
[10:26:00] Testing complete. Ran 50 tests: passed: 49, skipped: 1
[10:26:00] Elapsed time: 15.853s total, 1.818s configuring, 8.663s building, 5.359s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


