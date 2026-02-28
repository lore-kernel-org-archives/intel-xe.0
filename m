Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27E51048925
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782F10E1DA;
	Sat, 28 Feb 2026 01:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mj1TewhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144B010EC52
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242509; x=1803778509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AaC/GY2sljKGOpIMuuMMOxL/yA+/y/fIUzuOfWdNxyE=;
 b=mj1TewhOCXlxeDLrKxRVYDr0pzQdL5wx5F/q5qNRNAsG6uSxty4XQuA2
 on3jKJ00QX1WNz1TJSrysavCiu6atiPihBErgxtht/kjhXGHreWNfotWS
 wqQFdjizKme4cvT9He79KpaAnqPKVxalJ8plmpaUj6sCZ/wSC77dfbE9z
 AufFIJ1CsaCoBYpfWeXBvydy38k7ikhRYn29rzrUUPLwxdTAU9DvgYuw6
 2b8q7OX2NOnX/W4/pZq9u4Klxg1ZD7VRKohfX7+VEkNH/lpy0mokbC0QG
 u0dYvI2Y+Z9HTkM/tPbaBBPGcNP/LvvHvDPSVjK+YbkNHTidyJGmfNZb6 w==;
X-CSE-ConnectionGUID: gKXQXI6JRbiGj11IWUzfFw==
X-CSE-MsgGUID: RJYGisFhTuGF+e38cMGFZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966344"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966344"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:06 -0800
X-CSE-ConnectionGUID: gCwOQEf8RcKyW/i848b9jA==
X-CSE-MsgGUID: yFb0U1xdRpCWU4vCPxpwNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854848"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 05/25] drm/xe: Update xe_bo_put_deferred arguments to
 include writeback flag
Date: Fri, 27 Feb 2026 17:34:41 -0800
Message-Id: <20260228013501.106680-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Update the xe_bo_put_deferred arguments to include a writeback flag,
which indicates whether the BO was added to the deferred list. This is
useful when the caller needs to take additional actions after the BO has
been queued for deferred release.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h         | 10 ++++++++--
 drivers/gpu/drm/xe/xe_drm_client.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c         |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c914ab719f20..bf284ed47325 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -348,6 +348,8 @@ void __xe_bo_release_dummy(struct kref *kref);
  * @bo: The bo to put.
  * @deferred: List to which to add the buffer object if we cannot put, or
  * NULL if the function is to put unconditionally.
+ * @added: BO was added to deferred list, written back to caller, can be NULL if
+ * writeback is not needed.
  *
  * Since the final freeing of an object includes both sleeping and (!)
  * memory allocation in the dma_resv individualization, it's not ok
@@ -367,7 +369,8 @@ void __xe_bo_release_dummy(struct kref *kref);
  * false otherwise.
  */
 static inline bool
-xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
+xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
+		   bool *added)
 {
 	if (!deferred) {
 		xe_bo_put(bo);
@@ -377,6 +380,9 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
 		return false;
 
+	if (added)
+		*added = true;
+
 	return llist_add(&bo->freed, deferred);
 }
 
@@ -393,7 +399,7 @@ xe_bo_put_async(struct xe_bo *bo)
 {
 	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
 
-	if (xe_bo_put_deferred(bo, &bo_device->async_list))
+	if (xe_bo_put_deferred(bo, &bo_device->async_list, NULL))
 		schedule_work(&bo_device->async_free);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 84b66147bf49..45efe7a55427 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -246,7 +246,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 			xe_assert(xef->xe, !list_empty(&bo->client_link));
 		}
 
-		xe_bo_put_deferred(bo, &deferred);
+		xe_bo_put_deferred(bo, &deferred, NULL);
 	}
 	spin_unlock(&client->bos_lock);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 99b15d37267f..83dacc91b7b3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -212,7 +212,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 
 	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
 	xe_bo_unpin(pt->bo);
-	xe_bo_put_deferred(pt->bo, deferred);
+	xe_bo_put_deferred(pt->bo, deferred, NULL);
 
 	if (pt->level > 0 && pt->num_live) {
 		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
-- 
2.34.1

