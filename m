Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9CFC2BA1A
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 07:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012FD10EB09;
	Fri, 21 Jun 2024 07:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN7keHvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243B010EB01;
 Fri, 21 Jun 2024 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718954109; x=1750490109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yn32gGIVps1x9tBMGupKS4NW2Y3heciZ/sT0E1Rmt30=;
 b=YN7keHvk/gnsrrm3DbghhogBpR6E1/YfybPxIYpMccjTQhWkkMl+FoGV
 TifE53wTxYwRV9Nj8xQqk1h8NvCrG2leaOvaDjO+R9gcC3oNzVmRzxRb2
 b2XPy0pcGcXfU5TbVH/S+QJxfRBJQM1PBqqjbBw1B1VHzAH/3W2HBN1WU
 j0l5cdi09y28HVCIRIAh4snsnXVtM3cZqG4Uel7j0cmaQ9gu16EJeLWGf
 4d3OhkRUuivcZYTm4IyxbNHZylW0OXKZeiaDzrg6FiJ4/f8e7gJM179YC
 Vj2PwinyTO3mZLev3Xuc1G9ac6fPKKgpikUL/S+MR7iyDFL/+4Y9xppxY A==;
X-CSE-ConnectionGUID: MsCgsOsQT/OVBw2nnnbGDw==
X-CSE-MsgGUID: j6UrqWFETcKeofOVQxgLEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15807857"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="15807857"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 00:15:08 -0700
X-CSE-ConnectionGUID: QdSc1MzYRUig/tbzYh5S9w==
X-CSE-MsgGUID: 1bvzCrL7Q2uMoPh0pWQPWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="47698273"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa004.jf.intel.com with ESMTP; 21 Jun 2024 00:15:08 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v1 1/1] drm/xe/bo: Fix fixed placement ggtt pinning code
Date: Fri, 21 Jun 2024 00:15:06 -0700
Message-Id: <20240621071506.912055-1-alan.previn.teres.alexis@intel.com>
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

When calling xe_bo_create_pin_map_at, use the correct
starting offset provided by caller at xe_ggtt_insert_bo_at.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..cc6101b49c08 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1436,7 +1436,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 
 		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
 			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
-						   start + bo->size, U64_MAX);
+						   start, end);
 		} else {
 			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
 		}

base-commit: cffd77865f476994680892601e09bc2164179907
-- 
2.34.1

