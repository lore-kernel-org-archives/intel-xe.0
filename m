Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF5C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADFF10F1FC;
	Thu, 23 Jul 2026 20:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqW6VpQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B89F10F204
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839101; x=1816375101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dwQ0xCKSzqyElfRg08vUif/+revHaqDBcdZLJLoKgo=;
 b=QqW6VpQVf3QJhhJjnFuiaFKcAS+Yt9vm67HwueuecxASWbfsZbFxhpIB
 JTqAGt06JVxYJpUmXlMK+eJ+tQEF/d8yGQCZ9d7m8OoX1hc2MdYKg20+B
 rx5Iqb7C9F4H/Kl1aJ0aI2sAiFajDU84z3Yonz83B3rsJRcrpR3Qe6F6h
 Fj2oBgrltwcVwzEyggQA6eoFi5I6jNikdZXeFRIGVp+TwKoTNaunSrGJP
 ObcTe9QBlp+qruLFINl37arJPmEb1pdqxHpgrgf8YPnolve9VaOL/ZWeC
 xJQDdqKiG1iIEJcJBlxD/aq8yQUtVBCWkD2Hlk4XgAdhJfIiRz+84j2AC A==;
X-CSE-ConnectionGUID: Pe9Tjs5CTmeyUPMaRS4+AA==
X-CSE-MsgGUID: FE/I4RB0RjiFdstSAmrnHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484302"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484302"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:21 -0700
X-CSE-ConnectionGUID: P/4Cmz/cRLWeO7ND5WoSLQ==
X-CSE-MsgGUID: +bvVbxlARweWGwwnf/2T6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578599"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 07/19] drm/xe/log: Add component based SIGID log helper
Date: Thu, 23 Jul 2026 22:37:40 +0200
Message-ID: <20260723203754.3782-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

Our component list already defines relation between the component
name, identified by the TAG, and its numerical identifier and the
assigned SIGID. We can also prepare location identifier based on
the pointer type used to emit the log entry. Add helper that will
prepare SIGID, COMPONENT and LOCATION parameters for xe_log_emit()
using provided TAG and the pointer.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 5d3f0ef4ecca..8e300e8b6d10 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -8,6 +8,7 @@
 
 #include <linux/cper.h>
 
+#include "abi/xe_log_abi.h"
 #include "abi/xe_sigid_abi.h"
 #include "xe_any.h"
 #include "xe_gt_printk.h"
@@ -99,4 +100,44 @@ void xe_log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_emit_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
 			 (data), (len), fmt, ##args)
 
+#define xe_log_location_type(any)							\
+	_Generic((any),									\
+		 struct pci_dev * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,				\
+		 struct xe_gt * : XE_LOG_LOCATION_TYPE_GT)
+
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))
+
+#define __XE_LOG_COMP_FMT(TAG, fmt, args...)	#TAG ": " fmt, ##args
+
+/**
+ * xe_log_emit_comp() - Emit a structured SIGID log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @TAG: the component tag to use
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The component SIGID will be determined by the component's @TAG.
+ * The component location will be based on the @any pointer type.
+ */
+#define xe_log_emit_comp(any, cper_sev, TAG, data, len, fmt, args...) do {		\
+	typeof(any) __any = (any);							\
+	struct pci_dev *__pdev = xe_any_to_pdev(__any);					\
+	int __sev = (cper_sev);								\
+	int __sig = XE_LOG_COMPONENT_##TAG##_SIGID;					\
+	u32 __component = XE_LOG_COMPONENT_##TAG;					\
+	u32 __location = xe_log_location(__any);					\
+	const void *__data = (data);							\
+	size_t __len = (len);								\
+	xe_log_emit_dmesg_from(__any, __sev, __sig, __data, __len,			\
+			       __XE_LOG_COMP_FMT(TAG, fmt, ##args));			\
+	xe_log_emit_cper(__pdev, __sev, __sig, __component, __location,			\
+			 __data, __len,	fmt, ##args);					\
+} while (0)
+
 #endif
-- 
2.47.1

