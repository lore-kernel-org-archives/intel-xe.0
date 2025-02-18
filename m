Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7D9C021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 20:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823810E11B;
	Tue, 18 Feb 2025 20:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dN/yk+xL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69DC10E753
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 20:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739909118; x=1771445118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IHdlBr3ynJ6HDCHY+cfhdUR304t++4R304fVzd5IPTo=;
 b=dN/yk+xLNy8Sb7B24eMXrnE2uxU3jl3xFDi501fY8/CfNyNwUmf3so5R
 yxrd6sUfw4KpvcOlJH4cNvirc+4mgHXnhb6RvuV+BfCNTcSuZnIMtS6dT
 me52KEUxzAMsZ24dlbcKqr//oaI4KKOrt9idd5EQcOO5NsTZKTBQfZevC
 r7hdXeKOVHFAntuJ5Le1nJuzlG4E91RjIp5gEa7TYasiFHtSq+BCsq1qO
 3JKYY3wabwVuBuo7GhQxhWDOVw7YjV3ibpphp5PK/wL4HInAilujdeFmU
 kkzy/K7hATrRNUvOtQ9njHWmy2Fi9ZPmiAiSxJYBmxqrfSd9oRcbuqY0y w==;
X-CSE-ConnectionGUID: uvqeqlTGSQ+safimQTdBTQ==
X-CSE-MsgGUID: 0CugFu+lQHaiw378xHysFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40748794"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40748794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:05:17 -0800
X-CSE-ConnectionGUID: nwj3k5RYQ8y6RoyHgCeBRg==
X-CSE-MsgGUID: 1pReL4VISl+eUon/20YbwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114976765"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:05:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Drop unnecessary GT lookup in
 xe_exec_queue_create_ioctl()
Date: Tue, 18 Feb 2025 12:05:12 -0800
Message-ID: <20250218200511.4050060-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.48.1
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

xe_exec_queue_create_ioctl() performs a lookup of the xe_gt for the GT
ID passed from userspace, but the result is never actually used.  Since
there's already a separate (and earlier) check that the ID passed from
userspace is valid, the unnecessary lookup can be removed.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6051db78d706..23a9f519ce1c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -539,7 +539,7 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 	return 0;
 }
 
-static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
+static u32 calc_validate_logical_mask(struct xe_device *xe,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
 {
@@ -601,7 +601,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
 	struct xe_vm *vm;
-	struct xe_gt *gt;
 	struct xe_tile *tile;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
@@ -654,8 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 					      &q->multi_gt_link);
 		}
 	} else {
-		gt = xe_device_get_gt(xe, eci[0].gt_id);
-		logical_mask = calc_validate_logical_mask(xe, gt, eci,
+		logical_mask = calc_validate_logical_mask(xe, eci,
 							  args->width,
 							  args->num_placements);
 		if (XE_IOCTL_DBG(xe, !logical_mask))
-- 
2.48.1

