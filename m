Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFE6C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 09:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F258B10E031;
	Wed, 12 Mar 2025 09:38:02 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED07C10E031;
 Wed, 12 Mar 2025 09:38:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/hwmon=3A_expose_fan_spe?=
 =?utf-8?q?ed_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 09:38:00 -0000
Message-ID: <174177228096.24154.1459775984564544422@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312085909.755073-1-raag.jadav@intel.com>
In-Reply-To: <20250312085909.755073-1-raag.jadav@intel.com>
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

Series: drm/xe/hwmon: expose fan speed (rev3)
URL   : https://patchwork.freedesktop.org/series/144581/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:36:54] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:36:58] Building KUnit Kernel ...
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

[09:37:24] Starting KUnit Kernel (1/1)...
[09:37:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:37:25] ================== guc_buf (11 subtests) ===================
[09:37:25] [PASSED] test_smallest
[09:37:25] [PASSED] test_largest
[09:37:25] [PASSED] test_granular
[09:37:25] [PASSED] test_unique
[09:37:25] [PASSED] test_overlap
[09:37:25] [PASSED] test_reusable
[09:37:25] [PASSED] test_too_big
[09:37:25] [PASSED] test_flush
[09:37:25] [PASSED] test_lookup
[09:37:25] [PASSED] test_data
[09:37:25] [PASSED] test_class
[09:37:25] ===================== [PASSED] guc_buf =====================
[09:37:25] =================== guc_dbm (7 subtests) ===================
[09:37:25] [PASSED] test_empty
[09:37:25] [PASSED] test_default
[09:37:25] ======================== test_size  ========================
[09:37:25] [PASSED] 4
[09:37:25] [PASSED] 8
[09:37:25] [PASSED] 32
[09:37:25] [PASSED] 256
[09:37:25] ==================== [PASSED] test_size ====================
[09:37:25] ======================= test_reuse  ========================
[09:37:25] [PASSED] 4
[09:37:25] [PASSED] 8
[09:37:25] [PASSED] 32
[09:37:25] [PASSED] 256
[09:37:25] =================== [PASSED] test_reuse ====================
[09:37:25] =================== test_range_overlap  ====================
[09:37:25] [PASSED] 4
[09:37:25] [PASSED] 8
[09:37:25] [PASSED] 32
[09:37:25] [PASSED] 256
[09:37:25] =============== [PASSED] test_range_overlap ================
[09:37:25] =================== test_range_compact  ====================
[09:37:25] [PASSED] 4
[09:37:25] [PASSED] 8
[09:37:25] [PASSED] 32
[09:37:25] [PASSED] 256
[09:37:25] =============== [PASSED] test_range_compact ================
[09:37:25] ==================== test_range_spare  =====================
[09:37:25] [PASSED] 4
[09:37:25] [PASSED] 8
[09:37:25] [PASSED] 32
[09:37:25] [PASSED] 256
[09:37:25] ================ [PASSED] test_range_spare =================
[09:37:25] ===================== [PASSED] guc_dbm =====================
[09:37:25] =================== guc_idm (6 subtests) ===================
[09:37:25] [PASSED] bad_init
[09:37:25] [PASSED] no_init
[09:37:25] [PASSED] init_fini
[09:37:25] [PASSED] check_used
[09:37:25] [PASSED] check_quota
[09:37:25] [PASSED] check_all
[09:37:25] ===================== [PASSED] guc_idm =====================
[09:37:25] ================== no_relay (3 subtests) ===================
[09:37:25] [PASSED] xe_drops_guc2pf_if_not_ready
[09:37:25] [PASSED] xe_drops_guc2vf_if_not_ready
[09:37:25] [PASSED] xe_rejects_send_if_not_ready
[09:37:25] ==================== [PASSED] no_relay =====================
[09:37:25] ================== pf_relay (14 subtests) ==================
[09:37:25] [PASSED] pf_rejects_guc2pf_too_short
[09:37:25] [PASSED] pf_rejects_guc2pf_too_long
[09:37:25] [PASSED] pf_rejects_guc2pf_no_payload
[09:37:25] [PASSED] pf_fails_no_payload
[09:37:25] [PASSED] pf_fails_bad_origin
[09:37:25] [PASSED] pf_fails_bad_type
[09:37:25] [PASSED] pf_txn_reports_error
[09:37:25] [PASSED] pf_txn_sends_pf2guc
[09:37:25] [PASSED] pf_sends_pf2guc
[09:37:25] [SKIPPED] pf_loopback_nop
[09:37:25] [SKIPPED] pf_loopback_echo
[09:37:25] [SKIPPED] pf_loopback_fail
[09:37:25] [SKIPPED] pf_loopback_busy
[09:37:25] [SKIPPED] pf_loopback_retry
[09:37:25] ==================== [PASSED] pf_relay =====================
[09:37:25] ================== vf_relay (3 subtests) ===================
[09:37:25] [PASSED] vf_rejects_guc2vf_too_short
[09:37:25] [PASSED] vf_rejects_guc2vf_too_long
[09:37:25] [PASSED] vf_rejects_guc2vf_no_payload
[09:37:25] ==================== [PASSED] vf_relay =====================
[09:37:25] ================= pf_service (11 subtests) =================
[09:37:25] [PASSED] pf_negotiate_any
[09:37:25] [PASSED] pf_negotiate_base_match
[09:37:25] [PASSED] pf_negotiate_base_newer
[09:37:25] [PASSED] pf_negotiate_base_next
[09:37:25] [SKIPPED] pf_negotiate_base_older
[09:37:25] [PASSED] pf_negotiate_base_prev
[09:37:25] [PASSED] pf_negotiate_latest_match
[09:37:25] [PASSED] pf_negotiate_latest_newer
[09:37:25] [PASSED] pf_negotiate_latest_next
[09:37:25] [SKIPPED] pf_negotiate_latest_older
[09:37:25] [SKIPPED] pf_negotiate_latest_prev
[09:37:25] =================== [PASSED] pf_service ====================
[09:37:25] ===================== lmtt (1 subtest) =====================
[09:37:25] ======================== test_ops  =========================
[09:37:25] [PASSED] 2-level
[09:37:25] [PASSED] multi-level
[09:37:25] ==================== [PASSED] test_ops =====================
[09:37:25] ====================== [PASSED] lmtt =======================
[09:37:25] =================== xe_mocs (2 subtests) ===================
[09:37:25] ================ xe_live_mocs_kernel_kunit  ================
[09:37:25] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[09:37:25] ================ xe_live_mocs_reset_kunit  =================
[09:37:25] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[09:37:25] ==================== [SKIPPED] xe_mocs =====================
[09:37:25] ================= xe_migrate (2 subtests) ==================
[09:37:25] ================= xe_migrate_sanity_kunit  =================
[09:37:25] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[09:37:25] ================== xe_validate_ccs_kunit  ==================
[09:37:25] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[09:37:25] =================== [SKIPPED] xe_migrate ===================
[09:37:25] ================== xe_dma_buf (1 subtest) ==================
[09:37:25] ==================== xe_dma_buf_kunit  =====================
[09:37:25] ================ [SKIPPED] xe_dma_buf_kunit ================
[09:37:25] =================== [SKIPPED] xe_dma_buf ===================
[09:37:25] ================= xe_bo_shrink (1 subtest) =================
[09:37:25] =================== xe_bo_shrink_kunit  ====================
[09:37:25] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[09:37:25] ================== [SKIPPED] xe_bo_shrink ==================
[09:37:25] ==================== xe_bo (2 subtests) ====================
[09:37:25] ================== xe_ccs_migrate_kunit  ===================
[09:37:25] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[09:37:25] ==================== xe_bo_evict_kunit  ====================
[09:37:25] =============== [SKIPPED] xe_bo_evict_kunit ================
[09:37:25] ===================== [SKIPPED] xe_bo ======================
[09:37:25] ==================== args (11 subtests) ====================
[09:37:25] [PASSED] count_args_test
[09:37:25] [PASSED] call_args_example
[09:37:25] [PASSED] call_args_test
[09:37:25] [PASSED] drop_first_arg_example
[09:37:25] [PASSED] drop_first_arg_test
[09:37:25] [PASSED] first_arg_example
[09:37:25] [PASSED] first_arg_test
[09:37:25] [PASSED] last_arg_example
[09:37:25] [PASSED] last_arg_test
[09:37:25] [PASSED] pick_arg_example
[09:37:25] [PASSED] sep_comma_example
[09:37:25] ====================== [PASSED] args =======================
[09:37:25] =================== xe_pci (2 subtests) ====================
[09:37:25] [PASSED] xe_gmdid_graphics_ip
[09:37:25] [PASSED] xe_gmdid_media_ip
[09:37:25] ===================== [PASSED] xe_pci ======================
[09:37:25] =================== xe_rtp (2 subtests) ====================
[09:37:25] =============== xe_rtp_process_to_sr_tests  ================
[09:37:25] [PASSED] coalesce-same-reg
[09:37:25] [PASSED] no-match-no-add
[09:37:25] [PASSED] match-or
[09:37:25] [PASSED] match-or-xfail
[09:37:25] [PASSED] no-match-no-add-multiple-rules
[09:37:25] [PASSED] two-regs-two-entries
[09:37:25] [PASSED] clr-one-set-other
[09:37:25] [PASSED] set-field
[09:37:25] [PASSED] conflict-duplicate
[09:37:25] [PASSED] conflict-not-disjoint
[09:37:25] [PASSED] conflict-reg-type
[09:37:25] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[09:37:25] ================== xe_rtp_process_tests  ===================
[09:37:25] [PASSED] active1
[09:37:25] [PASSED] active2
[09:37:25] [PASSED] active-inactive
[09:37:25] [PASSED] inactive-active
[09:37:25] [PASSED] inactive-1st_or_active-inactive
[09:37:25] [PASSED] inactive-2nd_or_active-inactive
[09:37:25] [PASSED] inactive-last_or_active-inactive
[09:37:25] [PASSED] inactive-no_or_active-inactive
[09:37:25] ============== [PASSED] xe_rtp_process_tests ===============
[09:37:25] ===================== [PASSED] xe_rtp ======================
[09:37:25] ==================== xe_wa (1 subtest) =====================
[09:37:25] ======================== xe_wa_gt  =========================
[09:37:25] [PASSED] TIGERLAKE (B0)
[09:37:25] [PASSED] DG1 (A0)
[09:37:25] [PASSED] DG1 (B0)
[09:37:25] [PASSED] ALDERLAKE_S (A0)
[09:37:25] [PASSED] ALDERLAKE_S (B0)
[09:37:25] [PASSED] ALDERLAKE_S (C0)
[09:37:25] [PASSED] ALDERLAKE_S (D0)
[09:37:25] [PASSED] ALDERLAKE_P (A0)
[09:37:25] [PASSED] ALDERLAKE_P (B0)
[09:37:25] [PASSED] ALDERLAKE_P (C0)
[09:37:25] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:37:25] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:37:25] [PASSED] DG2_G10 (C0)
[09:37:25] [PASSED] DG2_G11 (B1)
[09:37:25] [PASSED] DG2_G12 (A1)
[09:37:25] [PASSED] METEORLAKE (g:A0, m:A0)
[09:37:25] [PASSED] METEORLAKE (g:A0, m:A0)
[09:37:25] [PASSED] METEORLAKE (g:A0, m:A0)
[09:37:25] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:37:25] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:37:25] [PASSED] BATTLEMAGE (g:A0, m:A1)
[09:37:25] ==================== [PASSED] xe_wa_gt =====================
[09:37:25] ====================== [PASSED] xe_wa ======================
[09:37:25] ============================================================
[09:37:25] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[09:37:25] Elapsed time: 30.623s total, 4.206s configuring, 26.200s building, 0.203s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:37:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:37:26] Building KUnit Kernel ...
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

