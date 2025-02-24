Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C355C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 16:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1569E10E496;
	Mon, 24 Feb 2025 16:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUSvn+D3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DD610E480
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740415812; x=1771951812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PBOLO0GBx96JGT4qrXhptEiNiHxk8kr/C/IWh68LCnE=;
 b=lUSvn+D3rfs43hERl5i7agfziYy+Ffdal2sbWXM+4l6jP7OHTaP/CibC
 MAr/15DIOlmEsDzGj4qNtV4ZI/BtEs4cXtkx4bVIRzuYMy/6T2DROzUkU
 Ot4EF3f2MEXnDvk0OxTFCdl8xZdc4HuT5K7XE+LXxB10pHLm8abFXeU0v
 FIQGCZDu5DLhO/g+/7ctkuINUsa9QPcP7t575/rgtewp1nOexCF4UbC9x
 Pu/StVB+P7gk1DHoAezUqdIKhdY1g+SxdAK1vz6Gs+p9o3vGAW4t6R4B+
 wlD9hoeh0oXwVTSwQk2+z8bHq1gY93feDPT2t9r5Dk6tHnMAlpd6MPUUh A==;
X-CSE-ConnectionGUID: OJFewLTATv+fFP7S0jLQ2w==
X-CSE-MsgGUID: pofcMKZBRheOC1HJ+LgPhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41063171"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41063171"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:50:11 -0800
X-CSE-ConnectionGUID: xVfYQ1ZXS96ynZ/alvZgww==
X-CSE-MsgGUID: FHhZOsdXSW+BQ+FjHvPgNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="121032312"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:50:08 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, kam.nasim@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [RFC 0/6] VRAM Self Refresh
Date: Mon, 24 Feb 2025 22:18:43 +0530
Message-Id: <20250224164849.3746751-1-anshuman.gupta@intel.com>
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

Enabling VRAM Self Refresh on Intel BMG GPU.
VRAM Self Refresh feature requires XeKMD
to request for D3Cold Aux Power Limit and PERST
Assertion Delay by calling _DSM 10 and _DSM 11 method.

Reference: PCI Firmware Specification
Section {4.6.10, 4.6.11}.

Anshuman Gupta (5):
  PCI/ACPI: Implement PCI FW _DSM method
  drm/xe/vrsr: Detect vrsr capability
  drm/xe/vrsr: Refactor d3cold.allowed to a enum
  drm/xe/pm: D3Cold target state
  drm/xe/vrsr: Enable VRSR

Badal Nilawar (1):
  drm/xe/vrsr: Apis to init and enable VRSR feature

 drivers/gpu/drm/xe/display/xe_display.c |  22 +++
 drivers/gpu/drm/xe/display/xe_display.h |   1 +
 drivers/gpu/drm/xe/regs/xe_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h    |  10 +-
 drivers/gpu/drm/xe/xe_pci.c             |   4 +-
 drivers/gpu/drm/xe/xe_pcode_api.h       |   8 +
 drivers/gpu/drm/xe/xe_pm.c              | 185 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h              |   9 ++
 drivers/pci/pci-acpi.c                  | 123 ++++++++++++++++
 include/linux/pci-acpi.h                |  13 ++
 10 files changed, 358 insertions(+), 20 deletions(-)

-- 
2.34.1

