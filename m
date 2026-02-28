Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D9104893A
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA7310EC66;
	Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kM+0K6HF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68010E1E1
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242510; x=1803778510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eglji7Lju4kF3NxTPjOVrlIDWG9C68XBuE07KGiAsO4=;
 b=kM+0K6HFD3gs2tc8BPb0vfMO2cE0Duv8N/17T53W0OikrXz8JqkjUW9X
 NRrxcZvLJ7ErXqn843Olyc7RMVZjPS+hRkwTCABNdXTPw3qejPldqjf7h
 5IL8g8faZDDev/+nENMhZoLAIBj25anXpTxXXZbLDVC2x1zMGQVOOqIWl
 NGGYOSgovKCr2ptrhTxI1qaP+qjg9xSwCTJF4AginBxBqUQ0HYbIhE1nv
 qK3W/xIGPR1xi8YyKVCmYLGPcuxThFEKS0+na4Ywcu37ZsJJZWx0Yhmzd
 sFXYtpXQ5G0Po98ZUCulm1+FAQiYtlS35U+l6/x5b9Loky4rwLlmPiQu1 g==;
X-CSE-ConnectionGUID: nq/c89zQQx+CePP6Vxdteg==
X-CSE-MsgGUID: yn0rTir6QRiYSlL5oYmsHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966350"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966350"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:07 -0800
X-CSE-ConnectionGUID: dnlrPDlnRey1ENacVe1hew==
X-CSE-MsgGUID: hxObH/UCRvWZHt2hjt4W7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854868"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 11/25] drm/xe: Store level in struct xe_vm_pgtable_update
Date: Fri, 27 Feb 2026 17:34:47 -0800
Message-Id: <20260228013501.106680-12-matthew.brost@intel.com>
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

The level was previously extracted from struct xe_pt inside
xe_vm_pgtable_update during CPU binds, which always occurred during the
bind IOCTL. With CPU binds now supported in bind jobs, struct xe_pt may
no longer be valid in memory at that point. To address this, store the
level directly in struct xe_vm_pgtable_update.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 3 ++-
 drivers/gpu/drm/xe/xe_pt_types.h | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6b56e62a35c1..0a90d1460a8b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -381,6 +381,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->flags = 0;
 	entry->qwords = 0;
 	entry->pt_bo->update_index = -1;
+	entry->level = parent->level;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_objs(*entry->pt_entries, XE_PDES);
@@ -1830,7 +1831,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
 				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
 	if (map && map->is_iomem)
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 92d50573ed1d..aa1d7c0e8669 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -65,12 +65,18 @@ struct xe_vm_pgtable_update {
 	/** @qwords: number of PTE's to write */
 	u32 qwords;
 
-	/** @pt: opaque pointer useful for the caller of xe_migrate_update_pgtables */
+	/**
+	 * @pt: opaque pointer useful for PT building in the bind IOCTL. Only
+	 * safe to touch during the bind IOCTL (i.e., not in bind jobs).
+	 */
 	struct xe_pt *pt;
 
 	/** @pt_entries: Newly added pagetable entries */
 	struct xe_pt_entry *pt_entries;
 
+	/** @level: level of update */
+	unsigned int level;
+
 	/** @flags: Target flags */
 	u32 flags;
 };
-- 
2.34.1

