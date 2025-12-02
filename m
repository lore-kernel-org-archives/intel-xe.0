Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BC1D1267A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E061C10E6F7;
	Tue,  2 Dec 2025 22:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D14ivvvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C2D10E6F7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764714358; x=1796250358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sbzt2Q1di5PKfKI5eW3AQU41LaGt6SJavQ5LZ1zp9U4=;
 b=D14ivvvuSeJsJxRIvVrseQi4bhZYx7CyF35ksOmQ0sJaPW68+iBvMo81
 kZnfbboOSiaRHSvurcxg+w+dmXO70J2EKCa+DhkJ6RJpU3JMT57jvFbJn
 b55TPUr+E4qSZ+jo80ubD7EdGlAxfL/PwYUF1dFo29+DbRsYSnObHaXaG
 TaW1/iRBP29ba1Alp8R5XE0pogLFwb8fkLQKkNXGO91hcUU+BOCPeIx4V
 w3vGb7CG+kup5WNNfr3niSCzR/eW5ozHRHDcvjIPIJDFXbpNw1t+LTkza
 itYlWEQ+GhZ6I4pVci9/CE7SXAQkl00JsppvYteIzRcS3ovAj1m05kqAk A==;
X-CSE-ConnectionGUID: MLleCyOXRouHeAlwrzxV9g==
X-CSE-MsgGUID: T6+uUl2CSMCDP+P2IldDWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66588240"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66588240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:25:58 -0800
X-CSE-ConnectionGUID: HBEc/5A6RP+585mX4aq6dw==
X-CSE-MsgGUID: tNgAxGXuS/yIs8yvZpvNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194600355"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:25:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/sync: Use for_each_tlb_inval() to calculate
 invalidation fences
Date: Tue,  2 Dec 2025 14:25:52 -0800
Message-ID: <20251202222551.1858930-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
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

xe_sync_in_fence_get() uses the same kind of mismatched fence array
allocation vs looping logic that was previously noted and changed by
commit 0a4c2ddc711a ("drm/xe/vm: Use for_each_tlb_inval() to calculate
invalidation fences").  As with that commit, the mismatch doesn't cause
any problem at the moment since for_each_tlb_inval() loops the same
number of times as XE_MAX_GT_PER_TILE (2).  However we don't want to
assume that these will always be the same in the future, so switch to
using for_each_tlb_inval() in both places to future-proof the code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ff74528ca0c6..1fc4fa278b78 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -311,8 +311,11 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 		struct xe_tile *tile;
 		u8 id;
 
-		for_each_tile(tile, vm->xe, id)
-			num_fence += (1 + XE_MAX_GT_PER_TILE);
+		for_each_tile(tile, vm->xe, id) {
+			num_fence++;
+			for_each_tlb_inval(i)
+				num_fence++;
+		}
 
 		fences = kmalloc_array(num_fence, sizeof(*fences),
 				       GFP_KERNEL);
-- 
2.51.1

