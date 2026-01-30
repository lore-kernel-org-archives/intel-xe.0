Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4B9E6BF0D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 13:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B4510E146;
	Fri, 30 Jan 2026 13:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2zqPiOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FB410E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769780226; x=1801316226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uxc4BLSbUvRQ08teLQSVBdDF2Ugb/ucTh1s2BsbySvU=;
 b=U2zqPiOat+SApTHGSJEz+6pLQWQEuH9t1y61gsCQHsYnVp+c3DsDZBdk
 gvt1vTBA0MRuvb4qqqPYeM8P0Fl4Gc+aF9pIvdDBenBp9xG1HqtVpS9G5
 DvRvD/DRLsxpsHGy7usWghimk/2MXLS9M6+irBvkcySMSAiLEzkVjNxNr
 o8wi4tPFlm5o2FSNSVxXIFbt6X0hGqHiO10PmhuTDKD7Tr+dsG6d89o2b
 AapgqNl0khpDE/YrZ4bXVdpqJcH6g7Xd3uYJSgBc8vvz7pipoTfrwa1nX
 yamdSRU0Lo8Slb7bjWlRRdpnUdFCe1Hvr1JsXL1BXGHc1ddD6TTCKRIpM A==;
X-CSE-ConnectionGUID: 9RLbWRyWTN6Cghi2fbxESg==
X-CSE-MsgGUID: y3aZ02XRQgGN2ggc5VAw0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71194414"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71194414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:37:06 -0800
X-CSE-ConnectionGUID: QALi9TGQR1iHSOeQhtNfsw==
X-CSE-MsgGUID: EDj+p0ZRSSuvQbUzhW0nFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="207983263"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.170])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:37:04 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 5/5] drm/xe/vsec: Crescent Island PMT callbacks
Date: Fri, 30 Jan 2026 08:36:45 -0500
Message-ID: <20260130133639.765378-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130133639.765378-7-michael.j.ruhl@intel.com>
References: <20260130133639.765378-7-michael.j.ruhl@intel.com>
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

CRI PMT support requires callbacks to access the discovery status
and control areas.  Access is a common MMIO area that requires an
index to be set before access is allowed.

Introduce the necessary callbacks to get the status and control
information for CRI PMT usage.

Add the glue logic to register the CRI PMT functionality.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 83 ++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index c43b0d554ead..f55d9a292818 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -299,17 +299,88 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	return count;
 }
 
-static struct pmt_callbacks xe_pmt_cb = {
+/**
+ * xe_pmt_read_reg() - read a crashlog register
+ * @pdev: the pcie device that register the callback
+ * @guid: PMT guid of the crashlog instance
+ * @reg: data read from the PMT data structure
+ * @offset: which data to read from the PMT data structure
+ *
+ * Read the requested PMT register based on the pcie device and guid.  The
+ * supported struct is the Crashlog Type1 Version2.
+ *
+ * Currently this is for CRI only.
+ */
+static int xe_pmt_read_reg(struct pci_dev *pdev, u32 guid, u32 *reg, u32 offset)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	void __iomem *disc_addr = xe->mmio.regs;
+	u32 inst;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
+	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
+
+	guard(mutex)(&xe->pmt.lock);
+
+	xe_pm_runtime_get(xe);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	memcpy_fromio(reg, disc_addr, sizeof(*reg));
+
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static int xe_pmt_write_reg(struct pci_dev *pdev, u32 guid, u32 reg, u32 offset)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	void __iomem *disc_addr = xe->mmio.regs;
+	u32 inst;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
+	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
+
+	guard(mutex)(&xe->pmt.lock);
+
+	xe_pm_runtime_get(xe);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	memcpy_toio(disc_addr, &reg, sizeof(reg));
+
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static struct pmt_callbacks xe_bmg_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+};
+
+static struct pmt_callbacks xe_cri_pmt_cb = {
 	.read_telem = xe_pmt_telem_read,
+	.read_reg = xe_pmt_read_reg,
+	.write_reg = xe_pmt_write_reg,
 };
 
 static const int vsec_platforms[] = {
 	[XE_BATTLEMAGE] = XE_VSEC_BMG,
+	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
 };
 
 static enum xe_vsec get_platform_info(struct xe_device *xe)
 {
-	if (xe->info.platform > XE_BATTLEMAGE)
+	if (xe->info.platform > XE_CRESCENTISLAND)
 		return XE_VSEC_UNKNOWN;
 
 	return vsec_platforms[xe->info.platform];
@@ -337,8 +408,14 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
-		info->priv_data = &xe_pmt_cb;
+		info->priv_data = &xe_bmg_pmt_cb;
 		break;
+
+	case XE_VSEC_CRI:
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
 	default:
 		break;
 	}
-- 
2.52.0

