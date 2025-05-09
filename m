Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5B1C3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 09:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEBF10E009;
	Fri,  9 May 2025 09:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVS2DR4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B358D10E009
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746784336; x=1778320336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b4/gCiiNWM1C9LRZW0Xouw81znTErt8yXD69HUd/Wt0=;
 b=JVS2DR4TPM+73W/TRQcjBXgwEXm8m3MCpMCWIOtCUBU9MWI4YJUyIyjB
 k1jmS//MeQtuDNFDCMpEhuElYVSNyvjc+UEOMJ+J0qw9OjBlMbO0PbS2M
 Zny1u1QMy635k27+i02tR3Mn+TqdypimjDtTBeeSanBt7GSWf6EnM/lMC
 tS6qM3eS+/PcO/fLQC/EqqTXsbR/SDdOXAogWyyx6iQM8VAiRiELq7xMF
 44oiBMB+lzzN/UfXe8INsKr6E6yMSa3I1a6U1hbZDm7hswwAvzOPy4LSx
 z1OmtVVGDkyRVyAcuJfMUpQTXbEhMVG3QhmyDTDui6yuae7fsBnCXoJBZ g==;
X-CSE-ConnectionGUID: hUo2kWb9TR69i/S8ApqvrQ==
X-CSE-MsgGUID: 8K47YKyCRki8cyf98AFYiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52414536"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="52414536"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:52:16 -0700
X-CSE-ConnectionGUID: Nsk6tV4dS7u9/i/h51CMdg==
X-CSE-MsgGUID: Wdqjd3t1RhOmUhJLJs/P9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136454803"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:52:13 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Fri,  9 May 2025 15:21:52 +0530
Message-Id: <20250509095157.340680-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add support manage power limits through pcode mailboxes.
Enable PL2 support through powerX_cap.
Expose PL2 interval through powerX_cap_interval.
Read energy status from PMT instead of MMIO.
Move power2_crit to power1_crit.

v2:
 - Addressed review comments from Badal.
 - Clamp the power limits maximum to BIOS default value due to
   HSD:16027383332.

v3:
 - Clamp power limit write also to BIOS default for platforms
   with mailbox support.
 - Enable power label if any of PL1 or PL2 is enabled.
 - Address review comments in v2.

RFC patch: https://patchwork.freedesktop.org/series/148148/

Karthik Poosa (5):
  drm/xe/hwmon: Add support to manage power limits though mailbox
  drm/xe/hwmon: Move card reactive critical power under channel card
  drm/xe/hwmon: Add support to manage PL2 though mailbox
  drm/xe/hwmon: Expose powerX_cap_interval
  drm/xe/hwmon: Read energy status from PMT

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  68 ++-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   6 -
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 485 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_vsec.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +
 12 files changed, 476 insertions(+), 136 deletions(-)

-- 
2.25.1

