Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B13C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517410E5F6;
	Tue,  1 Apr 2025 15:42:53 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D342B10E5F6;
 Tue,  1 Apr 2025 15:42:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_VRAM_Self_Refresh_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 15:42:52 -0000
Message-ID: <174352217285.23501.13456650842407981288@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401153225.96379-1-anshuman.gupta@intel.com>
In-Reply-To: <20250401153225.96379-1-anshuman.gupta@intel.com>
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

Series: VRAM Self Refresh (rev2)
URL   : https://patchwork.freedesktop.org/series/145342/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[15:42:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:42:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_devcoredump.c:15:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_device.c:6:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device.c:21:
../drivers/gpu/drm/xe/display/xe_display.h: In function ‘xe_display_connected’:
../drivers/gpu/drm/xe/display/xe_display.h:75:48: error: no return statement in function returning non-void [-Werror=return-type]
   75 | static inline bool xe_display_connected(struct xe_device *xe) {}
      |                                                ^~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_device_sysfs.c:12:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_dma_buf.c:17:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:207: drivers/gpu/drm/xe/xe_device.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_drm_client.c:13:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_eu_stall.c:15:
../include/linux/pci-acpi.h:149:5: warning: no previous prototype for ‘pci_acpi_register_aux_power_notifier’ [-Wmissing-prototypes]
  149 | int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:154:6: warning: no previous prototype for ‘pci_acpi_unregister_aux_power_notifier’ [-Wmissing-prototypes]
  154 | void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:156:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  156 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:161:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  161 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:465: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:465: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:465: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
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
make[2]: *** [/kernel/Makefile:1994: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


