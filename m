Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC8C4829B
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45825112F6E;
	Tue,  6 Feb 2024 23:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzqNadFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5762C112F68
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUzm48nYqJx/5fFV17RinuF7nw0kz9lBwRoxENFlBSo=;
 b=nzqNadFr4nZXyzLkZ7HOScUPYyT75unydcP3xtcGs1gONHCfo4pRwJ8d
 g8RZTvoD3WJRjdJVdUI1wB8UhWWpmGn3YcadHLrNW5TWPLKynPtxaZmeV
 Q/XnEavosDwzPeiZIZ/WCQG/bq7l4Y+82ATFJXK1iDDWAF1krNxczn2ND
 1fxKQQP00Xb1lfWnU3gPTroUVI9pqHlKnJao9hKWSbPSt8Kd3/9Rnwum5
 RbTKoX9R7ZPf8HW+jDlJuH+4xahMdkAflYi0suHYnlvEyWvi3KarlalgL
 gdw8G64hTryRtKZbrYRgNehokPgMN9PmFpU3Hb4hzsNeptZcbLg7XZk2Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776798"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793826"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 15/22] drm/xe: Remove old functions defs in xe_pt.h
Date: Tue,  6 Feb 2024 15:37:22 -0800
Message-Id: <20240206233729.3173206-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

__xe_pt_bind_vma and __xe_pt_unbind_vma are unused, remove these.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index cbf8170d89cc..9ab386431cad 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -41,15 +41,6 @@ struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
-struct dma_fence *
-__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		 struct xe_sync_entry *syncs, u32 num_syncs,
-		 bool rebind);
-
-struct dma_fence *
-__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		   struct xe_sync_entry *syncs, u32 num_syncs);
-
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
 #endif
-- 
2.34.1

