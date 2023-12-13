Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F16BC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E480210E850;
	Wed, 13 Dec 2023 21:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B35410E824
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702503934; x=1734039934;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M2GTW8Y8hbS6dtG8fNv55R42jRTG1vnP0Bgax22YQ5Q=;
 b=EKU+wQ5wYO386uR8mKHmTRpQPk/4hrV+M9+A1rgQ6N0yelCaM7bYIIwx
 Btp6d+7HoI3lr3wXv9J72YJicfM3e0A9ao+7RorIAkosaIww9a1Dhv9iP
 4eYtHxy6oJvAUGjgamylPnW6xJepIx49KrzIAIko/9sHhePEEH62iJQZk
 bPLVVo4T8cIrtp5lsIXLDf5OL1OxQRlOIDkWAFTjT+hl+ZpGW0YmhGj1q
 DzeKysFXaxcvFV+BhHhe/j3wn41TVhgiJ9FkKgem0IazWps0IlPPMIVjk
 MonWhlV4J9u5VGCDU4a6+K6JUpY6il1hr7wRhT+WgEEB5xc7n8fqKWxdi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16581499"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="16581499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="22137469"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:32 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 0/3] Add support for XeLink device
Date: Wed, 13 Dec 2023 16:45:22 -0500
Message-Id: <20231213214525.2584729-1-david.kershner@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c           |   2 +
 drivers/gpu/drm/xe/xe_query.c        |  54 ++++
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

