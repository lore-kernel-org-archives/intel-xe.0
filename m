Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8D7EB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 12:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7032E10E55D;
	Thu, 22 Jun 2023 12:40:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C3810E55A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687437603; x=1718973603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ncduN10yl56shF88pKp1rOLEy6uNFApxZqhM1Q0ZraY=;
 b=gG35BUWOh6DhWMqVMryNDRK7Kqb9Hpnf0WBxBNtks7Yzt5JZg7aj7cK3
 1A4486LENb4zKnBExWjIE20tWbdPo5r9M6p5iu66vdpwR3nZFFk/BQr0P
 p3Qsy8W1GBpVcLVcFV2yVPgEzgIhzCmRLVJmwRZODtucuXmFghm16MCHS
 /O10jjGWUQIk0pkL1XDKENCn7p/OXiFPHcymiG7nDVY5CHGP5x2nt9Trw
 lUXxWSMQfpRAyYP4NZjknDOqS78cSXug5k2xmX6XhA6gXpWOTgkDaofCn
 B7hOiAObHgAIqJt5Bbeb4cQET4RXdzzNEFq/tOWz6kjEr3KKPMA/9i9uQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360492997"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="360492997"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1045149783"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="1045149783"
Received: from aadriaen-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.46.83])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:40:01 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:39:46 +0000
Message-Id: <20230622123946.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622123946.7-1-francois.dugast@intel.com>
References: <20230622123946.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 3/3] drm/xe: Document topology mask query
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
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Provide information on the types of topology masks that can be
queried and add some examples.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f412150fa636..bcec0df6d115 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -212,6 +212,9 @@ struct drm_xe_query_gts {
 /**
  * struct drm_xe_query_topology_mask - describe the topology mask of a GT
  *
+ * This is the hardware topology which reflects the internal physical
+ * structure of the GPU.
+ *
  * If a query is made with a struct drm_xe_device_query where .query
  * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
  * struct drm_xe_query_topology_mask in .data.
@@ -220,8 +223,29 @@ struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
 	__u16 gt_id;
 
+	/*
+	 * To query the mask of Dual Sub Slices (DSS) available for geometry
+	 * operations. For example a query response containing the following
+	 * in mask:
+	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
+	 * means 32 DSS are available for geometry.
+	 */
 #define XE_TOPO_DSS_GEOMETRY	(1 << 0)
+	/*
+	 * To query the mask of Dual Sub Slices (DSS) available for compute
+	 * operations. For example a query response containing the following
+	 * in mask:
+	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
+	 * means 32 DSS are available for compute.
+	 */
 #define XE_TOPO_DSS_COMPUTE	(1 << 1)
+	/*
+	 * To query the mask of Execution Units (EU) available per Dual Sub
+	 * Slices (DSS). For example a query response containing the following
+	 * in mask:
+	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
+	 * means each DSS has 16 EU.
+	 */
 #define XE_TOPO_EU_PER_DSS	(1 << 2)
 	/** @type: type of mask */
 	__u16 type;
-- 
2.34.1

