Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2789D2FED7
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 18:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F67310E0DF;
	Tue, 27 Jan 2026 18:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpFETQ7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058D710E5AD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769538280; x=1801074280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QFkjLgQb0+li7GPf7TMzFv0+9mmKInAwlmB2UuX/Mo0=;
 b=FpFETQ7+7n63+mf6Oy135Fp30tRzAAnVyMG4gIpT3P6cVFIKLKF4mRc5
 xRt3+gy3gJDpWkFQwgz39rjJZknU+Dl0eybKO5mnuasgBJYlXBoh5qvFS
 egXMVNXlwTfIilxC5eV5KJxmc6NRd0tuVxwHbpQkTT4GAlxoU0SastMho
 JWkbGLsdZJMf63kXeqFcGueBKV4rVh7s8bwoCidQIUzF5fxUk3pcDgbk0
 feFQi7/Y4Kpk5wVI2RKELG1Az1Gxwi3JW9yk72me4hfmxRouxk9Hek5NA
 0ytquUynkGbkG5SJjVP3o+6QRdW+J3pvi9LxVdkFpuqGZ4DRo+PfFrF78 w==;
X-CSE-ConnectionGUID: vBY4nawBS3ChuzuSYHnc6Q==
X-CSE-MsgGUID: NQpgfYFsTDW32JAGDrmZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70644447"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70644447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 10:24:40 -0800
X-CSE-ConnectionGUID: GeRFb7zNT2CGZt3DFodpXg==
X-CSE-MsgGUID: C56iMdZeTKaJfym1/8CFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208491698"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 10:24:38 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 4/5] drm/xe/vsec: Crescent Island PMT decode
Date: Tue, 27 Jan 2026 13:24:23 -0500
Message-ID: <20260127182418.640701-11-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127182418.640701-7-michael.j.ruhl@intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
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

Crescent Island (CRI) has different index and offset values for
accessing the PMT data area.

Update the decode path to support the CRI device.

Update the data read callback so to support the CRI usage.

Define several magic numbers.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 114 +++++++++++++++++++++++++++++------
 1 file changed, 96 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 254f7ebca6eb..4bddc22d86c7 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -116,10 +116,27 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
-#define PUNIT_TELEMETRY_OFFSET		0x0200
-#define PUNIT_WATCHER_OFFSET		0x14A0
-#define OOBMSM_0_WATCHER_OFFSET		0x18D8
-#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+#define BMG_IDX_TELEM_PUNIT		0x00
+#define BMG_IDX_TELEM_OOBMSM		0x01
+#define BMG_IDX_CRASHLOG_PUNIT		0x02
+#define BMG_IDX_CRASHLOG_OOBMSM		0x04
+
+#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
+#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
+#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
+#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
+
+#define CRI_IDX_TELEM_DISCOVERY		0x00
+#define CRI_IDX_TELEM_PUNIT		0x01
+#define CRI_IDX_TELEM_OOBMSM		0x02
+#define CRI_IDX_CRASHLOG_PUNIT		0x03
+#define CRI_IDX_CRASHLOG_OOBMSM		0x04
+
+#define CRI_PUNIT_TELEMETRY_OFFSET	0x0200
+#define CRI_PUNIT_WATCHER_OFFSET	0x00A0
+#define CRI_OOBMSM_0_WATCHER_OFFSET	0x04F8
+#define CRI_OOBMSM_1_TELEMETRY_OFFSET	0x1800
+#define CRI_PUNIT_CRASHLOG_OFFSET	0x0660
 
 enum record_id {
 	PUNIT,
@@ -133,44 +150,81 @@ enum capability {
 	WATCHER,
 };
 
-static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
 	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
-	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
 
-	if (device_id != BMG_DEVICE_ID)
-		return -ENODEV;
+	*offset = 0;
 
-	if (cap_type > WATCHER)
+	if (cap_type == CRASHLOG) {
+		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
+		return 0;
+	}
+
+	switch (record_id) {
+	case PUNIT:
+		*index = BMG_IDX_TELEM_PUNIT;
+		if (cap_type == TELEMETRY)
+			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
+		else
+			*offset = BMG_PUNIT_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_0:
+		*index = BMG_IDX_TELEM_OOBMSM;
+		if (cap_type == WATCHER)
+			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_1:
+		*index = BMG_IDX_TELEM_OOBMSM;
+		if (cap_type == TELEMETRY)
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
+		break;
+	default:
 		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cri_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
 
 	*offset = 0;
 
 	if (cap_type == CRASHLOG) {
-		*index = record_id == PUNIT ? 2 : 4;
+		if (record_id == PUNIT) {
+			*index = CRI_IDX_CRASHLOG_PUNIT;
+			*offset = CRI_PUNIT_CRASHLOG_OFFSET;
+		} else {
+			*index = CRI_IDX_CRASHLOG_OOBMSM;
+		}
 		return 0;
 	}
 
 	switch (record_id) {
 	case PUNIT:
-		*index = 0;
+		*index = CRI_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = PUNIT_TELEMETRY_OFFSET;
+			*offset = CRI_PUNIT_TELEMETRY_OFFSET;
 		else
-			*offset = PUNIT_WATCHER_OFFSET;
+			*offset = CRI_PUNIT_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_0:
-		*index = 1;
+		*index = CRI_IDX_TELEM_OOBMSM;
 		if (cap_type == WATCHER)
-			*offset = OOBMSM_0_WATCHER_OFFSET;
+			*offset = CRI_OOBMSM_0_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_1:
-		*index = 1;
+		*index = CRI_IDX_TELEM_OOBMSM;
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = CRI_OOBMSM_1_TELEMETRY_OFFSET;
 		break;
 	default:
 		return -EINVAL;
@@ -179,12 +233,30 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
+	if (cap_type > WATCHER)
+		return -EINVAL;
+
+	if (device_id == BMG_DEVICE_ID)
+		return bmg_guid_decode(guid, index, offset);
+
+	if (device_id == CRI_DEVICE_ID)
+		return cri_guid_decode(guid, index, offset);
+
+	return -ENODEV;
+}
+
 int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+	void __iomem *telem_addr = xe->mmio.regs;
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -193,6 +265,11 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	if (ret)
 		return ret;
 
+	if (device_id == BMG_DEVICE_ID)
+		telem_addr += BMG_TELEMETRY_OFFSET;
+	else
+		telem_addr += CRI_TELEMETRY_OFFSET;
+
 	telem_addr += offset + user_offset;
 
 	guard(mutex)(&xe->pmt.lock);
@@ -217,6 +294,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	xe->soc_remapper.set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
+
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.52.0

