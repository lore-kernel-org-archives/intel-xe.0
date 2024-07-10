Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C914DC3DA45
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 19:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A40A10E898;
	Wed, 10 Jul 2024 19:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfcR+b3R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4212410E898
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720639389; x=1752175389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qFE6M1cRHknxTI1jRqq/gJ7OtGVIwiCM2yCyCiKFy7M=;
 b=HfcR+b3RrUoC0Q57kBatnhZ4Y/8WU89PlsEyEQ0/APPmvBZYaY0tXkyz
 vMX/clEH4KGum6Cl8RNyvtWsdidmOn7zpyI0rwy1+tBd81aKHJkMlDWv4
 MJ/5fvL+OJkjm6E8jwHzdwIRez0e7c/J11K9KcNGw3+OBN+JMftMiEgAm
 UQUQmd59WyFrDH5Z2AOMCD5mpoNCBlfXOrFKnxnq1K3JpcbpvQh5pMJFV
 uWyWbZHwiDzCqViVshebODKIHv06INJ94hGvorYVV9eguKjAB2eTSgc7P
 zWWOmoQ17W3KsuKFUXkARxsBlYBsswCX3/r1tf1ZPDSXb/RYpzpW2cICj A==;
X-CSE-ConnectionGUID: MPC+0wRsTG2os1ah6Ut7RA==
X-CSE-MsgGUID: CQDhK8DuSRyW4sX4Ihkjgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17856468"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17856468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 12:23:09 -0700
X-CSE-ConnectionGUID: kCe+nP2sT+C2Hd2xIbEdgg==
X-CSE-MsgGUID: 3DGznG6YRoCbz7Ljp6hzig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="53483074"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 12:23:09 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v6 6/6] drm/xe/vsec: Add support for DG2
Date: Wed, 10 Jul 2024 15:22:47 -0400
Message-ID: <20240710192249.3915396-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
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

DG2 needs to adjust the discovery offset WRT the GT BAR not the
P2SB bar so add the base_adjust value to allow for the difference
to be used.

Update xe_vsec.c to include DG2 header information.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 98999d467db1..531ddd32a1a6 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -19,6 +19,16 @@
 
 #define SOC_BASE		0x280000
 
+/* from drivers/platform/x86/intel/pmt/telemetry.c */
+#define TELEM_BASE_OFFSET	0x8
+
+#define DG2_PMT_BASE		0xE8000
+#define DG2_DISCOVERY_START	0x6000
+#define DG2_TELEM_START		0x4000
+
+#define DG2_DISCOVERY_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_DISCOVERY_START)
+#define DG2_TELEM_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_TELEM_START)
+
 #define BMG_PMT_BASE		0xDB000
 #define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
 
@@ -32,6 +42,20 @@
 #define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
 #define SG_REMAP_BITS		GENMASK(31, 24)
 
+static struct intel_vsec_header dg2_telemetry = {
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 1,
+	.entry_size = 3,
+	.tbir = GFX_BAR,
+	.offset = DG2_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header *dg2_capabilities[] = {
+	&dg2_telemetry,
+	NULL
+};
+
 static struct intel_vsec_header bmg_telemetry = {
 	.length = 0x10,
 	.id = VSEC_ID_TELEMETRY,
@@ -48,10 +72,16 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 
 enum xe_vsec {
 	XE_VSEC_UNKNOWN = 0,
+	XE_VSEC_DG2,
 	XE_VSEC_BMG,
 };
 
 static struct intel_vsec_platform_info xe_vsec_info[] = {
+	[XE_VSEC_DG2] = {
+		.caps = VSEC_CAP_TELEMETRY,
+		.headers = dg2_capabilities,
+		.quirks = VSEC_QUIRK_EARLY_HW,
+	},
 	[XE_VSEC_BMG] = {
 		.caps = VSEC_CAP_TELEMETRY,
 		.headers = bmg_capabilities,
@@ -174,6 +204,7 @@ struct pmt_callbacks xe_pmt_cb = {
 };
 
 static const int vsec_platforms[] = {
+	[XE_DG2] = XE_VSEC_DG2,
 	[XE_BATTLEMAGE] = XE_VSEC_BMG,
 };
 
@@ -185,6 +216,49 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	return vsec_platforms[xe->info.platform];
 }
 
+/*
+ * Access the DG2 PMT MMIO discovery table
+ *
+ * The intel_vsec driver does not typically access the discovery table.
+ * Instead, it creates a memory resource for the table and passes it
+ * to the PMT telemetry driver. Each discovery table contains 3 items,
+ *    - GUID
+ *    - Telemetry size
+ *    - Telemetry offset (offset from P2SB BAR, not GT)
+ *
+ * For DG2 we know what the telemetry offset is, but we still need to
+ * use the discovery table to pass the GUID and the size. So figure
+ * out the difference between the P2SB offset and the GT offset and
+ * save this so that the telemetry driver can use it to adjust the
+ * value.
+ */
+static int dg2_adjust_offset(struct pci_dev *pdev, struct device *dev,
+			     struct intel_vsec_platform_info *info)
+{
+	void __iomem *base;
+	u32 telem_offset;
+	u64 addr;
+
+	/* compile check to verify that quirk has P2SB quirk added */
+
+	addr = pci_resource_start(pdev, GFX_BAR) + info->headers[0]->offset;
+	base = ioremap_wc(addr, 16);
+	if (!base)
+		return -ENOMEM;
+
+	telem_offset = readl(base + TELEM_BASE_OFFSET);
+
+	/* Use the base_addr + P2SB quirk to pass this info */
+	if (telem_offset < DG2_TELEM_OFFSET)
+		info->base_adjust = -(DG2_TELEM_OFFSET - telem_offset);
+	else
+		info->base_adjust = -(telem_offset - DG2_TELEM_OFFSET);
+
+	iounmap(base);
+
+	return 0;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
@@ -196,6 +270,7 @@ void xe_vsec_init(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	enum xe_vsec platform;
+	u32 ret;
 
 	platform = get_platform_info(xe);
 	if (platform == XE_VSEC_UNKNOWN)
@@ -206,6 +281,12 @@ void xe_vsec_init(struct xe_device *xe)
 		return;
 
 	switch (platform) {
+	case XE_VSEC_DG2:
+		ret = dg2_adjust_offset(pdev, dev, info);
+		if (ret)
+			return;
+		break;
+
 	case XE_VSEC_BMG:
 		info->priv_data = &xe_pmt_cb;
 		break;
-- 
2.44.0

