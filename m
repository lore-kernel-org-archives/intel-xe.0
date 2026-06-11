Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73E5CD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701E110F02D;
	Thu, 11 Jun 2026 16:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYy0FCWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C5010F02D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781196411; x=1812732411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X87JXE062ZUAl33XFUDKU35l5pQpuQQC3WudD4dmJEk=;
 b=NYy0FCWI3/e73moVz2TMypG+YwUssRxnYOM9Sj+EECOVfGhkoxxLu4VU
 npbRUl8ewlrJb7aEmMgtO81h7xfuzRWdd/JuYwoW1nRna1/9Q58vVbL09
 5FtsopV1mAM7baeR7xS7rusnneALgqkLT2rJOVxhN/8QoLQl/Oc5e5p8q
 /F03h8D0ju3yR4vqiFtYQVZ7U71dbpbei20tab7DE/9waWTBfPdFMpNiC
 RDuPWZGsj7yV3kiV45Dw3zlxhiN1MP+3/7ZY0vX61vY0Eyp+1BOAOH8ju
 iUscVX4SOXS+aviX8R8YKoLz2mchQ9hFvZ7usNcTA8Dl2L9MU95aWY6Hh g==;
X-CSE-ConnectionGUID: C7I+PSzXQNiCvQEjgGFqng==
X-CSE-MsgGUID: RA0emNmYT+G+S02aT67ZrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81150701"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81150701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:46:51 -0700
X-CSE-ConnectionGUID: khJ6p1o9Tiq7iCUTj0qGRA==
X-CSE-MsgGUID: PD6XYRtqRle0l3b1i4uc0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="244092016"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:46:48 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, soham.purkait@intel.com,
 michael.j.ruhl@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 1/2] drm/xe/pcode: Add support to get pcode version from PMT
Date: Thu, 11 Jun 2026 22:26:06 +0530
Message-Id: <20260611165607.3653019-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611165607.3653019-1-karthik.poosa@intel.com>
References: <20260611165607.3653019-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_pcode.c    | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  8 ++++++++
 3 files changed, 39 insertions(+)

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
index 866986694d9c..a68ea69f73b5 100644
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
@@ -350,3 +352,30 @@ int xe_pcode_probe_early(struct xe_device *xe)
 	return xe_pcode_ready(xe, false);
 }
 ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
+
+int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
+{
+	int ret = 0;
+
+	/*
+	 * BMG and CRI use a fixed PUNIT_VERSION_OFFSET. Attempting this access on other platforms
+	 * must be verified before enabling support.
+	 */
+	if (!(xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
+		drm_dbg(&xe->drm, "pcode version read from PMT not supported on this platform\n");
+		ret = -EOPNOTSUPP;
+	}
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
index 18260c29e620..e7cd08144a16 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -7,11 +7,18 @@
 #define _XE_PCODE_H_
 
 #include <linux/types.h>
+#include "xe_pm.h"
 
 struct drm_device;
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
@@ -22,6 +29,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
 			     u32 data1, int timeout);
+int get_pcode_version(struct xe_device *xe, struct pcode_version *version);
 
 #define xe_pcode_write(tile, mbox, val) \
 	xe_pcode_write_timeout(tile, mbox, val, 1)
-- 
2.25.1