[09:37:47] Starting KUnit Kernel (1/1)...
[09:37:47] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:37:47] =========== drm_validate_clone_mode (2 subtests) ===========
[09:37:47] ============== drm_test_check_in_clone_mode  ===============
[09:37:47] [PASSED] in_clone_mode
[09:37:47] [PASSED] not_in_clone_mode
[09:37:47] ========== [PASSED] drm_test_check_in_clone_mode ===========
[09:37:47] =============== drm_test_check_valid_clones  ===============
[09:37:47] [PASSED] not_in_clone_mode
[09:37:47] [PASSED] valid_clone
[09:37:47] [PASSED] invalid_clone
[09:37:47] =========== [PASSED] drm_test_check_valid_clones ===========
[09:37:47] ============= [PASSED] drm_validate_clone_mode =============
[09:37:47] ============= drm_validate_modeset (1 subtest) =============
[09:37:47] [PASSED] drm_test_check_connector_changed_modeset
[09:37:47] ============== [PASSED] drm_validate_modeset ===============
[09:37:47] ================== drm_buddy (7 subtests) ==================
[09:37:47] [PASSED] drm_test_buddy_alloc_limit
[09:37:47] [PASSED] drm_test_buddy_alloc_optimistic
[09:37:47] [PASSED] drm_test_buddy_alloc_pessimistic
[09:37:47] [PASSED] drm_test_buddy_alloc_pathological
[09:37:47] [PASSED] drm_test_buddy_alloc_contiguous
[09:37:47] [PASSED] drm_test_buddy_alloc_clear
[09:37:47] [PASSED] drm_test_buddy_alloc_range_bias
[09:37:47] ==================== [PASSED] drm_buddy ====================
[09:37:47] ============= drm_cmdline_parser (40 subtests) =============
[09:37:47] [PASSED] drm_test_cmdline_force_d_only
[09:37:47] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:37:47] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:37:47] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:37:47] [PASSED] drm_test_cmdline_force_e_only
[09:37:47] [PASSED] drm_test_cmdline_res
[09:37:47] [PASSED] drm_test_cmdline_res_vesa
[09:37:47] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:37:47] [PASSED] drm_test_cmdline_res_rblank
[09:37:47] [PASSED] drm_test_cmdline_res_bpp
[09:37:47] [PASSED] drm_test_cmdline_res_refresh
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:37:47] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:37:47] [PASSED] drm_test_cmdline_res_margins_force_on
[09:37:47] [PASSED] drm_test_cmdline_res_vesa_margins
[09:37:47] [PASSED] drm_test_cmdline_name
[09:37:47] [PASSED] drm_test_cmdline_name_bpp
[09:37:47] [PASSED] drm_test_cmdline_name_option
[09:37:47] [PASSED] drm_test_cmdline_name_bpp_option
[09:37:47] [PASSED] drm_test_cmdline_rotate_0
[09:37:47] [PASSED] drm_test_cmdline_rotate_90
[09:37:47] [PASSED] drm_test_cmdline_rotate_180
[09:37:47] [PASSED] drm_test_cmdline_rotate_270
[09:37:47] [PASSED] drm_test_cmdline_hmirror
[09:37:47] [PASSED] drm_test_cmdline_vmirror
[09:37:47] [PASSED] drm_test_cmdline_margin_options
[09:37:47] [PASSED] drm_test_cmdline_multiple_options
[09:37:47] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:37:47] [PASSED] drm_test_cmdline_extra_and_option
[09:37:47] [PASSED] drm_test_cmdline_freestanding_options
[09:37:47] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:37:47] [PASSED] drm_test_cmdline_panel_orientation
[09:37:47] ================ drm_test_cmdline_invalid  =================
[09:37:47] [PASSED] margin_only
[09:37:47] [PASSED] interlace_only
[09:37:47] [PASSED] res_missing_x
[09:37:47] [PASSED] res_missing_y
[09:37:47] [PASSED] res_bad_y
[09:37:47] [PASSED] res_missing_y_bpp
[09:37:47] [PASSED] res_bad_bpp
[09:37:47] [PASSED] res_bad_refresh
[09:37:47] [PASSED] res_bpp_refresh_force_on_off
[09:37:47] [PASSED] res_invalid_mode
[09:37:47] [PASSED] res_bpp_wrong_place_mode
[09:37:47] [PASSED] name_bpp_refresh
[09:37:47] [PASSED] name_refresh
[09:37:47] [PASSED] name_refresh_wrong_mode
[09:37:47] [PASSED] name_refresh_invalid_mode
[09:37:47] [PASSED] rotate_multiple
[09:37:47] [PASSED] rotate_invalid_val
[09:37:47] [PASSED] rotate_truncated
[09:37:47] [PASSED] invalid_option
[09:37:47] [PASSED] invalid_tv_option
[09:37:47] [PASSED] truncated_tv_option
[09:37:47] ============ [PASSED] drm_test_cmdline_invalid =============
[09:37:47] =============== drm_test_cmdline_tv_options  ===============
[09:37:47] [PASSED] NTSC
[09:37:47] [PASSED] NTSC_443
[09:37:47] [PASSED] NTSC_J
[09:37:47] [PASSED] PAL
[09:37:47] [PASSED] PAL_M
[09:37:47] [PASSED] PAL_N
[09:37:47] [PASSED] SECAM
[09:37:47] [PASSED] MONO_525
[09:37:47] [PASSED] MONO_625
[09:37:47] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:37:47] =============== [PASSED] drm_cmdline_parser ================
[09:37:47] ========== drmm_connector_hdmi_init (20 subtests) ==========
[09:37:47] [PASSED] drm_test_connector_hdmi_init_valid
[09:37:47] [PASSED] drm_test_connector_hdmi_init_bpc_8
[09:37:47] [PASSED] drm_test_connector_hdmi_init_bpc_10
[09:37:47] [PASSED] drm_test_connector_hdmi_init_bpc_12
[09:37:47] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[09:37:47] [PASSED] drm_test_connector_hdmi_init_bpc_null
[09:37:47] [PASSED] drm_test_connector_hdmi_init_formats_empty
[09:37:47] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[09:37:47] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[09:37:47] [PASSED] supported_formats=0x9 yuv420_allowed=1
[09:37:47] [PASSED] supported_formats=0x9 yuv420_allowed=0
[09:37:47] [PASSED] supported_formats=0x3 yuv420_allowed=1
[09:37:47] [PASSED] supported_formats=0x3 yuv420_allowed=0
[09:37:47] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[09:37:47] [PASSED] drm_test_connector_hdmi_init_null_ddc
[09:37:47] [PASSED] drm_test_connector_hdmi_init_null_product
[09:37:47] [PASSED] drm_test_connector_hdmi_init_null_vendor
[09:37:47] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[09:37:47] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[09:37:47] [PASSED] drm_test_connector_hdmi_init_product_valid
[09:37:47] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[09:37:47] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[09:37:47] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[09:37:47] ========= drm_test_connector_hdmi_init_type_valid  =========
[09:37:47] [PASSED] HDMI-A
[09:37:47] [PASSED] HDMI-B
[09:37:47] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[09:37:47] ======== drm_test_connector_hdmi_init_type_invalid  ========
[09:37:47] [PASSED] Unknown
[09:37:47] [PASSED] VGA
[09:37:47] [PASSED] DVI-I
[09:37:47] [PASSED] DVI-D
[09:37:47] [PASSED] DVI-A
[09:37:47] [PASSED] Composite
[09:37:47] [PASSED] SVIDEO
[09:37:47] [PASSED] LVDS
[09:37:47] [PASSED] Component
[09:37:47] [PASSED] DIN
[09:37:47] [PASSED] DP
[09:37:47] [PASSED] TV
[09:37:47] [PASSED] eDP
[09:37:47] [PASSED] Virtual
[09:37:47] [PASSED] DSI
[09:37:47] [PASSED] DPI
[09:37:47] [PASSED] Writeback
[09:37:47] [PASSED] SPI
[09:37:47] [PASSED] USB
[09:37:47] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[09:37:47] ============ [PASSED] drmm_connector_hdmi_init =============
[09:37:47] ============= drmm_connector_init (3 subtests) =============
[09:37:47] [PASSED] drm_test_drmm_connector_init
[09:37:47] [PASSED] drm_test_drmm_connector_init_null_ddc
[09:37:47] ========= drm_test_drmm_connector_init_type_valid  =========
[09:37:47] [PASSED] Unknown
[09:37:47] [PASSED] VGA
[09:37:47] [PASSED] DVI-I
[09:37:47] [PASSED] DVI-D
[09:37:47] [PASSED] DVI-A
[09:37:47] [PASSED] Composite
[09:37:47] [PASSED] SVIDEO
[09:37:47] [PASSED] LVDS
[09:37:47] [PASSED] Component
[09:37:47] [PASSED] DIN
[09:37:47] [PASSED] DP
[09:37:47] [PASSED] HDMI-A
[09:37:47] [PASSED] HDMI-B
[09:37:47] [PASSED] TV
[09:37:47] [PASSED] eDP
[09:37:47] [PASSED] Virtual
[09:37:47] [PASSED] DSI
[09:37:47] [PASSED] DPI
[09:37:47] [PASSED] Writeback
[09:37:47] [PASSED] SPI
[09:37:47] [PASSED] USB
[09:37:47] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[09:37:47] =============== [PASSED] drmm_connector_init ===============
[09:37:47] ========= drm_connector_dynamic_init (6 subtests) ==========
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_init
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_init_properties
[09:37:47] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[09:37:47] [PASSED] Unknown
[09:37:47] [PASSED] VGA
[09:37:47] [PASSED] DVI-I
[09:37:47] [PASSED] DVI-D
[09:37:47] [PASSED] DVI-A
[09:37:47] [PASSED] Composite
[09:37:47] [PASSED] SVIDEO
[09:37:47] [PASSED] LVDS
[09:37:47] [PASSED] Component
[09:37:47] [PASSED] DIN
[09:37:47] [PASSED] DP
[09:37:47] [PASSED] HDMI-A
[09:37:47] [PASSED] HDMI-B
[09:37:47] [PASSED] TV
[09:37:47] [PASSED] eDP
[09:37:47] [PASSED] Virtual
[09:37:47] [PASSED] DSI
[09:37:47] [PASSED] DPI
[09:37:47] [PASSED] Writeback
[09:37:47] [PASSED] SPI
[09:37:47] [PASSED] USB
[09:37:47] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[09:37:47] ======== drm_test_drm_connector_dynamic_init_name  =========
[09:37:47] [PASSED] Unknown
[09:37:47] [PASSED] VGA
[09:37:47] [PASSED] DVI-I
[09:37:47] [PASSED] DVI-D
[09:37:47] [PASSED] DVI-A
[09:37:47] [PASSED] Composite
[09:37:47] [PASSED] SVIDEO
[09:37:47] [PASSED] LVDS
[09:37:47] [PASSED] Component
[09:37:47] [PASSED] DIN
[09:37:47] [PASSED] DP
[09:37:47] [PASSED] HDMI-A
[09:37:47] [PASSED] HDMI-B
[09:37:47] [PASSED] TV
[09:37:47] [PASSED] eDP
[09:37:47] [PASSED] Virtual
[09:37:47] [PASSED] DSI
[09:37:47] [PASSED] DPI
[09:37:47] [PASSED] Writeback
[09:37:47] [PASSED] SPI
[09:37:47] [PASSED] USB
[09:37:47] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[09:37:47] =========== [PASSED] drm_connector_dynamic_init ============
[09:37:47] ==== drm_connector_dynamic_register_early (4 subtests) =====
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[09:37:47] ====== [PASSED] drm_connector_dynamic_register_early =======
[09:37:47] ======= drm_connector_dynamic_register (7 subtests) ========
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[09:37:47] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[09:37:47] ========= [PASSED] drm_connector_dynamic_register ==========
[09:37:47] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[09:37:47] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[09:37:47] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[09:37:47] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[09:37:47] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:37:47] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:37:47] [PASSED] NTSC
[09:37:47] [PASSED] NTSC-443
[09:37:47] [PASSED] NTSC-J
[09:37:47] [PASSED] PAL
[09:37:47] [PASSED] PAL-M
[09:37:47] [PASSED] PAL-N
[09:37:47] [PASSED] SECAM
[09:37:47] [PASSED] Mono
[09:37:47] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:37:47] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:37:47] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:37:47] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[09:37:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[09:37:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[09:37:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[09:37:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[09:37:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[09:37:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[09:37:47] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[09:37:47] [PASSED] VIC 96
[09:37:47] [PASSED] VIC 97
[09:37:47] [PASSED] VIC 101
[09:37:47] [PASSED] VIC 102
[09:37:47] [PASSED] VIC 106
[09:37:47] [PASSED] VIC 107
[09:37:47] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[09:37:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[09:37:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[09:37:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[09:37:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[09:37:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[09:37:47] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[09:37:47] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[09:37:47] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[09:37:47] [PASSED] Automatic
[09:37:47] [PASSED] Full
[09:37:47] [PASSED] Limited 16:235
[09:37:47] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[09:37:47] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[09:37:47] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[09:37:47] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[09:37:47] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[09:37:47] [PASSED] RGB
[09:37:47] [PASSED] YUV 4:2:0
[09:37:47] [PASSED] YUV 4:2:2
[09:37:47] [PASSED] YUV 4:4:4
[09:37:47] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[09:37:47] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[09:37:47] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[09:37:47] ============= drm_damage_helper (21 subtests) ==============
[09:37:47] [PASSED] drm_test_damage_iter_no_damage
[09:37:47] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:37:47] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:37:47] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:37:47] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:37:47] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:37:47] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:37:47] [PASSED] drm_test_damage_iter_simple_damage
[09:37:47] [PASSED] drm_test_damage_iter_single_damage
[09:37:47] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:37:47] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:37:47] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:37:47] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:37:47] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:37:47] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:37:47] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:37:47] [PASSED] drm_test_damage_iter_damage
[09:37:47] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:37:47] [PASSED] drm_test_damage_iter_damage_one_outside
[09:37:47] [PASSED] drm_test_damage_iter_damage_src_moved
[09:37:47] [PASSED] drm_test_damage_iter_damage_not_visible
[09:37:47] ================ [PASSED] drm_damage_helper ================
[09:37:47] ============== drm_dp_mst_helper (3 subtests) ==============
[09:37:47] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:37:47] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:37:47] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:37:47] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:37:47] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:37:47] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:37:47] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:37:47] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:37:47] [PASSED] Link rate 2000000 lane count 4
[09:37:47] [PASSED] Link rate 2000000 lane count 2
[09:37:47] [PASSED] Link rate 2000000 lane count 1
[09:37:47] [PASSED] Link rate 1350000 lane count 4
[09:37:47] [PASSED] Link rate 1350000 lane count 2
[09:37:47] [PASSED] Link rate 1350000 lane count 1
[09:37:47] [PASSED] Link rate 1000000 lane count 4
[09:37:47] [PASSED] Link rate 1000000 lane count 2
[09:37:47] [PASSED] Link rate 1000000 lane count 1
[09:37:47] [PASSED] Link rate 810000 lane count 4
[09:37:47] [PASSED] Link rate 810000 lane count 2
[09:37:47] [PASSED] Link rate 810000 lane count 1
[09:37:47] [PASSED] Link rate 540000 lane count 4
[09:37:47] [PASSED] Link rate 540000 lane count 2
[09:37:47] [PASSED] Link rate 540000 lane count 1
[09:37:47] [PASSED] Link rate 270000 lane count 4
[09:37:47] [PASSED] Link rate 270000 lane count 2
[09:37:47] [PASSED] Link rate 270000 lane count 1
[09:37:47] [PASSED] Link rate 162000 lane count 4
[09:37:47] [PASSED] Link rate 162000 lane count 2
[09:37:47] [PASSED] Link rate 162000 lane count 1
[09:37:47] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:37:47] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:37:47] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:37:47] [PASSED] DP_POWER_UP_PHY with port number
[09:37:47] [PASSED] DP_POWER_DOWN_PHY with port number
[09:37:47] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:37:47] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:37:47] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:37:47] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:37:47] [PASSED] DP_QUERY_PAYLOAD with port number
[09:37:47] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:37:47] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:37:47] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:37:47] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:37:47] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:37:47] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:37:47] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:37:47] [PASSED] DP_REMOTE_I2C_READ with port number
[09:37:47] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:37:47] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:37:47] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:37:47] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:37:47] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:37:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:37:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:37:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:37:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:37:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:37:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:37:47] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:37:47] ================ [PASSED] drm_dp_mst_helper ================
[09:37:47] ================== drm_exec (7 subtests) ===================
[09:37:47] [PASSED] sanitycheck
[09:37:47] [PASSED] test_lock
[09:37:47] [PASSED] test_lock_unlock
[09:37:47] [PASSED] test_duplicates
[09:37:47] [PASSED] test_prepare
[09:37:47] [PASSED] test_prepare_array
[09:37:47] [PASSED] test_multiple_loops
[09:37:47] ==================== [PASSED] drm_exec =====================
[09:37:47] =========== drm_format_helper_test (18 subtests) ===========
[09:37:47] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:37:47] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:37:47] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:37:47] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:37:47] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:37:47] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:37:47] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:37:47] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[09:37:47] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:37:47] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:37:47] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:37:47] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:37:47] ==================== drm_test_fb_swab  =====================
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ================ [PASSED] drm_test_fb_swab =================
[09:37:47] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:37:47] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:37:47] [PASSED] single_pixel_source_buffer
[09:37:47] [PASSED] single_pixel_clip_rectangle
[09:37:47] [PASSED] well_known_colors
[09:37:47] [PASSED] destination_pitch
[09:37:47] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:37:47] ================= drm_test_fb_clip_offset  =================
[09:37:47] [PASSED] pass through
[09:37:47] [PASSED] horizontal offset
[09:37:47] [PASSED] vertical offset
[09:37:47] [PASSED] horizontal and vertical offset
[09:37:47] [PASSED] horizontal offset (custom pitch)
[09:37:47] [PASSED] vertical offset (custom pitch)
[09:37:47] [PASSED] horizontal and vertical offset (custom pitch)
[09:37:47] ============= [PASSED] drm_test_fb_clip_offset =============
[09:37:47] ============== drm_test_fb_build_fourcc_list  ==============
[09:37:47] [PASSED] no native formats
[09:37:47] [PASSED] XRGB8888 as native format
[09:37:47] [PASSED] remove duplicates
[09:37:47] [PASSED] convert alpha formats
[09:37:47] [PASSED] random formats
[09:37:47] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[09:37:47] =================== drm_test_fb_memcpy  ====================
[09:37:47] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:37:47] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:37:47] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:37:47] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:37:47] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:37:47] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:37:47] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:37:47] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:37:47] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:37:47] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:37:47] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:37:47] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:37:47] =============== [PASSED] drm_test_fb_memcpy ================
[09:37:47] ============= [PASSED] drm_format_helper_test ==============
[09:37:47] ================= drm_format (18 subtests) =================
[09:37:47] [PASSED] drm_test_format_block_width_invalid
[09:37:47] [PASSED] drm_test_format_block_width_one_plane
[09:37:47] [PASSED] drm_test_format_block_width_two_plane
[09:37:47] [PASSED] drm_test_format_block_width_three_plane
[09:37:47] [PASSED] drm_test_format_block_width_tiled
[09:37:47] [PASSED] drm_test_format_block_height_invalid
[09:37:47] [PASSED] drm_test_format_block_height_one_plane
[09:37:47] [PASSED] drm_test_format_block_height_two_plane
[09:37:47] [PASSED] drm_test_format_block_height_three_plane
[09:37:47] [PASSED] drm_test_format_block_height_tiled
[09:37:47] [PASSED] drm_test_format_min_pitch_invalid
[09:37:47] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:37:47] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:37:47] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:37:47] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:37:47] [PASSED] drm_test_format_min_pitch_two_plane
[09:37:47] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:37:47] [PASSED] drm_test_format_min_pitch_tiled
[09:37:47] =================== [PASSED] drm_format ====================
[09:37:47] ============== drm_framebuffer (10 subtests) ===============
[09:37:47] ========== drm_test_framebuffer_check_src_coords  ==========
[09:37:47] [PASSED] Success: source fits into fb
[09:37:47] [PASSED] Fail: overflowing fb with x-axis coordinate
[09:37:47] [PASSED] Fail: overflowing fb with y-axis coordinate
[09:37:47] [PASSED] Fail: overflowing fb with source width
[09:37:47] [PASSED] Fail: overflowing fb with source height
[09:37:47] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[09:37:47] [PASSED] drm_test_framebuffer_cleanup
[09:37:47] =============== drm_test_framebuffer_create  ===============
[09:37:47] [PASSED] ABGR8888 normal sizes
[09:37:47] [PASSED] ABGR8888 max sizes
[09:37:47] [PASSED] ABGR8888 pitch greater than min required
[09:37:47] [PASSED] ABGR8888 pitch less than min required
[09:37:47] [PASSED] ABGR8888 Invalid width
[09:37:47] [PASSED] ABGR8888 Invalid buffer handle
[09:37:47] [PASSED] No pixel format
[09:37:47] [PASSED] ABGR8888 Width 0
[09:37:47] [PASSED] ABGR8888 Height 0
[09:37:47] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:37:47] [PASSED] ABGR8888 Large buffer offset
[09:37:47] [PASSED] ABGR8888 Buffer offset for inexistent plane
[09:37:47] [PASSED] ABGR8888 Invalid flag
[09:37:47] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:37:47] [PASSED] ABGR8888 Valid buffer modifier
[09:37:47] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:37:47] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:37:47] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:37:47] [PASSED] NV12 Normal sizes
[09:37:47] [PASSED] NV12 Max sizes
[09:37:47] [PASSED] NV12 Invalid pitch
[09:37:47] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:37:47] [PASSED] NV12 different  modifier per-plane
[09:37:47] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:37:47] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:37:47] [PASSED] NV12 Modifier for inexistent plane
[09:37:47] [PASSED] NV12 Handle for inexistent plane
[09:37:47] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:37:47] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:37:47] [PASSED] YVU420 Normal sizes
[09:37:47] [PASSED] YVU420 Max sizes
[09:37:47] [PASSED] YVU420 Invalid pitch
[09:37:47] [PASSED] YVU420 Different pitches
[09:37:47] [PASSED] YVU420 Different buffer offsets/pitches
[09:37:47] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:37:47] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:37:47] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:37:47] [PASSED] YVU420 Valid modifier
[09:37:47] [PASSED] YVU420 Different modifiers per plane
[09:37:47] [PASSED] YVU420 Modifier for inexistent plane
[09:37:47] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[09:37:47] [PASSED] X0L2 Normal sizes
[09:37:47] [PASSED] X0L2 Max sizes
[09:37:47] [PASSED] X0L2 Invalid pitch
[09:37:47] [PASSED] X0L2 Pitch greater than minimum required
[09:37:47] [PASSED] X0L2 Handle for inexistent plane
[09:37:47] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:37:47] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:37:47] [PASSED] X0L2 Valid modifier
[09:37:47] [PASSED] X0L2 Modifier for inexistent plane
[09:37:47] =========== [PASSED] drm_test_framebuffer_create ===========
[09:37:47] [PASSED] drm_test_framebuffer_free
[09:37:47] [PASSED] drm_test_framebuffer_init
[09:37:47] [PASSED] drm_test_framebuffer_init_bad_format
[09:37:47] [PASSED] drm_test_framebuffer_init_dev_mismatch
[09:37:47] [PASSED] drm_test_framebuffer_lookup
[09:37:47] [PASSED] drm_test_framebuffer_lookup_inexistent
[09:37:47] [PASSED] drm_test_framebuffer_modifiers_not_supported
[09:37:47] ================= [PASSED] drm_framebuffer =================
[09:37:47] ================ drm_gem_shmem (8 subtests) ================
[09:37:47] [PASSED] drm_gem_shmem_test_obj_create
[09:37:47] [PASSED] drm_gem_shmem_test_obj_create_private
[09:37:47] [PASSED] drm_gem_shmem_test_pin_pages
[09:37:47] [PASSED] drm_gem_shmem_test_vmap
[09:37:47] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:37:47] [PASSED] drm_gem_shmem_test_get_sg_table
[09:37:47] [PASSED] drm_gem_shmem_test_madvise
[09:37:47] [PASSED] drm_gem_shmem_test_purge
[09:37:47] ================== [PASSED] drm_gem_shmem ==================
[09:37:47] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[09:37:47] [PASSED] drm_test_check_disable_connector
[09:37:47] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[09:37:47] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[09:37:47] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[09:37:47] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[09:37:47] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[09:37:47] [PASSED] drm_test_check_output_bpc_dvi
[09:37:47] [PASSED] drm_test_check_output_bpc_format_vic_1
[09:37:47] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[09:37:47] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[09:37:47] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[09:37:47] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[09:37:47] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[09:37:47] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[09:37:47] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[09:37:47] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[09:37:47] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[09:37:47] [PASSED] drm_test_check_broadcast_rgb_value
[09:37:47] [PASSED] drm_test_check_bpc_8_value
[09:37:47] [PASSED] drm_test_check_bpc_10_value
[09:37:47] [PASSED] drm_test_check_bpc_12_value
[09:37:47] [PASSED] drm_test_check_format_value
[09:37:47] [PASSED] drm_test_check_tmds_char_value
[09:37:47] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[09:37:47] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[09:37:47] [PASSED] drm_test_check_mode_valid
[09:37:47] [PASSED] drm_test_check_mode_valid_reject
[09:37:47] [PASSED] drm_test_check_mode_valid_reject_rate
[09:37:47] [PASSED] drm_test_check_mode_valid_reject_max_clock
[09:37:47] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[09:37:47] ================= drm_managed (2 subtests) =================
[09:37:47] [PASSED] drm_test_managed_release_action
[09:37:47] [PASSED] drm_test_managed_run_action
[09:37:47] =================== [PASSED] drm_managed ===================
[09:37:47] =================== drm_mm (6 subtests) ====================
[09:37:47] [PASSED] drm_test_mm_init
[09:37:47] [PASSED] drm_test_mm_debug
[09:37:47] [PASSED] drm_test_mm_align32
[09:37:47] [PASSED] drm_test_mm_align64
[09:37:47] [PASSED] drm_test_mm_lowest
[09:37:47] [PASSED] drm_test_mm_highest
[09:37:47] ===================== [PASSED] drm_mm ======================
[09:37:47] ============= drm_modes_analog_tv (5 subtests) =============
[09:37:47] [PASSED] drm_test_modes_analog_tv_mono_576i
[09:37:47] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:37:47] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:37:47] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:37:47] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:37:47] =============== [PASSED] drm_modes_analog_tv ===============
[09:37:47] ============== drm_plane_helper (2 subtests) ===============
[09:37:47] =============== drm_test_check_plane_state  ================
[09:37:47] [PASSED] clipping_simple
[09:37:47] [PASSED] clipping_rotate_reflect
[09:37:47] [PASSED] positioning_simple
[09:37:47] [PASSED] upscaling
[09:37:47] [PASSED] downscaling
[09:37:47] [PASSED] rounding1
[09:37:47] [PASSED] rounding2
[09:37:47] [PASSED] rounding3
[09:37:47] [PASSED] rounding4
[09:37:47] =========== [PASSED] drm_test_check_plane_state ============
[09:37:47] =========== drm_test_check_invalid_plane_state  ============
[09:37:47] [PASSED] positioning_invalid
[09:37:47] [PASSED] upscaling_invalid
[09:37:47] [PASSED] downscaling_invalid
[09:37:47] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:37:47] ================ [PASSED] drm_plane_helper =================
[09:37:47] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:37:47] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:37:47] [PASSED] None
[09:37:47] [PASSED] PAL
[09:37:47] [PASSED] NTSC
[09:37:47] [PASSED] Both, NTSC Default
[09:37:47] [PASSED] Both, PAL Default
[09:37:47] [PASSED] Both, NTSC Default, with PAL on command-line
[09:37:47] [PASSED] Both, PAL Default, with NTSC on command-line
[09:37:47] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:37:47] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:37:47] ================== drm_rect (9 subtests) ===================
[09:37:47] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:37:47] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:37:47] [PASSED] drm_test_rect_clip_scaled_clipped
[09:37:47] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:37:47] ================= drm_test_rect_intersect  =================
[09:37:47] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:37:47] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:37:47] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:37:47] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:37:47] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:37:47] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:37:47] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:37:47] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:37:47] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:37:47] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:37:47] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:37:47] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:37:47] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:37:47] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:37:47] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:37:47] ============= [PASSED] drm_test_rect_intersect =============
[09:37:47] ================ drm_test_rect_calc_hscale  ================
[09:37:47] [PASSED] normal use
[09:37:47] [PASSED] out of max range
[09:37:47] [PASSED] out of min range
[09:37:47] [PASSED] zero dst
[09:37:47] [PASSED] negative src
[09:37:47] [PASSED] negative dst
[09:37:47] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:37:47] ================ drm_test_rect_calc_vscale  ================
[09:37:47] [PASSED] normal use
[09:37:47] [PASSED] out of max range
[09:37:47] [PASSED] out of min range
[09:37:47] [PASSED] zero dst
[09:37:47] [PASSED] negative src
[09:37:47] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[09:37:47] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:37:47] ================== drm_test_rect_rotate  ===================
[09:37:47] [PASSED] reflect-x
[09:37:47] [PASSED] reflect-y
[09:37:47] [PASSED] rotate-0
[09:37:47] [PASSED] rotate-90
[09:37:47] [PASSED] rotate-180
[09:37:47] [PASSED] rotate-270
[09:37:47] ============== [PASSED] drm_test_rect_rotate ===============
[09:37:47] ================ drm_test_rect_rotate_inv  =================
[09:37:47] [PASSED] reflect-x
[09:37:47] [PASSED] reflect-y
[09:37:47] [PASSED] rotate-0
[09:37:47] [PASSED] rotate-90
[09:37:47] [PASSED] rotate-180
[09:37:47] [PASSED] rotate-270
[09:37:47] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:37:47] ==================== [PASSED] drm_rect =====================
[09:37:47] ============================================================
[09:37:47] Testing complete. Ran 602 tests: passed: 602
[09:37:47] Elapsed time: 22.556s total, 1.690s configuring, 20.697s building, 0.135s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[09:37:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:37:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[09:37:57] Starting KUnit Kernel (1/1)...
[09:37:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:37:57] ================= ttm_device (5 subtests) ==================
[09:37:57] [PASSED] ttm_device_init_basic
[09:37:57] [PASSED] ttm_device_init_multiple
[09:37:57] [PASSED] ttm_device_fini_basic
[09:37:57] [PASSED] ttm_device_init_no_vma_man
[09:37:57] ================== ttm_device_init_pools  ==================
[09:37:57] [PASSED] No DMA allocations, no DMA32 required
[09:37:57] [PASSED] DMA allocations, DMA32 required
[09:37:57] [PASSED] No DMA allocations, DMA32 required
[09:37:57] [PASSED] DMA allocations, no DMA32 required
[09:37:57] ============== [PASSED] ttm_device_init_pools ==============
[09:37:57] =================== [PASSED] ttm_device ====================
[09:37:57] ================== ttm_pool (8 subtests) ===================
[09:37:57] ================== ttm_pool_alloc_basic  ===================
[09:37:57] [PASSED] One page
[09:37:57] [PASSED] More than one page
[09:37:57] [PASSED] Above the allocation limit
[09:37:57] [PASSED] One page, with coherent DMA mappings enabled
[09:37:57] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:37:57] ============== [PASSED] ttm_pool_alloc_basic ===============
[09:37:57] ============== ttm_pool_alloc_basic_dma_addr  ==============
[09:37:57] [PASSED] One page
[09:37:57] [PASSED] More than one page
[09:37:57] [PASSED] Above the allocation limit
[09:37:57] [PASSED] One page, with coherent DMA mappings enabled
[09:37:57] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:37:57] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[09:37:57] [PASSED] ttm_pool_alloc_order_caching_match
[09:37:57] [PASSED] ttm_pool_alloc_caching_mismatch
[09:37:57] [PASSED] ttm_pool_alloc_order_mismatch
[09:37:57] [PASSED] ttm_pool_free_dma_alloc
[09:37:57] [PASSED] ttm_pool_free_no_dma_alloc
[09:37:57] [PASSED] ttm_pool_fini_basic
[09:37:57] ==================== [PASSED] ttm_pool =====================
[09:37:57] ================ ttm_resource (8 subtests) =================
[09:37:57] ================= ttm_resource_init_basic  =================
[09:37:57] [PASSED] Init resource in TTM_PL_SYSTEM
[09:37:57] [PASSED] Init resource in TTM_PL_VRAM
[09:37:57] [PASSED] Init resource in a private placement
[09:37:57] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[09:37:57] ============= [PASSED] ttm_resource_init_basic =============
[09:37:57] [PASSED] ttm_resource_init_pinned
[09:37:57] [PASSED] ttm_resource_fini_basic
[09:37:57] [PASSED] ttm_resource_manager_init_basic
[09:37:57] [PASSED] ttm_resource_manager_usage_basic
[09:37:57] [PASSED] ttm_resource_manager_set_used_basic
[09:37:57] [PASSED] ttm_sys_man_alloc_basic
[09:37:57] [PASSED] ttm_sys_man_free_basic
[09:37:57] ================== [PASSED] ttm_resource ===================
[09:37:57] =================== ttm_tt (15 subtests) ===================
[09:37:57] ==================== ttm_tt_init_basic  ====================
[09:37:57] [PASSED] Page-aligned size
[09:37:57] [PASSED] Extra pages requested
[09:37:57] ================ [PASSED] ttm_tt_init_basic ================
[09:37:57] [PASSED] ttm_tt_init_misaligned
[09:37:57] [PASSED] ttm_tt_fini_basic
[09:37:57] [PASSED] ttm_tt_fini_sg
[09:37:57] [PASSED] ttm_tt_fini_shmem
[09:37:57] [PASSED] ttm_tt_create_basic
[09:37:57] [PASSED] ttm_tt_create_invalid_bo_type
[09:37:57] [PASSED] ttm_tt_create_ttm_exists
[09:37:57] [PASSED] ttm_tt_create_failed
[09:37:57] [PASSED] ttm_tt_destroy_basic
[09:37:57] [PASSED] ttm_tt_populate_null_ttm
[09:37:57] [PASSED] ttm_tt_populate_populated_ttm
[09:37:57] [PASSED] ttm_tt_unpopulate_basic
[09:37:57] [PASSED] ttm_tt_unpopulate_empty_ttm
[09:37:57] [PASSED] ttm_tt_swapin_basic
[09:37:57] ===================== [PASSED] ttm_tt ======================
[09:37:57] =================== ttm_bo (14 subtests) ===================
[09:37:57] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[09:37:57] [PASSED] Cannot be interrupted and sleeps
[09:37:57] [PASSED] Cannot be interrupted, locks straight away
[09:37:57] [PASSED] Can be interrupted, sleeps
[09:37:57] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[09:37:57] [PASSED] ttm_bo_reserve_locked_no_sleep
[09:37:57] [PASSED] ttm_bo_reserve_no_wait_ticket
[09:37:57] [PASSED] ttm_bo_reserve_double_resv
[09:37:57] [PASSED] ttm_bo_reserve_interrupted
[09:37:57] [PASSED] ttm_bo_reserve_deadlock
[09:37:57] [PASSED] ttm_bo_unreserve_basic
[09:37:57] [PASSED] ttm_bo_unreserve_pinned
[09:37:57] [PASSED] ttm_bo_unreserve_bulk
[09:37:57] [PASSED] ttm_bo_put_basic
[09:37:57] [PASSED] ttm_bo_put_shared_resv
[09:37:57] [PASSED] ttm_bo_pin_basic
[09:37:57] [PASSED] ttm_bo_pin_unpin_resource
[09:37:57] [PASSED] ttm_bo_multiple_pin_one_unpin
[09:37:57] ===================== [PASSED] ttm_bo ======================
[09:37:57] ============== ttm_bo_validate (22 subtests) ===============
[09:37:57] ============== ttm_bo_init_reserved_sys_man  ===============
[09:37:57] [PASSED] Buffer object for userspace
[09:37:57] [PASSED] Kernel buffer object
[09:37:57] [PASSED] Shared buffer object
[09:37:57] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[09:37:57] ============== ttm_bo_init_reserved_mock_man  ==============
[09:37:57] [PASSED] Buffer object for userspace
[09:37:57] [PASSED] Kernel buffer object
[09:37:57] [PASSED] Shared buffer object
[09:37:57] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[09:37:57] [PASSED] ttm_bo_init_reserved_resv
[09:37:57] ================== ttm_bo_validate_basic  ==================
[09:37:57] [PASSED] Buffer object for userspace
[09:37:57] [PASSED] Kernel buffer object
[09:37:57] [PASSED] Shared buffer object
[09:37:57] ============== [PASSED] ttm_bo_validate_basic ==============
[09:37:57] [PASSED] ttm_bo_validate_invalid_placement
[09:37:57] ============= ttm_bo_validate_same_placement  ==============
[09:37:57] [PASSED] System manager
[09:37:57] [PASSED] VRAM manager
[09:37:57] ========= [PASSED] ttm_bo_validate_same_placement ==========
[09:37:57] [PASSED] ttm_bo_validate_failed_alloc
[09:37:57] [PASSED] ttm_bo_validate_pinned
[09:37:57] [PASSED] ttm_bo_validate_busy_placement
[09:37:57] ================ ttm_bo_validate_multihop  =================
[09:37:57] [PASSED] Buffer object for userspace
[09:37:57] [PASSED] Kernel buffer object
[09:37:57] [PASSED] Shared buffer object
[09:37:57] ============ [PASSED] ttm_bo_validate_multihop =============
[09:37:57] ========== ttm_bo_validate_no_placement_signaled  ==========
[09:37:57] [PASSED] Buffer object in system domain, no page vector
[09:37:57] [PASSED] Buffer object in system domain with an existing page vector
[09:37:57] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[09:37:57] ======== ttm_bo_validate_no_placement_not_signaled  ========
[09:37:57] [PASSED] Buffer object for userspace
[09:37:57] [PASSED] Kernel buffer object
[09:37:57] [PASSED] Shared buffer object
[09:37:57] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[09:37:57] [PASSED] ttm_bo_validate_move_fence_signaled
[09:37:57] ========= ttm_bo_validate_move_fence_not_signaled  =========
[09:37:57] [PASSED] Waits for GPU
[09:37:57] [PASSED] Tries to lock straight away
[09:37:57] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[09:37:57] [PASSED] ttm_bo_validate_swapout
[09:37:57] [PASSED] ttm_bo_validate_happy_evict
[09:37:57] [PASSED] ttm_bo_validate_all_pinned_evict
[09:37:57] [PASSED] ttm_bo_validate_allowed_only_evict
[09:37:57] [PASSED] ttm_bo_validate_deleted_evict
[09:37:57] [PASSED] ttm_bo_validate_busy_domain_evict
[09:37:57] [PASSED] ttm_bo_validate_evict_gutting
[09:37:57] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[09:37:57] ================= [PASSED] ttm_bo_validate =================
[09:37:57] ============================================================
[09:37:57] Testing complete. Ran 102 tests: passed: 102
[09:37:57] Elapsed time: 9.983s total, 1.709s configuring, 7.658s building, 0.523s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


