Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A900C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 11:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F95810EABF;
	Thu, 17 Apr 2025 11:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jptKsTKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E21E10E1E4
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744888442; x=1776424442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EM9dqmPnVtioMw5hPpGIrbmPtNXFk5SwWcOTIwMP4NU=;
 b=jptKsTKaRkFQMTI6TIxTVlOmtqsCqxuiDcSJO3EiCelaeCqIYSclWk+E
 zvZ1m/xk46ywxfTy0FlC3SYcLObdQfTl3YeZPIVWlJ1DsJKt0JuZd8hvR
 1Rq7tQMhlWfaPpRvU0KkVNIBJgKqXPrX40/45TU6/dH2miHrgZ7B3miuj
 eFBWArTLSViFzAEmclaHu+Pe7GieWU3e1zuDdTRY9a+TbANtVrKCpMwu2
 Mfau6BVgVZmqBlX3PSRCgcRH9/QnVfA63piExFQ0fJBI8wv7seuS5gt2L
 ctpE5PMrrIW1fIAPEKOIeVGtrIiYoUhaj0727GntuVgWCD/DUmL0+t56C g==;
X-CSE-ConnectionGUID: zCwV4aUKSXm8UFbVdbgRNQ==
X-CSE-MsgGUID: zIkt3u8ASFCQk4JPuOjBPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50279551"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="50279551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:13:57 -0700
X-CSE-ConnectionGUID: yfxkQsoPRLm/ENeqg+JZng==
X-CSE-MsgGUID: bIecLF1hQZKSpXkKAWcueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130764055"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2025 04:13:53 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/3] BMG PCIe Gen4 downspeed attributes and usage
Date: Thu, 17 Apr 2025 16:42:30 +0530
Message-Id: <20250417111233.2322000-1-raag.jadav@intel.com>
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

This series exposes sysfs attributes for BMG PCIe Gen4 downspeed
and documents their usage.

v1: https://patchwork.freedesktop.org/series/147023/

v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
    Rework macros and their naming (Rodrigo)

v3: Move xe_device_sysfs_init() to xe_device_probe() (Riana)
    Use sysfs_create_files() (Riana)
    Fix checkpatch warning (Riana)

Raag Jadav (3):
  drm/xe: s/xe_device_sysfs_init/xe_pm_sysfs_init
  drm/xe: Expose PCIe Gen4 downspeed attributes
  drm/xe/doc: Wire up PCIe Gen5 update limitations

 Documentation/gpu/xe/xe_firmware.rst |   6 ++
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 105 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
 drivers/gpu/drm/xe/xe_pm.c           |   2 +-
 6 files changed, 121 insertions(+), 3 deletions(-)

-- 
2.34.1

