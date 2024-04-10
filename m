Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACB8CD1296
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 08:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF82610E8BB;
	Wed, 10 Apr 2024 08:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2gGT7cM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FC210E8BB
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712738081; x=1744274081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8JajhfC25vtFwTzNUincjAIx2+RY5I+F3Mnvy9QjZNY=;
 b=b2gGT7cMhnJ7HgFeNOk6tkG/bGeBgIrrxuky6todq5W2KG8fXOGYVKgF
 HMDuV6lHbp8LRs6qmihgU8/QuLqNvHqqvc0u8IqoH+GRETWiB1UsFCiAs
 X7kMnTAq8UWGVBVHWuiWccogpK4o0wkSyIoBlF2xn2VMX10NFBI0Tytpq
 o9hrY9igC9Jrf1TCvuzcCrK3b3di+eXUwPkMpZiUwY3cH0uMaVAGJycfD
 F/9ZTSSdOd8M6CQ+MZZUZxGYPhZUuE7kyq5taINIBoyucpU6MjaeN3Oaz
 M2HQAzj9zOcce41HsWpu2NBcIDqj7ERYKQGY4ZQgiSJjJuvGwHko3x+fi w==;
X-CSE-ConnectionGUID: xzh4pB7xQVe9wWY29kamgQ==
X-CSE-MsgGUID: dunWqxPRTM64zbOJNxXYkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25529390"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25529390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:34:41 -0700
X-CSE-ConnectionGUID: /QbcOSIOSxSUCyQ69+qpzg==
X-CSE-MsgGUID: VMJfBL+9Sea2iKtSlCauZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25174862"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:34:40 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Use enum mode in drm_mm_insert_node_in_range
Date: Wed, 10 Apr 2024 10:20:39 +0200
Message-ID: <20240410082039.11249-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Use DRM_MM_INSERT_BEST as mode instead of zero.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..910153eed457 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -408,7 +408,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
-					  alignment, 0, start, end, 0);
+					  alignment, 0, start, end,
+					  DRM_MM_INSERT_BEST);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
-- 
2.42.0

