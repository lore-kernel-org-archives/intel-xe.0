Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02DEC3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 05:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684CE10E1B5;
	Tue,  6 May 2025 05:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ka6Zvs+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C409B10E198
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 05:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746510615; x=1778046615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y4rTJlH+Yuxjy75VlhPH3r7j2BJZE2VIIwfC36aiH/w=;
 b=Ka6Zvs+mWpOgTfJVgxqX1Zz/dZLNRhKG/LGs7sJa+FuYI4GUsygpYBAy
 9xBypEueK3LnQ70pln1WxS61H3cOyZwESSM3THk4jvb3yKlSXNOea+SJR
 cLIIV7f/2AXmDKNEEfTcF6vIXdhehdQ2m4ESQ89okmHO/iOCYspzqGlLK
 0NterROwi2THQUA6+H4+9WuqtjEALqfTdNj2OoYD1GO4HDpTHyG7tkLby
 DoqXbCjKB3EK3q1GUMPSHPpvmtri8fNVo/xAZGFZQ1lnNP6RxOYdQzQSW
 X1DNqNTviUuhf+py4d1XVvmC2ZDRC+AnY+S5yQmpGqqeC8oGB6yhg/Ssc A==;
X-CSE-ConnectionGUID: 9KZkw+3VST2yuiitqgwJAA==
X-CSE-MsgGUID: qbayh6bTQWOj3XKurst+TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48029013"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="48029013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 22:50:13 -0700
X-CSE-ConnectionGUID: L+1Ew5v0TXSw1Nh0hXaYPA==
X-CSE-MsgGUID: ywiRlWM4SbSQviQT79DkAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="136473425"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 05 May 2025 22:50:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 0/3] BMG PCIe link downgrade attributes and usage
Date: Tue,  6 May 2025 11:18:32 +0530
Message-Id: <20250506054835.3395220-1-raag.jadav@intel.com>
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

v6: s/pcie_gen/auto_link (Lucas)

v7: Drop xe_pm_sysfs_init() and refactor d3cold.capable (Rodrigo, Riana)

Raag Jadav (3):
  drm/xe: Move xe_device_sysfs_init() to xe_device_probe()
  drm/xe: Expose PCIe link downgrade attributes
  drm/xe/doc: Wire up PCIe Gen5 limitations

 Documentation/gpu/xe/xe_firmware.rst |   6 ++
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 104 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
 drivers/gpu/drm/xe/xe_pm.c           |   8 +--
 5 files changed, 115 insertions(+), 13 deletions(-)

-- 
2.34.1

