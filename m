Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9B7C02185
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 05:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5210EA4A;
	Fri, 17 Jan 2025 05:05:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2710EA4A;
 Fri, 17 Jan 2025 05:05:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/hdcp=3A_Use_correct_f?=
 =?utf-8?q?unction_to_check_if_encoder_is_HDMI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 05:05:21 -0000
Message-ID: <173709032188.576735.6150149055173035641@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117041247.1084381-1-suraj.kandpal@intel.com>
In-Reply-To: <20250117041247.1084381-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Use correct function to check if encoder is HDMI (rev3)
URL   : https://patchwork.freedesktop.org/series/143580/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[05:04:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:04:15] Building KUnit Kernel ...
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

[05:04:44] Starting KUnit Kernel (1/1)...
[05:04:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:04:44] =================== guc_dbm (7 subtests) ===================
[05:04:44] [PASSED] test_empty
[05:04:44] [PASSED] test_default
[05:04:44] ======================== test_size  ========================
[05:04:44] [PASSED] 4
[05:04:44] [PASSED] 8
[05:04:44] [PASSED] 32
[05:04:44] [PASSED] 256
[05:04:44] ==================== [PASSED] test_size ====================
[05:04:44] ======================= test_reuse  ========================
[05:04:44] [PASSED] 4
[05:04:44] [PASSED] 8
[05:04:44] [PASSED] 32
[05:04:44] [PASSED] 256
[05:04:44] =================== [PASSED] test_reuse ====================
[05:04:44] =================== test_range_overlap  ====================
[05:04:44] [PASSED] 4
[05:04:44] [PASSED] 8
[05:04:44] [PASSED] 32
[05:04:44] [PASSED] 256
[05:04:44] =============== [PASSED] test_range_overlap ================
[05:04:44] =================== test_range_compact  ====================
[05:04:44] [PASSED] 4
[05:04:44] [PASSED] 8
[05:04:44] [PASSED] 32
[05:04:44] [PASSED] 256
[05:04:44] =============== [PASSED] test_range_compact ================
[05:04:44] ==================== test_range_spare  =====================
[05:04:44] [PASSED] 4
[05:04:44] [PASSED] 8
[05:04:44] [PASSED] 32
[05:04:44] [PASSED] 256
[05:04:44] ================ [PASSED] test_range_spare =================
[05:04:44] ===================== [PASSED] guc_dbm =====================
[05:04:44] =================== guc_idm (6 subtests) ===================
[05:04:44] [PASSED] bad_init
[05:04:44] [PASSED] no_init
[05:04:44] [PASSED] init_fini
[05:04:44] [PASSED] check_used
[05:04:44] [PASSED] check_quota
[05:04:44] [PASSED] check_all
[05:04:44] ===================== [PASSED] guc_idm =====================
[05:04:44] ================== no_relay (3 subtests) ===================
[05:04:44] [PASSED] xe_drops_guc2pf_if_not_ready
[05:04:44] [PASSED] xe_drops_guc2vf_if_not_ready
[05:04:44] [PASSED] xe_rejects_send_if_not_ready
[05:04:44] ==================== [PASSED] no_relay =====================
[05:04:44] ================== pf_relay (14 subtests) ==================
[05:04:44] [PASSED] pf_rejects_guc2pf_too_short
[05:04:44] [PASSED] pf_rejects_guc2pf_too_long
[05:04:44] [PASSED] pf_rejects_guc2pf_no_payload
[05:04:44] [PASSED] pf_fails_no_payload
[05:04:44] [PASSED] pf_fails_bad_origin
[05:04:44] [PASSED] pf_fails_bad_type
[05:04:44] [PASSED] pf_txn_reports_error
[05:04:44] [PASSED] pf_txn_sends_pf2guc
[05:04:44] [PASSED] pf_sends_pf2guc
[05:04:44] [SKIPPED] pf_loopback_nop
[05:04:44] [SKIPPED] pf_loopback_echo
[05:04:44] [SKIPPED] pf_loopback_fail
[05:04:44] [SKIPPED] pf_loopback_busy
[05:04:44] [SKIPPED] pf_loopback_retry
[05:04:44] ==================== [PASSED] pf_relay =====================
[05:04:44] ================== vf_relay (3 subtests) ===================
[05:04:44] [PASSED] vf_rejects_guc2vf_too_short
[05:04:44] [PASSED] vf_rejects_guc2vf_too_long
[05:04:44] [PASSED] vf_rejects_guc2vf_no_payload
[05:04:44] ==================== [PASSED] vf_relay =====================
[05:04:44] ================= pf_service (11 subtests) =================
[05:04:44] [PASSED] pf_negotiate_any
[05:04:44] [PASSED] pf_negotiate_base_match
[05:04:44] [PASSED] pf_negotiate_base_newer
[05:04:44] [PASSED] pf_negotiate_base_next
[05:04:44] [SKIPPED] pf_negotiate_base_older
[05:04:44] [PASSED] pf_negotiate_base_prev
[05:04:44] [PASSED] pf_negotiate_latest_match
[05:04:44] [PASSED] pf_negotiate_latest_newer
[05:04:44] [PASSED] pf_negotiate_latest_next
[05:04:44] [SKIPPED] pf_negotiate_latest_older
[05:04:44] [SKIPPED] pf_negotiate_latest_prev
[05:04:44] =================== [PASSED] pf_service ====================
[05:04:44] ===================== lmtt (1 subtest) =====================
[05:04:44] ======================== test_ops  =========================
[05:04:44] [PASSED] 2-level
[05:04:44] [PASSED] multi-level
[05:04:44] ==================== [PASSED] test_ops =====================
[05:04:44] ====================== [PASSED] lmtt =======================
[05:04:44] =================== xe_mocs (2 subtests) ===================
[05:04:44] ================ xe_live_mocs_kernel_kunit  ================
[05:04:44] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[05:04:44] ================ xe_live_mocs_reset_kunit  =================
[05:04:44] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[05:04:44] ==================== [SKIPPED] xe_mocs =====================
[05:04:44] ================= xe_migrate (2 subtests) ==================
[05:04:44] ================= xe_migrate_sanity_kunit  =================
[05:04:44] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[05:04:44] ================== xe_validate_ccs_kunit  ==================
[05:04:44] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[05:04:44] =================== [SKIPPED] xe_migrate ===================
[05:04:44] ================== xe_dma_buf (1 subtest) ==================
[05:04:44] ==================== xe_dma_buf_kunit  =====================
[05:04:44] ================ [SKIPPED] xe_dma_buf_kunit ================
[05:04:44] =================== [SKIPPED] xe_dma_buf ===================
[05:04:44] ================= xe_bo_shrink (1 subtest) =================
[05:04:44] =================== xe_bo_shrink_kunit  ====================
[05:04:44] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[05:04:44] ================== [SKIPPED] xe_bo_shrink ==================
[05:04:44] ==================== xe_bo (2 subtests) ====================
[05:04:44] ================== xe_ccs_migrate_kunit  ===================
[05:04:44] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[05:04:44] ==================== xe_bo_evict_kunit  ====================
[05:04:44] =============== [SKIPPED] xe_bo_evict_kunit ================
[05:04:44] ===================== [SKIPPED] xe_bo ======================
[05:04:44] ==================== args (11 subtests) ====================
[05:04:44] [PASSED] count_args_test
[05:04:44] [PASSED] call_args_example
[05:04:44] [PASSED] call_args_test
[05:04:44] [PASSED] drop_first_arg_example
[05:04:44] [PASSED] drop_first_arg_test
[05:04:44] [PASSED] first_arg_example
[05:04:44] [PASSED] first_arg_test
stty: 'standard input': Inappropriate ioctl for device
[05:04:44] [PASSED] last_arg_example
[05:04:44] [PASSED] last_arg_test
[05:04:44] [PASSED] pick_arg_example
[05:04:44] [PASSED] sep_comma_example
[05:04:44] ====================== [PASSED] args =======================
[05:04:44] =================== xe_pci (2 subtests) ====================
[05:04:44] [PASSED] xe_gmdid_graphics_ip
[05:04:44] [PASSED] xe_gmdid_media_ip
[05:04:44] ===================== [PASSED] xe_pci ======================
[05:04:44] =================== xe_rtp (2 subtests) ====================
[05:04:44] =============== xe_rtp_process_to_sr_tests  ================
[05:04:44] [PASSED] coalesce-same-reg
[05:04:44] [PASSED] no-match-no-add
[05:04:44] [PASSED] match-or
[05:04:44] [PASSED] match-or-xfail
[05:04:44] [PASSED] no-match-no-add-multiple-rules
[05:04:44] [PASSED] two-regs-two-entries
[05:04:44] [PASSED] clr-one-set-other
[05:04:44] [PASSED] set-field
[05:04:44] [PASSED] conflict-duplicate
[05:04:44] [PASSED] conflict-not-disjoint
[05:04:44] [PASSED] conflict-reg-type
[05:04:44] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[05:04:44] ================== xe_rtp_process_tests  ===================
[05:04:44] [PASSED] active1
[05:04:44] [PASSED] active2
[05:04:44] [PASSED] active-inactive
[05:04:44] [PASSED] inactive-active
[05:04:44] [PASSED] inactive-1st_or_active-inactive
[05:04:44] [PASSED] inactive-2nd_or_active-inactive
[05:04:44] [PASSED] inactive-last_or_active-inactive
[05:04:44] [PASSED] inactive-no_or_active-inactive
[05:04:44] ============== [PASSED] xe_rtp_process_tests ===============
[05:04:44] ===================== [PASSED] xe_rtp ======================
[05:04:44] ==================== xe_wa (1 subtest) =====================
[05:04:44] ======================== xe_wa_gt  =========================
[05:04:44] [PASSED] TIGERLAKE (B0)
[05:04:44] [PASSED] DG1 (A0)
[05:04:44] [PASSED] DG1 (B0)
[05:04:44] [PASSED] ALDERLAKE_S (A0)
[05:04:44] [PASSED] ALDERLAKE_S (B0)
[05:04:44] [PASSED] ALDERLAKE_S (C0)
[05:04:44] [PASSED] ALDERLAKE_S (D0)
[05:04:44] [PASSED] ALDERLAKE_P (A0)
[05:04:44] [PASSED] ALDERLAKE_P (B0)
[05:04:44] [PASSED] ALDERLAKE_P (C0)
[05:04:44] [PASSED] ALDERLAKE_S_RPLS (D0)
[05:04:44] [PASSED] ALDERLAKE_P_RPLU (E0)
[05:04:44] [PASSED] DG2_G10 (C0)
[05:04:44] [PASSED] DG2_G11 (B1)
[05:04:44] [PASSED] DG2_G12 (A1)
[05:04:44] [PASSED] METEORLAKE (g:A0, m:A0)
[05:04:44] [PASSED] METEORLAKE (g:A0, m:A0)
[05:04:44] [PASSED] METEORLAKE (g:A0, m:A0)
[05:04:44] [PASSED] LUNARLAKE (g:A0, m:A0)
[05:04:44] [PASSED] LUNARLAKE (g:B0, m:A0)
[05:04:44] [PASSED] BATTLEMAGE (g:A0, m:A1)
[05:04:44] ==================== [PASSED] xe_wa_gt =====================
[05:04:44] ====================== [PASSED] xe_wa ======================
[05:04:44] ============================================================
[05:04:44] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[05:04:44] Elapsed time: 33.258s total, 4.439s configuring, 28.552s building, 0.236s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:04:44] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:04:46] Building KUnit Kernel ...
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

