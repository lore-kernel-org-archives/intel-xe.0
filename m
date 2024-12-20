Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCC9E7718C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 11:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3351610EF92;
	Fri, 20 Dec 2024 11:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hw7qeAbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE8510EF92
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734693784; x=1766229784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l2dFb62TofsIs0Q5bYhcCOxJyjQgBa0ByGGf5eFU2TU=;
 b=Hw7qeAbWFk2STqt14tyZFGNk44UoaoZYndlROVRDaZH8jh5GaieaTU9e
 XAo/272bMzvZ+O0L/eUTHfS8GVeO6nY0UIu3/9QjxeRC+Ideft1Yc0naE
 AYoPQ+5hVqdHiM08XTnJ+v5YqLqmBimh4TVaGBhes4d6NWKpcWTT5NIup
 6wwoIr2kdvTZnlp/7ftJMct7SdBkVbeHc7Ayu884Khqs57fTFgBeO8lZw
 jU5rgiULfpEbKQRfO7+8mtsGHAAYmyCRD+ooo4WjtCYrMgLIjytFfFBhj
 8V7VHOEFgtyJmdgAG2QdE5bZJmem+fZQmgKZQvIT1XT7sOruoPI8FXlen A==;
X-CSE-ConnectionGUID: znWEnXlLSMqy9U89UxILRQ==
X-CSE-MsgGUID: EwnVZK59SvWs2RXriPDncg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35406917"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="35406917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 03:23:02 -0800
X-CSE-ConnectionGUID: z8T+YdR0Sz6/p1+nZe+jjA==
X-CSE-MsgGUID: bG+eRP0xS6GnKuCtMgLNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98396177"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 03:23:03 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v7 1/7] drm/xe/topology: Add a function to find the index of
 the last enabled DSS in a mask
Date: Fri, 20 Dec 2024 03:22:50 -0800
Message-ID: <2f0e8b5cfff0f917473258f4321a0d7c40b4be8e.1734693129.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734693129.git.harish.chegondi@intel.com>
References: <cover.1734693129.git.harish.chegondi@intel.com>
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

