Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84580C021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 00:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B24C10E50B;
	Tue, 25 Feb 2025 00:08:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B6910E504;
 Tue, 25 Feb 2025 00:08:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_VRAM_Self_Refresh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 00:08:45 -0000
Message-ID: <174044212553.1770689.11224815078512952381@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224164849.3746751-1-anshuman.gupta@intel.com>
In-Reply-To: <20250224164849.3746751-1-anshuman.gupta@intel.com>
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

Series: VRAM Self Refresh
URL   : https://patchwork.freedesktop.org/series/145342/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_devcoredump.c:15:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_device.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_device_sysfs.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_drm_client.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_dma_buf.c:17:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_exec.c:14:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.h:10,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_execlist.c:14:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_force_wake.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_ggtt.c:20:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_gsc.c:17:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_gsc_proxy.c:17:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gsc_debugfs.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gsc_submit.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_ccs_mode.c:9:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_clock.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_freq.c:16:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_idle.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_mcr.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_mcr.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_pagefault.c:15:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sysfs.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_throttle.c:9:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc.h:9,
                 from ../drivers/gpu/drm/xe/xe_guc.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_ads.c:18:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_buf.c:9:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_capture.c:19:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_db_mgr.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_ct.c:20:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_engine_activity.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_hwconfig.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_id_mgr.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_submit.c:20:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      [00:08:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:08:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_heci_gsc.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_pc.c:17:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_huc.c:15:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_log.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_hw_engine.c:16:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:10:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_hw_engine_group.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_hw_fence.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/display/xe_display.h:9,
                 from ../drivers/gpu/drm/xe/xe_irq.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:21:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_lrc.c:18:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_mmio.h:9,
                 from ../drivers/gpu/drm/xe/xe_mmio.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_mocs.c:9:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_oa.c:20:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_pat.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_pcode.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/display/xe_display.h:9,
                 from ../drivers/gpu/drm/xe/xe_pci.c:18:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.h:10,
                 from ../drivers/gpu/drm/xe/xe_preempt_fence.c:10:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_pt.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/display/xe_display.h:9,
                 from ../drivers/gpu/drm/xe/xe_pm.c:15:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_pxp_debugfs.c:14:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_pxp.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_pxp_submit.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_query.c:17:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_reg_whitelist.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pm.c: In function ‘xe_pm_d3cold_allowed_toggle’:
../drivers/gpu/drm/xe/xe_pm.c:911:45: error: implicit declaration of function ‘xe_display_connected’; did you mean ‘xe_display_create’? [-Werror=implicit-function-declaration]
  911 |         else if (xe->d3cold.vrsr_capable && xe_display_connected(xe))
      |                                             ^~~~~~~~~~~~~~~~~~~~
      |                                             xe_display_create
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_reg_sr.c:18:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:13,
                 from ../drivers/gpu/drm/xe/xe_rtp.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:13,
                 from ../drivers/gpu/drm/xe/xe_ring_ops.c:16:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_sa.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_step.c:10:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_sched_job.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_survivability_mode.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_sync.c:17:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_tile.h:9,
                 from ../drivers/gpu/drm/xe/xe_tile_sysfs.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:207: drivers/gpu/drm/xe/xe_pm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_tile.c:10:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_trace.h:18,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:15,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:15,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_trace_lrc.h:15,
                 from ../drivers/gpu/drm/xe/xe_trace_lrc.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_ttm_sys_mgr.c:15:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:18:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_tuning.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_vsec.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_uc.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_wa.h:9,
                 from ../drivers/gpu/drm/xe/xe_wa.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_uc_fw.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_vram.c:14:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_vram_freq.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_hwmon.c:15:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_wopcm.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_sriov.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_wait_user_fence.c:13:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_vf.c:19:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_hmm.c:14:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:10:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_relay.c:19:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_memirq.c:12:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_sriov_vf.c:8:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:14:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf.c:11:
../include/linux/pci-acpi.h:143:5: warning: no previous prototype for ‘pci_acpi_request_d3cold_aux_power’ [-Wmissing-prototypes]
  143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/pci-acpi.h:148:5: warning: no previous prototype for ‘pci_acpi_add_perst_assertion_delay’ [-Wmissing-prototypes]
  148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:465: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:465: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:465: drivers] Error 2
make[2]: *** [/kernel/Makefile:1989: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


