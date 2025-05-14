Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443A9C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F4A10E0C2;
	Wed, 14 May 2025 18:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpVzG6uz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EA010E0C2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747245907; x=1778781907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J0zpF8t4KPwyhF8d93DulPhXEu32sKfzZ984dqMhrmU=;
 b=jpVzG6uzXkyFQx2raKoinNezzqWbg/19s1wMcej3nGOoI0JGHDjEu+EV
 f7W5d7CahlE6bOW0i0JsSANPGZWmJLjc+3gogp2HdQ2dmGWjBSSydrsHy
 sLLULfvdE64CnsqpEoVgW0XM/ylPUx9nmgikoxHYCHXr940NwLnw3iF7U
 b5Xl/udGMwlSUYU7UHpgMHCsLvOsggPsO+HIJHUY+JErRvAGrqbGpbmab
 klqdzlr9NZTzKEsxl8kHhcER3zPSGzco2bcrfaajbM0libEPvPFtekEYz
 KiQMxkccYJ5Dq2e1iVIJoNf1A08LXx7+C5xpLg9pQho67DlJYM2MJOTaC w==;
X-CSE-ConnectionGUID: Pv2ecywPR62dbKFJjkC8iw==
X-CSE-MsgGUID: asnLRUiZSX2ZOExVco8zWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49298438"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49298438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:05:05 -0700
X-CSE-ConnectionGUID: SbbySR00Q56D4d1qKgc5nA==
X-CSE-MsgGUID: 4OeOPJA/QiC5tANd4a5XIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169192544"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:05:02 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v8 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT 
Date: Wed, 14 May 2025 23:34:50 +0530
Message-Id: <20250514180455.1622625-1-karthik.poosa@intel.com>
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

Patch series history:

https://patchwork.freedesktop.org/series/148148/ - RFC
https://patchwork.freedesktop.org/series/148506/
https://patchwork.freedesktop.org/series/148811/
https://patchwork.freedesktop.org/series/148819/
https://patchwork.freedesktop.org/series/148926/

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

