Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80116C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320C410F3B2;
	Fri, 21 Aug 2026 21:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCjfbkrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C87C10F3B4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787348234; x=1818884234;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7E/HdHf+GLJ/e8xW8r4DOPT78gRffky2JmKF7Cxu+gk=;
 b=TCjfbkrz6alfBDwCGHrX4glXUj7dpQCIdYG+AQ7v09AYA7jLtxSCGDa5
 Sm+8hAtW3xCUFs2PRGAWsf5KftwiX0AyYfZgXcnxK5y2E6mfcDJlUdF70
 agz2LmsXHZRcFDeFKBvl/HX+KMag/dw7vjwNLYlMXNmb2mKbB+Nfp3FD3
 DECI3iC1wZiu7FKHJgo7D7KZvf1olSTb5AE7uIRMhokgOSK62ajt/ttPo
 eVnqdVe+OZ4Jpn3BPABEa+qnCll4R2tGBxKqrQahAX7pC+QgCusTPJ0rb
 qfNv9scbmra5TTwMWIgOY0/U7iYzsGnH4/4IL9qm3u20Sdjni9xxBYEbh Q==;
X-CSE-ConnectionGUID: WLB9sH0/Sd+kK9izVxgceQ==
X-CSE-MsgGUID: QDvBSHOoTwaejCXyj8rLcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91776300"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="91776300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:14 -0700
X-CSE-ConnectionGUID: w5r2kQovS2uHe1/c/6wRDw==
X-CSE-MsgGUID: siUW3hxtRm+Mj93t66TWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266502748"
Received: from arnabgho-mobl.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.173])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:12 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Aug 2026 18:36:49 -0300
Subject: [PATCH v3 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-wa_14026539277-v3-3-1f98c2af12f6@intel.com>
References: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
In-Reply-To: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Filip Hazubski <filip.hazubski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.15-dev
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

Wa_14026539277 is a temporary workaround that targets only A*
steppings of graphics version 35.10 and requires that we avoid using
2-way coherency for device-cacheable memory accesses.  For
driver-internal usage, we convert those configurations to be
device-uncached and 1-way-coherent; on the UAPI side, we reject
VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
userspace to select the alternative option that is most appropriate to
their usage.

v2:
  - Add missing bits to convert the PAT value to device-uncacheable in
    wa_14026539277_fixup_pat_value(). (Sashiko)
  - Also validate the PAT index in the DRM_XE_VM_MADVISE
    ioctl. (Sashiko)
  - Match against the graphics IP instead of the platform.
v3:
  - Handle any 2-way-coherent PAT index irrespective of L3 cache
    policy, because L3 UC can be promoted to cached by MOCS. (Matt)

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.h        | 10 ++++++
 drivers/gpu/drm/xe/xe_device.c     | 16 ++++++----
 drivers/gpu/drm/xe/xe_pat.c        | 64 ++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c         |  5 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c |  3 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 6 files changed, 87 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 7060f66e1d63..10374022f1d2 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -82,6 +82,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
  */
 u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from
+ * use due to Wa_14026539277?
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ *
+ * Return: a boolean indicating whether the PAT index is reserved or not.
+ */
+bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index);
+
 #define xe_cache_pat_idx(xe, cache_mode) ({					\
 	const struct xe_device *__xedev = (xe);					\
 	enum xe_cache_level __mode = (cache_mode);				\
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ccf7ef3cf3e7..516da74b542f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -847,14 +847,18 @@ static void override_has_cached_pt(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
-	/*
-	 * Wa_16029380221: The affected GT will always use non-coherent
-	 * access to page tables, so we must do uncached writes from the
-	 * CPU.
-	 */
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		/*
+		 * Wa_16029380221: The affected GT will always use
+		 * non-coherent access to page tables, so we must do
+		 * uncached writes from the CPU.
+		 */
 		if (XE_GT_WA(gt, 16029380221))
 			xe->info.has_cached_pt = false;
+
+		if (XE_GT_WA(gt, 14026539277))
+			xe->info.has_cached_pt = false;
+	}
 }
 
 static int probe_has_flat_ccs(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a5fe1beec652..66378128377c 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -313,6 +313,40 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
 	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
 }
 
+bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
+{
+	struct xe_gt *gt;
+	u8 id;
+	bool has_wa = false;
+
+	for_each_gt(gt, xe, id) {
+		if (XE_GT_WA(gt, 14026539277)) {
+			has_wa = true;
+			break;
+		}
+	}
+
+	/*
+	 * Disallow 2-way coherency for any L3 cache policy because
+	 * XE_L3_POLICY_UC could still be promoted to a cached policy
+	 * by MOCS indices.
+	 */
+	return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY;
+}
+
+static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
+{
+	if (XE_GT_WA(gt, 14026539277)) {
+		if (REG_FIELD_GET(XE2_COH_MODE, value) == XE_COH_2WAY) {
+			value &= ~(XE2_L3_POLICY | XE2_COH_MODE);
+			value |= REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLICY_UC) |
+				 REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
+		}
+	}
+
+	return value;
+}
+
 static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -373,18 +407,22 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
+		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
 
-		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
+		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
 	}
 
 	if (xe->pat.pat_ats)
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
+					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));
 
 	if (pta_entry)
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
+					  wa_14026539277_fixup_pat_value(gt, pta_entry->value));
 
 	if (tr_pta_entry)
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry->value);
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),
+					  wa_14026539277_fixup_pat_value(gt, tr_pta_entry->value));
 }
 
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -534,13 +572,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "PAT table: (* = reserved entry)\n");
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
+		bool rsvd = !xe->pat.table[i].valid ||
+			    xe_pat_wa_14026539277_reserved(xe, i);
+
 		if (xe_gt_is_media_type(gt))
 			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
 		xe_pat_index_label(label, sizeof(label), i);
-		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
+		xe->pat.ops->entry_dump(p, label, pat, rsvd);
 	}
 
 	/*
@@ -747,9 +788,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	for (u32 i = 0; i < xe->pat.n_entries; i++) {
 		u32 pat = xe->pat.table[i].value;
 
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
+
 		if (GRAPHICS_VER(xe) >= 20) {
+			bool rsvd = !xe->pat.table[i].valid ||
+				    xe_pat_wa_14026539277_reserved(xe, i);
+
 			xe_pat_index_label(label, sizeof(label), i);
-			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
+			xe->pat.ops->entry_dump(p, label, pat, rsvd);
 		} else if (xe->info.platform == XE_METEORLAKE) {
 			xelpg_pat_entry_dump(p, i, pat);
 		} else if (xe->info.platform == XE_PVC) {
@@ -764,6 +810,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	if (pta_entry) {
 		u32 pat = pta_entry->value;
 
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
+
 		drm_printf(p, "Page Table Access:\n");
 		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 	}
@@ -771,6 +819,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	if (tr_pta_entry) {
 		u32 pat = tr_pta_entry->value;
 
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
+
 		drm_printf(p, "TRTT Page Table Access:\n");
 		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
 	}
@@ -778,6 +828,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	if (xe->pat.pat_ats) {
 		u32 pat = xe->pat.pat_ats->value;
 
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
+
 		drm_printf(p, "PCIe ATS/PASID:\n");
 		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 19b3d0be7928..92a1d5098aac 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3829,6 +3829,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			goto free_bind_ops;
 		}
 
+		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index))) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
 		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 0474768a38aa..265273294756 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -500,6 +500,9 @@ static bool check_pat_args_are_sane(struct xe_device *xe,
 	u16 coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
 	int i;
 
+	if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
+		return false;
+
 	/*
 	 * Using coh_none with CPU cached buffers is not allowed on iGPU.
 	 * On iGPU the GPU shares the LLC with the CPU, so with coh_none
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index dd69ad07f7a9..46290d039fa8 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -71,4 +71,5 @@
 		GRAPHICS_VERSION(3511)
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
+14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
 14027054324	GRAPHICS_VERSION(3511)

-- 
2.55.0

