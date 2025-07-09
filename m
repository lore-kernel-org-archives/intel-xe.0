Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1200DC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB78010E794;
	Wed,  9 Jul 2025 10:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGHLXaIa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A1610E794
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752058528; x=1783594528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4n5SZAoPxU9B40buZXfs/VRGiyKpKy0t94FgxIVXqu8=;
 b=JGHLXaIalvSonI8x++pWHOBB6XsBDUdOpVGlASw4PKgzVj8mEzc1ruIE
 C/6Y7wQrFQNDMhKxrYSJubTs2c6n+TMF8nz1sYfnXnLh7S2/wszCfnEQK
 bHs2obW/7gw1laHuNc8L5w89q+kxdIXArEHv158pJKWGIA9V3UnvcAHrO
 t2EH8MSkmHQ7vh7k4Dw0yfk7rhJQBnDtIKEk9fQdkGGyoD6tBHsGvGFvF
 jhqZO5HFA/mm9SXAVzrof9yUmsuwz8VhSg3jISnzKEayiyxERP9A8hhl4
 a9wZggCkc5zJMQ2VXBVcm36MooRYNAI36nF2c0xodzKBbqPp0P2qiUkMT Q==;
X-CSE-ConnectionGUID: mnylj/LBQs6RZMY+1I/VGA==
X-CSE-MsgGUID: s6Nt/08iQzeb4s8W37FJug==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54288435"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54288435"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:55:28 -0700
X-CSE-ConnectionGUID: n1Qx/hIfSQKaT2kS58mFIg==
X-CSE-MsgGUID: dqq/IDwUQWK5g3M0TVhknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="192936281"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:55:25 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v4 0/9] Handle Firmware reported Hardware Errors
Date: Wed,  9 Jul 2025 16:50:12 +0530
Message-ID: <20250709112024.1053710-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support to handle firmware reported errors. When CSC firmware
errors are encoutered, a error interrupt is received by the GFX device as
a MSI interrupt.

Device Source control registers indicates the source of the error as CSC
The HEC error status register indicates that the error is firmware reported
Depending on the type of firmware error, the error cause is written to the HEC
Firmware error register.

On encountering such CSC firmware errors, the graphics device is
wedged and the only way to recover from these errors is firmware flash.

Add a vendor-specific recovery method to drm device wedged uevent.
The device will enter runtime survivability mode and send a drm device
wedged uevent when a firmware flash is required to notify userspace.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=vendor-specific
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5973
MAJOR=226
MINOR=0

Bspec: 50875, 53073, 53074, 53075, 53076

IGT: https://patchwork.freedesktop.org/patch/660122/

Rev2: add a fault injection for csc errors
      fix review comments

Rev3: add a vendor-specific recovery method
      add support for runtime survivability mode
      enable runtime survivability mode when csc errors are reported

Rev4: refactor survivability code

Riana Tauro (9):
  drm: Add a vendor-specific recovery method to device wedged uevent
  drm/xe: Set GT as wedged before sending wedged uevent
  drm/xe: Add a helper function to set recovery method
  drm/xe/xe_survivability: Refactor survivability mode
  drm/xe/xe_survivability: Add support for Runtime survivability mode
  drm/xe/doc: Document device wedged and runtime survivability
  drm/xe: Add support to handle hardware errors
  drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
  drm/xe/xe_hw_error: Add fault injection to trigger csc error handler

 Documentation/gpu/drm-uapi.rst                |   9 +-
 Documentation/gpu/xe/index.rst                |   1 +
 Documentation/gpu/xe/xe_device.rst            |  10 +
 Documentation/gpu/xe/xe_pcode.rst             |   6 +-
 drivers/gpu/drm/drm_drv.c                     |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |   2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h    |  20 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  53 ++++-
 drivers/gpu/drm/xe/xe_device.h                |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
 drivers/gpu/drm/xe/xe_heci_gsc.c              |   2 +-
 drivers/gpu/drm/xe/xe_hw_error.c              | 185 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h              |  15 ++
 drivers/gpu/drm/xe/xe_irq.c                   |   4 +
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 164 +++++++++++++---
 drivers/gpu/drm/xe/xe_survivability_mode.h    |   5 +-
 .../gpu/drm/xe/xe_survivability_mode_types.h  |   8 +
 include/drm/drm_device.h                      |   4 +
 22 files changed, 454 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_device.rst
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.47.1

