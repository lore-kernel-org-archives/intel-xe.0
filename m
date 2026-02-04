Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0E3EA7942
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3044510E748;
	Wed,  4 Feb 2026 19:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvrnWx/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C8F10E748
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770232233; x=1801768233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/xz6bKNyPjYEgx1FD9mK6il+vsqA/NSobfLGBdlWugY=;
 b=KvrnWx/Sn0ixOT22FUQLdiv6M1CN49FGZzKvGsLDmWf2ykk5oZ4csKfY
 iJrfo120FhZ766Q1qaXfelPOlHsWzfw7aebSHkWHPOE9UrGDg8ZvAPP5O
 b5StEUySxGJ3PWobXnqb1RZO+YsrJm2Llf88S+P7g8i5l4TM9U8/W1sTW
 qLJLUq1Ru88QX/Oz60wMs9SsaQSk3cGCNovM9LOl0JSLpO49qkQL3jhxf
 pLIXVBogNPEQMpso3HHNvJ9GX4BVjImEYSFC5yQxnE43Luog66BIFoDSf
 MVfcyjELNKe+gdVQJjUAxCwuLEt74Uxc7nkA9H71V7w91Y7NNjMLoBS1e w==;
X-CSE-ConnectionGUID: RJrvpr3jTLOMG1Klh1KYQQ==
X-CSE-MsgGUID: UxvMndsPQfCAO7CL7rrpDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82798366"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="82798366"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:10:33 -0800
X-CSE-ConnectionGUID: vY+R6Q3xSRqt1fA4lEtZLQ==
X-CSE-MsgGUID: 3ekOxkiFRN6tLnRol1lBgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="209356202"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:10:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Drop unnecessary goto in xe_device_create
Date: Wed,  4 Feb 2026 11:10:26 -0800
Message-ID: <20260204191025.3957211-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

The error label in this function just does an immediate return without
any further cleanup or processing.  Replace the goto statements with
returns.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 055084fa50e5..743c18e0c580 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -456,16 +456,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, 0);
 	if (WARN_ON(err))
-		goto err;
+		return ERR_PTR(err);
 
 	xe_bo_dev_init(&xe->bo_device);
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	err = xe_shrinker_create(xe);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
@@ -475,7 +475,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	err = xe_irq_init(xe);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	xe_validation_device_init(&xe->val);
 
@@ -485,7 +485,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	err = xe_pagemap_shrinker_create(xe);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
@@ -504,7 +504,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	err = xe_bo_pinned_init(xe);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
@@ -518,18 +518,14 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		 * drmm_add_action_or_reset register above
 		 */
 		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
-		err = -ENOMEM;
-		goto err;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	return xe;
-
-err:
-	return ERR_PTR(err);
 }
 ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
-- 
2.52.0

