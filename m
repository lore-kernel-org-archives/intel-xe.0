Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0420C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 18:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659B110E168;
	Fri,  2 May 2025 18:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeFJtZRe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E09510E168
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746211142; x=1777747142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YlP8/xF0pzQHBNj3yiG64pqK2/uoVQokJ6jLD5jWTfQ=;
 b=EeFJtZRe+KgqW/kxTA9Q//K6x4FXyoGmPGkAZCI48c3NP1v+Q8t7j/0k
 3KGvXSaQ/5WUetIab77pQwOuEpoR3sb8f3JgMoNtAjHS3HoIMi86QNE2n
 ytXs+LT3cnVofD6rGXS9S6faSLHt5AmKNKPAzBdxMEAcx379+9ag2OOKv
 rfJeQf+OSUp5XnVbENYhKWccoxDvkAhgtItpW+my9GQAEQa3NVVNRqMQd
 ARtt3Sq+dLV4vyZiieIr7DcRCf+mEPpE1rqpr+gtdj11CmrrPE5rkoNMG
 iPU+HeikntnqX5t0MADGAP08fxiY9KJDz12mylzDsj6GqpxQjxIhBci3L A==;
X-CSE-ConnectionGUID: s4okBfSNThaPdK7bjKWx3Q==
X-CSE-MsgGUID: J5zVSYwRS82bxfFlvKpBEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="65306288"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="65306288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 11:39:02 -0700
X-CSE-ConnectionGUID: VD9369X/Si2YG8kQQCxM0w==
X-CSE-MsgGUID: nyjKxm1PSEq4C28y2TYvhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="139874036"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 02 May 2025 11:39:00 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 0/3] BMG PCIe link downgrade attributes and usage
Date: Sat,  3 May 2025 00:07:36 +0530
Message-Id: <20250502183739.3308069-1-raag.jadav@intel.com>
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

