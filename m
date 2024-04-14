Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EAAC04FF8
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 19:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9D112326;
	Sun, 14 Apr 2024 19:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3sKKlNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ED9112322
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 19:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713121323; x=1744657323;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IVII3sNYJ9/myf87G2PO9/V9AFLWrOd9A4BPjcXWVDw=;
 b=W3sKKlNbv0X0vX0okdC1hRrX1Bh7bkYfNqFGjDGhyZaK9T+uCP7gD5jR
 KEanwpjsvrPG8DMLMyytUhYm9E3VwcCMONW631uBObvqPk1CyDz2mxFQ+
 nv0+sbmEZmUCDcTB4aiJI58nJKpzYHdbkAJFtmAA+ET7dFIDBkJUEBUQ3
 eKOlB8JxHFlpUNqIXWIIqGYdQ7/wtMecdQjLtZ07Gd3lm0vYM8ruj4qsT
 Y2kAzgzdT8NA0RsHvv0GmZK/xeLBr/CNRwJAKeIhRVEszPgQKenf+niZX
 YZ57aHYlQionf2uOEjkIwYgLluQQEu7XJdZLefWAlQNU3hrEZVyLq0zEA Q==;
X-CSE-ConnectionGUID: xYzZqI0sSmSrO1FLMC3/kw==
X-CSE-MsgGUID: NnZTuzbMS/i7rvHAYDwYTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="30983593"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="30983593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:02 -0700
X-CSE-ConnectionGUID: qTfmxUxeRUW2aXeoUamfnA==
X-CSE-MsgGUID: wrThfKIGQsW/5TeQwrYJOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="26383428"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.61.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/xe: Allow to assign GGTT region to the VF
Date: Sun, 14 Apr 2024 21:01:33 +0200
Message-Id: <20240414190137.1243-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240414190137.1243-1-michal.wajdeczko@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
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

VF's drivers can't modify GGTT PTEs except the range explicitly
assigned by the PF driver. To allow hardware enforcement of this
requirement, each GGTT PTE has a field with the VF number that
identifies which VF can modify that particular GGTT PTE entry.

Only PF driver can modify this field and PF driver shall do that
before VF drivers will be loaded. Add function to prepare PTEs.
Since it will be used only by the PF driver, make it available
only for CONFIG_PCI_IOV=y.

Bspec: 45015
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 ++
 drivers/gpu/drm/xe/xe_ggtt.c          | 44 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h          |  4 +++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 558519ce48c7..4389e5a76f89 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -9,6 +9,8 @@
 #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
 #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
 
+#define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
+
 #define GUC_GGTT_TOP		0xFEE00000
 
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..f090cab065b8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -460,6 +460,50 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+#ifdef CONFIG_PCI_IOV
+static u64 xe_encode_vfid_pte(u16 vfid)
+{
+	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
+}
+
+static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
+{
+	u64 start = node->start;
+	u64 size = node->size;
+	u64 end = start + size - 1;
+	u64 pte = xe_encode_vfid_pte(vfid);
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!drm_mm_node_allocated(node))
+		return;
+
+	while (start < end) {
+		xe_ggtt_set_pte(ggtt, start, pte);
+		start += XE_PAGE_SIZE;
+	}
+
+	xe_ggtt_invalidate(ggtt);
+}
+
+/**
+ * xe_ggtt_assign - assign a GGTT region to the VF
+ * @ggtt: the &xe_ggtt where the node belongs
+ * @node: the &drm_mm_node to update
+ * @vfid: the VF identifier
+ *
+ * This function is used by the PF driver to assign a GGTT region to the VF.
+ * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
+ * platforms VFs can't modify that either.
+ */
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
+{
+	mutex_lock(&ggtt->lock);
+	xe_ggtt_assign_locked(ggtt, node, vfid);
+	mutex_unlock(&ggtt->lock);
+}
+#endif
+
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 8306ef74abc6..4a41a1762358 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -33,4 +33,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
+#ifdef CONFIG_PCI_IOV
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid);
+#endif
+
 #endif
-- 
2.43.0

