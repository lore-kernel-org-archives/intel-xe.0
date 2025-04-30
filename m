Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2202BC369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 20:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B7410E027;
	Wed, 30 Apr 2025 20:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMXR2h+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BD010E027
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746045391; x=1777581391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=te56nvPu3G4GHwTHW0WAD6K3jaovnqNW5QyiUbl4P9E=;
 b=lMXR2h+j6/w/2wejz4mGqZVPmLNa60eKpZr3e7fsXvj6ct9YkUKIIF06
 2c0EpCBUiYEJ2eV9jhlStkL1BDfYGV855QsGPG1mBn6Abxvcc8zkMFfDm
 W+HUIkxIVbMELkJ7/FEZzJ/20A2OuGFErNLI1dqbbXZEvYHPqVNC7NClw
 c1bSm2PBtDAKbTKIGjb3C/qM8SBC5/iOpqLDJTAak/jiiLT0nlv6itXtT
 VUxYs+s4AkJnbsv/gWXj50HGuVZzgTH4AWqHJ50+QMi8d137+4y3lsNgS
 HwONWLPKAhzYASGLQwe+62/Y7tPwfKX205hawvfjlkLtSsidwi///Lm+9 g==;
X-CSE-ConnectionGUID: aToqBC87RPi2ea3KHB/wYQ==
X-CSE-MsgGUID: 4JGBBaLZRM+3XjgF5FjBWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58712353"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="58712353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:26 -0700
X-CSE-ConnectionGUID: KNzSa+IMSCGVj8cPLoQccw==
X-CSE-MsgGUID: Q8NIxE21RTep1Zn07qhuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134112576"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:23 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Thu,  1 May 2025 02:06:02 +0530
Message-Id: <20250430203607.926585-1-karthik.poosa@intel.com>
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

RFC patch: https://patchwork.freedesktop.org/series/148148/

Karthik Poosa (5):
  drm/xe/hwmon: Add support to manage power limits though mailbox
  drm/xe/hwmon: Move card reactive critical power under channel card
  drm/xe/hwmon: Add support to manage PL2 though mailbox
  drm/xe/hwmon: Expose powerX_cap_interval
  drm/xe/hwmon: Read energy status from PMT for Battlemage

 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h  |   3 +-
 drivers/gpu/drm/xe/regs/xe_pmt.h         |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   6 +
 drivers/gpu/drm/xe/xe_hwmon.c            | 445 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c              |   8 +
 drivers/gpu/drm/xe/xe_pcode.c            |  11 +
 drivers/gpu/drm/xe/xe_pcode.h            |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h        |   7 +
 drivers/gpu/drm/xe/xe_vsec.c             |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h             |   4 +
 11 files changed, 402 insertions(+), 101 deletions(-)

-- 
2.25.1

