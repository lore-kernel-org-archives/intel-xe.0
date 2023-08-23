Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1F0EE4993
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 08:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E1010E3F9;
	Wed, 23 Aug 2023 08:53:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B3110E3F9
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692780782; x=1724316782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zhOwo1WCBuvCzGTmTr2kitMOUnc5wqzxO/6PMpAgVfw=;
 b=ZV5a47T95QzSSh2gLhzus/lmgwgJIbAA06iwWBy3G0MFnNZksEx9YFbF
 CtRPbmwqSHrX8fpRTtaw7zvzwCfX85emvQNyJuCxTtwYetaktEHWn1GTr
 5fqr7WPh5oyVBVZnjlI7YgrqHM5clCi6v7iEZPsRYYQjc5e4M6F2iE9BB
 dX9B+PHghLA6SKMo1eH2AvOybODOD0VTArG5VGDpSCN7N+PVi4FINn18u
 MnA/cB6CJ+JA+W8Pm8HVgQFVeYdv/owOrPH8PH/rzSdNEXUpoYq1FyrVM
 A1Z19PLopfYsAFbzJQIieRXs4vSTA/YM5vb3mcWWHYK0+Xmq7cDkXTxYE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377868488"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="377868488"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="713497217"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="713497217"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 23 Aug 2023 01:53:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 14:28:38 +0530
Message-Id: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/4] Supporting RAS on XE
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

Current version covers the error propagation at tile level and possible 
causes from GT subsystem. Future patches will cover the possible causes
from other subsystems (for example SOC, GSC/CSC).

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

Himal Prasad Ghimiray (4):
  drm/xe: Handle errors from various components.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Process fatal hardware errors.

 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  29 ++
 drivers/gpu/drm/xe/regs/xe_regs.h            |   5 +-
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  15 +
 drivers/gpu/drm/xe/xe_device_types.h         |  12 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   7 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 454 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 109 +++++
 drivers/gpu/drm/xe/xe_irq.c                  |   3 +
 9 files changed, 634 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.25.1

