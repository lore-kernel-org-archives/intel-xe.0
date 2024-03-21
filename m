Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD1AC54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DF810EB11;
	Thu, 21 Mar 2024 14:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6WmU+p/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B021910EAFA
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711031131; x=1742567131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tKPBXSQ2EWOPQHnq+OQJKRbkzmstAE3F00jrEfGQDdU=;
 b=V6WmU+p/EHJz2sYFNFDRSPTpRdwc6WwvZo40nntlNAydJpEYrdLMWhCm
 i9/B11SVqKLOkqDd5znrhTtUBOJEbgsnB90D5Bnsk5jEQwKvvgCOf+tiK
 JWtyMks2XixZJeL9i/hC0eIdpRaLlwZjhkcE08iv+f+XCSdrIg7HxEBuw
 I0yEn01upzi3nfXDnhcAU7a5FBp0I+yFBYcZDSDVE25StEbe+8ED2mWRZ
 DnFWNWwsCzXIZWZ4FdXvm3faXwyuqbcB9ZjhVbADyfZUZ6hLQyNG1kmoV
 MtTVPtfn3Vw4954JqhMUcPOAaHo7TPnkOgbkrsi3Sx1uRDEl89l9g24ps A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17469183"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="17469183"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="37633307"
Received: from wanxiufe-mobl.ccr.corp.intel.com (HELO 0f71f048c3a7.intel.com)
 ([10.252.54.215])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:25:29 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 1/2] drm/xe/query: Define and use a constant for the number
 of masks
Date: Thu, 21 Mar 2024 14:25:20 +0000
Message-Id: <20240321142521.7-1-francois.dugast@intel.com>
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

Replace a magic value by a constant with an explicit name to make clear
what it stands for: the number of masks returned by the topology query.

Suggested-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e80321b34918..fa8de1a77b1e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -23,6 +23,8 @@
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 
+#define TOPO_NUMBER_OF_MASKS   (3)
+
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
@@ -453,7 +455,8 @@ static int query_hwconfig(struct xe_device *xe,
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
 	return xe->info.gt_count *
-		(3 * sizeof(struct drm_xe_query_topology_mask) +
+		(TOPO_NUMBER_OF_MASKS
+		 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
-- 
2.34.1

