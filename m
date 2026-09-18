Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC8C982E5
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967BF10E8C9;
	Fri, 18 Sep 2026 13:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeCVFY7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C1410F399
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789737487; x=1821273487;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mZknEHj2Aw/GVDXADarnR19tTpIT8YsMBsuTN0yH3RY=;
 b=KeCVFY7SFqsXFMMtEBphze/ff84EpzaeRA3hSnBTkW2XjPfkSo4dUdL4
 Lw3GEqveFyR1U0Yxk6opPN8NLjcnVAGy/VANxwx8qNqiCjEQvALju2tY9
 AoyHJYhftWd1w0LywBxJu5/xLj6H5cqORIlkzbjippLqSYFewfpYbykMH
 xH1onc1Wbvzn4R8N+J9VXWnazRIiEO+nPwE00/fGr5stWjgZGOeaQJn/F
 HKRMbKAQJxp0dHWUJ43ptWM511Q6hsYNlatrn7uEegA9dP66XDQoO76mk
 Jv9lg0+quMR0XqSWHj4C96e1eFrJBIcKk0rQ4OapXkgWapo1YgEo0bzSO Q==;
X-CSE-ConnectionGUID: TSVqq/xMS4CroaxLmfNlzw==
X-CSE-MsgGUID: BE9rLwfpTXKVYT9NiKYt3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378275"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89378275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: nFFtj4xCQN+S4ykbdM24+w==
X-CSE-MsgGUID: KrBw1zqlRiicDYTbmlqldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270095354"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:02 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v10 15/20] drm/xe/vsec: Crescent Island PMT decode
Date: Fri, 18 Sep 2026 06:18:06 -0700
Message-ID: <20260918131751.2408883-37-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 100 +++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index f20c1b5373aa..63ce9622d6b3 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -120,19 +120,25 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 /*
  * The GUID will have the following bits to decode:
  *   [0:3]   - {Telemetry space iteration number (0,1,..)}
- *   [4:7]   - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [4:7]   - BMG Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [4:5]   - CRI Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [6:7]   - CRI Instance
  *   [8:11]  - SOC_SKU
  *   [12:27] – Device ID – changes for each down bin SKU’s
  *   [28:29] - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
  *   [30:31] - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
  */
 #define GUID_TELEM_ITERATION	GENMASK(3, 0)
-#define GUID_SEGMENT		GENMASK(7, 4)
 #define GUID_SOC_SKU		GENMASK(11, 8)
 #define GUID_DEVICE_ID		GENMASK(27, 12)
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
+#define BMG_GUID_SEGMENT	GENMASK(7, 4)
+
+#define CRI_GUID_SEGMENT	GENMASK(5, 4)
+#define CRI_GUID_INSTANCE	GENMASK(7, 6)
+
 #define BMG_IDX_TELEM_PUNIT		0x00
 #define BMG_IDX_TELEM_OOBMSM		0x01
 #define BMG_IDX_CRASHLOG_PUNIT		0x02
@@ -143,6 +149,18 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 #define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
 #define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
 
+#define CRI_IDX_TELEM_DISCOVERY		0x00
+#define CRI_IDX_TELEM_PUNIT		0x01
+#define CRI_IDX_TELEM_OOBMSM		0x02
+#define CRI_IDX_CRASHLOG_PUNIT		0x03
+#define CRI_IDX_WATCHER_OOBMSM		0x03  /* PUNIT and OOBMSM share this index */
+#define CRI_IDX_CRASHLOG_OOBMSM		0x04
+
+#define CRI_PUNIT_WATCHER_OFFSET		0x08A0
+#define CRI_OOBMSM_WATCHER_OFFSET		0x0CF8
+#define CRI_OOBMSM_GFSP_TELEMETRY_OFFSET	0x1600
+#define CRI_PUNIT_CRASHLOG_OFFSET		0x0E60
+
 enum record_id {
 	PUNIT,
 	OOBMSM_0,
@@ -155,17 +173,10 @@ enum capability {
 	WATCHER,
 };
 
-static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
 	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
-	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
-
-	if (device_id != BMG_DEVICE_ID)
-		return -ENODEV;
-
-	if (cap_type > WATCHER)
-		return -EINVAL;
 
 	*offset = 0;
 
@@ -201,6 +212,75 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+static int cri_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 instance  = FIELD_GET(CRI_GUID_INSTANCE, guid);
+
+	*offset = 0;
+
+	if (cap_type == CRASHLOG) {
+		if (record_id == PUNIT) {
+			*index = CRI_IDX_CRASHLOG_PUNIT;
+			*offset = CRI_PUNIT_CRASHLOG_OFFSET;
+		} else {
+			*index = CRI_IDX_CRASHLOG_OOBMSM;
+		}
+		return 0;
+	}
+
+	switch (record_id) {
+	case PUNIT:
+		*index = CRI_IDX_TELEM_PUNIT;
+		if (cap_type == WATCHER)
+			*offset = CRI_PUNIT_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_0:
+		*index = CRI_IDX_TELEM_OOBMSM;
+		switch (instance) {
+		case 0:
+			if (cap_type == WATCHER) {
+				*index = CRI_IDX_WATCHER_OOBMSM;
+				*offset = CRI_OOBMSM_WATCHER_OFFSET;
+			}
+			break;
+
+		case 1:
+			if (cap_type == TELEMETRY)
+				*offset = CRI_OOBMSM_GFSP_TELEMETRY_OFFSET;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
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
 /**
  * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
  * @dev: valid Xe device
-- 
2.43.0

