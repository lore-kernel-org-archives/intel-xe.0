Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E606BC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 04:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5110E6CC;
	Wed, 30 Apr 2025 04:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5U3rANb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAEE10E6CC
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 04:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745987156; x=1777523156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6+ZUBwD3BQgN3qKLs2BkxqWcuVanQydF+dD3pU2NVA=;
 b=Q5U3rANbI7R0seNYztUX9FWOlrqmR1aRMni8SDp3MBS3SV8bQJJcfX/a
 WxQoLJHm/u60Q7hcUITWblnEMGpUrjDArLb9lTs49M4PUisl3pKDmyLHe
 gV35Ab6frjwkGjJ+ZFgP+lhRN5wv7j0qQLOEq7YQJse+EXEsTlHFuHSA7
 YvOYpI6mmuDY1xyQPPwQIx/I1RXTX30YgONzasfI0RITDRZuPz0dqTsUw
 Y+6Gd2VLtNQdO1aEQKhAZ017JYOXq34XEdwE9o6iexMJA0klEsctLzQAM
 LIFZ/VZNpKdKy61eZLId5NvSYN+pUoQ7g+QDXB0G8NpRUk1iYmz7bviRz w==;
X-CSE-ConnectionGUID: O8g9nk29QQaMOH3hG1a/DQ==
X-CSE-MsgGUID: Me2waGXyTI25/pG+AGSCWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="59009463"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="59009463"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 21:25:56 -0700
X-CSE-ConnectionGUID: S/sID+oQSOKeyP1bsJSfMQ==
X-CSE-MsgGUID: 7OcND3AISI62Cmz3/upsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138841579"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 21:25:53 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/3] BMG PCIe link downgrade attributes and usage
Date: Wed, 30 Apr 2025 09:54:16 +0530
Message-Id: <20250430042419.3256029-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series exposes sysfs attributes for BMG PCIe link downgrade
and documents their usage.

v1: https://patchwork.freedesktop.org/series/147023/

v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
    Rework macros and their naming (Rodrigo)

v3: Move xe_device_sysfs_init() to xe_device_probe() (Riana)
    Use sysfs_create_files() (Riana)
    Fix checkpatch warning (Riana)

v4: s/downspeed/downgrade (Lucas, Rodrigo, Riana)

v5: Use PCIe Gen agnostic naming (Rodrigo)

Raag Jadav (3):
  drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
  drm/xe: Expose PCIe link downgrade attributes
  drm/xe/doc: Wire up PCIe Gen5 limitations

 Documentation/gpu/xe/xe_firmware.rst |   6 ++
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 107 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
 drivers/gpu/drm/xe/xe_pm.c           |   2 +-
 6 files changed, 123 insertions(+), 3 deletions(-)

-- 
2.34.1

