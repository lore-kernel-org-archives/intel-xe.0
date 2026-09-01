Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06287C624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE64610EED2;
	Tue,  1 Sep 2026 19:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bb2mVEU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AC510EEC0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 19:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788290884; x=1819826884;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AMr2JL7wR6W8dEPkErueMj8WN+bpidsTjH99yyQCiVI=;
 b=bb2mVEU3KmwORlxsFXD0WNgoUx1gFks5ne3bgee+T0FxJy1dxUq5NsiJ
 goc0reCxRfTwy+CEDEqp6mBq5e3M/HRVYN0AyNxteSDPuw42iXki4J2O8
 uLmSLjuiioUhOR+71cKJ2LLA4dSxuMyzAX/z6u4Xomnvy+Zw3vegTwSvx
 natJCuP/XjI3W7e3TVh1KPIS+bEKtP3K46kVDo0ZuhP+xhydnyDbkyWPb
 yLFOkpXAFJHKkri5uLIby+h5PuDUv7FhqsiVloANjfdiiBg3D8Sv2pEqK
 O/pqGWbbrTW/5qjwn+KQprz9BSFoQYQGTxAD6SyCg8pS/57mIZIsXONtg A==;
X-CSE-ConnectionGUID: spcE6ftrS/akWN8Bnmmi3A==
X-CSE-MsgGUID: 0OZtGiNpRQ6btOnKq8qwHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762542"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="88762542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 12:28:03 -0700
X-CSE-ConnectionGUID: 0ody32s4Rxit60BtoywZCA==
X-CSE-MsgGUID: RFY64TUiRN+s+Oy5tnq+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269776796"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 12:28:03 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v4 14/18] drm/xe/vsec: Crescent Island PMT callbacks
Date: Tue,  1 Sep 2026 12:27:49 -0700
Message-ID: <20260901192736.626777-34-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 108 ++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index d95f4343c78d..e58fea788ace 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -333,17 +333,110 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	return ret == 0 ? count : ret;
 }
 
-static struct pmt_callbacks xe_pmt_cb = {
+/**
+ * xe_pmt_read_reg() - read a crashlog register
+ * @dev: the xe device that registered the callback
+ * @guid: PMT guid of the crashlog instance
+ * @reg: data read from the PMT data structure
+ * @offset: which data to read from the PMT data structure
+ *
+ * Read the requested PMT register based on the pcie device and guid.  The
+ * supported struct is the Crashlog Type1 Version2.
+ *
+ * Currently this is for CRI only.
+ */
+static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
+	int ret = 0;
+	u32 inst;
+	int idx;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&xe->pmt.lock);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	memcpy_fromio(reg, disc_addr, sizeof(*reg));
+
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+dev_exit:
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
+	int ret = 0;
+	u32 inst;
+	int idx;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&xe->pmt.lock);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	memcpy_toio(disc_addr, &reg, sizeof(reg));
+
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+dev_exit:
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static struct pmt_callbacks xe_bmg_pmt_cb = {
 	.read_telem = xe_pmt_telem_read,
 };
 
+static struct pmt_callbacks xe_cri_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+	.read_reg = xe_pmt_read_reg,
+	.write_reg = xe_pmt_write_reg,
+};
+
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
@@ -373,8 +466,17 @@ void xe_vsec_init(struct xe_device *xe)
 		if (IS_SRIOV_VF(xe))
 			return;
 		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
-		info->priv_data = &xe_pmt_cb;
+		info->priv_data = &xe_bmg_pmt_cb;
 		break;
+
+	case XE_VSEC_CRI:
+		if (IS_SRIOV_VF(xe))
+			return;
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
 	default:
 		break;
 	}
-- 
2.43.0

