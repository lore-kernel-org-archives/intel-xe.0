Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF129C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 17:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFFA10ECC5;
	Fri,  7 Jun 2024 17:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3tkaz8m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCD210EC1A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717781175; x=1749317175;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ZuoLfXgqAns6AcQ9HOeeubmFOAzRjSEHXRpeQ3qNlY=;
 b=B3tkaz8mema9jGDJorvdmhdEED1wW3E2Ro6CTbZJOMIZhSDN3eB3BCR0
 L2gnSPzQ9LgWOxTS0kr7GrUEoneQstXWI/XZBvNxM938y8xoTwF/YdJd5
 l6cGrBEh0YOk/xS6ycIT/mfiqfQbJ0zWNFJaUzsKra+MxfVJ22odeZ4Hd
 vEmPSMyCjVySzDh1B9FISNPC2nI24BbN4/qB7UGGus8lovvU9VfdNXX41
 BWoI+P0Q7Y0KweT+xr7CO932jOWDzw8KwKll54jEsjTUC6Qa67zFMDd4f
 SOMANF/1rU2x0SoiVBv5IH6I5q1IamQnlE3rnwiUsCaPlbqZgokJCFZVy w==;
X-CSE-ConnectionGUID: r96RuOPsQomxUFnCkwqBKw==
X-CSE-MsgGUID: qhVY7QquStiaPyQucDsCNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14467126"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14467126"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 10:26:15 -0700
X-CSE-ConnectionGUID: BEtniS5kSE2/oIjk6+I/Iw==
X-CSE-MsgGUID: HZkHZBlpR36Iz5QnpjB0Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42837245"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 10:26:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Introduce xe_gt_dbg_printer()
Date: Fri,  7 Jun 2024 19:26:07 +0200
Message-Id: <20240607172607.1680-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We didn't have GT-oriented debug level printer as it was hard to
correctly show actual callsite annotation. But this is now doable
from commit c2ef66e9ad88 ("drm/print: Improve drm_dbg_printer").

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index d6228baaff1e..61b76c5eaacc 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -60,6 +60,21 @@ static inline void __xe_gt_printfn_info(struct drm_printer *p, struct va_format
 	xe_gt_info(gt, "%pV", vaf);
 }
 
+static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_gt *gt = p->arg;
+	struct drm_printer dbg;
+
+	/*
+	 * The original xe_gt_dbg() callsite annotations are useless here,
+	 * redirect to the tweaked drm_dbg_printer() instead.
+	 */
+	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
+	dbg.origin = p->origin;
+
+	drm_printf(&dbg, "GT%u: %pV", gt->info.id, vaf);
+}
+
 /**
  * xe_gt_err_printer - Construct a &drm_printer that outputs to xe_gt_err()
  * @gt: the &xe_gt pointer to use in xe_gt_err()
@@ -90,4 +105,20 @@ static inline struct drm_printer xe_gt_info_printer(struct xe_gt *gt)
 	return p;
 }
 
+/**
+ * xe_gt_dbg_printer - Construct a &drm_printer that outputs like xe_gt_dbg()
+ * @gt: the &xe_gt pointer to use in xe_gt_dbg()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_gt_dbg_printer(struct xe_gt *gt)
+{
+	struct drm_printer p = {
+		.printfn = __xe_gt_printfn_dbg,
+		.arg = gt,
+		.origin = (const void *)_THIS_IP_,
+	};
+	return p;
+}
+
 #endif
-- 
2.43.0

