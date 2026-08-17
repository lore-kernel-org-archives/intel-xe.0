Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E52FC5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 13:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E91E10E7CD;
	Mon, 17 Aug 2026 13:03:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A2610E7CA;
 Mon, 17 Aug 2026 13:03:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Split_GuC_ID_space_into_usable?=
 =?utf-8?q?_and_shareable_pools_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Aug 2026 13:03:13 -0000
Message-ID: <178697179373.59130.3951699806148173788@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260817091013.280173-1-piotr.piorkowski@intel.com>
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

Series: Split GuC ID space into usable and shareable pools (rev2)
URL   : https://patchwork.freedesktop.org/series/170767/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:01:35] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:01:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:02:12] Starting KUnit Kernel (1/1)...
[13:02:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:02:12] ================== guc_buf (11 subtests) ===================
[13:02:12] [PASSED] test_smallest
[13:02:12] [PASSED] test_largest
[13:02:12] [PASSED] test_granular
[13:02:12] [PASSED] test_unique
[13:02:12] [PASSED] test_overlap
[13:02:12] [PASSED] test_reusable
[13:02:12] [PASSED] test_too_big
[13:02:12] [PASSED] test_flush
[13:02:12] [PASSED] test_lookup
[13:02:12] [PASSED] test_data
[13:02:12] [PASSED] test_class
[13:02:12] ===================== [PASSED] guc_buf =====================
[13:02:12] =================== guc_dbm (7 subtests) ===================
[13:02:12] [PASSED] test_empty
[13:02:12] [PASSED] test_default
[13:02:12] ======================== test_size  ========================
[13:02:12] [PASSED] 4
[13:02:12] [PASSED] 8
[13:02:12] [PASSED] 32
[13:02:12] [PASSED] 256
[13:02:12] ==================== [PASSED] test_size ====================
[13:02:12] ======================= test_reuse  ========================
[13:02:12] [PASSED] 4
[13:02:12] [PASSED] 8
[13:02:12] [PASSED] 32
[13:02:12] [PASSED] 256
[13:02:12] =================== [PASSED] test_reuse ====================
[13:02:12] =================== test_range_overlap  ====================
[13:02:12] [PASSED] 4
[13:02:12] [PASSED] 8
[13:02:12] [PASSED] 32
[13:02:12] [PASSED] 256
[13:02:12] =============== [PASSED] test_range_overlap ================
[13:02:12] =================== test_range_compact  ====================
[13:02:12] [PASSED] 4
[13:02:12] [PASSED] 8
[13:02:12] [PASSED] 32
[13:02:12] [PASSED] 256
[13:02:12] =============== [PASSED] test_range_compact ================
[13:02:12] ==================== test_range_spare  =====================
[13:02:12] [PASSED] 4
[13:02:12] [PASSED] 8
[13:02:12] [PASSED] 32
[13:02:12] [PASSED] 256
[13:02:12] ================ [PASSED] test_range_spare =================
[13:02:12] ===================== [PASSED] guc_dbm =====================
[13:02:12] ================== guc_idm (21 subtests) ===================
[13:02:12] [PASSED] bad_init
[13:02:12] [PASSED] no_init
[13:02:12] [PASSED] init_fini
[13:02:12] [PASSED] check_init_native
[13:02:12] [PASSED] check_init_small
[13:02:12] [PASSED] check_used
[13:02:12] [PASSED] check_quota
[13:02:12] [PASSED] check_limits
[13:02:12] [PASSED] check_overlap
[13:02:12] [PASSED] check_overlap_alloc
[13:02:12] [PASSED] check_overlap_release
[13:02:12] [PASSED] check_overlap_partial_init
[13:02:12] [PASSED] check_overlap_partial_shared_range_blocking
[13:02:12] [PASSED] check_used_usable
[13:02:12] [PASSED] check_used_shareable
[13:02:12] [PASSED] check_used_mixed
[13:02:12] [PASSED] check_release_usable_range
[13:02:12] [PASSED] check_release_shareable_range
[13:02:12] [PASSED] check_split_boundaries
[13:02:12] [PASSED] check_shareable_spare
[13:02:12] [PASSED] check_all
[13:02:12] ===================== [PASSED] guc_idm =====================
[13:02:12] ================== guc_idm_pf (1 subtest) ==================
[13:02:12] [PASSED] check_init_shared
[13:02:12] =================== [PASSED] guc_idm_pf ====================
[13:02:12] =============== guc_klv_helpers (9 subtests) ===============
[13:02:12] [PASSED] test_count
[13:02:12] [PASSED] test_encode_u32
[13:02:12] [PASSED] test_encode_u64
[13:02:12] [PASSED] test_encode_string
[13:02:12] [PASSED] test_encode_object_raw
[13:02:12] [PASSED] test_encode_object_klv
[13:02:12] [PASSED] test_encode_object_nested
[13:02:12] [PASSED] test_encode_object_basic
[13:02:12] [PASSED] test_print
[13:02:12] ================= [PASSED] guc_klv_helpers =================
[13:02:12] =================== xe_log (4 subtests) ====================
[13:02:12] [PASSED] demo_cper
[13:02:12] [PASSED] demo_dmesg
[13:02:12] ======================= test_dmesg  ========================
[13:02:12] [PASSED] test_fatal
[13:02:12] [PASSED] test_fatal_tile
[13:02:12] [PASSED] test_fatal_gt
[13:02:12] [PASSED] test_fatal_comp
[13:02:12] [PASSED] test_fatal_comp_tile
[13:02:12] [PASSED] test_fatal_comp_gt
[13:02:12] [PASSED] test_fatal_all
[13:02:12] [PASSED] test_recoverable
[13:02:12] [PASSED] test_recoverable_tile
[13:02:12] [PASSED] test_recoverable_gt
[13:02:12] [PASSED] test_recoverable_comp
[13:02:12] [PASSED] test_recoverable_comp_tile
[13:02:12] [PASSED] test_recoverable_comp_gt
[13:02:12] [PASSED] test_recoverable_all
[13:02:12] [PASSED] test_info
[13:02:12] [PASSED] test_info_tile
[13:02:12] [PASSED] test_info_gt
[13:02:12] [PASSED] test_info_err
[13:02:12] [PASSED] test_info_comp
[13:02:12] [PASSED] test_info_comp_tile
[13:02:12] [PASSED] test_info_comp_gt
[13:02:12] [PASSED] test_info_all
[13:02:12] [PASSED] test_hw_fatal
[13:02:12] [PASSED] test_hw_recoverable
[13:02:12] [PASSED] test_hw_corrected
[13:02:12] [PASSED] test_hw_informational
[13:02:12] =================== [PASSED] test_dmesg ====================
[13:02:12] ====================== test_invalid  =======================
[13:02:12] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[13:02:12] ================== [SKIPPED] test_invalid ==================
[13:02:12] ===================== [PASSED] xe_log ======================
[13:02:12] ================== no_relay (3 subtests) ===================
[13:02:12] [PASSED] xe_drops_guc2pf_if_not_ready
[13:02:12] [PASSED] xe_drops_guc2vf_if_not_ready
[13:02:12] [PASSED] xe_rejects_send_if_not_ready
[13:02:12] ==================== [PASSED] no_relay =====================
[13:02:12] ================== pf_relay (14 subtests) ==================
[13:02:12] [PASSED] pf_rejects_guc2pf_too_short
[13:02:12] [PASSED] pf_rejects_guc2pf_too_long
[13:02:12] [PASSED] pf_rejects_guc2pf_no_payload
[13:02:12] [PASSED] pf_fails_no_payload
[13:02:12] [PASSED] pf_fails_bad_origin
[13:02:12] [PASSED] pf_fails_bad_type
[13:02:12] [PASSED] pf_txn_reports_error
[13:02:12] [PASSED] pf_txn_sends_pf2guc
[13:02:12] [PASSED] pf_sends_pf2guc
[13:02:12] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:02:12] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:02:12] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:02:12] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:02:12] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[13:02:12] ==================== [PASSED] pf_relay =====================
[13:02:12] ================== vf_relay (3 subtests) ===================
[13:02:12] [PASSED] vf_rejects_guc2vf_too_short
[13:02:12] [PASSED] vf_rejects_guc2vf_too_long
[13:02:12] [PASSED] vf_rejects_guc2vf_no_payload
[13:02:12] ==================== [PASSED] vf_relay =====================
[13:02:12] ================ pf_gt_config (9 subtests) =================
[13:02:12] [PASSED] fair_contexts_1vf
[13:02:12] [PASSED] fair_doorbells_1vf
[13:02:12] [PASSED] fair_ggtt_1vf
[13:02:12] ====================== fair_vram_1vf  ======================
[13:02:12] [PASSED] 3.50 GiB
[13:02:12] [PASSED] 11.5 GiB
[13:02:12] [PASSED] 15.5 GiB
[13:02:12] [PASSED] 31.5 GiB
[13:02:12] [PASSED] 63.5 GiB
[13:02:12] [PASSED] 1.91 GiB
[13:02:12] ================== [PASSED] fair_vram_1vf ==================
[13:02:12] ================ fair_vram_1vf_admin_only  =================
[13:02:12] [PASSED] 3.50 GiB
[13:02:12] [PASSED] 11.5 GiB
[13:02:12] [PASSED] 15.5 GiB
[13:02:12] [PASSED] 31.5 GiB
[13:02:12] [PASSED] 63.5 GiB
[13:02:12] [PASSED] 1.91 GiB
[13:02:12] ============ [PASSED] fair_vram_1vf_admin_only =============
[13:02:12] ====================== fair_contexts  ======================
[13:02:12] [PASSED] 1 VF
[13:02:12] [PASSED] 2 VFs
[13:02:12] [PASSED] 3 VFs
[13:02:12] [PASSED] 4 VFs
[13:02:12] [PASSED] 5 VFs
[13:02:12] [PASSED] 6 VFs
[13:02:12] [PASSED] 7 VFs
[13:02:12] [PASSED] 8 VFs
[13:02:12] [PASSED] 9 VFs
[13:02:12] [PASSED] 10 VFs
[13:02:12] [PASSED] 11 VFs
[13:02:12] [PASSED] 12 VFs
[13:02:12] [PASSED] 13 VFs
[13:02:12] [PASSED] 14 VFs
[13:02:12] [PASSED] 15 VFs
[13:02:12] [PASSED] 16 VFs
[13:02:12] [PASSED] 17 VFs
[13:02:12] [PASSED] 18 VFs
[13:02:12] [PASSED] 19 VFs
[13:02:12] [PASSED] 20 VFs
[13:02:12] [PASSED] 21 VFs
[13:02:12] [PASSED] 22 VFs
[13:02:12] [PASSED] 23 VFs
[13:02:12] [PASSED] 24 VFs
[13:02:12] [PASSED] 25 VFs
[13:02:12] [PASSED] 26 VFs
[13:02:12] [PASSED] 27 VFs
[13:02:12] [PASSED] 28 VFs
[13:02:12] [PASSED] 29 VFs
[13:02:12] [PASSED] 30 VFs
[13:02:12] [PASSED] 31 VFs
[13:02:12] [PASSED] 32 VFs
[13:02:12] [PASSED] 33 VFs
[13:02:12] [PASSED] 34 VFs
[13:02:12] [PASSED] 35 VFs
[13:02:12] [PASSED] 36 VFs
[13:02:12] [PASSED] 37 VFs
[13:02:12] [PASSED] 38 VFs
[13:02:12] [PASSED] 39 VFs
[13:02:12] [PASSED] 40 VFs
[13:02:12] [PASSED] 41 VFs
[13:02:12] [PASSED] 42 VFs
[13:02:12] [PASSED] 43 VFs
[13:02:12] [PASSED] 44 VFs
[13:02:12] [PASSED] 45 VFs
[13:02:12] [PASSED] 46 VFs
[13:02:12] [PASSED] 47 VFs
[13:02:12] [PASSED] 48 VFs
[13:02:12] [PASSED] 49 VFs
[13:02:12] [PASSED] 50 VFs
[13:02:12] [PASSED] 51 VFs
[13:02:12] [PASSED] 52 VFs
[13:02:12] [PASSED] 53 VFs
[13:02:12] [PASSED] 54 VFs
[13:02:12] [PASSED] 55 VFs
[13:02:12] [PASSED] 56 VFs
[13:02:12] [PASSED] 57 VFs
[13:02:12] [PASSED] 58 VFs
[13:02:12] [PASSED] 59 VFs
[13:02:12] [PASSED] 60 VFs
[13:02:12] [PASSED] 61 VFs
[13:02:12] [PASSED] 62 VFs
[13:02:12] [PASSED] 63 VFs
[13:02:12] ================== [PASSED] fair_contexts ==================
[13:02:12] ===================== fair_doorbells  ======================
[13:02:12] [PASSED] 1 VF
[13:02:12] [PASSED] 2 VFs
[13:02:12] [PASSED] 3 VFs
[13:02:12] [PASSED] 4 VFs
[13:02:12] [PASSED] 5 VFs
[13:02:12] [PASSED] 6 VFs
[13:02:12] [PASSED] 7 VFs
[13:02:12] [PASSED] 8 VFs
[13:02:13] [PASSED] 9 VFs
[13:02:13] [PASSED] 10 VFs
[13:02:13] [PASSED] 11 VFs
[13:02:13] [PASSED] 12 VFs
[13:02:13] [PASSED] 13 VFs
[13:02:13] [PASSED] 14 VFs
[13:02:13] [PASSED] 15 VFs
[13:02:13] [PASSED] 16 VFs
[13:02:13] [PASSED] 17 VFs
[13:02:13] [PASSED] 18 VFs
[13:02:13] [PASSED] 19 VFs
[13:02:13] [PASSED] 20 VFs
[13:02:13] [PASSED] 21 VFs
[13:02:13] [PASSED] 22 VFs
[13:02:13] [PASSED] 23 VFs
[13:02:13] [PASSED] 24 VFs
[13:02:13] [PASSED] 25 VFs
[13:02:13] [PASSED] 26 VFs
[13:02:13] [PASSED] 27 VFs
[13:02:13] [PASSED] 28 VFs
[13:02:13] [PASSED] 29 VFs
[13:02:13] [PASSED] 30 VFs
[13:02:13] [PASSED] 31 VFs
[13:02:13] [PASSED] 32 VFs
[13:02:13] [PASSED] 33 VFs
[13:02:13] [PASSED] 34 VFs
[13:02:13] [PASSED] 35 VFs
[13:02:13] [PASSED] 36 VFs
[13:02:13] [PASSED] 37 VFs
[13:02:13] [PASSED] 38 VFs
[13:02:13] [PASSED] 39 VFs
[13:02:13] [PASSED] 40 VFs
[13:02:13] [PASSED] 41 VFs
[13:02:13] [PASSED] 42 VFs
[13:02:13] [PASSED] 43 VFs
[13:02:13] [PASSED] 44 VFs
[13:02:13] [PASSED] 45 VFs
[13:02:13] [PASSED] 46 VFs
[13:02:13] [PASSED] 47 VFs
[13:02:13] [PASSED] 48 VFs
[13:02:13] [PASSED] 49 VFs
[13:02:13] [PASSED] 50 VFs
[13:02:13] [PASSED] 51 VFs
[13:02:13] [PASSED] 52 VFs
[13:02:13] [PASSED] 53 VFs
[13:02:13] [PASSED] 54 VFs
[13:02:13] [PASSED] 55 VFs
[13:02:13] [PASSED] 56 VFs
[13:02:13] [PASSED] 57 VFs
[13:02:13] [PASSED] 58 VFs
[13:02:13] [PASSED] 59 VFs
[13:02:13] [PASSED] 60 VFs
[13:02:13] [PASSED] 61 VFs
[13:02:13] [PASSED] 62 VFs
[13:02:13] [PASSED] 63 VFs
[13:02:13] ================= [PASSED] fair_doorbells ==================
[13:02:13] ======================== fair_ggtt  ========================
[13:02:13] [PASSED] 1 VF
[13:02:13] [PASSED] 2 VFs
[13:02:13] [PASSED] 3 VFs
[13:02:13] [PASSED] 4 VFs
[13:02:13] [PASSED] 5 VFs
[13:02:13] [PASSED] 6 VFs
[13:02:13] [PASSED] 7 VFs
[13:02:13] [PASSED] 8 VFs
[13:02:13] [PASSED] 9 VFs
[13:02:13] [PASSED] 10 VFs
[13:02:13] [PASSED] 11 VFs
[13:02:13] [PASSED] 12 VFs
[13:02:13] [PASSED] 13 VFs
[13:02:13] [PASSED] 14 VFs
[13:02:13] [PASSED] 15 VFs
[13:02:13] [PASSED] 16 VFs
[13:02:13] [PASSED] 17 VFs
[13:02:13] [PASSED] 18 VFs
[13:02:13] [PASSED] 19 VFs
[13:02:13] [PASSED] 20 VFs
[13:02:13] [PASSED] 21 VFs
[13:02:13] [PASSED] 22 VFs
[13:02:13] [PASSED] 23 VFs
[13:02:13] [PASSED] 24 VFs
[13:02:13] [PASSED] 25 VFs
[13:02:13] [PASSED] 26 VFs
[13:02:13] [PASSED] 27 VFs
[13:02:13] [PASSED] 28 VFs
[13:02:13] [PASSED] 29 VFs
[13:02:13] [PASSED] 30 VFs
[13:02:13] [PASSED] 31 VFs
[13:02:13] [PASSED] 32 VFs
[13:02:13] [PASSED] 33 VFs
[13:02:13] [PASSED] 34 VFs
[13:02:13] [PASSED] 35 VFs
[13:02:13] [PASSED] 36 VFs
[13:02:13] [PASSED] 37 VFs
[13:02:13] [PASSED] 38 VFs
[13:02:13] [PASSED] 39 VFs
[13:02:13] [PASSED] 40 VFs
[13:02:13] [PASSED] 41 VFs
[13:02:13] [PASSED] 42 VFs
[13:02:13] [PASSED] 43 VFs
[13:02:13] [PASSED] 44 VFs
[13:02:13] [PASSED] 45 VFs
[13:02:13] [PASSED] 46 VFs
[13:02:13] [PASSED] 47 VFs
[13:02:13] [PASSED] 48 VFs
[13:02:13] [PASSED] 49 VFs
[13:02:13] [PASSED] 50 VFs
[13:02:13] [PASSED] 51 VFs
[13:02:13] [PASSED] 52 VFs
[13:02:13] [PASSED] 53 VFs
[13:02:13] [PASSED] 54 VFs
[13:02:13] [PASSED] 55 VFs
[13:02:13] [PASSED] 56 VFs
[13:02:13] [PASSED] 57 VFs
[13:02:13] [PASSED] 58 VFs
[13:02:13] [PASSED] 59 VFs
[13:02:13] [PASSED] 60 VFs
[13:02:13] [PASSED] 61 VFs
[13:02:13] [PASSED] 62 VFs
[13:02:13] [PASSED] 63 VFs
[13:02:13] ==================== [PASSED] fair_ggtt ====================
[13:02:13] ======================== fair_vram  ========================
[13:02:13] [PASSED] 1 VF
[13:02:13] [PASSED] 2 VFs
[13:02:13] [PASSED] 3 VFs
[13:02:13] [PASSED] 4 VFs
[13:02:13] [PASSED] 5 VFs
[13:02:13] [PASSED] 6 VFs
[13:02:13] [PASSED] 7 VFs
[13:02:13] [PASSED] 8 VFs
[13:02:13] [PASSED] 9 VFs
[13:02:13] [PASSED] 10 VFs
[13:02:13] [PASSED] 11 VFs
[13:02:13] [PASSED] 12 VFs
[13:02:13] [PASSED] 13 VFs
[13:02:13] [PASSED] 14 VFs
[13:02:13] [PASSED] 15 VFs
[13:02:13] [PASSED] 16 VFs
[13:02:13] [PASSED] 17 VFs
[13:02:13] [PASSED] 18 VFs
[13:02:13] [PASSED] 19 VFs
[13:02:13] [PASSED] 20 VFs
[13:02:13] [PASSED] 21 VFs
[13:02:13] [PASSED] 22 VFs
[13:02:13] [PASSED] 23 VFs
[13:02:13] [PASSED] 24 VFs
[13:02:13] [PASSED] 25 VFs
[13:02:13] [PASSED] 26 VFs
[13:02:13] [PASSED] 27 VFs
[13:02:13] [PASSED] 28 VFs
[13:02:13] [PASSED] 29 VFs
[13:02:13] [PASSED] 30 VFs
[13:02:13] [PASSED] 31 VFs
[13:02:13] [PASSED] 32 VFs
[13:02:13] [PASSED] 33 VFs
[13:02:13] [PASSED] 34 VFs
[13:02:13] [PASSED] 35 VFs
[13:02:13] [PASSED] 36 VFs
[13:02:13] [PASSED] 37 VFs
[13:02:13] [PASSED] 38 VFs
[13:02:13] [PASSED] 39 VFs
[13:02:13] [PASSED] 40 VFs
[13:02:13] [PASSED] 41 VFs
[13:02:13] [PASSED] 42 VFs
[13:02:13] [PASSED] 43 VFs
[13:02:13] [PASSED] 44 VFs
[13:02:13] [PASSED] 45 VFs
[13:02:13] [PASSED] 46 VFs
[13:02:13] [PASSED] 47 VFs
[13:02:13] [PASSED] 48 VFs
[13:02:13] [PASSED] 49 VFs
[13:02:13] [PASSED] 50 VFs
[13:02:13] [PASSED] 51 VFs
[13:02:13] [PASSED] 52 VFs
[13:02:13] [PASSED] 53 VFs
[13:02:13] [PASSED] 54 VFs
[13:02:13] [PASSED] 55 VFs
[13:02:13] [PASSED] 56 VFs
[13:02:13] [PASSED] 57 VFs
[13:02:13] [PASSED] 58 VFs
[13:02:13] [PASSED] 59 VFs
[13:02:13] [PASSED] 60 VFs
[13:02:13] [PASSED] 61 VFs
[13:02:13] [PASSED] 62 VFs
[13:02:13] [PASSED] 63 VFs
[13:02:13] ==================== [PASSED] fair_vram ====================
[13:02:13] ================== [PASSED] pf_gt_config ===================
[13:02:13] ===================== lmtt (1 subtest) =====================
[13:02:13] ======================== test_ops  =========================
[13:02:13] [PASSED] 2-level
[13:02:13] [PASSED] multi-level
[13:02:13] ==================== [PASSED] test_ops =====================
[13:02:13] ====================== [PASSED] lmtt =======================
[13:02:13] ================= sriov_packet (1 subtest) =================
[13:02:13] [PASSED] test_descriptor_init
[13:02:13] ================== [PASSED] sriov_packet ===================
[13:02:13] ================= pf_service (11 subtests) =================
[13:02:13] [PASSED] pf_negotiate_any
[13:02:13] [PASSED] pf_negotiate_base_match
[13:02:13] [PASSED] pf_negotiate_base_newer
[13:02:13] [PASSED] pf_negotiate_base_next
[13:02:13] [SKIPPED] pf_negotiate_base_older (no older minor)
[13:02:13] [PASSED] pf_negotiate_base_prev
[13:02:13] [PASSED] pf_negotiate_latest_match
[13:02:13] [PASSED] pf_negotiate_latest_newer
[13:02:13] [PASSED] pf_negotiate_latest_next
[13:02:13] [SKIPPED] pf_negotiate_latest_older (no older minor)
[13:02:13] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[13:02:13] =================== [PASSED] pf_service ====================
[13:02:13] ================= xe_guc_g2g (2 subtests) ==================
[13:02:13] ============== xe_live_guc_g2g_kunit_default  ==============
[13:02:13] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[13:02:13] ============== xe_live_guc_g2g_kunit_allmem  ===============
[13:02:13] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[13:02:13] =================== [SKIPPED] xe_guc_g2g ===================
[13:02:13] =================== xe_mocs (2 subtests) ===================
[13:02:13] ================ xe_live_mocs_kernel_kunit  ================
[13:02:13] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[13:02:13] ================ xe_live_mocs_reset_kunit  =================
[13:02:13] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[13:02:13] ==================== [SKIPPED] xe_mocs =====================
[13:02:13] ================= xe_migrate (2 subtests) ==================
[13:02:13] ================= xe_migrate_sanity_kunit  =================
[13:02:13] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[13:02:13] ================== xe_validate_ccs_kunit  ==================
[13:02:13] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[13:02:13] =================== [SKIPPED] xe_migrate ===================
[13:02:13] ================== xe_dma_buf (1 subtest) ==================
[13:02:13] ==================== xe_dma_buf_kunit  =====================
[13:02:13] ================ [SKIPPED] xe_dma_buf_kunit ================
[13:02:13] =================== [SKIPPED] xe_dma_buf ===================
[13:02:13] ================= xe_bo_shrink (1 subtest) =================
[13:02:13] =================== xe_bo_shrink_kunit  ====================
[13:02:13] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[13:02:13] ================== [SKIPPED] xe_bo_shrink ==================
[13:02:13] ==================== xe_bo (2 subtests) ====================
[13:02:13] ================== xe_ccs_migrate_kunit  ===================
[13:02:13] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[13:02:13] ==================== xe_bo_evict_kunit  ====================
[13:02:13] =============== [SKIPPED] xe_bo_evict_kunit ================
[13:02:13] ===================== [SKIPPED] xe_bo ======================
[13:02:13] =================== xe_any (9 subtests) ====================
[13:02:13] [PASSED] test_to_xe
[13:02:13] [PASSED] test_to_dev
[13:02:13] [PASSED] test_to_pdev
[13:02:13] [PASSED] test_to_drm
[13:02:13] [PASSED] test_if_pdev
[13:02:13] [PASSED] test_if_xe
[13:02:13] [PASSED] test_if_tile
[13:02:13] [PASSED] test_if_gt
[13:02:13] [PASSED] test_to_id
[13:02:13] ===================== [PASSED] xe_any ======================
[13:02:13] ==================== args (13 subtests) ====================
[13:02:13] [PASSED] count_args_test
[13:02:13] [PASSED] call_args_example
[13:02:13] [PASSED] call_args_test
[13:02:13] [PASSED] drop_first_arg_example
[13:02:13] [PASSED] drop_first_arg_test
[13:02:13] [PASSED] first_arg_example
[13:02:13] [PASSED] first_arg_test
[13:02:13] [PASSED] last_arg_example
[13:02:13] [PASSED] last_arg_test
[13:02:13] [PASSED] pick_arg_example
[13:02:13] [PASSED] if_args_example
[13:02:13] [PASSED] if_args_test
[13:02:13] [PASSED] sep_comma_example
[13:02:13] ====================== [PASSED] args =======================
[13:02:13] =================== xe_pci (3 subtests) ====================
[13:02:13] ==================== check_graphics_ip  ====================
[13:02:13] [PASSED] 12.00 Xe_LP
[13:02:13] [PASSED] 12.10 Xe_LP+
[13:02:13] [PASSED] 12.55 Xe_HPG
[13:02:13] [PASSED] 12.60 Xe_HPC
[13:02:13] [PASSED] 12.70 Xe_LPG
[13:02:13] [PASSED] 12.71 Xe_LPG
[13:02:13] [PASSED] 12.74 Xe_LPG+
[13:02:13] [PASSED] 20.01 Xe2_HPG
[13:02:13] [PASSED] 20.02 Xe2_HPG
[13:02:13] [PASSED] 20.04 Xe2_LPG
[13:02:13] [PASSED] 30.00 Xe3_LPG
[13:02:13] [PASSED] 30.01 Xe3_LPG
[13:02:13] [PASSED] 30.03 Xe3_LPG
[13:02:13] [PASSED] 30.04 Xe3_LPG
[13:02:13] [PASSED] 30.05 Xe3_LPG
[13:02:13] [PASSED] 35.10 Xe3p_LPG
[13:02:13] [PASSED] 35.11 Xe3p_XPC
[13:02:13] ================ [PASSED] check_graphics_ip ================
[13:02:13] ===================== check_media_ip  ======================
[13:02:13] [PASSED] 12.00 Xe_M
[13:02:13] [PASSED] 12.55 Xe_HPM
[13:02:13] [PASSED] 13.00 Xe_LPM+
[13:02:13] [PASSED] 13.01 Xe2_HPM
[13:02:13] [PASSED] 20.00 Xe2_LPM
[13:02:13] [PASSED] 30.00 Xe3_LPM
[13:02:13] [PASSED] 30.02 Xe3_LPM
[13:02:13] [PASSED] 35.00 Xe3p_LPM
[13:02:13] [PASSED] 35.03 Xe3p_HPM
[13:02:13] ================= [PASSED] check_media_ip ==================
[13:02:13] =================== check_platform_desc  ===================
[13:02:13] [PASSED] 0x9A60 (TIGERLAKE)
[13:02:13] [PASSED] 0x9A68 (TIGERLAKE)
[13:02:13] [PASSED] 0x9A70 (TIGERLAKE)
[13:02:13] [PASSED] 0x9A40 (TIGERLAKE)
[13:02:13] [PASSED] 0x9A49 (TIGERLAKE)
[13:02:13] [PASSED] 0x9A59 (TIGERLAKE)
[13:02:13] [PASSED] 0x9A78 (TIGERLAKE)
[13:02:13] [PASSED] 0x9AC0 (TIGERLAKE)
[13:02:13] [PASSED] 0x9AC9 (TIGERLAKE)
[13:02:13] [PASSED] 0x9AD9 (TIGERLAKE)
[13:02:13] [PASSED] 0x9AF8 (TIGERLAKE)
[13:02:13] [PASSED] 0x4C80 (ROCKETLAKE)
[13:02:13] [PASSED] 0x4C8A (ROCKETLAKE)
[13:02:13] [PASSED] 0x4C8B (ROCKETLAKE)
[13:02:13] [PASSED] 0x4C8C (ROCKETLAKE)
[13:02:13] [PASSED] 0x4C90 (ROCKETLAKE)
[13:02:13] [PASSED] 0x4C9A (ROCKETLAKE)
[13:02:13] [PASSED] 0x4680 (ALDERLAKE_S)
[13:02:13] [PASSED] 0x4682 (ALDERLAKE_S)
[13:02:13] [PASSED] 0x4688 (ALDERLAKE_S)
[13:02:13] [PASSED] 0x468A (ALDERLAKE_S)
[13:02:13] [PASSED] 0x468B (ALDERLAKE_S)
[13:02:13] [PASSED] 0x4690 (ALDERLAKE_S)
[13:02:13] [PASSED] 0x4692 (ALDERLAKE_S)
[13:02:13] [PASSED] 0x4693 (ALDERLAKE_S)
[13:02:13] [PASSED] 0x46A0 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46A1 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46A2 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46A3 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46A6 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46A8 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46AA (ALDERLAKE_P)
[13:02:13] [PASSED] 0x462A (ALDERLAKE_P)
[13:02:13] [PASSED] 0x4626 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x4628 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46B0 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46B1 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46B2 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46B3 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46C0 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46C1 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46C2 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46C3 (ALDERLAKE_P)
[13:02:13] [PASSED] 0x46D0 (ALDERLAKE_N)
[13:02:13] [PASSED] 0x46D1 (ALDERLAKE_N)
[13:02:13] [PASSED] 0x46D2 (ALDERLAKE_N)
[13:02:13] [PASSED] 0x46D3 (ALDERLAKE_N)
[13:02:13] [PASSED] 0x46D4 (ALDERLAKE_N)
[13:02:13] [PASSED] 0xA721 (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7A1 (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7A9 (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7AC (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7AD (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA720 (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7A0 (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7A8 (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7AA (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA7AB (ALDERLAKE_P)
[13:02:13] [PASSED] 0xA780 (ALDERLAKE_S)
[13:02:13] [PASSED] 0xA781 (ALDERLAKE_S)
[13:02:13] [PASSED] 0xA782 (ALDERLAKE_S)
[13:02:13] [PASSED] 0xA783 (ALDERLAKE_S)
[13:02:13] [PASSED] 0xA788 (ALDERLAKE_S)
[13:02:13] [PASSED] 0xA789 (ALDERLAKE_S)
[13:02:13] [PASSED] 0xA78A (ALDERLAKE_S)
[13:02:13] [PASSED] 0xA78B (ALDERLAKE_S)
[13:02:13] [PASSED] 0x4905 (DG1)
[13:02:13] [PASSED] 0x4906 (DG1)
[13:02:13] [PASSED] 0x4907 (DG1)
[13:02:13] [PASSED] 0x4908 (DG1)
[13:02:13] [PASSED] 0x4909 (DG1)
[13:02:13] [PASSED] 0x56C0 (DG2)
[13:02:13] [PASSED] 0x56C2 (DG2)
[13:02:13] [PASSED] 0x56C1 (DG2)
[13:02:13] [PASSED] 0x7D51 (METEORLAKE)
[13:02:13] [PASSED] 0x7DD1 (METEORLAKE)
[13:02:13] [PASSED] 0x7D41 (METEORLAKE)
[13:02:13] [PASSED] 0x7D67 (METEORLAKE)
[13:02:13] [PASSED] 0xB640 (METEORLAKE)
[13:02:13] [PASSED] 0x56A0 (DG2)
[13:02:13] [PASSED] 0x56A1 (DG2)
[13:02:13] [PASSED] 0x56A2 (DG2)
[13:02:13] [PASSED] 0x56BE (DG2)
[13:02:13] [PASSED] 0x56BF (DG2)
[13:02:13] [PASSED] 0x5690 (DG2)
[13:02:13] [PASSED] 0x5691 (DG2)
[13:02:13] [PASSED] 0x5692 (DG2)
[13:02:13] [PASSED] 0x56A5 (DG2)
[13:02:13] [PASSED] 0x56A6 (DG2)
[13:02:13] [PASSED] 0x56B0 (DG2)
[13:02:13] [PASSED] 0x56B1 (DG2)
[13:02:13] [PASSED] 0x56BA (DG2)
[13:02:13] [PASSED] 0x56BB (DG2)
[13:02:13] [PASSED] 0x56BC (DG2)
[13:02:13] [PASSED] 0x56BD (DG2)
[13:02:13] [PASSED] 0x5693 (DG2)
[13:02:13] [PASSED] 0x5694 (DG2)
[13:02:13] [PASSED] 0x5695 (DG2)
[13:02:13] [PASSED] 0x56A3 (DG2)
[13:02:13] [PASSED] 0x56A4 (DG2)
[13:02:13] [PASSED] 0x56B2 (DG2)
[13:02:13] [PASSED] 0x56B3 (DG2)
[13:02:13] [PASSED] 0x5696 (DG2)
[13:02:13] [PASSED] 0x5697 (DG2)
[13:02:13] [PASSED] 0xB69 (PVC)
[13:02:13] [PASSED] 0xB6E (PVC)
[13:02:13] [PASSED] 0xBD4 (PVC)
[13:02:13] [PASSED] 0xBD5 (PVC)
[13:02:13] [PASSED] 0xBD6 (PVC)
[13:02:13] [PASSED] 0xBD7 (PVC)
[13:02:13] [PASSED] 0xBD8 (PVC)
[13:02:13] [PASSED] 0xBD9 (PVC)
[13:02:13] [PASSED] 0xBDA (PVC)
[13:02:13] [PASSED] 0xBDB (PVC)
[13:02:13] [PASSED] 0xBE0 (PVC)
[13:02:13] [PASSED] 0xBE1 (PVC)
[13:02:13] [PASSED] 0xBE5 (PVC)
[13:02:13] [PASSED] 0x7D40 (METEORLAKE)
[13:02:13] [PASSED] 0x7D45 (METEORLAKE)
[13:02:13] [PASSED] 0x7D55 (METEORLAKE)
[13:02:13] [PASSED] 0x7D60 (METEORLAKE)
[13:02:13] [PASSED] 0x7DD5 (METEORLAKE)
[13:02:13] [PASSED] 0x6420 (LUNARLAKE)
[13:02:13] [PASSED] 0x64A0 (LUNARLAKE)
[13:02:13] [PASSED] 0x64B0 (LUNARLAKE)
[13:02:13] [PASSED] 0xE202 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE209 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE20B (BATTLEMAGE)
[13:02:13] [PASSED] 0xE20C (BATTLEMAGE)
[13:02:13] [PASSED] 0xE20D (BATTLEMAGE)
[13:02:13] [PASSED] 0xE210 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE211 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE212 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE216 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE220 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE221 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE222 (BATTLEMAGE)
[13:02:13] [PASSED] 0xE223 (BATTLEMAGE)
[13:02:13] [PASSED] 0xB080 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB081 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB082 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB083 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB084 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB085 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB086 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB087 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB08F (PANTHERLAKE)
[13:02:13] [PASSED] 0xB090 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB0A0 (PANTHERLAKE)
[13:02:13] [PASSED] 0xB0B0 (PANTHERLAKE)
[13:02:13] [PASSED] 0xFD80 (PANTHERLAKE)
[13:02:13] [PASSED] 0xFD81 (PANTHERLAKE)
[13:02:13] [PASSED] 0xD740 (NOVALAKE_S)
[13:02:13] [PASSED] 0xD741 (NOVALAKE_S)
[13:02:13] [PASSED] 0xD742 (NOVALAKE_S)
[13:02:13] [PASSED] 0xD743 (NOVALAKE_S)
[13:02:13] [PASSED] 0xD745 (NOVALAKE_S)
[13:02:13] [PASSED] 0xD74A (NOVALAKE_S)
[13:02:13] [PASSED] 0xD74B (NOVALAKE_S)
[13:02:13] [PASSED] 0x674C (CRESCENTISLAND)
[13:02:13] [PASSED] 0x674D (CRESCENTISLAND)
[13:02:13] [PASSED] 0x674E (CRESCENTISLAND)
[13:02:13] [PASSED] 0x674F (CRESCENTISLAND)
[13:02:13] [PASSED] 0x6750 (CRESCENTISLAND)
[13:02:13] [PASSED] 0xD750 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD751 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD752 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD753 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD754 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD755 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD756 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD757 (NOVALAKE_P)
[13:02:13] [PASSED] 0xD75F (NOVALAKE_P)
[13:02:13] =============== [PASSED] check_platform_desc ===============
[13:02:13] ===================== [PASSED] xe_pci ======================
[13:02:13] ============= xe_rtp_tables_test (5 subtests) ==============
[13:02:13] ================== xe_rtp_table_gt_test  ===================
[13:02:13] [PASSED] gt_was/14011060649
[13:02:13] [PASSED] gt_was/14011059788
[13:02:13] [PASSED] gt_was/14015795083
[13:02:13] [PASSED] gt_was/16021867713
[13:02:13] [PASSED] gt_was/14019449301
[13:02:13] [PASSED] gt_was/16028005424
[13:02:13] [PASSED] gt_was/14026578760
[13:02:13] [PASSED] gt_was/1409420604
[13:02:13] [PASSED] gt_was/1408615072
[13:02:13] [PASSED] gt_was/22010523718
[13:02:13] [PASSED] gt_was/14011006942
[13:02:13] [PASSED] gt_was/14014830051
[13:02:13] [PASSED] gt_was/18018781329
[13:02:13] [PASSED] gt_was/1509235366
[13:02:13] [PASSED] gt_was/18018781329
[13:02:13] [PASSED] gt_was/16016694945
[13:02:13] [PASSED] gt_was/14018575942
[13:02:13] [PASSED] gt_was/22016670082
[13:02:13] [PASSED] gt_was/22016670082
[13:02:13] [PASSED] gt_was/14017421178
[13:02:13] [PASSED] gt_was/16025250150
[13:02:13] [PASSED] gt_was/14021871409
[13:02:13] [PASSED] gt_was/16021865536
[13:02:13] [PASSED] gt_was/14021486841
[13:02:13] [PASSED] gt_was/14025160223
[13:02:13] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[13:02:13] [PASSED] gt_was/14025635424
[13:02:13] [PASSED] gt_was/16028005424
[13:02:13] ============== [PASSED] xe_rtp_table_gt_test ===============
[13:02:13] ================== xe_rtp_table_gt_test  ===================
[13:02:13] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[13:02:13] [PASSED] gt_tunings/Tuning: 32B Access Enable
[13:02:13] [PASSED] gt_tunings/Tuning: L3 cache
[13:02:13] [PASSED] gt_tunings/Tuning: L3 cache - media
[13:02:13] [PASSED] gt_tunings/Tuning: Compression Overfetch
[13:02:13] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[13:02:13] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[13:02:13] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[13:02:13] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[13:02:13] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[13:02:13] [PASSED] gt_tunings/Tuning: Stateless compression control
[13:02:13] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[13:02:13] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[13:02:13] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[13:02:13] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[13:02:13] ============== [PASSED] xe_rtp_table_gt_test ===============
[13:02:13] ================== xe_rtp_table_oob_test  ==================
[13:02:13] [PASSED] oob_was/1607983814
[13:02:13] [PASSED] oob_was/16010904313
[13:02:13] [PASSED] oob_was/18022495364
[13:02:13] [PASSED] oob_was/22012773006
[13:02:13] [PASSED] oob_was/14014475959
[13:02:13] [PASSED] oob_was/22011391025
[13:02:13] [PASSED] oob_was/22012727170
[13:02:13] [PASSED] oob_was/22012727685
[13:02:13] [PASSED] oob_was/22016596838
[13:02:13] [PASSED] oob_was/18020744125
[13:02:13] [PASSED] oob_was/1409600907
[13:02:13] [PASSED] oob_was/22014953428
[13:02:13] [PASSED] oob_was/16017236439
[13:02:13] [PASSED] oob_was/14019821291
[13:02:13] [PASSED] oob_was/14015076503
[13:02:13] [PASSED] oob_was/14018913170
[13:02:13] [PASSED] oob_was/14018094691
[13:02:13] [PASSED] oob_was/18024947630
[13:02:13] [PASSED] oob_was/16022287689
[13:02:13] [PASSED] oob_was/13011645652
[13:02:13] [PASSED] oob_was/14022293748
[13:02:13] [PASSED] oob_was/22019794406
[13:02:13] [PASSED] oob_was/22019338487
[13:02:13] [PASSED] oob_was/16023588340
[13:02:13] [PASSED] oob_was/14019789679
[13:02:13] [PASSED] oob_was/14022866841
[13:02:13] [PASSED] oob_was/16021333562
[13:02:13] [PASSED] oob_was/14016712196
[13:02:13] [PASSED] oob_was/14015568240
[13:02:13] [PASSED] oob_was/18013179988
[13:02:13] [PASSED] oob_was/1508761755
[13:02:13] [PASSED] oob_was/16023105232
[13:02:13] [PASSED] oob_was/16026508708
[13:02:13] [PASSED] oob_was/14020001231
[13:02:13] [PASSED] oob_was/16023683509
[13:02:13] [PASSED] oob_was/14025515070
[13:02:13] [PASSED] oob_was/15015404425_disable
[13:02:13] [PASSED] oob_was/16026007364
[13:02:13] [PASSED] oob_was/14020316580
[13:02:13] [PASSED] oob_was/14025883347
[13:02:13] [PASSED] oob_was/16029380221
[13:02:13] [PASSED] oob_was/22022079272
[13:02:13] [PASSED] oob_was/16029897822
[13:02:13] [PASSED] oob_was/14027054324
[13:02:13] ============== [PASSED] xe_rtp_table_oob_test ==============
[13:02:13] ================ xe_rtp_table_dev_oob_test  ================
[13:02:13] [PASSED] device_oob_was/22010954014
[13:02:13] [PASSED] device_oob_was/15015404425
[13:02:13] [PASSED] device_oob_was/22019338487_display
[13:02:13] [PASSED] device_oob_was/14022085890
[13:02:13] [PASSED] device_oob_was/14026539277
[13:02:13] [PASSED] device_oob_was/14026633728
[13:02:13] [PASSED] device_oob_was/14026746987
[13:02:13] [PASSED] device_oob_was/14026779378
[13:02:13] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[13:02:13] ========== xe_rtp_table_missing_upper_bound_test  ==========
[13:02:13] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[13:02:13] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[13:02:13] [PASSED] register_whitelist/1806527549
[13:02:13] [PASSED] register_whitelist/allow_read_ctx_timestamp
[13:02:13] [PASSED] register_whitelist/allow_read_queue_timestamp
[13:02:13] [PASSED] register_whitelist/16014440446
[13:02:13] [PASSED] register_whitelist/16017236439
[13:02:13] [PASSED] register_whitelist/16020183090
[13:02:13] [PASSED] register_whitelist/14024997852
[13:02:13] [PASSED] register_whitelist/14024997852
[13:02:13] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[13:02:13] =============== [PASSED] xe_rtp_tables_test ================
[13:02:13] =================== xe_rtp (3 subtests) ====================
[13:02:13] =================== xe_rtp_rules_tests  ====================
[13:02:13] [PASSED] no
[13:02:13] [PASSED] yes
[13:02:13] [PASSED] no-and-no
[13:02:13] [PASSED] no-and-yes
[13:02:13] [PASSED] yes-and-no
[13:02:13] [PASSED] yes-and-yes
[13:02:13] [PASSED] no-or-no
[13:02:13] [PASSED] no-or-yes
[13:02:13] [PASSED] yes-or-no
[13:02:13] [PASSED] yes-or-yes
[13:02:13] [PASSED] no-yes-or-yes-no
[13:02:13] [PASSED] no-yes-or-yes-yes
[13:02:13] [PASSED] yes-yes-or-no-yes
[13:02:13] [PASSED] yes-yes-or-yes-yes
[13:02:13] [PASSED] no-no-or-yes-or-no
[13:02:13] [PASSED] or
[13:02:13] [PASSED] or-yes
[13:02:13] [PASSED] or-no
[13:02:13] [PASSED] yes-or
[13:02:13] [PASSED] no-or
[13:02:13] [PASSED] no-or-or-yes
[13:02:13] [PASSED] yes-or-or-no
[13:02:13] [PASSED] no-or-or-no
[13:02:13] [PASSED] missing-context-engine-class
[13:02:13] [PASSED] missing-context-engine-class-or-yes
[13:02:13] [PASSED] missing-context-engine-class-or-or-yes
[13:02:13] =============== [PASSED] xe_rtp_rules_tests ================
[13:02:13] =============== xe_rtp_process_to_sr_tests  ================
[13:02:13] [PASSED] coalesce-same-reg
[13:02:13] [PASSED] coalesce-same-reg-literal-and-func
[13:02:13] [PASSED] no-match-no-add
[13:02:13] [PASSED] two-regs-two-entries
[13:02:13] [PASSED] clr-one-set-other
[13:02:13] [PASSED] set-field
[13:02:13] [PASSED] conflict-duplicate
[13:02:13] [PASSED] conflict-not-disjoint
[13:02:13] [PASSED] conflict-not-disjoint-literal-and-func
[13:02:13] [PASSED] conflict-reg-type
[13:02:13] [PASSED] bad-mcr-reg-forced-to-regular
[13:02:13] [PASSED] bad-regular-reg-forced-to-mcr
[13:02:13] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[13:02:13] ================== xe_rtp_process_tests  ===================
[13:02:13] [PASSED] active1
[13:02:13] [PASSED] active2
[13:02:13] [PASSED] active-inactive
[13:02:13] [PASSED] inactive-active
[13:02:13] [PASSED] inactive-active-inactive
[13:02:13] [PASSED] inactive-inactive-inactive
[13:02:13] ============== [PASSED] xe_rtp_process_tests ===============
[13:02:13] ===================== [PASSED] xe_rtp ======================
[13:02:13] ==================== xe_wa (1 subtest) =====================
[13:02:13] ======================== xe_wa_gt  =========================
[13:02:13] [PASSED] TIGERLAKE B0
[13:02:13] [PASSED] DG1 A0
[13:02:13] [PASSED] DG1 B0
[13:02:13] [PASSED] ALDERLAKE_S A0
[13:02:13] [PASSED] ALDERLAKE_S B0
[13:02:13] [PASSED] ALDERLAKE_S C0
[13:02:13] [PASSED] ALDERLAKE_S D0
[13:02:13] [PASSED] ALDERLAKE_P A0
[13:02:13] [PASSED] ALDERLAKE_P B0
[13:02:13] [PASSED] ALDERLAKE_P C0
[13:02:13] [PASSED] ALDERLAKE_S RPLS D0
[13:02:13] [PASSED] ALDERLAKE_P RPLU E0
[13:02:13] [PASSED] DG2 G10 C0
[13:02:13] [PASSED] DG2 G11 B1
[13:02:13] [PASSED] DG2 G12 A1
[13:02:13] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:02:13] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:02:13] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[13:02:13] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[13:02:13] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[13:02:13] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[13:02:13] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[13:02:13] ==================== [PASSED] xe_wa_gt =====================
[13:02:13] ====================== [PASSED] xe_wa ======================
[13:02:13] ============================================================
[13:02:13] Testing complete. Ran 805 tests: passed: 777, skipped: 28
[13:02:13] Elapsed time: 37.688s total, 5.074s configuring, 31.898s building, 0.698s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:02:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:02:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:02:39] Starting KUnit Kernel (1/1)...
[13:02:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:02:40] ============ drm_test_pick_cmdline (2 subtests) ============
[13:02:40] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:02:40] =============== drm_test_pick_cmdline_named  ===============
[13:02:40] [PASSED] NTSC
[13:02:40] [PASSED] NTSC-J
[13:02:40] [PASSED] PAL
[13:02:40] [PASSED] PAL-M
[13:02:40] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:02:40] ============== [PASSED] drm_test_pick_cmdline ==============
[13:02:40] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[13:02:40] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[13:02:40] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[13:02:40] =========== drm_validate_clone_mode (2 subtests) ===========
[13:02:40] ============== drm_test_check_in_clone_mode  ===============
[13:02:40] [PASSED] in_clone_mode
[13:02:40] [PASSED] not_in_clone_mode
[13:02:40] ========== [PASSED] drm_test_check_in_clone_mode ===========
[13:02:40] =============== drm_test_check_valid_clones  ===============
[13:02:40] [PASSED] not_in_clone_mode
[13:02:40] [PASSED] valid_clone
[13:02:40] [PASSED] invalid_clone
[13:02:40] =========== [PASSED] drm_test_check_valid_clones ===========
[13:02:40] ============= [PASSED] drm_validate_clone_mode =============
[13:02:40] ============= drm_validate_modeset (1 subtest) =============
[13:02:40] [PASSED] drm_test_check_connector_changed_modeset
[13:02:40] ============== [PASSED] drm_validate_modeset ===============
[13:02:40] ====== drm_test_bridge_get_current_state (1 subtest) =======
[13:02:40] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[13:02:40] ======== [PASSED] drm_test_bridge_get_current_state ========
[13:02:40] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[13:02:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[13:02:40] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[13:02:40] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[13:02:40] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[13:02:40] ============== drm_bridge_alloc (2 subtests) ===============
[13:02:40] [PASSED] drm_test_drm_bridge_alloc_basic
[13:02:40] [PASSED] drm_test_drm_bridge_alloc_get_put
[13:02:40] ================ [PASSED] drm_bridge_alloc =================
[13:02:40] ============= drm_bridge_bus_fmt (5 subtests) ==============
[13:02:40] [PASSED] drm_test_bridge_rgb_yuv_rgb
[13:02:40] [PASSED] drm_test_bridge_must_convert_to_yuv444
[13:02:40] [PASSED] drm_test_bridge_hdmi_auto_rgb
[13:02:40] [PASSED] drm_test_bridge_auto_first
[13:02:40] [PASSED] drm_test_bridge_rgb_yuv_no_path
[13:02:40] =============== [PASSED] drm_bridge_bus_fmt ================
[13:02:40] ============= drm_cmdline_parser (40 subtests) =============
[13:02:40] [PASSED] drm_test_cmdline_force_d_only
[13:02:40] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:02:40] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:02:40] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:02:40] [PASSED] drm_test_cmdline_force_e_only
[13:02:40] [PASSED] drm_test_cmdline_res
[13:02:40] [PASSED] drm_test_cmdline_res_vesa
[13:02:40] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:02:40] [PASSED] drm_test_cmdline_res_rblank
[13:02:40] [PASSED] drm_test_cmdline_res_bpp
[13:02:40] [PASSED] drm_test_cmdline_res_refresh
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:02:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:02:40] [PASSED] drm_test_cmdline_res_margins_force_on
[13:02:40] [PASSED] drm_test_cmdline_res_vesa_margins
[13:02:40] [PASSED] drm_test_cmdline_name
[13:02:40] [PASSED] drm_test_cmdline_name_bpp
[13:02:40] [PASSED] drm_test_cmdline_name_option
[13:02:40] [PASSED] drm_test_cmdline_name_bpp_option
[13:02:40] [PASSED] drm_test_cmdline_rotate_0
[13:02:40] [PASSED] drm_test_cmdline_rotate_90
[13:02:40] [PASSED] drm_test_cmdline_rotate_180
[13:02:40] [PASSED] drm_test_cmdline_rotate_270
[13:02:40] [PASSED] drm_test_cmdline_hmirror
[13:02:40] [PASSED] drm_test_cmdline_vmirror
[13:02:40] [PASSED] drm_test_cmdline_margin_options
[13:02:40] [PASSED] drm_test_cmdline_multiple_options
[13:02:40] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:02:40] [PASSED] drm_test_cmdline_extra_and_option
[13:02:40] [PASSED] drm_test_cmdline_freestanding_options
[13:02:40] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:02:40] [PASSED] drm_test_cmdline_panel_orientation
[13:02:40] ================ drm_test_cmdline_invalid  =================
[13:02:40] [PASSED] margin_only
[13:02:40] [PASSED] interlace_only
[13:02:40] [PASSED] res_missing_x
[13:02:40] [PASSED] res_missing_y
[13:02:40] [PASSED] res_bad_y
[13:02:40] [PASSED] res_missing_y_bpp
[13:02:40] [PASSED] res_bad_bpp
[13:02:40] [PASSED] res_bad_refresh
[13:02:40] [PASSED] res_bpp_refresh_force_on_off
[13:02:40] [PASSED] res_invalid_mode
[13:02:40] [PASSED] res_bpp_wrong_place_mode
[13:02:40] [PASSED] name_bpp_refresh
[13:02:40] [PASSED] name_refresh
[13:02:40] [PASSED] name_refresh_wrong_mode
[13:02:40] [PASSED] name_refresh_invalid_mode
[13:02:40] [PASSED] rotate_multiple
[13:02:40] [PASSED] rotate_invalid_val
[13:02:40] [PASSED] rotate_truncated
[13:02:40] [PASSED] invalid_option
[13:02:40] [PASSED] invalid_tv_option
[13:02:40] [PASSED] truncated_tv_option
[13:02:40] ============ [PASSED] drm_test_cmdline_invalid =============
[13:02:40] =============== drm_test_cmdline_tv_options  ===============
[13:02:40] [PASSED] NTSC
[13:02:40] [PASSED] NTSC_443
[13:02:40] [PASSED] NTSC_J
[13:02:40] [PASSED] PAL
[13:02:40] [PASSED] PAL_M
[13:02:40] [PASSED] PAL_N
[13:02:40] [PASSED] SECAM
[13:02:40] [PASSED] MONO_525
[13:02:40] [PASSED] MONO_625
[13:02:40] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:02:40] =============== [PASSED] drm_cmdline_parser ================
[13:02:40] ========== drmm_connector_hdmi_init (20 subtests) ==========
[13:02:40] [PASSED] drm_test_connector_hdmi_init_valid
[13:02:40] [PASSED] drm_test_connector_hdmi_init_bpc_8
[13:02:40] [PASSED] drm_test_connector_hdmi_init_bpc_10
[13:02:40] [PASSED] drm_test_connector_hdmi_init_bpc_12
[13:02:40] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[13:02:40] [PASSED] drm_test_connector_hdmi_init_bpc_null
[13:02:40] [PASSED] drm_test_connector_hdmi_init_formats_empty
[13:02:40] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[13:02:40] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[13:02:40] [PASSED] supported_formats=0x9 yuv420_allowed=1
[13:02:40] [PASSED] supported_formats=0x9 yuv420_allowed=0
[13:02:40] [PASSED] supported_formats=0x5 yuv420_allowed=1
[13:02:40] [PASSED] supported_formats=0x5 yuv420_allowed=0
[13:02:40] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[13:02:40] [PASSED] drm_test_connector_hdmi_init_null_ddc
[13:02:40] [PASSED] drm_test_connector_hdmi_init_null_product
[13:02:40] [PASSED] drm_test_connector_hdmi_init_null_vendor
[13:02:40] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[13:02:40] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[13:02:40] [PASSED] drm_test_connector_hdmi_init_product_valid
[13:02:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[13:02:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[13:02:40] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[13:02:40] ========= drm_test_connector_hdmi_init_type_valid  =========
[13:02:40] [PASSED] HDMI-A
[13:02:40] [PASSED] HDMI-B
[13:02:40] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[13:02:40] ======== drm_test_connector_hdmi_init_type_invalid  ========
[13:02:40] [PASSED] Unknown
[13:02:40] [PASSED] VGA
[13:02:40] [PASSED] DVI-I
[13:02:40] [PASSED] DVI-D
[13:02:40] [PASSED] DVI-A
[13:02:40] [PASSED] Composite
[13:02:40] [PASSED] SVIDEO
[13:02:40] [PASSED] LVDS
[13:02:40] [PASSED] Component
[13:02:40] [PASSED] DIN
[13:02:40] [PASSED] DP
[13:02:40] [PASSED] TV
[13:02:40] [PASSED] eDP
[13:02:40] [PASSED] Virtual
[13:02:40] [PASSED] DSI
[13:02:40] [PASSED] DPI
[13:02:40] [PASSED] Writeback
[13:02:40] [PASSED] SPI
[13:02:40] [PASSED] USB
[13:02:40] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[13:02:40] ============ [PASSED] drmm_connector_hdmi_init =============
[13:02:40] ============= drmm_connector_init (3 subtests) =============
[13:02:40] [PASSED] drm_test_drmm_connector_init
[13:02:40] [PASSED] drm_test_drmm_connector_init_null_ddc
[13:02:40] ========= drm_test_drmm_connector_init_type_valid  =========
[13:02:40] [PASSED] Unknown
[13:02:40] [PASSED] VGA
[13:02:40] [PASSED] DVI-I
[13:02:40] [PASSED] DVI-D
[13:02:40] [PASSED] DVI-A
[13:02:40] [PASSED] Composite
[13:02:40] [PASSED] SVIDEO
[13:02:40] [PASSED] LVDS
[13:02:40] [PASSED] Component
[13:02:40] [PASSED] DIN
[13:02:40] [PASSED] DP
[13:02:40] [PASSED] HDMI-A
[13:02:40] [PASSED] HDMI-B
[13:02:40] [PASSED] TV
[13:02:40] [PASSED] eDP
[13:02:40] [PASSED] Virtual
[13:02:40] [PASSED] DSI
[13:02:40] [PASSED] DPI
[13:02:40] [PASSED] Writeback
[13:02:40] [PASSED] SPI
[13:02:40] [PASSED] USB
[13:02:40] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[13:02:40] =============== [PASSED] drmm_connector_init ===============
[13:02:40] ========= drm_connector_dynamic_init (6 subtests) ==========
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_init
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_init_properties
[13:02:40] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[13:02:40] [PASSED] Unknown
[13:02:40] [PASSED] VGA
[13:02:40] [PASSED] DVI-I
[13:02:40] [PASSED] DVI-D
[13:02:40] [PASSED] DVI-A
[13:02:40] [PASSED] Composite
[13:02:40] [PASSED] SVIDEO
[13:02:40] [PASSED] LVDS
[13:02:40] [PASSED] Component
[13:02:40] [PASSED] DIN
[13:02:40] [PASSED] DP
[13:02:40] [PASSED] HDMI-A
[13:02:40] [PASSED] HDMI-B
[13:02:40] [PASSED] TV
[13:02:40] [PASSED] eDP
[13:02:40] [PASSED] Virtual
[13:02:40] [PASSED] DSI
[13:02:40] [PASSED] DPI
[13:02:40] [PASSED] Writeback
[13:02:40] [PASSED] SPI
[13:02:40] [PASSED] USB
[13:02:40] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[13:02:40] ======== drm_test_drm_connector_dynamic_init_name  =========
[13:02:40] [PASSED] Unknown
[13:02:40] [PASSED] VGA
[13:02:40] [PASSED] DVI-I
[13:02:40] [PASSED] DVI-D
[13:02:40] [PASSED] DVI-A
[13:02:40] [PASSED] Composite
[13:02:40] [PASSED] SVIDEO
[13:02:40] [PASSED] LVDS
[13:02:40] [PASSED] Component
[13:02:40] [PASSED] DIN
[13:02:40] [PASSED] DP
[13:02:40] [PASSED] HDMI-A
[13:02:40] [PASSED] HDMI-B
[13:02:40] [PASSED] TV
[13:02:40] [PASSED] eDP
[13:02:40] [PASSED] Virtual
[13:02:40] [PASSED] DSI
[13:02:40] [PASSED] DPI
[13:02:40] [PASSED] Writeback
[13:02:40] [PASSED] SPI
[13:02:40] [PASSED] USB
[13:02:40] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[13:02:40] =========== [PASSED] drm_connector_dynamic_init ============
[13:02:40] ==== drm_connector_dynamic_register_early (4 subtests) =====
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[13:02:40] ====== [PASSED] drm_connector_dynamic_register_early =======
[13:02:40] ======= drm_connector_dynamic_register (7 subtests) ========
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[13:02:40] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[13:02:40] ========= [PASSED] drm_connector_dynamic_register ==========
[13:02:40] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[13:02:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[13:02:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[13:02:40] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[13:02:40] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:02:40] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:02:40] [PASSED] NTSC
[13:02:40] [PASSED] NTSC-443
[13:02:40] [PASSED] NTSC-J
[13:02:40] [PASSED] PAL
[13:02:40] [PASSED] PAL-M
[13:02:40] [PASSED] PAL-N
[13:02:40] [PASSED] SECAM
[13:02:40] [PASSED] Mono
[13:02:40] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:02:40] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:02:40] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:02:40] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[13:02:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[13:02:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[13:02:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[13:02:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[13:02:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[13:02:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[13:02:40] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[13:02:40] [PASSED] VIC 96
[13:02:40] [PASSED] VIC 97
[13:02:40] [PASSED] VIC 101
[13:02:40] [PASSED] VIC 102
[13:02:40] [PASSED] VIC 106
[13:02:40] [PASSED] VIC 107
[13:02:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[13:02:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[13:02:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[13:02:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[13:02:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[13:02:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[13:02:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[13:02:40] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[13:02:40] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[13:02:40] [PASSED] Automatic
[13:02:40] [PASSED] Full
[13:02:40] [PASSED] Limited 16:235
[13:02:40] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[13:02:40] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[13:02:40] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[13:02:40] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[13:02:40] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[13:02:40] [PASSED] RGB
[13:02:40] [PASSED] YUV 4:2:0
[13:02:40] [PASSED] YUV 4:2:2
[13:02:40] [PASSED] YUV 4:4:4
[13:02:40] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[13:02:40] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[13:02:40] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[13:02:40] ============= drm_damage_helper (21 subtests) ==============
[13:02:40] [PASSED] drm_test_damage_iter_no_damage
[13:02:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:02:40] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:02:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:02:40] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:02:40] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:02:40] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:02:40] [PASSED] drm_test_damage_iter_simple_damage
[13:02:40] [PASSED] drm_test_damage_iter_single_damage
[13:02:40] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:02:40] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:02:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:02:40] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:02:40] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:02:40] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:02:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:02:40] [PASSED] drm_test_damage_iter_damage
[13:02:40] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:02:40] [PASSED] drm_test_damage_iter_damage_one_outside
[13:02:40] [PASSED] drm_test_damage_iter_damage_src_moved
[13:02:40] [PASSED] drm_test_damage_iter_damage_not_visible
[13:02:40] ================ [PASSED] drm_damage_helper ================
[13:02:40] ============== drm_dp_mst_helper (3 subtests) ==============
[13:02:40] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:02:40] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:02:40] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:02:40] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:02:40] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:02:40] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:02:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:02:40] ============== drm_test_dp_mst_calc_pbn_div  ===============
[13:02:40] [PASSED] Link rate 2000000 lane count 4
[13:02:40] [PASSED] Link rate 2000000 lane count 2
[13:02:40] [PASSED] Link rate 2000000 lane count 1
[13:02:40] [PASSED] Link rate 1350000 lane count 4
[13:02:40] [PASSED] Link rate 1350000 lane count 2
[13:02:40] [PASSED] Link rate 1350000 lane count 1
[13:02:40] [PASSED] Link rate 1000000 lane count 4
[13:02:40] [PASSED] Link rate 1000000 lane count 2
[13:02:40] [PASSED] Link rate 1000000 lane count 1
[13:02:40] [PASSED] Link rate 810000 lane count 4
[13:02:40] [PASSED] Link rate 810000 lane count 2
[13:02:40] [PASSED] Link rate 810000 lane count 1
[13:02:40] [PASSED] Link rate 540000 lane count 4
[13:02:40] [PASSED] Link rate 540000 lane count 2
[13:02:40] [PASSED] Link rate 540000 lane count 1
[13:02:40] [PASSED] Link rate 270000 lane count 4
[13:02:40] [PASSED] Link rate 270000 lane count 2
[13:02:40] [PASSED] Link rate 270000 lane count 1
[13:02:40] [PASSED] Link rate 162000 lane count 4
[13:02:40] [PASSED] Link rate 162000 lane count 2
[13:02:40] [PASSED] Link rate 162000 lane count 1
[13:02:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[13:02:40] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:02:40] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:02:40] [PASSED] DP_POWER_UP_PHY with port number
[13:02:40] [PASSED] DP_POWER_DOWN_PHY with port number
[13:02:40] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:02:40] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:02:40] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:02:40] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:02:40] [PASSED] DP_QUERY_PAYLOAD with port number
[13:02:40] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:02:40] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:02:40] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:02:40] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:02:40] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:02:40] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:02:40] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:02:40] [PASSED] DP_REMOTE_I2C_READ with port number
[13:02:40] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:02:40] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:02:40] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:02:40] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:02:40] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:02:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:02:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:02:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:02:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:02:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:02:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:02:40] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:02:40] ================ [PASSED] drm_dp_mst_helper ================
[13:02:40] ================== drm_exec (7 subtests) ===================
[13:02:40] [PASSED] sanitycheck
[13:02:40] [PASSED] test_lock
[13:02:40] [PASSED] test_lock_unlock
[13:02:40] [PASSED] test_duplicates
[13:02:40] [PASSED] test_prepare
[13:02:40] [PASSED] test_prepare_array
[13:02:40] [PASSED] test_multiple_loops
[13:02:40] ==================== [PASSED] drm_exec =====================
[13:02:40] =========== drm_format_helper_test (17 subtests) ===========
[13:02:40] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:02:40] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:02:40] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:02:40] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:02:40] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:02:40] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:02:40] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:02:40] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[13:02:40] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:02:40] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:02:40] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:02:40] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:02:40] ==================== drm_test_fb_swab  =====================
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ================ [PASSED] drm_test_fb_swab =================
[13:02:40] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[13:02:40] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[13:02:40] [PASSED] single_pixel_source_buffer
[13:02:40] [PASSED] single_pixel_clip_rectangle
[13:02:40] [PASSED] well_known_colors
[13:02:40] [PASSED] destination_pitch
[13:02:40] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[13:02:40] ================= drm_test_fb_clip_offset  =================
[13:02:40] [PASSED] pass through
[13:02:40] [PASSED] horizontal offset
[13:02:40] [PASSED] vertical offset
[13:02:40] [PASSED] horizontal and vertical offset
[13:02:40] [PASSED] horizontal offset (custom pitch)
[13:02:40] [PASSED] vertical offset (custom pitch)
[13:02:40] [PASSED] horizontal and vertical offset (custom pitch)
[13:02:40] ============= [PASSED] drm_test_fb_clip_offset =============
[13:02:40] =================== drm_test_fb_memcpy  ====================
[13:02:40] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[13:02:40] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[13:02:40] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[13:02:40] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[13:02:40] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[13:02:40] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[13:02:40] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[13:02:40] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[13:02:40] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[13:02:40] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[13:02:40] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[13:02:40] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[13:02:40] =============== [PASSED] drm_test_fb_memcpy ================
[13:02:40] ============= [PASSED] drm_format_helper_test ==============
[13:02:40] ================= drm_format (18 subtests) =================
[13:02:40] [PASSED] drm_test_format_block_width_invalid
[13:02:40] [PASSED] drm_test_format_block_width_one_plane
[13:02:40] [PASSED] drm_test_format_block_width_two_plane
[13:02:40] [PASSED] drm_test_format_block_width_three_plane
[13:02:40] [PASSED] drm_test_format_block_width_tiled
[13:02:40] [PASSED] drm_test_format_block_height_invalid
[13:02:40] [PASSED] drm_test_format_block_height_one_plane
[13:02:40] [PASSED] drm_test_format_block_height_two_plane
[13:02:40] [PASSED] drm_test_format_block_height_three_plane
[13:02:40] [PASSED] drm_test_format_block_height_tiled
[13:02:40] [PASSED] drm_test_format_min_pitch_invalid
[13:02:40] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:02:40] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:02:40] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:02:40] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:02:40] [PASSED] drm_test_format_min_pitch_two_plane
[13:02:40] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:02:40] [PASSED] drm_test_format_min_pitch_tiled
[13:02:40] =================== [PASSED] drm_format ====================
[13:02:40] ============== drm_framebuffer (10 subtests) ===============
[13:02:40] ========== drm_test_framebuffer_check_src_coords  ==========
[13:02:40] [PASSED] Success: source fits into fb
[13:02:40] [PASSED] Fail: overflowing fb with x-axis coordinate
[13:02:40] [PASSED] Fail: overflowing fb with y-axis coordinate
[13:02:40] [PASSED] Fail: overflowing fb with source width
[13:02:40] [PASSED] Fail: overflowing fb with source height
[13:02:40] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[13:02:40] [PASSED] drm_test_framebuffer_cleanup
[13:02:40] =============== drm_test_framebuffer_create  ===============
[13:02:40] [PASSED] ABGR8888 normal sizes
[13:02:40] [PASSED] ABGR8888 max sizes
[13:02:40] [PASSED] ABGR8888 pitch greater than min required
[13:02:40] [PASSED] ABGR8888 pitch less than min required
[13:02:40] [PASSED] ABGR8888 Invalid width
[13:02:40] [PASSED] ABGR8888 Invalid buffer handle
[13:02:40] [PASSED] No pixel format
[13:02:40] [PASSED] ABGR8888 Width 0
[13:02:40] [PASSED] ABGR8888 Height 0
[13:02:40] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:02:40] [PASSED] ABGR8888 Large buffer offset
[13:02:40] [PASSED] ABGR8888 Buffer offset for inexistent plane
[13:02:40] [PASSED] ABGR8888 Invalid flag
[13:02:40] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:02:40] [PASSED] ABGR8888 Valid buffer modifier
[13:02:40] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:02:40] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:02:40] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:02:40] [PASSED] NV12 Normal sizes
[13:02:40] [PASSED] NV12 Max sizes
[13:02:40] [PASSED] NV12 Invalid pitch
[13:02:40] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:02:40] [PASSED] NV12 different  modifier per-plane
[13:02:40] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:02:40] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:02:40] [PASSED] NV12 Modifier for inexistent plane
[13:02:40] [PASSED] NV12 Handle for inexistent plane
[13:02:40] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:02:40] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:02:40] [PASSED] YVU420 Normal sizes
[13:02:40] [PASSED] YVU420 Max sizes
[13:02:40] [PASSED] YVU420 Invalid pitch
[13:02:40] [PASSED] YVU420 Different pitches
[13:02:40] [PASSED] YVU420 Different buffer offsets/pitches
[13:02:40] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:02:40] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:02:40] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:02:40] [PASSED] YVU420 Valid modifier
[13:02:40] [PASSED] YVU420 Different modifiers per plane
[13:02:40] [PASSED] YVU420 Modifier for inexistent plane
[13:02:40] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[13:02:40] [PASSED] X0L2 Normal sizes
[13:02:40] [PASSED] X0L2 Max sizes
[13:02:40] [PASSED] X0L2 Invalid pitch
[13:02:40] [PASSED] X0L2 Pitch greater than minimum required
[13:02:40] [PASSED] X0L2 Handle for inexistent plane
[13:02:40] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:02:40] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:02:40] [PASSED] X0L2 Valid modifier
[13:02:40] [PASSED] X0L2 Modifier for inexistent plane
[13:02:40] =========== [PASSED] drm_test_framebuffer_create ===========
[13:02:40] [PASSED] drm_test_framebuffer_free
[13:02:40] [PASSED] drm_test_framebuffer_init
[13:02:40] [PASSED] drm_test_framebuffer_init_bad_format
[13:02:40] [PASSED] drm_test_framebuffer_init_dev_mismatch
[13:02:40] [PASSED] drm_test_framebuffer_lookup
[13:02:40] [PASSED] drm_test_framebuffer_lookup_inexistent
[13:02:40] [PASSED] drm_test_framebuffer_modifiers_not_supported
[13:02:40] ================= [PASSED] drm_framebuffer =================
[13:02:40] ================ drm_gem_shmem (8 subtests) ================
[13:02:40] [PASSED] drm_gem_shmem_test_obj_create
[13:02:40] [PASSED] drm_gem_shmem_test_obj_create_private
[13:02:40] [PASSED] drm_gem_shmem_test_pin_pages
[13:02:40] [PASSED] drm_gem_shmem_test_vmap
[13:02:40] [PASSED] drm_gem_shmem_test_get_sg_table
[13:02:40] [PASSED] drm_gem_shmem_test_get_pages_sgt
[13:02:40] [PASSED] drm_gem_shmem_test_madvise
[13:02:40] [PASSED] drm_gem_shmem_test_purge
[13:02:40] ================== [PASSED] drm_gem_shmem ==================
[13:02:40] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[13:02:40] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[13:02:40] [PASSED] Automatic
[13:02:40] [PASSED] Full
[13:02:40] [PASSED] Limited 16:235
[13:02:40] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[13:02:40] [PASSED] drm_test_check_disable_connector
[13:02:40] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[13:02:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[13:02:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[13:02:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[13:02:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[13:02:40] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[13:02:40] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[13:02:40] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[13:02:40] [PASSED] drm_test_check_output_bpc_dvi
[13:02:40] [PASSED] drm_test_check_output_bpc_format_vic_1
[13:02:40] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[13:02:40] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[13:02:40] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[13:02:40] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[13:02:40] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[13:02:40] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[13:02:40] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[13:02:40] ============ drm_test_check_hdmi_color_format  =============
[13:02:40] [PASSED] AUTO -> RGB
[13:02:40] [PASSED] YCBCR422 -> YUV422
[13:02:40] [PASSED] YCBCR420 -> YUV420
[13:02:40] [PASSED] YCBCR444 -> YUV444
[13:02:40] [PASSED] RGB -> RGB
[13:02:40] ======== [PASSED] drm_test_check_hdmi_color_format =========
[13:02:40] ======== drm_test_check_hdmi_color_format_420_only  ========
[13:02:40] [PASSED] RGB should fail
[13:02:40] [PASSED] YUV444 should fail
[13:02:40] [PASSED] YUV422 should fail
[13:02:40] [PASSED] YUV420 should work
[13:02:40] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[13:02:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[13:02:40] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[13:02:40] [PASSED] drm_test_check_broadcast_rgb_value
[13:02:40] [PASSED] drm_test_check_bpc_8_value
[13:02:40] [PASSED] drm_test_check_bpc_10_value
[13:02:40] [PASSED] drm_test_check_bpc_12_value
[13:02:40] [PASSED] drm_test_check_format_value
[13:02:40] [PASSED] drm_test_check_tmds_char_value
[13:02:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[13:02:40] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[13:02:40] [PASSED] drm_test_check_mode_valid
[13:02:40] [PASSED] drm_test_check_mode_valid_reject
[13:02:40] [PASSED] drm_test_check_mode_valid_reject_rate
[13:02:40] [PASSED] drm_test_check_mode_valid_reject_max_clock
[13:02:40] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[13:02:40] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[13:02:40] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[13:02:40] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[13:02:40] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[13:02:40] [PASSED] drm_test_check_infoframes
[13:02:40] [PASSED] drm_test_check_reject_avi_infoframe
[13:02:40] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[13:02:40] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[13:02:40] [PASSED] drm_test_check_reject_audio_infoframe
[13:02:40] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[13:02:40] ================= drm_managed (2 subtests) =================
[13:02:40] [PASSED] drm_test_managed_release_action
[13:02:40] [PASSED] drm_test_managed_run_action
[13:02:40] =================== [PASSED] drm_managed ===================
[13:02:40] =================== drm_mm (6 subtests) ====================
[13:02:40] [PASSED] drm_test_mm_init
[13:02:40] [PASSED] drm_test_mm_debug
[13:02:40] [PASSED] drm_test_mm_align32
[13:02:40] [PASSED] drm_test_mm_align64
[13:02:40] [PASSED] drm_test_mm_lowest
[13:02:40] [PASSED] drm_test_mm_highest
[13:02:40] ===================== [PASSED] drm_mm ======================
[13:02:40] ============= drm_modes_analog_tv (5 subtests) =============
[13:02:40] [PASSED] drm_test_modes_analog_tv_mono_576i
[13:02:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:02:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:02:40] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:02:40] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:02:40] =============== [PASSED] drm_modes_analog_tv ===============
[13:02:40] ============== drm_plane_helper (2 subtests) ===============
[13:02:40] =============== drm_test_check_plane_state  ================
[13:02:40] [PASSED] clipping_simple
[13:02:40] [PASSED] clipping_rotate_reflect
[13:02:40] [PASSED] positioning_simple
[13:02:40] [PASSED] upscaling
[13:02:40] [PASSED] downscaling
[13:02:40] [PASSED] rounding1
[13:02:40] [PASSED] rounding2
[13:02:40] [PASSED] rounding3
[13:02:40] [PASSED] rounding4
[13:02:40] =========== [PASSED] drm_test_check_plane_state ============
[13:02:40] =========== drm_test_check_invalid_plane_state  ============
[13:02:40] [PASSED] positioning_invalid
[13:02:40] [PASSED] upscaling_invalid
[13:02:40] [PASSED] downscaling_invalid
[13:02:40] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:02:40] ================ [PASSED] drm_plane_helper =================
[13:02:40] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:02:40] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:02:40] [PASSED] None
[13:02:40] [PASSED] PAL
[13:02:40] [PASSED] NTSC
[13:02:40] [PASSED] Both, NTSC Default
[13:02:40] [PASSED] Both, PAL Default
[13:02:40] [PASSED] Both, NTSC Default, with PAL on command-line
[13:02:40] [PASSED] Both, PAL Default, with NTSC on command-line
[13:02:40] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:02:40] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:02:40] ================== drm_rect (9 subtests) ===================
[13:02:40] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:02:40] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:02:40] [PASSED] drm_test_rect_clip_scaled_clipped
[13:02:40] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:02:40] ================= drm_test_rect_intersect  =================
[13:02:40] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:02:40] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[13:02:40] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:02:40] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:02:40] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:02:40] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:02:40] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:02:40] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:02:40] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:02:40] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:02:40] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:02:40] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:02:40] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:02:40] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:02:40] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:02:40] ============= [PASSED] drm_test_rect_intersect =============
[13:02:40] ================ drm_test_rect_calc_hscale  ================
[13:02:40] [PASSED] normal use
[13:02:40] [PASSED] out of max range
[13:02:40] [PASSED] out of min range
[13:02:40] [PASSED] zero dst
[13:02:40] [PASSED] negative src
[13:02:40] [PASSED] negative dst
[13:02:40] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:02:40] ================ drm_test_rect_calc_vscale  ================
[13:02:40] [PASSED] normal use
[13:02:40] [PASSED] out of max range
[13:02:40] [PASSED] out of min range
[13:02:40] [PASSED] zero dst
[13:02:40] [PASSED] negative src
[13:02:40] [PASSED] negative dst
[13:02:40] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:02:40] ================== drm_test_rect_rotate  ===================
[13:02:40] [PASSED] reflect-x
[13:02:40] [PASSED] reflect-y
[13:02:40] [PASSED] rotate-0
[13:02:40] [PASSED] rotate-90
[13:02:40] [PASSED] rotate-180
[13:02:40] [PASSED] rotate-270
[13:02:40] ============== [PASSED] drm_test_rect_rotate ===============
[13:02:40] ================ drm_test_rect_rotate_inv  =================
[13:02:40] [PASSED] reflect-x
[13:02:40] [PASSED] reflect-y
[13:02:40] [PASSED] rotate-0
[13:02:40] [PASSED] rotate-90
[13:02:40] [PASSED] rotate-180
[13:02:40] [PASSED] rotate-270
[13:02:40] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:02:40] ==================== [PASSED] drm_rect =====================
[13:02:40] ============ drm_sysfb_modeset_test (1 subtest) ============
[13:02:40] ============ drm_test_sysfb_build_fourcc_list  =============
[13:02:40] [PASSED] no native formats
[13:02:40] [PASSED] XRGB8888 as native format
[13:02:40] [PASSED] remove duplicates
[13:02:40] [PASSED] convert alpha formats
[13:02:40] [PASSED] random formats
[13:02:40] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[13:02:40] ============= [PASSED] drm_sysfb_modeset_test ==============
[13:02:40] ================== drm_fixp (2 subtests) ===================
[13:02:40] [PASSED] drm_test_int2fixp
[13:02:40] [PASSED] drm_test_sm2fixp
[13:02:40] ==================== [PASSED] drm_fixp =====================
[13:02:40] ============================================================
[13:02:40] Testing complete. Ran 637 tests: passed: 637
[13:02:40] Elapsed time: 26.686s total, 1.819s configuring, 24.700s building, 0.149s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[13:02:40] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:02:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:02:51] Starting KUnit Kernel (1/1)...
[13:02:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:02:52] ================= ttm_device (5 subtests) ==================
[13:02:52] [PASSED] ttm_device_init_basic
[13:02:52] [PASSED] ttm_device_init_multiple
[13:02:52] [PASSED] ttm_device_fini_basic
[13:02:52] [PASSED] ttm_device_init_no_vma_man
[13:02:52] ================== ttm_device_init_pools  ==================
[13:02:52] [PASSED] No DMA allocations, no DMA32 required
[13:02:52] [PASSED] DMA allocations, DMA32 required
[13:02:52] [PASSED] No DMA allocations, DMA32 required
[13:02:52] [PASSED] DMA allocations, no DMA32 required
[13:02:52] ============== [PASSED] ttm_device_init_pools ==============
[13:02:52] =================== [PASSED] ttm_device ====================
[13:02:52] ================== ttm_pool (8 subtests) ===================
[13:02:52] ================== ttm_pool_alloc_basic  ===================
[13:02:52] [PASSED] One page
[13:02:52] [PASSED] More than one page
[13:02:52] [PASSED] Above the allocation limit
[13:02:52] [PASSED] One page, with coherent DMA mappings enabled
[13:02:52] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:02:52] ============== [PASSED] ttm_pool_alloc_basic ===============
[13:02:52] ============== ttm_pool_alloc_basic_dma_addr  ==============
[13:02:52] [PASSED] One page
[13:02:52] [PASSED] More than one page
[13:02:52] [PASSED] Above the allocation limit
[13:02:52] [PASSED] One page, with coherent DMA mappings enabled
[13:02:52] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:02:52] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[13:02:52] [PASSED] ttm_pool_alloc_order_caching_match
[13:02:52] [PASSED] ttm_pool_alloc_caching_mismatch
[13:02:52] [PASSED] ttm_pool_alloc_order_mismatch
[13:02:52] [PASSED] ttm_pool_free_dma_alloc
[13:02:52] [PASSED] ttm_pool_free_no_dma_alloc
[13:02:52] [PASSED] ttm_pool_fini_basic
[13:02:52] ==================== [PASSED] ttm_pool =====================
[13:02:52] ================ ttm_resource (8 subtests) =================
[13:02:52] ================= ttm_resource_init_basic  =================
[13:02:52] [PASSED] Init resource in TTM_PL_SYSTEM
[13:02:52] [PASSED] Init resource in TTM_PL_VRAM
[13:02:52] [PASSED] Init resource in a private placement
[13:02:52] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[13:02:52] ============= [PASSED] ttm_resource_init_basic =============
[13:02:52] [PASSED] ttm_resource_init_pinned
[13:02:52] [PASSED] ttm_resource_fini_basic
[13:02:52] [PASSED] ttm_resource_manager_init_basic
[13:02:52] [PASSED] ttm_resource_manager_usage_basic
[13:02:52] [PASSED] ttm_resource_manager_set_used_basic
[13:02:52] [PASSED] ttm_sys_man_alloc_basic
[13:02:52] [PASSED] ttm_sys_man_free_basic
[13:02:52] ================== [PASSED] ttm_resource ===================
[13:02:52] =================== ttm_tt (15 subtests) ===================
[13:02:52] ==================== ttm_tt_init_basic  ====================
[13:02:52] [PASSED] Page-aligned size
[13:02:52] [PASSED] Extra pages requested
[13:02:52] ================ [PASSED] ttm_tt_init_basic ================
[13:02:52] [PASSED] ttm_tt_init_misaligned
[13:02:52] [PASSED] ttm_tt_fini_basic
[13:02:52] [PASSED] ttm_tt_fini_sg
[13:02:52] [PASSED] ttm_tt_fini_shmem
[13:02:52] [PASSED] ttm_tt_create_basic
[13:02:52] [PASSED] ttm_tt_create_invalid_bo_type
[13:02:52] [PASSED] ttm_tt_create_ttm_exists
[13:02:52] [PASSED] ttm_tt_create_failed
[13:02:52] [PASSED] ttm_tt_destroy_basic
[13:02:52] [PASSED] ttm_tt_populate_null_ttm
[13:02:52] [PASSED] ttm_tt_populate_populated_ttm
[13:02:52] [PASSED] ttm_tt_unpopulate_basic
[13:02:52] [PASSED] ttm_tt_unpopulate_empty_ttm
[13:02:52] [PASSED] ttm_tt_swapin_basic
[13:02:52] ===================== [PASSED] ttm_tt ======================
[13:02:52] =================== ttm_bo (14 subtests) ===================
[13:02:52] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[13:02:52] [PASSED] Cannot be interrupted and sleeps
[13:02:52] [PASSED] Cannot be interrupted, locks straight away
[13:02:52] [PASSED] Can be interrupted, sleeps
[13:02:52] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[13:02:52] [PASSED] ttm_bo_reserve_locked_no_sleep
[13:02:52] [PASSED] ttm_bo_reserve_no_wait_ticket
[13:02:52] [PASSED] ttm_bo_reserve_double_resv
[13:02:52] [PASSED] ttm_bo_reserve_interrupted
[13:02:52] [PASSED] ttm_bo_reserve_deadlock
[13:02:52] [PASSED] ttm_bo_unreserve_basic
[13:02:52] [PASSED] ttm_bo_unreserve_pinned
[13:02:52] [PASSED] ttm_bo_unreserve_bulk
[13:02:52] [PASSED] ttm_bo_fini_basic
[13:02:52] [PASSED] ttm_bo_fini_shared_resv
[13:02:52] [PASSED] ttm_bo_pin_basic
[13:02:52] [PASSED] ttm_bo_pin_unpin_resource
[13:02:52] [PASSED] ttm_bo_multiple_pin_one_unpin
[13:02:52] ===================== [PASSED] ttm_bo ======================
[13:02:52] ============== ttm_bo_validate (22 subtests) ===============
[13:02:52] ============== ttm_bo_init_reserved_sys_man  ===============
[13:02:52] [PASSED] Buffer object for userspace
[13:02:52] [PASSED] Kernel buffer object
[13:02:52] [PASSED] Shared buffer object
[13:02:52] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[13:02:52] ============== ttm_bo_init_reserved_mock_man  ==============
[13:02:52] [PASSED] Buffer object for userspace
[13:02:52] [PASSED] Kernel buffer object
[13:02:52] [PASSED] Shared buffer object
[13:02:52] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[13:02:52] [PASSED] ttm_bo_init_reserved_resv
[13:02:52] ================== ttm_bo_validate_basic  ==================
[13:02:52] [PASSED] Buffer object for userspace
[13:02:52] [PASSED] Kernel buffer object
[13:02:52] [PASSED] Shared buffer object
[13:02:52] ============== [PASSED] ttm_bo_validate_basic ==============
[13:02:52] [PASSED] ttm_bo_validate_invalid_placement
[13:02:52] ============= ttm_bo_validate_same_placement  ==============
[13:02:52] [PASSED] System manager
[13:02:52] [PASSED] VRAM manager
[13:02:52] ========= [PASSED] ttm_bo_validate_same_placement ==========
[13:02:52] [PASSED] ttm_bo_validate_failed_alloc
[13:02:52] [PASSED] ttm_bo_validate_pinned
[13:02:52] [PASSED] ttm_bo_validate_busy_placement
[13:02:52] ================ ttm_bo_validate_multihop  =================
[13:02:52] [PASSED] Buffer object for userspace
[13:02:52] [PASSED] Kernel buffer object
[13:02:52] [PASSED] Shared buffer object
[13:02:52] ============ [PASSED] ttm_bo_validate_multihop =============
[13:02:52] ========== ttm_bo_validate_no_placement_signaled  ==========
[13:02:52] [PASSED] Buffer object in system domain, no page vector
[13:02:52] [PASSED] Buffer object in system domain with an existing page vector
[13:02:52] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[13:02:52] ======== ttm_bo_validate_no_placement_not_signaled  ========
[13:02:52] [PASSED] Buffer object for userspace
[13:02:52] [PASSED] Kernel buffer object
[13:02:52] [PASSED] Shared buffer object
[13:02:52] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[13:02:52] [PASSED] ttm_bo_validate_move_fence_signaled
[13:02:52] ========= ttm_bo_validate_move_fence_not_signaled  =========
[13:02:52] [PASSED] Waits for GPU
[13:02:52] [PASSED] Tries to lock straight away
[13:02:52] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[13:02:52] [PASSED] ttm_bo_validate_swapout
[13:02:52] [PASSED] ttm_bo_validate_happy_evict
[13:02:52] [PASSED] ttm_bo_validate_all_pinned_evict
[13:02:52] [PASSED] ttm_bo_validate_allowed_only_evict
[13:02:52] [PASSED] ttm_bo_validate_deleted_evict
[13:02:52] [PASSED] ttm_bo_validate_busy_domain_evict
[13:02:52] [PASSED] ttm_bo_validate_evict_gutting
[13:02:52] [PASSED] ttm_bo_validate_recrusive_evict
[13:02:52] ================= [PASSED] ttm_bo_validate =================
[13:02:52] ============================================================
[13:02:52] Testing complete. Ran 102 tests: passed: 102
[13:02:52] Elapsed time: 11.986s total, 1.796s configuring, 9.925s building, 0.225s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[13:02:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:02:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:03:02] Starting KUnit Kernel (1/1)...
[13:03:02] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:03:02] =============== dma-buf-fence (12 subtests) ================
[13:03:02] [PASSED] test_sanitycheck
[13:03:02] [PASSED] test_signaling
[13:03:02] [PASSED] test_add_callback
[13:03:02] [PASSED] test_late_add_callback
[13:03:02] [PASSED] test_rm_callback
[13:03:02] [PASSED] test_late_rm_callback
[13:03:02] [PASSED] test_status
[13:03:02] [PASSED] test_error
[13:03:02] [PASSED] test_wait
[13:03:02] [PASSED] test_wait_timeout
[13:03:02] [PASSED] test_stub
[13:03:02] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[13:03:02] ================== [PASSED] dma-buf-fence ==================
[13:03:02] ============ dma-buf-fence-chain (11 subtests) =============
[13:03:02] [PASSED] test_sanitycheck
[13:03:02] [PASSED] test_find_seqno
[13:03:02] [PASSED] test_find_signaled
[13:03:02] [PASSED] test_find_out_of_order
[13:03:08] [PASSED] test_find_gap
[13:03:08] [PASSED] test_find_race
[13:03:08] [PASSED] test_signal_forward
[13:03:08] [PASSED] test_signal_backward
[13:03:08] [PASSED] test_wait_forward
[13:03:08] [PASSED] test_wait_backward
[13:03:08] [PASSED] test_wait_random
[13:03:08] =============== [PASSED] dma-buf-fence-chain ===============
[13:03:08] ============ dma-buf-fence-unwrap (10 subtests) ============
[13:03:08] [PASSED] test_sanitycheck
[13:03:08] [PASSED] test_unwrap_array
[13:03:08] [PASSED] test_unwrap_chain
[13:03:08] [PASSED] test_unwrap_chain_array
[13:03:08] [PASSED] test_unwrap_merge
[13:03:08] [PASSED] test_unwrap_merge_duplicate
[13:03:08] [PASSED] test_unwrap_merge_seqno
[13:03:08] [PASSED] test_unwrap_merge_order
[13:03:08] [PASSED] test_unwrap_merge_complex
[13:03:08] [PASSED] test_unwrap_merge_complex_seqno
[13:03:08] ============== [PASSED] dma-buf-fence-unwrap ===============
[13:03:08] ================ dma-buf-resv (5 subtests) =================
[13:03:08] [PASSED] test_sanitycheck
[13:03:08] ===================== test_signaling  ======================
[13:03:08] [PASSED] kernel
[13:03:08] [PASSED] write
[13:03:08] [PASSED] read
[13:03:08] [PASSED] bookkeep
[13:03:08] ================= [PASSED] test_signaling ==================
[13:03:08] ====================== test_for_each  ======================
[13:03:08] [PASSED] kernel
[13:03:08] [PASSED] write
[13:03:08] [PASSED] read
[13:03:08] [PASSED] bookkeep
[13:03:08] ================== [PASSED] test_for_each ==================
[13:03:08] ================= test_for_each_unlocked  ==================
[13:03:08] [PASSED] kernel
[13:03:08] [PASSED] write
[13:03:08] [PASSED] read
[13:03:08] [PASSED] bookkeep
[13:03:08] ============= [PASSED] test_for_each_unlocked ==============
[13:03:08] ===================== test_get_fences  =====================
[13:03:08] [PASSED] kernel
[13:03:08] [PASSED] write
[13:03:08] [PASSED] read
[13:03:08] [PASSED] bookkeep
[13:03:08] ================= [PASSED] test_get_fences =================
[13:03:08] ================== [PASSED] dma-buf-resv ===================
[13:03:08] ============================================================
[13:03:08] Testing complete. Ran 50 tests: passed: 49, skipped: 1
[13:03:08] Elapsed time: 15.807s total, 1.834s configuring, 8.602s building, 5.362s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


