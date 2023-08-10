Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93B5C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 05:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B78710E154;
	Thu, 10 Aug 2023 05:03:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AAA10E154
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 05:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691643797; x=1723179797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SbztjtD0ghovbr5PjF9okJc5aBLt/VT+NxxNijRAr/0=;
 b=PkD0LCM5saqSAtgdAG3WeA0vo3J71jwyR4xLcsp9FeI2P7/P89gVp+if
 2Nlcfz0hjX7prgM8datxGYjgOHGW0w6cyzNYMdcr2Ihvl/4oI1P34Fo8n
 UME1ilWNa1gDJE0uca6frqR9McJovz1HVZUO8wk7HkeyPEIZxR9/NbsAh
 YgyQw5uKf+TkxsUeX8GAh3PPvpDkEpFqafQ2OmqT5ar26S2aYhU1o0pgT
 Hh3zHPCXmQbJTUF/LJDoU/66+nPHwcpowA/O3Kiwlpg3pSTwK1f+wV5y7
 bFiu17K17ToLznktdwXSmBUjyhynz0Zjkmy1chhIQ3w9g4M0w+V4YPinN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374077048"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="374077048"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 22:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="725652089"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="725652089"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga007.jf.intel.com with ESMTP; 09 Aug 2023 22:02:53 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 10 Aug 2023 10:37:51 +0530
Message-Id: <20230810050755.715775-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Supporting RAS on XE
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
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: GT0 detected L3 FABRIC FATAL error. ERR_VECT_GT_FATAL_[7]:0x00000087

v2
- Use different headers for error registers. (Nikula)
- Correctable errors shouldn't be considered as dmesg errors (Matt)
- Limit series to HW errors.(Aravind)

Himal Prasad Ghimiray (4):
  drm/xe: Handle errors from various components.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Process fatal hardware errors.

 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  99 ++++
 drivers/gpu/drm/xe/regs/xe_regs.h            |   7 +
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h | 108 +++++
 drivers/gpu/drm/xe/xe_device_types.h         |   6 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   6 +
 drivers/gpu/drm/xe/xe_irq.c                  | 460 +++++++++++++++++++
 6 files changed, 686 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h

-- 
2.25.1

