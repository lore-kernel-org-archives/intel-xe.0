Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB511D2F33E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9146389E1D;
	Tue, 13 Jan 2026 16:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwbWLZ3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF3989E1D
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768321918; x=1799857918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=elOL5vf13bvux5sGmCgBwMWCcvFXHP/z36pbMRr677I=;
 b=AwbWLZ3BNDLOktBmfF1wUk+MrkjRIrFTKJcmaPfJw/GS6638h6GY92Xx
 Evgbi997xAm+3yVLEqMoJp0/ISteXT+uecgHswLuVAXHlFPyqblNde5Z2
 WC7rs8/fdelV15nLzOowkStXfieVTMkRbavZAHqkKZt1TIeJ4ikg3UJUI
 xqaye0sTGUCBjaXGP/5xgw6kk2Kjy5p9KVG4K32+n1YkkNM+o/ngcNJOn
 JATLQvCsduD/bVgP1HAUZ0Yc3JM0SKex6gOZxPNlpQrf/JoyADzr92MOH
 oHy31VjaSUDenJrqpORRpFFpBAEMLTzchvb+fgKcfM/sqXPfzrj7UdYU1 Q==;
X-CSE-ConnectionGUID: 03LObcEKTfuZdGcRTLkk0w==
X-CSE-MsgGUID: fgNQKTlpS7aY+Ah6EHwaNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69520983"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69520983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:31:58 -0800
X-CSE-ConnectionGUID: DAOd7/YiRayTyK8TA8RxQg==
X-CSE-MsgGUID: ci9wyHnURjSS6rWQ0y12ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204060102"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:31:54 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com, matthew.auld@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
Subject: [PATCH v6 00/12] VRAM Self Refresh 
Date: Tue, 13 Jan 2026 22:12:01 +0530
Message-ID: <20260113164200.1151788-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v6:
  - Addressed review comments from Rafael J. Wysocki.
  - Added now patch to refactor PM Sleep Ops

Changes in v5:
  - Added Co-developed by, whereever necessary
  - Addressed review comments 
  - Added new patch to handle vrsr in s2idle
    drm/xe/pm/s2idle: Don't evict user BOs for D3hot and D3cold-VRSR state  

Changes in v4:
  - Resolved build warnings

Changes in v3:
 PCIe ACPI Patches:
  - dropped the notifier block code and added patch to allow only one Aux
    power limit request per root port (Rafael J. Wysocki)
  - Addressed Review comments (Rafael J. Wysocki, Bjorn Helgaas)

 Xe Pacthes:
  - Addressed Review comments (Bjorn Helgaas)

Anshuman Gupta (6):
  PCI/ACPI: Add D3cold Aux Power Limit_DSM method
  PCI/ACPI: Add PERST# Assertion Delay _DSM method
  drm/xe/vrsr: Detect VRSR Capability
  drm/xe/vrsr: Refactor d3cold.allowed to a enum
  drm/xe/pm: D3cold target state
  drm/xe/vrsr: Enable VRSR

Badal Nilawar (6):
  drm/xe/vrsr: Introduce flag has_vrsr
  drm/xe/vrsr: Initialize VRSR feature
  drm/xe/vrsr: Enable VRSR on default VGA boot device
  drm/xe/pm: Refactor PM Sleep Ops
  drm/xe/pm/s2idle: Don't evict user BOs D3cold-VRSR state
  drm/xe/vrsr: Introduce a debugfs node named vrsr_capable

 drivers/gpu/drm/i915/display/intel_display.c |  22 ++
 drivers/gpu/drm/i915/display/intel_display.h |   1 +
 drivers/gpu/drm/xe/display/xe_display.c      |  11 +-
 drivers/gpu/drm/xe/display/xe_display.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   3 +
 drivers/gpu/drm/xe/xe_debugfs.c              |   2 +
 drivers/gpu/drm/xe/xe_device_types.h         |  12 +-
 drivers/gpu/drm/xe/xe_pci.c                  |  76 +++++-
 drivers/gpu/drm/xe/xe_pci_types.h            |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h            |   7 +
 drivers/gpu/drm/xe/xe_pm.c                   | 244 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_pm.h                   |  14 +-
 drivers/pci/pci-acpi.c                       | 196 +++++++++++++++
 include/linux/pci-acpi.h                     |  18 +-
 14 files changed, 564 insertions(+), 45 deletions(-)

-- 
2.52.0

