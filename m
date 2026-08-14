Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7606C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE39610F6C6;
	Fri, 14 Aug 2026 17:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXXmhYEh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2110F6CE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727919; x=1818263919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/O9p2HZ8enGRBiqncRgluvI6bgX8N9SOVparUjGixGg=;
 b=HXXmhYEhr0qEgxqs5C9lBw4p7Acy7f83TAdmR6gOdIYbPl5LGYWru+Kt
 DHOHdjTOC12xGI51danE696FvXO6lgYZ36ynYDxJklO0uHZM48+L9ME+X
 pDXMdDlhOioNMB8IfvERq47PKeEVSXIIwV+l1GQzEmzuGxZLM24ueNDix
 XBMdpwAIIogYlx4MzRhQzNewKfntr3GrxbbNeiiKHj8OKu8lxStv8Zq1l
 D8gHjWXZX7sTVB+CrDW5KygaAk27gm2nIa0m8U2/R2BFbuFLOpmw5h67U
 sfv9+Z3+4z+M0V9YH6+glgk86E2QGlmI7pLOAStlahNSO6DS/Cr2y94M9 g==;
X-CSE-ConnectionGUID: cl8hqYC2RZOLK/Es+QcjJQ==
X-CSE-MsgGUID: x43M5uXnQVWRaBVc09lyEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464040"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464040"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:39 -0700
X-CSE-ConnectionGUID: QicGDkXuQ9utPnhzFT3BZA==
X-CSE-MsgGUID: puYdY8o7SY+YsdDz4FlZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946168"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 11/33] drm/xe/log: Index all SIGID printk messages
Date: Fri, 14 Aug 2026 19:17:37 +0200
Message-ID: <20260814171801.13347-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

When CONFIG_PRINTK_INDEX is enabled, it is expected that all device
level printk messages are indexed for audit. While usually this is
done automatically behind the scenes when code is using regular
dev_printk macros, since we are generating different dmesg messages
inside xe_log_emit() based on the severity, component and location,
we only get those entries in /sys/kernel/debug/printk/index/xe:

  <3> drivers/gpu/drm/xe/xe_log.c:142 log_dmesg_vprintk "%s %s: [drm] *ERROR* %pV"
  <6> drivers/gpu/drm/xe/xe_log.c:140 log_dmesg_vprintk "%s %s: [drm] %pV"

Explicitly generate printk index using dev_printk_index_emit() with
some generic prefix that includes the SIGID tag.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: use simpler/more generic format (Sashiko)
    convert const severity to level (Michal)
    use do { } while (Mallesh)
---
 drivers/gpu/drm/xe/xe_log.c |  8 ++++----
 drivers/gpu/drm/xe/xe_log.h | 17 ++++++++++++++---
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 0b4f791a490f..015a9f734e77 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -177,7 +177,7 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
 }
 
 /**
- * xe_log_emit() - Emit a structured SIGID log entry
+ * __xe_log_emit() - Emit a structured SIGID log entry
  * @pdev: the &pci_dev device
  * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
  * @sigid: signature identifier, see &enum xe_sigid
@@ -206,9 +206,9 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
  *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
  *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
  */
-void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
-		 u32 component, u32 location, const void *data, size_t len,
-		 const char *fmt, ...)
+void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		   u32 component, u32 location, const void *data, size_t len,
+		   const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list args;
diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 8c74f809fb5b..bb1185143589 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -16,9 +16,20 @@
 struct pci_dev;
 
 __printf(8, 9)
-void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
-		 u32 component, u32 location, const void *data, size_t len,
-		 const char *fmt, ...);
+void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		   u32 component, u32 location, const void *data, size_t len,
+		   const char *fmt, ...);
+
+#define __xe_log_const_sev_to_level(sev) \
+	(__builtin_constant_p(sev) ? (sev) == CPER_SEV_INFORMATIONAL ? KERN_INFO : KERN_ERR : NULL)
+
+#define __xe_log_emit_printk_index(level, fmt) \
+	dev_printk_index_emit(level, "%s SIGID=%u %s" fmt);
+
+#define xe_log_emit(pdev, sev, sig, comp, loc, data, len, fmt, args...) do {		\
+	__xe_log_emit_printk_index(__xe_log_const_sev_to_level(sev), fmt);		\
+	__xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
+} while (0)
 
 #define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
 	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
-- 
2.47.1

