Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D8DE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 09:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E090110E8D6;
	Tue, 17 Dec 2024 09:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xgo4Osyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D0D10E8CB
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734428832; x=1765964832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JggU5ruQeXQFCfJIlmzYu6LtdjVatnLNCCx4tqDk1w=;
 b=Xgo4Osywsthhc0FCVgy0kllUfBqrNhx3XOr77BPBQfOrSL+HiY81D4ta
 TgIWQactqcRUPg00x9exzgTc9bECqVxffws6hwUfTcpvZvMMOpDFgiNba
 XFKtjimptDrbVAW4EqOV5aHQb0i+HyLk1H7OFTYW5rHdSC79PzrQ07r8k
 qdJI6dgD89Xtd6xh0v2Au9YSEuc8aA4TOOIdkx4d5i+fB5s9W3gpMB0jp
 h4/APlEsJ2UFiwQFb2gSkMnQCJtLh6Nm7L3VO2xMSPLMHgL1r7CRHFOGm
 AA4p3/UlnrVArN9xoru50h616/GvlaTAuaFXfOLNzHCNoLsmbtCTazcOu g==;
X-CSE-ConnectionGUID: hq0ati8oTHqmaK7YVRCkZQ==
X-CSE-MsgGUID: KomTvxFPTfOrOIKW8PEwbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46238180"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46238180"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:12 -0800
X-CSE-ConnectionGUID: 8AVDXsH+SMStTyWdgEno6w==
X-CSE-MsgGUID: 4szzOBPBTkSz0McPOlS5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97364648"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:11 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v6 1/7] drm/xe/topology: Add a function to find the index of
 the last enabled DSS in a mask
Date: Tue, 17 Dec 2024 01:46:51 -0800
Message-ID: <4ad526d947136a5c1c1fd43d7f51051448d40f55.1734427624.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1734427624.git.harish.chegondi@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
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
2.47.0

