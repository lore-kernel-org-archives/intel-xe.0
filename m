Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8018AC9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5713B10F855;
	Fri, 25 Sep 2026 04:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfcb2mbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D9B10F827
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312012; x=1821848012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9DXBU/tbtWXLbiuFZ932sY4RYc3MzIoSwfUJqvvSR88=;
 b=bfcb2mbEh+EIoHEWIr9Y9Hsbxcq6D6CcOa1HuRDbIJiN+zS+pgv7s1wK
 n3MEIi6FXI0SVfqPtIrRuF471cdfy98beY3YxLPDKXiGXF2iOJY2kZZy5
 L4cYzPbplzWIFZmhRh6wQ1s0P7YuPZyJkbOIbyr18XCrCgO51YGT9yf27
 L+8YulyG5doDd0CbB179eu5KgV36c/Jq8Fp/PHJRyDp06QP/q8Al3XH/Y
 jvJL7j259hFcSCQuV4Oj928w+62Rb9dqR+F1DZCorsrW5JBUzKuSYA3cx
 wIPOdw8+R13ZQti2Zcank5GwNZ+bKzspgeqC6qbstZRz7mrQ0b8yx2WBs g==;
X-CSE-ConnectionGUID: djrkOC38RMCGUAJ5+Y4+fQ==
X-CSE-MsgGUID: 3rTVRxoAQHGnP82K6hkwGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156224"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
X-CSE-ConnectionGUID: zyr6bS0mRB2Nn8tJleI5Yg==
X-CSE-MsgGUID: v1TNrcvGTsiRrIxDkIG3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155523"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 11/24] drm/xe: Store level in struct xe_vm_pgtable_update
Date: Thu, 24 Sep 2026 21:53:07 -0700
Message-Id: <20260925045320.1325860-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

