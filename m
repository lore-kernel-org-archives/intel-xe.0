Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FFF606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oExyJf6J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C81810FD79;
	Wed, 18 Nov 2026 14:54:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C645E10FD79
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 14:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795013686; x=1826549686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HDgzX8tWbGL2BnpG5NYmhGwj55Wc7j4zSOi31BZtbKQ=;
 b=oExyJf6JdF9wYLpxgzxCqFiSgV46ZbMsfofefG4R/xLA8/rKa7mfSAtk
 wtK9uylwhLjzjf56UACxWrNV305es8g+pXamkrJau0SV48mR62U9wmTC7
 ahVLVMr4XHWwxSmSaeXZLIs4D2jkYJToWQzv1hUo+GMSp88l7UtfDfgbg
 CKStK4JgSGt7HTcoSNiN19aOTizphsHsR6m9NnzHsyqv/xilrPYNSYrb0
 beRhrTk19qHSvYLreWd+CTkAGb0ix1RubXy0HOb3kpL5NY4Gof4bcf0m7
 yfa3ZkidlX1GddyaCN2kH9j5THKsXXfXlyQj/T7wy0/B3+rvBjkRmtA+G w==;
X-CSE-ConnectionGUID: 9kyldFWSTtOS3PnF5Juysw==
X-CSE-MsgGUID: +VtGXWEIR96akEvwh026UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3848731"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3848731"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:54:46 -0800
X-CSE-ConnectionGUID: U7VofAArS6WDLJxajaha3A==
X-CSE-MsgGUID: vsCJtUPWR/eetHDw9CHbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10427252"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:54:44 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nitin.r.gote@intel.com, matthew.d.roper@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/nvl-p: Add Wa_14028564128
Date: Wed, 18 Nov 2026 20:24:30 +0530
Message-ID: <20261118145429.3281059-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wa_14028564128 applies to 35.10

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c        | 32 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h        | 14 +++++++++++++
 drivers/gpu/drm/xe/xe_vm.c         |  6 ++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 11 +++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 5 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 5938fef22579..49c776da4e9f 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -337,6 +337,13 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
 		}
 	}
 
+	/*
+	 * Wa_14028564128 remaps PAT index 2 to a safe no-promote/UC/1-way
+	 * value, so it's no longer subject to this restriction once enabled.
+	 */
+	if (xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index))
+		return false;
+
 	/*
 	 * Disallow 2-way coherency for any L3 cache policy because
 	 * XE_L3_POLICY_UC could still be promoted to a cached policy
@@ -345,6 +352,21 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
 	return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY;
 }
 
+bool xe_pat_wa_14028564128_safe_userptr_index(struct xe_device *xe, u16 pat_index)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	if (pat_index != 2)
+		return false;
+
+	for_each_gt(gt, xe, id)
+		if (XE_GT_WA(gt, 14028564128))
+			return true;
+
+	return false;
+}
+
 static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
 {
 	if (XE_GT_WA(gt, 14026539277)) {
@@ -358,6 +380,14 @@ static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
 	return value;
 }
 
+static u32 wa_14028564128_fixup_pat_value(struct xe_gt *gt, int index, u32 value)
+{
+	if (index == 2 && XE_GT_WA(gt, 14028564128))
+		value |= XE2_NO_PROMOTE;
+
+	return value;
+}
+
 static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -420,6 +450,8 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
 		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
 
+		pat = wa_14028564128_fixup_pat_value(gt, i, pat);
+
 		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 2ac6ddc66587..247dc0faa095 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -105,6 +105,20 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
  */
 bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_wa_14028564128_safe_userptr_index - Is this PAT index safe for
+ * misaligned host-pointer userptr/SVM binds due to Wa_14028564128?
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ *
+ * Wa_14028564128 reprograms PAT index 2 to the no-promote/UC/1-way policy
+ * required for misaligned host pointers; once that WA is enabled, index 2
+ * should be accepted anywhere PAT 19 or a 2-way coherent index already is.
+ *
+ * Return: a boolean indicating whether the PAT index is safe to use.
+ */
+bool xe_pat_wa_14028564128_safe_userptr_index(struct xe_device *xe, u16 pat_index);
+
 #define xe_cache_pat_idx(xe, cache_mode) ({					\
 	const struct xe_device *__xedev = (xe);					\
 	enum xe_cache_level __mode = (cache_mode);				\
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd855876f571..80ccaa44720c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3888,7 +3888,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
 				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
 				  is_cpu_addr_mirror) &&
-				 (pat_index != 19 && coh_mode != XE_COH_2WAY)) ||
+				 (pat_index != 19 && coh_mode != XE_COH_2WAY &&
+				  !xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index))) ||
 		    XE_IOCTL_DBG(xe, comp_en &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
@@ -4033,7 +4034,8 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && xe_device_is_l2_flush_optimized(xe) &&
-			 (pat_index != 19 && coh_mode != XE_COH_2WAY)))
+			 (pat_index != 19 && coh_mode != XE_COH_2WAY &&
+			  !xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index))))
 		return -EINVAL;
 
 	/* If a BO is protected it can only be mapped if the key is still valid */
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 31245c6c96d4..66895024ada9 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -655,7 +655,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
 		if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas &&
 				 xe_device_is_l2_flush_optimized(xe) &&
-				 (pat_index != 19 && coh_mode != XE_COH_2WAY))) {
+				 (pat_index != 19 && coh_mode != XE_COH_2WAY &&
+				  !xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index)))) {
 			err = -EINVAL;
 			goto free_vmas;
 		}
@@ -685,10 +686,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 					continue;
 
 				if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
+					bool safe_pat = xe_pat_wa_14028564128_safe_userptr_index(xe,
+							pat_index);
+					bool invalid_pat = pat_index != 19 &&
+						coh_mode != XE_COH_2WAY && !safe_pat;
+
 					if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
 							 xe_device_is_l2_flush_optimized(xe) &&
-							 (pat_index != 19 &&
-							  coh_mode != XE_COH_2WAY))) {
+							 invalid_pat)) {
 						err = -EINVAL;
 						goto err_fini;
 					}
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 03b713f55dfb..6a48b2c716ea 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -74,6 +74,7 @@
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
 14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
+14028564128	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
 14027054324	GRAPHICS_VERSION(3511)
 14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
 		MEDIA_VERSION_RANGE(1301, 3503)
-- 
2.52.0

