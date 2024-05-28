Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C1BC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 13:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD1A10E50D;
	Tue, 28 May 2024 13:40:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC911122C7;
 Tue, 28 May 2024 13:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_replace_format-less_?=
 =?utf-8?q?snprintf=28=29_with_strscpy=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 13:40:12 -0000
Message-ID: <171690361207.2216238.15530462767297461632@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528133251.2310868-1-arnd@kernel.org>
In-Reply-To: <20240528133251.2310868-1-arnd@kernel.org>
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

Series: drm/xe: replace format-less snprintf() with strscpy()
URL   : https://patchwork.freedesktop.org/series/134140/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:39:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:39:19] Building KUnit Kernel ...
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

[13:39:46] Starting KUnit Kernel (1/1)...
[13:39:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:39:46] =================== guc_dbm (7 subtests) ===================
[13:39:46] [PASSED] test_empty
[13:39:46] [PASSED] test_default
[13:39:46] ======================== test_size  ========================
[13:39:46] [PASSED] 4
[13:39:46] [PASSED] 8
[13:39:46] [PASSED] 32
[13:39:46] [PASSED] 256
[13:39:46] ==================== [PASSED] test_size ====================
[13:39:46] ======================= test_reuse  ========================
[13:39:46] [PASSED] 4
[13:39:46] [PASSED] 8
[13:39:46] [PASSED] 32
[13:39:46] [PASSED] 256
[13:39:46] =================== [PASSED] test_reuse ====================
[13:39:46] =================== test_range_overlap  ====================
[13:39:46] [PASSED] 4
[13:39:46] [PASSED] 8
[13:39:46] [PASSED] 32
[13:39:46] [PASSED] 256
[13:39:46] =============== [PASSED] test_range_overlap ================
[13:39:46] =================== test_range_compact  ====================
[13:39:46] [PASSED] 4
[13:39:46] [PASSED] 8
[13:39:46] [PASSED] 32
[13:39:46] [PASSED] 256
[13:39:46] =============== [PASSED] test_range_compact ================
[13:39:46] ==================== test_range_spare  =====================
[13:39:46] [PASSED] 4
[13:39:46] [PASSED] 8
[13:39:46] [PASSED] 32
[13:39:46] [PASSED] 256
[13:39:46] ================ [PASSED] test_range_spare =================
[13:39:46] ===================== [PASSED] guc_dbm =====================
[13:39:46] =================== guc_idm (6 subtests) ===================
[13:39:46] [PASSED] bad_init
[13:39:46] [PASSED] no_init
[13:39:46] [PASSED] init_fini
[13:39:46] [PASSED] check_used
[13:39:46] [PASSED] check_quota
[13:39:46] [PASSED] check_all
[13:39:46] ===================== [PASSED] guc_idm =====================
[13:39:46] ================== no_relay (3 subtests) ===================
[13:39:46] [PASSED] xe_drops_guc2pf_if_not_ready
[13:39:46] [PASSED] xe_drops_guc2vf_if_not_ready
[13:39:46] [PASSED] xe_rejects_send_if_not_ready
[13:39:46] ==================== [PASSED] no_relay =====================
[13:39:46] ================== pf_relay (14 subtests) ==================
[13:39:46] [PASSED] pf_rejects_guc2pf_too_short
[13:39:46] [PASSED] pf_rejects_guc2pf_too_long
[13:39:46] [PASSED] pf_rejects_guc2pf_no_payload
[13:39:46] [PASSED] pf_fails_no_payload
[13:39:46] [PASSED] pf_fails_bad_origin
[13:39:46] [PASSED] pf_fails_bad_type
[13:39:46] [PASSED] pf_txn_reports_error
[13:39:46] [PASSED] pf_txn_sends_pf2guc
[13:39:46] [PASSED] pf_sends_pf2guc
[13:39:46] [SKIPPED] pf_loopback_nop
[13:39:46] [SKIPPED] pf_loopback_echo
[13:39:46] [SKIPPED] pf_loopback_fail
[13:39:46] [SKIPPED] pf_loopback_busy
[13:39:46] [SKIPPED] pf_loopback_retry
[13:39:46] ==================== [PASSED] pf_relay =====================
[13:39:46] ================== vf_relay (3 subtests) ===================
[13:39:46] [PASSED] vf_rejects_guc2vf_too_short
[13:39:46] [PASSED] vf_rejects_guc2vf_too_long
[13:39:46] [PASSED] vf_rejects_guc2vf_no_payload
[13:39:46] ==================== [PASSED] vf_relay =====================
[13:39:46] ================= pf_service (11 subtests) =================
[13:39:46] [PASSED] pf_negotiate_any
[13:39:46] [PASSED] pf_negotiate_base_match
[13:39:46] [PASSED] pf_negotiate_base_newer
[13:39:46] [PASSED] pf_negotiate_base_next
[13:39:46] [SKIPPED] pf_negotiate_base_older
[13:39:46] [PASSED] pf_negotiate_base_prev
[13:39:46] [PASSED] pf_negotiate_latest_match
[13:39:46] [PASSED] pf_negotiate_latest_newer
[13:39:46] [PASSED] pf_negotiate_latest_next
[13:39:46] [SKIPPED] pf_negotiate_latest_older
[13:39:46] [SKIPPED] pf_negotiate_latest_prev
[13:39:46] =================== [PASSED] pf_service ====================
[13:39:46] ===================== lmtt (1 subtest) =====================
[13:39:46] ======================== test_ops  =========================
[13:39:46] [PASSED] 2-level
[13:39:46] [PASSED] multi-level
[13:39:46] ==================== [PASSED] test_ops =====================
[13:39:46] ====================== [PASSED] lmtt =======================
[13:39:46] ==================== xe_bo (2 subtests) ====================
[13:39:46] [SKIPPED] xe_ccs_migrate_kunit
[13:39:46] [SKIPPED] xe_bo_evict_kunit
[13:39:46] ===================== [SKIPPED] xe_bo ======================
[13:39:46] ================== xe_dma_buf (1 subtest) ==================
[13:39:46] [SKIPPED] xe_dma_buf_kunit
[13:39:46] =================== [SKIPPED] xe_dma_buf ===================
[13:39:46] ================== xe_migrate (1 subtest) ==================
[13:39:46] [SKIPPED] xe_migrate_sanity_kunit
[13:39:46] =================== [SKIPPED] xe_migrate ===================
[13:39:46] =================== xe_mocs (2 subtests) ===================
[13:39:46] [SKIPPED] xe_live_mocs_kernel_kunit
[13:39:46] [SKIPPED] xe_live_mocs_reset_kunit
[13:39:46] ==================== [SKIPPED] xe_mocs =====================
[13:39:46] ==================== args (11 subtests) ====================
[13:39:46] [PASSED] count_args_test
[13:39:46] [PASSED] call_args_example
[13:39:46] [PASSED] call_args_test
[13:39:46] [PASSED] drop_first_arg_example
[13:39:46] [PASSED] drop_first_arg_test
[13:39:46] [PASSED] first_arg_example
[13:39:46] [PASSED] first_arg_test
[13:39:46] [PASSED] last_arg_example
[13:39:46] [PASSED] last_arg_test
[13:39:46] [PASSED] pick_arg_example
[13:39:46] [PASSED] sep_comma_example
[13:39:46] ====================== [PASSED] args =======================
[13:39:46] =================== xe_pci (2 subtests) ====================
[13:39:46] [PASSED] xe_gmdid_graphics_ip
[13:39:46] [PASSED] xe_gmdid_media_ip
[13:39:46] ===================== [PASSED] xe_pci ======================
[13:39:46] ==================== xe_rtp (1 subtest) ====================
[13:39:46] ================== xe_rtp_process_tests  ===================
[13:39:46] [PASSED] coalesce-same-reg
[13:39:46] [PASSED] no-match-no-add
[13:39:46] [PASSED] no-match-no-add-multiple-rules
[13:39:46] [PASSED] two-regs-two-entries
[13:39:46] [PASSED] clr-one-set-other
[13:39:46] [PASSED] set-field
[13:39:46] [PASSED] conflict-duplicate
[13:39:46] [PASSED] conflict-not-disjoint
[13:39:46] [PASSED] conflict-reg-type
[13:39:46] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[13:39:46] ===================== [PASSED] xe_rtp ======================
[13:39:46] ==================== xe_wa (1 subtest) =====================
[13:39:46] ======================== xe_wa_gt  =========================
[13:39:46] [PASSED] TIGERLAKE (B0)
[13:39:46] [PASSED] DG1 (A0)
[13:39:46] [PASSED] DG1 (B0)
[13:39:46] [PASSED] ALDERLAKE_S (A0)
[13:39:46] [PASSED] ALDERLAKE_S (B0)
[13:39:46] [PASSED] ALDERLAKE_S (C0)
[13:39:46] [PASSED] ALDERLAKE_S (D0)
[13:39:46] [PASSED] ALDERLAKE_P (A0)
[13:39:46] [PASSED] ALDERLAKE_P (B0)
[13:39:46] [PASSED] ALDERLAKE_P (C0)
[13:39:46] [PASSED] ALDERLAKE_S_RPLS (D0)
[13:39:46] [PASSED] ALDERLAKE_P_RPLU (E0)
[13:39:46] [PASSED] DG2_G10 (C0)
[13:39:46] [PASSED] DG2_G11 (B1)
[13:39:46] [PASSED] DG2_G12 (A1)
[13:39:46] [PASSED] METEORLAKE (g:A0, m:A0)
[13:39:46] [PASSED] METEORLAKE (g:A0, m:A0)
[13:39:46] [PASSED] METEORLAKE (g:A0, m:A0)
[13:39:46] [PASSED] LUNARLAKE (g:A0, m:A0)
[13:39:46] [PASSED] LUNARLAKE (g:B0, m:A0)
[13:39:46] ==================== [PASSED] xe_wa_gt =====================
[13:39:46] ====================== [PASSED] xe_wa ======================
[13:39:46] ============================================================
[13:39:46] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[13:39:46] Elapsed time: 31.153s total, 4.267s configuring, 26.565s building, 0.291s running

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

[13:39:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:39:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


