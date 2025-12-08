Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA55BCEBF88
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 05:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748A010E091;
	Mon,  8 Dec 2025 05:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDDhs7GT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE9510E091
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 05:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765171791; x=1796707791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2bmZ43wQL/Xi/yFtd6BoLzKE86Cc32EBKWkUgCnf/Mk=;
 b=nDDhs7GTOFGz2L8U5WwFh6aDUVjlHgzrTjju6k5+lsNo9ph/P4zwwPWJ
 LcI0lTuX3qj4LCjAKdcWzBc3AeCTnBPu7LlZFujak4ySaeJ0I0iUbDaMn
 WG8KAhgXGHO6oEZhFIYecKmOxaWP69MW2iew6HRuM9hgmfsrudKhEF74x
 TLnA+H4iOoUYyuBQtixKoocOitLbl9dItxdmodCuR0asEQi45kLjoepDe
 NnL9U3ZL9ImARQ31zfRRDQNTnl7a/m2xcQoStaliidBQZVErAu1bgz+eT
 95E+7/HT5/4V1s6cgnd0Sv5BGnUMc5xEMUxbOkomm6agKDYBt9PERmekQ g==;
X-CSE-ConnectionGUID: uro0f0C0TNm7yOdaymOrug==
X-CSE-MsgGUID: KIvstazDTS6PaPjMDd7Yeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77431864"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="77431864"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 21:29:51 -0800
X-CSE-ConnectionGUID: UVGtW7frRBSjR9+r38Ha0A==
X-CSE-MsgGUID: D3xT3kAWS2OA1CbVCjLA8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="233216567"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 21:29:49 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/pcode: Add support to get pcode version
Date: Mon,  8 Dec 2025 10:59:41 +0530
Message-Id: <20251208052941.3635041-1-karthik.poosa@intel.com>
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

Add api get_pcode_version() to read pcode version
from PMT telemetry.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_pcode.c    | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 0f79c0714454..8cbf51834457 100644
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
index 0d33c14ea0cf..85d54147c636 100644
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
@@ -377,4 +379,19 @@ int intel_pcode_request(struct drm_device *drm, u32 mbox, u32 request,
 	return xe_pcode_request(tile, mbox, request, reply_mask, reply, timeout_base_ms);
 }
 
+int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
+{
+	int ret = 0;
+
+	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+				(u64 *)version, PUNIT_VERSION_OFFSET,	sizeof(u64));
+	if (ret != sizeof(u64)) {
+		drm_warn(&xe->drm, "couldn't get pcode version from pmt, ret %d\n", ret);
+		return ret;
+	}
+	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n", version->major,
+		version->minor, version->engg);
+	return 0;
+}
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index a5584c1c75f9..87a4f490508e 100644
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

