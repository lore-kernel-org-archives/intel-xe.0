Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB4C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432B910E0BE;
	Mon, 20 Nov 2023 18:57:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6266810E07E
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700506630; x=1732042630;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VSCAb9JvIhGy54BHz9YBdPtCBlhTpamyQwVjZe8lKMI=;
 b=Y2Rn5ugt0/OL2Gf7kKa3je57+WHrZ9JIUx1USUQT9a8I2OYIFqGH5Ir9
 A5rlJ0QBhpFdoo9hnGlVDfv0ljMPuRgqWlcI4A+ntpqE8cw/O9FPZsbkH
 97ko+bmr6K1Z2CoMbWk9UU39/byEPDx3OGT+q2orbcb9irjHnsAkx9fQr
 0asHW05Tbyc4ueDWMYJkl3fbRgo5Y2ttXwonld45swoucxHzZGRfMf41J
 +kgRNGnMSClVcjvG+DGHdONDhHM1n+mmJNrlZj/u+Oglk4IZkPRnsUf38
 1kzc5heKkmGgLbNIoU1tT0rwEjLbFbbyxTQcLNXk2ntdTaic/Td6ejd9d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="390543235"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="390543235"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7806133"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:09 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com, matthew.brost@intel.com
Date: Mon, 20 Nov 2023 13:56:57 -0500
Message-Id: <20231120185700.3304104-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.38.1
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
  drm/xe: Introduce XeLink device
  drm/xe: Teach Xe how to use objects with XeLink connectivity
  drm/xe/uapi: Augment query ioctl to allow for fabric

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  30 ++
 drivers/gpu/drm/xe/xe_bo.c           |  45 ++-
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h |  25 ++
 drivers/gpu/drm/xe/xe_dma_buf.c      | 208 ++++++++----
 drivers/gpu/drm/xe/xe_dma_buf.h      |   3 +
 drivers/gpu/drm/xe/xe_ggtt.c         |   3 +
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
 drivers/gpu/drm/xe/xe_irq.c          |  22 ++
 drivers/gpu/drm/xe/xe_link.c         | 461 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_link.h         |  38 +++
 drivers/gpu/drm/xe/xe_mmio.c         |   3 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 drivers/gpu/drm/xe/xe_pt.c           |   3 +
 drivers/gpu/drm/xe/xe_query.c        |  54 ++++
 drivers/gpu/drm/xe/xe_trace.h        |  29 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  17 +-
 drivers/gpu/drm/xe/xe_vm.c           |   3 +-
 include/drm/xelink_platform.h        | 140 ++++++++
 include/uapi/drm/xe_drm.h            |  26 ++
 23 files changed, 1058 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_link.c
 create mode 100644 drivers/gpu/drm/xe/xe_link.h
 create mode 100644 include/drm/xelink_platform.h

-- 
2.38.1

