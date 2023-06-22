Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEDDEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 20:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B7310E028;
	Thu, 22 Jun 2023 20:17:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF0610E028
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687465029; x=1719001029;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3KsvGekUuBcLFS9LasBlBJJYPJM1FkTRqOFAdxymI8k=;
 b=byg/W427hL0GLFYJXy6Qh1n8yrMMp93dDdhs5qGN6+O4Xm/m4aaE749v
 Y5eBFZfOu/YTonG/lg2BbgwJ6eOP58y2Mkc7Te02xUscu2ao8RzhLFLWs
 a5I+NOej3da/dgMZ5crkUmaJMVLSFT4y2ZhAPzg8geiA7Xmp6tO5Fv6aM
 6iEqVBNr5hiHWc1I4qOGm8zN6h1xLzvl7Q5bYanmx2M8IJad5jiCZSZoE
 UvQ1epS4AOnuRt15TbFhbRBvkdDU5iIl7/GLpIivMbhworctLINlDywZY
 Gqw0AwvQtSxpagTWw1V/CtB7a/fiM3yvdlKEYGe9Cic5im0+GAGI75aQg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="360631823"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="360631823"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 13:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="709212814"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="709212814"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 13:17:06 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Thu, 22 Jun 2023 16:16:53 -0400
Message-Id: <20230622201656.2824543-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Add Intel Accelerated Fabric to Xe
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
 drivers/gpu/drm/xe/xe_device_types.h |  29 ++
 drivers/gpu/drm/xe/xe_gt_types.h     |   1 +
 drivers/gpu/drm/xe/xe_iaf.c          | 477 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_iaf.h          |  39 ++
 drivers/gpu/drm/xe/xe_irq.c          |  28 +-
 drivers/gpu/drm/xe/xe_mmio.c         |   2 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 include/drm/intel_iaf_platform.h     | 143 ++++++
 20 files changed, 2323 insertions(+), 3 deletions(-)
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

