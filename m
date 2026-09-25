Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3505C98333
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E4A10FC64;
	Fri, 25 Sep 2026 20:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSncYSvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A862210FC3B
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367333; x=1821903333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=06udxMkhdNH13x/4rY9WgxQVDjU0oaLuAXRERGTsdt8=;
 b=YSncYSvZFvBo3KQJ7t5ACsKyq0WeXnZfevpCfzfzGAeU4WPzCYdIJ9Mo
 wuONLe8On4QqxniZOLGxYJkBy1zcKqQ1/G9oBPnrK0LBI8xnnnPLkinjA
 w4fGqxpgcFYZNE8qyAobqMNiRfznVpj0Q7R2bDtwJxeW4pXwFtDVGbiBi
 LmEf4GPst3pMdjE/JwQc990jglSL+MbvdwQ5kJOU9iZZwUkuxFFVfkSO9
 GwmD8kTFC4Mm4QAdtsEztPSxhKIhj6nBL7tF6mmFE/ZWhi8DA3YbONdnx
 eXxFZhLkH4U63gsgMtcZGFG/AhjCiP7qVt8ZpKobOaIjTLVkDWBbh8EET g==;
X-CSE-ConnectionGUID: xI1zeODMTzGn1s+z4A7//g==
X-CSE-MsgGUID: h8LDVZWPQ9aGSF1ZXdoXzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377954"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377954"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
X-CSE-ConnectionGUID: s0lwGWD1RP++tvJWP9mfnQ==
X-CSE-MsgGUID: EDvmD6HHSNycSbiChOvNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509868"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 11/24] drm/xe: Store level in struct xe_vm_pgtable_update
Date: Fri, 25 Sep 2026 13:15:13 -0700
Message-Id: <20260925201526.1355279-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
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
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_pt.c       | 3 ++-
 drivers/gpu/drm/xe/xe_pt_types.h | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c004ce449b69..a483158f94d4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -380,6 +380,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->flags = 0;
 	entry->qwords = 0;
 	entry->pt_bo->update_index = -1;
+	entry->level = parent->level;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_objs(*entry->pt_entries, XE_PDES);
@@ -2025,7 +2026,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
 				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
 	if (map && map->is_iomem)
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 39c5b89ce9b7..ccab6613385f 100644
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

