Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6F4C46CD4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1CF10E3C3;
	Mon, 18 Dec 2023 19:07:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAB110E371
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926398; x=1734462398;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w9MLdeGYLz7XyFLjplMq7sOUMh83gKlYOl6lDHn3uOA=;
 b=jSVZLLtraF2d3IlRrNV/MKkKhvMiUZ+Vct3MqcWBaBA5AW/aAGgCBn0s
 posTIoKxUmv3dOUwjuSzJaXbWYn0itJUJYyyk9ZNxLK43EBi+MWhYE6wM
 9iUcHaW/Zl0UVjCueEo/hCylrzu2LsYvId5wO7Uao4zYu/yMoEga3X64j
 LbuPP/Xj+SHzFKJo6WlbkkEnHqR31rjs5IUSgNDG1FCA7bImdAyKzU2Z6
 nl2thvR0JXToVl4bkoJxACg92sIX5LN2W9TjYQEl1v8FSbZ+iQ2efKTgY
 hsGkvxRLJdZCMHZnqZ46EeaF4a8Ymf+cf8SWdSLMojyV5uYfqy45IIbI3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="399382180"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="399382180"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866330864"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="866330864"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:37 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 01/10] drm/xe: Add GT oriented drm_printers
Date: Mon, 18 Dec 2023 20:06:20 +0100
Message-Id: <20231218190629.502-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218190629.502-1-michal.wajdeczko@intel.com>
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
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

Instead of using generic drm_err_printer() that just adds static
prefix, or drm_info_printer() that outputs only device name, add
new helpers that create dedicated drm_printers that use our GT
oriented xe_gt_err() and xe_gt_info() functions.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: rename helpers to follow the header name (Lucas)
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 5991bcadd47e..c2b004d3f48e 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -43,4 +43,48 @@
 #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
 	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
 
+static inline void __xe_gt_printfn_err(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_gt *gt = p->arg;
+
+	xe_gt_err(gt, "%pV", vaf);
+}
+
+static inline void __xe_gt_printfn_info(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_gt *gt = p->arg;
+
+	xe_gt_info(gt, "%pV", vaf);
+}
+
+/**
+ * xe_gt_err_printer - Construct a &drm_printer that outputs to xe_gt_err()
+ * @gt: the &xe_gt pointer to use in xe_gt_err()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_gt_err_printer(struct xe_gt *gt)
+{
+	struct drm_printer p = {
+		.printfn = __xe_gt_printfn_err,
+		.arg = gt,
+	};
+	return p;
+}
+
+/**
+ * xe_gt_info_printer - Construct a &drm_printer that outputs to xe_gt_info()
+ * @gt: the &xe_gt pointer to use in xe_gt_info()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_gt_info_printer(struct xe_gt *gt)
+{
+	struct drm_printer p = {
+		.printfn = __xe_gt_printfn_info,
+		.arg = gt,
+	};
+	return p;
+}
+
 #endif
-- 
2.25.1

