Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF15CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 03:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3304C10E365;
	Wed, 18 Oct 2023 03:53:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1C310E365
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 03:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697601228; x=1729137228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ug52+07nUp7h3gKXzaksZNS8DwnIOEnpxjZB1iYUnto=;
 b=HxVznyCLgNCUKv37uoCXpn0tknmw/EJyHMqS7RezU+hSLYDFLd4zNw7e
 lN9FiFGC4Rn2nckv/jur0NNzVa6vNrjkY57x/E23+TqSDoCqCNfa4CYuK
 CEHCRj+3Ch53jnr+ftglqmSzTsqlrH4Ow+vIMLqyQZVCt40902O2CP4IB
 Q2TJ8sHGqSe/+7jyzFPknqXyfyQLUqmfDGEhs3ohKGAskViKlUs6B/Udg
 KDQ/9D6lWzll99ntOM2tiHU0XhICpXhmsxj/HiY8zm+SKKe+6G//PxXIb
 B0Br/yLPEYJTv3+5vQWpMJ5jdT+XPqHZ4QOqehn+WHyRJ+qwJ6Y41kW/F g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389806026"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389806026"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 20:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="4351444"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2023 20:53:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 09:30:23 +0530
Message-Id: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 00/10] Supporting RAS on XE
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

Himal Prasad Ghimiray (4):
  drm/xe: Handle errors from various components.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Support GSC hardware error reporting for PVC.
  drm/xe: Notify userspace about GSC HW errors.
  drm/xe: Support SOC FATAL error handling for PVC.
  drm/xe: Support SOC NONFATAL error handling for PVC.
  drm/xe: Handle MDFI error severity.
  drm/xe: Clear SOC CORRECTABLE error registers.
  drm/xe: Clear all SoC errors post warm reset.

 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  29 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   5 +-
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  65 ++
 drivers/gpu/drm/xe/xe_device.c               |  14 +
 drivers/gpu/drm/xe/xe_device_types.h         |  21 +
 drivers/gpu/drm/xe/xe_gt.c                   |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   7 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 919 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 210 +++++
 drivers/gpu/drm/xe/xe_irq.c                  |   9 +
 drivers/gpu/drm/xe/xe_tile.c                 |   1 +
 include/uapi/drm/xe_drm.h                    |   8 +
 13 files changed, 1289 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.25.1

