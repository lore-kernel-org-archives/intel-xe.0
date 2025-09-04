Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EACCA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 14:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE9810EA6D;
	Thu,  4 Sep 2025 14:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRIxuTRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C2110EA6D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756996845; x=1788532845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aZou7zXi7A2Ms28F7hnAFyDUTRaLU5efkliI+KLBRr0=;
 b=cRIxuTRjxiLrcZJjiyU03afFxe9zvJelJ09R7cP7fK6VlPfsGD9U29SA
 oaGtmMXzTKnj2NXqtqG+BiRZTbenq2t3EBS/k4KmukPl3/lOEEOEAXOOy
 kaAPvBW/qnaKuJURgL61IfjpTczve+Cxq6zM9sfs6c7stwsKAqdT9DcL6
 Z/xLEToykNtNsipiGO4dMZoMrIsdpl8jAGrXevdYZkbvdxUvpSUoDIruV
 7UXChjFPi536MhsREhJvhjMyYztT/8ugBvQA92eP0LblU0WdG3P5WT20C
 yHSD3XP7R6seYxFdCV4/AKopCngJnpw1AdbQU3Mdt4OBn/usCeGpMLr5l A==;
X-CSE-ConnectionGUID: jOADpJWtTTW20yh6LVZzaw==
X-CSE-MsgGUID: ginXzjF3Rk6EyfbqSlS1sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70434794"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="70434794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:40:45 -0700
X-CSE-ConnectionGUID: AxypkdJPSda5NWdz7aiZ3g==
X-CSE-MsgGUID: 7eTbS00mRZuBi2D0Y0bCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="177172153"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:40:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH] drm/xe: Fix broken kernel-doc for the struct xe_bo
Date: Thu,  4 Sep 2025 16:40:26 +0200
Message-ID: <20250904144026.7222-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use correct multi-line kernel-doc style if required.
Some members were described only in the commit message.
Some other members were described using wrong names.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 314652afdca7..e1c330dd5c6d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -25,7 +25,9 @@ struct xe_vm;
 /* TODO: To be selected with VM_MADVISE */
 #define	XE_BO_PRIORITY_NORMAL	1
 
-/** @xe_bo: XE buffer object */
+/**
+ * struct xe_bo - XE buffer object
+ */
 struct xe_bo {
 	/** @ttm: TTM base buffer object */
 	struct ttm_buffer_object ttm;
@@ -47,7 +49,7 @@ struct xe_bo {
 	struct xe_ggtt_node *ggtt_node[XE_MAX_TILES_PER_DEVICE];
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
-	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
+	/** @kmap: TTM bo kmap object for internal use only. Keep off. */
 	struct ttm_bo_kmap_obj kmap;
 	/** @pinned_link: link to present / evicted list of pinned BO */
 	struct list_head pinned_link;
@@ -82,10 +84,10 @@ struct xe_bo {
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
 
-	/** @ccs_cleared */
+	/** @ccs_cleared: true means that CCS region of BO is already cleared */
 	bool ccs_cleared;
 
-	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
+	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
 	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 
 	/**
@@ -99,9 +101,10 @@ struct xe_bo {
 	struct drm_pagemap_devmem devmem_allocation;
 
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
-		struct list_head vram_userfault_link;
+	struct list_head vram_userfault_link;
 
-	/** @min_align: minimum alignment needed for this BO if different
+	/**
+	 * @min_align: minimum alignment needed for this BO if different
 	 * from default
 	 */
 	u64 min_align;
-- 
2.47.1

