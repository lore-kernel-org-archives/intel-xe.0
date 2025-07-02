Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70525C83F04
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 13:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53A10E702;
	Wed,  2 Jul 2025 13:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVZayXBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7EA10E702
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751463991; x=1782999991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LWFJxmRPM3Y/plBGwyks/eQ3uI1f0rK9uWygBW8VqZs=;
 b=LVZayXBEMpiMBihhNUD2dsmOCI79/BVyMhjbFQPRVVNb5Yy8bmE9PuXw
 QFQSdbVC1JY3B1HI8V2ElI0NoUhFKu4mw63htbV215tmveYGkHZqGUuXy
 rQ26kN0erz3qnsKR/CQcDlkyLICdtaV/oS/YAnFGLZrf6xL01UXMOh/LD
 Jn8QrGKGgk3jx7qyQlH96BP/do2VC8lONukpjwH0ev2UY6xB2k2YnQj2/
 k/wMi4eNSJlkGXmDPRY9ylZD0dp79Ongi0xvA4hmw9DAJztf8qgUYHSqJ
 WWIV9Z8onuxC1ofQkS/NM0kNWEaMOBMSl6UDA19LBMTOc8wkKsf7KLRIT g==;
X-CSE-ConnectionGUID: XU1nu3BYRWOljle1qvxRtw==
X-CSE-MsgGUID: +GfVquhwQOKe1jQ9wY9iUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71186030"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71186030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:46:31 -0700
X-CSE-ConnectionGUID: Ryjd+qocQ/OrC6heh2kbgg==
X-CSE-MsgGUID: JWkPFNpCQACqwt8dEIITgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177755927"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:46:27 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v3 0/7] Handle Firmware reported Hardware Errors
Date: Wed,  2 Jul 2025 19:41:10 +0530
Message-ID: <20250702141118.3564242-1-riana.tauro@intel.com>
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


Riana Tauro (7):
  drm: Add a vendor-specific recovery method to device wedged uevent
  drm/xe: Set GT as wedged before sending wedged uevent
  drm/xe/xe_survivability: Add support for Runtime survivability mode
  drm/xe/doc: Document device wedged and runtime survivability
  drm/xe: Add support to handle hardware errors
  drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
  drm/xe/xe_hw_error: Add fault injection to trigger csc error handler

 Documentation/gpu/drm-uapi.rst                |   5 +-
 Documentation/gpu/xe/index.rst                |   1 +
 Documentation/gpu/xe/xe_device.rst            |  10 +
 Documentation/gpu/xe/xe_pcode.rst             |   6 +-
 drivers/gpu/drm/drm_drv.c                     |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |   2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h    |  20 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  39 +++-
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_hw_error.c              | 187 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h              |  15 ++
 drivers/gpu/drm/xe/xe_irq.c                   |   4 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    |  57 +++++-
 drivers/gpu/drm/xe/xe_survivability_mode.h    |   4 +-
 .../gpu/drm/xe/xe_survivability_mode_types.h  |   8 +
 include/drm/drm_device.h                      |   4 +
 19 files changed, 350 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_device.rst
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.47.1

