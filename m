Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504A6D185EF
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 12:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5110E1C2;
	Thu,  8 Jan 2026 12:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6+6r97C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E8510E1C2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767877037; x=1799413037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y5fpUbfJe7dZyjNMs4iytO38ZHs9eCIZ3jvFcRTb6Pc=;
 b=m6+6r97CXQNl/yFLG+rsdQTvrSPeaxKIeb6yNd7QfrSFC6hmjz5dlexL
 ToFhSJDFS6rEBIMZnS2fkNJmZzaON1ySusJgr9TEONFPi1gBxO4pu0SBP
 XQSS47FOt5E8oaXfMFgqIUXCz1ylkvOD8kkCJwtxwOrpyfNrW+ivrs5x/
 Alcp+uLOg1q4jSPRuYIZZARRbmzZkFZfkpSbS92DutvVVw2rjj7Rjc8+V
 +69PHz54oFOiy+taPkRSioCCOVp1Tkvrumr+leTIQwwZqyCUFIwuKr/vR
 2V15UiBIuZhMgxiNMonEPS8mwN+NMaNHaCWorlQrTddFwfkVMpPOzb3nw A==;
X-CSE-ConnectionGUID: e7TYoJrNRGWrjECkQBjflw==
X-CSE-MsgGUID: mTe457tWRxKI8hJDOrU9KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80361793"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="80361793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:16 -0800
X-CSE-ConnectionGUID: nUuu8/cnSTak4vZBEgbn4w==
X-CSE-MsgGUID: n54TtAxETICm/yWDGhHOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="202978374"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:14 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 0/4] drm/xe/hwmon: Expose new temperature attributes
Date: Thu,  8 Jan 2026 18:33:19 +0530
Message-Id: <20260108130323.426531-1-karthik.poosa@intel.com>
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

Expose tempX_emergency and tempX_crit for package and vram,
representing shutdown and critical temperature thresholds.
These values are read via pcode thermal mailbox commands.

These are read using pcode thermal mailbox commands

v2: 
 - Expose memory controller, pcie and individual vram
   temperatures also.
 - Addressed some of review comments of v1 from KVP.

v3:
 - Combine patches 1,2,3 into patch 1.
 - Combine patches 4,5 to patch 2.
 - Addressed review comments from v2.
 - Update kernel version in Xe hwmon documentation.

v4:
 - Address review comments of v3.
 - Update kernel version to 7.0 in Xe hwmon documentation.

Karthik Poosa (4):
  drm/xe/hwmon: Expose temperature limits
  drm/xe/hwmon: Expose memory controller temperature
  drm/xe/hwmon: Expose GPU pcie temperature
  drm/xe/hwmon: Expose individual vram channel temperature

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 112 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 291 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   9 +
 7 files changed, 409 insertions(+), 12 deletions(-)

-- 
2.25.1

