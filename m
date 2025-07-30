Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3248CC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3EE10E035;
	Wed, 30 Jul 2025 05:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yhqq6By+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E4710E035
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854568; x=1785390568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BKMvHdjUUmwYe3W6t97CeWt7pgUY+55C4rn6h5IkcFQ=;
 b=Yhqq6By+VgRSBiOuwwsa52Hoja/shUnCtY3HDS6Kp/4QHy5DTuXuM6By
 K6Fe8337/LlBIZVn4top0Q0/EAysLabZ7rv8tQJHQpQPdwK9o3GqpCHic
 c/8xRTIDuthuC5rwVCCY0REjNMQPkGQuLzZmw2nJdUXXLxzX/auwDtUWM
 KIA7y8EEVOBYT9SSr2BAbwTWEJsLhYb4mNCpqjMwKTkNos7PFw5IcbzJi
 T9FQR4ZMD9qcf72IqdAoEjf986XA7Ex6FN/pXWwPTs76eCN3xNrhUukNX
 p8U031nFFxs2uM14jjDoD46BbvrX+8N5In5kYOOUuMiwuUy21RFmkNeSF g==;
X-CSE-ConnectionGUID: k4Or1klSRLaq5MB5/pWTiw==
X-CSE-MsgGUID: 316wEyM7SGaLWxhvvc/JFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215591"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:27 -0700
X-CSE-ConnectionGUID: D1RE4EqOSyyoemIzUcR8jA==
X-CSE-MsgGUID: 0OO6utwUT8O6Ksq/1AgLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240199"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:25 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 00/10] Supporting RAS on XE
Date: Wed, 30 Jul 2025 11:18:04 +0530
Message-Id: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

Rebasing series as a prep for netlink infra series which would be floated
as a follow up.

Our platforms supports Reliability, Availability and Serviceability(RAS).
In case of hardware errors, our hardwares provides the causes via
sending interrupt or pcie errors. The fatal errors are propogated 
as pci errors and non fatal errors as MSI. This series focuses on 
loging and updating counters for these errors, which will be  helpful to
detect and repair hardware faults.

This [1] series proposes mechanism to expose this counters to userspace.
[1]: https://patchwork.freedesktop.org/series/118435/

The error counters  exposed by KMD will be used by L0/sysman 
They will be categorized to specific category of error in sysman:
https://spec.oneapi.io/level-zero/latest/sysman/api.html#ras

We have very limited capabilities for error injection to validate the
code flow.
Output of L3 fabric fatal injection from PVC is:
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: TILE0 detected GT FATAL
error bit[0] is set
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: GT0 detected L3 FABRIC
FATAL error. ERR_VECT_GT_FATAL[7]:0x00000087

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>

Himal Prasad Ghimiray (10):
  drm/xe: Handle errors from various components.
  drm/xe: Add new helpers to log hardware errrors.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Support GSC hardware error reporting for PVC.
  drm/xe: Support SOC FATAL error handling for PVC.
  drm/xe: Support SOC NONFATAL error handling for PVC.
  drm/xe: Handle MDFI error severity.
  drm/xe: Clear SOC CORRECTABLE error registers.
  drm/xe: Clear all SoC errors post warm reset.

 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  29 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h        |   1 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   3 +
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  66 ++
 drivers/gpu/drm/xe/xe_device.c               |  16 +
 drivers/gpu/drm/xe/xe_device_types.h         |  17 +
 drivers/gpu/drm/xe/xe_gt.c                   |   1 +
 drivers/gpu/drm/xe/xe_gt_printk.h            |   7 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   6 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 896 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 194 ++++
 drivers/gpu/drm/xe/xe_irq.c                  |   1 +
 drivers/gpu/drm/xe/xe_tile.c                 |   2 +
 14 files changed, 1240 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.25.1

