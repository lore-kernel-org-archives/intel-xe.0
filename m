Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929FAC3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 04:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3D610E4E9;
	Tue, 13 May 2025 04:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ysn9c8Pm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629C510E4EA
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 04:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747111666; x=1778647666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IGfgJIuXQZmsaO7eNht2HdyeAkCCzDSvTgkQ4+O3EGg=;
 b=Ysn9c8PmnbMn8W7Yb/LRsHAI8BogCOWyh2Jzk+fzhFSY3slcUaWK2pHq
 yufFA6OL5FqmRA6qU9HEty4o6/B/NwSrgM4UE6mGt/InBqXwTfjJEjxCk
 e/8Z0hm8J4mHcL28NXbVcSVkEIMCKkvSasc5iZsNMW9MaQP4Xrlj1psaV
 i2LEPdFAp+bDlRMkbwLmBU9fxw2H25H2FvbJcuBnqdU3zR3oIi9e/lWbx
 0X6Lkfz9vtD9paTI7v8C10q5h4+NW8iAt/P9wb+81/0VaJJsebq5HETkv
 RD4i6kN9xFYd6uxbg/rq/+RCWSjb+yfmNLJ6TORyPJVzE4rHVfwJ7HOum g==;
X-CSE-ConnectionGUID: ctksukqoTnGTb+4F4mSvVg==
X-CSE-MsgGUID: IW6n3T62TlKt998FJFMahA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60271227"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="60271227"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 21:47:46 -0700
X-CSE-ConnectionGUID: 8BuaI2ijQz+zLfNDdcghyw==
X-CSE-MsgGUID: SzWvlU/oTKOnggaFPLAlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137484555"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 21:47:44 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Tue, 13 May 2025 10:17:23 +0530
Message-Id: <20250513044728.630455-1-karthik.poosa@intel.com>
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
 - Clamp the power limits maximum to BIOS default value due to
   HSD:16027383332.

v3:
 - Clamp power limit write also to BIOS default for platforms
   with mailbox support.
 - Enable power label if any of PL1 or PL2 is enabled.
 - Address review comments in v2.

v4:
 - Remove unncessary debug prints.
 - Rebase.

v5:
 - Resolve unused variable compiler warning.
 - Add a return value check.

Patch series history:

https://patchwork.freedesktop.org/series/148148/ - RFC
https://patchwork.freedesktop.org/series/148506/
https://patchwork.freedesktop.org/series/148811/
https://patchwork.freedesktop.org/series/148819/

Karthik Poosa (5):
  drm/xe/hwmon: Add support to manage power limits though mailbox
  drm/xe/hwmon: Move card reactive critical power under channel card
  drm/xe/hwmon: Add support to manage PL2 though mailbox
  drm/xe/hwmon: Expose powerX_cap_interval
  drm/xe/hwmon: Read energy status from PMT

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  68 ++-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   6 -
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 483 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_vsec.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +
 12 files changed, 474 insertions(+), 136 deletions(-)

-- 
2.25.1

