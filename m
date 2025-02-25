Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9937C021B8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 09:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8569710E5DB;
	Tue, 25 Feb 2025 09:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3LTKdpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789F110E5DC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475233; x=1772011233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vcIO6ufd/CStZunQg4ScgAWiZZTrQHIpooQT11utN8s=;
 b=S3LTKdpu5phVSNuAC77/FTLmoyJBunt1uFvxbAJlO9zHPPrWzauXUaJU
 8LD6xhwspDiCySGDFwbRG7LyCvTZ2PvXiOC9u3BlCfH2wwPkliwSP8Otb
 XJuw+lEO7rXTGYPOsE1VpIChHM/0vQvQcUX/SZMgQlVH4acux7OQ4k49Q
 cFZhAGpNHPu7U8A9XcBVX5Sj45o37hCiTq3M7FCIuehzwCJbn7JN0OB4g
 SVV019sF+fjPl5Evr3zcWa/uLlJDIGju8HlL0LAbk9sRATqZ0XlgXRyo5
 +G1VCC51eX7X8m85SY1BuDglOEaoGIFpTMdgmD/rBRBmpwfzHGMZ0rFMt g==;
X-CSE-ConnectionGUID: tcGb7jhmSlysSYYLDWFCZQ==
X-CSE-MsgGUID: lqu09Jb3Ro6J90KuJ4J3pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40507671"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40507671"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:32 -0800
X-CSE-ConnectionGUID: s+b/KBp8S0eUI6sbsZLnkQ==
X-CSE-MsgGUID: frzz1wgRQRKANKMruwQKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117261769"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:32 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v11 1/8] drm/xe/topology: Add a function to find the index of
 the last enabled DSS in a mask
Date: Tue, 25 Feb 2025 01:20:18 -0800
Message-ID: <1f8b422df961183cfc2c0324395827cd07fe604c.1740474556.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740474556.git.harish.chegondi@intel.com>
References: <cover.1740474556.git.harish.chegondi@intel.com>
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

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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
2.48.1

