Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA4606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIy7U88G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40D10F25E;
	Mon,  2 Nov 2026 22:13:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D948F10F270
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793657629; x=1825193629;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=h1Ja/zfviE8g1iElaWpiayGJSivtzF/ZVO1DN2jd3kQ=;
 b=AIy7U88GyZpIDOqaAqVi1HcIq1831zTUYo6fOUXd+l4YFoE8pQm7diWd
 KHBgjN/KmRN5K2Vi7LlRzufqwBwWdbIfZk+seFCZBY9xBwTXEYYMjTO6E
 +sqNE3g8hkqmOLIuQP0a3a7GL9T0wddext0AxU+2zrhqgfISOQhKoboXC
 gTFxoks5nQ7oEZDalpyHgmlLdRic5DaNMB9i6ekqlCa9Y54hUC8izVpsk
 bz0n730o5F1M57l5YbsQ2+p5SK33nrhHHJzcRz0OABVcp9wHi174uyIcO
 2PJZjxl9mKsSrE0pwIhs6WwrD2AZ5xMsJm4OJqNMmhOl0du+pzZEFoB8/ Q==;
X-CSE-ConnectionGUID: NZ5j6vpOQNC230+x4SRtCw==
X-CSE-MsgGUID: LLEGBcEzQh6DIP3DnsDfFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2255807"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2255807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 14:13:28 -0800
X-CSE-ConnectionGUID: QTFqeK35TwOvOndw3SZd4g==
X-CSE-MsgGUID: l1RFjk+zRNSbYNq0gsxyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6225227"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 14:13:28 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v13 14/16] drm/xe/vsec: Update PMT internal access
Date: Mon,  2 Nov 2026 14:13:26 -0800
Message-ID: <20261102221314.119028-32-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102221314.119028-18-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
index 8a470fe967d5..b56e4aad4069 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
@@ -19,7 +20,6 @@
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_hw_engine.h"
-#include "xe_mmio.h"
 #include "xe_pagefault.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -147,15 +147,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
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
@@ -294,13 +299,12 @@ static int pcode_info(struct seq_file *m, void *data)
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
@@ -314,7 +318,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
@@ -322,13 +326,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
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
@@ -340,7 +342,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e1d86719ff67..93e3b086a258 100644
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

