Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A3C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 16:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8420010E1FD;
	Tue,  8 Aug 2023 16:45:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4848210E1FD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691513149; x=1723049149;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iGgRZOvosb5qBaI36231hEQDOE6NpUVkNPTDWEsbcZY=;
 b=U3H08p4i5vYpcpCR/g9X8o0QFn0MW5jddMBzZ2W4NVgepanajL5bf+pO
 Vl1v30ZCCUfe6w7c86+pT/4qMFLHap+sJFTzATRG162BUDI42V73DS3eX
 cAntyDWQNNQ/HUjWuQKhPvGx0SRrBwFylYYvkMbXVpeu36UHN2857tCGx
 MD6lyJCTdQOWHO2kgmL4SfrwwH7ctnL/FClCtLVbW9Hc9WP3TefroAWuc
 AhobvKOtMj60mUp5nuE35sFUZPaIJztytZ2JRkYNTKSKMpg1vXD22dVb1
 /cn6AWLvJwC1K12LmrCorwcsWEbTOOMrGq4cp2EKmhfbQQAPDKwE9aPE/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457267538"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="457267538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766431636"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="766431636"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:45:42 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com, matthew.brost@intel.com
Date: Tue,  8 Aug 2023 12:45:31 -0400
Message-Id: <20230808164534.1027552-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Add support for XeLink device
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

First patch set introduce the needed Xe infrastructure to support
XeLink device.

The XeLink device is a glue-less module attached to a GPU device that
provides connectivity between different GPUs on the same system.

The XeLink is part of the GPU (the register space is part of the GPU
PCIe BAR), so it cannot be a completely separate device driver.

The Linux kernel provides an interface for handling this type of
device, the Auxiliary Bus API.

The Xe and XeLink will use the auxiliary bus to enable the XeLink 
and the Xe to probe and communicate.

A followup series will include the XeLink driver code to provide
full functionality for the device.

David Kershner (3):
  drm/xe: Introduce a module parameter to control XeLink
  drm/xe: Introduce XeLink device
  drm/xe: Teach i915 how to use objects with XeLink connectivity

 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/Makefile          |   3 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  20 ++
 drivers/gpu/drm/xe/xe_bo.c           |  47 ++-
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h |  27 ++
 drivers/gpu/drm/xe/xe_dma_buf.c      | 162 ++++++---
 drivers/gpu/drm/xe/xe_dma_buf.h      |   3 +
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
 drivers/gpu/drm/xe/xe_irq.c          |  28 +-
 drivers/gpu/drm/xe/xe_mmio.c         |   2 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 drivers/gpu/drm/xe/xe_pt.c           |   7 +-
 drivers/gpu/drm/xe/xe_xelink.c       | 476 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_xelink.h       |  38 +++
 include/drm/intel_xelink_platform.h  | 140 ++++++++
 18 files changed, 921 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_xelink.c
 create mode 100644 drivers/gpu/drm/xe/xe_xelink.h
 create mode 100644 include/drm/intel_xelink_platform.h

-- 
2.35.1

