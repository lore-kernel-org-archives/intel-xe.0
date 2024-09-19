Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7BCCF3976
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 22:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D6F10E77A;
	Thu, 19 Sep 2024 22:49:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3CB10E03A;
 Thu, 19 Sep 2024 22:49:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_PCI=3A_VF_resizable_BAR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 22:49:22 -0000
Message-ID: <172678616257.1048260.11595586748623592044@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
In-Reply-To: <20240919223557.1897608-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR
URL   : https://patchwork.freedesktop.org/series/138887/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:47:34] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:47:41] Building KUnit Kernel ...
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

[22:48:39] Starting KUnit Kernel (1/1)...
[22:48:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:48:40] =================== guc_dbm (7 subtests) ===================
[22:48:40] [PASSED] test_empty
[22:48:40] [PASSED] test_default
[22:48:40] ======================== test_size  ========================
[22:48:40] [PASSED] 4
[22:48:40] [PASSED] 8
[22:48:40] [PASSED] 32
[22:48:40] [PASSED] 256
[22:48:40] ==================== [PASSED] test_size ====================
[22:48:40] ======================= test_reuse  ========================
[22:48:40] [PASSED] 4
[22:48:40] [PASSED] 8
[22:48:40] [PASSED] 32
[22:48:40] [PASSED] 256
[22:48:40] =================== [PASSED] test_reuse ====================
[22:48:40] =================== test_range_overlap  ====================
[22:48:40] [PASSED] 4
[22:48:40] [PASSED] 8
[22:48:40] [PASSED] 32
[22:48:40] [PASSED] 256
[22:48:40] =============== [PASSED] test_range_overlap ================
[22:48:40] =================== test_range_compact  ====================
[22:48:40] [PASSED] 4
[22:48:40] [PASSED] 8
[22:48:40] [PASSED] 32
[22:48:40] [PASSED] 256
[22:48:40] =============== [PASSED] test_range_compact ================
[22:48:40] ==================== test_range_spare  =====================
[22:48:40] [PASSED] 4
[22:48:40] [PASSED] 8
[22:48:40] [PASSED] 32
[22:48:40] [PASSED] 256
[22:48:40] ================ [PASSED] test_range_spare =================
[22:48:40] ===================== [PASSED] guc_dbm =====================
[22:48:40] =================== guc_idm (6 subtests) ===================
[22:48:40] [PASSED] bad_init
[22:48:40] [PASSED] no_init
[22:48:40] [PASSED] init_fini
[22:48:40] [PASSED] check_used
[22:48:40] [PASSED] check_quota
[22:48:40] [PASSED] check_all
[22:48:40] ===================== [PASSED] guc_idm =====================
[22:48:40] ================== no_relay (3 subtests) ===================
[22:48:40] [PASSED] xe_drops_guc2pf_if_not_ready
[22:48:40] [PASSED] xe_drops_guc2vf_if_not_ready
[22:48:40] [PASSED] xe_rejects_send_if_not_ready
[22:48:40] ==================== [PASSED] no_relay =====================
[22:48:40] ================== pf_relay (14 subtests) ==================
[22:48:40] [PASSED] pf_rejects_guc2pf_too_short
[22:48:40] [PASSED] pf_rejects_guc2pf_too_long
[22:48:40] [PASSED] pf_rejects_guc2pf_no_payload
[22:48:40] [PASSED] pf_fails_no_payload
[22:48:40] [PASSED] pf_fails_bad_origin
[22:48:40] [PASSED] pf_fails_bad_type
[22:48:40] [PASSED] pf_txn_reports_error
[22:48:40] [PASSED] pf_txn_sends_pf2guc
[22:48:40] [PASSED] pf_sends_pf2guc
[22:48:40] [SKIPPED] pf_loopback_nop
[22:48:40] [SKIPPED] pf_loopback_echo
[22:48:40] [SKIPPED] pf_loopback_fail
[22:48:40] [SKIPPED] pf_loopback_busy
[22:48:40] [SKIPPED] pf_loopback_retry
[22:48:40] ==================== [PASSED] pf_relay =====================
[22:48:40] ================== vf_relay (3 subtests) ===================
[22:48:40] [PASSED] vf_rejects_guc2vf_too_short
[22:48:40] [PASSED] vf_rejects_guc2vf_too_long
[22:48:40] [PASSED] vf_rejects_guc2vf_no_payload
[22:48:40] ==================== [PASSED] vf_relay =====================
[22:48:40] ================= pf_service (11 subtests) =================
[22:48:40] [PASSED] pf_negotiate_any
[22:48:40] [PASSED] pf_negotiate_base_match
[22:48:40] [PASSED] pf_negotiate_base_newer
[22:48:40] [PASSED] pf_negotiate_base_next
[22:48:40] [SKIPPED] pf_negotiate_base_older
[22:48:40] [PASSED] pf_negotiate_base_prev
[22:48:40] [PASSED] pf_negotiate_latest_match
[22:48:40] [PASSED] pf_negotiate_latest_newer
[22:48:40] [PASSED] pf_negotiate_latest_next
[22:48:40] [SKIPPED] pf_negotiate_latest_older
[22:48:40] [SKIPPED] pf_negotiate_latest_prev
[22:48:40] =================== [PASSED] pf_service ====================
[22:48:40] ===================== lmtt (1 subtest) =====================
[22:48:40] ======================== test_ops  =========================
[22:48:40] [PASSED] 2-level
[22:48:40] [PASSED] multi-level
[22:48:40] ==================== [PASSED] test_ops =====================
[22:48:40] ====================== [PASSED] lmtt =======================
[22:48:40] =================== xe_mocs (2 subtests) ===================
[22:48:40] ================ xe_live_mocs_kernel_kunit  ================
[22:48:40] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[22:48:40] ================ xe_live_mocs_reset_kunit  =================
[22:48:40] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[22:48:40] ==================== [SKIPPED] xe_mocs =====================
[22:48:40] ================= xe_migrate (2 subtests) ==================
[22:48:40] ================= xe_migrate_sanity_kunit  =================
[22:48:40] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[22:48:40] ================== xe_validate_ccs_kunit  ==================
[22:48:40] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[22:48:40] =================== [SKIPPED] xe_migrate ===================
[22:48:40] ================== xe_dma_buf (1 subtest) ==================
[22:48:40] ==================== xe_dma_buf_kunit  =====================
[22:48:40] ================ [SKIPPED] xe_dma_buf_kunit ================
[22:48:40] =================== [SKIPPED] xe_dma_buf ===================
[22:48:40] ==================== xe_bo (3 subtests) ====================
[22:48:40] ================== xe_ccs_migrate_kunit  ===================
[22:48:40] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[22:48:40] ==================== xe_bo_evict_kunit  ====================
[22:48:40] =============== [SKIPPED] xe_bo_evict_kunit ================
[22:48:40] =================== xe_bo_shrink_kunit  ====================
[22:48:40] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[22:48:40] ===================== [SKIPPED] xe_bo ======================
[22:48:40] ==================== args (11 subtests) ====================
[22:48:40] [PASSED] count_args_test
[22:48:40] [PASSED] call_args_example
[22:48:40] [PASSED] call_args_test
[22:48:40] [PASSED] drop_first_arg_example
[22:48:40] [PASSED] drop_first_arg_test
[22:48:40] [PASSED] first_arg_example
[22:48:40] [PASSED] first_arg_test
[22:48:40] [PASSED] last_arg_example
[22:48:40] [PASSED] last_arg_test
[22:48:40] [PASSED] pick_arg_example
[22:48:40] [PASSED] sep_comma_example
stty: 'standard input': Inappropriate ioctl for device
[22:48:40] ====================== [PASSED] args =======================
[22:48:40] =================== xe_pci (2 subtests) ====================
[22:48:40] [PASSED] xe_gmdid_graphics_ip
[22:48:40] [PASSED] xe_gmdid_media_ip
[22:48:40] ===================== [PASSED] xe_pci ======================
[22:48:40] =================== xe_rtp (2 subtests) ====================
[22:48:40] =============== xe_rtp_process_to_sr_tests  ================
[22:48:40] [PASSED] coalesce-same-reg
[22:48:40] [PASSED] no-match-no-add
[22:48:40] [PASSED] match-or
[22:48:40] [PASSED] match-or-xfail
[22:48:40] [PASSED] no-match-no-add-multiple-rules
[22:48:40] [PASSED] two-regs-two-entries
[22:48:40] [PASSED] clr-one-set-other
[22:48:40] [PASSED] set-field
[22:48:40] [PASSED] conflict-duplicate
[22:48:40] [PASSED] conflict-not-disjoint
[22:48:40] [PASSED] conflict-reg-type
[22:48:40] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[22:48:40] ================== xe_rtp_process_tests  ===================
[22:48:40] [PASSED] active1
[22:48:40] [PASSED] active2
[22:48:40] [PASSED] active-inactive
[22:48:40] [PASSED] inactive-active
[22:48:40] [PASSED] inactive-1st_or_active-inactive
[22:48:40] [PASSED] inactive-2nd_or_active-inactive
[22:48:40] [PASSED] inactive-last_or_active-inactive
[22:48:40] [PASSED] inactive-no_or_active-inactive
[22:48:40] ============== [PASSED] xe_rtp_process_tests ===============
[22:48:40] ===================== [PASSED] xe_rtp ======================
[22:48:40] ==================== xe_wa (1 subtest) =====================
[22:48:40] ======================== xe_wa_gt  =========================
[22:48:40] [PASSED] TIGERLAKE (B0)
[22:48:40] [PASSED] DG1 (A0)
[22:48:40] [PASSED] DG1 (B0)
[22:48:40] [PASSED] ALDERLAKE_S (A0)
[22:48:40] [PASSED] ALDERLAKE_S (B0)
[22:48:40] [PASSED] ALDERLAKE_S (C0)
[22:48:40] [PASSED] ALDERLAKE_S (D0)
[22:48:40] [PASSED] ALDERLAKE_P (A0)
[22:48:40] [PASSED] ALDERLAKE_P (B0)
[22:48:40] [PASSED] ALDERLAKE_P (C0)
[22:48:40] [PASSED] ALDERLAKE_S_RPLS (D0)
[22:48:40] [PASSED] ALDERLAKE_P_RPLU (E0)
[22:48:40] [PASSED] DG2_G10 (C0)
[22:48:40] [PASSED] DG2_G11 (B1)
[22:48:40] [PASSED] DG2_G12 (A1)
[22:48:40] [PASSED] METEORLAKE (g:A0, m:A0)
[22:48:40] [PASSED] METEORLAKE (g:A0, m:A0)
[22:48:40] [PASSED] METEORLAKE (g:A0, m:A0)
[22:48:40] [PASSED] LUNARLAKE (g:A0, m:A0)
[22:48:40] [PASSED] LUNARLAKE (g:B0, m:A0)
[22:48:40] [PASSED] BATTLEMAGE (g:A0, m:A1)
[22:48:40] ==================== [PASSED] xe_wa_gt =====================
[22:48:40] ====================== [PASSED] xe_wa ======================
[22:48:40] ============================================================
[22:48:40] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[22:48:40] Elapsed time: 65.499s total, 6.778s configuring, 58.290s building, 0.396s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:48:40] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:48:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../arch/um/drivers/virt-pci.c:7:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/pci/access.c:2:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[5]: *** [../scripts/Makefile.build:244: arch/um/drivers/virt-pci.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:485: arch/um/drivers] Error 2
make[4]: *** Waiting for unfinished jobs....
cc1: some warnings being treated as errors
make[5]: *** [../scripts/Makefile.build:244: drivers/pci/access.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from ../drivers/pci/bus.c:11:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[5]: *** [../scripts/Makefile.build:244: drivers/pci/bus.o] Error 1
make[4]: *** [../scripts/Makefile.build:485: drivers/pci] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:485: arch/um] Error 2
make[3]: *** Waiting for unfinished jobs....
In file included from ../block/blk-mq-pci.c:8:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [../scripts/Makefile.build:244: block/blk-mq-pci.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:485: block] Error 2
In file included from ../drivers/gpu/drm/drm_edid.c:38:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_file.c:38:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/drm_file.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/drm_ioctl.c:33:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/drm_ioctl.o] Error 1
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/drm_edid.o] Error 1
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
In file included from ../kernel/irq/msi.c:16:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[5]: *** [../scripts/Makefile.build:244: kernel/irq/msi.o] Error 1
make[4]: *** [../scripts/Makefile.build:485: kernel/irq] Error 2
make[4]: *** Waiting for unfinished jobs....
In file included from ../lib/iomap.c:7:
../include/linux/pci.h: In function ‘pci_iov_resource_extend’:
../include/linux/pci.h:2421:10: error: ‘return’ with a value, in function returning void [-Werror=return-type]
 2421 | { return -ENODEV; }
      |          ^
../include/linux/pci.h:2420:20: note: declared here
 2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
../lib/iomap.c: At top level:
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
cc1: some warnings being treated as errors
make[4]: *** [../scripts/Makefile.build:244: lib/iomap.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:485: kernel] Error 2
make[3]: *** [../scripts/Makefile.build:485: lib] Error 2
make[2]: *** [/kernel/Makefile:1926: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


