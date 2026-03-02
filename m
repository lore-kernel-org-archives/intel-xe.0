Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9731E9B340
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6511610E20B;
	Mon,  2 Mar 2026 09:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyOKEM5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2761510E20B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445005; x=1803981005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3pgSDrcoiSNi2Re0NaqTLutUIgMIMDnYTnawGlzdYKU=;
 b=MyOKEM5F7wusRLCGkrARwQNsfTecShFXvGgqv9p2pcI/Iw4+JF5Tmcrr
 pBjsOAVH/oZDMpugMgEaX2XRgqCqyAYSvgPbZADS/+v7MgPFNP20jRlrE
 YRhmFgZRG1XG57K1vmAZc1dMtsjHO4Dg2EUsCDoLwF4NvElN3IoLpO5FN
 7MxeqV4iUB/3tOoRCpa3LTjbRPwYUC7Bns4S/iEWqr7urrmgNAlwWTpUV
 7yxiFvQGq+8r2GyNC06rdc5FHvwrKnhPxFfKdM20/gTt02JTGf2u9YtR/
 RT1dnNY98Cr+fBH2fczoGBQAttWgxsJRgL5lBAdIgfNdZgHl2rfPUcjY4 Q==;
X-CSE-ConnectionGUID: 9ni/nlQgR4iBwko2jL5c8g==
X-CSE-MsgGUID: 8g9JrC5qQGaPwIb8oK87SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783006"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:04 -0800
X-CSE-ConnectionGUID: PGG3+xKiS9izphgnlBHH+A==
X-CSE-MsgGUID: N6Rq/oqtRke/rUwQznfwRA==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:02 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 00/11] Introduce Xe Uncorrectable Error Handling
Date: Mon,  2 Mar 2026 15:51:55 +0530
Message-ID: <20260302102155.4074630-13-riana.tauro@intel.com>
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

This series adds support for handling Uncorrectable Core compute
and SoC internal errors.

Core Compute Errors: Uncorrectable Core-Compute errors are classified
into Global and Local errors.
Global error is an error that affects the entire device requiring a reset.
This type of error is not isolated. When an AER is reported and
error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
A Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected part without distrupting the rest of the device.

SoC Internal errors: Most of the uncorrectable SoC internal errors
are recovered using a SBR apart from CSC firmware and Punit errors.
CSC firmware errors requires a firmware flash to be recovered whereas
Punit error requires cold-reset.

Rev2: Add support for SoC internal errors
      fix review comments

Anoop Vijay (1):
  drm/xe/xe_sysctrl: Add System controller patch

Riana Tauro (10):
  drm/xe/xe_survivability: Decouple survivability info from boot
    survivability
  drm/xe/xe_pci_error: Implement PCI error recovery callbacks
  drm/xe/xe_pci_error: Group all devres to release them on PCIe slot
    reset
  drm/xe: Skip device access during PCI error recovery
  drm/xe/xe_ras: Initialize Uncorrectable AER Registers
  drm/xe/xe_ras: Add structures and commands for Uncorrectable Core
    Compute Errors
  drm/xe/xe_ras: Add support for Uncorrectable Core-Compute errors
  drm/xe/xe_ras: Add structures for SoC Internal errors
  drm/xe/xe_ras: Handle Uncorrectable SoC Internal errors
  drm/xe/xe_pci_error: Process errors in mmio_enabled

 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |  15 +
 drivers/gpu/drm/xe/xe_device.h                |  15 +
 drivers/gpu/drm/xe/xe_device_types.h          |  12 +
 drivers/gpu/drm/xe/xe_gt.c                    |  11 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   9 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pci_error.c             | 111 +++++
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 325 +++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  16 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 282 +++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c    |  12 +-
 drivers/gpu/drm/xe/xe_sysctrl.c               |  80 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 390 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  55 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  33 ++
 20 files changed, 1452 insertions(+), 8 deletions(-)
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

