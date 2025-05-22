Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51B5C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 11:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4318810E13F;
	Thu, 22 May 2025 11:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8s2DJOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1F710E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747912612; x=1779448612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pDYQrDgDV1KBwX4aXCKhFRb7UbleMD0/fSKWzZGpycc=;
 b=G8s2DJOzd733ruKpCyHOZeddkwQ8HLZkZS8im6uT/NOhwuHbvI20qZLb
 tmQpBvGe0SjJsSAZXWd6HKUbYyWW7PqKo2wZg+Pwkn/cTxx1HIDt8pWJn
 1FUNnUyzJJ7cUBA8o4kjw64kj3RaB++lhNbQTB9/ZOp+oCldhzcjbHs0a
 edIEe4WKcTap/OtEHGj2EfufzyBdDwXlJY2qL9xVjcXIcFcdMuL4NFxtO
 jySDdhVgj84Pi6I6uTWf1oa/4QUmdC5DYE4R+SloPfBMP3R0LPxSyK3LC
 8vZrQ67TKs6Y8kKA9kiOhShRgZXe5WMTo9U0/4GRYDqxZ5iYxfIZC4H/P Q==;
X-CSE-ConnectionGUID: 3HXNIRYATCy0ZBqjsAQc+Q==
X-CSE-MsgGUID: qVTAARfSSyiA6SymLcKtkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49049423"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49049423"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:16:51 -0700
X-CSE-ConnectionGUID: tkUHWLUPT3GG/q59jihY5A==
X-CSE-MsgGUID: F6QDU72DR4SUXxXbX7IYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="171426938"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:16:49 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v9 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Thu, 22 May 2025 16:46:38 +0530
Message-Id: <20250522111643.1946209-1-karthik.poosa@intel.com>
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

v6:
 - Address kernel-doc build error.
 - Rebase.

v7:
 - Rebase.

Patch series history:

https://patchwork.freedesktop.org/series/148148/ - RFC
https://patchwork.freedesktop.org/series/148506/
https://patchwork.freedesktop.org/series/148811/
https://patchwork.freedesktop.org/series/148819/
https://patchwork.freedesktop.org/series/148926/
https://patchwork.freedesktop.org/series/149026/

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

