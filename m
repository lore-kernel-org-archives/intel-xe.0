Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2BBC3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA0D10E5FD;
	Wed, 14 May 2025 08:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CF4oy+BP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3132F10E241
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747210337; x=1778746337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CaUqQFcPSkDunQrnRt8F4outJd264o1SohJpocziMSc=;
 b=CF4oy+BP2uBdp0QyMOyjazZuGC2W9fhteYK5yX4ISDoGZt83HsWY9Mnf
 H0/LJ0DpNSnCJEhUJcu1spMe71jzSyGfDqxGkhCuGXSmbVrTarCzixpwP
 FLBpyjkA1QZp6eKWMvaURO7zRgy0Zd87/c6OHZhDyx0+iqTpQ23dzLQ/r
 gCOzhQxfQNf0eRKvmfxJZZDSukqI8NlnOhqHcCoFiAwM5TD0Hwmc2wqTz
 7qGnJ233Z4CLv3kIPI1SB9qFvSDqagGEtnnd/pxpdVmO5HYt2eb2Qjbpb
 zgukOIOGJs16d8jz5Gj1PxdGs6LebIbRXBGkuANUVuXDoKJ90n2c1xD74 A==;
X-CSE-ConnectionGUID: 5Mz3TuvmQtuBaRxAVUT47A==
X-CSE-MsgGUID: gWbMsHddTXq9YnbN6bEJKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48344086"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48344086"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:17 -0700
X-CSE-ConnectionGUID: G/oZBMJIRCO/b+tOXcL7ow==
X-CSE-MsgGUID: dPH7OvboS0Cm51IEs1bFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="137841686"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:14 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com
Subject: [PATCH 1/4] Utility function and macro for telemetry reading
Date: Wed, 14 May 2025 13:37:18 +0530
Message-Id: <20250514080721.265515-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514080721.265515-1-soham.purkait@intel.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
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
https://patchwork.freedesktop.org/series/148926/
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

