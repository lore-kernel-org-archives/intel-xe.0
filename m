Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23131C00A94
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A94112742;
	Mon, 15 Apr 2024 17:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g67w/WO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88E10FCC2
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 17:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713202788; x=1744738788;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yuy5q3dUA+ZgcT3V7LKflpniQXe3QPPPLlJInquLwmA=;
 b=g67w/WO+HePVUUdzbjymf3nkA4IEw91gS4QFokm+ZrTOm40lyP/Gvk/q
 JcTIe3oOLNcuvlbEOPd9u3NoEh9EPD2lnLQrubLxb3mfhWIKmkhh3Gkyj
 C05z5djrHkh5hUILyTEE6x8t9FusALg96CqZvhyU/cQCCapavjovAMHDT
 dqssk3L7mcQtGBJNUCl8VLaDPj7p0Ec76qd8KL11U68uRZ59nohD8NuC2
 Rskdb8nxhOxab2ui5ETpZl0cmagswOx6Cld+HvGaEr/p0Dwrs4Sn897Br
 zzH74kJ/O7SFHadsXZB1MTp4O+CSxGbIuUXhd6BAUkXmEURrwfpZaRoDQ A==;
X-CSE-ConnectionGUID: vC07aQJYR0ezhr8Y589UyA==
X-CSE-MsgGUID: 1pmKbjUPSom0F+/9MkPaww==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19998702"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19998702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:48 -0700
X-CSE-ConnectionGUID: TJZ2vNfpTmGgkhY9NpsFAg==
X-CSE-MsgGUID: FQCw60yAQ2qDI/QpzXiSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22082763"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.45.29])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/xe: Allow to assign GGTT region to the VF
Date: Mon, 15 Apr 2024 19:39:33 +0200
Message-Id: <20240415173937.1287-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240415173937.1287-1-michal.wajdeczko@intel.com>
References: <20240415173937.1287-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Bspec: 45015, 52395
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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

