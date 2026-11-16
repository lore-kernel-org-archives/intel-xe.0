Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A045606A331
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UQ49oMm9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C2910E40B;
	Mon, 16 Nov 2026 15:07:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FD510EA0E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794841640; x=1826377640;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2E8J9ewhxz8k9ZKvBIUs1uorRqNr2ScS/zC9vMYDdrY=;
 b=UQ49oMm9fhxzAJuMnoczeYtPCp8U6YmJGCebucSwY/rJ1BpLU6/Qm6pB
 jeSaIOwuC+Sq1KKwAddKOddGR4pdR+kGDN4Vhv0GLteMj+3S5/yR7TYYf
 JW76rRyWtrfCl1s00LP1OjDV9prSM6c8KNeIdbSyEuLWpRV6NByS16UeR
 oO+aUuXQ3FY9MppaiUFecSB5VDc/RBxtSQ7Eyb797mP9FMv986Qh/Doha
 AdLwE5nsZh/J+HGzV51Wqr+1X0k0ZJNA8lV2HRZjH8/EDKdh2/l5cb7D1
 yhpe7ItGM4OgMpAdhhOQEI8gb73AYbDTDwYS0cpA3q9l8B0v3aqHX0QRh A==;
X-CSE-ConnectionGUID: Bh3j4YZzQOGf8DVJmqksSg==
X-CSE-MsgGUID: gBYqEQIoSrOfN0c/AhHaOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3611839"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3611839"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:07:01 -0800
X-CSE-ConnectionGUID: jd91TD5fSgSUXMqkKbfF3w==
X-CSE-MsgGUID: VKb5lE5kS2W4P8tSFqc7Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="11359434"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:07:02 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v16 11/17] drm/xe/vsec: Crescent Island PMT decode
Date: Mon, 16 Nov 2026 07:07:00 -0800
Message-ID: <20261116150649.368686-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116150649.368686-19-michael.j.ruhl@intel.com>
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index 4ecc2d9f3f38..a814d7151eea 100644
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

