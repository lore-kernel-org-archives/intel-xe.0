Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98F9C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 15:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED8B10E814;
	Fri, 23 May 2025 15:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jijg6h8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380C10E814
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748012425; x=1779548425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mr97D9EToIlmO42iyhRxvhL31k8hi42U5L8FDkGBJKM=;
 b=jijg6h8tY743xu/6D8QUdZg0cjDAhnmHUk0IRkVieyv6Cb2TCkH5NaVn
 haeb4qN79ALc52hzUJrf7G5gbyWgZLG9ibdtkhn+2K/wQKGXFju3oJjRz
 zIApJ8tbnkPl1bUes2/+Dew2tneQPX6ohgJdJk78BcEv96KHeTkviO1A0
 y1J8yYXMC+y3ul7Fnakb3+rKaqQwojuFseF6KpNmqL1O2boAhRBcSBliz
 Laq55wRYPwnUCv558LM9MtL/i9Wh33h7szQKHLLhM+kM7Z3ar93A77fCU
 lVvF83G+koyeJ+XpBia6NvnnE/4rn9asExYBEUOnbTGsGeXb1hcfDtzhK g==;
X-CSE-ConnectionGUID: b3PIsqBzQOiAx7jokp/IRQ==
X-CSE-MsgGUID: lxnqTGzXRYCWAVaVznkdsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53880491"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="53880491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 08:00:24 -0700
X-CSE-ConnectionGUID: FzZP/MnbRFeKuGnE+3YnNA==
X-CSE-MsgGUID: JYbwDh8wSrSiaKoSqIlHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141594339"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 08:00:22 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v10 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Fri, 23 May 2025 20:30:09 +0530
Message-Id: <20250523150014.2101869-1-karthik.poosa@intel.com>
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
 drivers/gpu/drm/xe/xe_hwmon.c                 | 488 +++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_vsec.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +
 12 files changed, 477 insertions(+), 138 deletions(-)

-- 
2.25.1

