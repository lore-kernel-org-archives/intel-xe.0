Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382DD606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PV3of9+2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0863A10E80F;
	Thu, 29 Oct 2026 13:26:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAB31122BC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793280395; x=1824816395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29SGbDHBIxqAhjXWEGYUCmwbGuCRNFE349KUvcQ37bk=;
 b=PV3of9+2MRd7n7SFlp+q7vVkKr/MSvn87EWH+cfM4rBJC4JbIh/H6hlf
 9rpUnw+bFJZD3etsmGXOvGBBgE++nXJesErr+pFZVZBpJlBPz0Gctxhcl
 1QK8NROb+g4WpUjmSBGHeYxaZwVWqnTtoyaJf1kxtEPSAOuk45EtDUy4O
 hijlNyUwOshrb27R2lDTdaPx/IK/tXDyDt3MHbd8VzJvhHjOxBZNnpfjQ
 05fgswiy+ntSN4l3PG8G4UPcNZrTvx25Df0qz8Sa6EfIO1V5zLkzMT9IA
 21eVsC0iOHaarubLU+F9X5WrnvtJS/ddGpzRk2fXnTmBpva28fW0pwItK Q==;
X-CSE-ConnectionGUID: XS/Jl656QGG6h4EHbXzJ7Q==
X-CSE-MsgGUID: T8yp+BTtQP2M2Aj6IV7+fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900352"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900352"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:26:35 -0700
X-CSE-ConnectionGUID: fBwKzOpQSeaSet8Y2SopCA==
X-CSE-MsgGUID: kV8NPh8JRZSj06OfVFu5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5691699"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 06:26:31 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 4/6] drm/xe/cper: Support software CPER records
Date: Thu, 29 Oct 2026 18:56:14 +0530
Message-ID: <20261029132609.907017-12-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
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

Handle software SIGIDs in xe_cper_emit() by emitting
driver-notification CPER records. Include driver classification
details and the associated formatted log message in the record.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c | 41 +++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index e802f534eb45..ec61605d0a31 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -14,6 +14,8 @@
 #include <linux/time.h>
 #include <linux/timekeeping.h>
 
+#include "abi/xe_log_abi.h"
+
 #include "xe_cper.h"
 #include "xe_cper_types.h"
 #include "xe_device.h"
@@ -32,6 +34,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static bool is_sw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
 /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
 static const struct xe_device_guid_entry xe_device_guids[] = {
 	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
@@ -239,6 +246,37 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
 }
 
+#define XE_CPER_SW_MSG_MAX	256
+
+static size_t cper_format_sw_msg(struct va_format *vaf, char *buf, size_t size)
+{
+	return scnprintf(buf, size, "%pV", vaf) + 1;
+}
+
+static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			     u32 component, u32 location, const void *data,
+			     struct va_format *vaf)
+{
+	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_driver_error_class *driver = &ihdr.driver;
+	u64 timestamp = ktime_get_boottime_ns();
+	char msg[XE_CPER_SW_MSG_MAX];
+	size_t msg_len;
+
+	might_sleep();
+
+	driver->error_type = cper_sev;
+	driver->error_component = component;
+	driver->tile = location;
+	if (IS_ERR(data))
+		driver->cause = -PTR_ERR(data);
+
+	msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
+
+	cper_init_intel_hdr(xe, timestamp, sigid, 1, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+}
+
 /**
  * xe_cper_emit() - Emit a CPER record for a SIGID log entry
  * @xe: The &xe_device
@@ -272,7 +310,8 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		return;
 	}
 
-	/* TODO software CPER */
+	if (is_sw_sigid(sigid))
+		cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
 }
 
 static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
-- 
2.48.1

