Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC75E77181
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 23:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A928210E58D;
	Mon,  9 Dec 2024 23:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCZBOY4C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9FA10E58F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733786882; x=1765322882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=imFp2O0/gwj54nyH6x21FHnFJHQBjUMrEgVRlkSthk8=;
 b=GCZBOY4CpGpI6kBfXXOkzFK1nOlYOyPEoKGnPLk8fZxEbX79rofeZg21
 KYFZyiWYF951ikDbdlcSHoApqFjvVt4PUWVXvtAD7ykBsqkfQZxUbYNvy
 DhbcQJb7P46AwRtAF57ols72U4B1I4feISyeLJBzzmbtn/xjY9DiEQpP6
 oYC+yt1QLxP4gqVXW4ZPkNdI65syZjoRay65o5XqpnGmMNfOre6Kvo4E2
 IQH0kayD0T1ezLRFY+yBJ4sTdhH4+C4KyA+BQO/L9iic2aHGjflT29mOn
 eBCc+IafZ4z+PkArV+NFMrSIh7CBJy/bPqSqp0abyH/SlDkbc7NO35DMT A==;
X-CSE-ConnectionGUID: tvMSK32rRIuF8T8PXkCNJg==
X-CSE-MsgGUID: UlKISniXRW24IlyUR0E/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44581855"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="44581855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:01 -0800
X-CSE-ConnectionGUID: 5wRt+3DTRauB+w8PIKAgXQ==
X-CSE-MsgGUID: aA5DQNC2SmKarOAxXsL9Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="100268954"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/5] drm/xe: Introduce xe_gt_dbg_printer()
Date: Mon,  9 Dec 2024 15:27:36 -0800
Message-ID: <20241209232739.147417-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209232739.147417-1-lucas.demarchi@intel.com>
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

We didn't have GT-oriented debug level printer as it was hard to
correctly show actual callsite annotation. But this is now doable
from commit c2ef66e9ad88 ("drm/print: Improve drm_dbg_printer").

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 5dc71394372d6..11da0228cea71 100644
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
2.47.0

