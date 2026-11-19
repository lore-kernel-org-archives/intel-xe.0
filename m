Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE09D606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NEKitGwp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6B110FDBD;
	Thu, 19 Nov 2026 07:52:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A7610FDBD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 07:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795074774; x=1826610774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZIzc+aovC8mzlwIaZNpO+LVohPjNrstf3A9GgpdIV5g=;
 b=NEKitGwpfouL5BGCpEVpvSBJB9EtHDIPQv+bEVS0V8kg2aRQ2nq13680
 K1KLtJ0+el8ZhJmDOZPW5Fbhi4MlpdYZ2e7mv71JfJ3v+ee6DVl0yNN0t
 wCM3JzTPdw/uDfSR09kYfNGysal4CkrjE9JfDw24/Lej/K4DXRoOSnPNb
 d8bwjsYBT7HgjfbTjgzmSjzL6nzBDBAXoPISsUsMBXwXgUlZSmG/jH+On
 mplEZQv5aoR6rt7SgARNX2YoUQ/eFGLbXW3HDMW22VH5vXXoQu6zkFiiv
 KAgq38VxpXlTA0Z4A7qU0vr8s2JRQs8OY6zqwczV0gYia+Cp511Q/dOHK A==;
X-CSE-ConnectionGUID: 4nhngcrmSx+QanBl2rfvcw==
X-CSE-MsgGUID: nxsUh+U5SZyEnRhhuG7keA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3921127"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3921127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 23:52:53 -0800
X-CSE-ConnectionGUID: G2lMCQqQRpG/mGmRtSwTsQ==
X-CSE-MsgGUID: Q9+b5Mh8QaWtLaPhVWvQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10254209"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 23:52:52 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nitin.r.gote@intel.com, matthew.d.roper@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe/nvl-p: Add Wa_14028564128
Date: Thu, 19 Nov 2026 13:22:43 +0530
Message-ID: <20261119075242.3292552-2-tejas.upadhyay@intel.com>
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

V2:
- Add missing pat indexes to no_promote as asked by WA

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c        | 39 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h        | 14 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c         |  6 +++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 11 ++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 5 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 5938fef22579..24caed262642 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -337,6 +337,18 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
 		}
 	}
 
+	/*
+	 * Wa_14028564128 remaps every PAT index that is statically 2-way
+	 * coherent (indices 2, 7, 23, 27 and 31 in this table) to a safe
+	 * no-promote/UC/1-way value, so none of them are subject to this
+	 * restriction once that WA is enabled.
+	 */
+	for_each_gt(gt, xe, id) {
+		if (XE_GT_WA(gt, 14028564128) &&
+		    xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY)
+			return false;
+	}
+
 	/*
 	 * Disallow 2-way coherency for any L3 cache policy because
 	 * XE_L3_POLICY_UC could still be promoted to a cached policy
@@ -345,6 +357,21 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
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
@@ -358,6 +385,15 @@ static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
 	return value;
 }
 
+static u32 wa_14028564128_fixup_pat_value(struct xe_gt *gt, u32 orig_value, u32 value)
+{
+	if (XE_GT_WA(gt, 14028564128) &&
+	    REG_FIELD_GET(XE2_COH_MODE, orig_value) == XE_COH_2WAY)
+		value |= XE2_NO_PROMOTE;
+
+	return value;
+}
+
 static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -420,6 +456,8 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
 		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
 
+		pat = wa_14028564128_fixup_pat_value(gt, table[i].value, pat);
+
 		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
 	}
 
@@ -810,6 +848,7 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 		u32 pat = xe->pat.table[i].value;
 
 		pat = wa_14026539277_fixup_pat_value(gt, pat);
+		pat = wa_14028564128_fixup_pat_value(gt, xe->pat.table[i].value, pat);
 
 		if (GRAPHICS_VER(xe) >= 20) {
 			bool rsvd = !xe->pat.table[i].valid ||
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
index 31245c6c96d4..80dedeaae579 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -594,6 +594,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	};
 	struct xe_madvise_details details;
 	u16 pat_index, coh_mode;
+	bool safe_pat;
 	struct xe_vm *vm;
 	struct drm_exec exec;
 	int err, attr_type;
@@ -653,9 +654,11 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
 		pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
 		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		safe_pat = xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index);
 		if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas &&
 				 xe_device_is_l2_flush_optimized(xe) &&
-				 (pat_index != 19 && coh_mode != XE_COH_2WAY))) {
+				 (pat_index != 19 && coh_mode != XE_COH_2WAY &&
+				  !safe_pat))) {
 			err = -EINVAL;
 			goto free_vmas;
 		}
@@ -685,10 +688,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 					continue;
 
 				if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
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

