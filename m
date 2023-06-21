Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4D8EB64DD
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 19:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE0410E353;
	Wed, 21 Jun 2023 19:41:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072A310E138
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 19:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687376515; x=1718912515;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OatRliUp9o4hemYQ0gLhLsnisrOHOr4vPnRcAZKKXDg=;
 b=ZsFGgkls0OMl/KcPUejVTntAA/z/Vz/am1ek+l57hlUdkvMbKGNNe2rd
 KD9torxG9rA3FUrwH4MSE1yIlboBG9v0PEGGND5DCnpg3CNDGqoeOFFwG
 arj3fHI3CjRMDXfM3ygaiP7wPKsyCALlbpS4yGAJu1pXWBHURlSluv3Py
 S9olfOZjVjq3a+0dcnNKPnzm8jofPVAaimZUDEzIO1n9peRELotWxXHnd
 8XQnYjKtsF7iJmf3cfE9has/AOWVeD9DrDURDc9rTNHhrreefJH9CsuSF
 Tr1oQzH5yBcZE2/+b4v4H4H9Y9PMJOYCBRao6+1DREjrGdkXmQrXTp5yX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="426230927"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="426230927"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 12:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804504222"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="804504222"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 12:41:53 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Wed, 21 Jun 2023 15:41:22 -0400
Message-Id: <20230621194125.2052211-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Add Intel Accelerated Fabric to Xe
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

David Kershner (3):
  drm/xe: Introduce a module parameter to control IAF
  drm/xe: Introduce Intel Accelerated Fabric device
  drm/xe: Introduce Intel Accelerator fabric driver

 drivers/gpu/drm/xe/Kconfig           |   7 +
 drivers/gpu/drm/xe/Makefile          |   3 +
 drivers/gpu/drm/xe/fabric/Kconfig    |  18 +
 drivers/gpu/drm/xe/fabric/Makefile   |  12 +
 drivers/gpu/drm/xe/fabric/csr.h      | 493 +++++++++++++++++++
 drivers/gpu/drm/xe/fabric/iaf_drv.h  | 278 +++++++++++
 drivers/gpu/drm/xe/fabric/main.c     | 683 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/fabric/sysfs.c    | 114 +++++
 drivers/gpu/drm/xe/fabric/sysfs.h    |  16 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  20 +
 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h |  29 ++
 drivers/gpu/drm/xe/xe_gt_types.h     |   1 +
 drivers/gpu/drm/xe/xe_iaf.c          | 477 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_iaf.h          |  39 ++
 drivers/gpu/drm/xe/xe_irq.c          |  30 +-
 drivers/gpu/drm/xe/xe_mmio.c         |   2 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 include/drm/intel_iaf_platform.h     | 143 ++++++
 20 files changed, 2376 insertions(+), 5 deletions(-)
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

