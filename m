Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7652CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 09:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8420810F5DF;
	Thu,  1 Oct 2026 09:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNPCt6Lz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A6110F5DF
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790847945; x=1822383945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGTaQfkZDWPtuZrAj6Z7wRdmGS5oXDZNAh0OQDbA544=;
 b=YNPCt6LzQd4Sgt3Z3/G/THaChpMPnQUIELt66hLjOBcxhpDj7xSIhaUU
 37LuzJmhzpOXQVSolnADKRmEOFRcMsntDe40eyKCLrwbMC4Hq3QfVTTrR
 6PQEW8D8lVuSrBwJXlKNKFefJ5JsrS9n9jl61B/hmTLh89S4+zhxYcJ6U
 LV3JBGG96Mt2EV3bCVSQ3Vpdsl/B4BsgvR3x2c0aDf89Q9Iq38rS63hoJ
 50MJxqTa9dt5CDUM9NOpCxHHF9W/VHV1uDq3SXEU0gj3OcgumWzP7Ple2
 Vx+l3HRAueeUlsIU/W4N0QsnNFy3V7iDjLQUNLpA8OQFNRwKQk7Prcwb5 A==;
X-CSE-ConnectionGUID: laseq9tRQn2+w4flIrPRgg==
X-CSE-MsgGUID: SA6tsuB9TneF4JKyyGoclA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102124031"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102124031"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:45 -0700
X-CSE-ConnectionGUID: 3mr+ZK9eTzuYwn2QOe/Gvg==
X-CSE-MsgGUID: 4tfwJEwARb+DMNYnUePXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="3791"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:44 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 3/4] drm/xe: Drop RCU list handling for VRAM bad-page tracking,
 use mgr->lock
Date: Thu,  1 Oct 2026 15:15:22 +0530
Message-ID: <20261001094518.1493651-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
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

queued_pages and offlined_pages were mutated with list_add_rcu()/
list_del_rcu()/kfree_rcu(), but the only lockless consumer was the
vram_bad_pages debugfs show function. Every other reader and writer
already runs under mgr->lock, so the RCU protection bought nothing
but complexity and a rcu_head field on every tracked entry.

Convert all list operations to plain list_add()/list_del()/kfree(),
including the retry helper added by the ghost-ownership fix, and
have vram_bad_pages_show() take mgr->lock instead of rcu_read_lock()
so list traversal is always serialized against mutation.

Fixes: 7737f819e9f1 ("drm/xe/vram: Add VRAM page offline fault handler")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 26 +++++++++++-----------
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 --
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index ed79e4c6ba1a..7211ab5f66e9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -243,9 +243,9 @@ static void xe_ttm_vram_retry_queued_pages(struct xe_ttm_vram_mgr *mgr)
 			continue;
 		}
 		--mgr->n_queued_pages;
-		list_del_rcu(&pos->queued_link);
+		list_del(&pos->queued_link);
 		++mgr->n_offlined_pages;
-		list_add_rcu(&pos->offlined_link, &mgr->offlined_pages);
+		list_add(&pos->offlined_link, &mgr->offlined_pages);
 	}
 }
 
@@ -394,17 +394,17 @@ static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
 	struct xe_ttm_vram_offline_resource *pos, *n;
 
 	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
-		list_del_rcu(&pos->offlined_link);
+		list_del(&pos->offlined_link);
 		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
 		--mgr->n_offlined_pages;
-		kfree_rcu(pos, rcu);
+		kfree(pos);
 	}
 	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
-		list_del_rcu(&pos->queued_link);
+		list_del(&pos->queued_link);
 		/* queued entries have no buddy reservation yet */
 		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
 		--mgr->n_queued_pages;
-		kfree_rcu(pos, rcu);
+		kfree(pos);
 	}
 }
 
@@ -823,7 +823,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 			}
 			/* Queue free(to-be-purged) pages */
 			++vram_mgr->n_queued_pages;
-			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
+			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
 		} else {
 			/* Immediately offline unoccupied pages */
 			/* Queue free(to-be-reserved) pages */
@@ -837,11 +837,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 					"Page at addr:0x%llx still busy (%d), deferring reservation\n",
 					addr, ret);
 				++vram_mgr->n_queued_pages;
-				list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
+				list_add(&nentry->queued_link, &vram_mgr->queued_pages);
 				return 0;
 			}
 			++vram_mgr->n_offlined_pages;
-			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
 			return ret;
 		}
 	}
@@ -1045,16 +1045,16 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
 			continue;
 		mgr = to_xe_ttm_vram_mgr(man);
 
-		rcu_read_lock();
+		mutex_lock(&mgr->lock);
 
-		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
+		list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
 			u64 pfn;
 
 			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
 			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn, PAGE_SIZE);
 		}
 
-		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
+		list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
 			u64 pfn;
 
 			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
@@ -1062,7 +1062,7 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
 				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');
 		}
 
-		rcu_read_unlock();
+		mutex_unlock(&mgr->lock);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 95a427e3b0a7..ef7e4c87a7bb 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -81,8 +81,6 @@ struct xe_ttm_vram_offline_resource {
 	u64 addr;
 	/** @status: buddy reservation status */
 	enum xe_page_reserve_status status;
-	/** @rcu: RCU head for deferred freeing */
-	struct rcu_head rcu;
 };
 
 #endif
-- 
2.52.0

