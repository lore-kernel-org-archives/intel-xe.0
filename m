Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219B606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cs0iErtl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AF710FEE9;
	Wed, 21 Oct 2026 16:25:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FF310FEE9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792599944; x=1824135944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lK6zF5NtDHiFwRB+JmqqwOyGHInid3Pw7eItZYLmbUc=;
 b=cs0iErtl+MiqZOcIQ/VboSYI2e+eiMBuGL4o38hUkhzL/boz5zjIFVvB
 1UxqxBF0K7gX8oljPr59L+0kd3rOtqhTiU490YKJV3qChnGpcScrsuift
 RSomujQfM6AFKY+PTqJ3VPFweDsi8YHmHPmtQH5LFMZQrvldoA+LSizrd
 5eWAwjO+dU/XdhyWVzoze0DodIdGpMX6cP/OLSF81XL7BGaz0RaXJBJ1W
 jq2PnM6H5oinjJpfZI1Y/xCwiW6oXzTWHLO/+mbgFzxf6H6cEHTFtY51l
 qfl1oZyIENM8s85MBCYZQzRPBTec7wZjCsK33z4IR2p3TCANNRuniCOAN Q==;
X-CSE-ConnectionGUID: HvvB8Y+ET3GsOhbOEMxYOg==
X-CSE-MsgGUID: EDKYHJLhQ9moEX2jr6NGWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1428307"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1428307"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:25:43 -0700
X-CSE-ConnectionGUID: OVj285l8RQ+iNCt8dYq7zg==
X-CSE-MsgGUID: M6L/et0PThyJ4IFLh6J5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3468951"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 09:25:40 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 4/5] drm/xe/cper: Add CPER support for software errors
Date: Wed, 21 Oct 2026 21:55:12 +0530
Message-ID: <20261021162508.265700-11-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CPER record generation for software SIGIDs through
xe_cper_emit_sw_err().

Store driver-specific information, such as severity,
component, location, and error cause, in the CPER error
class. Also attach the formatted log message to the CPER
record so that useful debugging information is preserved.

This allows driver-detected errors to be reported through
CPER, similar to hardware error reporting.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c | 90 +++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 1dab6ea93fea..cb4be6f3de7f 100644
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
@@ -27,6 +29,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static bool is_sw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
 static const struct xe_platform_id_entry xe_platform_ids[] = {
 	/* 0x674C  platform/8086:674c */
 	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
@@ -453,6 +460,84 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
 	xe_cper_emit_counter(xe, cper_sev, sigid, error_class, &resp);
 }
 
+#define XE_CPER_SW_MSG_MAX	256
+
+static size_t sw_format_msg(struct va_format *vaf, char *buf, size_t size)
+{
+	int len = snprintf(buf, size, "%pV", vaf);
+
+	return min_t(size_t, len + 1, size);
+}
+
+static void fill_cper_driver_error_class(struct xe_cper_driver_error_class *dst, int cper_sev,
+					 u32 component, u32 location, const void *data)
+{
+	dst->error_type = cper_sev;
+	dst->error_component = component;
+	dst->tile = location;
+
+	if (IS_ERR(data))
+		dst->cause = -PTR_ERR(data);
+}
+
+static struct xe_cper_sec_intel_error_info *
+build_sw_einfo(const union xe_cper_error_class_u *uec, struct va_format *vaf,
+	       u64 timestamp, u32 *einfo_size)
+{
+	struct xe_cper_sec_intel_error_info *einfo;
+	struct xe_intel_priv_event_entry *entry;
+	char msg[XE_CPER_SW_MSG_MAX];
+	size_t msg_len;
+	u32 queue_len;
+
+	msg_len = sw_format_msg(vaf, msg, sizeof(msg));
+
+	queue_len = offsetof(struct xe_intel_priv_event_entry, metadata) + msg_len;
+
+	einfo = kzalloc_flex(*einfo, event_queue, queue_len);
+	if (!einfo)
+		return NULL;
+
+	einfo->error_count        = 1;
+	einfo->event_queue_length = queue_len;
+	einfo->event_queue_count  = 1;
+	einfo->error_class = uec->ras;
+
+	entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
+	entry->entry_length = msg_len;
+	entry->timestamp    = timestamp;
+	memcpy(entry->metadata, msg, msg_len);
+
+	*einfo_size = struct_size(einfo, event_queue, queue_len);
+	return einfo;
+}
+
+static void xe_cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+				u32 component, u32 location, const void *data,
+				struct va_format *vaf)
+{
+	struct xe_cper_sec_intel_error_info *einfo;
+	struct xe_cper_sec_intel_err_hdr ihdr = {};
+	u64 timestamp = ktime_get_boottime_ns();
+	union xe_cper_error_class_u uec = {};
+	u32 einfo_size = 0;
+
+	might_sleep();
+
+	fill_cper_driver_error_class(&uec.driver, cper_sev, component, location, data);
+
+	einfo = build_sw_einfo(&uec, vaf, timestamp, &einfo_size);
+	if (!einfo)
+		return;
+
+	ihdr.error_class = uec.ras;
+	xe_cper_init_intel_err_hdr(xe, timestamp, sigid, 1, &ihdr);
+	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr,
+			    einfo, einfo_size);
+
+	kfree(einfo);
+}
+
 /**
  * xe_cper_emit() - Emit a CPER record for a SIGID log entry
  * @xe: The &xe_device
@@ -479,7 +564,10 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		return;
 	}
 
-	/* TODO software CPER */
+	if (is_sw_sigid(sigid)) {
+		xe_cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
+		return;
+	}
 }
 
 static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
-- 
2.48.1

