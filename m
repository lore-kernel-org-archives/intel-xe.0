Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C116BC369D7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 14:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E5910E136;
	Fri, 25 Apr 2025 14:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auavd4qL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1378F10E136
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745590061; x=1777126061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=exF9/+qSKatduki/o+biZVNA6SX9b5h0/3nwq/uj7bA=;
 b=auavd4qLBIeGrd22mGlx/oWYE8Z1tgtA2FgkHrJHi6qd2XNGQR0WkiM7
 P4n7nvenSwBjzV2LvUe4nQYqzMp46OnfoijcKrW6oWo3ZmTiLEzy748Gm
 SqL92HdX+pZjQQnBB+wQOxeQDOxxzH7/i/WVBsSLgyX3v7ch96oVUvqUG
 L20T0X2wCjdSQfGAwBFFkx2srvAoRlaXQzH+t5spsCdqPvYQtuI5JUqSo
 /bW25q1j4PQmkcybW/UNxGeYpVr3h/ITSIc0/TkTLiXX6uwMpIECStV0d
 NT3NZuKso7B3fYhcLTro/tx/O4SVBx7nmmJDd9euGN64hWMt9QZ1c515S w==;
X-CSE-ConnectionGUID: QYjJBHoETVSS25bYLEXDHA==
X-CSE-MsgGUID: wz5JMe0eT3+x0xRthfpBGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47345491"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47345491"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:07:40 -0700
X-CSE-ConnectionGUID: d06mOrlvSQiH2Wz1h+/c8g==
X-CSE-MsgGUID: t+qnUlAQTRKXIHhPYy/Fxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132900189"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2025 07:07:38 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Date: Fri, 25 Apr 2025 19:36:23 +0530
Message-Id: <20250425140626.3082588-1-raag.jadav@intel.com>
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

This series exposes sysfs attributes for BMG PCIe Gen5 downgrade and
documents their usage.

v1: https://patchwork.freedesktop.org/series/147023/

v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
    Rework macros and their naming (Rodrigo)

v3: Move xe_device_sysfs_init() to xe_device_probe() (Riana)
    Use sysfs_create_files() (Riana)
    Fix checkpatch warning (Riana)

v4: s/gen4_downspeed/gen5_downgrade (Lucas, Rodrigo, Riana)

Raag Jadav (3):
  drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
  drm/xe: Expose PCIe Gen5 downgrade attributes
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

