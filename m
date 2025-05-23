Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C44C54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7042A10E0A4;
	Fri, 23 May 2025 18:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzX+2+Au";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE8110E0A4
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026795; x=1779562795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gd3nxeskl+1e/UW3Q2boLJWQgtOmeyicUfEvA9zMX8o=;
 b=QzX+2+AuH2pO6slxiHBkwY43lksJxpiZEPOOvn7GLOPmnXHWKKETdlst
 EZmBqDzIzrvDOWQxQWzJlvn42lxfJDfVRrxRCsgOaaLOsgRx+kaAW/H3k
 AiqWP8XMwn9MNoDHnmLiRoOK9G+pTxHYU6ZP2gOFV+0aDKn2iBVJrFTs+
 xL/KPBGdiHuazsqmnCcmP0Mjn9mCSwxX7R2GSK337E620jT8aW0Gy7uyP
 IwcQGp7RZry2hiOt2PrB8KFk+fsP7IIU6Ixg7utf/NK1yXckVdUWCDYcr
 COmS9Qr8oiMdMKETMZA3N5rXJYLEELC/EuoyQEB7gjkcmv9IjFt+gkDEU g==;
X-CSE-ConnectionGUID: gJ/FyLcIQPuEoFTQTkVDtQ==
X-CSE-MsgGUID: eG7xUOF9RMSF7TOQqoGqdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61498405"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="61498405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:59:48 -0700
X-CSE-ConnectionGUID: ESAXp8dLSTu3fuTTRB37eQ==
X-CSE-MsgGUID: QTxSXvT0Ql2jmOlJ+O1DIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141758822"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 11:59:44 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH v3 00/11] VRAM Self Refresh 
Date: Sat, 24 May 2025 00:31:44 +0530
Message-Id: <20250523190155.2623462-1-badal.nilawar@intel.com>
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

This revision has fixed the below review comment on rev2 series.

PCIe ACPI Patches:
- dropped the notifier block code and added patch to allow only one Aux
  power limit request per root port (Rafael)
- Addressed Review comments (Rafael J. Wysocki, Bjorn Helgaas)

Xe Pacthes:
- Addressed Review comments (Bjorn Helgaas)



Anshuman Gupta (6):
  PCI/ACPI: Add D3cold Aux Power Limit_DSM method
  PCI/ACPI: Add PERST# Assertion Delay _DSM method
  drm/xe/vrsr: Detect VRSR Capability
  drm/xe/vrsr: Refactor d3cold.allowed to a enum
  drm/xe/pm: D3Cold target state
  drm/xe/vrsr: Enable VRSR

Badal Nilawar (5):
  PCI/ACPI: Per root port allow one Aux power limit request
  drm/xe/vrsr: Introduce flag has_vrsr
  drm/xe/vrsr: Initialize VRSR feature
  drm/xe/vrsr: Enable VRSR on default VGA boot device
  drm/xe/vrsr: Introduce a debugfs node named vrsr_capable

 drivers/acpi/scan.c                     |   1 +
 drivers/gpu/drm/xe/display/xe_display.c |  28 +++-
 drivers/gpu/drm/xe/display/xe_display.h |   2 +
 drivers/gpu/drm/xe/regs/xe_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_debugfs.c         |  20 +++
 drivers/gpu/drm/xe/xe_device_types.h    |  12 +-
 drivers/gpu/drm/xe/xe_pci.c             |  13 +-
 drivers/gpu/drm/xe/xe_pcode_api.h       |   7 +
 drivers/gpu/drm/xe/xe_pm.c              | 206 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pm.h              |   9 +-
 drivers/pci/pci-acpi.c                  | 167 +++++++++++++++++++
 include/acpi/acpi_bus.h                 |   2 +
 include/linux/pci-acpi.h                |  16 +-
 13 files changed, 456 insertions(+), 30 deletions(-)

-- 
2.34.1

