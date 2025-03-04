Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF347C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 12:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C78010E1DC;
	Tue,  4 Mar 2025 12:05:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7DA10E1DC;
 Tue,  4 Mar 2025 12:04:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Introduce_drm_sharpness_proper?=
 =?utf-8?q?ty_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 12:04:59 -0000
Message-ID: <174108989950.586118.4571839923993419344@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304102857.326544-1-nemesa.garg@intel.com>
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev10)
URL   : https://patchwork.freedesktop.org/series/139954/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[12:03:53] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:03:57] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[12:04:23] Starting KUnit Kernel (1/1)...
[12:04:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:04:23] ================== guc_buf (11 subtests) ===================
[12:04:23] [PASSED] test_smallest
[12:04:23] [PASSED] test_largest
[12:04:23] [PASSED] test_granular
[12:04:23] [PASSED] test_unique
[12:04:23] [PASSED] test_overlap
[12:04:23] [PASSED] test_reusable
[12:04:23] [PASSED] test_too_big
[12:04:23] [PASSED] test_flush
[12:04:23] [PASSED] test_lookup
[12:04:23] [PASSED] test_data
[12:04:23] [PASSED] test_class
[12:04:23] ===================== [PASSED] guc_buf =====================
[12:04:23] =================== guc_dbm (7 subtests) ===================
[12:04:23] [PASSED] test_empty
[12:04:23] [PASSED] test_default
[12:04:23] ======================== test_size  ========================
[12:04:23] [PASSED] 4
[12:04:23] [PASSED] 8
[12:04:23] [PASSED] 32
[12:04:23] [PASSED] 256
[12:04:23] ==================== [PASSED] test_size ====================
[12:04:23] ======================= test_reuse  ========================
[12:04:23] [PASSED] 4
[12:04:23] [PASSED] 8
[12:04:23] [PASSED] 32
[12:04:23] [PASSED] 256
[12:04:23] =================== [PASSED] test_reuse ====================
[12:04:23] =================== test_range_overlap  ====================
[12:04:23] [PASSED] 4
[12:04:23] [PASSED] 8
[12:04:23] [PASSED] 32
[12:04:23] [PASSED] 256
[12:04:23] =============== [PASSED] test_range_overlap ================
[12:04:23] =================== test_range_compact  ====================
[12:04:23] [PASSED] 4
[12:04:23] [PASSED] 8
[12:04:23] [PASSED] 32
[12:04:23] [PASSED] 256
[12:04:23] =============== [PASSED] test_range_compact ================
[12:04:23] ==================== test_range_spare  =====================
[12:04:23] [PASSED] 4
[12:04:23] [PASSED] 8
[12:04:23] [PASSED] 32
[12:04:23] [PASSED] 256
[12:04:23] ================ [PASSED] test_range_spare =================
[12:04:23] ===================== [PASSED] guc_dbm =====================
[12:04:23] =================== guc_idm (6 subtests) ===================
[12:04:23] [PASSED] bad_init
[12:04:23] [PASSED] no_init
[12:04:23] [PASSED] init_fini
[12:04:23] [PASSED] check_used
[12:04:23] [PASSED] check_quota
[12:04:23] [PASSED] check_all
[12:04:23] ===================== [PASSED] guc_idm =====================
[12:04:23] ================== no_relay (3 subtests) ===================
[12:04:23] [PASSED] xe_drops_guc2pf_if_not_ready
[12:04:23] [PASSED] xe_drops_guc2vf_if_not_ready
[12:04:23] [PASSED] xe_rejects_send_if_not_ready
[12:04:23] ==================== [PASSED] no_relay =====================
[12:04:23] ================== pf_relay (14 subtests) ==================
[12:04:23] [PASSED] pf_rejects_guc2pf_too_short
[12:04:23] [PASSED] pf_rejects_guc2pf_too_long
[12:04:23] [PASSED] pf_rejects_guc2pf_no_payload
[12:04:23] [PASSED] pf_fails_no_payload
[12:04:23] [PASSED] pf_fails_bad_origin
[12:04:23] [PASSED] pf_fails_bad_type
[12:04:23] [PASSED] pf_txn_reports_error
[12:04:23] [PASSED] pf_txn_sends_pf2guc
[12:04:23] [PASSED] pf_sends_pf2guc
[12:04:23] [SKIPPED] pf_loopback_nop
[12:04:23] [SKIPPED] pf_loopback_echo
[12:04:23] [SKIPPED] pf_loopback_fail
[12:04:23] [SKIPPED] pf_loopback_busy
[12:04:23] [SKIPPED] pf_loopback_retry
[12:04:23] ==================== [PASSED] pf_relay =====================
[12:04:23] ================== vf_relay (3 subtests) ===================
[12:04:23] [PASSED] vf_rejects_guc2vf_too_short
[12:04:23] [PASSED] vf_rejects_guc2vf_too_long
[12:04:23] [PASSED] vf_rejects_guc2vf_no_payload
[12:04:23] ==================== [PASSED] vf_relay =====================
[12:04:23] ================= pf_service (11 subtests) =================
[12:04:23] [PASSED] pf_negotiate_any
[12:04:23] [PASSED] pf_negotiate_base_match
[12:04:23] [PASSED] pf_negotiate_base_newer
[12:04:23] [PASSED] pf_negotiate_base_next
[12:04:23] [SKIPPED] pf_negotiate_base_older
[12:04:23] [PASSED] pf_negotiate_base_prev
[12:04:23] [PASSED] pf_negotiate_latest_match
[12:04:23] [PASSED] pf_negotiate_latest_newer
[12:04:23] [PASSED] pf_negotiate_latest_next
[12:04:23] [SKIPPED] pf_negotiate_latest_older
[12:04:23] [SKIPPED] pf_negotiate_latest_prev
[12:04:23] =================== [PASSED] pf_service ====================
[12:04:23] ===================== lmtt (1 subtest) =====================
[12:04:23] ======================== test_ops  =========================
[12:04:23] [PASSED] 2-level
[12:04:23] [PASSED] multi-level
[12:04:23] ==================== [PASSED] test_ops =====================
[12:04:23] ====================== [PASSED] lmtt =======================
[12:04:23] =================== xe_mocs (2 subtests) ===================
[12:04:23] ================ xe_live_mocs_kernel_kunit  ================
[12:04:23] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[12:04:23] ================ xe_live_mocs_reset_kunit  =================
[12:04:23] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[12:04:23] ==================== [SKIPPED] xe_mocs =====================
[12:04:23] ================= xe_migrate (2 subtests) ==================
[12:04:23] ================= xe_migrate_sanity_kunit  =================
[12:04:23] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[12:04:23] ================== xe_validate_ccs_kunit  ==================
[12:04:23] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[12:04:23] =================== [SKIPPED] xe_migrate ===================
[12:04:23] ================== xe_dma_buf (1 subtest) ==================
[12:04:23] ==================== xe_dma_buf_kunit  =====================
[12:04:23] ================ [SKIPPED] xe_dma_buf_kunit ================
[12:04:23] =================== [SKIPPED] xe_dma_buf ===================
[12:04:23] ================= xe_bo_shrink (1 subtest) =================
[12:04:23] =================== xe_bo_shrink_kunit  ====================
[12:04:23] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[12:04:23] ================== [SKIPPED] xe_bo_shrink ==================
[12:04:23] ==================== xe_bo (2 subtests) ====================
[12:04:23] ================== xe_ccs_migrate_kunit  ===================
[12:04:23] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[12:04:23] ==================== xe_bo_evict_kunit  ====================
[12:04:23] =============== [SKIPPED] xe_bo_evict_kunit ================
[12:04:23] ===================== [SKIPPED] xe_bo ======================
[12:04:23] ==================== args (11 subtests) ====================
[12:04:23] [PASSED] count_args_test
[12:04:23] [PASSED] call_args_example
[12:04:23] [PASSED] call_args_test
[12:04:23] [PASSED] drop_first_arg_example
[12:04:23] [PASSED] drop_first_arg_test
[12:04:23] [PASSED] first_arg_example
[12:04:23] [PASSED] first_arg_test
[12:04:23] [PASSED] last_arg_example
[12:04:23] [PASSED] last_arg_test
[12:04:23] [PASSED] pick_arg_example
[12:04:23] [PASSED] sep_comma_example
[12:04:23] ====================== [PASSED] args =======================
[12:04:23] =================== xe_pci (2 subtests) ====================
[12:04:23] [PASSED] xe_gmdid_graphics_ip
[12:04:23] [PASSED] xe_gmdid_media_ip
[12:04:23] ===================== [PASSED] xe_pci ======================
[12:04:23] =================== xe_rtp (2 subtests) ====================
[12:04:23] =============== xe_rtp_process_to_sr_tests  ================
[12:04:23] [PASSED] coalesce-same-reg
[12:04:23] [PASSED] no-match-no-add
[12:04:23] [PASSED] match-or
[12:04:23] [PASSED] match-or-xfail
[12:04:23] [PASSED] no-match-no-add-multiple-rules
[12:04:23] [PASSED] two-regs-two-entries
[12:04:23] [PASSED] clr-one-set-other
[12:04:23] [PASSED] set-field
[12:04:23] [PASSED] conflict-duplicate
[12:04:23] [PASSED] conflict-not-disjoint
[12:04:23] [PASSED] conflict-reg-type
[12:04:23] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[12:04:23] ================== xe_rtp_process_tests  ===================
[12:04:23] [PASSED] active1
[12:04:23] [PASSED] active2
[12:04:23] [PASSED] active-inactive
[12:04:23] [PASSED] inactive-active
[12:04:23] [PASSED] inactive-1st_or_active-inactive
[12:04:23] [PASSED] inactive-2nd_or_active-inactive
[12:04:23] [PASSED] inactive-last_or_active-inactive
[12:04:23] [PASSED] inactive-no_or_active-inactive
[12:04:23] ============== [PASSED] xe_rtp_process_tests ===============
[12:04:23] ===================== [PASSED] xe_rtp ======================
[12:04:23] ==================== xe_wa (1 subtest) =====================
[12:04:23] ======================== xe_wa_gt  =========================
[12:04:23] [PASSED] TIGERLAKE (B0)
[12:04:23] [PASSED] DG1 (A0)
[12:04:23] [PASSED] DG1 (B0)
[12:04:23] [PASSED] ALDERLAKE_S (A0)
[12:04:23] [PASSED] ALDERLAKE_S (B0)
[12:04:23] [PASSED] ALDERLAKE_S (C0)
[12:04:23] [PASSED] ALDERLAKE_S (D0)
[12:04:23] [PASSED] ALDERLAKE_P (A0)
[12:04:23] [PASSED] ALDERLAKE_P (B0)
[12:04:23] [PASSED] ALDERLAKE_P (C0)
[12:04:23] [PASSED] ALDERLAKE_S_RPLS (D0)
[12:04:23] [PASSED] ALDERLAKE_P_RPLU (E0)
[12:04:23] [PASSED] DG2_G10 (C0)
[12:04:23] [PASSED] DG2_G11 (B1)
[12:04:23] [PASSED] DG2_G12 (A1)
[12:04:23] [PASSED] METEORLAKE (g:A0, m:A0)
[12:04:23] [PASSED] METEORLAKE (g:A0, m:A0)
[12:04:23] [PASSED] METEORLAKE (g:A0, m:A0)
[12:04:23] [PASSED] LUNARLAKE (g:A0, m:A0)
[12:04:23] [PASSED] LUNARLAKE (g:B0, m:A0)
[12:04:23] [PASSED] BATTLEMAGE (g:A0, m:A1)
[12:04:23] ==================== [PASSED] xe_wa_gt =====================
[12:04:23] ====================== [PASSED] xe_wa ======================
[12:04:23] ============================================================
[12:04:23] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[12:04:23] Elapsed time: 30.439s total, 4.148s configuring, 26.025s building, 0.254s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:04:24] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:04:25] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[12:04:46] Starting KUnit Kernel (1/1)...
[12:04:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:04:46] =========== drm_validate_clone_mode (2 subtests) ===========
[12:04:46] ============== drm_test_check_in_clone_mode  ===============
[12:04:46] [PASSED] in_clone_mode
[12:04:46] [PASSED] not_in_clone_mode
[12:04:46] ========== [PASSED] drm_test_check_in_clone_mode ===========
[12:04:46] =============== drm_test_check_valid_clones  ===============
[12:04:46] [PASSED] not_in_clone_mode
[12:04:46] [PASSED] valid_clone
[12:04:46] [PASSED] invalid_clone
[12:04:46] =========== [PASSED] drm_test_check_valid_clones ===========
[12:04:46] ============= [PASSED] drm_validate_clone_mode =============
[12:04:46] ============= drm_validate_modeset (1 subtest) =============
[12:04:46] [PASSED] drm_test_check_connector_changed_modeset
[12:04:46] ============== [PASSED] drm_validate_modeset ===============
[12:04:46] ================== drm_buddy (7 subtests) ==================
[12:04:46] [PASSED] drm_test_buddy_alloc_limit
[12:04:46] [PASSED] drm_test_buddy_alloc_optimistic
[12:04:46] [PASSED] drm_test_buddy_alloc_pessimistic
[12:04:46] [PASSED] drm_test_buddy_alloc_pathological
[12:04:46] [PASSED] drm_test_buddy_alloc_contiguous
[12:04:46] [PASSED] drm_test_buddy_alloc_clear
[12:04:46] [PASSED] drm_test_buddy_alloc_range_bias
[12:04:46] ==================== [PASSED] drm_buddy ====================
[12:04:46] ============= drm_cmdline_parser (40 subtests) =============
[12:04:46] [PASSED] drm_test_cmdline_force_d_only
[12:04:46] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:04:46] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:04:46] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:04:46] [PASSED] drm_test_cmdline_force_e_only
[12:04:46] [PASSED] drm_test_cmdline_res
[12:04:46] [PASSED] drm_test_cmdline_res_vesa
[12:04:46] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:04:46] [PASSED] drm_test_cmdline_res_rblank
[12:04:46] [PASSED] drm_test_cmdline_res_bpp
[12:04:46] [PASSED] drm_test_cmdline_res_refresh
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:04:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:04:46] [PASSED] drm_test_cmdline_res_margins_force_on
[12:04:46] [PASSED] drm_test_cmdline_res_vesa_margins
[12:04:46] [PASSED] drm_test_cmdline_name
[12:04:46] [PASSED] drm_test_cmdline_name_bpp
[12:04:46] [PASSED] drm_test_cmdline_name_option
[12:04:46] [PASSED] drm_test_cmdline_name_bpp_option
[12:04:46] [PASSED] drm_test_cmdline_rotate_0
[12:04:46] [PASSED] drm_test_cmdline_rotate_90
[12:04:46] [PASSED] drm_test_cmdline_rotate_180
[12:04:46] [PASSED] drm_test_cmdline_rotate_270
[12:04:46] [PASSED] drm_test_cmdline_hmirror
[12:04:46] [PASSED] drm_test_cmdline_vmirror
[12:04:46] [PASSED] drm_test_cmdline_margin_options
[12:04:46] [PASSED] drm_test_cmdline_multiple_options
[12:04:46] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:04:46] [PASSED] drm_test_cmdline_extra_and_option
[12:04:46] [PASSED] drm_test_cmdline_freestanding_options
[12:04:46] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:04:46] [PASSED] drm_test_cmdline_panel_orientation
[12:04:46] ================ drm_test_cmdline_invalid  =================
[12:04:46] [PASSED] margin_only
[12:04:46] [PASSED] interlace_only
[12:04:46] [PASSED] res_missing_x
[12:04:46] [PASSED] res_missing_y
[12:04:46] [PASSED] res_bad_y
[12:04:46] [PASSED] res_missing_y_bpp
[12:04:46] [PASSED] res_bad_bpp
[12:04:46] [PASSED] res_bad_refresh
[12:04:46] [PASSED] res_bpp_refresh_force_on_off
[12:04:46] [PASSED] res_invalid_mode
[12:04:46] [PASSED] res_bpp_wrong_place_mode
[12:04:46] [PASSED] name_bpp_refresh
[12:04:46] [PASSED] name_refresh
[12:04:46] [PASSED] name_refresh_wrong_mode
[12:04:46] [PASSED] name_refresh_invalid_mode
[12:04:46] [PASSED] rotate_multiple
[12:04:46] [PASSED] rotate_invalid_val
[12:04:46] [PASSED] rotate_truncated
[12:04:46] [PASSED] invalid_option
[12:04:46] [PASSED] invalid_tv_option
[12:04:46] [PASSED] truncated_tv_option
[12:04:46] ============ [PASSED] drm_test_cmdline_invalid =============
[12:04:46] =============== drm_test_cmdline_tv_options  ===============
[12:04:46] [PASSED] NTSC
[12:04:46] [PASSED] NTSC_443
[12:04:46] [PASSED] NTSC_J
[12:04:46] [PASSED] PAL
[12:04:46] [PASSED] PAL_M
[12:04:46] [PASSED] PAL_N
[12:04:46] [PASSED] SECAM
[12:04:46] [PASSED] MONO_525
[12:04:46] [PASSED] MONO_625
[12:04:46] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:04:46] =============== [PASSED] drm_cmdline_parser ================
[12:04:46] ========== drmm_connector_hdmi_init (20 subtests) ==========
[12:04:46] [PASSED] drm_test_connector_hdmi_init_valid
[12:04:46] [PASSED] drm_test_connector_hdmi_init_bpc_8
[12:04:46] [PASSED] drm_test_connector_hdmi_init_bpc_10
[12:04:46] [PASSED] drm_test_connector_hdmi_init_bpc_12
[12:04:46] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[12:04:46] [PASSED] drm_test_connector_hdmi_init_bpc_null
[12:04:46] [PASSED] drm_test_connector_hdmi_init_formats_empty
[12:04:46] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[12:04:46] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[12:04:46] [PASSED] supported_formats=0x9 yuv420_allowed=1
[12:04:46] [PASSED] supported_formats=0x9 yuv420_allowed=0
[12:04:46] [PASSED] supported_formats=0x3 yuv420_allowed=1
[12:04:46] [PASSED] supported_formats=0x3 yuv420_allowed=0
[12:04:46] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[12:04:46] [PASSED] drm_test_connector_hdmi_init_null_ddc
[12:04:46] [PASSED] drm_test_connector_hdmi_init_null_product
[12:04:46] [PASSED] drm_test_connector_hdmi_init_null_vendor
[12:04:46] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[12:04:46] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[12:04:46] [PASSED] drm_test_connector_hdmi_init_product_valid
[12:04:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[12:04:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[12:04:46] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[12:04:46] ========= drm_test_connector_hdmi_init_type_valid  =========
[12:04:46] [PASSED] HDMI-A
[12:04:46] [PASSED] HDMI-B
[12:04:46] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[12:04:46] ======== drm_test_connector_hdmi_init_type_invalid  ========
[12:04:46] [PASSED] Unknown
[12:04:46] [PASSED] VGA
[12:04:46] [PASSED] DVI-I
[12:04:46] [PASSED] DVI-D
[12:04:46] [PASSED] DVI-A
[12:04:46] [PASSED] Composite
[12:04:46] [PASSED] SVIDEO
[12:04:46] [PASSED] LVDS
[12:04:46] [PASSED] Component
[12:04:46] [PASSED] DIN
[12:04:46] [PASSED] DP
[12:04:46] [PASSED] TV
[12:04:46] [PASSED] eDP
[12:04:46] [PASSED] Virtual
[12:04:46] [PASSED] DSI
[12:04:46] [PASSED] DPI
[12:04:46] [PASSED] Writeback
[12:04:46] [PASSED] SPI
[12:04:46] [PASSED] USB
[12:04:46] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[12:04:46] ============ [PASSED] drmm_connector_hdmi_init =============
[12:04:46] ============= drmm_connector_init (3 subtests) =============
[12:04:46] [PASSED] drm_test_drmm_connector_init
[12:04:46] [PASSED] drm_test_drmm_connector_init_null_ddc
[12:04:46] ========= drm_test_drmm_connector_init_type_valid  =========
[12:04:46] [PASSED] Unknown
[12:04:46] [PASSED] VGA
[12:04:46] [PASSED] DVI-I
[12:04:46] [PASSED] DVI-D
[12:04:46] [PASSED] DVI-A
[12:04:46] [PASSED] Composite
[12:04:46] [PASSED] SVIDEO
[12:04:46] [PASSED] LVDS
[12:04:46] [PASSED] Component
[12:04:46] [PASSED] DIN
[12:04:46] [PASSED] DP
[12:04:46] [PASSED] HDMI-A
[12:04:46] [PASSED] HDMI-B
[12:04:46] [PASSED] TV
[12:04:46] [PASSED] eDP
[12:04:46] [PASSED] Virtual
[12:04:46] [PASSED] DSI
[12:04:46] [PASSED] DPI
[12:04:46] [PASSED] Writeback
[12:04:46] [PASSED] SPI
[12:04:46] [PASSED] USB
[12:04:46] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[12:04:46] =============== [PASSED] drmm_connector_init ===============
[12:04:46] ========= drm_connector_dynamic_init (6 subtests) ==========
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_init
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_init_properties
[12:04:46] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[12:04:46] [PASSED] Unknown
[12:04:46] [PASSED] VGA
[12:04:46] [PASSED] DVI-I
[12:04:46] [PASSED] DVI-D
[12:04:46] [PASSED] DVI-A
[12:04:46] [PASSED] Composite
[12:04:46] [PASSED] SVIDEO
[12:04:46] [PASSED] LVDS
[12:04:46] [PASSED] Component
[12:04:46] [PASSED] DIN
[12:04:46] [PASSED] DP
[12:04:46] [PASSED] HDMI-A
[12:04:46] [PASSED] HDMI-B
[12:04:46] [PASSED] TV
[12:04:46] [PASSED] eDP
[12:04:46] [PASSED] Virtual
[12:04:46] [PASSED] DSI
[12:04:46] [PASSED] DPI
[12:04:46] [PASSED] Writeback
[12:04:46] [PASSED] SPI
[12:04:46] [PASSED] USB
[12:04:46] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[12:04:46] ======== drm_test_drm_connector_dynamic_init_name  =========
[12:04:46] [PASSED] Unknown
[12:04:46] [PASSED] VGA
[12:04:46] [PASSED] DVI-I
[12:04:46] [PASSED] DVI-D
[12:04:46] [PASSED] DVI-A
[12:04:46] [PASSED] Composite
[12:04:46] [PASSED] SVIDEO
[12:04:46] [PASSED] LVDS
[12:04:46] [PASSED] Component
[12:04:46] [PASSED] DIN
[12:04:46] [PASSED] DP
[12:04:46] [PASSED] HDMI-A
[12:04:46] [PASSED] HDMI-B
[12:04:46] [PASSED] TV
[12:04:46] [PASSED] eDP
[12:04:46] [PASSED] Virtual
[12:04:46] [PASSED] DSI
[12:04:46] [PASSED] DPI
[12:04:46] [PASSED] Writeback
[12:04:46] [PASSED] SPI
[12:04:46] [PASSED] USB
[12:04:46] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[12:04:46] =========== [PASSED] drm_connector_dynamic_init ============
[12:04:46] ==== drm_connector_dynamic_register_early (4 subtests) =====
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[12:04:46] ====== [PASSED] drm_connector_dynamic_register_early =======
[12:04:46] ======= drm_connector_dynamic_register (7 subtests) ========
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[12:04:46] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[12:04:46] ========= [PASSED] drm_connector_dynamic_register ==========
[12:04:46] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[12:04:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[12:04:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[12:04:46] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[12:04:46] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:04:46] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:04:46] [PASSED] NTSC
[12:04:46] [PASSED] NTSC-443
[12:04:46] [PASSED] NTSC-J
[12:04:46] [PASSED] PAL
[12:04:46] [PASSED] PAL-M
[12:04:46] [PASSED] PAL-N
[12:04:46] [PASSED] SECAM
[12:04:46] [PASSED] Mono
[12:04:46] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:04:46] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:04:46] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:04:46] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[12:04:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[12:04:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[12:04:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[12:04:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[12:04:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[12:04:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[12:04:46] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[12:04:46] [PASSED] VIC 96
[12:04:46] [PASSED] VIC 97
[12:04:46] [PASSED] VIC 101
[12:04:46] [PASSED] VIC 102
[12:04:46] [PASSED] VIC 106
[12:04:46] [PASSED] VIC 107
[12:04:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[12:04:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[12:04:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[12:04:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[12:04:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[12:04:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[12:04:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[12:04:46] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[12:04:46] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[12:04:46] [PASSED] Automatic
[12:04:46] [PASSED] Full
[12:04:46] [PASSED] Limited 16:235
[12:04:46] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[12:04:46] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[12:04:46] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[12:04:46] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[12:04:46] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[12:04:46] [PASSED] RGB
[12:04:46] [PASSED] YUV 4:2:0
[12:04:46] [PASSED] YUV 4:2:2
[12:04:46] [PASSED] YUV 4:4:4
[12:04:46] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[12:04:46] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[12:04:46] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[12:04:46] ============= drm_damage_helper (21 subtests) ==============
[12:04:46] [PASSED] drm_test_damage_iter_no_damage
[12:04:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:04:46] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:04:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:04:46] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:04:46] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:04:46] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:04:46] [PASSED] drm_test_damage_iter_simple_damage
[12:04:46] [PASSED] drm_test_damage_iter_single_damage
[12:04:46] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:04:46] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:04:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:04:46] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:04:46] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:04:46] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:04:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:04:46] [PASSED] drm_test_damage_iter_damage
[12:04:46] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:04:46] [PASSED] drm_test_damage_iter_damage_one_outside
[12:04:46] [PASSED] drm_test_damage_iter_damage_src_moved
[12:04:46] [PASSED] drm_test_damage_iter_damage_not_visible
[12:04:46] ================ [PASSED] drm_damage_helper ================
[12:04:46] ============== drm_dp_mst_helper (3 subtests) ==============
[12:04:46] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:04:46] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:04:46] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:04:46] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:04:46] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:04:46] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:04:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:04:46] ============== drm_test_dp_mst_calc_pbn_div  ===============
[12:04:46] [PASSED] Link rate 2000000 lane count 4
[12:04:46] [PASSED] Link rate 2000000 lane count 2
[12:04:46] [PASSED] Link rate 2000000 lane count 1
[12:04:46] [PASSED] Link rate 1350000 lane count 4
[12:04:46] [PASSED] Link rate 1350000 lane count 2
[12:04:46] [PASSED] Link rate 1350000 lane count 1
[12:04:46] [PASSED] Link rate 1000000 lane count 4
[12:04:46] [PASSED] Link rate 1000000 lane count 2
[12:04:46] [PASSED] Link rate 1000000 lane count 1
[12:04:46] [PASSED] Link rate 810000 lane count 4
[12:04:46] [PASSED] Link rate 810000 lane count 2
[12:04:46] [PASSED] Link rate 810000 lane count 1
[12:04:46] [PASSED] Link rate 540000 lane count 4
[12:04:46] [PASSED] Link rate 540000 lane count 2
[12:04:46] [PASSED] Link rate 540000 lane count 1
[12:04:46] [PASSED] Link rate 270000 lane count 4
[12:04:46] [PASSED] Link rate 270000 lane count 2
[12:04:46] [PASSED] Link rate 270000 lane count 1
[12:04:46] [PASSED] Link rate 162000 lane count 4
[12:04:46] [PASSED] Link rate 162000 lane count 2
[12:04:46] [PASSED] Link rate 162000 lane count 1
[12:04:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[12:04:46] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:04:46] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:04:46] [PASSED] DP_POWER_UP_PHY with port number
[12:04:46] [PASSED] DP_POWER_DOWN_PHY with port number
[12:04:46] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:04:46] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:04:46] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:04:46] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:04:46] [PASSED] DP_QUERY_PAYLOAD with port number
[12:04:46] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:04:46] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:04:46] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:04:46] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:04:46] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:04:46] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:04:46] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:04:46] [PASSED] DP_REMOTE_I2C_READ with port number
[12:04:46] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:04:46] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:04:46] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:04:46] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:04:46] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:04:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:04:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:04:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:04:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:04:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:04:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:04:46] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:04:46] ================ [PASSED] drm_dp_mst_helper ================
[12:04:46] ================== drm_exec (7 subtests) ===================
[12:04:46] [PASSED] sanitycheck
[12:04:46] [PASSED] test_lock
[12:04:46] [PASSED] test_lock_unlock
[12:04:46] [PASSED] test_duplicates
[12:04:46] [PASSED] test_prepare
[12:04:46] [PASSED] test_prepare_array
[12:04:46] [PASSED] test_multiple_loops
[12:04:46] ==================== [PASSED] drm_exec =====================
[12:04:46] =========== drm_format_helper_test (18 subtests) ===========
[12:04:46] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:04:46] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:04:46] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:04:46] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:04:46] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:04:46] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:04:46] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:04:46] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[12:04:46] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:04:46] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:04:46] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:04:46] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:04:46] ==================== drm_test_fb_swab  =====================
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ================ [PASSED] drm_test_fb_swab =================
[12:04:46] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[12:04:46] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[12:04:46] [PASSED] single_pixel_source_buffer
[12:04:46] [PASSED] single_pixel_clip_rectangle
[12:04:46] [PASSED] well_known_colors
[12:04:46] [PASSED] destination_pitch
[12:04:46] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[12:04:46] ================= drm_test_fb_clip_offset  =================
[12:04:46] [PASSED] pass through
[12:04:46] [PASSED] horizontal offset
[12:04:46] [PASSED] vertical offset
[12:04:46] [PASSED] horizontal and vertical offset
[12:04:46] [PASSED] horizontal offset (custom pitch)
[12:04:46] [PASSED] vertical offset (custom pitch)
[12:04:46] [PASSED] horizontal and vertical offset (custom pitch)
[12:04:46] ============= [PASSED] drm_test_fb_clip_offset =============
[12:04:46] ============== drm_test_fb_build_fourcc_list  ==============
[12:04:46] [PASSED] no native formats
[12:04:46] [PASSED] XRGB8888 as native format
[12:04:46] [PASSED] remove duplicates
[12:04:46] [PASSED] convert alpha formats
[12:04:46] [PASSED] random formats
[12:04:46] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[12:04:46] =================== drm_test_fb_memcpy  ====================
[12:04:46] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[12:04:46] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[12:04:46] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[12:04:46] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[12:04:46] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[12:04:46] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[12:04:46] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[12:04:46] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[12:04:46] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[12:04:46] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[12:04:46] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[12:04:46] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[12:04:46] =============== [PASSED] drm_test_fb_memcpy ================
[12:04:46] ============= [PASSED] drm_format_helper_test ==============
[12:04:46] ================= drm_format (18 subtests) =================
[12:04:46] [PASSED] drm_test_format_block_width_invalid
[12:04:46] [PASSED] drm_test_format_block_width_one_plane
[12:04:46] [PASSED] drm_test_format_block_width_two_plane
[12:04:46] [PASSED] drm_test_format_block_width_three_plane
[12:04:46] [PASSED] drm_test_format_block_width_tiled
[12:04:46] [PASSED] drm_test_format_block_height_invalid
[12:04:46] [PASSED] drm_test_format_block_height_one_plane
[12:04:46] [PASSED] drm_test_format_block_height_two_plane
[12:04:46] [PASSED] drm_test_format_block_height_three_plane
[12:04:46] [PASSED] drm_test_format_block_height_tiled
[12:04:46] [PASSED] drm_test_format_min_pitch_invalid
[12:04:46] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:04:46] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:04:46] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:04:46] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:04:46] [PASSED] drm_test_format_min_pitch_two_plane
[12:04:46] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:04:46] [PASSED] drm_test_format_min_pitch_tiled
[12:04:46] =================== [PASSED] drm_format ====================
[12:04:46] ============== drm_framebuffer (10 subtests) ===============
[12:04:46] ========== drm_test_framebuffer_check_src_coords  ==========
[12:04:46] [PASSED] Success: source fits into fb
[12:04:46] [PASSED] Fail: overflowing fb with x-axis coordinate
[12:04:46] [PASSED] Fail: overflowing fb with y-axis coordinate
[12:04:46] [PASSED] Fail: overflowing fb with source width
[12:04:46] [PASSED] Fail: overflowing fb with source height
[12:04:46] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[12:04:46] [PASSED] drm_test_framebuffer_cleanup
[12:04:46] =============== drm_test_framebuffer_create  ===============
[12:04:46] [PASSED] ABGR8888 normal sizes
[12:04:46] [PASSED] ABGR8888 max sizes
[12:04:46] [PASSED] ABGR8888 pitch greater than min required
[12:04:46] [PASSED] ABGR8888 pitch less than min required
[12:04:46] [PASSED] ABGR8888 Invalid width
[12:04:46] [PASSED] ABGR8888 Invalid buffer handle
[12:04:46] [PASSED] No pixel format
[12:04:46] [PASSED] ABGR8888 Width 0
[12:04:46] [PASSED] ABGR8888 Height 0
[12:04:46] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:04:46] [PASSED] ABGR8888 Large buffer offset
[12:04:46] [PASSED] ABGR8888 Buffer offset for inexistent plane
[12:04:46] [PASSED] ABGR8888 Invalid flag
[12:04:46] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:04:46] [PASSED] ABGR8888 Valid buffer modifier
[12:04:46] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:04:46] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:04:46] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:04:46] [PASSED] NV12 Normal sizes
[12:04:46] [PASSED] NV12 Max sizes
[12:04:46] [PASSED] NV12 Invalid pitch
[12:04:46] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:04:46] [PASSED] NV12 different  modifier per-plane
[12:04:46] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:04:46] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:04:46] [PASSED] NV12 Modifier for inexistent plane
[12:04:46] [PASSED] NV12 Handle for inexistent plane
[12:04:46] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:04:46] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:04:46] [PASSED] YVU420 Normal sizes
[12:04:46] [PASSED] YVU420 Max sizes
[12:04:46] [PASSED] YVU420 Invalid pitch
[12:04:46] [PASSED] YVU420 Different pitches
[12:04:46] [PASSED] YVU420 Different buffer offsets/pitches
[12:04:46] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:04:46] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:04:46] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:04:46] [PASSED] YVU420 Valid modifier
[12:04:46] [PASSED] YVU420 Different modifiers per plane
[12:04:46] [PASSED] YVU420 Modifier for inexistent plane
[12:04:46] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[12:04:46] [PASSED] X0L2 Normal sizes
[12:04:46] [PASSED] X0L2 Max sizes
[12:04:46] [PASSED] X0L2 Invalid pitch
[12:04:46] [PASSED] X0L2 Pitch greater than minimum required
[12:04:46] [PASSED] X0L2 Handle for inexistent plane
[12:04:46] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:04:46] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:04:46] [PASSED] X0L2 Valid modifier
[12:04:46] [PASSED] X0L2 Modifier for inexistent plane
[12:04:46] =========== [PASSED] drm_test_framebuffer_create ===========
[12:04:46] [PASSED] drm_test_framebuffer_free
[12:04:46] [PASSED] drm_test_framebuffer_init
[12:04:46] [PASSED] drm_test_framebuffer_init_bad_format
[12:04:46] [PASSED] drm_test_framebuffer_init_dev_mismatch
[12:04:46] [PASSED] drm_test_framebuffer_lookup
[12:04:46] [PASSED] drm_test_framebuffer_lookup_inexistent
[12:04:46] [PASSED] drm_test_framebuffer_modifiers_not_supported
[12:04:46] ================= [PASSED] drm_framebuffer =================
[12:04:46] ================ drm_gem_shmem (8 subtests) ================
[12:04:46] [PASSED] drm_gem_shmem_test_obj_create
[12:04:46] [PASSED] drm_gem_shmem_test_obj_create_private
[12:04:46] [PASSED] drm_gem_shmem_test_pin_pages
[12:04:46] [PASSED] drm_gem_shmem_test_vmap
[12:04:46] [PASSED] drm_gem_shmem_test_get_pages_sgt
[12:04:46] [PASSED] drm_gem_shmem_test_get_sg_table
[12:04:46] [PASSED] drm_gem_shmem_test_madvise
[12:04:46] [PASSED] drm_gem_shmem_test_purge
[12:04:46] ================== [PASSED] drm_gem_shmem ==================
[12:04:46] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[12:04:46] [PASSED] drm_test_check_disable_connector
[12:04:46] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[12:04:46] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[12:04:46] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[12:04:46] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[12:04:46] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[12:04:46] [PASSED] drm_test_check_output_bpc_dvi
[12:04:46] [PASSED] drm_test_check_output_bpc_format_vic_1
[12:04:46] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[12:04:46] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[12:04:46] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[12:04:46] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[12:04:46] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[12:04:46] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[12:04:46] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[12:04:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[12:04:46] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[12:04:46] [PASSED] drm_test_check_broadcast_rgb_value
[12:04:46] [PASSED] drm_test_check_bpc_8_value
[12:04:46] [PASSED] drm_test_check_bpc_10_value
[12:04:46] [PASSED] drm_test_check_bpc_12_value
[12:04:46] [PASSED] drm_test_check_format_value
[12:04:46] [PASSED] drm_test_check_tmds_char_value
[12:04:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[12:04:46] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[12:04:46] [PASSED] drm_test_check_mode_valid
[12:04:46] [PASSED] drm_test_check_mode_valid_reject
[12:04:46] [PASSED] drm_test_check_mode_valid_reject_rate
[12:04:46] [PASSED] drm_test_check_mode_valid_reject_max_clock
[12:04:46] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[12:04:46] ================= drm_managed (2 subtests) =================
[12:04:46] [PASSED] drm_test_managed_release_action
[12:04:46] [PASSED] drm_test_managed_run_action
[12:04:46] =================== [PASSED] drm_managed ===================
[12:04:46] =================== drm_mm (6 subtests) ====================
[12:04:46] [PASSED] drm_test_mm_init
[12:04:46] [PASSED] drm_test_mm_debug
[12:04:46] [PASSED] drm_test_mm_align32
[12:04:46] [PASSED] drm_test_mm_align64
[12:04:46] [PASSED] drm_test_mm_lowest
[12:04:46] [PASSED] drm_test_mm_highest
[12:04:46] ===================== [PASSED] drm_mm ======================
[12:04:46] ============= drm_modes_analog_tv (5 subtests) =============
[12:04:46] [PASSED] drm_test_modes_analog_tv_mono_576i
[12:04:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:04:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:04:46] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:04:46] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:04:46] =============== [PASSED] drm_modes_analog_tv ===============
[12:04:46] ============== drm_plane_helper (2 subtests) ===============
[12:04:46] =============== drm_test_check_plane_state  ================
[12:04:46] [PASSED] clipping_simple
[12:04:46] [PASSED] clipping_rotate_reflect
[12:04:46] [PASSED] positioning_simple
[12:04:46] [PASSED] upscaling
[12:04:46] [PASSED] downscaling
[12:04:46] [PASSED] rounding1
[12:04:46] [PASSED] rounding2
[12:04:46] [PASSED] rounding3
[12:04:46] [PASSED] rounding4
[12:04:46] =========== [PASSED] drm_test_check_plane_state ============
[12:04:46] =========== drm_test_check_invalid_plane_state  ============
[12:04:46] [PASSED] positioning_invalid
[12:04:46] [PASSED] upscaling_invalid
[12:04:46] [PASSED] downscaling_invalid
[12:04:46] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:04:46] ================ [PASSED] drm_plane_helper =================
[12:04:46] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:04:46] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:04:46] [PASSED] None
[12:04:46] [PASSED] PAL
[12:04:46] [PASSED] NTSC
[12:04:46] [PASSED] Both, NTSC Default
[12:04:46] [PASSED] Both, PAL Default
[12:04:46] [PASSED] Both, NTSC Default, with PAL on command-line
[12:04:46] [PASSED] Both, PAL Default, with NTSC on command-line
[12:04:46] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:04:46] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:04:46] ================== drm_rect (9 subtests) ===================
[12:04:46] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:04:46] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:04:46] [PASSED] drm_test_rect_clip_scaled_clipped
[12:04:46] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:04:46] ================= drm_test_rect_intersect  =================
[12:04:46] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:04:46] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:04:46] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:04:46] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:04:46] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:04:46] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:04:46] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:04:46] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:04:46] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:04:46] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:04:46] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:04:46] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:04:46] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:04:46] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:04:46] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[12:04:46] ============= [PASSED] drm_test_rect_intersect =============
[12:04:46] ================ drm_test_rect_calc_hscale  ================
[12:04:46] [PASSED] normal use
[12:04:46] [PASSED] out of max range
[12:04:46] [PASSED] out of min range
[12:04:46] [PASSED] zero dst
[12:04:46] [PASSED] negative src
[12:04:46] [PASSED] negative dst
[12:04:46] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:04:46] ================ drm_test_rect_calc_vscale  ================
[12:04:46] [PASSED] normal use
[12:04:46] [PASSED] out of max range
[12:04:46] [PASSED] out of min range
[12:04:46] [PASSED] zero dst
[12:04:46] [PASSED] negative src
[12:04:46] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[12:04:46] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:04:46] ================== drm_test_rect_rotate  ===================
[12:04:46] [PASSED] reflect-x
[12:04:46] [PASSED] reflect-y
[12:04:46] [PASSED] rotate-0
[12:04:46] [PASSED] rotate-90
[12:04:46] [PASSED] rotate-180
[12:04:46] [PASSED] rotate-270
[12:04:46] ============== [PASSED] drm_test_rect_rotate ===============
[12:04:46] ================ drm_test_rect_rotate_inv  =================
[12:04:46] [PASSED] reflect-x
[12:04:46] [PASSED] reflect-y
[12:04:46] [PASSED] rotate-0
[12:04:46] [PASSED] rotate-90
[12:04:46] [PASSED] rotate-180
[12:04:46] [PASSED] rotate-270
[12:04:46] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:04:46] ==================== [PASSED] drm_rect =====================
[12:04:46] ============================================================
[12:04:46] Testing complete. Ran 602 tests: passed: 602
[12:04:46] Elapsed time: 22.759s total, 1.679s configuring, 20.910s building, 0.139s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[12:04:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:04:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[12:04:56] Starting KUnit Kernel (1/1)...
[12:04:56] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:04:56] ================= ttm_device (5 subtests) ==================
[12:04:56] [PASSED] ttm_device_init_basic
[12:04:56] [PASSED] ttm_device_init_multiple
[12:04:56] [PASSED] ttm_device_fini_basic
[12:04:56] [PASSED] ttm_device_init_no_vma_man
[12:04:56] ================== ttm_device_init_pools  ==================
[12:04:56] [PASSED] No DMA allocations, no DMA32 required
[12:04:56] [PASSED] DMA allocations, DMA32 required
[12:04:56] [PASSED] No DMA allocations, DMA32 required
[12:04:56] [PASSED] DMA allocations, no DMA32 required
[12:04:56] ============== [PASSED] ttm_device_init_pools ==============
[12:04:56] =================== [PASSED] ttm_device ====================
[12:04:56] ================== ttm_pool (8 subtests) ===================
[12:04:56] ================== ttm_pool_alloc_basic  ===================
[12:04:56] [PASSED] One page
[12:04:56] [PASSED] More than one page
[12:04:56] [PASSED] Above the allocation limit
[12:04:56] [PASSED] One page, with coherent DMA mappings enabled
[12:04:56] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:04:56] ============== [PASSED] ttm_pool_alloc_basic ===============
[12:04:56] ============== ttm_pool_alloc_basic_dma_addr  ==============
[12:04:56] [PASSED] One page
[12:04:56] [PASSED] More than one page
[12:04:56] [PASSED] Above the allocation limit
[12:04:56] [PASSED] One page, with coherent DMA mappings enabled
[12:04:56] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:04:56] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[12:04:56] [PASSED] ttm_pool_alloc_order_caching_match
[12:04:56] [PASSED] ttm_pool_alloc_caching_mismatch
[12:04:56] [PASSED] ttm_pool_alloc_order_mismatch
[12:04:56] [PASSED] ttm_pool_free_dma_alloc
[12:04:56] [PASSED] ttm_pool_free_no_dma_alloc
[12:04:56] [PASSED] ttm_pool_fini_basic
[12:04:56] ==================== [PASSED] ttm_pool =====================
[12:04:56] ================ ttm_resource (8 subtests) =================
[12:04:56] ================= ttm_resource_init_basic  =================
[12:04:56] [PASSED] Init resource in TTM_PL_SYSTEM
[12:04:56] [PASSED] Init resource in TTM_PL_VRAM
[12:04:56] [PASSED] Init resource in a private placement
[12:04:56] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[12:04:56] ============= [PASSED] ttm_resource_init_basic =============
[12:04:56] [PASSED] ttm_resource_init_pinned
[12:04:56] [PASSED] ttm_resource_fini_basic
[12:04:56] [PASSED] ttm_resource_manager_init_basic
[12:04:56] [PASSED] ttm_resource_manager_usage_basic
[12:04:56] [PASSED] ttm_resource_manager_set_used_basic
[12:04:56] [PASSED] ttm_sys_man_alloc_basic
[12:04:56] [PASSED] ttm_sys_man_free_basic
[12:04:56] ================== [PASSED] ttm_resource ===================
[12:04:56] =================== ttm_tt (15 subtests) ===================
[12:04:56] ==================== ttm_tt_init_basic  ====================
[12:04:56] [PASSED] Page-aligned size
[12:04:56] [PASSED] Extra pages requested
[12:04:56] ================ [PASSED] ttm_tt_init_basic ================
[12:04:56] [PASSED] ttm_tt_init_misaligned
[12:04:56] [PASSED] ttm_tt_fini_basic
[12:04:56] [PASSED] ttm_tt_fini_sg
[12:04:56] [PASSED] ttm_tt_fini_shmem
[12:04:56] [PASSED] ttm_tt_create_basic
[12:04:56] [PASSED] ttm_tt_create_invalid_bo_type
[12:04:56] [PASSED] ttm_tt_create_ttm_exists
[12:04:56] [PASSED] ttm_tt_create_failed
[12:04:56] [PASSED] ttm_tt_destroy_basic
[12:04:56] [PASSED] ttm_tt_populate_null_ttm
[12:04:56] [PASSED] ttm_tt_populate_populated_ttm
[12:04:56] [PASSED] ttm_tt_unpopulate_basic
[12:04:56] [PASSED] ttm_tt_unpopulate_empty_ttm
[12:04:56] [PASSED] ttm_tt_swapin_basic
[12:04:56] ===================== [PASSED] ttm_tt ======================
[12:04:56] =================== ttm_bo (14 subtests) ===================
[12:04:56] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[12:04:56] [PASSED] Cannot be interrupted and sleeps
[12:04:56] [PASSED] Cannot be interrupted, locks straight away
[12:04:56] [PASSED] Can be interrupted, sleeps
[12:04:56] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[12:04:56] [PASSED] ttm_bo_reserve_locked_no_sleep
[12:04:56] [PASSED] ttm_bo_reserve_no_wait_ticket
[12:04:56] [PASSED] ttm_bo_reserve_double_resv
[12:04:56] [PASSED] ttm_bo_reserve_interrupted
[12:04:56] [PASSED] ttm_bo_reserve_deadlock
[12:04:56] [PASSED] ttm_bo_unreserve_basic
[12:04:56] [PASSED] ttm_bo_unreserve_pinned
[12:04:56] [PASSED] ttm_bo_unreserve_bulk
[12:04:56] [PASSED] ttm_bo_put_basic
[12:04:56] [PASSED] ttm_bo_put_shared_resv
[12:04:56] [PASSED] ttm_bo_pin_basic
[12:04:56] [PASSED] ttm_bo_pin_unpin_resource
[12:04:56] [PASSED] ttm_bo_multiple_pin_one_unpin
[12:04:56] ===================== [PASSED] ttm_bo ======================
[12:04:56] ============== ttm_bo_validate (22 subtests) ===============
[12:04:56] ============== ttm_bo_init_reserved_sys_man  ===============
[12:04:56] [PASSED] Buffer object for userspace
[12:04:56] [PASSED] Kernel buffer object
[12:04:56] [PASSED] Shared buffer object
[12:04:56] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[12:04:56] ============== ttm_bo_init_reserved_mock_man  ==============
[12:04:56] [PASSED] Buffer object for userspace
[12:04:56] [PASSED] Kernel buffer object
[12:04:56] [PASSED] Shared buffer object
[12:04:56] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[12:04:56] [PASSED] ttm_bo_init_reserved_resv
[12:04:56] ================== ttm_bo_validate_basic  ==================
[12:04:56] [PASSED] Buffer object for userspace
[12:04:56] [PASSED] Kernel buffer object
[12:04:56] [PASSED] Shared buffer object
[12:04:56] ============== [PASSED] ttm_bo_validate_basic ==============
[12:04:56] [PASSED] ttm_bo_validate_invalid_placement
[12:04:56] ============= ttm_bo_validate_same_placement  ==============
[12:04:56] [PASSED] System manager
[12:04:56] [PASSED] VRAM manager
[12:04:56] ========= [PASSED] ttm_bo_validate_same_placement ==========
[12:04:56] [PASSED] ttm_bo_validate_failed_alloc
[12:04:56] [PASSED] ttm_bo_validate_pinned
[12:04:56] [PASSED] ttm_bo_validate_busy_placement
[12:04:56] ================ ttm_bo_validate_multihop  =================
[12:04:56] [PASSED] Buffer object for userspace
[12:04:56] [PASSED] Kernel buffer object
[12:04:56] [PASSED] Shared buffer object
[12:04:56] ============ [PASSED] ttm_bo_validate_multihop =============
[12:04:56] ========== ttm_bo_validate_no_placement_signaled  ==========
[12:04:56] [PASSED] Buffer object in system domain, no page vector
[12:04:56] [PASSED] Buffer object in system domain with an existing page vector
[12:04:56] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[12:04:56] ======== ttm_bo_validate_no_placement_not_signaled  ========
[12:04:56] [PASSED] Buffer object for userspace
[12:04:56] [PASSED] Kernel buffer object
[12:04:56] [PASSED] Shared buffer object
[12:04:56] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[12:04:56] [PASSED] ttm_bo_validate_move_fence_signaled
[12:04:56] ========= ttm_bo_validate_move_fence_not_signaled  =========
[12:04:56] [PASSED] Waits for GPU
[12:04:56] [PASSED] Tries to lock straight away
[12:04:56] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[12:04:56] [PASSED] ttm_bo_validate_swapout
[12:04:56] [PASSED] ttm_bo_validate_happy_evict
[12:04:56] [PASSED] ttm_bo_validate_all_pinned_evict
[12:04:56] [PASSED] ttm_bo_validate_allowed_only_evict
[12:04:56] [PASSED] ttm_bo_validate_deleted_evict
[12:04:56] [PASSED] ttm_bo_validate_busy_domain_evict
[12:04:56] [PASSED] ttm_bo_validate_evict_gutting
[12:04:56] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[12:04:56] ================= [PASSED] ttm_bo_validate =================
[12:04:56] ============================================================
[12:04:56] Testing complete. Ran 102 tests: passed: 102
[12:04:56] Elapsed time: 10.117s total, 1.681s configuring, 7.769s building, 0.586s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


