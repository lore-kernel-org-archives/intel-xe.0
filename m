Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA375CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB12E10EF79;
	Mon,  8 Jun 2026 08:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0VDxr1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0B910EF79
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908433; x=1812444433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LsxsohR65e+J/FYmaRgZOA+Q2dnZRfJRN/FMTqVLteA=;
 b=T0VDxr1UGwJZeHgciVK8ovkWNtx2QVK/jibT4vDo2r+YokJkqej2qIk5
 MhzY/ZEKrhLTYyCrJJVt56C/wg1ZNkCk6JCd91cxJSpWHN7ZGNUgU8HzA
 ZKv7LBlxX3AfIc9izR2GLacbXUgDrbNWAs7B2FCXpx0JRwd5vZMYWs66a
 69W59Sp02e1aOau2CK2w2s7VZwX/z2lhSZ6ZNtltCc+4qdzDcnlueOPff
 CIpT3wCRdDre3KeG1/N8pMD+OChVpnT/YbcR2vt4Us1tOZSCQ6nH7rLmB
 V6x+jTT1drAZt37kbhTz7FCAyMoX1o6Zpjbm95lYyD6fYJAuKXhS2010y Q==;
X-CSE-ConnectionGUID: ww0d6LanT1eFDCD0FxmGFg==
X-CSE-MsgGUID: SDK3/wyVS0Kd55ek1T0UxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029050"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029050"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:13 -0700
X-CSE-ConnectionGUID: a888XglaTDmcsBrx0D1lpA==
X-CSE-MsgGUID: hYuEmoaWRsKTxgN7fQ2fVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269465992"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 00/15] Introduce Xe Uncorrectable Error Handling
Date: Mon,  8 Jun 2026 14:17:01 +0530
Message-ID: <20260608084700.640376-17-riana.tauro@intel.com>
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

The first four patches implement PCI error recovery callbacks for AER
events.
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
a reset to recover. When an AER is reported and error_detected is
invoked
return PCI_ERS_RESULT_NEED_RESET.
A Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected part without distrupting the rest of the device.

SoC Internal errors: Most of the uncorrectable SoC internal errors
are recovered using a SBR apart from CSC firmware and Punit errors.
CSC firmware errors requires a firmware flash to be recovered whereas
Punit error requires cold-reset.

Device memory errors: The recovery action for memory errors depends on
the error category. Double bit ECC (Error Correcting Code) errors will be
handled using Page offlining in a later patch. Poison and data parity
errors are only logged. Rest of the errors require SBR
(Secondary Bus Reset) to recover. Add helper to send offline/decline
command to firmware. 

Pages are also saved by firmware in flash and need to be offlined
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

Rev6: rename function to prepare_reset.
      call pci_prepare_reset() before requesting SBR
      fix cosmetic review comments
      add patch to skip run_ticks while reading fdinfo
      when SBR is in flight

Rev7: rename sysctrl build command function
      rename pci prepare reset function
      use wedged state management
      split function for usp dev

Rev8: fix kunit error
      add error handling for poison and data parity memory errors
      add request structure for page offlining list

Raag Jadav (1):
  drm/xe: Improve wedged state management

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
  drm/xe/xe_ras: Query errors from system controller on probe
  drm/xe/xe_pci_error: Process errors in mmio_enabled
  drm/xe/xe_ras: Add support to query device memory errors
  drm/xe/xe_ras: Add support to query page offline queue and list
  drm/xe/xe_ras: Add support to offline/decline a page address
  drm/xe/xe_ras: Process pages from offlined list and queue

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  24 +-
 drivers/gpu/drm/xe/xe_device.h                |  27 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  12 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  14 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   9 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   9 +
 drivers/gpu/drm/xe/xe_pci_error.c             | 135 +++++
 drivers/gpu/drm/xe/xe_pci_error.h             |  13 +
 drivers/gpu/drm/xe/xe_ras.c                   | 494 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   4 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 227 ++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c    |  13 +-
 drivers/gpu/drm/xe/xe_sysctrl_event.c         |   2 +-
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   |   3 -
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   4 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  11 +
 18 files changed, 1002 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.h

-- 
2.47.1

