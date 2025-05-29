Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA89C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB7E10E75C;
	Thu, 29 May 2025 18:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnCjJBVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D288810E75C
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748541789; x=1780077789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BsvD3qUSHrcGqc5r1l+B4eq4/7SKFg5Z/M8gBk13CMI=;
 b=QnCjJBVPsA29tWEQq7wp+BB0HRoymmShH+XeiNAKWItq9dKqTYs4p615
 76H41QIlrak9ucC/m9SyjK56ir3JPjmrEhEXuxePh7PlWC6QETDTT4Gla
 NMfr+zic1IgqKU2qXzEypPirOIo69FOqmQFkK22lp9fVKL20YlzhWLh3D
 lZr/9cqBzhQUOqAqSmK3MdVuRNg6+JCeOk5K7LUDX9XWIbBy3W8nRoqD9
 KTr3N8ShbrTeVsOy8kIiYwJ/+YH/U6sGmYU+vm4UQUUgRx0qhMLCTpLe6
 QD7GglSg2uonSJrS+dYvLK14RE4DJdveg/XT8DMXt8GAcLueqCEdKSjnV g==;
X-CSE-ConnectionGUID: 7TBTEBF7S/GnHTGQTeuHBA==
X-CSE-MsgGUID: Ih+B4yIHQ0eB4nzGtUScsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50542947"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50542947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:08 -0700
X-CSE-ConnectionGUID: JtVcTEOqR2iHUXcGUM+8gg==
X-CSE-MsgGUID: ayYLYxUES2eNwV2miJzNdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143661815"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:06 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 1/3] Utility function and macro for telemetry reading
Date: Thu, 29 May 2025 23:27:50 +0530
Message-Id: <20250529175752.1222913-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529175752.1222913-1-soham.purkait@intel.com>
References: <20250529175752.1222913-1-soham.purkait@intel.com>
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

