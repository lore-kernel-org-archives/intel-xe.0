Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C8BCC6B03
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853C310F113;
	Thu,  2 Apr 2026 06:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QL5a2A1O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7FB10F041
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111343; x=1806647343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jH/ypEPdEW9cBHmkttG6YwMJj6fW/QwmnzdkgNhQxVs=;
 b=QL5a2A1OV5l6Ze6KISTjLO+Bjx8mu5/i5bz+9Dr2lLItjlqSAUdN9UKN
 vUAWJ1G65hJLCTCfaxO4gUL1vXho7/WimMAng4wIJAMMqhCQbFMJvRcrW
 uJPNmy1KlyHvp0S6HkARk9w/gHzfJKs3FPE4sYaIvzzqJAl9m02D+kJE6
 CQ1wp9gmXWp7R4grh8gus6b7SDBP19rWlCkhUyfnBiK1wpiFYeh5YkcfW
 Vs6359L+8Vje7ypzXnVbHkpRXeqZuDQ+Yr1u2nEvLBhfLo5qk0vvZ2zS9
 r7DYlIrAWdC2YW+eLA2rhu8OUog+rYgVEazuc8wIkAVlBu+FcwC8jsOzV Q==;
X-CSE-ConnectionGUID: MvzoSXicTDqVIh9fI2CdYQ==
X-CSE-MsgGUID: fvPPMOgjTGyrwJZtyuQTFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051442"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051442"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:02 -0700
X-CSE-ConnectionGUID: 7PO81v88RIWhJdKzQaZ1/g==
X-CSE-MsgGUID: tDm4a3AgTFmI9xUhAfKGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532056"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:28:59 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 00/10] Introduce Xe Uncorrectable Error Handling
Date: Thu,  2 Apr 2026 12:31:31 +0530
Message-ID: <20260402070131.1603828-12-riana.tauro@intel.com>
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

Rev2: Add support for SoC internal errors
      fix review comments

Rev3: remove in_recovery flag for disconnect error
      prevent sysctrl flooding
      use minimal logging
      simplify soc structures
      add error_count to GT structures

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

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  10 +
 drivers/gpu/drm/xe/xe_device.h                |  15 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_gt.c                    |  14 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   9 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c             | 118 +++++++
 drivers/gpu/drm/xe/xe_ras.c                   | 313 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  16 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 203 ++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c    |  12 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  13 +
 13 files changed, 726 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

-- 
2.47.1

