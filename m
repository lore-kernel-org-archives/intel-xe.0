Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB17C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1ED10F2D0;
	Thu,  2 Jul 2026 11:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXrJw9jE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD60310F2D0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990188; x=1814526188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PgZt5Po9g9eD5XUdy2YhJrMhDji3KC/T6S1T2Yr6hK4=;
 b=NXrJw9jEeCV6pdrFN4qE2QGzun93vKBk1cqO0MLXBbrkeKfiuCMx6oM7
 YhiS0riogkJRuQ3hkKn2sgPktK+Xb+jZDDlTbfZRdWguUdpdj3XpfgT9n
 uHpAhMQED4dJeAXHcLw9H+rMUAq13dH16hqVBGQTI/VyyiBPDJoGwD4NV
 5trOFn/a5cnGyyDNbFYOjyNx5LiicbRePnPUJK3nEq7MFzbKpQDbqdt3J
 VlDqb6Lq6Dhqco6fZymSjRszVl3kRtP8TYJ0LeKAW71QI274My2evZsYw
 4XZOB2kzTJ/Y23oiV2HAWtWM3SQBGZ/joLAzwu0LUP39zUlhK43Op45qV g==;
X-CSE-ConnectionGUID: o0VqDyY1RX+epaTVhq1Edw==
X-CSE-MsgGUID: 4PSmKKq8QCCdaQMoaaWdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82852906"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82852906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:03:08 -0700
X-CSE-ConnectionGUID: MWT8shsDSymlteCy4htLOQ==
X-CSE-MsgGUID: t0+ARzwmTmGYXTOvfw8iFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256738856"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:03:05 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [RFC PATCH 7/7] drm/xe/cper: Log CPER record for correctable errors
Date: Thu,  2 Jul 2026 16:44:09 +0530
Message-ID: <20260702111401.3680214-16-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702111401.3680214-9-badal.nilawar@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
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

In xe_ras_counter_threshold_crossed(), emit a CPER record for each
correctable error reported via the counter threshold crossed event.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_ras.c | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 8579cde6a4bf..53f192a2e97f 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -11,6 +11,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_sig_ids.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
 #include "xe_sysctrl_mailbox.h"
@@ -67,6 +68,10 @@ static const char *const xe_ras_components[] = {
 };
 static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
 
+static void emit_hw_error_cper(struct xe_device *xe,
+			       const struct xe_ras_error_class *error_class,
+			       u64 timestamp, u32 sig_id, u8 severity);
+
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
 	switch (severity) {
@@ -133,6 +138,38 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static u32 ras_comp_to_hw_sigid(u8 component)
+{
+	switch (component) {
+	case XE_RAS_COMP_DEVICE_MEMORY:
+		return XE_SIG_HW_DEVICE_MEMORY;
+	case XE_RAS_COMP_CORE_COMPUTE:
+		return XE_SIG_HW_CORE_COMPUTE;
+	case XE_RAS_COMP_PCIE:
+		return XE_SIG_HW_PCIE;
+	case XE_RAS_COMP_FABRIC:
+		return XE_SIG_HW_FABRIC;
+	case XE_RAS_COMP_SOC_INTERNAL:
+		return XE_SIG_HW_SOC_INTERNAL;
+	default:
+		return U32_MAX;
+	}
+}
+
+static u8 ras_sev_to_cper_sev(u8 ras_sev)
+{
+	switch (ras_sev) {
+	case XE_RAS_SEV_CORRECTABLE:
+		return CPER_SEV_CORRECTED;
+	case XE_RAS_SEV_UNCORRECTABLE:
+		return CPER_SEV_RECOVERABLE;
+	case XE_RAS_SEV_INFORMATIONAL:
+		return CPER_SEV_INFORMATIONAL;
+	default:
+		return CPER_SEV_RECOVERABLE;
+	}
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -154,6 +191,9 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 		severity = errors[id].common.severity;
 		component = errors[id].common.component;
 
+		/* Emit a CPER record for this error */
+		emit_hw_error_cper(xe, &errors[id], 0, ras_comp_to_hw_sigid(component), severity);
+
 		xe_warn(xe, "[RAS]: %s %s detected\n",
 			comp_to_str(component), sev_to_str(severity));
 	}
@@ -451,6 +491,41 @@ prepare_cper_error_info(struct xe_device *xe,
 	return einfo;
 }
 
+static void emit_hw_error_cper(struct xe_device *xe,
+			       const struct xe_ras_error_class *error_class,
+			       u64 timestamp, u32 sig_id, u8 severity)
+{
+	struct xe_ras_get_counter_response counter_response = {};
+	struct xe_cper_sec_intel_err_hdr ihdr = {};
+	struct xe_cper_sec_intel_error_info *einfo = NULL;
+	u32 einfo_size = 0;
+
+	if (get_counter(xe, error_class, &counter_response)) {
+		xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
+		return;
+	}
+
+	xe_cper_init_intel_err_hdr(xe,
+				   (const u8 *)error_class,
+				   timestamp,
+				   sig_id,
+				   counter_response.value,
+				   &ihdr);
+
+	if (counter_response.has_info_queue) {
+		einfo = prepare_cper_error_info(xe, &counter_response,
+						error_class, &einfo_size);
+		if (!einfo)
+			xe_err(xe, "[RAS]: CPER: failed to build einfo from info queue\n");
+	}
+
+	xe_cper_record_emit(xe, &guid_null,
+			    ras_sev_to_cper_sev(severity),
+			    INTEL_CPER_NOTIFY_GPU_ERROR,
+			    &ihdr, einfo, einfo_size);
+	kfree(einfo);
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
-- 
2.54.0

