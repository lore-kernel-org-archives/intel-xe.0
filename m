Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01558C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE9A10F651;
	Mon, 18 Mar 2024 18:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeQZv/KL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704DC10F690
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710785157; x=1742321157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nMtiAjk4hTuT3XW7yjH6yVNXpscZI+pGwVCwTBXNqLM=;
 b=KeQZv/KLwWt6Zt9nemnffRzmpPtK/bZ/JOf4HQa7u+X8YY3mXa2I/aOo
 M4R8TM012pzOKIqRf0X84KQRNgiPBpT/s1Bi9TI4hrGzsBBMJrbw4yEoO
 TypIZibya/S8AvGDCbnj0uOQFmgchevbAP1Tv1mFNnDM7q2gAPW9uLcAU
 P3M300fptFHfB8IqO9guyr71YROu73mKoJypSnLxIcSlxxhPPNuglEyPH
 SXc4+qi0MPoqUazxwYGMDxEv7QfwKcRntk0ukKv1Md4TUrRMU8Ev0yti2
 j8rkiOTIfCBB88Ldh0MAijv7zMLRS1/fVtqLeExIb6g20NDaFRsKW12pv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16255911"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16255911"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13598137"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:05:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 2/3] drm/xe/device: fix XE_MAX_GT_PER_TILE check
Date: Mon, 18 Mar 2024 18:05:34 +0000
Message-ID: <20240318180532.57522-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318180532.57522-4-matthew.auld@intel.com>
References: <20240318180532.57522-4-matthew.auld@intel.com>
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

Here XE_MAX_GT_PER_TILE is the total, therefore the gt index should
always be less than.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..5c254ec9c602 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -58,7 +58,7 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
 
 static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
 {
-	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id > XE_MAX_GT_PER_TILE))
+	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id >= XE_MAX_GT_PER_TILE))
 		gt_id = 0;
 
 	return gt_id ? tile->media_gt : tile->primary_gt;
-- 
2.44.0

