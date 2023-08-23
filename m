Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0396EE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 05:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4545C10E254;
	Wed, 23 Aug 2023 05:34:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CAD10E239
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 05:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692768875; x=1724304875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=43vo9rCWoc8GK26Q7bYXvq4bGdpI9HhuVWXb6pA9IRo=;
 b=Xr1CadN67wXqZsvAqeWD5UxMSKyoX4YiPI1ZBpqZ7bHEddnoUNLZCjxy
 Wu8qqpdfFP8XYYVLCjTSBSE2FdOLfXYXNDZ2uDEZchnGrqBSKKE9TOrLW
 2QW+RYL55YZWuLGkNzPerm7Sr1JYtOHOvYYm8HapM0NhdrayHq9R2m1+7
 SzKtsboB8y9TZd6zfKBb/EzGOGW5lOz9loTm56FGi3DgdYCcZR+QMEdMa
 nxqyRKNYmwK31V5KwBnQnAMRgRFX4mW5pQMFStlslUGGrEvxgZHHNXt0K
 dEPFLKawokyCRMfAG+k/7+TNcm51PeyadhpGRUC4kbPbabvdvqbMdPgDU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="405072899"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="405072899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="860191772"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="860191772"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 22:34:32 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 11:10:11 +0530
Message-Id: <20230823054015.1427461-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/4] Supporting RAS on XE
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

Himal Prasad Ghimiray (4):
  drm/xe: Handle errors from various components.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Process fatal hardware errors.

 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  29 ++
 drivers/gpu/drm/xe/regs/xe_regs.h            |   5 +-
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  15 +
 drivers/gpu/drm/xe/xe_device_types.h         |  13 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   7 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 454 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 109 +++++
 drivers/gpu/drm/xe/xe_irq.c                  |   3 +
 9 files changed, 635 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.25.1

