Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD634C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 10:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CAC10E73F;
	Thu, 29 May 2025 10:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBvXj7MI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E75910E72B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748514881; x=1780050881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c8zM3F+X1q9qyOQi+oT0ffXnnehXnwfjgEV16/yJoRk=;
 b=gBvXj7MILskoDe2Er3SPmIBpDtIIRMK62/5z5J2KiKx2EGle6nf4baCI
 eFyYs/Xd5T6Li7nHFI6zehvMpdCH36rl7OmiRpE+bThbz8UhaN7FUAPMF
 Cbpmv+kCA6PuwNAdM4MqDUVOIBCoOuMlPU3UvsPw+z/moofW5MYQ348rf
 p6hV+U5vZUNdGm8bBFFL79o+cpjb6JNfd2VePE3ACgFvfErUQX1eBNETF
 0wJE9Fz2ZFgQ3fJBPJEMu8dB0XTvDsJbygp8RdrUdXXmJTE7fZN/5xwRi
 ZlciuyL9WWhfKiyER/KFqp+O7TrQAneDLIb0lTT+v0G9Hz4hdfUb7q6xO w==;
X-CSE-ConnectionGUID: rzezTKp8QI+CCZaXWL4qkA==
X-CSE-MsgGUID: LxoI0H8GTLqD7h5fWkbirA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61233454"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="61233454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 03:34:41 -0700
X-CSE-ConnectionGUID: jb6G+1fPQ7qfxi94uKCtFA==
X-CSE-MsgGUID: odtJ5RRTRy2HWM8ARywmlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="144511018"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 03:34:39 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v11 0/6] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Thu, 29 May 2025 16:04:24 +0530
Message-Id: <20250529103430.2348053-1-karthik.poosa@intel.com>
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

Add support manage power limits through pcode mailboxes.
Enable PL2 support through powerX_cap.
Expose PL2 interval through powerX_cap_interval.
Read energy status from PMT instead of MMIO.
Move power2_crit to power1_crit.

v2:
 - Addressed review comments from Badal.
 - Clamp the power limits maximum to GPU firmwar default value due to
   HSD:16027383332.

v3:
 - Clamp power limit write also to GPU firmware default for platforms
   with mailbox support.
 - Enable power label if any of PL1 or PL2 is enabled.
 - Address review comments in v2.

v4:
 - Remove unncessary debug prints.
 - Rebase.

v5:
 - Resolve unused variable compiler warning.
 - Add a return value check.

v6:
 - Address kernel-doc build error.
 - Rebase.

v7:
 - Rebase.

v8:
 - Rebase.

v9:
 - Rebase.

v10:
 - Remove unnecessary drm_warn.
 - Rectify powerX_label permission to read-only on platforms
   without mailbox power limits support.
 - Expose powerN_max/cap_xxx entries only on platforms with mailbox
   support.

v11:
 - Enable power_xxx sysfs entries only when GPU firmware support it.
 - Display logs in dmesg about which power limits are supported in
   the GPU firmware.
 - Recitfy few drm_dbg prints.

Patch series history:

https://patchwork.freedesktop.org/series/148148/ - RFC
https://patchwork.freedesktop.org/series/148506/
https://patchwork.freedesktop.org/series/148811/
https://patchwork.freedesktop.org/series/148819/
https://patchwork.freedesktop.org/series/148926/
https://patchwork.freedesktop.org/series/149026/
https://patchwork.freedesktop.org/series/149387/
https://patchwork.freedesktop.org/series/149434/

Karthik Poosa (6):
  drm/xe/hwmon: Add support to manage power limits though mailbox
  drm/xe/hwmon: Move card reactive critical power under channel card
  drm/xe/hwmon: Add support to manage PL2 though mailbox
  drm/xe/hwmon: Expose powerX_cap_interval
  drm/xe/hwmon: Read energy status from PMT
  drm/xe/hwmon: Expose power sysfs entries based on firmware support

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  68 ++-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   6 -
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 512 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_vsec.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +
 12 files changed, 502 insertions(+), 137 deletions(-)

-- 
2.25.1

