Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E41C25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 10:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887CF10EF0E;
	Tue, 28 May 2024 10:39:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FB310E13B;
 Tue, 28 May 2024 10:39:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Add_engine_name_to_t?=
 =?utf-8?q?he_engine_reset_and_cat-err_log_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 10:39:47 -0000
Message-ID: <171689278709.2216238.9295749357152337194@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528101445.27688-1-nirmoy.das@intel.com>
In-Reply-To: <20240528101445.27688-1-nirmoy.das@intel.com>
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

Series: drm/xe: Add engine name to the engine reset and cat-err log (rev2)
URL   : https://patchwork.freedesktop.org/series/132907/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[10:38:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:38:55] Building KUnit Kernel ...
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

[10:39:21] Starting KUnit Kernel (1/1)...
[10:39:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:39:22] =================== guc_dbm (7 subtests) ===================
[10:39:22] [PASSED] test_empty
[10:39:22] [PASSED] test_default
[10:39:22] ======================== test_size  ========================
[10:39:22] [PASSED] 4
[10:39:22] [PASSED] 8
[10:39:22] [PASSED] 32
[10:39:22] [PASSED] 256
[10:39:22] ==================== [PASSED] test_size ====================
[10:39:22] ======================= test_reuse  ========================
[10:39:22] [PASSED] 4
[10:39:22] [PASSED] 8
[10:39:22] [PASSED] 32
[10:39:22] [PASSED] 256
[10:39:22] =================== [PASSED] test_reuse ====================
[10:39:22] =================== test_range_overlap  ====================
[10:39:22] [PASSED] 4
[10:39:22] [PASSED] 8
[10:39:22] [PASSED] 32
[10:39:22] [PASSED] 256
[10:39:22] =============== [PASSED] test_range_overlap ================
[10:39:22] =================== test_range_compact  ====================
[10:39:22] [PASSED] 4
[10:39:22] [PASSED] 8
[10:39:22] [PASSED] 32
[10:39:22] [PASSED] 256
[10:39:22] =============== [PASSED] test_range_compact ================
[10:39:22] ==================== test_range_spare  =====================
[10:39:22] [PASSED] 4
[10:39:22] [PASSED] 8
[10:39:22] [PASSED] 32
[10:39:22] [PASSED] 256
[10:39:22] ================ [PASSED] test_range_spare =================
[10:39:22] ===================== [PASSED] guc_dbm =====================
[10:39:22] =================== guc_idm (6 subtests) ===================
[10:39:22] [PASSED] bad_init
[10:39:22] [PASSED] no_init
[10:39:22] [PASSED] init_fini
[10:39:22] [PASSED] check_used
[10:39:22] [PASSED] check_quota
[10:39:22] [PASSED] check_all
[10:39:22] ===================== [PASSED] guc_idm =====================
[10:39:22] ================== no_relay (3 subtests) ===================
[10:39:22] [PASSED] xe_drops_guc2pf_if_not_ready
[10:39:22] [PASSED] xe_drops_guc2vf_if_not_ready
[10:39:22] [PASSED] xe_rejects_send_if_not_ready
[10:39:22] ==================== [PASSED] no_relay =====================
[10:39:22] ================== pf_relay (14 subtests) ==================
[10:39:22] [PASSED] pf_rejects_guc2pf_too_short
[10:39:22] [PASSED] pf_rejects_guc2pf_too_long
[10:39:22] [PASSED] pf_rejects_guc2pf_no_payload
[10:39:22] [PASSED] pf_fails_no_payload
[10:39:22] [PASSED] pf_fails_bad_origin
[10:39:22] [PASSED] pf_fails_bad_type
[10:39:22] [PASSED] pf_txn_reports_error
[10:39:22] [PASSED] pf_txn_sends_pf2guc
[10:39:22] [PASSED] pf_sends_pf2guc
[10:39:22] [SKIPPED] pf_loopback_nop
[10:39:22] [SKIPPED] pf_loopback_echo
[10:39:22] [SKIPPED] pf_loopback_fail
[10:39:22] [SKIPPED] pf_loopback_busy
[10:39:22] [SKIPPED] pf_loopback_retry
[10:39:22] ==================== [PASSED] pf_relay =====================
[10:39:22] ================== vf_relay (3 subtests) ===================
[10:39:22] [PASSED] vf_rejects_guc2vf_too_short
[10:39:22] [PASSED] vf_rejects_guc2vf_too_long
[10:39:22] [PASSED] vf_rejects_guc2vf_no_payload
[10:39:22] ==================== [PASSED] vf_relay =====================
[10:39:22] ================= pf_service (11 subtests) =================
[10:39:22] [PASSED] pf_negotiate_any
[10:39:22] [PASSED] pf_negotiate_base_match
[10:39:22] [PASSED] pf_negotiate_base_newer
[10:39:22] [PASSED] pf_negotiate_base_next
[10:39:22] [SKIPPED] pf_negotiate_base_older
[10:39:22] [PASSED] pf_negotiate_base_prev
[10:39:22] [PASSED] pf_negotiate_latest_match
[10:39:22] [PASSED] pf_negotiate_latest_newer
[10:39:22] [PASSED] pf_negotiate_latest_next
[10:39:22] [SKIPPED] pf_negotiate_latest_older
[10:39:22] [SKIPPED] pf_negotiate_latest_prev
[10:39:22] =================== [PASSED] pf_service ====================
[10:39:22] ===================== lmtt (1 subtest) =====================
[10:39:22] ======================== test_ops  =========================
[10:39:22] [PASSED] 2-level
[10:39:22] [PASSED] multi-level
[10:39:22] ==================== [PASSED] test_ops =====================
[10:39:22] ====================== [PASSED] lmtt =======================
[10:39:22] ==================== xe_bo (2 subtests) ====================
[10:39:22] [SKIPPED] xe_ccs_migrate_kunit
[10:39:22] [SKIPPED] xe_bo_evict_kunit
[10:39:22] ===================== [SKIPPED] xe_bo ======================
[10:39:22] ================== xe_dma_buf (1 subtest) ==================
[10:39:22] [SKIPPED] xe_dma_buf_kunit
[10:39:22] =================== [SKIPPED] xe_dma_buf ===================
[10:39:22] ================== xe_migrate (1 subtest) ==================
[10:39:22] [SKIPPED] xe_migrate_sanity_kunit
[10:39:22] =================== [SKIPPED] xe_migrate ===================
[10:39:22] =================== xe_mocs (2 subtests) ===================
[10:39:22] [SKIPPED] xe_live_mocs_kernel_kunit
[10:39:22] [SKIPPED] xe_live_mocs_reset_kunit
[10:39:22] ==================== [SKIPPED] xe_mocs =====================
[10:39:22] ==================== args (11 subtests) ====================
[10:39:22] [PASSED] count_args_test
[10:39:22] [PASSED] call_args_example
[10:39:22] [PASSED] call_args_test
[10:39:22] [PASSED] drop_first_arg_example
[10:39:22] [PASSED] drop_first_arg_test
[10:39:22] [PASSED] first_arg_example
[10:39:22] [PASSED] first_arg_test
[10:39:22] [PASSED] last_arg_example
[10:39:22] [PASSED] last_arg_test
[10:39:22] [PASSED] pick_arg_example
[10:39:22] [PASSED] sep_comma_example
[10:39:22] ====================== [PASSED] args =======================
[10:39:22] =================== xe_pci (2 subtests) ====================
[10:39:22] [PASSED] xe_gmdid_graphics_ip
[10:39:22] [PASSED] xe_gmdid_media_ip
[10:39:22] ===================== [PASSED] xe_pci ======================
[10:39:22] ==================== xe_rtp (1 subtest) ====================
[10:39:22] ================== xe_rtp_process_tests  ===================
[10:39:22] [PASSED] coalesce-same-reg
[10:39:22] [PASSED] no-match-no-add
[10:39:22] [PASSED] no-match-no-add-multiple-rules
[10:39:22] [PASSED] two-regs-two-entries
[10:39:22] [PASSED] clr-one-set-other
[10:39:22] [PASSED] set-field
[10:39:22] [PASSED] conflict-duplicate
[10:39:22] [PASSED] conflict-not-disjoint
[10:39:22] [PASSED] conflict-reg-type
[10:39:22] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[10:39:22] ===================== [PASSED] xe_rtp ======================
[10:39:22] ==================== xe_wa (1 subtest) =====================
[10:39:22] ======================== xe_wa_gt  =========================
[10:39:22] [PASSED] TIGERLAKE (B0)
[10:39:22] [PASSED] DG1 (A0)
[10:39:22] [PASSED] DG1 (B0)
[10:39:22] [PASSED] ALDERLAKE_S (A0)
[10:39:22] [PASSED] ALDERLAKE_S (B0)
[10:39:22] [PASSED] ALDERLAKE_S (C0)
[10:39:22] [PASSED] ALDERLAKE_S (D0)
[10:39:22] [PASSED] ALDERLAKE_P (A0)
[10:39:22] [PASSED] ALDERLAKE_P (B0)
[10:39:22] [PASSED] ALDERLAKE_P (C0)
[10:39:22] [PASSED] ALDERLAKE_S_RPLS (D0)
[10:39:22] [PASSED] ALDERLAKE_P_RPLU (E0)
[10:39:22] [PASSED] DG2_G10 (C0)
[10:39:22] [PASSED] DG2_G11 (B1)
[10:39:22] [PASSED] DG2_G12 (A1)
[10:39:22] [PASSED] METEORLAKE (g:A0, m:A0)
[10:39:22] [PASSED] METEORLAKE (g:A0, m:A0)
[10:39:22] [PASSED] METEORLAKE (g:A0, m:A0)
[10:39:22] [PASSED] LUNARLAKE (g:A0, m:A0)
[10:39:22] [PASSED] LUNARLAKE (g:B0, m:A0)
[10:39:22] ==================== [PASSED] xe_wa_gt =====================
[10:39:22] ====================== [PASSED] xe_wa ======================
[10:39:22] ============================================================
[10:39:22] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[10:39:22] Elapsed time: 31.134s total, 4.279s configuring, 26.585s building, 0.217s running

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

[10:39:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:39:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


