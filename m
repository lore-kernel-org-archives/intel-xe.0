Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C52C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 15:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9210E355;
	Tue,  6 May 2025 15:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kz7mIWoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BD210E355
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746545470; x=1778081470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KuaaMylX2FR+JuQCq7TSDWkz7A9Aa5LYOLdBxy9errA=;
 b=Kz7mIWoR8qTQTiY/oShaeYGMUcm6E75bEb0KUmlNNQSvBtATSR0/HzOC
 fFPwbZRC3GXht3nb6F6MF4n+Z4PrZKaPNHIiDSMyi6PQ/PG9fYylFItUn
 Ol1KyZpb3hx0KiB1U1zXuaH5jeRVuc2TkjspOhdyfDJ3Li+x7/pegePNQ
 CZ3cpJ9kB9KIQjdXSrzICa+JjODK6NIYrdY5WDOY/L4JqYOqCebdGrMaB
 cg1HKuKHNMC1gYQU588aAcHenjFApktVgK6ls4/Gn8ePzDDUNV6oP0fyq
 /rguXXaMd7x/WVIF6nnIhCoW8mo5HxREyafc94U26/2KAOuOTbXR8UjZK w==;
X-CSE-ConnectionGUID: b6HYE2zHSdWRrkWrfP394Q==
X-CSE-MsgGUID: 9qq48UgeRZao5v9umIYvYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58884916"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58884916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:09 -0700
X-CSE-ConnectionGUID: azDNYve5Q22kVrYbMUwo8g==
X-CSE-MsgGUID: pUWoud/9TFuMGjMetyjO5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136656384"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:08 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Tue,  6 May 2025 21:00:53 +0530
Message-Id: <20250506153058.1389470-1-karthik.poosa@intel.com>
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

RFC patch: https://patchwork.freedesktop.org/series/148148/

Karthik Poosa (5):
  drm/xe/hwmon: Add support to manage power limits though mailbox
  drm/xe/hwmon: Move card reactive critical power under channel card
  drm/xe/hwmon: Add support to manage PL2 though mailbox
  drm/xe/hwmon: Expose powerX_cap_interval
  drm/xe/hwmon: Read energy status from PMT

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  64 ++-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   9 +-
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 475 +++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_vsec.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +
 12 files changed, 465 insertions(+), 133 deletions(-)

-- 
2.25.1

