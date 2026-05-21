Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31AACD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 17:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A079E10E4E1;
	Thu, 21 May 2026 17:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qx5cZdLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8065410E4E1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 17:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385226; x=1810921226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dAYT+orHrRQJ8IpMgmwg/WVaSqw4M/GdHnRSlsVcvSI=;
 b=Qx5cZdLb4k006GfsAW4V1+Hfdo4svaW3Oi6QYmp/XmMj8dATYR4r3Gqf
 dZze/AAWnO+uCOgDi3VoPzrKzpS1ydB+xqIdCZB2NUU/3Ej/98aqnKNjP
 ue2xzIIm6ymVZJxm73UHFnRkcf56RkBBTWMpDOhQlZ2MLUwgNeEvP64hw
 aHbFV9F9KqwFaB/eiWD7wM4FFh3DMqMQiqfUrtcMnH2Rmhs9U5ETd/w8e
 nX+iRoFHZDEratvjOQrr8GTqf7F0mXXZKzM1pbrY5qHrkIEra/+wIffl+
 NTm1jACB4SEpZ0wjSSDewvWvIH4KNdmf96RCB3sfynlP130IJ+vNmIhHU g==;
X-CSE-ConnectionGUID: voKvGwPDSo23mrG7xFSmJw==
X-CSE-MsgGUID: z1a4WmLgSW2hHhetpGha7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="105772950"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="105772950"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:40:26 -0700
X-CSE-ConnectionGUID: 14kh103EQz+s201jCBl0NA==
X-CSE-MsgGUID: c8kpEMoITbisdfoOKy2NXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="236346013"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:40:23 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, michael.j.ruhl@intel.com,
 soham.purkait@intel.com, sk.anirban@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/2] drm/xe/pcode: Add support to get pcode version from PMT
Date: Thu, 21 May 2026 23:16:41 +0530
Message-Id: <20260521174642.1021590-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521174642.1021590-1-karthik.poosa@intel.com>
References: <20260521174642.1021590-1-karthik.poosa@intel.com>
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

Add api get_pcode_version() to read pcode version
from PMT telemetry.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_pcode.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 240d57993ea6..8a70e17912f3 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -15,6 +15,8 @@
 #define	ENERGY_PKG			REG_GENMASK64(31, 0)
 #define	ENERGY_CARD			REG_GENMASK64(63, 32)
 
+#define PUNIT_VERSION_OFFSET		(0xA0)
+
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index dc66d0c7ee06..1ebe622e947a 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -15,6 +15,8 @@
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
+#include "xe_vsec.h"
+#include "regs/xe_pmt.h"
 
 /**
  * DOC: PCODE
@@ -348,3 +350,19 @@ int xe_pcode_probe_early(struct xe_device *xe)
 	return xe_pcode_ready(xe, false);
 }
 ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
+
+int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
+{
+	int ret = 0;
+
+	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
+	if (ret != sizeof(*version)) {
+		drm_warn(&xe->drm, "couldn't get pcode version from pmt, ret %d\n", ret);
+		return ret;
+	}
+	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n", version->major,
+		version->minor, version->engg);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 490e4f269607..8dd472049921 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -12,6 +12,12 @@ struct drm_device;
 struct xe_device;
 struct xe_tile;
 
+struct pcode_version {
+	u16 minor;
+	u16 major;
+	u32 engg;
+};
+
 void xe_pcode_init(struct xe_tile *tile);
 int xe_pcode_probe_early(struct xe_device *xe);
 int xe_pcode_ready(struct xe_device *xe, bool locked);
@@ -22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
 			     u32 data1, int timeout);
+int get_pcode_version(struct xe_device *xe, struct pcode_version *version);
 
 #define xe_pcode_write(tile, mbox, val) \
 	xe_pcode_write_timeout(tile, mbox, val, 1)
-- 
2.25.1

