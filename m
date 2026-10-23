Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B5606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n96eUt0V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7A112966;
	Fri, 23 Oct 2026 04:17:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EC0112947
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729061; x=1824265061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6JMqF+JKR/DUZ43l2AAgkm0Rk3LUtjdyHM3fSWeuX0=;
 b=n96eUt0VPyRtPgwe4jUOw+20arsChpOCS0Dy20t+xW9neJ/6vH3YA946
 90rakkyp98qAX81lV5R1Kre/GNY+hXXM2g0BSdfUBaLlZ6BEbY+SRYPSZ
 Zql98S1c4WQ50qTAtK9plB+ydpIKgHOawTSEuz3tRFTD3X0Hw03L7djMb
 +u/WvN1burMZI5cR/3rLdNpKBaljhrj1RGjbGJ/TlXDgywQ47mW+WqumV
 HWoYThcMjxzou/pVoKXIxKKXXs+TlFlTv6jUXO+dJ+9MXuTpYk1OJ9T9P
 G6qQ5Xan780ckhSMkdAUicVEKCnX8KxmMRBmI3SH/F66Pvjt+Zf2khUoz Q==;
X-CSE-ConnectionGUID: G4eqSvl8SISpZrkzboX6jQ==
X-CSE-MsgGUID: 4ZfL5xpvSEeJJCWJVhFs0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383493"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:40 -0700
X-CSE-ConnectionGUID: jpHx6kZ3R/WPg5KbkoI4Gw==
X-CSE-MsgGUID: c+J7l+lgTEyERuORq2qtug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658278"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:38 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 06/13] drm/xe/cper: Emit cper record to trace buf
Date: Fri, 23 Oct 2026 10:04:28 +0530
Message-ID: <20261023043422.681260-21-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023043422.681260-15-badal.nilawar@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v5:
 - Add example CPER trace
 - Use %pUl for platform and FRU GUIDs (Sashiko)
v4:
 - Build xe_trace_cper.o with CONFIG_UEFI_CPER instead of
   CONFIG_UEFI_CPER_X86
---
 drivers/gpu/drm/xe/Makefile        |  3 +-
 drivers/gpu/drm/xe/xe_cper.c       | 15 ++++++-
 drivers/gpu/drm/xe/xe_trace_cper.c |  9 +++++
 drivers/gpu/drm/xe/xe_trace_cper.h | 65 ++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ec463018f77d..4377f60f5dab 100644
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
index 0ead6237bbb4..cb4a15a036ac 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -20,6 +20,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_trace_cper.h"
 
 static bool is_valid_sigid(u32 sigid)
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
+ *     intel_err_hdr_raw=
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
index 000000000000..01c0a057aa60
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
+	    TP_printk("dev=%s severity=%d platform_id=%pUl fru_id=%pUl intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
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
2.54.0

