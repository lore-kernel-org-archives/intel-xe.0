Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C37606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oEyBZWLz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05ED11243B;
	Thu, 26 Nov 2026 13:57:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B0D10E9C7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795701472; x=1827237472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGcwWLjeR1T7RIqgbzeG3T03IU14HM4SgydPySz5U1U=;
 b=oEyBZWLzl934ot1244l0uSiVSfnW3W2oNmcEqokd3Xstyd2+X87K4C92
 kw1WXu9e1xBiK0bvmT8n3bp5OLLZBLmpEsitSyQrhboVp10pPy0nVOiIz
 9OnBktgS4BjrxUe1llVyaM3hxHWfhTD5dauq3SN4gX9G+1ArgZd24lQL7
 dSCn67HpSiiGLbGkyu0OWJ2C+OAI4QjwjC4EYUchZdQ//LfmimmGsKZco
 V5EpCvBN8sWDjw2hBsnGK9DeZahtPEvYSoJWdYKdwTWKApj3wheYzH6Bp
 9eSxFFdjjQfMvfGqfDQ3vuMvlArfg6QnXJOzkx1nm1VrYrfXYUfc0XzUV A==;
X-CSE-ConnectionGUID: iT+CADnQQ3W2wGF4vA759w==
X-CSE-MsgGUID: iOUYNvTsSJyEbPavVEH4rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4520592"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4520592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:57:52 -0800
X-CSE-ConnectionGUID: 4ws1WTgMQqm7AvAOtL9Uww==
X-CSE-MsgGUID: Wk2UH9KRTQib60ewkQ0FuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12684399"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 05:57:48 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v1 2/6] drm/xe/log: Add xe_log_* logging helpers for
 atomic context
Date: Thu, 26 Nov 2026 19:27:34 +0530
Message-ID: <20261126135732.2169939-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
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

Add xe_log_emit_atomic() and xe_log_err_atomic() to allow structured
Xe logging from atomic context.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.c | 28 +++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h | 61 +++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 80e2b1724ceb..78c114754daa 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -25,6 +25,17 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
 		     component, location, data, len, vaf);
 }
 
+static void log_emit_cper_atomic(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+				 u32 component, u32 location, const void *data, size_t len,
+				 struct va_format *vaf)
+{
+	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper_atomic, pdev, cper_sev, sigid,
+				   component, location, data, len, vaf);
+
+	xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
+		     component, location, data, len, vaf);
+}
+
 static const char *log_unknown_component_prefix(u32 component)
 {
 	u32 class = FIELD_GET(XE_LOG_COMPONENT_CLASS_MASK, component);
@@ -245,6 +256,23 @@ void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	va_end(args);
 }
 
+void __xe_log_emit_atomic(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+			  u32 component, u32 location, const void *data, size_t len,
+			  const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
+	log_emit_cper_atomic(pdev, cper_sev, sigid, component, location, data, len, &vaf);
+
+	va_end(args);
+}
+
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_log_kunit.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index bb1185143589..f4f69bd6d95d 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -20,6 +20,11 @@ void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		   u32 component, u32 location, const void *data, size_t len,
 		   const char *fmt, ...);
 
+__printf(8, 9)
+void __xe_log_emit_atomic(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+			  u32 component, u32 location, const void *data, size_t len,
+			  const char *fmt, ...);
+
 #define __xe_log_const_sev_to_level(sev) \
 	(__builtin_constant_p(sev) ? (sev) == CPER_SEV_INFORMATIONAL ? KERN_INFO : KERN_ERR : NULL)
 
@@ -31,6 +36,11 @@ void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	__xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
 } while (0)
 
+#define xe_log_emit_atomic(pdev, sev, sig, comp, loc, data, len, fmt, args...) do {	\
+	__xe_log_emit_printk_index(__xe_log_const_sev_to_level(sev), fmt);		\
+	__xe_log_emit_atomic((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
+} while (0)
+
 #define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
 	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
 		    (data), (len), fmt, ##args)
@@ -140,6 +150,57 @@ void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 #define xe_log_err(any, TAG, err, fmt, args...) \
 	xe_log_comp_recoverable((any), TAG, ERR_PTR(err), 0, fmt, ##args)
 
+/**
+ * xe_log_from_atomic() - Emit a structured SIGID entry from atomic context.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @cper_sev: CPER severity
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @component: component identifier
+ * @data: additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @args: arguments for @fmt
+ */
+#define xe_log_from_atomic(any, cper_sev, sigid, component, data, len, fmt, args...) do { \
+	typeof(any) ___any = (any);								\
+	xe_log_emit_atomic(xe_any_to_pdev(___any), (cper_sev), (sigid), (component),	\
+			   xe_log_location(___any), (data), (len), fmt, ##args);		\
+} while (0)
+
+#define xe_log_from_fatal_atomic(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from_atomic((any), CPER_SEV_FATAL, (sig), (comp), \
+			   (data), (len), fmt, ##args)
+
+#define xe_log_from_recoverable_atomic(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from_atomic((any), CPER_SEV_RECOVERABLE, (sig), (comp), \
+			   (data), (len), fmt, ##args)
+
+/**
+ * xe_log_err_atomic() - Emit a recoverable error entry from atomic context.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ */
+#define xe_log_err_atomic(any, TAG, err, fmt, args...) \
+	xe_log_from_atomic((any), CPER_SEV_RECOVERABLE, \
+			   (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
+			   XE_LOG_COMPONENT_##TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_err_fatal_atomic() - Emit a fatal error entry from atomic context.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ */
+#define xe_log_err_fatal_atomic(any, TAG, err, fmt, args...) \
+	xe_log_from_atomic((any), CPER_SEV_FATAL, \
+			   (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
+			   XE_LOG_COMPONENT_##TAG, ERR_PTR(err), 0, fmt, ##args)
+
 /**
  * xe_log_err_fatal() - Emit a structured SIGID error log entry on the component behalf.
  * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
-- 
2.48.1

