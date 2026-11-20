Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77A606A335
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aOoIqB3x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1070B10E760;
	Fri, 20 Nov 2026 20:56:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01710E427
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 20:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795208177; x=1826744177;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oSGYNqOC1mFfgS+KeULfGVQeu0cTpI0kmdZMiAU38js=;
 b=aOoIqB3x6IxVnDKBVziVaVVFvRmBfqeKOhwPWW0Al2KUHV6JQwV97W0p
 8i8b7Y2iHU21rwmUtEDtJ1K/Fy3IC54MN9rTCnp2Nu0YQBfZ8vyo18TE3
 k59XCPIuUCk65Jlc2+Ary/Hyt9ybyJakN7Tfvj/N56WqSkKra6bpBg2QT
 UGnGSzw8wNk+LV+LoNFn6WHioTNWHu7xvFrZ4amw493mRYfmrr640lDGp
 67rJeq3hsHCLwnzymP343C69wK3YX0yVUQ4j7TLrH3gN/tddgSSfdr7an
 C7D8zPtQTpf1K7aM36AvlxbE/pA3CEQXiDRQb2lePsHQfFXv8ZvWSf6vH Q==;
X-CSE-ConnectionGUID: q5RPuDvhSoWEGbCK4hD69g==
X-CSE-MsgGUID: laStsctoRNCuAhAzKCEH8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136424"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: tryUI/89RpeGigB5jc0/4A==
X-CSE-MsgGUID: 9YnsRMQwThO61FixGbrlQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10908740"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:49 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v21 17/19] drm/xe/vsec: Update PMT internal access
Date: Fri, 20 Nov 2026 12:55:57 -0800
Message-ID: <20261120205540.1220643-38-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Current PMT internal access assumes BMG devices.

Use the new PMT GUID API to read the device specific guid.

Minor cleanup for a newly unused parameter (mmio).

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 26 ++++++++++++++------------
 drivers/gpu/drm/xe/xe_hwmon.c   | 10 ++++++++--
 drivers/gpu/drm/xe/xe_pcode.c   | 10 ++++++++--
 3 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 342182d5ecda..578ee973d159 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
@@ -21,7 +22,6 @@
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_hw_engine.h"
-#include "xe_mmio.h"
 #include "xe_pagefault.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -149,15 +149,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
 	}
 }
 
-static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
-				   u32 offset, const char *name, struct drm_printer *p)
+static void read_residency_counter(struct xe_device *xe, u32 offset, const char *name,
+				   struct drm_printer *p)
 {
 	u64 residency = 0;
+	u32 guid;
 	int ret;
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
-				&residency, offset, sizeof(residency));
+	ret = xe_vsec_get_guid(xe, &guid);
+	if (ret) {
+		drm_warn(&xe->drm, "PMT device is not available: %d\n", ret);
+		return;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
 		return;
@@ -296,13 +301,12 @@ static int pcode_info(struct seq_file *m, void *data)
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
-	struct xe_mmio *mmio;
 	struct drm_printer p;
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
 	guard(xe_pm_runtime)(xe);
-	mmio = xe_root_tile_mmio(xe);
+
 	static const struct {
 		u32 offset;
 		const char *name;
@@ -316,7 +320,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
@@ -324,13 +328,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
-	struct xe_mmio *mmio;
 	struct drm_printer p;
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
 	guard(xe_pm_runtime)(xe);
-	mmio = xe_root_tile_mmio(xe);
 
 	static const struct {
 		u32 offset;
@@ -342,7 +344,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 55ff56a39599..171990602f53 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -603,9 +603,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 
 	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
 		u64 pmt_val;
+		u32 guid;
 
-		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
+		ret = xe_vsec_get_guid(hwmon->xe, &guid);
+		if (ret) {
+			drm_warn(&hwmon->xe->drm, "PMT device is not available: %d\n", ret);
+			*energy = 0;
+			return ret;
+		}
+		ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 8c901e54f384..fa9f45d565cb 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -365,11 +365,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 {
 	int ret = 0;
+	u32 guid;
 
 	guard(xe_pm_runtime)(xe);
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
+	ret = xe_vsec_get_guid(xe, &guid);
+	if (ret) {
+		xe_warn(xe, "PMT device is not available: %d\n", ret);
+		return ret;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid,
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
 		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
-- 
2.43.0

