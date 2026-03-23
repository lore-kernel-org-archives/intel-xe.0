Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED88F4613B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 15:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBB710E120;
	Mon, 23 Mar 2026 15:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dY06cVgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EAD10E120
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774278448; x=1805814448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dAYT+orHrRQJ8IpMgmwg/WVaSqw4M/GdHnRSlsVcvSI=;
 b=dY06cVgG+gw4xpDrTzWrI5tmzAU/GoB3sILZcppY6Ym+ofztQXX+IUZs
 183VZ6hyZnUKdyj0mJd1wCaRILWwXox0Fy/RXE71Ng2iS6m0CNhDd42IJ
 vhcsAj9xXS9hcEi1pkYXNQwTLDpgr/YIJ4DZgJL8FlIhO0AFVTHgT9gR2
 a+dqQoNIWYLgTx9ZuXGMe3bEaWmhpW0QBcCzZKOmwP/WJgsBlmprPuRpO
 /YH5O0tOpiyPqDiCdV/rH7udhrgENi2E91pm+5yq5uNak/QYUAoDcFqpr
 Dxq3mCAHJ28iGDEdvF1BlqtJSZafaJm/gyRmd1vMTKawta7MDwvmg88kF A==;
X-CSE-ConnectionGUID: Eg4kS9qlTQq/oCJzwSK0/Q==
X-CSE-MsgGUID: ZW/1JF+1S3Gq8lKZTgLiCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75300009"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75300009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:07:28 -0700
X-CSE-ConnectionGUID: yRJunO0pQL+UoJI+So+67g==
X-CSE-MsgGUID: yhuTJtSuRf2Xf3AaM2/Fww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254539546"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:07:26 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version from PMT
Date: Mon, 23 Mar 2026 20:43:30 +0530
Message-Id: <20260323151331.4043749-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260323151331.4043749-1-karthik.poosa@intel.com>
References: <20260323151331.4043749-1-karthik.poosa@intel.com>
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

