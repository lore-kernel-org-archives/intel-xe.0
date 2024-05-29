Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DAAC27C50
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 09:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A5D1133B0;
	Wed, 29 May 2024 09:21:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA9A11364C;
 Wed, 29 May 2024 09:21:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/client=3A_Check_return_?=
 =?utf-8?q?value_of_xe=5Fforce=5Fwake=5Fget_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 09:21:35 -0000
Message-ID: <171697449588.2232183.14294291038247648088@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528101132.14788-1-nirmoy.das@intel.com>
In-Reply-To: <20240528101132.14788-1-nirmoy.das@intel.com>
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

Series: drm/xe/client: Check return value of xe_force_wake_get (rev2)
URL   : https://patchwork.freedesktop.org/series/134121/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:20:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:20:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
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

[09:21:09] Starting KUnit Kernel (1/1)...
[09:21:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:21:10] =================== guc_dbm (7 subtests) ===================
[09:21:10] [PASSED] test_empty
[09:21:10] [PASSED] test_default
[09:21:10] ======================== test_size  ========================
[09:21:10] [PASSED] 4
[09:21:10] [PASSED] 8
[09:21:10] [PASSED] 32
[09:21:10] [PASSED] 256
[09:21:10] ==================== [PASSED] test_size ====================
[09:21:10] ======================= test_reuse  ========================
[09:21:10] [PASSED] 4
[09:21:10] [PASSED] 8
[09:21:10] [PASSED] 32
[09:21:10] [PASSED] 256
[09:21:10] =================== [PASSED] test_reuse ====================
[09:21:10] =================== test_range_overlap  ====================
[09:21:10] [PASSED] 4
[09:21:10] [PASSED] 8
[09:21:10] [PASSED] 32
[09:21:10] [PASSED] 256
[09:21:10] =============== [PASSED] test_range_overlap ================
[09:21:10] =================== test_range_compact  ====================
[09:21:10] [PASSED] 4
[09:21:10] [PASSED] 8
[09:21:10] [PASSED] 32
[09:21:10] [PASSED] 256
[09:21:10] =============== [PASSED] test_range_compact ================
[09:21:10] ==================== test_range_spare  =====================
[09:21:10] [PASSED] 4
[09:21:10] [PASSED] 8
[09:21:10] [PASSED] 32
[09:21:10] [PASSED] 256
[09:21:10] ================ [PASSED] test_range_spare =================
[09:21:10] ===================== [PASSED] guc_dbm =====================
[09:21:10] =================== guc_idm (6 subtests) ===================
[09:21:10] [PASSED] bad_init
[09:21:10] [PASSED] no_init
[09:21:10] [PASSED] init_fini
[09:21:10] [PASSED] check_used
[09:21:10] [PASSED] check_quota
[09:21:10] [PASSED] check_all
[09:21:10] ===================== [PASSED] guc_idm =====================
[09:21:10] ================== no_relay (3 subtests) ===================
[09:21:10] [PASSED] xe_drops_guc2pf_if_not_ready
[09:21:10] [PASSED] xe_drops_guc2vf_if_not_ready
[09:21:10] [PASSED] xe_rejects_send_if_not_ready
[09:21:10] ==================== [PASSED] no_relay =====================
[09:21:10] ================== pf_relay (14 subtests) ==================
[09:21:10] [PASSED] pf_rejects_guc2pf_too_short
[09:21:10] [PASSED] pf_rejects_guc2pf_too_long
[09:21:10] [PASSED] pf_rejects_guc2pf_no_payload
[09:21:10] [PASSED] pf_fails_no_payload
[09:21:10] [PASSED] pf_fails_bad_origin
[09:21:10] [PASSED] pf_fails_bad_type
[09:21:10] [PASSED] pf_txn_reports_error
[09:21:10] [PASSED] pf_txn_sends_pf2guc
[09:21:10] [PASSED] pf_sends_pf2guc
[09:21:10] [SKIPPED] pf_loopback_nop
[09:21:10] [SKIPPED] pf_loopback_echo
[09:21:10] [SKIPPED] pf_loopback_fail
[09:21:10] [SKIPPED] pf_loopback_busy
[09:21:10] [SKIPPED] pf_loopback_retry
[09:21:10] ==================== [PASSED] pf_relay =====================
[09:21:10] ================== vf_relay (3 subtests) ===================
[09:21:10] [PASSED] vf_rejects_guc2vf_too_short
[09:21:10] [PASSED] vf_rejects_guc2vf_too_long
[09:21:10] [PASSED] vf_rejects_guc2vf_no_payload
[09:21:10] ==================== [PASSED] vf_relay =====================
[09:21:10] ================= pf_service (11 subtests) =================
[09:21:10] [PASSED] pf_negotiate_any
[09:21:10] [PASSED] pf_negotiate_base_match
[09:21:10] [PASSED] pf_negotiate_base_newer
[09:21:10] [PASSED] pf_negotiate_base_next
[09:21:10] [SKIPPED] pf_negotiate_base_older
[09:21:10] [PASSED] pf_negotiate_base_prev
[09:21:10] [PASSED] pf_negotiate_latest_match
[09:21:10] [PASSED] pf_negotiate_latest_newer
[09:21:10] [PASSED] pf_negotiate_latest_next
[09:21:10] [SKIPPED] pf_negotiate_latest_older
[09:21:10] [SKIPPED] pf_negotiate_latest_prev
[09:21:10] =================== [PASSED] pf_service ====================
[09:21:10] ===================== lmtt (1 subtest) =====================
[09:21:10] ======================== test_ops  =========================
[09:21:10] [PASSED] 2-level
[09:21:10] [PASSED] multi-level
[09:21:10] ==================== [PASSED] test_ops =====================
[09:21:10] ====================== [PASSED] lmtt =======================
[09:21:10] ==================== xe_bo (2 subtests) ====================
[09:21:10] [SKIPPED] xe_ccs_migrate_kunit
[09:21:10] [SKIPPED] xe_bo_evict_kunit
[09:21:10] ===================== [SKIPPED] xe_bo ======================
[09:21:10] ================== xe_dma_buf (1 subtest) ==================
[09:21:10] [SKIPPED] xe_dma_buf_kunit
[09:21:10] =================== [SKIPPED] xe_dma_buf ===================
[09:21:10] ================== xe_migrate (1 subtest) ==================
[09:21:10] [SKIPPED] xe_migrate_sanity_kunit
[09:21:10] =================== [SKIPPED] xe_migrate ===================
[09:21:10] =================== xe_mocs (2 subtests) ===================
[09:21:10] [SKIPPED] xe_live_mocs_kernel_kunit
[09:21:10] [SKIPPED] xe_live_mocs_reset_kunit
[09:21:10] ==================== [SKIPPED] xe_mocs =====================
[09:21:10] ==================== args (11 subtests) ====================
[09:21:10] [PASSED] count_args_test
[09:21:10] [PASSED] call_args_example
[09:21:10] [PASSED] call_args_test
[09:21:10] [PASSED] drop_first_arg_example
[09:21:10] [PASSED] drop_first_arg_test
[09:21:10] [PASSED] first_arg_example
[09:21:10] [PASSED] first_arg_test
[09:21:10] [PASSED] last_arg_example
[09:21:10] [PASSED] last_arg_test
[09:21:10] [PASSED] pick_arg_example
[09:21:10] [PASSED] sep_comma_example
[09:21:10] ====================== [PASSED] args =======================
[09:21:10] =================== xe_pci (2 subtests) ====================
[09:21:10] [PASSED] xe_gmdid_graphics_ip
[09:21:10] [PASSED] xe_gmdid_media_ip
[09:21:10] ===================== [PASSED] xe_pci ======================
[09:21:10] ==================== xe_rtp (1 subtest) ====================
[09:21:10] ================== xe_rtp_process_tests  ===================
[09:21:10] [PASSED] coalesce-same-reg
[09:21:10] [PASSED] no-match-no-add
[09:21:10] [PASSED] no-match-no-add-multiple-rules
[09:21:10] [PASSED] two-regs-two-entries
[09:21:10] [PASSED] clr-one-set-other
[09:21:10] [PASSED] set-field
[09:21:10] [PASSED] conflict-duplicate
[09:21:10] [PASSED] conflict-not-disjoint
[09:21:10] [PASSED] conflict-reg-type
[09:21:10] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[09:21:10] ===================== [PASSED] xe_rtp ======================
[09:21:10] ==================== xe_wa (1 subtest) =====================
[09:21:10] ======================== xe_wa_gt  =========================
[09:21:10] [PASSED] TIGERLAKE (B0)
[09:21:10] [PASSED] DG1 (A0)
[09:21:10] [PASSED] DG1 (B0)
[09:21:10] [PASSED] ALDERLAKE_S (A0)
[09:21:10] [PASSED] ALDERLAKE_S (B0)
[09:21:10] [PASSED] ALDERLAKE_S (C0)
[09:21:10] [PASSED] ALDERLAKE_S (D0)
[09:21:10] [PASSED] ALDERLAKE_P (A0)
[09:21:10] [PASSED] ALDERLAKE_P (B0)
[09:21:10] [PASSED] ALDERLAKE_P (C0)
[09:21:10] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:21:10] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:21:10] [PASSED] DG2_G10 (C0)
[09:21:10] [PASSED] DG2_G11 (B1)
[09:21:10] [PASSED] DG2_G12 (A1)
[09:21:10] [PASSED] METEORLAKE (g:A0, m:A0)
[09:21:10] [PASSED] METEORLAKE (g:A0, m:A0)
[09:21:10] [PASSED] METEORLAKE (g:A0, m:A0)
[09:21:10] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:21:10] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:21:10] ==================== [PASSED] xe_wa_gt =====================
[09:21:10] ====================== [PASSED] xe_wa ======================
[09:21:10] ============================================================
[09:21:10] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[09:21:10] Elapsed time: 30.779s total, 4.203s configuring, 26.304s building, 0.221s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
ERROR:root:
WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
  Selected by [y]:
  - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
  Selected by [y]:
  - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
  Selected by [y]:
  - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]
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
/usr/bin/ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc':
drm_connector_test.c:(.text+0x570): undefined reference to `drm_hdmi_compute_mode_clock'
/usr/bin/ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc':
drm_connector_test.c:(.text+0x760): undefined reference to `drm_hdmi_compute_mode_clock'
/usr/bin/ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc':
drm_connector_test.c:(.text+0x950): undefined reference to `drm_hdmi_compute_mode_clock'
/usr/bin/ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc':
drm_connector_test.c:(.text+0xb40): undefined reference to `drm_hdmi_compute_mode_clock'
/usr/bin/ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc':
drm_connector_test.c:(.text+0xd30): undefined reference to `drm_hdmi_compute_mode_clock'
/usr/bin/ld: drivers/gpu/drm/tests/drm_connector_test.o:drm_connector_test.c:(.text+0xf26): more undefined references to `drm_hdmi_compute_mode_clock' follow
/usr/bin/ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
drm_hdmi_state_helper.c:(.text+0x9d8): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
/usr/bin/ld: drm_hdmi_state_helper.c:(.text+0x9ea): undefined reference to `drm_hdmi_avi_infoframe_bars'
/usr/bin/ld: drm_hdmi_state_helper.c:(.text+0xa54): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'
collect2: error: ld returned 1 exit status
make[3]: *** [../scripts/Makefile.vmlinux:34: vmlinux] Error 1
make[2]: *** [/kernel/Makefile:1171: vmlinux] Error 2
make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

[09:21:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:21:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


