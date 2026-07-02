Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCEBC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 09:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0234D10F255;
	Thu,  2 Jul 2026 09:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiFP6JY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24E010F255
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782983790; x=1814519790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuI1vGZPFSIYWIeVrpoWfN+QwH5mqOO5rpKMaUprh7E=;
 b=AiFP6JY17WWkzAgbpA0u+8wMil3w2xfhPjI8r4PWvidiR+Y9RBKA7pYH
 3bym7bcUWqJFVb8Wap+jQCubR7ibjrgtTc9gfOye7oB9X6blcTg/4fzZ4
 fqaEgUBF6NRqwjxGD2sjrFXKGoPOW+ZfuM/qPC4k62JHCbjM+OC12I6EY
 Bk3qyehuZ3P2PXrQ7aI28Rhb5N6khbFECPvMJq/HyjAZMGVCyx8a33ZIq
 um+uqAt3pz/rCUMm1z5ygxB+yJrByWnmp+3QPXAxj3qB+impkbZi9UvoG
 3OHJgGiV4j1FGrpixOjr/oxaixd9sYX/jpBq57N6UrVkLI4z039TZ1UDv A==;
X-CSE-ConnectionGUID: w2NivFfPSfW14bo5sgN7AQ==
X-CSE-MsgGUID: UVW+HupNTPGJRSZHOoo9kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82721012"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82721012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 02:16:30 -0700
X-CSE-ConnectionGUID: psypOCXTRJ64mDLhf/x7bA==
X-CSE-MsgGUID: hxxtsnC9Rz+QIzAKcFi61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="251082036"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 02:16:26 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 michael.j.ruhl@intel.com, matthew.d.roper@intel.com,
 soham.purkait@intel.com, michal.wajdeczko@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 1/2] drm/xe/pcode: Add support to get pcode version from PMT
Date: Thu,  2 Jul 2026 14:55:39 +0530
Message-Id: <20260702092540.1005095-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260702092540.1005095-1-karthik.poosa@intel.com>
References: <20260702092540.1005095-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
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

v4:
 - Address review comments from Michal.
 - Sort header files alphabetically.
 - Rename get_pcode_version() to xe_get_pcode_version().
 - Add kernel-doc for xe_get_pcode_version().
 - Use `xe_warn` and `xe_dbg` instead of `drm_warn` and `drm_dbg`.
 - Use %u for version print..
 - Prefix `struct pcode_version` with `xe_`.

 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_pcode.c    | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 240d57993ea6..a62ab05c6b4c 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -15,6 +15,8 @@
 #define	ENERGY_PKG			REG_GENMASK64(31, 0)
 #define	ENERGY_CARD			REG_GENMASK64(63, 32)
 
+#define PUNIT_VERSION_OFFSET		0xA0
+
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 866986694d9c..ccc3bdeed6bb 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -11,10 +11,14 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_pmt.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_vsec.h"
 
 /**
  * DOC: PCODE
@@ -350,3 +354,31 @@ int xe_pcode_probe_early(struct xe_device *xe)
 	return xe_pcode_ready(xe, false);
 }
 ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
+
+/**
+ * xe_get_pcode_version - Read pcode version via PMT telemetry
+ * @xe: xe instance
+ * @version: pointer to struct xe_pcode_version to store version info
+ *
+ * Reads the pcode version from PMT telemetry and fills the
+ * provided @version structure.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
+{
+	int ret = 0;
+
+	guard(xe_pm_runtime)(xe);
+
+	ret = xe_pmt_telem_read(xe->drm.dev,
+				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
+	if (ret != sizeof(*version)) {
+		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+	xe_dbg(xe, "pcode version major %u minor %u engg %u\n", version->major,
+	       version->minor, version->engg);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 18260c29e620..8fb3e4ba13a6 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -12,6 +12,12 @@ struct drm_device;
 struct xe_device;
 struct xe_tile;
 
+struct xe_pcode_version {
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
+int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
 
 #define xe_pcode_write(tile, mbox, val) \
 	xe_pcode_write_timeout(tile, mbox, val, 1)
-- 
2.25.1

