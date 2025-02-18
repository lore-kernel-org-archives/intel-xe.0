Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB3C021B0
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 19:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A779410E753;
	Tue, 18 Feb 2025 19:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfvCgR99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C205510E752
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739908458; x=1771444458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vcIO6ufd/CStZunQg4ScgAWiZZTrQHIpooQT11utN8s=;
 b=AfvCgR99uhKgWevUjONuNKdaEhhlu1hCDEnGhLYZAPv4AxushYNgF+7T
 J5hZ3FRULIKt8Z/zoiYQvhhPRcuw0K00GKrsSo8xF703mbYihbUZLXolv
 1tlHAIIHP3Qb/zo6UUGo8qfdKs06+GD3SqB+cv3NUpCPrZRYZ7WCegzjK
 xncGINfH85beOXYlou72mzS5LgapOncpxlgks9Wzrq2TdEhXdLvcB9hsg
 nOKStrv2TwIlks7LBAXOj8zV7PZd0afFJv2+U73w/0jJSv6ZMCf9aKF5H
 QDp6jgl3OT+t+46y+47xmaH9vB/wZyHzfj9kfji5gEg2DKc7lPXlAbeXz w==;
X-CSE-ConnectionGUID: zD7+FqNfTxKgNFqymBCwHw==
X-CSE-MsgGUID: GTufFS8cQW6LIKBEVTR5UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44382047"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44382047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:17 -0800
X-CSE-ConnectionGUID: uLxN+/WGRFy7WLqdZ47bog==
X-CSE-MsgGUID: 0NpbRiKHTCqX9dJ8Sw2/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151706346"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:17 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v10 1/8] drm/xe/topology: Add a function to find the index of
 the last enabled DSS in a mask
Date: Tue, 18 Feb 2025 11:53:51 -0800
Message-ID: <e117663e52fe9516064f5d1ab6250d4d6298e520.1739906138.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739906138.git.harish.chegondi@intel.com>
References: <cover.1739906138.git.harish.chegondi@intel.com>
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

