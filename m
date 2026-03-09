Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303BEEA8558
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 05:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE8510E488;
	Mon,  9 Mar 2026 05:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpALVi92";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9588710E488
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 05:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773033808; x=1804569808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N60ILWNB/+hgYNhLeBiXe5RzntwhImYnqNjc1h7IoWc=;
 b=OpALVi92hDFwgdQTi5Z2iO6LVEuv07IrISTexDIE0xXEAtwEaUjjYWsT
 MrZAST//P9F0/dFVy41Ih7l9AHxL5QBIwiiqUNgF1k9UniCD6VONor3QW
 cAUefNnL42FlfecxDgC7TM0k+W7Nns+XWEGPOqQTWf8XaFjVO6vdqRVjd
 PVvEl5u7n3UV1Ao/CwRN1CvD8ypqpJ40DLNDRRYPhID9fTIUfMYeezqPB
 +6rN+TMT/+llUF0Ypp+f0Vo67XJBki6i5w1P+pEwPXCn4FDJ7YMSjUJ0r
 1TkGC/1i2xDteVxzew94Do+ErHXvwMezl274TLOvzU6slkICN+dTrdZkS g==;
X-CSE-ConnectionGUID: 2dwaaCaHSIKFDms6Izp6kA==
X-CSE-MsgGUID: QcefXnUyQfCdDAYrbouLvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85138482"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85138482"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:23:27 -0700
X-CSE-ConnectionGUID: JM/GiWu/R+CpSMlt4aXJwA==
X-CSE-MsgGUID: ccOmMio1Tj2SegUIBTFYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224582906"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:23:23 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH 0/3] drm/xe: Add support for GPU health indicator
Date: Mon,  9 Mar 2026 10:47:02 +0530
Message-Id: <20260309051705.980155-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series adds Xe GPU health indicator support as RAS functionality
through the System Controller mailbox and which is exposed via
sysfs interface.

It introduces the health command IDs and request/response structures
used by System Controller mailbox, then wires the functionality into Xe
so user space can query and update GPU health state via a single
sysfs node.

The sysfs file (gpu_health) is placed in the device level and behaves as
follows:

$ cat /sys/.../device/gpu_health
[ok] warning critical

$ echo critical > /sys/.../device/gpu_health

$ cat /sys/.../device/gpu_health
ok warning [critical]

Anoop Vijay (1):
  From: Anoop Vijay <anoop.c.vijay@intel.com>

Soham Purkait (2):
  drm/xe/xe_ras: Add structures and commands for RAS GPU health
    indicator
  drm/xe/xe_ras: Add RAS support for GPU health indicator

 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  31 ++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   8 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 166 ++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  13 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  65 ++++
 drivers/gpu/drm/xe/xe_sysctrl.c               |  84 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  21 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 364 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  50 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 16 files changed, 913 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

