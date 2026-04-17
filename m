Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769D8F8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3827310E992;
	Fri, 17 Apr 2026 08:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/4V6k89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B133C10E94F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414326; x=1807950326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xDHvb6rI1eVmpyVap9p900IRdGLKKeQhsUtwAuCMXpY=;
 b=O/4V6k891u5kdJnzhDT48iNKrRmrGvyPySFjMTfz7PIdGw1z93l1RN3r
 g9TeDAAfuBxh2P/14eozSSYfBFQfLLIYtBWKmj9Zvo6fs5iHeVsuIiiON
 EmnecG5hnYLY1rMoSeTEZghvh5vp4s0kGve/PksvSY+EJJG5BiL3i1PwB
 121AXpdt9M+QYKvhKMmb14lRXjjnMnxwEy1oLqM9ACFvZuVGksE8wYQee
 gscp6CEESLbjjrCEaFSi9DQv0O/KMufWS0hUvFWEDQqlOGyJZbXJ/JATp
 dWqpeJ+jZFKlfU+A9aaMeH6FdiqryRSXHTar2M8eJA/neKPQpZxd/se2c A==;
X-CSE-ConnectionGUID: olATXlFFSXi7hZkEptqHJw==
X-CSE-MsgGUID: mh7I44YqROyhPPvqvP5LdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045789"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:25 -0700
X-CSE-ConnectionGUID: w+nc0hJHQqWTD+kdLl91mg==
X-CSE-MsgGUID: e8ySMFEGRdKAVwN153UqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962214"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 00/13] Introduce Xe Uncorrectable Error Handling
Date: Fri, 17 Apr 2026 14:28:12 +0530
Message-ID: <20260417085812.4013309-15-riana.tauro@intel.com>
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
recovered using a SBR. However, Double-bit ECC error requires page
offlining for containment. Add helpers to instruct firmware to offline
page. Also add helpers to get pages offlined by firmware on module load.
The page offlining patch will be integrated after the patch
https://patchwork.freedesktop.org/series/161473/ is merged.

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

Riana Tauro (13):
  drm/xe/xe_survivability: Decouple survivability info from boot
    survivability
  drm/xe/xe_pci_error: Implement PCI error recovery callbacks
  drm/xe/xe_pci_error: Group all devres to release them on PCIe slot
    reset
  drm/xe: Skip device access during PCI error recovery
  drm/xe/xe_ras: Initialize Uncorrectable AER Registers
  drm/xe/xe_ras: Add basic structures and commands for uncorrectable
    errors
  drm/xe/xe_ras: Add support for uncorrectable core-compute errors
  drm/xe/xe_ras: Handle uncorrectable SoC Internal errors
  drm/xe/xe_ras: Handle uncorrectable device memory errors
  drm/xe/xe_ras: Add support to offline/decline a page
  drm/xe/xe_ras: Add support for page offline list and queue commands
  drm/xe/xe_ras: Query errors from system controller on probe
  drm/xe/xe_pci_error: Process errors in mmio_enabled

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  26 +-
 drivers/gpu/drm/xe/xe_device.h                |  15 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_gt.c                    |  14 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   9 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c             | 121 +++++
 drivers/gpu/drm/xe/xe_ras.c                   | 489 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  18 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 339 ++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c    |  13 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  19 +
 13 files changed, 1057 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

-- 
2.47.1

