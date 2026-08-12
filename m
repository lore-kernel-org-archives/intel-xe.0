Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183A0C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B439C10E44F;
	Wed, 12 Aug 2026 19:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPtRDDmm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8F710F0E8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562122; x=1818098122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bKWGChi0X3YbQvt4/Jw7cmts36kSTluaQ6GCA+ukW7w=;
 b=TPtRDDmmfv+s+6i+lqQzda6hbhcNtGSaMHz8rfAiVFAwgW4SDHEQn2aj
 Vzi6jIoOYmmau2f47ktU33ZWS9hRlXIoDET2lE0et3AnRHSwURHzOoXwV
 d/+WrfyK6LxjtQTzh85je5knBndn9l9vsFUncKUy7dELLcAIq6EtdPRh/
 tdlPc+My8WZOqkQ2AesiIOqr4BMz+na5UVoXvTmW0+UjM35jjtFpH1LvL
 YDUL0zOx6xOtW0un3L7TYLh0R9mJba8KAk743hgEsBLToTi+ALwaMTBZj
 t8q4eCDey8eNS7K5Loc2JxgO8vNSdNjp0g8/OfC28xzIizj29PKHRsPIf g==;
X-CSE-ConnectionGUID: nlmeMywHR8iGRUqFe8D97Q==
X-CSE-MsgGUID: plc6y/7xTUOkxYchYCqeiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987534"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:22 -0700
X-CSE-ConnectionGUID: 6RutHJ3zSjy8Wuw2XgvQdA==
X-CSE-MsgGUID: cqKGdSLFStiK7IH8j2PgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891955"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 11/32] drm/xe/log: Index all SIGID printk messages
Date: Wed, 12 Aug 2026 21:14:27 +0200
Message-ID: <20260812191450.11690-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_log.c |  8 ++++----
 drivers/gpu/drm/xe/xe_log.h | 14 +++++++++++---
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 0b423ed121cd..50a9b35e5b3e 100644
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
index 0928b0866617..53fe2bb7ddd3 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -16,9 +16,17 @@
 struct pci_dev;
 
 __printf(8, 9)
-void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
-		 u32 component, u32 location, const void *data, size_t len,
-		 const char *fmt, ...);
+void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		   u32 component, u32 location, const void *data, size_t len,
+		   const char *fmt, ...);
+
+#define __xe_log_emit_printk_index(fmt) \
+	dev_printk_index_emit(NULL, "[drm]%s SIGID=%u %s(%s)%s%s%s: " fmt);
+
+#define xe_log_emit(pdev, sev, sig, comp, loc, data, len, fmt, args...) ({		\
+	__xe_log_emit_printk_index(fmt);						\
+	__xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
+})
 
 #define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
 	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
-- 
2.47.1

