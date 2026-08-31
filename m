Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5EBC624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 14:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1F010E2B7;
	Mon, 31 Aug 2026 14:37:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E90410E2A9;
 Mon, 31 Aug 2026 14:37:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/sysctrl=3A_Clean_up_err?=
 =?utf-8?q?or_handling_in_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 14:37:40 -0000
Message-ID: <178818706037.101634.16508565001637821734@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
In-Reply-To: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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

Series: drm/xe/sysctrl: Clean up error handling in (rev3)
URL   : https://patchwork.freedesktop.org/series/172513/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:36:02] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:36:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:36:39] Starting KUnit Kernel (1/1)...
[14:36:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:36:39] ============= refcount_interrupt (4 subtests) ==============
[14:36:39] [PASSED] test_single_irq_change
[14:36:39] [PASSED] test_nested_irq_change
[14:36:39] [PASSED] test_multiple_irq_change
[14:36:39] [PASSED] test_irq_save
[14:36:39] =============== [PASSED] refcount_interrupt ================
[14:36:39] ================== guc_buf (11 subtests) ===================
[14:36:39] [PASSED] test_smallest
[14:36:39] [PASSED] test_largest
[14:36:39] [PASSED] test_granular
[14:36:39] [PASSED] test_unique
[14:36:39] [PASSED] test_overlap
[14:36:39] [PASSED] test_reusable
[14:36:39] [PASSED] test_too_big
[14:36:39] [PASSED] test_flush
[14:36:39] [PASSED] test_lookup
[14:36:39] [PASSED] test_data
[14:36:39] [PASSED] test_class
[14:36:39] ===================== [PASSED] guc_buf =====================
[14:36:39] =================== guc_dbm (7 subtests) ===================
[14:36:39] [PASSED] test_empty
[14:36:39] [PASSED] test_default
[14:36:39] ======================== test_size  ========================
[14:36:39] [PASSED] 4
[14:36:39] [PASSED] 8
[14:36:39] [PASSED] 32
[14:36:39] [PASSED] 256
[14:36:39] ==================== [PASSED] test_size ====================
[14:36:39] ======================= test_reuse  ========================
[14:36:39] [PASSED] 4
[14:36:39] [PASSED] 8
[14:36:39] [PASSED] 32
[14:36:39] [PASSED] 256
[14:36:39] =================== [PASSED] test_reuse ====================
[14:36:39] =================== test_range_overlap  ====================
[14:36:39] [PASSED] 4
[14:36:39] [PASSED] 8
[14:36:39] [PASSED] 32
[14:36:39] [PASSED] 256
[14:36:39] =============== [PASSED] test_range_overlap ================
[14:36:39] =================== test_range_compact  ====================
[14:36:39] [PASSED] 4
[14:36:39] [PASSED] 8
[14:36:39] [PASSED] 32
[14:36:39] [PASSED] 256
[14:36:39] =============== [PASSED] test_range_compact ================
[14:36:39] ==================== test_range_spare  =====================
[14:36:39] [PASSED] 4
[14:36:39] [PASSED] 8
[14:36:39] [PASSED] 32
[14:36:39] [PASSED] 256
[14:36:39] ================ [PASSED] test_range_spare =================
[14:36:39] ===================== [PASSED] guc_dbm =====================
[14:36:39] =================== guc_idm (6 subtests) ===================
[14:36:39] [PASSED] bad_init
[14:36:39] [PASSED] no_init
[14:36:39] [PASSED] init_fini
[14:36:39] [PASSED] check_used
[14:36:39] [PASSED] check_quota
[14:36:39] [PASSED] check_all
[14:36:39] ===================== [PASSED] guc_idm =====================
[14:36:39] =============== guc_klv_helpers (9 subtests) ===============
[14:36:39] [PASSED] test_count
[14:36:39] [PASSED] test_encode_u32
[14:36:39] [PASSED] test_encode_u64
[14:36:39] [PASSED] test_encode_string
[14:36:39] [PASSED] test_encode_object_raw
[14:36:39] [PASSED] test_encode_object_klv
[14:36:39] [PASSED] test_encode_object_nested
[14:36:39] [PASSED] test_encode_object_basic
[14:36:39] [PASSED] test_print
[14:36:39] ================= [PASSED] guc_klv_helpers =================
[14:36:39] =================== xe_log (4 subtests) ====================
[14:36:39] [PASSED] demo_cper
[14:36:39] [PASSED] demo_dmesg
[14:36:39] ======================= test_dmesg  ========================
[14:36:39] [PASSED] test_fatal
[14:36:39] [PASSED] test_fatal_tile
[14:36:39] [PASSED] test_fatal_gt
[14:36:39] [PASSED] test_fatal_comp
[14:36:39] [PASSED] test_fatal_comp_tile
[14:36:39] [PASSED] test_fatal_comp_gt
[14:36:39] [PASSED] test_fatal_all
[14:36:39] [PASSED] test_recoverable
[14:36:39] [PASSED] test_recoverable_tile
[14:36:39] [PASSED] test_recoverable_gt
[14:36:39] [PASSED] test_recoverable_comp
[14:36:39] [PASSED] test_recoverable_comp_tile
[14:36:39] [PASSED] test_recoverable_comp_gt
[14:36:39] [PASSED] test_recoverable_all
[14:36:39] [PASSED] test_info
[14:36:39] [PASSED] test_info_tile
[14:36:39] [PASSED] test_info_gt
[14:36:39] [PASSED] test_info_err
[14:36:39] [PASSED] test_info_comp
[14:36:39] [PASSED] test_info_comp_tile
[14:36:39] [PASSED] test_info_comp_gt
[14:36:39] [PASSED] test_info_all
[14:36:39] [PASSED] test_hw_fatal
[14:36:39] [PASSED] test_hw_recoverable
[14:36:39] [PASSED] test_hw_corrected
[14:36:39] [PASSED] test_hw_informational
[14:36:39] =================== [PASSED] test_dmesg ====================
[14:36:39] ====================== test_invalid  =======================
[14:36:39] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[14:36:39] ================== [SKIPPED] test_invalid ==================
[14:36:39] ===================== [PASSED] xe_log ======================
[14:36:39] ================== no_relay (3 subtests) ===================
[14:36:39] [PASSED] xe_drops_guc2pf_if_not_ready
[14:36:39] [PASSED] xe_drops_guc2vf_if_not_ready
[14:36:39] [PASSED] xe_rejects_send_if_not_ready
[14:36:39] ==================== [PASSED] no_relay =====================
[14:36:39] ================== pf_relay (14 subtests) ==================
[14:36:39] [PASSED] pf_rejects_guc2pf_too_short
[14:36:39] [PASSED] pf_rejects_guc2pf_too_long
[14:36:39] [PASSED] pf_rejects_guc2pf_no_payload
[14:36:39] [PASSED] pf_fails_no_payload
[14:36:39] [PASSED] pf_fails_bad_origin
[14:36:39] [PASSED] pf_fails_bad_type
[14:36:39] [PASSED] pf_txn_reports_error
[14:36:39] [PASSED] pf_txn_sends_pf2guc
[14:36:39] [PASSED] pf_sends_pf2guc
[14:36:39] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:36:39] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:36:39] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:36:39] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:36:39] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[14:36:39] ==================== [PASSED] pf_relay =====================
[14:36:39] ================== vf_relay (3 subtests) ===================
[14:36:39] [PASSED] vf_rejects_guc2vf_too_short
[14:36:39] [PASSED] vf_rejects_guc2vf_too_long
[14:36:39] [PASSED] vf_rejects_guc2vf_no_payload
[14:36:39] ==================== [PASSED] vf_relay =====================
[14:36:39] ================ pf_gt_config (9 subtests) =================
[14:36:39] [PASSED] fair_contexts_1vf
[14:36:39] [PASSED] fair_doorbells_1vf
[14:36:39] [PASSED] fair_ggtt_1vf
[14:36:39] ====================== fair_vram_1vf  ======================
[14:36:39] [PASSED] 3.50 GiB
[14:36:39] [PASSED] 11.5 GiB
[14:36:39] [PASSED] 15.5 GiB
[14:36:39] [PASSED] 31.5 GiB
[14:36:39] [PASSED] 63.5 GiB
[14:36:39] [PASSED] 1.91 GiB
[14:36:39] ================== [PASSED] fair_vram_1vf ==================
[14:36:39] ================ fair_vram_1vf_admin_only  =================
[14:36:39] [PASSED] 3.50 GiB
[14:36:39] [PASSED] 11.5 GiB
[14:36:39] [PASSED] 15.5 GiB
[14:36:39] [PASSED] 31.5 GiB
[14:36:39] [PASSED] 63.5 GiB
[14:36:39] [PASSED] 1.91 GiB
[14:36:39] ============ [PASSED] fair_vram_1vf_admin_only =============
[14:36:39] ====================== fair_contexts  ======================
[14:36:39] [PASSED] 1 VF
[14:36:39] [PASSED] 2 VFs
[14:36:39] [PASSED] 3 VFs
[14:36:39] [PASSED] 4 VFs
[14:36:39] [PASSED] 5 VFs
[14:36:39] [PASSED] 6 VFs
[14:36:39] [PASSED] 7 VFs
[14:36:39] [PASSED] 8 VFs
[14:36:39] [PASSED] 9 VFs
[14:36:39] [PASSED] 10 VFs
[14:36:39] [PASSED] 11 VFs
[14:36:39] [PASSED] 12 VFs
[14:36:39] [PASSED] 13 VFs
[14:36:39] [PASSED] 14 VFs
[14:36:39] [PASSED] 15 VFs
[14:36:39] [PASSED] 16 VFs
[14:36:39] [PASSED] 17 VFs
[14:36:39] [PASSED] 18 VFs
[14:36:39] [PASSED] 19 VFs
[14:36:39] [PASSED] 20 VFs
[14:36:39] [PASSED] 21 VFs
[14:36:39] [PASSED] 22 VFs
[14:36:39] [PASSED] 23 VFs
[14:36:39] [PASSED] 24 VFs
[14:36:39] [PASSED] 25 VFs
[14:36:39] [PASSED] 26 VFs
[14:36:39] [PASSED] 27 VFs
[14:36:39] [PASSED] 28 VFs
[14:36:39] [PASSED] 29 VFs
[14:36:39] [PASSED] 30 VFs
[14:36:39] [PASSED] 31 VFs
[14:36:39] [PASSED] 32 VFs
[14:36:39] [PASSED] 33 VFs
[14:36:39] [PASSED] 34 VFs
[14:36:39] [PASSED] 35 VFs
[14:36:39] [PASSED] 36 VFs
[14:36:39] [PASSED] 37 VFs
[14:36:39] [PASSED] 38 VFs
[14:36:39] [PASSED] 39 VFs
[14:36:39] [PASSED] 40 VFs
[14:36:39] [PASSED] 41 VFs
[14:36:39] [PASSED] 42 VFs
[14:36:39] [PASSED] 43 VFs
[14:36:39] [PASSED] 44 VFs
[14:36:39] [PASSED] 45 VFs
[14:36:39] [PASSED] 46 VFs
[14:36:39] [PASSED] 47 VFs
[14:36:39] [PASSED] 48 VFs
[14:36:39] [PASSED] 49 VFs
[14:36:39] [PASSED] 50 VFs
[14:36:39] [PASSED] 51 VFs
[14:36:39] [PASSED] 52 VFs
[14:36:39] [PASSED] 53 VFs
[14:36:39] [PASSED] 54 VFs
[14:36:39] [PASSED] 55 VFs
[14:36:39] [PASSED] 56 VFs
[14:36:39] [PASSED] 57 VFs
[14:36:39] [PASSED] 58 VFs
[14:36:39] [PASSED] 59 VFs
[14:36:39] [PASSED] 60 VFs
[14:36:39] [PASSED] 61 VFs
[14:36:39] [PASSED] 62 VFs
[14:36:39] [PASSED] 63 VFs
[14:36:39] ================== [PASSED] fair_contexts ==================
[14:36:39] ===================== fair_doorbells  ======================
[14:36:39] [PASSED] 1 VF
[14:36:39] [PASSED] 2 VFs
[14:36:39] [PASSED] 3 VFs
[14:36:39] [PASSED] 4 VFs
[14:36:39] [PASSED] 5 VFs
[14:36:39] [PASSED] 6 VFs
[14:36:39] [PASSED] 7 VFs
[14:36:39] [PASSED] 8 VFs
[14:36:39] [PASSED] 9 VFs
[14:36:39] [PASSED] 10 VFs
[14:36:39] [PASSED] 11 VFs
[14:36:39] [PASSED] 12 VFs
[14:36:39] [PASSED] 13 VFs
[14:36:39] [PASSED] 14 VFs
[14:36:39] [PASSED] 15 VFs
[14:36:39] [PASSED] 16 VFs
[14:36:39] [PASSED] 17 VFs
[14:36:39] [PASSED] 18 VFs
[14:36:39] [PASSED] 19 VFs
[14:36:39] [PASSED] 20 VFs
[14:36:39] [PASSED] 21 VFs
[14:36:39] [PASSED] 22 VFs
[14:36:39] [PASSED] 23 VFs
[14:36:39] [PASSED] 24 VFs
[14:36:39] [PASSED] 25 VFs
[14:36:39] [PASSED] 26 VFs
[14:36:39] [PASSED] 27 VFs
[14:36:39] [PASSED] 28 VFs
[14:36:39] [PASSED] 29 VFs
[14:36:39] [PASSED] 30 VFs
[14:36:39] [PASSED] 31 VFs
[14:36:39] [PASSED] 32 VFs
[14:36:39] [PASSED] 33 VFs
[14:36:39] [PASSED] 34 VFs
[14:36:39] [PASSED] 35 VFs
[14:36:39] [PASSED] 36 VFs
[14:36:39] [PASSED] 37 VFs
[14:36:39] [PASSED] 38 VFs
[14:36:39] [PASSED] 39 VFs
[14:36:39] [PASSED] 40 VFs
[14:36:39] [PASSED] 41 VFs
[14:36:39] [PASSED] 42 VFs
[14:36:39] [PASSED] 43 VFs
[14:36:39] [PASSED] 44 VFs
[14:36:39] [PASSED] 45 VFs
[14:36:39] [PASSED] 46 VFs
[14:36:39] [PASSED] 47 VFs
[14:36:39] [PASSED] 48 VFs
[14:36:39] [PASSED] 49 VFs
[14:36:39] [PASSED] 50 VFs
[14:36:39] [PASSED] 51 VFs
[14:36:39] [PASSED] 52 VFs
[14:36:39] [PASSED] 53 VFs
[14:36:39] [PASSED] 54 VFs
[14:36:39] [PASSED] 55 VFs
[14:36:39] [PASSED] 56 VFs
[14:36:39] [PASSED] 57 VFs
[14:36:39] [PASSED] 58 VFs
[14:36:39] [PASSED] 59 VFs
[14:36:39] [PASSED] 60 VFs
[14:36:39] [PASSED] 61 VFs
[14:36:39] [PASSED] 62 VFs
[14:36:39] [PASSED] 63 VFs
[14:36:39] ================= [PASSED] fair_doorbells ==================
[14:36:39] ======================== fair_ggtt  ========================
[14:36:39] [PASSED] 1 VF
[14:36:39] [PASSED] 2 VFs
[14:36:39] [PASSED] 3 VFs
[14:36:39] [PASSED] 4 VFs
[14:36:39] [PASSED] 5 VFs
[14:36:39] [PASSED] 6 VFs
[14:36:39] [PASSED] 7 VFs
[14:36:39] [PASSED] 8 VFs
[14:36:39] [PASSED] 9 VFs
[14:36:39] [PASSED] 10 VFs
[14:36:39] [PASSED] 11 VFs
[14:36:39] [PASSED] 12 VFs
[14:36:39] [PASSED] 13 VFs
[14:36:39] [PASSED] 14 VFs
[14:36:39] [PASSED] 15 VFs
[14:36:39] [PASSED] 16 VFs
[14:36:39] [PASSED] 17 VFs
[14:36:39] [PASSED] 18 VFs
[14:36:39] [PASSED] 19 VFs
[14:36:39] [PASSED] 20 VFs
[14:36:39] [PASSED] 21 VFs
[14:36:39] [PASSED] 22 VFs
[14:36:39] [PASSED] 23 VFs
[14:36:39] [PASSED] 24 VFs
[14:36:39] [PASSED] 25 VFs
[14:36:39] [PASSED] 26 VFs
[14:36:39] [PASSED] 27 VFs
[14:36:39] [PASSED] 28 VFs
[14:36:39] [PASSED] 29 VFs
[14:36:39] [PASSED] 30 VFs
[14:36:39] [PASSED] 31 VFs
[14:36:39] [PASSED] 32 VFs
[14:36:39] [PASSED] 33 VFs
[14:36:39] [PASSED] 34 VFs
[14:36:39] [PASSED] 35 VFs
[14:36:39] [PASSED] 36 VFs
[14:36:39] [PASSED] 37 VFs
[14:36:39] [PASSED] 38 VFs
[14:36:39] [PASSED] 39 VFs
[14:36:39] [PASSED] 40 VFs
[14:36:39] [PASSED] 41 VFs
[14:36:39] [PASSED] 42 VFs
[14:36:39] [PASSED] 43 VFs
[14:36:39] [PASSED] 44 VFs
[14:36:39] [PASSED] 45 VFs
[14:36:39] [PASSED] 46 VFs
[14:36:39] [PASSED] 47 VFs
[14:36:39] [PASSED] 48 VFs
[14:36:39] [PASSED] 49 VFs
[14:36:39] [PASSED] 50 VFs
[14:36:39] [PASSED] 51 VFs
[14:36:39] [PASSED] 52 VFs
[14:36:39] [PASSED] 53 VFs
[14:36:39] [PASSED] 54 VFs
[14:36:39] [PASSED] 55 VFs
[14:36:39] [PASSED] 56 VFs
[14:36:39] [PASSED] 57 VFs
[14:36:39] [PASSED] 58 VFs
[14:36:39] [PASSED] 59 VFs
[14:36:39] [PASSED] 60 VFs
[14:36:39] [PASSED] 61 VFs
[14:36:39] [PASSED] 62 VFs
[14:36:39] [PASSED] 63 VFs
[14:36:39] ==================== [PASSED] fair_ggtt ====================
[14:36:39] ======================== fair_vram  ========================
[14:36:39] [PASSED] 1 VF
[14:36:39] [PASSED] 2 VFs
[14:36:39] [PASSED] 3 VFs
[14:36:39] [PASSED] 4 VFs
[14:36:39] [PASSED] 5 VFs
[14:36:39] [PASSED] 6 VFs
[14:36:39] [PASSED] 7 VFs
[14:36:39] [PASSED] 8 VFs
[14:36:39] [PASSED] 9 VFs
[14:36:39] [PASSED] 10 VFs
[14:36:39] [PASSED] 11 VFs
[14:36:39] [PASSED] 12 VFs
[14:36:39] [PASSED] 13 VFs
[14:36:39] [PASSED] 14 VFs
[14:36:39] [PASSED] 15 VFs
[14:36:39] [PASSED] 16 VFs
[14:36:39] [PASSED] 17 VFs
[14:36:39] [PASSED] 18 VFs
[14:36:39] [PASSED] 19 VFs
[14:36:39] [PASSED] 20 VFs
[14:36:39] [PASSED] 21 VFs
[14:36:39] [PASSED] 22 VFs
[14:36:39] [PASSED] 23 VFs
[14:36:39] [PASSED] 24 VFs
[14:36:39] [PASSED] 25 VFs
[14:36:39] [PASSED] 26 VFs
[14:36:39] [PASSED] 27 VFs
[14:36:39] [PASSED] 28 VFs
[14:36:39] [PASSED] 29 VFs
[14:36:39] [PASSED] 30 VFs
[14:36:39] [PASSED] 31 VFs
[14:36:39] [PASSED] 32 VFs
[14:36:39] [PASSED] 33 VFs
[14:36:39] [PASSED] 34 VFs
[14:36:39] [PASSED] 35 VFs
[14:36:39] [PASSED] 36 VFs
[14:36:39] [PASSED] 37 VFs
[14:36:39] [PASSED] 38 VFs
[14:36:39] [PASSED] 39 VFs
[14:36:39] [PASSED] 40 VFs
[14:36:39] [PASSED] 41 VFs
[14:36:39] [PASSED] 42 VFs
[14:36:39] [PASSED] 43 VFs
[14:36:39] [PASSED] 44 VFs
[14:36:39] [PASSED] 45 VFs
[14:36:39] [PASSED] 46 VFs
[14:36:39] [PASSED] 47 VFs
[14:36:39] [PASSED] 48 VFs
[14:36:39] [PASSED] 49 VFs
[14:36:39] [PASSED] 50 VFs
[14:36:39] [PASSED] 51 VFs
[14:36:39] [PASSED] 52 VFs
[14:36:39] [PASSED] 53 VFs
[14:36:39] [PASSED] 54 VFs
[14:36:39] [PASSED] 55 VFs
[14:36:39] [PASSED] 56 VFs
[14:36:39] [PASSED] 57 VFs
[14:36:39] [PASSED] 58 VFs
[14:36:39] [PASSED] 59 VFs
[14:36:39] [PASSED] 60 VFs
[14:36:39] [PASSED] 61 VFs
[14:36:39] [PASSED] 62 VFs
[14:36:39] [PASSED] 63 VFs
[14:36:39] ==================== [PASSED] fair_vram ====================
[14:36:39] ================== [PASSED] pf_gt_config ===================
[14:36:39] ===================== lmtt (1 subtest) =====================
[14:36:39] ======================== test_ops  =========================
[14:36:39] [PASSED] 2-level
[14:36:39] [PASSED] multi-level
[14:36:39] ==================== [PASSED] test_ops =====================
[14:36:39] ====================== [PASSED] lmtt =======================
[14:36:39] ================= sriov_packet (1 subtest) =================
[14:36:39] [PASSED] test_descriptor_init
[14:36:39] ================== [PASSED] sriov_packet ===================
[14:36:39] ================= pf_service (11 subtests) =================
[14:36:39] [PASSED] pf_negotiate_any
[14:36:39] [PASSED] pf_negotiate_base_match
[14:36:39] [PASSED] pf_negotiate_base_newer
[14:36:39] [PASSED] pf_negotiate_base_next
[14:36:39] [SKIPPED] pf_negotiate_base_older (no older minor)
[14:36:39] [PASSED] pf_negotiate_base_prev
[14:36:39] [PASSED] pf_negotiate_latest_match
[14:36:39] [PASSED] pf_negotiate_latest_newer
[14:36:39] [PASSED] pf_negotiate_latest_next
[14:36:39] [SKIPPED] pf_negotiate_latest_older (no older minor)
[14:36:39] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[14:36:39] =================== [PASSED] pf_service ====================
[14:36:39] ================= xe_guc_g2g (2 subtests) ==================
[14:36:39] ============== xe_live_guc_g2g_kunit_default  ==============
[14:36:39] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[14:36:39] ============== xe_live_guc_g2g_kunit_allmem  ===============
[14:36:39] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[14:36:39] =================== [SKIPPED] xe_guc_g2g ===================
[14:36:39] =================== xe_mocs (2 subtests) ===================
[14:36:39] ================ xe_live_mocs_kernel_kunit  ================
[14:36:39] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[14:36:39] ================ xe_live_mocs_reset_kunit  =================
[14:36:39] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[14:36:39] ==================== [SKIPPED] xe_mocs =====================
[14:36:39] ================= xe_migrate (2 subtests) ==================
[14:36:39] ================= xe_migrate_sanity_kunit  =================
[14:36:39] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[14:36:39] ================== xe_validate_ccs_kunit  ==================
[14:36:39] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[14:36:39] =================== [SKIPPED] xe_migrate ===================
[14:36:39] ================== xe_dma_buf (1 subtest) ==================
[14:36:39] ==================== xe_dma_buf_kunit  =====================
[14:36:39] ================ [SKIPPED] xe_dma_buf_kunit ================
[14:36:39] =================== [SKIPPED] xe_dma_buf ===================
[14:36:39] ================= xe_bo_shrink (1 subtest) =================
[14:36:39] =================== xe_bo_shrink_kunit  ====================
[14:36:39] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[14:36:39] ================== [SKIPPED] xe_bo_shrink ==================
[14:36:39] ==================== xe_bo (2 subtests) ====================
[14:36:39] ================== xe_ccs_migrate_kunit  ===================
[14:36:39] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[14:36:39] ==================== xe_bo_evict_kunit  ====================
[14:36:39] =============== [SKIPPED] xe_bo_evict_kunit ================
[14:36:39] ===================== [SKIPPED] xe_bo ======================
[14:36:39] =================== xe_any (9 subtests) ====================
[14:36:39] [PASSED] test_to_xe
[14:36:39] [PASSED] test_to_dev
[14:36:39] [PASSED] test_to_pdev
[14:36:39] [PASSED] test_to_drm
[14:36:39] [PASSED] test_if_pdev
[14:36:39] [PASSED] test_if_xe
[14:36:39] [PASSED] test_if_tile
[14:36:39] [PASSED] test_if_gt
[14:36:39] [PASSED] test_to_id
[14:36:39] ===================== [PASSED] xe_any ======================
[14:36:39] ==================== args (13 subtests) ====================
[14:36:39] [PASSED] count_args_test
[14:36:39] [PASSED] call_args_example
[14:36:39] [PASSED] call_args_test
[14:36:39] [PASSED] drop_first_arg_example
[14:36:39] [PASSED] drop_first_arg_test
[14:36:39] [PASSED] first_arg_example
[14:36:39] [PASSED] first_arg_test
[14:36:39] [PASSED] last_arg_example
[14:36:39] [PASSED] last_arg_test
[14:36:39] [PASSED] pick_arg_example
[14:36:39] [PASSED] if_args_example
[14:36:39] [PASSED] if_args_test
[14:36:39] [PASSED] sep_comma_example
[14:36:39] ====================== [PASSED] args =======================
[14:36:39] =================== xe_pci (3 subtests) ====================
[14:36:39] ==================== check_graphics_ip  ====================
[14:36:39] [PASSED] 12.00 Xe_LP
[14:36:39] [PASSED] 12.10 Xe_LP+
[14:36:39] [PASSED] 12.55 Xe_HPG
[14:36:39] [PASSED] 12.60 Xe_HPC
[14:36:39] [PASSED] 12.70 Xe_LPG
[14:36:39] [PASSED] 12.71 Xe_LPG
[14:36:39] [PASSED] 12.74 Xe_LPG+
[14:36:39] [PASSED] 20.01 Xe2_HPG
[14:36:39] [PASSED] 20.02 Xe2_HPG
[14:36:39] [PASSED] 20.04 Xe2_LPG
[14:36:39] [PASSED] 30.00 Xe3_LPG
[14:36:39] [PASSED] 30.01 Xe3_LPG
[14:36:39] [PASSED] 30.03 Xe3_LPG
[14:36:39] [PASSED] 30.04 Xe3_LPG
[14:36:39] [PASSED] 30.05 Xe3_LPG
[14:36:39] [PASSED] 35.10 Xe3p_LPG
[14:36:39] [PASSED] 35.11 Xe3p_XPC
[14:36:39] ================ [PASSED] check_graphics_ip ================
[14:36:39] ===================== check_media_ip  ======================
[14:36:39] [PASSED] 12.00 Xe_M
[14:36:39] [PASSED] 12.55 Xe_HPM
[14:36:39] [PASSED] 13.00 Xe_LPM+
[14:36:39] [PASSED] 13.01 Xe2_HPM
[14:36:39] [PASSED] 20.00 Xe2_LPM
[14:36:39] [PASSED] 30.00 Xe3_LPM
[14:36:39] [PASSED] 30.02 Xe3_LPM
[14:36:39] [PASSED] 35.00 Xe3p_LPM
[14:36:39] [PASSED] 35.03 Xe3p_HPM
[14:36:39] ================= [PASSED] check_media_ip ==================
[14:36:39] =================== check_platform_desc  ===================
[14:36:39] [PASSED] 0x9A60 (TIGERLAKE)
[14:36:39] [PASSED] 0x9A68 (TIGERLAKE)
[14:36:39] [PASSED] 0x9A70 (TIGERLAKE)
[14:36:39] [PASSED] 0x9A40 (TIGERLAKE)
[14:36:39] [PASSED] 0x9A49 (TIGERLAKE)
[14:36:39] [PASSED] 0x9A59 (TIGERLAKE)
[14:36:39] [PASSED] 0x9A78 (TIGERLAKE)
[14:36:39] [PASSED] 0x9AC0 (TIGERLAKE)
[14:36:39] [PASSED] 0x9AC9 (TIGERLAKE)
[14:36:39] [PASSED] 0x9AD9 (TIGERLAKE)
[14:36:39] [PASSED] 0x9AF8 (TIGERLAKE)
[14:36:39] [PASSED] 0x4C80 (ROCKETLAKE)
[14:36:39] [PASSED] 0x4C8A (ROCKETLAKE)
[14:36:39] [PASSED] 0x4C8B (ROCKETLAKE)
[14:36:39] [PASSED] 0x4C8C (ROCKETLAKE)
[14:36:39] [PASSED] 0x4C90 (ROCKETLAKE)
[14:36:39] [PASSED] 0x4C9A (ROCKETLAKE)
[14:36:39] [PASSED] 0x4680 (ALDERLAKE_S)
[14:36:39] [PASSED] 0x4682 (ALDERLAKE_S)
[14:36:39] [PASSED] 0x4688 (ALDERLAKE_S)
[14:36:39] [PASSED] 0x468A (ALDERLAKE_S)
[14:36:39] [PASSED] 0x468B (ALDERLAKE_S)
[14:36:39] [PASSED] 0x4690 (ALDERLAKE_S)
[14:36:39] [PASSED] 0x4692 (ALDERLAKE_S)
[14:36:39] [PASSED] 0x4693 (ALDERLAKE_S)
[14:36:39] [PASSED] 0x46A0 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46A1 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46A2 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46A3 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46A6 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46A8 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46AA (ALDERLAKE_P)
[14:36:39] [PASSED] 0x462A (ALDERLAKE_P)
[14:36:39] [PASSED] 0x4626 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x4628 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46B0 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46B1 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46B2 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46B3 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46C0 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46C1 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46C2 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46C3 (ALDERLAKE_P)
[14:36:39] [PASSED] 0x46D0 (ALDERLAKE_N)
[14:36:39] [PASSED] 0x46D1 (ALDERLAKE_N)
[14:36:39] [PASSED] 0x46D2 (ALDERLAKE_N)
[14:36:39] [PASSED] 0x46D3 (ALDERLAKE_N)
[14:36:39] [PASSED] 0x46D4 (ALDERLAKE_N)
[14:36:39] [PASSED] 0xA721 (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7A1 (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7A9 (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7AC (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7AD (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA720 (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7A0 (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7A8 (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7AA (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA7AB (ALDERLAKE_P)
[14:36:39] [PASSED] 0xA780 (ALDERLAKE_S)
[14:36:39] [PASSED] 0xA781 (ALDERLAKE_S)
[14:36:39] [PASSED] 0xA782 (ALDERLAKE_S)
[14:36:39] [PASSED] 0xA783 (ALDERLAKE_S)
[14:36:39] [PASSED] 0xA788 (ALDERLAKE_S)
[14:36:39] [PASSED] 0xA789 (ALDERLAKE_S)
[14:36:39] [PASSED] 0xA78A (ALDERLAKE_S)
[14:36:39] [PASSED] 0xA78B (ALDERLAKE_S)
[14:36:39] [PASSED] 0x4905 (DG1)
[14:36:39] [PASSED] 0x4906 (DG1)
[14:36:39] [PASSED] 0x4907 (DG1)
[14:36:39] [PASSED] 0x4908 (DG1)
[14:36:39] [PASSED] 0x4909 (DG1)
[14:36:39] [PASSED] 0x56C0 (DG2)
[14:36:39] [PASSED] 0x56C2 (DG2)
[14:36:39] [PASSED] 0x56C1 (DG2)
[14:36:39] [PASSED] 0x7D51 (METEORLAKE)
[14:36:39] [PASSED] 0x7DD1 (METEORLAKE)
[14:36:39] [PASSED] 0x7D41 (METEORLAKE)
[14:36:39] [PASSED] 0x7D67 (METEORLAKE)
[14:36:39] [PASSED] 0xB640 (METEORLAKE)
[14:36:39] [PASSED] 0x56A0 (DG2)
[14:36:39] [PASSED] 0x56A1 (DG2)
[14:36:39] [PASSED] 0x56A2 (DG2)
[14:36:39] [PASSED] 0x56BE (DG2)
[14:36:39] [PASSED] 0x56BF (DG2)
[14:36:39] [PASSED] 0x5690 (DG2)
[14:36:39] [PASSED] 0x5691 (DG2)
[14:36:39] [PASSED] 0x5692 (DG2)
[14:36:39] [PASSED] 0x56A5 (DG2)
[14:36:39] [PASSED] 0x56A6 (DG2)
[14:36:39] [PASSED] 0x56B0 (DG2)
[14:36:39] [PASSED] 0x56B1 (DG2)
[14:36:39] [PASSED] 0x56BA (DG2)
[14:36:39] [PASSED] 0x56BB (DG2)
[14:36:39] [PASSED] 0x56BC (DG2)
[14:36:39] [PASSED] 0x56BD (DG2)
[14:36:39] [PASSED] 0x5693 (DG2)
[14:36:39] [PASSED] 0x5694 (DG2)
[14:36:39] [PASSED] 0x5695 (DG2)
[14:36:39] [PASSED] 0x56A3 (DG2)
[14:36:39] [PASSED] 0x56A4 (DG2)
[14:36:39] [PASSED] 0x56B2 (DG2)
[14:36:39] [PASSED] 0x56B3 (DG2)
[14:36:39] [PASSED] 0x5696 (DG2)
[14:36:39] [PASSED] 0x5697 (DG2)
[14:36:39] [PASSED] 0xB69 (PVC)
[14:36:39] [PASSED] 0xB6E (PVC)
[14:36:39] [PASSED] 0xBD4 (PVC)
[14:36:39] [PASSED] 0xBD5 (PVC)
[14:36:39] [PASSED] 0xBD6 (PVC)
[14:36:39] [PASSED] 0xBD7 (PVC)
[14:36:39] [PASSED] 0xBD8 (PVC)
[14:36:39] [PASSED] 0xBD9 (PVC)
[14:36:39] [PASSED] 0xBDA (PVC)
[14:36:39] [PASSED] 0xBDB (PVC)
[14:36:39] [PASSED] 0xBE0 (PVC)
[14:36:39] [PASSED] 0xBE1 (PVC)
[14:36:39] [PASSED] 0xBE5 (PVC)
[14:36:39] [PASSED] 0x7D40 (METEORLAKE)
[14:36:39] [PASSED] 0x7D45 (METEORLAKE)
[14:36:39] [PASSED] 0x7D55 (METEORLAKE)
[14:36:39] [PASSED] 0x7D60 (METEORLAKE)
[14:36:39] [PASSED] 0x7DD5 (METEORLAKE)
[14:36:39] [PASSED] 0x6420 (LUNARLAKE)
[14:36:39] [PASSED] 0x64A0 (LUNARLAKE)
[14:36:39] [PASSED] 0x64B0 (LUNARLAKE)
[14:36:39] [PASSED] 0xE202 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE209 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE20B (BATTLEMAGE)
[14:36:39] [PASSED] 0xE20C (BATTLEMAGE)
[14:36:39] [PASSED] 0xE20D (BATTLEMAGE)
[14:36:39] [PASSED] 0xE210 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE211 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE212 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE216 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE220 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE221 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE222 (BATTLEMAGE)
[14:36:39] [PASSED] 0xE223 (BATTLEMAGE)
[14:36:39] [PASSED] 0xB080 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB081 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB082 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB083 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB084 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB085 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB086 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB087 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB08F (PANTHERLAKE)
[14:36:39] [PASSED] 0xB090 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB0A0 (PANTHERLAKE)
[14:36:39] [PASSED] 0xB0B0 (PANTHERLAKE)
[14:36:39] [PASSED] 0xFD80 (PANTHERLAKE)
[14:36:39] [PASSED] 0xFD81 (PANTHERLAKE)
[14:36:39] [PASSED] 0xD740 (NOVALAKE_S)
[14:36:39] [PASSED] 0xD741 (NOVALAKE_S)
[14:36:39] [PASSED] 0xD742 (NOVALAKE_S)
[14:36:39] [PASSED] 0xD743 (NOVALAKE_S)
[14:36:39] [PASSED] 0xD745 (NOVALAKE_S)
[14:36:39] [PASSED] 0xD74A (NOVALAKE_S)
[14:36:39] [PASSED] 0xD74B (NOVALAKE_S)
[14:36:39] [PASSED] 0x674C (CRESCENTISLAND)
[14:36:39] [PASSED] 0x674D (CRESCENTISLAND)
[14:36:39] [PASSED] 0x674E (CRESCENTISLAND)
[14:36:39] [PASSED] 0x674F (CRESCENTISLAND)
[14:36:39] [PASSED] 0x6750 (CRESCENTISLAND)
[14:36:39] [PASSED] 0xD750 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD751 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD752 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD753 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD754 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD755 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD756 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD757 (NOVALAKE_P)
[14:36:39] [PASSED] 0xD75F (NOVALAKE_P)
[14:36:39] =============== [PASSED] check_platform_desc ===============
[14:36:39] ===================== [PASSED] xe_pci ======================
[14:36:39] ============= xe_rtp_tables_test (5 subtests) ==============
[14:36:39] ================== xe_rtp_table_gt_test  ===================
[14:36:39] [PASSED] gt_was/14011060649
[14:36:39] [PASSED] gt_was/14011059788
[14:36:39] [PASSED] gt_was/14015795083
[14:36:39] [PASSED] gt_was/16021867713
[14:36:39] [PASSED] gt_was/14019449301
[14:36:39] [PASSED] gt_was/16028005424
[14:36:39] [PASSED] gt_was/14026578760
[14:36:39] [PASSED] gt_was/1409420604
[14:36:39] [PASSED] gt_was/1408615072
[14:36:39] [PASSED] gt_was/22010523718
[14:36:39] [PASSED] gt_was/14011006942
[14:36:39] [PASSED] gt_was/14014830051
[14:36:39] [PASSED] gt_was/18018781329
[14:36:39] [PASSED] gt_was/1509235366
[14:36:39] [PASSED] gt_was/18018781329
[14:36:39] [PASSED] gt_was/16016694945
[14:36:39] [PASSED] gt_was/14018575942
[14:36:39] [PASSED] gt_was/22016670082
[14:36:39] [PASSED] gt_was/22016670082
[14:36:39] [PASSED] gt_was/14017421178
[14:36:39] [PASSED] gt_was/16025250150
[14:36:39] [PASSED] gt_was/14021871409
[14:36:39] [PASSED] gt_was/16021865536
[14:36:39] [PASSED] gt_was/14021486841
[14:36:39] [PASSED] gt_was/14025160223
[14:36:39] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[14:36:39] [PASSED] gt_was/14025635424
[14:36:39] [PASSED] gt_was/16028005424
[14:36:39] ============== [PASSED] xe_rtp_table_gt_test ===============
[14:36:39] ================== xe_rtp_table_gt_test  ===================
[14:36:39] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[14:36:39] [PASSED] gt_tunings/Tuning: 32B Access Enable
[14:36:39] [PASSED] gt_tunings/Tuning: L3 cache
[14:36:39] [PASSED] gt_tunings/Tuning: L3 cache - media
[14:36:39] [PASSED] gt_tunings/Tuning: Compression Overfetch
[14:36:39] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[14:36:39] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[14:36:39] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[14:36:39] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[14:36:39] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[14:36:39] [PASSED] gt_tunings/Tuning: Stateless compression control
[14:36:39] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[14:36:39] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[14:36:39] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[14:36:39] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[14:36:39] ============== [PASSED] xe_rtp_table_gt_test ===============
[14:36:39] ================== xe_rtp_table_oob_test  ==================
[14:36:39] [PASSED] oob_was/1607983814
[14:36:39] [PASSED] oob_was/16010904313
[14:36:39] [PASSED] oob_was/18022495364
[14:36:39] [PASSED] oob_was/22012773006
[14:36:39] [PASSED] oob_was/14014475959
[14:36:39] [PASSED] oob_was/22011391025
[14:36:39] [PASSED] oob_was/22012727170
[14:36:39] [PASSED] oob_was/22012727685
[14:36:39] [PASSED] oob_was/22016596838
[14:36:39] [PASSED] oob_was/18020744125
[14:36:39] [PASSED] oob_was/1409600907
[14:36:39] [PASSED] oob_was/22014953428
[14:36:39] [PASSED] oob_was/16017236439
[14:36:39] [PASSED] oob_was/14019821291
[14:36:39] [PASSED] oob_was/14015076503
[14:36:39] [PASSED] oob_was/14018913170
[14:36:39] [PASSED] oob_was/14018094691
[14:36:39] [PASSED] oob_was/18024947630
[14:36:39] [PASSED] oob_was/16022287689
[14:36:39] [PASSED] oob_was/13011645652
[14:36:39] [PASSED] oob_was/14022293748
[14:36:39] [PASSED] oob_was/22019794406
[14:36:39] [PASSED] oob_was/22019338487
[14:36:39] [PASSED] oob_was/16023588340
[14:36:39] [PASSED] oob_was/14019789679
[14:36:39] [PASSED] oob_was/14022866841
[14:36:39] [PASSED] oob_was/16021333562
[14:36:39] [PASSED] oob_was/14016712196
[14:36:39] [PASSED] oob_was/14015568240
[14:36:39] [PASSED] oob_was/18013179988
[14:36:39] [PASSED] oob_was/1508761755
[14:36:39] [PASSED] oob_was/16023105232
[14:36:39] [PASSED] oob_was/16026508708
[14:36:39] [PASSED] oob_was/14020001231
[14:36:39] [PASSED] oob_was/16023683509
[14:36:39] [PASSED] oob_was/14025515070
[14:36:39] [PASSED] oob_was/15015404425_disable
[14:36:39] [PASSED] oob_was/16026007364
[14:36:39] [PASSED] oob_was/14020316580
[14:36:39] [PASSED] oob_was/14025883347
[14:36:39] [PASSED] oob_was/16029380221
[14:36:39] [PASSED] oob_was/22022079272
[14:36:39] [PASSED] oob_was/16029897822
[14:36:39] [PASSED] oob_was/14027054324
[14:36:39] ============== [PASSED] xe_rtp_table_oob_test ==============
[14:36:39] ================ xe_rtp_table_dev_oob_test  ================
[14:36:39] [PASSED] device_oob_was/22010954014
[14:36:39] [PASSED] device_oob_was/15015404425
[14:36:39] [PASSED] device_oob_was/22019338487_display
[14:36:39] [PASSED] device_oob_was/14022085890
[14:36:39] [PASSED] device_oob_was/14026539277
[14:36:39] [PASSED] device_oob_was/14026633728
[14:36:39] [PASSED] device_oob_was/14026746987
[14:36:39] [PASSED] device_oob_was/14026779378
[14:36:39] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[14:36:39] ========== xe_rtp_table_missing_upper_bound_test  ==========
[14:36:39] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[14:36:39] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[14:36:39] [PASSED] register_whitelist/1806527549
[14:36:39] [PASSED] register_whitelist/allow_read_ctx_timestamp
[14:36:39] [PASSED] register_whitelist/allow_read_queue_timestamp
[14:36:39] [PASSED] register_whitelist/16014440446
[14:36:39] [PASSED] register_whitelist/16017236439
[14:36:39] [PASSED] register_whitelist/16020183090
[14:36:39] [PASSED] register_whitelist/14024997852
[14:36:39] [PASSED] register_whitelist/14024997852
[14:36:39] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[14:36:39] =============== [PASSED] xe_rtp_tables_test ================
[14:36:39] =================== xe_rtp (3 subtests) ====================
[14:36:39] =================== xe_rtp_rules_tests  ====================
[14:36:39] [PASSED] no
[14:36:39] [PASSED] yes
[14:36:39] [PASSED] no-and-no
[14:36:39] [PASSED] no-and-yes
[14:36:39] [PASSED] yes-and-no
[14:36:39] [PASSED] yes-and-yes
[14:36:39] [PASSED] no-or-no
[14:36:39] [PASSED] no-or-yes
[14:36:39] [PASSED] yes-or-no
[14:36:39] [PASSED] yes-or-yes
[14:36:39] [PASSED] no-yes-or-yes-no
[14:36:39] [PASSED] no-yes-or-yes-yes
[14:36:39] [PASSED] yes-yes-or-no-yes
[14:36:39] [PASSED] yes-yes-or-yes-yes
[14:36:39] [PASSED] no-no-or-yes-or-no
[14:36:39] [PASSED] or
[14:36:39] [PASSED] or-yes
[14:36:39] [PASSED] or-no
[14:36:39] [PASSED] yes-or
[14:36:39] [PASSED] no-or
[14:36:39] [PASSED] no-or-or-yes
[14:36:39] [PASSED] yes-or-or-no
[14:36:39] [PASSED] no-or-or-no
[14:36:39] [PASSED] missing-context-engine-class
[14:36:39] [PASSED] missing-context-engine-class-or-yes
[14:36:39] [PASSED] missing-context-engine-class-or-or-yes
[14:36:39] =============== [PASSED] xe_rtp_rules_tests ================
[14:36:39] =============== xe_rtp_process_to_sr_tests  ================
[14:36:39] [PASSED] coalesce-same-reg
[14:36:39] [PASSED] coalesce-same-reg-literal-and-func
[14:36:39] [PASSED] no-match-no-add
[14:36:39] [PASSED] two-regs-two-entries
[14:36:39] [PASSED] clr-one-set-other
[14:36:39] [PASSED] set-field
[14:36:39] [PASSED] conflict-duplicate
[14:36:39] [PASSED] conflict-not-disjoint
[14:36:39] [PASSED] conflict-not-disjoint-literal-and-func
[14:36:39] [PASSED] conflict-reg-type
[14:36:39] [PASSED] bad-mcr-reg-forced-to-regular
[14:36:39] [PASSED] bad-regular-reg-forced-to-mcr
[14:36:39] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[14:36:39] ================== xe_rtp_process_tests  ===================
[14:36:39] [PASSED] active1
[14:36:39] [PASSED] active2
[14:36:39] [PASSED] active-inactive
[14:36:39] [PASSED] inactive-active
[14:36:39] [PASSED] inactive-active-inactive
[14:36:39] [PASSED] inactive-inactive-inactive
[14:36:39] ============== [PASSED] xe_rtp_process_tests ===============
[14:36:39] ===================== [PASSED] xe_rtp ======================
[14:36:39] ==================== xe_wa (1 subtest) =====================
[14:36:39] ======================== xe_wa_gt  =========================
[14:36:39] [PASSED] TIGERLAKE B0
[14:36:39] [PASSED] DG1 A0
[14:36:39] [PASSED] DG1 B0
[14:36:39] [PASSED] ALDERLAKE_S A0
[14:36:39] [PASSED] ALDERLAKE_S B0
[14:36:39] [PASSED] ALDERLAKE_S C0
[14:36:39] [PASSED] ALDERLAKE_S D0
[14:36:39] [PASSED] ALDERLAKE_P A0
[14:36:39] [PASSED] ALDERLAKE_P B0
[14:36:39] [PASSED] ALDERLAKE_P C0
[14:36:39] [PASSED] ALDERLAKE_S RPLS D0
[14:36:39] [PASSED] ALDERLAKE_P RPLU E0
[14:36:39] [PASSED] DG2 G10 C0
[14:36:39] [PASSED] DG2 G11 B1
[14:36:39] [PASSED] DG2 G12 A1
[14:36:39] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[14:36:39] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[14:36:39] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[14:36:39] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[14:36:39] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[14:36:39] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[14:36:39] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[14:36:39] ==================== [PASSED] xe_wa_gt =====================
[14:36:39] ====================== [PASSED] xe_wa ======================
[14:36:39] ============================================================
[14:36:39] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[14:36:39] Elapsed time: 37.265s total, 4.434s configuring, 32.115s building, 0.688s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:36:39] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:36:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:37:06] Starting KUnit Kernel (1/1)...
[14:37:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:37:06] ============= refcount_interrupt (4 subtests) ==============
[14:37:06] [PASSED] test_single_irq_change
[14:37:06] [PASSED] test_nested_irq_change
[14:37:06] [PASSED] test_multiple_irq_change
[14:37:06] [PASSED] test_irq_save
[14:37:06] =============== [PASSED] refcount_interrupt ================
[14:37:06] ============ drm_test_pick_cmdline (2 subtests) ============
[14:37:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:37:06] =============== drm_test_pick_cmdline_named  ===============
[14:37:06] [PASSED] NTSC
[14:37:06] [PASSED] NTSC-J
[14:37:06] [PASSED] PAL
[14:37:06] [PASSED] PAL-M
[14:37:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:37:06] ============== [PASSED] drm_test_pick_cmdline ==============
[14:37:06] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[14:37:06] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[14:37:06] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[14:37:06] =========== drm_validate_clone_mode (2 subtests) ===========
[14:37:06] ============== drm_test_check_in_clone_mode  ===============
[14:37:06] [PASSED] in_clone_mode
[14:37:06] [PASSED] not_in_clone_mode
[14:37:06] ========== [PASSED] drm_test_check_in_clone_mode ===========
[14:37:06] =============== drm_test_check_valid_clones  ===============
[14:37:06] [PASSED] not_in_clone_mode
[14:37:06] [PASSED] valid_clone
[14:37:06] [PASSED] invalid_clone
[14:37:06] =========== [PASSED] drm_test_check_valid_clones ===========
[14:37:06] ============= [PASSED] drm_validate_clone_mode =============
[14:37:06] ============= drm_validate_modeset (1 subtest) =============
[14:37:06] [PASSED] drm_test_check_connector_changed_modeset
[14:37:06] ============== [PASSED] drm_validate_modeset ===============
[14:37:06] ====== drm_test_bridge_get_current_state (1 subtest) =======
[14:37:06] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[14:37:06] ======== [PASSED] drm_test_bridge_get_current_state ========
[14:37:06] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[14:37:06] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[14:37:06] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[14:37:06] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[14:37:06] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[14:37:06] ============== drm_bridge_alloc (2 subtests) ===============
[14:37:06] [PASSED] drm_test_drm_bridge_alloc_basic
[14:37:06] [PASSED] drm_test_drm_bridge_alloc_get_put
[14:37:06] ================ [PASSED] drm_bridge_alloc =================
[14:37:06] ============= drm_bridge_bus_fmt (5 subtests) ==============
[14:37:06] [PASSED] drm_test_bridge_rgb_yuv_rgb
[14:37:06] [PASSED] drm_test_bridge_must_convert_to_yuv444
[14:37:06] [PASSED] drm_test_bridge_hdmi_auto_rgb
[14:37:06] [PASSED] drm_test_bridge_auto_first
[14:37:06] [PASSED] drm_test_bridge_rgb_yuv_no_path
[14:37:06] =============== [PASSED] drm_bridge_bus_fmt ================
[14:37:06] ============= drm_cmdline_parser (40 subtests) =============
[14:37:06] [PASSED] drm_test_cmdline_force_d_only
[14:37:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:37:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:37:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:37:06] [PASSED] drm_test_cmdline_force_e_only
[14:37:06] [PASSED] drm_test_cmdline_res
[14:37:06] [PASSED] drm_test_cmdline_res_vesa
[14:37:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:37:06] [PASSED] drm_test_cmdline_res_rblank
[14:37:06] [PASSED] drm_test_cmdline_res_bpp
[14:37:06] [PASSED] drm_test_cmdline_res_refresh
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:37:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:37:06] [PASSED] drm_test_cmdline_res_margins_force_on
[14:37:06] [PASSED] drm_test_cmdline_res_vesa_margins
[14:37:06] [PASSED] drm_test_cmdline_name
[14:37:06] [PASSED] drm_test_cmdline_name_bpp
[14:37:06] [PASSED] drm_test_cmdline_name_option
[14:37:06] [PASSED] drm_test_cmdline_name_bpp_option
[14:37:06] [PASSED] drm_test_cmdline_rotate_0
[14:37:06] [PASSED] drm_test_cmdline_rotate_90
[14:37:06] [PASSED] drm_test_cmdline_rotate_180
[14:37:06] [PASSED] drm_test_cmdline_rotate_270
[14:37:06] [PASSED] drm_test_cmdline_hmirror
[14:37:06] [PASSED] drm_test_cmdline_vmirror
[14:37:06] [PASSED] drm_test_cmdline_margin_options
[14:37:06] [PASSED] drm_test_cmdline_multiple_options
[14:37:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:37:06] [PASSED] drm_test_cmdline_extra_and_option
[14:37:06] [PASSED] drm_test_cmdline_freestanding_options
[14:37:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:37:06] [PASSED] drm_test_cmdline_panel_orientation
[14:37:06] ================ drm_test_cmdline_invalid  =================
[14:37:06] [PASSED] margin_only
[14:37:06] [PASSED] interlace_only
[14:37:06] [PASSED] res_missing_x
[14:37:06] [PASSED] res_missing_y
[14:37:06] [PASSED] res_bad_y
[14:37:06] [PASSED] res_missing_y_bpp
[14:37:06] [PASSED] res_bad_bpp
[14:37:06] [PASSED] res_bad_refresh
[14:37:06] [PASSED] res_bpp_refresh_force_on_off
[14:37:06] [PASSED] res_invalid_mode
[14:37:06] [PASSED] res_bpp_wrong_place_mode
[14:37:06] [PASSED] name_bpp_refresh
[14:37:06] [PASSED] name_refresh
[14:37:06] [PASSED] name_refresh_wrong_mode
[14:37:06] [PASSED] name_refresh_invalid_mode
[14:37:06] [PASSED] rotate_multiple
[14:37:06] [PASSED] rotate_invalid_val
[14:37:06] [PASSED] rotate_truncated
[14:37:06] [PASSED] invalid_option
[14:37:06] [PASSED] invalid_tv_option
[14:37:06] [PASSED] truncated_tv_option
[14:37:06] ============ [PASSED] drm_test_cmdline_invalid =============
[14:37:06] =============== drm_test_cmdline_tv_options  ===============
[14:37:06] [PASSED] NTSC
[14:37:06] [PASSED] NTSC_443
[14:37:06] [PASSED] NTSC_J
[14:37:06] [PASSED] PAL
[14:37:06] [PASSED] PAL_M
[14:37:06] [PASSED] PAL_N
[14:37:06] [PASSED] SECAM
[14:37:06] [PASSED] MONO_525
[14:37:06] [PASSED] MONO_625
[14:37:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:37:06] =============== [PASSED] drm_cmdline_parser ================
[14:37:06] ========== drmm_connector_hdmi_init (20 subtests) ==========
[14:37:06] [PASSED] drm_test_connector_hdmi_init_valid
[14:37:06] [PASSED] drm_test_connector_hdmi_init_bpc_8
[14:37:06] [PASSED] drm_test_connector_hdmi_init_bpc_10
[14:37:06] [PASSED] drm_test_connector_hdmi_init_bpc_12
[14:37:06] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[14:37:06] [PASSED] drm_test_connector_hdmi_init_bpc_null
[14:37:06] [PASSED] drm_test_connector_hdmi_init_formats_empty
[14:37:06] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[14:37:06] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[14:37:06] [PASSED] supported_formats=0x9 yuv420_allowed=1
[14:37:06] [PASSED] supported_formats=0x9 yuv420_allowed=0
[14:37:06] [PASSED] supported_formats=0x5 yuv420_allowed=1
[14:37:06] [PASSED] supported_formats=0x5 yuv420_allowed=0
[14:37:06] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[14:37:06] [PASSED] drm_test_connector_hdmi_init_null_ddc
[14:37:06] [PASSED] drm_test_connector_hdmi_init_null_product
[14:37:06] [PASSED] drm_test_connector_hdmi_init_null_vendor
[14:37:06] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[14:37:06] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[14:37:06] [PASSED] drm_test_connector_hdmi_init_product_valid
[14:37:06] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[14:37:06] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[14:37:06] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[14:37:06] ========= drm_test_connector_hdmi_init_type_valid  =========
[14:37:06] [PASSED] HDMI-A
[14:37:06] [PASSED] HDMI-B
[14:37:06] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[14:37:06] ======== drm_test_connector_hdmi_init_type_invalid  ========
[14:37:06] [PASSED] Unknown
[14:37:06] [PASSED] VGA
[14:37:06] [PASSED] DVI-I
[14:37:06] [PASSED] DVI-D
[14:37:06] [PASSED] DVI-A
[14:37:06] [PASSED] Composite
[14:37:06] [PASSED] SVIDEO
[14:37:06] [PASSED] LVDS
[14:37:06] [PASSED] Component
[14:37:06] [PASSED] DIN
[14:37:06] [PASSED] DP
[14:37:06] [PASSED] TV
[14:37:06] [PASSED] eDP
[14:37:06] [PASSED] Virtual
[14:37:06] [PASSED] DSI
[14:37:06] [PASSED] DPI
[14:37:06] [PASSED] Writeback
[14:37:06] [PASSED] SPI
[14:37:06] [PASSED] USB
[14:37:06] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[14:37:06] ============ [PASSED] drmm_connector_hdmi_init =============
[14:37:06] ============= drmm_connector_init (3 subtests) =============
[14:37:06] [PASSED] drm_test_drmm_connector_init
[14:37:06] [PASSED] drm_test_drmm_connector_init_null_ddc
[14:37:06] ========= drm_test_drmm_connector_init_type_valid  =========
[14:37:06] [PASSED] Unknown
[14:37:06] [PASSED] VGA
[14:37:06] [PASSED] DVI-I
[14:37:06] [PASSED] DVI-D
[14:37:06] [PASSED] DVI-A
[14:37:06] [PASSED] Composite
[14:37:06] [PASSED] SVIDEO
[14:37:06] [PASSED] LVDS
[14:37:06] [PASSED] Component
[14:37:06] [PASSED] DIN
[14:37:06] [PASSED] DP
[14:37:06] [PASSED] HDMI-A
[14:37:06] [PASSED] HDMI-B
[14:37:06] [PASSED] TV
[14:37:06] [PASSED] eDP
[14:37:06] [PASSED] Virtual
[14:37:06] [PASSED] DSI
[14:37:06] [PASSED] DPI
[14:37:06] [PASSED] Writeback
[14:37:06] [PASSED] SPI
[14:37:06] [PASSED] USB
[14:37:06] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[14:37:06] =============== [PASSED] drmm_connector_init ===============
[14:37:06] ========= drm_connector_dynamic_init (6 subtests) ==========
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_init
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_init_properties
[14:37:06] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[14:37:06] [PASSED] Unknown
[14:37:06] [PASSED] VGA
[14:37:06] [PASSED] DVI-I
[14:37:06] [PASSED] DVI-D
[14:37:06] [PASSED] DVI-A
[14:37:06] [PASSED] Composite
[14:37:06] [PASSED] SVIDEO
[14:37:06] [PASSED] LVDS
[14:37:06] [PASSED] Component
[14:37:06] [PASSED] DIN
[14:37:06] [PASSED] DP
[14:37:06] [PASSED] HDMI-A
[14:37:06] [PASSED] HDMI-B
[14:37:06] [PASSED] TV
[14:37:06] [PASSED] eDP
[14:37:06] [PASSED] Virtual
[14:37:06] [PASSED] DSI
[14:37:06] [PASSED] DPI
[14:37:06] [PASSED] Writeback
[14:37:06] [PASSED] SPI
[14:37:06] [PASSED] USB
[14:37:06] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[14:37:06] ======== drm_test_drm_connector_dynamic_init_name  =========
[14:37:06] [PASSED] Unknown
[14:37:06] [PASSED] VGA
[14:37:06] [PASSED] DVI-I
[14:37:06] [PASSED] DVI-D
[14:37:06] [PASSED] DVI-A
[14:37:06] [PASSED] Composite
[14:37:06] [PASSED] SVIDEO
[14:37:06] [PASSED] LVDS
[14:37:06] [PASSED] Component
[14:37:06] [PASSED] DIN
[14:37:06] [PASSED] DP
[14:37:06] [PASSED] HDMI-A
[14:37:06] [PASSED] HDMI-B
[14:37:06] [PASSED] TV
[14:37:06] [PASSED] eDP
[14:37:06] [PASSED] Virtual
[14:37:06] [PASSED] DSI
[14:37:06] [PASSED] DPI
[14:37:06] [PASSED] Writeback
[14:37:06] [PASSED] SPI
[14:37:06] [PASSED] USB
[14:37:06] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[14:37:06] =========== [PASSED] drm_connector_dynamic_init ============
[14:37:06] ==== drm_connector_dynamic_register_early (4 subtests) =====
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[14:37:06] ====== [PASSED] drm_connector_dynamic_register_early =======
[14:37:06] ======= drm_connector_dynamic_register (7 subtests) ========
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[14:37:06] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[14:37:06] ========= [PASSED] drm_connector_dynamic_register ==========
[14:37:06] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[14:37:06] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[14:37:06] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[14:37:06] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[14:37:06] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[14:37:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:37:06] [PASSED] NTSC
[14:37:06] [PASSED] NTSC-443
[14:37:06] [PASSED] NTSC-J
[14:37:06] [PASSED] PAL
[14:37:06] [PASSED] PAL-M
[14:37:06] [PASSED] PAL-N
[14:37:06] [PASSED] SECAM
[14:37:06] [PASSED] Mono
[14:37:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:37:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:37:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:37:06] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[14:37:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[14:37:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[14:37:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[14:37:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[14:37:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[14:37:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[14:37:06] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[14:37:06] [PASSED] VIC 96
[14:37:06] [PASSED] VIC 97
[14:37:06] [PASSED] VIC 101
[14:37:06] [PASSED] VIC 102
[14:37:06] [PASSED] VIC 106
[14:37:06] [PASSED] VIC 107
[14:37:06] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[14:37:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[14:37:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[14:37:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[14:37:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[14:37:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[14:37:06] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[14:37:06] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[14:37:06] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[14:37:06] [PASSED] Automatic
[14:37:06] [PASSED] Full
[14:37:06] [PASSED] Limited 16:235
[14:37:06] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[14:37:06] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[14:37:06] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[14:37:06] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[14:37:06] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[14:37:06] [PASSED] RGB
[14:37:06] [PASSED] YUV 4:2:0
[14:37:06] [PASSED] YUV 4:2:2
[14:37:06] [PASSED] YUV 4:4:4
[14:37:06] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[14:37:06] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[14:37:06] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[14:37:06] ============= drm_damage_helper (21 subtests) ==============
[14:37:06] [PASSED] drm_test_damage_iter_no_damage
[14:37:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:37:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:37:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:37:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:37:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:37:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:37:06] [PASSED] drm_test_damage_iter_simple_damage
[14:37:06] [PASSED] drm_test_damage_iter_single_damage
[14:37:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:37:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:37:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:37:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:37:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:37:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:37:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:37:06] [PASSED] drm_test_damage_iter_damage
[14:37:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:37:06] [PASSED] drm_test_damage_iter_damage_one_outside
[14:37:06] [PASSED] drm_test_damage_iter_damage_src_moved
[14:37:06] [PASSED] drm_test_damage_iter_damage_not_visible
[14:37:06] ================ [PASSED] drm_damage_helper ================
[14:37:06] ============== drm_dp_mst_helper (3 subtests) ==============
[14:37:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:37:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:37:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:37:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:37:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:37:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:37:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:37:06] ============== drm_test_dp_mst_calc_pbn_div  ===============
[14:37:06] [PASSED] Link rate 2000000 lane count 4
[14:37:06] [PASSED] Link rate 2000000 lane count 2
[14:37:06] [PASSED] Link rate 2000000 lane count 1
[14:37:06] [PASSED] Link rate 1350000 lane count 4
[14:37:06] [PASSED] Link rate 1350000 lane count 2
[14:37:06] [PASSED] Link rate 1350000 lane count 1
[14:37:06] [PASSED] Link rate 1000000 lane count 4
[14:37:06] [PASSED] Link rate 1000000 lane count 2
[14:37:06] [PASSED] Link rate 1000000 lane count 1
[14:37:06] [PASSED] Link rate 810000 lane count 4
[14:37:06] [PASSED] Link rate 810000 lane count 2
[14:37:06] [PASSED] Link rate 810000 lane count 1
[14:37:06] [PASSED] Link rate 540000 lane count 4
[14:37:06] [PASSED] Link rate 540000 lane count 2
[14:37:06] [PASSED] Link rate 540000 lane count 1
[14:37:06] [PASSED] Link rate 270000 lane count 4
[14:37:06] [PASSED] Link rate 270000 lane count 2
[14:37:06] [PASSED] Link rate 270000 lane count 1
[14:37:06] [PASSED] Link rate 162000 lane count 4
[14:37:06] [PASSED] Link rate 162000 lane count 2
[14:37:06] [PASSED] Link rate 162000 lane count 1
[14:37:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[14:37:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:37:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:37:06] [PASSED] DP_POWER_UP_PHY with port number
[14:37:06] [PASSED] DP_POWER_DOWN_PHY with port number
[14:37:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:37:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:37:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:37:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:37:06] [PASSED] DP_QUERY_PAYLOAD with port number
[14:37:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:37:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:37:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:37:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:37:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:37:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:37:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:37:06] [PASSED] DP_REMOTE_I2C_READ with port number
[14:37:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:37:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:37:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:37:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:37:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:37:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:37:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:37:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:37:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:37:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:37:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:37:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:37:06] ================ [PASSED] drm_dp_mst_helper ================
[14:37:06] ================== drm_exec (7 subtests) ===================
[14:37:06] [PASSED] sanitycheck
[14:37:06] [PASSED] test_lock
[14:37:06] [PASSED] test_lock_unlock
[14:37:06] [PASSED] test_duplicates
[14:37:06] [PASSED] test_prepare
[14:37:06] [PASSED] test_prepare_array
[14:37:06] [PASSED] test_multiple_loops
[14:37:06] ==================== [PASSED] drm_exec =====================
[14:37:06] =========== drm_format_helper_test (17 subtests) ===========
[14:37:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:37:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:37:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:37:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:37:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:37:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:37:06] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:37:06] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[14:37:06] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:37:06] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:37:06] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:37:06] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:37:06] ==================== drm_test_fb_swab  =====================
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ================ [PASSED] drm_test_fb_swab =================
[14:37:06] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[14:37:06] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[14:37:06] [PASSED] single_pixel_source_buffer
[14:37:06] [PASSED] single_pixel_clip_rectangle
[14:37:06] [PASSED] well_known_colors
[14:37:06] [PASSED] destination_pitch
[14:37:06] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[14:37:06] ================= drm_test_fb_clip_offset  =================
[14:37:06] [PASSED] pass through
[14:37:06] [PASSED] horizontal offset
[14:37:06] [PASSED] vertical offset
[14:37:06] [PASSED] horizontal and vertical offset
[14:37:06] [PASSED] horizontal offset (custom pitch)
[14:37:06] [PASSED] vertical offset (custom pitch)
[14:37:06] [PASSED] horizontal and vertical offset (custom pitch)
[14:37:06] ============= [PASSED] drm_test_fb_clip_offset =============
[14:37:06] =================== drm_test_fb_memcpy  ====================
[14:37:06] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:37:06] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:37:06] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:37:06] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:37:06] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:37:06] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:37:06] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:37:06] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:37:06] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:37:06] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:37:06] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:37:06] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:37:06] =============== [PASSED] drm_test_fb_memcpy ================
[14:37:06] ============= [PASSED] drm_format_helper_test ==============
[14:37:06] ================= drm_format (18 subtests) =================
[14:37:06] [PASSED] drm_test_format_block_width_invalid
[14:37:06] [PASSED] drm_test_format_block_width_one_plane
[14:37:06] [PASSED] drm_test_format_block_width_two_plane
[14:37:06] [PASSED] drm_test_format_block_width_three_plane
[14:37:06] [PASSED] drm_test_format_block_width_tiled
[14:37:06] [PASSED] drm_test_format_block_height_invalid
[14:37:06] [PASSED] drm_test_format_block_height_one_plane
[14:37:06] [PASSED] drm_test_format_block_height_two_plane
[14:37:06] [PASSED] drm_test_format_block_height_three_plane
[14:37:06] [PASSED] drm_test_format_block_height_tiled
[14:37:06] [PASSED] drm_test_format_min_pitch_invalid
[14:37:06] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:37:06] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:37:06] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:37:06] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:37:06] [PASSED] drm_test_format_min_pitch_two_plane
[14:37:06] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:37:06] [PASSED] drm_test_format_min_pitch_tiled
[14:37:06] =================== [PASSED] drm_format ====================
[14:37:06] ============== drm_framebuffer (10 subtests) ===============
[14:37:06] ========== drm_test_framebuffer_check_src_coords  ==========
[14:37:06] [PASSED] Success: source fits into fb
[14:37:06] [PASSED] Fail: overflowing fb with x-axis coordinate
[14:37:06] [PASSED] Fail: overflowing fb with y-axis coordinate
[14:37:06] [PASSED] Fail: overflowing fb with source width
[14:37:06] [PASSED] Fail: overflowing fb with source height
[14:37:06] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[14:37:06] [PASSED] drm_test_framebuffer_cleanup
[14:37:06] =============== drm_test_framebuffer_create  ===============
[14:37:06] [PASSED] ABGR8888 normal sizes
[14:37:06] [PASSED] ABGR8888 max sizes
[14:37:06] [PASSED] ABGR8888 pitch greater than min required
[14:37:06] [PASSED] ABGR8888 pitch less than min required
[14:37:06] [PASSED] ABGR8888 Invalid width
[14:37:06] [PASSED] ABGR8888 Invalid buffer handle
[14:37:06] [PASSED] No pixel format
[14:37:06] [PASSED] ABGR8888 Width 0
[14:37:06] [PASSED] ABGR8888 Height 0
[14:37:06] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:37:06] [PASSED] ABGR8888 Large buffer offset
[14:37:06] [PASSED] ABGR8888 Buffer offset for inexistent plane
[14:37:06] [PASSED] ABGR8888 Invalid flag
[14:37:06] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:37:06] [PASSED] ABGR8888 Valid buffer modifier
[14:37:06] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:37:06] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:37:06] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:37:06] [PASSED] NV12 Normal sizes
[14:37:06] [PASSED] NV12 Max sizes
[14:37:06] [PASSED] NV12 Invalid pitch
[14:37:06] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:37:06] [PASSED] NV12 different  modifier per-plane
[14:37:06] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:37:06] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:37:06] [PASSED] NV12 Modifier for inexistent plane
[14:37:06] [PASSED] NV12 Handle for inexistent plane
[14:37:06] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:37:06] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:37:06] [PASSED] YVU420 Normal sizes
[14:37:06] [PASSED] YVU420 Max sizes
[14:37:06] [PASSED] YVU420 Invalid pitch
[14:37:06] [PASSED] YVU420 Different pitches
[14:37:06] [PASSED] YVU420 Different buffer offsets/pitches
[14:37:06] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:37:06] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:37:06] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:37:06] [PASSED] YVU420 Valid modifier
[14:37:06] [PASSED] YVU420 Different modifiers per plane
[14:37:06] [PASSED] YVU420 Modifier for inexistent plane
[14:37:06] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[14:37:06] [PASSED] X0L2 Normal sizes
[14:37:06] [PASSED] X0L2 Max sizes
[14:37:06] [PASSED] X0L2 Invalid pitch
[14:37:06] [PASSED] X0L2 Pitch greater than minimum required
[14:37:06] [PASSED] X0L2 Handle for inexistent plane
[14:37:06] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:37:06] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:37:06] [PASSED] X0L2 Valid modifier
[14:37:06] [PASSED] X0L2 Modifier for inexistent plane
[14:37:06] =========== [PASSED] drm_test_framebuffer_create ===========
[14:37:06] [PASSED] drm_test_framebuffer_free
[14:37:06] [PASSED] drm_test_framebuffer_init
[14:37:06] [PASSED] drm_test_framebuffer_init_bad_format
[14:37:06] [PASSED] drm_test_framebuffer_init_dev_mismatch
[14:37:06] [PASSED] drm_test_framebuffer_lookup
[14:37:06] [PASSED] drm_test_framebuffer_lookup_inexistent
[14:37:06] [PASSED] drm_test_framebuffer_modifiers_not_supported
[14:37:06] ================= [PASSED] drm_framebuffer =================
[14:37:06] ================ drm_gem_shmem (8 subtests) ================
[14:37:06] [PASSED] drm_gem_shmem_test_obj_create
[14:37:06] [PASSED] drm_gem_shmem_test_obj_create_private
[14:37:06] [PASSED] drm_gem_shmem_test_pin_pages
[14:37:06] [PASSED] drm_gem_shmem_test_vmap
[14:37:06] [PASSED] drm_gem_shmem_test_get_sg_table
[14:37:06] [PASSED] drm_gem_shmem_test_get_pages_sgt
[14:37:06] [PASSED] drm_gem_shmem_test_madvise
[14:37:06] [PASSED] drm_gem_shmem_test_purge
[14:37:06] ================== [PASSED] drm_gem_shmem ==================
[14:37:06] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[14:37:06] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[14:37:06] [PASSED] Automatic
[14:37:06] [PASSED] Full
[14:37:06] [PASSED] Limited 16:235
[14:37:06] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[14:37:06] [PASSED] drm_test_check_disable_connector
[14:37:06] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[14:37:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[14:37:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[14:37:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[14:37:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[14:37:06] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[14:37:06] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[14:37:06] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[14:37:06] [PASSED] drm_test_check_output_bpc_dvi
[14:37:06] [PASSED] drm_test_check_output_bpc_format_vic_1
[14:37:06] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[14:37:06] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[14:37:06] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[14:37:06] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[14:37:06] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[14:37:06] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[14:37:06] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[14:37:06] ============ drm_test_check_hdmi_color_format  =============
[14:37:06] [PASSED] AUTO -> RGB
[14:37:06] [PASSED] YCBCR422 -> YUV422
[14:37:06] [PASSED] YCBCR420 -> YUV420
[14:37:06] [PASSED] YCBCR444 -> YUV444
[14:37:06] [PASSED] RGB -> RGB
[14:37:06] ======== [PASSED] drm_test_check_hdmi_color_format =========
[14:37:06] ======== drm_test_check_hdmi_color_format_420_only  ========
[14:37:06] [PASSED] RGB should fail
[14:37:06] [PASSED] YUV444 should fail
[14:37:06] [PASSED] YUV422 should fail
[14:37:06] [PASSED] YUV420 should work
[14:37:06] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[14:37:06] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[14:37:06] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[14:37:06] [PASSED] drm_test_check_broadcast_rgb_value
[14:37:06] [PASSED] drm_test_check_bpc_8_value
[14:37:06] [PASSED] drm_test_check_bpc_10_value
[14:37:06] [PASSED] drm_test_check_bpc_12_value
[14:37:06] [PASSED] drm_test_check_format_value
[14:37:06] [PASSED] drm_test_check_tmds_char_value
[14:37:06] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[14:37:06] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[14:37:06] [PASSED] drm_test_check_mode_valid
[14:37:06] [PASSED] drm_test_check_mode_valid_reject
[14:37:06] [PASSED] drm_test_check_mode_valid_reject_rate
[14:37:06] [PASSED] drm_test_check_mode_valid_reject_max_clock
[14:37:06] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[14:37:06] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[14:37:06] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[14:37:06] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[14:37:06] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[14:37:06] [PASSED] drm_test_check_infoframes
[14:37:06] [PASSED] drm_test_check_reject_avi_infoframe
[14:37:06] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[14:37:06] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[14:37:06] [PASSED] drm_test_check_reject_audio_infoframe
[14:37:06] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[14:37:06] ================= drm_managed (2 subtests) =================
[14:37:06] [PASSED] drm_test_managed_release_action
[14:37:06] [PASSED] drm_test_managed_run_action
[14:37:06] =================== [PASSED] drm_managed ===================
[14:37:06] =================== drm_mm (6 subtests) ====================
[14:37:06] [PASSED] drm_test_mm_init
[14:37:06] [PASSED] drm_test_mm_debug
[14:37:06] [PASSED] drm_test_mm_align32
[14:37:06] [PASSED] drm_test_mm_align64
[14:37:06] [PASSED] drm_test_mm_lowest
[14:37:06] [PASSED] drm_test_mm_highest
[14:37:06] ===================== [PASSED] drm_mm ======================
[14:37:06] ============= drm_modes_analog_tv (5 subtests) =============
[14:37:06] [PASSED] drm_test_modes_analog_tv_mono_576i
[14:37:06] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:37:06] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:37:06] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:37:06] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:37:06] =============== [PASSED] drm_modes_analog_tv ===============
[14:37:06] ============== drm_plane_helper (2 subtests) ===============
[14:37:06] =============== drm_test_check_plane_state  ================
[14:37:06] [PASSED] clipping_simple
[14:37:06] [PASSED] clipping_rotate_reflect
[14:37:06] [PASSED] positioning_simple
[14:37:06] [PASSED] upscaling
[14:37:06] [PASSED] downscaling
[14:37:06] [PASSED] rounding1
[14:37:06] [PASSED] rounding2
[14:37:06] [PASSED] rounding3
[14:37:06] [PASSED] rounding4
[14:37:06] =========== [PASSED] drm_test_check_plane_state ============
[14:37:06] =========== drm_test_check_invalid_plane_state  ============
[14:37:06] [PASSED] positioning_invalid
[14:37:06] [PASSED] upscaling_invalid
[14:37:06] [PASSED] downscaling_invalid
[14:37:06] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:37:06] ================ [PASSED] drm_plane_helper =================
[14:37:06] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[14:37:06] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:37:06] [PASSED] None
[14:37:06] [PASSED] PAL
[14:37:06] [PASSED] NTSC
[14:37:06] [PASSED] Both, NTSC Default
[14:37:06] [PASSED] Both, PAL Default
[14:37:06] [PASSED] Both, NTSC Default, with PAL on command-line
[14:37:06] [PASSED] Both, PAL Default, with NTSC on command-line
[14:37:06] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:37:06] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:37:06] ================== drm_rect (9 subtests) ===================
[14:37:06] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:37:06] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:37:06] [PASSED] drm_test_rect_clip_scaled_clipped
[14:37:06] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:37:06] ================= drm_test_rect_intersect  =================
[14:37:06] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:37:06] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:37:06] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:37:06] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:37:06] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:37:06] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:37:06] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:37:06] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:37:06] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:37:06] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:37:06] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:37:06] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:37:06] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:37:06] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:37:06] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:37:06] ============= [PASSED] drm_test_rect_intersect =============
[14:37:06] ================ drm_test_rect_calc_hscale  ================
[14:37:06] [PASSED] normal use
[14:37:06] [PASSED] out of max range
[14:37:06] [PASSED] out of min range
[14:37:06] [PASSED] zero dst
[14:37:06] [PASSED] negative src
[14:37:06] [PASSED] negative dst
[14:37:06] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:37:06] ================ drm_test_rect_calc_vscale  ================
[14:37:06] [PASSED] normal use
[14:37:06] [PASSED] out of max range
[14:37:06] [PASSED] out of min range
[14:37:06] [PASSED] zero dst
[14:37:06] [PASSED] negative src
[14:37:06] [PASSED] negative dst
[14:37:06] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:37:06] ================== drm_test_rect_rotate  ===================
[14:37:06] [PASSED] reflect-x
[14:37:06] [PASSED] reflect-y
[14:37:06] [PASSED] rotate-0
[14:37:06] [PASSED] rotate-90
[14:37:06] [PASSED] rotate-180
[14:37:06] [PASSED] rotate-270
[14:37:06] ============== [PASSED] drm_test_rect_rotate ===============
[14:37:06] ================ drm_test_rect_rotate_inv  =================
[14:37:06] [PASSED] reflect-x
[14:37:06] [PASSED] reflect-y
[14:37:06] [PASSED] rotate-0
[14:37:06] [PASSED] rotate-90
[14:37:06] [PASSED] rotate-180
[14:37:06] [PASSED] rotate-270
[14:37:06] ============ [PASSED] drm_test_rect_rotate_inv =============
[14:37:06] ==================== [PASSED] drm_rect =====================
[14:37:06] ============ drm_sysfb_modeset_test (1 subtest) ============
[14:37:06] ============ drm_test_sysfb_build_fourcc_list  =============
[14:37:06] [PASSED] no native formats
[14:37:06] [PASSED] XRGB8888 as native format
[14:37:06] [PASSED] remove duplicates
[14:37:06] [PASSED] convert alpha formats
[14:37:06] [PASSED] random formats
[14:37:06] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[14:37:06] ============= [PASSED] drm_sysfb_modeset_test ==============
[14:37:06] ================== drm_fixp (2 subtests) ===================
[14:37:06] [PASSED] drm_test_int2fixp
[14:37:06] [PASSED] drm_test_sm2fixp
[14:37:06] ==================== [PASSED] drm_fixp =====================
[14:37:06] ============================================================
[14:37:06] Testing complete. Ran 641 tests: passed: 641
[14:37:06] Elapsed time: 27.018s total, 1.842s configuring, 24.961s building, 0.187s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[14:37:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:37:08] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:37:19] Starting KUnit Kernel (1/1)...
[14:37:19] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:37:19] ============= refcount_interrupt (4 subtests) ==============
[14:37:19] [PASSED] test_single_irq_change
[14:37:19] [PASSED] test_nested_irq_change
[14:37:19] [PASSED] test_multiple_irq_change
[14:37:19] [PASSED] test_irq_save
[14:37:19] =============== [PASSED] refcount_interrupt ================
[14:37:19] ================= ttm_device (5 subtests) ==================
[14:37:19] [PASSED] ttm_device_init_basic
[14:37:19] [PASSED] ttm_device_init_multiple
[14:37:19] [PASSED] ttm_device_fini_basic
[14:37:19] [PASSED] ttm_device_init_no_vma_man
[14:37:19] ================== ttm_device_init_pools  ==================
[14:37:19] [PASSED] No DMA allocations, no DMA32 required
[14:37:19] [PASSED] DMA allocations, DMA32 required
[14:37:19] [PASSED] No DMA allocations, DMA32 required
[14:37:19] [PASSED] DMA allocations, no DMA32 required
[14:37:19] ============== [PASSED] ttm_device_init_pools ==============
[14:37:19] =================== [PASSED] ttm_device ====================
[14:37:19] ================== ttm_pool (8 subtests) ===================
[14:37:19] ================== ttm_pool_alloc_basic  ===================
[14:37:19] [PASSED] One page
[14:37:19] [PASSED] More than one page
[14:37:19] [PASSED] Above the allocation limit
[14:37:19] [PASSED] One page, with coherent DMA mappings enabled
[14:37:19] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[14:37:19] ============== [PASSED] ttm_pool_alloc_basic ===============
[14:37:19] ============== ttm_pool_alloc_basic_dma_addr  ==============
[14:37:19] [PASSED] One page
[14:37:19] [PASSED] More than one page
[14:37:19] [PASSED] Above the allocation limit
[14:37:19] [PASSED] One page, with coherent DMA mappings enabled
[14:37:19] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[14:37:19] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[14:37:19] [PASSED] ttm_pool_alloc_order_caching_match
[14:37:19] [PASSED] ttm_pool_alloc_caching_mismatch
[14:37:19] [PASSED] ttm_pool_alloc_order_mismatch
[14:37:19] [PASSED] ttm_pool_free_dma_alloc
[14:37:19] [PASSED] ttm_pool_free_no_dma_alloc
[14:37:19] [PASSED] ttm_pool_fini_basic
[14:37:19] ==================== [PASSED] ttm_pool =====================
[14:37:19] ================ ttm_resource (8 subtests) =================
[14:37:19] ================= ttm_resource_init_basic  =================
[14:37:19] [PASSED] Init resource in TTM_PL_SYSTEM
[14:37:19] [PASSED] Init resource in TTM_PL_VRAM
[14:37:19] [PASSED] Init resource in a private placement
[14:37:19] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[14:37:19] ============= [PASSED] ttm_resource_init_basic =============
[14:37:19] [PASSED] ttm_resource_init_pinned
[14:37:19] [PASSED] ttm_resource_fini_basic
[14:37:19] [PASSED] ttm_resource_manager_init_basic
[14:37:19] [PASSED] ttm_resource_manager_usage_basic
[14:37:19] [PASSED] ttm_resource_manager_set_used_basic
[14:37:19] [PASSED] ttm_sys_man_alloc_basic
[14:37:19] [PASSED] ttm_sys_man_free_basic
[14:37:19] ================== [PASSED] ttm_resource ===================
[14:37:19] =================== ttm_tt (15 subtests) ===================
[14:37:19] ==================== ttm_tt_init_basic  ====================
[14:37:19] [PASSED] Page-aligned size
[14:37:19] [PASSED] Extra pages requested
[14:37:19] ================ [PASSED] ttm_tt_init_basic ================
[14:37:19] [PASSED] ttm_tt_init_misaligned
[14:37:19] [PASSED] ttm_tt_fini_basic
[14:37:19] [PASSED] ttm_tt_fini_sg
[14:37:19] [PASSED] ttm_tt_fini_shmem
[14:37:19] [PASSED] ttm_tt_create_basic
[14:37:19] [PASSED] ttm_tt_create_invalid_bo_type
[14:37:19] [PASSED] ttm_tt_create_ttm_exists
[14:37:19] [PASSED] ttm_tt_create_failed
[14:37:19] [PASSED] ttm_tt_destroy_basic
[14:37:19] [PASSED] ttm_tt_populate_null_ttm
[14:37:19] [PASSED] ttm_tt_populate_populated_ttm
[14:37:19] [PASSED] ttm_tt_unpopulate_basic
[14:37:19] [PASSED] ttm_tt_unpopulate_empty_ttm
[14:37:19] [PASSED] ttm_tt_swapin_basic
[14:37:19] ===================== [PASSED] ttm_tt ======================
[14:37:19] =================== ttm_bo (14 subtests) ===================
[14:37:19] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[14:37:19] [PASSED] Cannot be interrupted and sleeps
[14:37:19] [PASSED] Cannot be interrupted, locks straight away
[14:37:19] [PASSED] Can be interrupted, sleeps
[14:37:19] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[14:37:19] [PASSED] ttm_bo_reserve_locked_no_sleep
[14:37:19] [PASSED] ttm_bo_reserve_no_wait_ticket
[14:37:19] [PASSED] ttm_bo_reserve_double_resv
[14:37:19] [PASSED] ttm_bo_reserve_interrupted
[14:37:19] [PASSED] ttm_bo_reserve_deadlock
[14:37:19] [PASSED] ttm_bo_unreserve_basic
[14:37:19] [PASSED] ttm_bo_unreserve_pinned
[14:37:19] [PASSED] ttm_bo_unreserve_bulk
[14:37:19] [PASSED] ttm_bo_fini_basic
[14:37:19] [PASSED] ttm_bo_fini_shared_resv
[14:37:19] [PASSED] ttm_bo_pin_basic
[14:37:19] [PASSED] ttm_bo_pin_unpin_resource
[14:37:19] [PASSED] ttm_bo_multiple_pin_one_unpin
[14:37:19] ===================== [PASSED] ttm_bo ======================
[14:37:19] ============== ttm_bo_validate (22 subtests) ===============
[14:37:19] ============== ttm_bo_init_reserved_sys_man  ===============
[14:37:19] [PASSED] Buffer object for userspace
[14:37:19] [PASSED] Kernel buffer object
[14:37:19] [PASSED] Shared buffer object
[14:37:19] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[14:37:19] ============== ttm_bo_init_reserved_mock_man  ==============
[14:37:19] [PASSED] Buffer object for userspace
[14:37:19] [PASSED] Kernel buffer object
[14:37:19] [PASSED] Shared buffer object
[14:37:19] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[14:37:19] [PASSED] ttm_bo_init_reserved_resv
[14:37:19] ================== ttm_bo_validate_basic  ==================
[14:37:19] [PASSED] Buffer object for userspace
[14:37:19] [PASSED] Kernel buffer object
[14:37:19] [PASSED] Shared buffer object
[14:37:19] ============== [PASSED] ttm_bo_validate_basic ==============
[14:37:19] [PASSED] ttm_bo_validate_invalid_placement
[14:37:19] ============= ttm_bo_validate_same_placement  ==============
[14:37:19] [PASSED] System manager
[14:37:19] [PASSED] VRAM manager
[14:37:19] ========= [PASSED] ttm_bo_validate_same_placement ==========
[14:37:19] [PASSED] ttm_bo_validate_failed_alloc
[14:37:19] [PASSED] ttm_bo_validate_pinned
[14:37:19] [PASSED] ttm_bo_validate_busy_placement
[14:37:19] ================ ttm_bo_validate_multihop  =================
[14:37:19] [PASSED] Buffer object for userspace
[14:37:19] [PASSED] Kernel buffer object
[14:37:19] [PASSED] Shared buffer object
[14:37:19] ============ [PASSED] ttm_bo_validate_multihop =============
[14:37:19] ========== ttm_bo_validate_no_placement_signaled  ==========
[14:37:19] [PASSED] Buffer object in system domain, no page vector
[14:37:19] [PASSED] Buffer object in system domain with an existing page vector
[14:37:19] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[14:37:19] ======== ttm_bo_validate_no_placement_not_signaled  ========
[14:37:19] [PASSED] Buffer object for userspace
[14:37:19] [PASSED] Kernel buffer object
[14:37:19] [PASSED] Shared buffer object
[14:37:19] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[14:37:19] [PASSED] ttm_bo_validate_move_fence_signaled
[14:37:19] ========= ttm_bo_validate_move_fence_not_signaled  =========
[14:37:19] [PASSED] Waits for GPU
[14:37:19] [PASSED] Tries to lock straight away
[14:37:19] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[14:37:19] [PASSED] ttm_bo_validate_swapout
[14:37:19] [PASSED] ttm_bo_validate_happy_evict
[14:37:19] [PASSED] ttm_bo_validate_all_pinned_evict
[14:37:19] [PASSED] ttm_bo_validate_allowed_only_evict
[14:37:19] [PASSED] ttm_bo_validate_deleted_evict
[14:37:19] [PASSED] ttm_bo_validate_busy_domain_evict
[14:37:19] [PASSED] ttm_bo_validate_evict_gutting
[14:37:19] [PASSED] ttm_bo_validate_recrusive_evict
[14:37:19] ================= [PASSED] ttm_bo_validate =================
[14:37:19] ============================================================
[14:37:19] Testing complete. Ran 106 tests: passed: 106
[14:37:19] Elapsed time: 12.217s total, 1.824s configuring, 10.179s building, 0.181s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[14:37:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:37:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:37:29] Starting KUnit Kernel (1/1)...
[14:37:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:37:30] ============= refcount_interrupt (4 subtests) ==============
[14:37:30] [PASSED] test_single_irq_change
[14:37:30] [PASSED] test_nested_irq_change
[14:37:30] [PASSED] test_multiple_irq_change
[14:37:30] [PASSED] test_irq_save
[14:37:30] =============== [PASSED] refcount_interrupt ================
[14:37:30] =============== dma-buf-fence (12 subtests) ================
[14:37:30] [PASSED] test_sanitycheck
[14:37:30] [PASSED] test_signaling
[14:37:30] [PASSED] test_add_callback
[14:37:30] [PASSED] test_late_add_callback
[14:37:30] [PASSED] test_rm_callback
[14:37:30] [PASSED] test_late_rm_callback
[14:37:30] [PASSED] test_status
[14:37:30] [PASSED] test_error
[14:37:30] [PASSED] test_wait
[14:37:30] [PASSED] test_wait_timeout
[14:37:30] [PASSED] test_stub
[14:37:30] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[14:37:30] ================== [PASSED] dma-buf-fence ==================
[14:37:30] ============ dma-buf-fence-chain (11 subtests) =============
[14:37:30] [PASSED] test_sanitycheck
[14:37:30] [PASSED] test_find_seqno
[14:37:30] [PASSED] test_find_signaled
[14:37:30] [PASSED] test_find_out_of_order
[14:37:35] [PASSED] test_find_gap
[14:37:35] [PASSED] test_find_race
[14:37:35] [PASSED] test_signal_forward
[14:37:35] [PASSED] test_signal_backward
[14:37:35] [PASSED] test_wait_forward
[14:37:35] [PASSED] test_wait_backward
[14:37:35] [PASSED] test_wait_random
[14:37:35] =============== [PASSED] dma-buf-fence-chain ===============
[14:37:35] ============ dma-buf-fence-unwrap (10 subtests) ============
[14:37:35] [PASSED] test_sanitycheck
[14:37:35] [PASSED] test_unwrap_array
[14:37:35] [PASSED] test_unwrap_chain
[14:37:35] [PASSED] test_unwrap_chain_array
[14:37:35] [PASSED] test_unwrap_merge
[14:37:35] [PASSED] test_unwrap_merge_duplicate
[14:37:35] [PASSED] test_unwrap_merge_seqno
[14:37:35] [PASSED] test_unwrap_merge_order
[14:37:35] [PASSED] test_unwrap_merge_complex
[14:37:35] [PASSED] test_unwrap_merge_complex_seqno
[14:37:35] ============== [PASSED] dma-buf-fence-unwrap ===============
[14:37:35] ================ dma-buf-resv (5 subtests) =================
[14:37:35] [PASSED] test_sanitycheck
[14:37:35] ===================== test_signaling  ======================
[14:37:35] [PASSED] kernel
[14:37:35] [PASSED] write
[14:37:35] [PASSED] read
[14:37:35] [PASSED] bookkeep
[14:37:35] ================= [PASSED] test_signaling ==================
[14:37:35] ====================== test_for_each  ======================
[14:37:35] [PASSED] kernel
[14:37:35] [PASSED] write
[14:37:35] [PASSED] read
[14:37:35] [PASSED] bookkeep
[14:37:35] ================== [PASSED] test_for_each ==================
[14:37:35] ================= test_for_each_unlocked  ==================
[14:37:35] [PASSED] kernel
[14:37:35] [PASSED] write
[14:37:35] [PASSED] read
[14:37:35] [PASSED] bookkeep
[14:37:35] ============= [PASSED] test_for_each_unlocked ==============
[14:37:35] ===================== test_get_fences  =====================
[14:37:35] [PASSED] kernel
[14:37:35] [PASSED] write
[14:37:35] [PASSED] read
[14:37:35] [PASSED] bookkeep
[14:37:35] ================= [PASSED] test_get_fences =================
[14:37:35] ================== [PASSED] dma-buf-resv ===================
[14:37:35] ============================================================
[14:37:35] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[14:37:35] Elapsed time: 15.882s total, 1.822s configuring, 8.688s building, 5.345s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