[05:05:09] Starting KUnit Kernel (1/1)...
[05:05:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:05:09] =========== drm_validate_clone_mode (2 subtests) ===========
[05:05:09] ============== drm_test_check_in_clone_mode  ===============
[05:05:09] [PASSED] in_clone_mode
[05:05:09] [PASSED] not_in_clone_mode
[05:05:09] ========== [PASSED] drm_test_check_in_clone_mode ===========
[05:05:09] =============== drm_test_check_valid_clones  ===============
[05:05:09] [PASSED] not_in_clone_mode
[05:05:09] [PASSED] valid_clone
[05:05:09] [PASSED] invalid_clone
[05:05:09] =========== [PASSED] drm_test_check_valid_clones ===========
[05:05:09] ============= [PASSED] drm_validate_clone_mode =============
[05:05:09] ============= drm_validate_modeset (1 subtest) =============
[05:05:09] [PASSED] drm_test_check_connector_changed_modeset
[05:05:09] ============== [PASSED] drm_validate_modeset ===============
[05:05:09] ================== drm_buddy (7 subtests) ==================
[05:05:09] [PASSED] drm_test_buddy_alloc_limit
[05:05:09] [PASSED] drm_test_buddy_alloc_optimistic
[05:05:09] [PASSED] drm_test_buddy_alloc_pessimistic
[05:05:09] [PASSED] drm_test_buddy_alloc_pathological
[05:05:09] [PASSED] drm_test_buddy_alloc_contiguous
[05:05:09] [PASSED] drm_test_buddy_alloc_clear
[05:05:09] [PASSED] drm_test_buddy_alloc_range_bias
[05:05:09] ==================== [PASSED] drm_buddy ====================
[05:05:09] ============= drm_cmdline_parser (40 subtests) =============
[05:05:09] [PASSED] drm_test_cmdline_force_d_only
[05:05:09] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:05:09] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:05:09] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:05:09] [PASSED] drm_test_cmdline_force_e_only
[05:05:09] [PASSED] drm_test_cmdline_res
[05:05:09] [PASSED] drm_test_cmdline_res_vesa
[05:05:09] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:05:09] [PASSED] drm_test_cmdline_res_rblank
[05:05:09] [PASSED] drm_test_cmdline_res_bpp
[05:05:09] [PASSED] drm_test_cmdline_res_refresh
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:05:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:05:09] [PASSED] drm_test_cmdline_res_margins_force_on
[05:05:09] [PASSED] drm_test_cmdline_res_vesa_margins
[05:05:09] [PASSED] drm_test_cmdline_name
[05:05:09] [PASSED] drm_test_cmdline_name_bpp
[05:05:09] [PASSED] drm_test_cmdline_name_option
[05:05:09] [PASSED] drm_test_cmdline_name_bpp_option
[05:05:09] [PASSED] drm_test_cmdline_rotate_0
[05:05:09] [PASSED] drm_test_cmdline_rotate_90
[05:05:09] [PASSED] drm_test_cmdline_rotate_180
[05:05:09] [PASSED] drm_test_cmdline_rotate_270
[05:05:09] [PASSED] drm_test_cmdline_hmirror
[05:05:09] [PASSED] drm_test_cmdline_vmirror
[05:05:09] [PASSED] drm_test_cmdline_margin_options
[05:05:09] [PASSED] drm_test_cmdline_multiple_options
[05:05:09] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:05:09] [PASSED] drm_test_cmdline_extra_and_option
[05:05:09] [PASSED] drm_test_cmdline_freestanding_options
[05:05:09] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:05:09] [PASSED] drm_test_cmdline_panel_orientation
[05:05:09] ================ drm_test_cmdline_invalid  =================
[05:05:09] [PASSED] margin_only
[05:05:09] [PASSED] interlace_only
[05:05:09] [PASSED] res_missing_x
[05:05:09] [PASSED] res_missing_y
[05:05:09] [PASSED] res_bad_y
[05:05:09] [PASSED] res_missing_y_bpp
[05:05:09] [PASSED] res_bad_bpp
[05:05:09] [PASSED] res_bad_refresh
[05:05:09] [PASSED] res_bpp_refresh_force_on_off
[05:05:09] [PASSED] res_invalid_mode
[05:05:09] [PASSED] res_bpp_wrong_place_mode
[05:05:09] [PASSED] name_bpp_refresh
[05:05:09] [PASSED] name_refresh
[05:05:09] [PASSED] name_refresh_wrong_mode
[05:05:09] [PASSED] name_refresh_invalid_mode
[05:05:09] [PASSED] rotate_multiple
[05:05:09] [PASSED] rotate_invalid_val
[05:05:09] [PASSED] rotate_truncated
[05:05:09] [PASSED] invalid_option
[05:05:09] [PASSED] invalid_tv_option
[05:05:09] [PASSED] truncated_tv_option
[05:05:09] ============ [PASSED] drm_test_cmdline_invalid =============
[05:05:09] =============== drm_test_cmdline_tv_options  ===============
[05:05:09] [PASSED] NTSC
[05:05:09] [PASSED] NTSC_443
[05:05:09] [PASSED] NTSC_J
[05:05:09] [PASSED] PAL
[05:05:09] [PASSED] PAL_M
[05:05:09] [PASSED] PAL_N
[05:05:09] [PASSED] SECAM
[05:05:09] [PASSED] MONO_525
[05:05:09] [PASSED] MONO_625
[05:05:09] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:05:09] =============== [PASSED] drm_cmdline_parser ================
[05:05:09] ========== drmm_connector_hdmi_init (20 subtests) ==========
[05:05:09] [PASSED] drm_test_connector_hdmi_init_valid
[05:05:09] [PASSED] drm_test_connector_hdmi_init_bpc_8
[05:05:09] [PASSED] drm_test_connector_hdmi_init_bpc_10
[05:05:09] [PASSED] drm_test_connector_hdmi_init_bpc_12
[05:05:09] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[05:05:09] [PASSED] drm_test_connector_hdmi_init_bpc_null
[05:05:09] [PASSED] drm_test_connector_hdmi_init_formats_empty
[05:05:09] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[05:05:09] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[05:05:09] [PASSED] supported_formats=0x9 yuv420_allowed=1
[05:05:09] [PASSED] supported_formats=0x9 yuv420_allowed=0
[05:05:09] [PASSED] supported_formats=0x3 yuv420_allowed=1
[05:05:09] [PASSED] supported_formats=0x3 yuv420_allowed=0
[05:05:09] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[05:05:09] [PASSED] drm_test_connector_hdmi_init_null_ddc
[05:05:09] [PASSED] drm_test_connector_hdmi_init_null_product
[05:05:09] [PASSED] drm_test_connector_hdmi_init_null_vendor
[05:05:09] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[05:05:09] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[05:05:09] [PASSED] drm_test_connector_hdmi_init_product_valid
[05:05:09] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[05:05:09] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[05:05:09] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[05:05:09] ========= drm_test_connector_hdmi_init_type_valid  =========
[05:05:09] [PASSED] HDMI-A
[05:05:09] [PASSED] HDMI-B
[05:05:09] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[05:05:09] ======== drm_test_connector_hdmi_init_type_invalid  ========
[05:05:09] [PASSED] Unknown
[05:05:09] [PASSED] VGA
[05:05:09] [PASSED] DVI-I
[05:05:09] [PASSED] DVI-D
[05:05:09] [PASSED] DVI-A
[05:05:09] [PASSED] Composite
[05:05:09] [PASSED] SVIDEO
[05:05:09] [PASSED] LVDS
[05:05:09] [PASSED] Component
[05:05:09] [PASSED] DIN
[05:05:09] [PASSED] DP
[05:05:09] [PASSED] TV
[05:05:09] [PASSED] eDP
[05:05:09] [PASSED] Virtual
[05:05:09] [PASSED] DSI
[05:05:09] [PASSED] DPI
[05:05:09] [PASSED] Writeback
[05:05:09] [PASSED] SPI
[05:05:09] [PASSED] USB
[05:05:09] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[05:05:09] ============ [PASSED] drmm_connector_hdmi_init =============
[05:05:09] ============= drmm_connector_init (3 subtests) =============
[05:05:09] [PASSED] drm_test_drmm_connector_init
[05:05:09] [PASSED] drm_test_drmm_connector_init_null_ddc
[05:05:09] ========= drm_test_drmm_connector_init_type_valid  =========
[05:05:09] [PASSED] Unknown
[05:05:09] [PASSED] VGA
[05:05:09] [PASSED] DVI-I
[05:05:09] [PASSED] DVI-D
[05:05:09] [PASSED] DVI-A
[05:05:09] [PASSED] Composite
[05:05:09] [PASSED] SVIDEO
[05:05:09] [PASSED] LVDS
[05:05:09] [PASSED] Component
[05:05:09] [PASSED] DIN
[05:05:09] [PASSED] DP
[05:05:09] [PASSED] HDMI-A
[05:05:09] [PASSED] HDMI-B
[05:05:09] [PASSED] TV
[05:05:09] [PASSED] eDP
[05:05:09] [PASSED] Virtual
[05:05:09] [PASSED] DSI
[05:05:09] [PASSED] DPI
[05:05:09] [PASSED] Writeback
[05:05:09] [PASSED] SPI
[05:05:09] [PASSED] USB
[05:05:09] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[05:05:09] =============== [PASSED] drmm_connector_init ===============
[05:05:09] ========= drm_connector_dynamic_init (6 subtests) ==========
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_init
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_init_properties
[05:05:09] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[05:05:09] [PASSED] Unknown
[05:05:09] [PASSED] VGA
[05:05:09] [PASSED] DVI-I
[05:05:09] [PASSED] DVI-D
[05:05:09] [PASSED] DVI-A
[05:05:09] [PASSED] Composite
[05:05:09] [PASSED] SVIDEO
[05:05:09] [PASSED] LVDS
[05:05:09] [PASSED] Component
[05:05:09] [PASSED] DIN
[05:05:09] [PASSED] DP
[05:05:09] [PASSED] HDMI-A
[05:05:09] [PASSED] HDMI-B
[05:05:09] [PASSED] TV
[05:05:09] [PASSED] eDP
[05:05:09] [PASSED] Virtual
[05:05:09] [PASSED] DSI
[05:05:09] [PASSED] DPI
[05:05:09] [PASSED] Writeback
[05:05:09] [PASSED] SPI
[05:05:09] [PASSED] USB
[05:05:09] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[05:05:09] ======== drm_test_drm_connector_dynamic_init_name  =========
[05:05:09] [PASSED] Unknown
[05:05:09] [PASSED] VGA
[05:05:09] [PASSED] DVI-I
[05:05:09] [PASSED] DVI-D
[05:05:09] [PASSED] DVI-A
[05:05:09] [PASSED] Composite
[05:05:09] [PASSED] SVIDEO
[05:05:09] [PASSED] LVDS
[05:05:09] [PASSED] Component
[05:05:09] [PASSED] DIN
[05:05:09] [PASSED] DP
[05:05:09] [PASSED] HDMI-A
[05:05:09] [PASSED] HDMI-B
[05:05:09] [PASSED] TV
[05:05:09] [PASSED] eDP
[05:05:09] [PASSED] Virtual
[05:05:09] [PASSED] DSI
[05:05:09] [PASSED] DPI
[05:05:09] [PASSED] Writeback
[05:05:09] [PASSED] SPI
[05:05:09] [PASSED] USB
[05:05:09] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[05:05:09] =========== [PASSED] drm_connector_dynamic_init ============
[05:05:09] ==== drm_connector_dynamic_register_early (4 subtests) =====
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[05:05:09] ====== [PASSED] drm_connector_dynamic_register_early =======
[05:05:09] ======= drm_connector_dynamic_register (7 subtests) ========
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[05:05:09] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[05:05:09] ========= [PASSED] drm_connector_dynamic_register ==========
[05:05:09] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[05:05:09] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[05:05:09] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[05:05:09] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[05:05:09] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:05:09] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:05:09] [PASSED] NTSC
[05:05:09] [PASSED] NTSC-443
[05:05:09] [PASSED] NTSC-J
[05:05:09] [PASSED] PAL
[05:05:09] [PASSED] PAL-M
[05:05:09] [PASSED] PAL-N
[05:05:09] [PASSED] SECAM
[05:05:09] [PASSED] Mono
[05:05:09] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:05:09] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:05:09] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:05:09] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[05:05:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[05:05:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[05:05:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[05:05:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[05:05:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[05:05:09] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[05:05:09] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[05:05:09] [PASSED] VIC 96
[05:05:09] [PASSED] VIC 97
[05:05:09] [PASSED] VIC 101
[05:05:09] [PASSED] VIC 102
[05:05:09] [PASSED] VIC 106
[05:05:09] [PASSED] VIC 107
[05:05:09] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[05:05:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[05:05:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[05:05:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[05:05:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[05:05:09] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[05:05:09] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[05:05:09] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[05:05:09] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[05:05:09] [PASSED] Automatic
[05:05:09] [PASSED] Full
[05:05:09] [PASSED] Limited 16:235
[05:05:09] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[05:05:09] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[05:05:09] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[05:05:09] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[05:05:09] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[05:05:09] [PASSED] RGB
[05:05:09] [PASSED] YUV 4:2:0
[05:05:09] [PASSED] YUV 4:2:2
[05:05:09] [PASSED] YUV 4:4:4
[05:05:09] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[05:05:09] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[05:05:09] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[05:05:09] ============= drm_damage_helper (21 subtests) ==============
[05:05:09] [PASSED] drm_test_damage_iter_no_damage
[05:05:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:05:09] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:05:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:05:09] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:05:09] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:05:09] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:05:09] [PASSED] drm_test_damage_iter_simple_damage
[05:05:09] [PASSED] drm_test_damage_iter_single_damage
[05:05:09] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:05:09] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:05:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:05:09] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:05:09] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:05:09] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:05:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:05:09] [PASSED] drm_test_damage_iter_damage
[05:05:09] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:05:09] [PASSED] drm_test_damage_iter_damage_one_outside
[05:05:09] [PASSED] drm_test_damage_iter_damage_src_moved
[05:05:09] [PASSED] drm_test_damage_iter_damage_not_visible
[05:05:09] ================ [PASSED] drm_damage_helper ================
[05:05:09] ============== drm_dp_mst_helper (3 subtests) ==============
[05:05:09] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:05:09] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:05:09] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:05:09] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:05:09] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:05:09] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:05:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:05:09] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:05:09] [PASSED] Link rate 2000000 lane count 4
[05:05:09] [PASSED] Link rate 2000000 lane count 2
[05:05:09] [PASSED] Link rate 2000000 lane count 1
[05:05:09] [PASSED] Link rate 1350000 lane count 4
[05:05:09] [PASSED] Link rate 1350000 lane count 2
[05:05:09] [PASSED] Link rate 1350000 lane count 1
[05:05:09] [PASSED] Link rate 1000000 lane count 4
[05:05:09] [PASSED] Link rate 1000000 lane count 2
[05:05:09] [PASSED] Link rate 1000000 lane count 1
[05:05:09] [PASSED] Link rate 810000 lane count 4
[05:05:09] [PASSED] Link rate 810000 lane count 2
[05:05:09] [PASSED] Link rate 810000 lane count 1
[05:05:09] [PASSED] Link rate 540000 lane count 4
[05:05:09] [PASSED] Link rate 540000 lane count 2
[05:05:09] [PASSED] Link rate 540000 lane count 1
[05:05:09] [PASSED] Link rate 270000 lane count 4
[05:05:09] [PASSED] Link rate 270000 lane count 2
[05:05:09] [PASSED] Link rate 270000 lane count 1
[05:05:09] [PASSED] Link rate 162000 lane count 4
[05:05:09] [PASSED] Link rate 162000 lane count 2
[05:05:09] [PASSED] Link rate 162000 lane count 1
[05:05:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:05:09] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:05:09] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:05:09] [PASSED] DP_POWER_UP_PHY with port number
[05:05:09] [PASSED] DP_POWER_DOWN_PHY with port number
[05:05:09] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:05:09] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:05:09] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:05:09] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:05:09] [PASSED] DP_QUERY_PAYLOAD with port number
[05:05:09] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:05:09] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:05:09] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:05:09] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:05:09] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:05:09] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:05:09] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:05:09] [PASSED] DP_REMOTE_I2C_READ with port number
[05:05:09] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:05:09] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:05:09] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:05:09] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:05:09] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:05:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:05:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:05:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:05:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:05:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:05:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:05:09] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:05:09] ================ [PASSED] drm_dp_mst_helper ================
[05:05:09] ================== drm_exec (7 subtests) ===================
[05:05:09] [PASSED] sanitycheck
[05:05:09] [PASSED] test_lock
[05:05:09] [PASSED] test_lock_unlock
[05:05:09] [PASSED] test_duplicates
[05:05:09] [PASSED] test_prepare
[05:05:09] [PASSED] test_prepare_array
[05:05:09] [PASSED] test_multiple_loops
[05:05:09] ==================== [PASSED] drm_exec =====================
[05:05:09] =========== drm_format_helper_test (17 subtests) ===========
[05:05:09] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:05:09] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:05:09] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:05:09] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:05:09] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:05:09] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:05:09] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:05:09] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:05:09] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:05:09] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:05:09] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:05:09] ==================== drm_test_fb_swab  =====================
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ================ [PASSED] drm_test_fb_swab =================
[05:05:09] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:05:09] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:05:09] [PASSED] single_pixel_source_buffer
[05:05:09] [PASSED] single_pixel_clip_rectangle
[05:05:09] [PASSED] well_known_colors
[05:05:09] [PASSED] destination_pitch
[05:05:09] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:05:09] ================= drm_test_fb_clip_offset  =================
[05:05:09] [PASSED] pass through
[05:05:09] [PASSED] horizontal offset
[05:05:09] [PASSED] vertical offset
[05:05:09] [PASSED] horizontal and vertical offset
[05:05:09] [PASSED] horizontal offset (custom pitch)
[05:05:09] [PASSED] vertical offset (custom pitch)
[05:05:09] [PASSED] horizontal and vertical offset (custom pitch)
[05:05:09] ============= [PASSED] drm_test_fb_clip_offset =============
[05:05:09] ============== drm_test_fb_build_fourcc_list  ==============
[05:05:09] [PASSED] no native formats
[05:05:09] [PASSED] XRGB8888 as native format
[05:05:09] [PASSED] remove duplicates
[05:05:09] [PASSED] convert alpha formats
[05:05:09] [PASSED] random formats
[05:05:09] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[05:05:09] =================== drm_test_fb_memcpy  ====================
[05:05:09] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:05:09] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:05:09] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:05:09] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:05:09] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:05:09] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:05:09] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:05:09] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:05:09] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:05:09] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:05:09] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:05:09] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:05:09] =============== [PASSED] drm_test_fb_memcpy ================
[05:05:09] ============= [PASSED] drm_format_helper_test ==============
[05:05:09] ================= drm_format (18 subtests) =================
[05:05:09] [PASSED] drm_test_format_block_width_invalid
[05:05:09] [PASSED] drm_test_format_block_width_one_plane
[05:05:09] [PASSED] drm_test_format_block_width_two_plane
[05:05:09] [PASSED] drm_test_format_block_width_three_plane
[05:05:09] [PASSED] drm_test_format_block_width_tiled
[05:05:09] [PASSED] drm_test_format_block_height_invalid
[05:05:09] [PASSED] drm_test_format_block_height_one_plane
[05:05:09] [PASSED] drm_test_format_block_height_two_plane
[05:05:09] [PASSED] drm_test_format_block_height_three_plane
[05:05:09] [PASSED] drm_test_format_block_height_tiled
[05:05:09] [PASSED] drm_test_format_min_pitch_invalid
[05:05:09] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:05:09] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:05:09] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:05:09] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:05:09] [PASSED] drm_test_format_min_pitch_two_plane
[05:05:09] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:05:09] [PASSED] drm_test_format_min_pitch_tiled
[05:05:09] =================== [PASSED] drm_format ====================
[05:05:09] ============== drm_framebuffer (10 subtests) ===============
[05:05:09] ========== drm_test_framebuffer_check_src_coords  ==========
[05:05:09] [PASSED] Success: source fits into fb
[05:05:09] [PASSED] Fail: overflowing fb with x-axis coordinate
[05:05:09] [PASSED] Fail: overflowing fb with y-axis coordinate
[05:05:09] [PASSED] Fail: overflowing fb with source width
[05:05:09] [PASSED] Fail: overflowing fb with source height
[05:05:09] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[05:05:09] [PASSED] drm_test_framebuffer_cleanup
[05:05:09] =============== drm_test_framebuffer_create  ===============
[05:05:09] [PASSED] ABGR8888 normal sizes
[05:05:09] [PASSED] ABGR8888 max sizes
[05:05:09] [PASSED] ABGR8888 pitch greater than min required
[05:05:09] [PASSED] ABGR8888 pitch less than min required
[05:05:09] [PASSED] ABGR8888 Invalid width
[05:05:09] [PASSED] ABGR8888 Invalid buffer handle
[05:05:09] [PASSED] No pixel format
[05:05:09] [PASSED] ABGR8888 Width 0
[05:05:09] [PASSED] ABGR8888 Height 0
[05:05:09] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:05:09] [PASSED] ABGR8888 Large buffer offset
[05:05:09] [PASSED] ABGR8888 Buffer offset for inexistent plane
[05:05:09] [PASSED] ABGR8888 Invalid flag
[05:05:09] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:05:09] [PASSED] ABGR8888 Valid buffer modifier
[05:05:09] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:05:09] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:05:09] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:05:09] [PASSED] NV12 Normal sizes
[05:05:09] [PASSED] NV12 Max sizes
[05:05:09] [PASSED] NV12 Invalid pitch
[05:05:09] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:05:09] [PASSED] NV12 different  modifier per-plane
[05:05:09] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:05:09] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:05:09] [PASSED] NV12 Modifier for inexistent plane
[05:05:09] [PASSED] NV12 Handle for inexistent plane
[05:05:09] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:05:09] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:05:09] [PASSED] YVU420 Normal sizes
[05:05:09] [PASSED] YVU420 Max sizes
[05:05:09] [PASSED] YVU420 Invalid pitch
[05:05:09] [PASSED] YVU420 Different pitches
[05:05:09] [PASSED] YVU420 Different buffer offsets/pitches
[05:05:09] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:05:09] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:05:09] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:05:09] [PASSED] YVU420 Valid modifier
[05:05:09] [PASSED] YVU420 Different modifiers per plane
[05:05:09] [PASSED] YVU420 Modifier for inexistent plane
[05:05:09] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[05:05:09] [PASSED] X0L2 Normal sizes
[05:05:09] [PASSED] X0L2 Max sizes
[05:05:09] [PASSED] X0L2 Invalid pitch
[05:05:09] [PASSED] X0L2 Pitch greater than minimum required
[05:05:09] [PASSED] X0L2 Handle for inexistent plane
[05:05:09] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:05:09] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:05:09] [PASSED] X0L2 Valid modifier
[05:05:09] [PASSED] X0L2 Modifier for inexistent plane
[05:05:09] =========== [PASSED] drm_test_framebuffer_create ===========
[05:05:09] [PASSED] drm_test_framebuffer_free
[05:05:09] [PASSED] drm_test_framebuffer_init
[05:05:09] [PASSED] drm_test_framebuffer_init_bad_format
[05:05:09] [PASSED] drm_test_framebuffer_init_dev_mismatch
[05:05:09] [PASSED] drm_test_framebuffer_lookup
[05:05:09] [PASSED] drm_test_framebuffer_lookup_inexistent
[05:05:09] [PASSED] drm_test_framebuffer_modifiers_not_supported
[05:05:09] ================= [PASSED] drm_framebuffer =================
[05:05:09] ================ drm_gem_shmem (8 subtests) ================
[05:05:09] [PASSED] drm_gem_shmem_test_obj_create
[05:05:09] [PASSED] drm_gem_shmem_test_obj_create_private
[05:05:09] [PASSED] drm_gem_shmem_test_pin_pages
[05:05:09] [PASSED] drm_gem_shmem_test_vmap
[05:05:09] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:05:09] [PASSED] drm_gem_shmem_test_get_sg_table
[05:05:09] [PASSED] drm_gem_shmem_test_madvise
[05:05:09] [PASSED] drm_gem_shmem_test_purge
[05:05:09] ================== [PASSED] drm_gem_shmem ==================
[05:05:09] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[05:05:09] [PASSED] drm_test_check_disable_connector
[05:05:09] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[05:05:09] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[05:05:09] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[05:05:09] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[05:05:09] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[05:05:09] [PASSED] drm_test_check_output_bpc_dvi
[05:05:09] [PASSED] drm_test_check_output_bpc_format_vic_1
[05:05:09] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[05:05:09] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[05:05:09] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[05:05:09] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[05:05:09] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[05:05:09] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[05:05:09] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[05:05:09] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[05:05:09] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[05:05:09] [PASSED] drm_test_check_broadcast_rgb_value
[05:05:09] [PASSED] drm_test_check_bpc_8_value
[05:05:09] [PASSED] drm_test_check_bpc_10_value
[05:05:09] [PASSED] drm_test_check_bpc_12_value
[05:05:09] [PASSED] drm_test_check_format_value
[05:05:09] [PASSED] drm_test_check_tmds_char_value
[05:05:09] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[05:05:09] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[05:05:09] [PASSED] drm_test_check_mode_valid
[05:05:09] [PASSED] drm_test_check_mode_valid_reject
[05:05:09] [PASSED] drm_test_check_mode_valid_reject_rate
[05:05:09] [PASSED] drm_test_check_mode_valid_reject_max_clock
[05:05:09] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[05:05:09] ================= drm_managed (2 subtests) =================
[05:05:09] [PASSED] drm_test_managed_release_action
[05:05:09] [PASSED] drm_test_managed_run_action
[05:05:09] =================== [PASSED] drm_managed ===================
[05:05:09] =================== drm_mm (6 subtests) ====================
[05:05:09] [PASSED] drm_test_mm_init
[05:05:09] [PASSED] drm_test_mm_debug
[05:05:09] [PASSED] drm_test_mm_align32
[05:05:09] [PASSED] drm_test_mm_align64
[05:05:09] [PASSED] drm_test_mm_lowest
[05:05:09] [PASSED] drm_test_mm_highest
[05:05:09] ===================== [PASSED] drm_mm ======================
[05:05:09] ============= drm_modes_analog_tv (5 subtests) =============
[05:05:09] [PASSED] drm_test_modes_analog_tv_mono_576i
[05:05:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:05:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:05:09] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:05:09] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:05:09] =============== [PASSED] drm_modes_analog_tv ===============
[05:05:09] ============== drm_plane_helper (2 subtests) ===============
[05:05:09] =============== drm_test_check_plane_state  ================
[05:05:09] [PASSED] clipping_simple
[05:05:09] [PASSED] clipping_rotate_reflect
[05:05:09] [PASSED] positioning_simple
[05:05:09] [PASSED] upscaling
[05:05:09] [PASSED] downscaling
[05:05:09] [PASSED] rounding1
[05:05:09] [PASSED] rounding2
[05:05:09] [PASSED] rounding3
[05:05:09] [PASSED] rounding4
[05:05:09] =========== [PASSED] drm_test_check_plane_state ============
[05:05:09] =========== drm_test_check_invalid_plane_state  ============
[05:05:09] [PASSED] positioning_invalid
[05:05:09] [PASSED] upscaling_invalid
[05:05:09] [PASSED] downscaling_invalid
[05:05:09] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:05:09] ================ [PASSED] drm_plane_helper =================
[05:05:09] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:05:09] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:05:09] [PASSED] None
[05:05:09] [PASSED] PAL
[05:05:09] [PASSED] NTSC
[05:05:09] [PASSED] Both, NTSC Default
[05:05:09] [PASSED] Both, PAL Default
[05:05:09] [PASSED] Both, NTSC Default, with PAL on command-line
[05:05:09] [PASSED] Both, PAL Default, with NTSC on command-line
[05:05:09] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:05:09] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:05:09] ================== drm_rect (9 subtests) ===================
[05:05:09] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:05:09] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:05:09] [PASSED] drm_test_rect_clip_scaled_clipped
[05:05:09] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:05:09] ================= drm_test_rect_intersect  =================
[05:05:09] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:05:09] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:05:09] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:05:09] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:05:09] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:05:09] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:05:09] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:05:09] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:05:09] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:05:09] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:05:09] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:05:09] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:05:09] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:05:09] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:05:09] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:05:09] ============= [PASSED] drm_test_rect_intersect =============
[05:05:09] ================ drm_test_rect_calc_hscale  ================
[05:05:09] [PASSED] normal use
[05:05:09] [PASSED] out of max range
[05:05:09] [PASSED] out of min range
[05:05:09] [PASSED] zero dst
[05:05:09] [PASSED] negative src
[05:05:09] [PASSED] negative dst
[05:05:09] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:05:09] ================ drm_test_rect_calc_vscale  ================
[05:05:09] [PASSED] normal use
[05:05:09] [PASSED] out of max range
[05:05:09] [PASSED] out of min range
[05:05:09] [PASSED] zero dst
[05:05:09] [PASSED] negative src
[05:05:09] [PASSED] negative dst
[05:05:09] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:05:09] ================== drm_test_rect_rotate  ===================
[05:05:09] [PASSED] reflect-x
[05:05:09] [PASSED] reflect-y
[05:05:09] [PASSED] rotate-0
[05:05:09] [PASSED] rotate-90
[05:05:09] [PASSED] rotate-180
[05:05:09] [PASSED] rotate-270
stty: 'standard input': Inappropriate ioctl for device
[05:05:09] ============== [PASSED] drm_test_rect_rotate ===============
[05:05:09] ================ drm_test_rect_rotate_inv  =================
[05:05:09] [PASSED] reflect-x
[05:05:09] [PASSED] reflect-y
[05:05:09] [PASSED] rotate-0
[05:05:09] [PASSED] rotate-90
[05:05:09] [PASSED] rotate-180
[05:05:09] [PASSED] rotate-270
[05:05:09] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:05:09] ==================== [PASSED] drm_rect =====================
[05:05:09] ============================================================
[05:05:09] Testing complete. Ran 598 tests: passed: 598
[05:05:09] Elapsed time: 24.777s total, 1.601s configuring, 23.006s building, 0.143s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[05:05:09] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:05:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[05:05:18] Starting KUnit Kernel (1/1)...
[05:05:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:05:18] ================= ttm_device (5 subtests) ==================
[05:05:18] [PASSED] ttm_device_init_basic
[05:05:18] [PASSED] ttm_device_init_multiple
[05:05:18] [PASSED] ttm_device_fini_basic
[05:05:18] [PASSED] ttm_device_init_no_vma_man
[05:05:18] ================== ttm_device_init_pools  ==================
[05:05:18] [PASSED] No DMA allocations, no DMA32 required
[05:05:18] [PASSED] DMA allocations, DMA32 required
[05:05:18] [PASSED] No DMA allocations, DMA32 required
[05:05:18] [PASSED] DMA allocations, no DMA32 required
[05:05:18] ============== [PASSED] ttm_device_init_pools ==============
[05:05:18] =================== [PASSED] ttm_device ====================
[05:05:18] ================== ttm_pool (8 subtests) ===================
[05:05:18] ================== ttm_pool_alloc_basic  ===================
[05:05:18] [PASSED] One page
[05:05:18] [PASSED] More than one page
[05:05:18] [PASSED] Above the allocation limit
[05:05:18] [PASSED] One page, with coherent DMA mappings enabled
[05:05:18] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:05:18] ============== [PASSED] ttm_pool_alloc_basic ===============
[05:05:18] ============== ttm_pool_alloc_basic_dma_addr  ==============
[05:05:18] [PASSED] One page
[05:05:18] [PASSED] More than one page
[05:05:18] [PASSED] Above the allocation limit
[05:05:18] [PASSED] One page, with coherent DMA mappings enabled
[05:05:18] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:05:18] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[05:05:18] [PASSED] ttm_pool_alloc_order_caching_match
[05:05:18] [PASSED] ttm_pool_alloc_caching_mismatch
[05:05:18] [PASSED] ttm_pool_alloc_order_mismatch
[05:05:18] [PASSED] ttm_pool_free_dma_alloc
[05:05:18] [PASSED] ttm_pool_free_no_dma_alloc
[05:05:18] [PASSED] ttm_pool_fini_basic
[05:05:18] ==================== [PASSED] ttm_pool =====================
[05:05:18] ================ ttm_resource (8 subtests) =================
[05:05:18] ================= ttm_resource_init_basic  =================
[05:05:18] [PASSED] Init resource in TTM_PL_SYSTEM
[05:05:18] [PASSED] Init resource in TTM_PL_VRAM
[05:05:18] [PASSED] Init resource in a private placement
[05:05:18] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[05:05:18] ============= [PASSED] ttm_resource_init_basic =============
[05:05:18] [PASSED] ttm_resource_init_pinned
[05:05:18] [PASSED] ttm_resource_fini_basic
[05:05:18] [PASSED] ttm_resource_manager_init_basic
[05:05:18] [PASSED] ttm_resource_manager_usage_basic
[05:05:18] [PASSED] ttm_resource_manager_set_used_basic
[05:05:18] [PASSED] ttm_sys_man_alloc_basic
[05:05:18] [PASSED] ttm_sys_man_free_basic
[05:05:18] ================== [PASSED] ttm_resource ===================
[05:05:18] =================== ttm_tt (15 subtests) ===================
[05:05:18] ==================== ttm_tt_init_basic  ====================
[05:05:18] [PASSED] Page-aligned size
[05:05:18] [PASSED] Extra pages requested
[05:05:18] ================ [PASSED] ttm_tt_init_basic ================
[05:05:18] [PASSED] ttm_tt_init_misaligned
[05:05:18] [PASSED] ttm_tt_fini_basic
[05:05:18] [PASSED] ttm_tt_fini_sg
[05:05:18] [PASSED] ttm_tt_fini_shmem
[05:05:18] [PASSED] ttm_tt_create_basic
[05:05:18] [PASSED] ttm_tt_create_invalid_bo_type
[05:05:18] [PASSED] ttm_tt_create_ttm_exists
[05:05:18] [PASSED] ttm_tt_create_failed
[05:05:18] [PASSED] ttm_tt_destroy_basic
[05:05:18] [PASSED] ttm_tt_populate_null_ttm
[05:05:18] [PASSED] ttm_tt_populate_populated_ttm
[05:05:18] [PASSED] ttm_tt_unpopulate_basic
[05:05:18] [PASSED] ttm_tt_unpopulate_empty_ttm
[05:05:18] [PASSED] ttm_tt_swapin_basic
[05:05:18] ===================== [PASSED] ttm_tt ======================
[05:05:18] =================== ttm_bo (14 subtests) ===================
[05:05:18] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[05:05:18] [PASSED] Cannot be interrupted and sleeps
[05:05:18] [PASSED] Cannot be interrupted, locks straight away
[05:05:18] [PASSED] Can be interrupted, sleeps
[05:05:18] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[05:05:18] [PASSED] ttm_bo_reserve_locked_no_sleep
[05:05:18] [PASSED] ttm_bo_reserve_no_wait_ticket
[05:05:18] [PASSED] ttm_bo_reserve_double_resv
[05:05:18] [PASSED] ttm_bo_reserve_interrupted
[05:05:18] [PASSED] ttm_bo_reserve_deadlock
[05:05:18] [PASSED] ttm_bo_unreserve_basic
[05:05:18] [PASSED] ttm_bo_unreserve_pinned
[05:05:18] [PASSED] ttm_bo_unreserve_bulk
[05:05:18] [PASSED] ttm_bo_put_basic
[05:05:18] [PASSED] ttm_bo_put_shared_resv
[05:05:18] [PASSED] ttm_bo_pin_basic
[05:05:18] [PASSED] ttm_bo_pin_unpin_resource
[05:05:18] [PASSED] ttm_bo_multiple_pin_one_unpin
[05:05:18] ===================== [PASSED] ttm_bo ======================
[05:05:18] ============== ttm_bo_validate (22 subtests) ===============
[05:05:18] ============== ttm_bo_init_reserved_sys_man  ===============
[05:05:18] [PASSED] Buffer object for userspace
[05:05:18] [PASSED] Kernel buffer object
[05:05:18] [PASSED] Shared buffer object
[05:05:18] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[05:05:18] ============== ttm_bo_init_reserved_mock_man  ==============
[05:05:18] [PASSED] Buffer object for userspace
[05:05:18] [PASSED] Kernel buffer object
[05:05:18] [PASSED] Shared buffer object
[05:05:18] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[05:05:18] [PASSED] ttm_bo_init_reserved_resv
[05:05:18] ================== ttm_bo_validate_basic  ==================
[05:05:18] [PASSED] Buffer object for userspace
[05:05:18] [PASSED] Kernel buffer object
[05:05:18] [PASSED] Shared buffer object
[05:05:18] ============== [PASSED] ttm_bo_validate_basic ==============
[05:05:18] [PASSED] ttm_bo_validate_invalid_placement
[05:05:18] ============= ttm_bo_validate_same_placement  ==============
[05:05:18] [PASSED] System manager
[05:05:18] [PASSED] VRAM manager
[05:05:18] ========= [PASSED] ttm_bo_validate_same_placement ==========
[05:05:18] [PASSED] ttm_bo_validate_failed_alloc
[05:05:18] [PASSED] ttm_bo_validate_pinned
[05:05:18] [PASSED] ttm_bo_validate_busy_placement
[05:05:18] ================ ttm_bo_validate_multihop  =================
[05:05:18] [PASSED] Buffer object for userspace
[05:05:18] [PASSED] Kernel buffer object
[05:05:18] [PASSED] Shared buffer object
[05:05:18] ============ [PASSED] ttm_bo_validate_multihop =============
[05:05:18] ========== ttm_bo_validate_no_placement_signaled  ==========
[05:05:18] [PASSED] Buffer object in system domain, no page vector
[05:05:18] [PASSED] Buffer object in system domain with an existing page vector
[05:05:18] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[05:05:18] ======== ttm_bo_validate_no_placement_not_signaled  ========
[05:05:18] [PASSED] Buffer object for userspace
[05:05:18] [PASSED] Kernel buffer object
[05:05:18] [PASSED] Shared buffer object
[05:05:18] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[05:05:18] [PASSED] ttm_bo_validate_move_fence_signaled
[05:05:19] ========= ttm_bo_validate_move_fence_not_signaled  =========
[05:05:19] [PASSED] Waits for GPU
[05:05:19] [PASSED] Tries to lock straight away
[05:05:19] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[05:05:19] [PASSED] ttm_bo_validate_swapout
[05:05:19] [PASSED] ttm_bo_validate_happy_evict
[05:05:19] [PASSED] ttm_bo_validate_all_pinned_evict
[05:05:19] [PASSED] ttm_bo_validate_allowed_only_evict
[05:05:19] [PASSED] ttm_bo_validate_deleted_evict
[05:05:19] [PASSED] ttm_bo_validate_busy_domain_evict
[05:05:19] [PASSED] ttm_bo_validate_evict_gutting
[05:05:19] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[05:05:19] ================= [PASSED] ttm_bo_validate =================
[05:05:19] ============================================================
[05:05:19] Testing complete. Ran 102 tests: passed: 102
[05:05:19] Elapsed time: 10.064s total, 1.641s configuring, 7.806s building, 0.517s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


