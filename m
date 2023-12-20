Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62221C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 23:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAA710E630;
	Wed, 20 Dec 2023 23:17:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779BE10E628
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 23:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703114241; x=1734650241;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fSY4YsUb+CPblT5sCvGWLcCtao/wv5prdRn9IATNDK8=;
 b=Pb86pp9hCmUWefL48Cp9rHDpOJN7u79dFbIML8PJNfeSF98Zs9Mex4Ft
 Vzwp/aUpOKnlljKoQCwfGZGsXwu14XcFpZpGlSpACPJV+xZl777iVjqdt
 6/imNjKNT/rnYlfpR6XcTjSmed4KdpwkbmurefHDPSCSn6u0cE4rlzX3D
 V2peNevNND13QedFTruxEBw8PTqr0Dx49OOfOgmFnAdNjFYa1eK2X0D/P
 UF4lkRdIe2gJGaUZyO6Bhr+HLBqadNKG3mSQ69+hCPoCYy9A0QFmzUZDr
 6RyvagP2YSBlBCA7QAdiaoxoRKv4wPA9DVTlTPisJCE5WTPhUm3/+Z+hf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9354933"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="9354933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 15:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="24745204"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 15:17:19 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 jani.nikula@linux.intel.com
Subject: [PATCH v4 0/3] Add support for XeLink device
Date: Wed, 20 Dec 2023 18:17:07 -0500
Message-Id: <20231220231710.1817140-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.38.1
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
	- Fix kernel-doc error
Changes from version 2:
	- Fix up rebase conflicts
Changes from version 3:
	- Cleaned up xe_link.h header and removed unrequired include

David Kershner (3):
  drm/xe: Introduce XeLink device
  drm/xe: Teach Xe how to use objects with XeLink connectivity
  drm/xe/uapi: Augment query ioctl to allow for fabric

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  30 ++
 drivers/gpu/drm/xe/xe_bo.c           |  46 ++-
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h |  24 ++
 drivers/gpu/drm/xe/xe_dma_buf.c      | 209 ++++++++----
 drivers/gpu/drm/xe/xe_dma_buf.h      |   3 +
 drivers/gpu/drm/xe/xe_ggtt.c         |   3 +
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
 drivers/gpu/drm/xe/xe_irq.c          |  22 ++
 drivers/gpu/drm/xe/xe_link.c         | 478 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_link.h         |  20 ++
 drivers/gpu/drm/xe/xe_mmio.c         |   3 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 drivers/gpu/drm/xe/xe_pt.c           |   2 +
 drivers/gpu/drm/xe/xe_query.c        |  54 +++
 drivers/gpu/drm/xe/xe_trace.h        |  29 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  17 +-
 drivers/gpu/drm/xe/xe_vm.c           |   3 +-
 include/drm/xelink_platform.h        | 140 ++++++++
 include/uapi/drm/xe_drm.h            |  26 ++
 23 files changed, 1057 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_link.c
 create mode 100644 drivers/gpu/drm/xe/xe_link.h
 create mode 100644 include/drm/xelink_platform.h

-- 
2.38.1

