Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A208CC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 21:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFA710E30C;
	Mon, 27 Nov 2023 21:01:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D56E10E30C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701118891; x=1732654891;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5oiovNSBx3O8hiaMjRFf/h+nRSLu85obiIoUB1vIR4c=;
 b=gGcBA3cD7XWQnIpi+aEWaglrQDS+Jmn/Qsay/3IZKjv/gZR+Evoy2RbH
 EaPTzGChj1TmLN4cGFVP3rj9+Yxza3VL6kHUWlRI2Bp523jinpidcRtQi
 rP7CcOpqWHzH2PSQUj18g9rU/tELw4IBxBygLD0Gshd3xUwswja7Z3opO
 vzsQibbjN+DUhI/Uw3AyUtZFgBtg3KxJ/rsP28W/gG3Od6yeNvQmV/lLv
 +w8bGJk/7IYlWw2aFaNGZ8uqBiyvE3wY6/uQ6DMCYzTtEwMNxkbkDy7J/
 NbezTgUJE+6M8zZiBNujr2pI8F/6IO4ygqsM0ObyFEIfqB0irMvdEcaa3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377820271"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="377820271"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 13:01:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="912213788"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="912213788"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 13:01:29 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Date: Mon, 27 Nov 2023 16:01:20 -0500
Message-Id: <20231127210123.3376177-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Add support for XeLink device
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

Changes from version 1:
	-  Fix kernel-doc error

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

