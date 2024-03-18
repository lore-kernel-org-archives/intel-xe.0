Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B817BC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797B710F68A;
	Mon, 18 Mar 2024 18:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Puf+ZT0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19F110F68A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710785158; x=1742321158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=89And4h8qxDwmKZWe96fXuKz2VOwskY+/RKbe9YDGVc=;
 b=Puf+ZT0tdj9H4QUQBo0No8IkM79Dslcm4+hl816XlN+9tkiWP86tYN5J
 5iUeHe+AKopiQZxy9yk7b5bo4O0LL7PlVdHcetAb6L9twSUEXzuoAIiW2
 FZrxT+gSj8DgSyCaNpwt5OkIHnBMITJVJTpWfMCx/eBVpH8X25Oxe3bhX
 6GyH4emgge9H9uzJIwXecshiy32lPGIbgw4RiZirlEH0WrNQVbHw5/kvv
 t7Cp8am+YY1uhYP2lX+XTnZ2TbgZ4U9q+Osqr6o/5GV9n6SJ9UBA6I+fZ
 zRA48MS0icK+4gVM/ozdtGdgUx5SQoE5qNJWbaFq5RO7mcXd+aU8fVCNZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16255914"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16255914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13598143"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:05:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/3] drm/xe/device: fix XE_MAX_TILES_PER_DEVICE check
Date: Mon, 18 Mar 2024 18:05:35 +0000
Message-ID: <20240318180532.57522-6-matthew.auld@intel.com>
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

Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
index should always be less than.

v2 (Lucas):
  - Add fixes tag.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 5c254ec9c602..d413bc2c6be5 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -79,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 	if (MEDIA_VER(xe) >= 13) {
 		gt = xe_tile_get_gt(root_tile, gt_id);
 	} else {
-		if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
+		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
 			gt_id = 0;
 
 		gt = xe->tiles[gt_id].primary_gt;
-- 
2.44.0

