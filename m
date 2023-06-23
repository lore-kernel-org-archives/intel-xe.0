Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716FDC0015E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 04:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F2710E5D1;
	Fri, 23 Jun 2023 04:13:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DCE10E5D1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 04:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687493584; x=1719029584;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mr+1+FA6fFpAU+ta3mk/F5EUtjj1228pBomkrHye2tc=;
 b=QManowhzpfiKMEy9wJl+YngIv8hA+uNyZ+I3QNFswRCihEDyONCBeGxW
 ldWxgJtMOy/LqcppaIfZFa2NZwMMQWwgG5vgrXurB3nTrsSa2woMc4gaA
 l9qnQ1j9T7F6GRnQ193AX7yhImHDwnRkgfCXGgkEfUq/dzMfRxtp7hrmu
 Lr0/WXpIK6emD3Hc05tGYgbNRLsQ0mqisUrzzfbl0VLKLi0AFo5BIrwbP
 fKbR9WppwquivYcUW/XNv1mQ7//bTckSJWtT22wiA8+ncQMHIp+G/iCub
 j2nIkYJk9lb655U6q/9IN9edmK1M09NgiCq5kHUXC60Oiq0Wc2IB27Feo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447056723"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="447056723"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828226795"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="828226795"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:03 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Fri, 23 Jun 2023 00:12:54 -0400
Message-Id: <20230623041257.3550266-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] Add Intel Accelerated Fabric to Xe
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

First patch set introduce the needed Xe infrastructure and includes
the bare bones Intel Acclereated Fabric (IAF) driver.

This is the support code need for the XeLink available on the PVC
devices.

The XeLink accelerated fabric device is a glueless module attached
to a GPU device that provides fabric connectivity between different
GPUs on the same system.

The IAF is part of the GPU (the register space is part of the GPU
PCIe BAR), so it cannot be a completely separate device driver.
    
The Linux kernel provides an interface for handling this type of
device, the Auxiliary Bus API.
    
The Xe and fabric will use the auxiliary bus to enable the fabric
and the Xe to probe and communicate.

v2:
  - Removed unused functions
  - Restored include that was removed by accident
  - Cleaned up blank lines at end of file
v3:
  - Cleaned up kernel-doc comments

David Kershner (3):
  drm/xe: Introduce a module parameter to control IAF
  drm/xe: Introduce Intel Accelerated Fabric device
  drm/xe: Introduce Intel Accelerator fabric driver

 drivers/gpu/drm/xe/Kconfig           |   6 +
 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/fabric/Kconfig    |  18 +
 drivers/gpu/drm/xe/fabric/Makefile   |  12 +
 drivers/gpu/drm/xe/fabric/csr.h      | 493 +++++++++++++++++++++
 drivers/gpu/drm/xe/fabric/iaf_drv.h  | 278 ++++++++++++
 drivers/gpu/drm/xe/fabric/main.c     | 632 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/fabric/sysfs.c    | 114 +++++
 drivers/gpu/drm/xe/fabric/sysfs.h    |  16 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  20 +
 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h |  25 ++
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
 drivers/gpu/drm/xe/xe_iaf.c          | 477 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_iaf.h          |  39 ++
 drivers/gpu/drm/xe/xe_irq.c          |  28 +-
 drivers/gpu/drm/xe/xe_mmio.c         |   2 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 include/drm/intel_iaf_platform.h     | 143 ++++++
 20 files changed, 2320 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/fabric/Kconfig
 create mode 100644 drivers/gpu/drm/xe/fabric/Makefile
 create mode 100644 drivers/gpu/drm/xe/fabric/csr.h
 create mode 100644 drivers/gpu/drm/xe/fabric/iaf_drv.h
 create mode 100644 drivers/gpu/drm/xe/fabric/main.c
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.c
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.c
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.h
 create mode 100644 include/drm/intel_iaf_platform.h

-- 
2.35.1

