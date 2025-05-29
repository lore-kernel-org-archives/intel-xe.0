Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3788AC5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 19:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D103910E745;
	Thu, 29 May 2025 19:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIq3fp7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D1910E76F
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748547099; x=1780083099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BsvD3qUSHrcGqc5r1l+B4eq4/7SKFg5Z/M8gBk13CMI=;
 b=QIq3fp7ORoDi9VcERvxKEZC0x6O8C84uouFFNb0KToW5sve3WiRA1iym
 SGBa7MTU2PH0wciBWpwtgWJVEo7rWkRpqjYRXKDRClQX0SphYEicnYEiU
 GSEvSgPKFGzIxsqaPN+qHKMyyECtRDeztTgfkg+rfnhI0vrJTSjL8uW7d
 2IapyMR2luCfZqgDalZXvgNMAtcRgatw2tPzaE8M2sD8T95qVpoQKX3ca
 Yv1F3XZXTcJvT6BUl/ScdaS+Ny2Sd94kaMnk81HKLoo26Dvhwnsj1qJKc
 VjRXDleakHfmG29A2jiXNnAj8/zLuWZc966ftidhlfFNpKNtumPA2cfKs Q==;
X-CSE-ConnectionGUID: LfZZvNE5SmGlD0GthU3g2w==
X-CSE-MsgGUID: 3nonzpDyRhWexb8aHesGyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68049949"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="68049949"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 12:31:38 -0700
X-CSE-ConnectionGUID: z8CdmrQ4TjanIfsStV0zvQ==
X-CSE-MsgGUID: CFgi+tj9R4+3YEQ5jaJoBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144642019"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 12:31:35 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH 1/3] Utility function and macro for telemetry reading
Date: Fri, 30 May 2025 00:56:18 +0530
Message-Id: <20250529192620.1227468-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529192620.1227468-1-soham.purkait@intel.com>
References: <20250529192620.1227468-1-soham.purkait@intel.com>
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

The changes in this patch is taken from
https://patchwork.freedesktop.org/series/149026/
Thay are  added only for compilation and does not
require review.
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 5 +++++
 drivers/gpu/drm/xe/xe_vsec.c     | 2 +-
 drivers/gpu/drm/xe/xe_vsec.h     | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index f45abcd96ba8..b1d4504e4adc 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -10,6 +10,11 @@
 #define BMG_PMT_BASE_OFFSET		0xDB000
 #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
 
+#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
+#define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
+#define ENERGY_PKG			REG_GENMASK64(31, 0)
+#define ENERGY_CARD			REG_GENMASK64(63, 32)
+
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index b378848d3b7b..a46e9580b1f4 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,7 +149,7 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
-static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
+int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
 			     u32 count)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index 5777c53faec2..6184b875e4b1 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -4,8 +4,13 @@
 #ifndef _XE_VSEC_H_
 #define _XE_VSEC_H_
 
+#include "linux/types.h"
+#include "linux/pci.h"
+
 struct xe_device;
 
 void xe_vsec_init(struct xe_device *xe);
+int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
+		      u32 count);
 
 #endif
-- 
2.34.1

