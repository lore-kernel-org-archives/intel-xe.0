Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C755CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C51A10E1D7;
	Mon, 11 May 2026 16:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdnQpL1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C929210E1D7
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518553; x=1810054553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9tnFww0SsIlHWTmxEytwKp6AYBXud8iA1fYo2Q3c8U=;
 b=WdnQpL1s0HfXfj90KdVY7VARgIGoBPSV/Nmyt/TZu/7h6E6UGk8NIkXS
 C0X4sGrNsur3BisIDI2KSuYuPo2PIC3BXYCRXmanhS0/RzA76pyvW0D0F
 bAo7xTu6SFpodlhod52NjHWrT5juSG2gkKG7S1GF948JRbfpQftKs34rd
 4jaiq0g5pRinSU7FpB2mFer3g5K94gjkJVLu1d97Wt5AbrO5JT7TQkFC1
 GVG4SaWO7aHvcCtBoGrjTDUlSz5lAR5h3TnbkH+24SBIowo4aaF4pVSit
 wCX9RYq52ykE0vg6mNHDD49xu2SMK6DzstDyiEj/VkQMWPXAb8y54hSLN g==;
X-CSE-ConnectionGUID: aDlBmPsTRB64hje1/7VQeg==
X-CSE-MsgGUID: rpB4ZJK4SkKibj6MBlfxjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513483"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513483"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:55:53 -0700
X-CSE-ConnectionGUID: WKR0y+yvQ1CArxjcSjs4uQ==
X-CSE-MsgGUID: tU7ZjvoXQ0K6EGlmmxsEzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988666"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:55:49 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 00/14] Introduce Xe Uncorrectable Error Handling
Date: Mon, 11 May 2026 22:59:07 +0530
Message-ID: <20260511172908.1122252-16-riana.tauro@intel.com>
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

This series adds support for XE Uncorrectable Error Handling

The first four patches implement PCI error recovery callbacks for AER events.
On fatal errors, the device is wedged in error_detected and a Secondary
Bus reset (SBR) is requested from PCI core by returning
PCI_ERS_RESULT_NEED_RESET.

On non-fatal errors, the mmio_enabled callback is invoked to query the
error and attempt the required recovery.

This series adds support for handling Uncorrectable core compute,
SoC internal and device memory errors.

Core Compute Errors: Uncorrectable Core-Compute errors are classified
into Global and Local errors.
Global error is an error that affects the entire device requiring
a reset to recover. When an AER is reported and error_detected is invoked
return PCI_ERS_RESULT_NEED_RESET.
A Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected part without distrupting the rest of the device.

SoC Internal errors: Most of the uncorrectable SoC internal errors
are recovered using a SBR apart from CSC firmware and Punit errors.
CSC firmware errors requires a firmware flash to be recovered whereas
Punit error requires cold-reset.

Device memory errors: Most of the uncorrectable memory errors are
recovered using a SBR. However, double-bit ecc errors require page
offlining in both s/w (done in a later patch) and firmware.
Add helper to send offline/decline command to firmware. 
These pages are also saved by firmware in flash and need to be offlined
by software on module load. Add helpers to retrieve the list and queue
from firmware.

Rev2: Add support for SoC internal errors
      fix review comments

Rev3: remove in_recovery flag for disconnect error
      prevent sysctrl flooding
      use minimal logging
      simplify soc structures
      add error_count to GT structures

Rev4: add device memory errors
      add helpers for memory errors
      fix cosmetic review comments

Rev5: simplify structures in all patches
      disconnect on wedged or survivability mode
      rename in_recovery to in_reset
      add minimal integration patch for device memory errors
      rename system controller flooding macro
      fix comments

Riana Tauro (14):
  drm/xe/xe_survivability: Decouple survivability info from boot
    survivability
  drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
  drm/xe/xe_pci_error: Implement PCI error recovery callbacks
  drm/xe/xe_pci_error: Group all devres to release them on PCIe slot
    reset
  drm/xe: Skip device access during PCI error recovery
  drm/xe/xe_ras: Initialize Uncorrectable AER Registers
  drm/xe/xe_ras: Add support for uncorrectable core-compute errors
  drm/xe/xe_ras: Handle uncorrectable SoC Internal errors
  drm/xe/xe_ras: Add initial device memory error processing
  drm/xe/xe_ras: Add support to query page offline queue and list
  drm/xe/xe_ras: Query errors from system controller on probe
  drm/xe/xe_pci_error: Process errors in mmio_enabled
  drm/xe/xe_ras: Add support to offline/decline a page address
  drm/xe/xe_ras: Process pages from offlined list and queue

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  19 +-
 drivers/gpu/drm/xe/xe_device.h                |  15 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_gt.c                    |  14 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   9 +-
 drivers/gpu/drm/xe/xe_pci.c                   |  10 +
 drivers/gpu/drm/xe/xe_pci_error.c             | 138 +++++
 drivers/gpu/drm/xe/xe_ras.c                   | 488 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +-
 drivers/gpu/drm/xe/xe_ras_types.h             | 215 ++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c    |  13 +-
 drivers/gpu/drm/xe/xe_sysctrl_event.c         |   2 +-
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   |   2 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  11 +
 15 files changed, 928 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

-- 
2.47.1

