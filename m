Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABC5CD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680B710F53E;
	Fri, 19 Jun 2026 11:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dICVgEsm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E1910F53E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 11:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781868662; x=1813404662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BfzV5qRHcmZVn0yZ1bCavXUQ4dgnj0+xCpMfgcfY0XY=;
 b=dICVgEsmOjofqXe99ZqmjOxdVFT6IP6mFhf4PVL398Fol2M7yI5dqP1o
 wANmlbPSsfZH2q4BsXBgyGcpEYjjj9yqG3zpT8q4dcrTxvYPPDo8WSVB8
 sPHB1aK8IIrVcq8pS1aeEaJ7Bu1492Qe2DP8riGd2qWtNpCohoDd43wzw
 1k2x5aVk8UEmtydonApZuKzdGfz2iIOOk9+paPNWKBjYiQWxQ84u+6vYS
 8cuPMyL4afhUlNkbk6JtFQPyLZL05fmTmcuhpd6TIxVwL7HcUolTzD50D
 aWc2j1yw/eGeDu83WKzb0m8hSVnwo1H2XjTQkDHSf9meloXJnVnmjxiEF g==;
X-CSE-ConnectionGUID: V5wR78zvTyidME+YdScwuA==
X-CSE-MsgGUID: 3oRtH69BTs2ZN6Pm3pG9HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81822749"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81822749"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:31:02 -0700
X-CSE-ConnectionGUID: OeRftA19RgO2OtTYnoY4/Q==
X-CSE-MsgGUID: tv2kBeISTIySEzr0IhZuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="247470134"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:31:00 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 michael.j.ruhl@intel.com, matthew.d.roper@intel.com,
 soham.purkait@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 1/2] drm/xe/pcode: Add support to get pcode version from PMT
Date: Fri, 19 Jun 2026 17:10:17 +0530
Message-Id: <20260619114018.667995-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619114018.667995-1-karthik.poosa@intel.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
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

Add api get_pcode_version() to read pcode version from PMT telemetry.
Add PUNIT_VERSION telemetry offset in xe_pmt.h.

v2:
 - Pass struct device* instead of struct pci_dev* as xe_pmt_telem_read()
   got updated.
 - Support pcode version read from PMT only on BMG and CRI platform as
   PUNIT_VERSION_OFFSET is currently fixed for these platforms. (Micheal)
 - Use scope based runtime PM to wakeup device before PMT read.
 - Update commit message.

v3:
 - Move the platform check to xe_debugfs.c where the debugfs entries are
   created.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_pcode.c    | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 3 files changed, 30 insertions(+)

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
index 866986694d9c..185d242b642e 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -15,6 +15,9 @@
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
+#include "xe_vsec.h"
+#include "regs/xe_pmt.h"
+#include "xe_pm.h"
 
 /**
  * DOC: PCODE
@@ -350,3 +353,21 @@ int xe_pcode_probe_early(struct xe_device *xe)
 	return xe_pcode_ready(xe, false);
 }
 ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
+
+int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
+{
+	int ret = 0;
+
+	guard(xe_pm_runtime)(xe);
+
+	ret = xe_pmt_telem_read(xe->drm.dev,
+				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
+	if (ret != sizeof(*version)) {
+		drm_warn(&xe->drm, "pcode version read from PMT failed, ret %d\n", ret);
+		return ret;
+	}
+	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n", version->major,
+		version->minor, version->engg);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 18260c29e620..e496135b8fa2 100644
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
 int xe_pcode_init_early(struct xe_tile *tile);
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

