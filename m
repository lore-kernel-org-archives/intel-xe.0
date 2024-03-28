Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DE7C54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 14:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274CF11244A;
	Thu, 28 Mar 2024 14:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGFeenzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEF811244B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711634577; x=1743170577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HYE+lhzvQ5FTa1OKeD+dJKKccZCF7XAwY20vl+eLf+w=;
 b=QGFeenzhEnyoj8lA83tpwkkDtU9aE/sCREdaUl8Rey5sZwOnYLGVvfyq
 V7aklnmQCFdju0AJL85nnFIIpn0m/Ki8zuhFoQ8v5poR2CAmngzVcq/V3
 cFCsxrmf69fRuokHxrGEK3lp+CgSE6FN/YAjH65hyFiklHNecc2ojfa9Y
 NvOr+YFlv6uzJuahg160FUqVe+wW87j5NHN+m39TGpDGLF+xSFzw2b9rx
 sHkoClFX+uiQdg2vnHrYhOfJCkhh2KKMXQZY6p0BXSUl0B2/QbWWoKu81
 bzBEBNYvEzxN0UnIFupmkibWtK4T3tYfEukxZTzbxSttS9pWr/w5h2eI6 Q==;
X-CSE-ConnectionGUID: W8NB4H4qSY+j0vFn+/MxQg==
X-CSE-MsgGUID: 7zJaRyCxTKiGrdy1N2G/tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7388218"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7388218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17276562"
Received: from jattlan-mobl1.ger.corp.intel.com (HELO c3284f9a4adf.intel.com)
 ([10.252.56.46])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:02:55 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/uapi: Define topology types as indexes rather than
 masks
Date: Thu, 28 Mar 2024 14:02:43 +0000
Message-Id: <20240328140243.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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

The topology type is an index (not a mask) so define the values
like other indexes instead of using powers of 2. This is also
to make clear that the next type can use value 3. This commit
does not change the existing values so it does not break
compatibility.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Link: https://lore.kernel.org/intel-xe/20240327232317.GI718896@mdroper-desk1.amr.corp.intel.com/
---
 include/uapi/drm/xe_drm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 808ad1c308ec..95a8ecca21f4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
 	__u16 gt_id;
 
-#define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
-#define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
-#define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
+#define DRM_XE_TOPO_DSS_GEOMETRY	1
+#define DRM_XE_TOPO_DSS_COMPUTE		2
+#define DRM_XE_TOPO_EU_PER_DSS		4
 	/** @type: type of mask */
 	__u16 type;
 
-- 
2.34.1

