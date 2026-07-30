Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54735C5516D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F283F10EFAA;
	Thu, 30 Jul 2026 15:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAxZcVhJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5321210E697
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425592; x=1816961592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEg7ZKJYF4AwJ3cDefHm0go3LDVUq/ClwTDGEuRgHkQ=;
 b=jAxZcVhJH+2z1CqPiCeW/wBISF0uIY2W/Jm08TJpbGWKqBFH/0SIR4ak
 Pg0opvwxGbpZCL6BM+NYdDUrRpnEx2zTsmUZhjEwlC6TK9kr9Si8jqeS6
 fOk/ma5nbDypl/pyyLdIoPPSra77T+vN3PLB3Ml80zvILTpJ1YhfBJasu
 G78MrpkEkaKFXlgewwxLRApOgMhRFfcyKrT6l47tl+MQhBNq82PHpQ9Ym
 4qYCKaHKCuu5wOzryssxhQAU1Yng4XkBIDIIKKXUj+M9slFkBzcxkTxia
 YKSnHyFG+IRa07Hk0oE83pCxy7OoSTaRNJTHnYCp5dBmogvd8SdRFWMYS A==;
X-CSE-ConnectionGUID: qL4kXRr6TgW4HnLsY59SHg==
X-CSE-MsgGUID: wKrl7FytSGGcPfX9kKoJjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583020"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:11 -0700
X-CSE-ConnectionGUID: wX6QjFW2ReqM/ZAIsIg2Cw==
X-CSE-MsgGUID: pfTubHR5RB+EcFvCyla4+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387537"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 06/23] drm/xe/log: Add SIGID log helpers for location
Date: Thu, 30 Jul 2026 17:21:02 +0200
Message-ID: <20260730152121.576-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

We can determine the location of the SIGID error source based on the
type of the xe pointer being currently available. Add helper macros
that will accept any of xe_device, xe_tile or xe_gt pointers instead
of plain pci_dev to generate valid XE_LOG_LOCATION identifier and then
call low-level xe_log_emit(pdev) function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 73daf37d6463..510cedae6e14 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -8,7 +8,9 @@
 
 #include <linux/cper.h>
 
+#include "abi/xe_log_abi.h"
 #include "abi/xe_sigid_abi.h"
+#include "xe_any.h"
 
 struct pci_dev;
 
@@ -33,4 +35,38 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_emit((pdev), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
 		    (data), (len), fmt, ##args)
 
+#define xe_log_location_type(any)							\
+	_Generic((any),									\
+		 struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,				\
+		 const struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,			\
+		 struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,				\
+		 const struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,			\
+		 struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 const struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,		\
+		 struct pci_dev * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 struct device * : XE_LOG_LOCATION_TYPE_DEVICE)
+
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))
+
+/**
+ * xe_log_from() - Emit a structured SIGID log entry using @any pointer as location.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @component: component identifer
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @args: arguments for the @fmt format string
+ *
+ * The location used to emit SIGID entry will be based on the @any pointer type.
+ * See xe_log_emit() for more details.
+ */
+#define xe_log_from(any, cper_sev, sigid, component, data, len, fmt, args...) do {	\
+	typeof(any) ___any = (any);							\
+	xe_log_emit(xe_any_to_pdev(___any), (cper_sev), (sigid), (component),		\
+		    xe_log_location(___any), (data), (len), fmt, ##args);		\
+} while (0)
+
 #endif
-- 
2.47.1

