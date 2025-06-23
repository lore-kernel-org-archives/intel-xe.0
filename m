Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AB7C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982CA10E2D3;
	Mon, 23 Jun 2025 09:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4jphXtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDD810E2C2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750671466; x=1782207466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l8S08kzdiaaMfluCRwuTcJzOyK0dzqjctSFR7bHHtI8=;
 b=B4jphXtYiEfzB+jkkjErjbpE+qkzyjfrls/MSDIheVzPL9nGs0QKqON8
 jHZnTnNB0Xqc9SrZJvEpQsf9YicDJJ8ufResLVjLRYn0rQYRrTBCtfnl2
 Y9aBScb0UayaumMcfU8BrAOOQo8CDgXb4EDtAVgLnrvcxi0nO0FgVnrRf
 LgznIvlfcyRNxokYE0Vmi+yrdeEGdmVnd0rCa+zfLpWkK2oBil4zHZESP
 P8Yh8lzzzwDw+kri+Lfp66oSwfYKKj5DUR1It25R6+CxbqyRYXg5cZ2R9
 6+AzfeqxsQ2DtH05Zj/EmQclP7YijXeZAdW0EvCIJFb5ADS4ifT3ttjxF Q==;
X-CSE-ConnectionGUID: pzndKTyVTMSNZ7EHtrUznA==
X-CSE-MsgGUID: LyELYXj1SzWYSSYpPJglbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52740308"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52740308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:45 -0700
X-CSE-ConnectionGUID: 2sSMOCc4Qoi9WSyq6YyF6Q==
X-CSE-MsgGUID: kDVNoIiQR6WPqt9v+PttFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152057633"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:36:38 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH v2 0/5] Handle Firmware reported Hardware Errors
Date: Mon, 23 Jun 2025 15:31:03 +0530
Message-ID: <20250623100109.1086459-1-riana.tauro@intel.com>
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
non-recoverable from driver context. The only way to recover from these
errors is firmware flash.

Add a firmware flash method to the drm device wedged uevent. Send
this method along with the uevent to notify userspace of the wedged
state and the possible recovery method.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=firmware-flash
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5973
MAJOR=226
MINOR=0

Bspec: 50875, 53073, 53074, 53075, 53076

fwupd PR: https://github.com/fwupd/fwupd/pull/8922
	  https://github.com/fwupd/fwupd/pull/8944

IGT: https://patchwork.freedesktop.org/patch/660122/

Rev2: add a fault injection for csc errors
      fix review comments

Riana Tauro (5):
  drm: Add a firmware flash method to device wedged uevent
  drm/xe: Add a helper function to set recovery method
  drm/xe: Add support to handle hardware errors
  drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
  drm/xe/xe_hw_error: Add fault injection to trigger csc error handler

 Documentation/gpu/drm-uapi.rst             |   6 +-
 drivers/gpu/drm/drm_drv.c                  |   2 +
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  20 +++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c            |   2 +
 drivers/gpu/drm/xe/xe_device.c             |  48 ++++--
 drivers/gpu/drm/xe/xe_device.h             |   1 +
 drivers/gpu/drm/xe/xe_device_types.h       |   5 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 182 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h           |  15 ++
 drivers/gpu/drm/xe/xe_irq.c                |   4 +
 include/drm/drm_device.h                   |   1 +
 14 files changed, 271 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.47.1

