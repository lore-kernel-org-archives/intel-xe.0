Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609E5C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 19:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151EF10E3BF;
	Tue, 21 Jul 2026 19:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3vZg1Nv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AD510E3BF
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784661048; x=1816197048;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=RPvDwmea45gcAkxEAv6xhqQd57HtySn9H/LZFgeX5oY=;
 b=j3vZg1NvN7y2Y4Pge87isZmTwMA8V3M1Dm44ZodLrVMTL3nmEmR5oosJ
 x1pURl2aRk6fzIETvcsS58JpsxvBFJOvE+g8zp7sgNIshPHl/Q5XQwUgO
 DPprN+mYR63DbojV6v4S4cYkrxZpmn8RkTzi5iAudctkD3uI59s1N/BDE
 LyVy+as6RcPbZenP8KJa3cPqdE1EOR4IDjCS75y2Mt8lhjYWf85HzDiEl
 8o7QykVzGVCSSa4vFwbs2+fLxvnPGA7L7YeOT+5nbpO72giTsmy1md1N8
 Ql/bmkb937pR85EhqSq6oVHh2X3r6fIYHAIQ96E2Qd/fse7BepmqIcnAQ w==;
X-CSE-ConnectionGUID: 025Q+TJ/Q46VMP9nAUrXFw==
X-CSE-MsgGUID: jOsBxOr6RbOVtKodw8CEOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85295091"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85295091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:47 -0700
X-CSE-ConnectionGUID: 1v2ZqdKZSoeki0PpQ19GFw==
X-CSE-MsgGUID: NTcGLuqLSZKwcsLp/8KmiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="282374166"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 16:10:21 -0300
Subject: [PATCH 3/3] drm/xe: Add up-to-date implementation for Wa_14026539277
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-3-09fa102f3084@intel.com>
References: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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
steppings of NVL-P (the platform, not the graphics IP) and requires
that we avoid using 2-way coherency for device-cacheable memory
accesses.  For driver-internal usage, we convert those configurations
to be device-uncached and 1-way-coherent; on the UAPI side, we reject
VM_BIND calls that are 2-way-coherent and leave it up to userspace to
select the alternative option that is most appropriate to their usage.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.h               | 10 ++++++
 drivers/gpu/drm/xe/xe_device.c            |  3 ++
 drivers/gpu/drm/xe/xe_pat.c               | 55 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c                |  5 +++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 5 files changed, 68 insertions(+), 6 deletions(-)

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
index 5189419a0593..140dbd97466e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -836,6 +836,9 @@ static void override_has_cached_pt(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
+	if (XE_DEVICE_WA(xe, 14026539277))
+		xe->info.has_cached_pt = false;
+
 	/*
 	 * Wa_16029380221: The affected GT will always use non-coherent
 	 * access to page tables, so we must do uncached writes from the
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a5fe1beec652..334f6ef7e9e8 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -7,6 +7,7 @@
 
 #include <uapi/drm/xe_drm.h>
 
+#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 #include "regs/xe_gt_regs.h"
@@ -313,6 +314,30 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
 	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
 }
 
+bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
+{
+	if (!XE_DEVICE_WA(xe, 14026539277))
+		return false;
+
+	return xe_pat_index_get_l3_policy(xe, pat_index) != XE_L3_POLICY_UC &&
+	       xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY;
+}
+
+static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (XE_DEVICE_WA(xe, 14026539277) && xe_gt_is_main_type(gt)) {
+		if (REG_FIELD_GET(XE2_L3_POLICY, value) != XE_L3_POLICY_UC &&
+		    REG_FIELD_GET(XE2_COH_MODE, value) == XE_COH_2WAY) {
+			value &= ~XE2_COH_MODE;
+			value |= REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
+		}
+	}
+
+	return value;
+}
+
 static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -373,18 +398,22 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
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
@@ -534,13 +563,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
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
@@ -747,9 +779,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
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
@@ -764,6 +801,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	if (pta_entry) {
 		u32 pat = pta_entry->value;
 
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
+
 		drm_printf(p, "Page Table Access:\n");
 		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 	}
@@ -771,6 +810,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	if (tr_pta_entry) {
 		u32 pat = tr_pta_entry->value;
 
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
+
 		drm_printf(p, "TRTT Page Table Access:\n");
 		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
 	}
@@ -778,6 +819,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	if (xe->pat.pat_ats) {
 		u32 pat = xe->pat.pat_ats->value;
 
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
+
 		drm_printf(p, "PCIe ATS/PASID:\n");
 		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57bcf0660eb8..16b937d0e3af 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3699,6 +3699,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 356b4707dafe..d8dc41851425 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -3,6 +3,7 @@
 		PLATFORM(PANTHERLAKE)
 22019338487_display	PLATFORM(LUNARLAKE)
 14022085890	SUBPLATFORM(BATTLEMAGE, G21)
+14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)

-- 
2.55.0

