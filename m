Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89231C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E2010E968;
	Thu, 22 Jan 2026 09:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA6LJY+g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DA510E968
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769074532; x=1800610532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mXfiI8nuY63+zYhIlAmd8IGeMnDCBAadFYcRSTIcnYs=;
 b=ZA6LJY+gtANeHjfmyNUrBKSOjoe2ObmNDMzHGLyAMMpA1isO5Hn0I2pz
 YmgcPUDxppd14X5Zoavuf57xw72QvunskTNcd7/qhpWJAyrSEuU4pJ6Am
 V6oTj462qfHhZ1k3XhjddoybvDHG7uGBQBq/78T8WDqpXY9QQyIFLVSfs
 t2LFMe2cxQzFmmNAFpFPUvxM02nQSOEAb4Xs1HgFRecLN7p8uuF/LGS4U
 lbpo4w3Rc9lCi/ze6FU1oFI23uD56+wwCRu/AG24K3HRw7idqvKvm7Pf0
 cm2L8zDpNtbii3Z3IBk+qAz1REDxE/nfzEwbZPv27ngR8SIDMlDumNyOY Q==;
X-CSE-ConnectionGUID: 0fLyTK1ZTlqUe3iWmjqdXA==
X-CSE-MsgGUID: Vep2HdFjQIq0div7JeAmFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80937727"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80937727"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:35:32 -0800
X-CSE-ConnectionGUID: gar4eZ2jSIePLfAN9rytvQ==
X-CSE-MsgGUID: 7zaOm6+/RxaDC3alr27ayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="207122745"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:35:29 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH 0/8] Introduce Xe Uncorrectable Error Handling
Date: Thu, 22 Jan 2026 15:36:12 +0530
Message-ID: <20260122100613.3631582-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds the base support for XE Uncorrectable Error Handling
on top of the system controller patch [1].

The first four patches implement PCI error recovery callbacks for AER events.
On fatal errors, the device is wedged in error_detected and a Secondary
Bus reset (SBR) is requested from PCI core by returning
PCI_ERS_RESULT_NEED_RESET.

On non-fatal errors, the mmio_enabled callback is invoked to query the
error and attempt the required recovery.

The rest of the patches add the base support for Uncorrectable Error handling
of Core-Compute errors.

This series adds the basic foundation and will be extended to other
types of errors and commands.

[1] https://patchwork.freedesktop.org/series/159554/

Anoop Vijay (1):
  drm/xe/xe_sysctrl: Add System controller patch

Riana Tauro (7):
  drm/xe/xe_pci_error: Implement PCI error recovery callbacks
  drm/xe/xe_pci_error: Group all devres to release them on PCIe slot
    reset
  drm/xe: Skip device access during PCI error recovery
  drm/xe/xe_ras: Initialize Uncorrectable AER Registers
  drm/xe/xe_ras: Add structures and commands for Uncorrectable Core
    Compute Errors
  drm/xe/xe_ras: Add support for Uncorrectable Core-Compute errors
  drm/xe/xe_pci_error: Process errors in mmio_enabled

 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  44 ++
 drivers/gpu/drm/xe/xe_device.c                |  17 +-
 drivers/gpu/drm/xe/xe_device.h                |  15 +
 drivers/gpu/drm/xe/xe_device_types.h          |  12 +
 drivers/gpu/drm/xe/xe_gt.c                    |   9 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   8 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pci_error.c             |  93 ++++
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 229 +++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  16 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 131 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.c               |  80 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 445 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  49 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  33 ++
 19 files changed, 1232 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.47.1

