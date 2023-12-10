Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D88DC4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9B710E326;
	Sun, 10 Dec 2023 18:07:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A4410E326
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Dec 2023 18:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702231661; x=1733767661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SQOHthUyGC5Go4Zkm/jlfkvFDo1cPqUbBOvYpNt5iEw=;
 b=gE0YVn1Cm426ZISQTLl5LPrttKGZ/h8y/pthT7k9vo2TWTnEpi4if6Q/
 1/IlyenQ3BDQJvAC+OKpDgADJcwnq+VSKOmwnPLCrCDcnsYBjFc77Gu2Q
 lIbIPtvkEuODK+mQ99BQ8TFnWPks+GM1MtvOqNCpxg6TuaD175Gpp9PLX
 PeWoQgESGeBHR6m03kM6JbYFFLL32EOEewdaImxQ/nKuxyNlbPox+OuOW
 3fDvdZUWNfYWQ10I7VcmUNF2BXQGXWKU9plJDGaSyFUz/0HkyjROgdC9U
 TBxhlbcoJQqbj6IrEo3g9tqlseuZU3XESruoDiIod9a6JJeEpenHLYPat g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1437957"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1437957"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843229485"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; d="scan'208";a="843229485"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.192])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/8] drm/xe: Add GT oriented drm_printers
Date: Sun, 10 Dec 2023 19:06:52 +0100
Message-Id: <20231210180659.1615-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231210180659.1615-1-michal.wajdeczko@intel.com>
References: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of using generic drm_err_printer() that just adds static
prefix, or drm_info_printer() that outputs only device name, add
new helpers that create dedicated drm_printers that use our GT
oriented xe_gt_err() and xe_gt_info() functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 5991bcadd47e..195f45b10c41 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -43,4 +43,48 @@
 #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
 	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
 
+static inline void __drm_printfn_xe_gt_err(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_gt *gt = p->arg;
+
+	xe_gt_err(gt, "%pV", vaf);
+}
+
+static inline void __drm_printfn_xe_gt_info(struct drm_printer *p, struct va_format *vaf)
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
+		.printfn = __drm_printfn_xe_gt_err,
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
+		.printfn = __drm_printfn_xe_gt_info,
+		.arg = gt,
+	};
+	return p;
+}
+
 #endif
-- 
2.25.1

