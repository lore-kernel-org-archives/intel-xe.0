Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7CDC531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC6810E97B;
	Tue, 28 Jul 2026 16:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ldp69p5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA75510E97B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255078; x=1816791078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEg7ZKJYF4AwJ3cDefHm0go3LDVUq/ClwTDGEuRgHkQ=;
 b=Ldp69p5nXXghPZTBmfGNQiMaT7R4ddXCbxDLfX68VAhtYXh2agiYy4cO
 bF+MXmb56liy8lPTXvTvjuqEGrITDH4CX6ec2SEkKmr0ylEyjn6Pf1McU
 3JzmtHXBVfNJEH3kewvXlp+pLw3RjelIBdZbH3GC7E2Jj0yDZkGUj3j8I
 zbHRnUBpIvAECeaw5qvaZGrHgzxwMoTsKEhQgOJgHhZoOk3VJMb+rKvRo
 BnBgO4ikkjm8Ab2QU9m415Sx8sWle2tj+1D5UKgW5E0dFke6epBgLD7yk
 p4pHAfOXveZHn6Iu4clhKeJJ6jMYLqQ8w8OTW9YLnzQy9vHSp0KSp00Oz w==;
X-CSE-ConnectionGUID: 37mBwdbHRY2rn1812I4F5A==
X-CSE-MsgGUID: rQYhBkwSSWyp0IYzoovnoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386258"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386258"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:18 -0700
X-CSE-ConnectionGUID: zMxbPFozTbm1d6mrvacEBw==
X-CSE-MsgGUID: 8XgsPUl0TBWAKOPCWxA7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819297"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 06/22] drm/xe/log: Add SIGID log helpers for location
Date: Tue, 28 Jul 2026 18:10:21 +0200
Message-ID: <20260728161039.579-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

