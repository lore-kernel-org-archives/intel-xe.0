Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58411CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14130112057;
	Fri,  9 Oct 2026 10:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuE4BSAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A946112053
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541779; x=1823077779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rdDDZgfsf8EOvpeNMxeiXFV1bGZmNj8YsmKSIfNYc5Y=;
 b=XuE4BSAz0w8URpZhj1D3OkTY7tX9qX3HpN3BX+Oxkk9lHYzBBbAR5ZSx
 1k36O/u2JeMduDjLPhPBVQyV/0U0WIQd3D39+t2bncc66Jvd2/mcWpNy9
 b6ubWnZHvIbnSgpcxaAOZM2EEVay8PA00O8N7ZCwanueaWDPV3wPch65P
 2a5SjL/wFO4vD1Tf00ntWFheVeXgn2ZDmjQh3Sj4jIRbDrT4EOQ826uuS
 s7zf5VMPewdRyj8kT5QAm/5UsvBNLLOep+zJqsO+bFMSYigKZZ/aANmhJ
 HjdoBYsCD/cgv9Yp/SWQT8cKYXY99jgbNvl3WygDccD8hlX5qDXDw4MS5 g==;
X-CSE-ConnectionGUID: rtoNbYSCS/6Qdjt5YpEZvg==
X-CSE-MsgGUID: bmKurLTbSc2xi9ZvV5BRIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344097"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344097"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:39 -0700
X-CSE-ConnectionGUID: 62yPCfBcRwOLI0YxmhCrjg==
X-CSE-MsgGUID: vadw1wQkT5uZwkRniLCENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025597"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:35 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 08/12] drm/xe/cper: Emit cper record to trace buf
Date: Fri,  9 Oct 2026 16:16:11 +0530
Message-ID: <20261009104602.1075405-22-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add the xe_error_cper tracepoint and emit each assembled CPER record
through it. Besides the raw record, the event carries the device name,
platform ID, FRU ID, severity and the Intel error section header, so
tools can pick up the records from the trace buffer.

Assisted-by: Copilot:claude-sonnet-4.6
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v4:
 - Build xe_trace_cper.o with CONFIG_UEFI_CPER instead of
   CONFIG_UEFI_CPER_X86
---
 drivers/gpu/drm/xe/Makefile        |  3 +-
 drivers/gpu/drm/xe/xe_cper.c       |  4 +-
 drivers/gpu/drm/xe/xe_trace_cper.c |  9 ++++
 drivers/gpu/drm/xe/xe_trace_cper.h | 66 ++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index da78026b0bb4..5458119ddf40 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -168,7 +168,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
 
-xe-$(CONFIG_UEFI_CPER) += xe_cper.o
+xe-$(CONFIG_UEFI_CPER) += xe_cper.o \
+			  xe_trace_cper.o
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 709fc3d52fcf..0fedef06e138 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -20,6 +20,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_trace_cper.h"
 
 static bool is_hw_sigid(enum xe_sigid sigid)
 {
@@ -179,7 +180,8 @@ static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
 	if (einfo && einfo_len)
 		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
 
-	/* TODO: Emit trace event */
+	trace_xe_error_cper(xe, &rhdr->platform_id, &sdesc->fru_id, severity,
+			    &rec->intel_hdr, total_len, (u8 *)rec);
 
 	kfree(rec);
 }
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
index 000000000000..6d2dbf504888
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_cper.h
@@ -0,0 +1,66 @@
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
+	TP_PROTO(struct xe_device *xe,
+	    const guid_t *platform_id, const guid_t *fru_id,
+	    const u8 severity,
+	    const struct xe_cper_sec_intel_err_hdr *ihdr,
+	    u32 cper_len, const u8 *cper),
+	TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
+
+	TP_STRUCT__entry(
+	    __string(dev, __dev_name_xe(xe))
+	    __array(char, platform_id, UUID_SIZE)
+	    __array(char, fru_id, UUID_SIZE)
+	    __field(u8, sev)
+	    __array(u8, ihdr_raw, sizeof(struct xe_cper_sec_intel_err_hdr))
+	    __field(u32, cper_len)
+	    __dynamic_array(u8, cper, cper_len)
+	    ),
+
+	TP_fast_assign(
+	    __assign_str(dev);
+	    __entry->sev = severity;
+	    memcpy(__entry->platform_id, platform_id, UUID_SIZE);
+	    memcpy(__entry->fru_id, fru_id, UUID_SIZE);
+	    memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_sec_intel_err_hdr));
+	    __entry->cper_len = cper_len;
+	    memcpy(__get_dynamic_array(cper), cper, cper_len);
+	    ),
+
+	TP_printk("dev=%s severity=%d platform_id=%pU fru_id=%pU "
+		"intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
+		__get_str(dev), __entry->sev,
+		__entry->platform_id, __entry->fru_id,
+		__print_hex(__entry->ihdr_raw,
+		    sizeof(struct xe_cper_sec_intel_err_hdr)),
+		__entry->cper_len,
+		__print_hex(__get_dynamic_array(cper),
+		    __entry->cper_len))
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

