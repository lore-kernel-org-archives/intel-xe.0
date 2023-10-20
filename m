Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66DFCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 04:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5A10E07B;
	Fri, 20 Oct 2023 04:48:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C691C10E07B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 04:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697777325; x=1729313325;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JzqG3rIjTcIpC9cGlfLFIF6LTus9bZmbl1sJTja9AB8=;
 b=TJLqLy0DyQZ/MVFNsnG4Q0r1CYpZ6xKhkqVw9w32JqCG4kulzB9Uufay
 QGP7XR5nsFCz+5fJ+ySB9AbP0c2kt2/1XMip0jwNVl3aj9njWq1vUbbwb
 fwoFPz7EW/KKIMCyDGUm5nRZyakN1xPSedB4A9/XJh2+QbujmldkKFB+c
 hOdNzkdio+t0Y4VI+B2dQBRl8GpA0HooDFOjAVi/6fiRgG3OAKglbBxWa
 WGKwhmil8OXiLxfkXd1P9bhAdpsJzDkBlKTTo1fAifXnaWZP2XMx6jSeB
 5jpm4CQErwJ2C2E6taACjBpnjHDMvGRMbT7TGoPrdpbYNdc7N1Da1phkp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390310780"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="390310780"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 21:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847959713"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="847959713"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 21:48:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 10:25:21 +0530
Message-Id: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 00/12] Supporting RAS on XE
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

Our platforms support Reliability, Availability and Serviceability(RAS).
In case of hardware errors, our hardwares provides the causes via
sending interrupt or pcie errors. The fatal errors are propogated 
as pci errors and non fatal errors as MSI. This series focuses on 
loging and updating counters for these errors, which will be  helpful to avoid, 
detect and repair hardware faults.

This [1] series proposes mechanism to expose this counters to userspace.
[1]: https://patchwork.freedesktop.org/series/118435/

The error counters  exposed by KMD will be used by L0/sysman 
They will be categorized to specific category of error in sysman:
https://spec.oneapi.io/level-zero/latest/sysman/api.html#ras

We have very limited capabilities for error injection to validate the
code flow.
Output of L3 fabric fatal injection from PVC is:
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: TILE0 detected GT FATAL error bit[0] is set
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: GT0 detected L3 FABRIC FATAL error. ERR_VECT_GT_FATAL[7]:0x00000087

v2
- Use different headers for error registers. (Nikula)
- Correctable errors shouldn't be considered as dmesg errors (Matt)
- Limit series to HW errors.(Aravind)

v3
- Rebase

v4
- Use xe_regs.h only for registers, move enums out of it.
- Make sure global data/structures are immutable.
- Avoid adding custom error logging macro's.
- Redesign the registers error name and counter index
structures for maintainability. (Nikula)

v5
- move struct hw_err_regs out of CONFIG_DRM_XE_DISPLAY.

v6
- Addressing Review comments from Aravind.

v7
- CI fixes.

v8
- Conditional check fixes.

v9
- Fix patch no.

v10
- Modify the XE_RESET_FAILED_UEVENT and use for GSC too.
(Brian and Aravind)

Himal Prasad Ghimiray (4):
  drm/xe: Handle errors from various components.
  drm/xe: Add new helpers to log hardware errrors.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Support GSC hardware error reporting for PVC.
  drm/xe: Rename XE_RESET_FAILED_UEVENT to XE_RESET_REQUIRED_UEVENT.
  drm/xe: Notify userspace about GSC HW errors.
  drm/xe: Support SOC FATAL error handling for PVC.
  drm/xe: Support SOC NONFATAL error handling for PVC.
  drm/xe: Handle MDFI error severity.
  drm/xe: Clear SOC CORRECTABLE error registers.
  drm/xe: Clear all SoC errors post warm reset.

 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  29 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   4 +
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  66 ++
 drivers/gpu/drm/xe/xe_device.c               |  13 +
 drivers/gpu/drm/xe/xe_device_types.h         |  23 +-
 drivers/gpu/drm/xe/xe_gt.c                   |  13 +-
 drivers/gpu/drm/xe/xe_gt_printk.h            |   7 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   6 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 909 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 198 ++++
 drivers/gpu/drm/xe/xe_irq.c                  |   9 +
 drivers/gpu/drm/xe/xe_tile.c                 |   3 +
 include/uapi/drm/xe_drm.h                    |  23 +-
 14 files changed, 1292 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.25.1

