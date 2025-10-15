Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47586CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1253410E74B;
	Wed, 15 Oct 2025 08:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzmbRsL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2D010E74B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760515346; x=1792051346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oMfFYXvGiE25w2JX2q/A2uGGYX6++XuGoMMS7Ksqkag=;
 b=CzmbRsL+4qh95E06F8f3PcRoDmPMrBZaTP24gSJlDQLklVp8Upj/W20n
 HuRicCUH5NEeMeda8KKha1DZU8PpGlVGXyLsdOZ9MH+aeyCeMBqlF7Bak
 WvYLbfbp1SS72d2lZGo//euKP2gbq1jmUFH2UTHKZi2Dmb/gJQAPq6QwD
 /gAehIGlAKtnWbCBhg4EhPmF9hUpjGjHNRcfd1bfNxSGqiuUyTzQ5RHbo
 ANwjxoo/Nk0SUsJIP+yqzOE/B61do7N7SR7Xj+FijOK7QJ5i1ePx2vGuu
 0qBfr3oY4AIObTu48PlrDHUJLruVXEWoAkEH8tXq8KSDHvpKDBfUBIHhu Q==;
X-CSE-ConnectionGUID: xYfTJeopQNmkAI95jk5qHg==
X-CSE-MsgGUID: t2ez+YaAT8KJ1k9uuA18xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61891426"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="61891426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:02:25 -0700
X-CSE-ConnectionGUID: xYZcdeLmSUCKMRXlV+YtwQ==
X-CSE-MsgGUID: AOazhnw0QW64pO9/LqTH7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205805322"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:02:21 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v5 00/12] VRAM Self Refresh 
Date: Wed, 15 Oct 2025 13:36:58 +0530
Message-Id: <20251015080710.1468409-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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
  PCI/ACPI: Per Root/Switch Downstream Port allow one aux power limit
    request
  drm/xe/vrsr: Introduce flag has_vrsr
  drm/xe/vrsr: Initialize VRSR feature
  drm/xe/vrsr: Enable VRSR on default VGA boot device
  drm/xe/pm/s2idle: Don't evict user BOs for D3hot and D3cold-VRSR state
  drm/xe/vrsr: Introduce a debugfs node named vrsr_capable

 drivers/acpi/scan.c                          |   3 +
 drivers/gpu/drm/i915/display/intel_display.c |  22 ++
 drivers/gpu/drm/i915/display/intel_display.h |   1 +
 drivers/gpu/drm/xe/display/xe_display.c      |  11 +-
 drivers/gpu/drm/xe/display/xe_display.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   3 +
 drivers/gpu/drm/xe/xe_debugfs.c              |   3 +
 drivers/gpu/drm/xe/xe_device_types.h         |  12 +-
 drivers/gpu/drm/xe/xe_pci.c                  |  12 +-
 drivers/gpu/drm/xe/xe_pci_types.h            |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h            |   7 +
 drivers/gpu/drm/xe/xe_pm.c                   | 231 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h                   |  10 +-
 drivers/pci/pci-acpi.c                       | 189 +++++++++++++++
 include/acpi/acpi_bus.h                      |   3 +
 include/linux/pci-acpi.h                     |  18 +-
 16 files changed, 494 insertions(+), 34 deletions(-)

-- 
2.34.1

