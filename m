Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9138606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPHLoiPP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05B711223B;
	Thu, 29 Oct 2026 11:37:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B6911223B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273844; x=1824809844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6g3fn10sHCbg1laasGC39QqUXHaFhRGFspEiV2rhH8=;
 b=mPHLoiPPnlywrVA237nDIgLQMIHyfMTSshT1o+HOalDOZ4BT7mro7XaD
 IwTkCkvvSGE79Nc/I6/lm4chHCzdTPqhnOn5HvWFHJUphfa4PAsOTsrDu
 ys1rqimiHSPqjABMHBM1GHNjOfbLmDpoMVu3/BnGHbTvicGWqZ+IbVCWi
 FI4gdmMoOWOW8P+9Ong55wEVN6SbxNs4Y5S3Ejg9Ou01tpvBYsAMindXz
 g72jGKzri08/dPoYwcgaoQGSnWGEu0XBqHv3KYAOnNujXTt3kSm5lA5Oi
 9P1XMzdym1a/E0o9BMxMYrOIlbQBU8hR2Um4M4Kg5QcjS8fmtSs7pNGZ5 A==;
X-CSE-ConnectionGUID: YAz6DBJlRY20b+qBXWPEgg==
X-CSE-MsgGUID: rMTFGCovTh+BueQUjB8Xpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2026503"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2026503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:37:24 -0700
X-CSE-ConnectionGUID: A1TYDFmBQWG32hOg5+hjuQ==
X-CSE-MsgGUID: TFlqjhmjSlizx5SJQaCBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5659129"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:37:19 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v8 06/10] drm/xe/cper: Emit cper record to trace buf
Date: Thu, 29 Oct 2026 17:07:00 +0530
Message-ID: <20261029113653.1860286-18-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029113653.1860286-12-badal.nilawar@intel.com>
References: <20261029113653.1860286-12-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add the xe_error_cper tracepoint and emit each assembled CPER record
through it. Besides the raw record, the event carries the device name,
platform ID, FRU ID, severity and the Intel error section header, so
tools can pick up the records from the trace buffer.

Assisted-by: LLM
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |  3 +-
 drivers/gpu/drm/xe/xe_cper.c       | 15 ++++++-
 drivers/gpu/drm/xe/xe_trace_cper.c |  9 +++++
 drivers/gpu/drm/xe/xe_trace_cper.h | 65 ++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 655487a6550f..0392ba58dd65 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -169,7 +169,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
 
-xe-$(CONFIG_UEFI_CPER) += xe_cper.o
+xe-$(CONFIG_UEFI_CPER) += xe_cper.o \
+			  xe_trace_cper.o
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index fc795b17d1e0..bb90030bcd2d 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -20,6 +20,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_trace_cper.h"
 
 static bool is_sigid(u32 sigid)
 {
@@ -193,7 +194,8 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	if (einfo && einfo_len)
 		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
 
-	/* TODO: Emit trace event */
+	trace_xe_error_cper(xe, &rhdr->platform_id, &sdesc->fru_id, severity,
+			    &rec->intel_hdr, total_len, (u8 *)rec);
 
 	kfree(rec);
 }
@@ -250,6 +252,17 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
  * @vaf: Formatted log message
  *
  * Emit a CPER record for a SIGID log entry
+ *
+ * Example trace output::
+ *
+ *   xe_error_cper: dev=0000:03:00.0 severity=2
+ *     platform_id=9046afe5-9041-5124-8614-92550d9e9da6
+ *     fru_id=91befe38-2f61-3d7b-0000-000000000000
+ *     intel_hdr_raw=
+ *       01 02 00 18 00 00 00 01 00 00 00 00 64 77 51 14 ...
+ *     cper_len=1772
+ *     cper_raw=
+ *       43 50 45 52 00 01 ff ff ff ff 01 00 02 00 00 00 ...
  */
 void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
diff --git a/drivers/gpu/drm/xe/xe_trace_cper.c b/drivers/gpu/drm/xe/xe_trace_cper.c
new file mode 100644
index 000000000000..caea8783ab7c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_cper.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "xe_trace_cper.h"
+#endif
diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_trace_cper.h
new file mode 100644
index 000000000000..af952a6e168c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_cper.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM xe
+
+#if !defined(_XE_TRACE_CPER_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _XE_TRACE_CPER_H_
+
+#include <linux/tracepoint.h>
+#include <linux/types.h>
+
+#include "xe_cper_types.h"
+#include "xe_device_types.h"
+
+#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
+
+TRACE_EVENT(xe_error_cper,
+	    TP_PROTO(struct xe_device *xe,
+		     const guid_t *platform_id, const guid_t *fru_id,
+		     const u8 severity,
+		     const struct xe_cper_intel_hdr *ihdr,
+		     u32 cper_len, const u8 *cper),
+	    TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
+
+	    TP_STRUCT__entry(
+		__string(dev, __dev_name_xe(xe))
+		__array(char, platform_id, UUID_SIZE)
+		__array(char, fru_id, UUID_SIZE)
+		__field(u8, sev)
+		__array(u8, ihdr_raw, sizeof(struct xe_cper_intel_hdr))
+		__field(u32, cper_len)
+		__dynamic_array(u8, cper, cper_len)
+	    ),
+
+	    TP_fast_assign(
+		__assign_str(dev);
+		__entry->sev = severity;
+		memcpy(__entry->platform_id, platform_id, UUID_SIZE);
+		memcpy(__entry->fru_id, fru_id, UUID_SIZE);
+		memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_intel_hdr));
+		__entry->cper_len = cper_len;
+		memcpy(__get_dynamic_array(cper), cper, cper_len);
+	    ),
+
+	    TP_printk("dev=%s severity=%d platform_id=%pUl fru_id=%pUl intel_hdr_raw=%s cper_len=%u cper_raw=%s",
+		      __get_str(dev), __entry->sev,
+		      __entry->platform_id, __entry->fru_id,
+		      __print_hex(__entry->ihdr_raw,
+				  sizeof(struct xe_cper_intel_hdr)),
+		      __entry->cper_len,
+		      __print_hex(__get_dynamic_array(cper),
+				  __entry->cper_len))
+);
+
+#endif
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
+#define TRACE_INCLUDE_FILE xe_trace_cper
+#include <trace/define_trace.h>
-- 
2.56.0

