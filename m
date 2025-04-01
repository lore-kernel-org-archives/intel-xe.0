Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E713C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3444E10E083;
	Tue,  1 Apr 2025 15:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FffaEAUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D01910E083
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521764; x=1775057764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y71/VVB6+FiUQ2JljcwF7CHK8xdtsmHsibSeicQnRek=;
 b=FffaEAUArV3LGx32DFZXAJz5Soop4BCfS0zdimoMYKs/KVi6PXcn/NlC
 f2RW+J3FWUWyV3xaN+DCK6T9Qvc9k8YN3lVKK9Z4ZoG4Uurv8xiOIllMp
 o5O/2op6P0gYf8EW/wcTAnXkNZ7/aMqTxlnrm6U8nfzFmcwXVXrDJhuPG
 AwlToHT4pSaNTHaS50uLyGntGff708tzPqRZ17i0WunyFP5cF3LEY3cMk
 2fWdyPapWvW6qeX42t2mExFe+G/GAZO+lDTconyOetAig51z6X35x/lS9
 kVdv02OUFc8RCX57k14+9GadPdbEJV/mgR8bqyphJhFNp1Cf094nuPG58 Q==;
X-CSE-ConnectionGUID: 9vSJ7YolRRuc3SrDYIDwHA==
X-CSE-MsgGUID: /s31sAOgSm63stZi6Y94zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67324745"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67324745"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:04 -0700
X-CSE-ConnectionGUID: m/vp4MPWT0WHv3/2XXL3Ww==
X-CSE-MsgGUID: SuYRzfubRp+PubW2UpshRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126410715"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:00 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 00/12] VRAM Self Refresh 
Date: Tue,  1 Apr 2025 21:02:13 +0530
Message-ID: <20250401153225.96379-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

This revision has fixed the below review comment on RFC[1] series.

PCIe ACPI Patches:
- Break the _DSM {10, 11} Patch for different _DSM Method "D3cold Aux Power Limit", "PERST# Assertion Delay"
  (Bjorn Helgaas)
- Remove the Battlemage-specific language from commit log and Document that this implementation
  does not track and aggregate requests from all child devices `below the Downstream Port.
  (Bjorn Helgaas)
- Add Rev 3.3 along with Section in commit log.
- Address cosmetic review comment.
- Added a notifier block.

Xe Pacthes:
- %s/VRAM_/VRAM_SR/
  (Rodrigo)
- %s/d3cold.allowed/d3cold.target_state
  (Rodrigo)
- Add has_vrsr flag and refactor pci_acpi_aux_power_setup.
  (Rodrigo)
- Reorder the xe_d3_state enum.
  (Karthik)
- Use default VGA gpu to enable VRSR.


VRAM Self Refresh

This revision has fixed the below review cpmment on RFC[1] series.

PCIe ACPI Patches:
- Break the _DSM {10, 11} Patch for different _DSM Method "D3cold Aux Power Limit", "PERST# Assertion Delay"
  (Bjorn Helgaas)
- Remove the Battlemage-specific language from commit log and Document that this implementation
  does not track and aggregate requests from all child devices `below the Downstream Port.
  (Bjorn Helgaas)
- Add Rev 3.3 along with Section in commit log.
- Address cosmetic review comment.
- Added a notifier block.

Xe Patches:
- %s/VRAM_/VRAM_SR/
  (Rodrigo)
- %s/d3cold.allowed/d3cold.target_state
  (Rodrigo)
- Add has_vrsr flag and refactor pci_acpi_aux_power_setup.
  (Rodrigo)
- Reorder the xe_d3_state enum.
  (Karthik)
- Use default VGA gpu to enable VRSR.

[1] https://patchwork.freedesktop.org/series/145342/

Anshuman Gupta (8):
  PCI/ACPI: Add D3cold Aux Power Limit_DSM method
  PCI/ACPI: Add PERST# Assertion Delay _DSM method
  PCI/ACPI: Add aux power grant notifier
  drm/xe/vrsr: Detect VRSR Capability
  drm/xe: Add PCIe ACPI Aux Power notifier
  drm/xe/vrsr: Refactor d3cold.allowed to a enum
  drm/xe/pm: D3Cold target state
  drm/xe/vrsr: Enable VRSR

Badal Nilawar (4):
  drm/xe/vrsr: Introduce flag has_vrsr
  drm/xe/vrsr: Initialize VRSR feature
  drm/xe/vrsr: Enable VRSR on default VGA boot device
  drm/xe/vrsr: Introduce a debugfs node named vrsr_capable

 drivers/gpu/drm/xe/display/xe_display.c |  28 ++-
 drivers/gpu/drm/xe/display/xe_display.h |   2 +
 drivers/gpu/drm/xe/regs/xe_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_debugfs.c         |  20 ++
 drivers/gpu/drm/xe/xe_device_types.h    |  15 +-
 drivers/gpu/drm/xe/xe_pci.c             |  13 +-
 drivers/gpu/drm/xe/xe_pcode_api.h       |   8 +
 drivers/gpu/drm/xe/xe_pm.c              | 236 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h              |   9 +-
 drivers/pci/pci-acpi.c                  | 159 ++++++++++++++++
 include/linux/pci-acpi.h                |  26 +++
 11 files changed, 490 insertions(+), 29 deletions(-)

-- 
2.43.0

