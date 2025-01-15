Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F82C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 20:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F144410E7E2;
	Wed, 15 Jan 2025 20:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KS0p/KL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF5E10E7D8
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 20:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736971342; x=1768507342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l2dFb62TofsIs0Q5bYhcCOxJyjQgBa0ByGGf5eFU2TU=;
 b=KS0p/KL7EcSrH3sgzDRsQbAwUs75zr2zQGp001nqN5G5v4pRnzJGI2hW
 nZn36X5N5bCeHo2DWoyG74olqBP87lLd3+2wlss1mrD9U1ti4rg/0wjqW
 sgdgimJRs9SoANc4DaowUyp92tUau20NpTPfm7d+xR+5iLyxiPRhF1VrI
 Qhhud5S5Sw4BSg1v7ucja0tol2H8Q2aJnlyJTWbXFZrBQpXAI0w9ZveLQ
 G8KXoMRrfeZ2YFMLLmECmzDrtV7ZL3/EvPI4lbjJCPDTltOYaM5L6lm3R
 ET94vMGTpjIkH6WlOEJbjDvoB3vZULpXNzSTm/lfCER61dSVCZSooOvBM w==;
X-CSE-ConnectionGUID: zuLng0JzQXyVL0J0iwWUzA==
X-CSE-MsgGUID: ak8kf4E9Sn+itHMoMMaJzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37438279"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37438279"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 12:02:20 -0800
X-CSE-ConnectionGUID: 6l5ZBMcrQaOXfYkWIOKlyQ==
X-CSE-MsgGUID: 9LO8+ljcSS2onaSRXRGrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105785799"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 12:02:19 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v8 1/7] drm/xe/topology: Add a function to find the index of
 the last enabled DSS in a mask
Date: Wed, 15 Jan 2025 12:02:07 -0800
Message-ID: <51aa2badd6fe077dd58184552d6966b94bb4ae4e.1736970203.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736970203.git.harish.chegondi@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
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

Last enabled DSS in a DSS mask can help estimate the maximum DSSes enabled
in the DSS mask, as the enabled DSSes can be discontiguous.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 746b325bbf6e..a72d26ba0653 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -25,6 +25,19 @@ void xe_gt_topology_init(struct xe_gt *gt);
 
 void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 
+/**
+ * xe_gt_topology_mask_last_dss() - Returns the index of the last DSS in a mask.
+ * @mask: Input DSS mask
+ *
+ * Return: Index of the last DSS in the input DSS mask,
+ *	   XE_MAX_DSS_FUSE_BITS if DSS mask is empty.
+ */
+static inline unsigned int
+xe_gt_topology_mask_last_dss(const xe_dss_mask_t mask)
+{
+	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
+}
+
 unsigned int
 xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
 
-- 
2.47.1

