Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA6AC44514
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 20:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EFA10E136;
	Thu, 16 Jul 2026 20:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXbKlHRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3234010E136
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 20:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784233140; x=1815769140;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=jhJ4LNDZ8P5vJxp5Hht008t611nbZ+YFPXm3U/jvWlg=;
 b=PXbKlHRXUaWw5ODWOmV3PGWuaTYJ5Q64CA3xkx9e8mBa/OTpmYQdnJc6
 lubt/5GAAeenjytTep30fGqariNEHPzZZgLREZRNvbzerX+sEE7fxM+B9
 T5QV29BY7u6EwrSJ1ySBnNo0PbzlPW3/6zwn73ws+GFL31R/jn/79yoQp
 uff8dzf8Go27hYazIW08CM1wRa6b1xhVN+2EOCSP3NsmXEFIrjFdNmNl9
 +uGqaRVPSAcDPSoKjgvl2fA2YbQyX1203n9Z8KfGY7oF8D5EHBQRdajGf
 /0tR8MEq6xJe+inXQoJSiRlZV36PqGUnnOb0yR7m8ZKw78+TVU6l4rMWV w==;
X-CSE-ConnectionGUID: xUyaxGTqQHq7/KZ3g4+lWg==
X-CSE-MsgGUID: 5kuPa0NJSu21BhEO/Tcuiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85024912"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85024912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 13:18:59 -0700
X-CSE-ConnectionGUID: XESNjk5YRJWQXeTHRRQJIA==
X-CSE-MsgGUID: yvmvDy2BSTC7N6CpIidSRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="253947564"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 13:19:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 16 Jul 2026 13:18:45 -0700
Subject: [PATCH v2] drm/xe/xe3p_lpg: Program TR_PTA_MODE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-tr_pta_mode-v2-1-e4cd50da1c94@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMQQ6DIBCF4auYWZdGKGJx1Xs0xoCOdZIqBghpY
 7x7qV11+b/kfRsE9IQBmmIDj4kCuSWHOBXQT2Z5IKMhN4hSqFIJzaLv1mi62Q3IrKxGayt90dc
 a8mP1ONLr0O5t7olCdP594Il/159Tc/nnJM44U1ZVUppRD7W+0RLxee7dDO2+7x80J2i1pgAAA
 A==
X-Change-ID: 20260629-tr_pta_mode-b45fbb593987
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7289;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=jhJ4LNDZ8P5vJxp5Hht008t611nbZ+YFPXm3U/jvWlg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqWTyzTNq8ffFx1VNxnK8TccTJY/KpeOzQb0SRJ
 sY8Q3dEfw6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCalk8swAKCRBNeSQFyHKQ
 BAE3D/0fiNjF9PaROmc2KWCDj5AqH16HQkVpo60Gjfe9fkdJ88vL57MMqWW41xJNfA8iL2ViLEq
 fwBK+bXkONX4IuQ6ut6AsKcSq/W+pAwk/RS24J3cVH+rMPS1BozRGBuolZyg22bFdQFFYrpfpSI
 3hCBXAh3cpNVWixcB8u30WXIdEHIQXIi2JUHND5JfpFQDahAwam0ikucIt5ggugt+HqUAUI7AEh
 7VA2jfVuVlGQRyOnRPJ+Yg60V8z8ahKOYqK6sGlgY4Z9mb4GYkBR6yuielY4dN2wpzPosNCDk6+
 NpfYjzoiZ7pi85NmD8nv9FkWid+4VxXBC4w0SiULWgVgIGJrX7tdK/d3PAEqrnksZgr66aw8XG3
 vINfxdeRfIluUQP5cvjeudwky4wts4TU0+0NqrEld3ewp0g4Bprml9RD/N6+8NxqipNDGKO3dcr
 /V8e2qvgSVm6uo37boJVTDSbxOEau1VW8dAoFc4D2/epYUnbl//B/WZuW5ZOyKk/87leM0I2NM7
 LGM9tx/aITmRyFXltjDvPn1a0m0IkYt4+2Xxe+5kf+iGot9r+LcGQaZ8utG2EOCQSTS6QKBtaNf
 lvEvpXrmNd95xR5lDarEWmjeN6JIpkwWxGZSXqW3JuFx04d1k+LD1TIG7zWfzRb9GfhAVsWbEtv
 fpJdvc3DK/sECJg==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Up until Xe3p_LPG, the PTA_MODE register controlled cacheability of
accesses to the page tables for both PPGTT and TRTT.  Starting with
Xe3p_LPG, PTA_MODE is now only responsible for the PPGTT accesses, and a
separate register, TR_PTA_MODE is used to control the TRTT accesses. The
currently recommeded value for TR_PTA_MODE differs from PTA_MODE on
Xe3p_LPG.  Track and program this value separately in the driver.

Note that even though the Xe3p_LP[G/M] IPs didn't add support for this
new TR_PTA_MODE register until b-stepping, it's safe us to ignore that
detail code-wise.  Writes of the unrecognized registers on a-step
hardware will be silently ignored, and the reads on a-step will come
back as 0x0 which happens to be the value we'd be trying to program on
these IP versions anyway (for both graphics and media).

The new TRTT-specific register also does not exist on Xe3p_XPC
platforms.

v2:
 - Split gt_tr_pta_entry() out from gt_pta_entry().  (Gustavo)
 - Fix copy/paste mistake that caused us to write the PPGTT value to the
   TRTT register in the MCR path.  (Sashiko)

Bspec: 79814, 71582
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v2:
- Split gt_tr_pta_entry() our from gt_pta_entry().  (Gustavo)
- Fix copy/paste mistake that caused us to write the PPGTT value to the
  TRTT register in the MCR path.  (Sashiko)
- Link to v1: https://lore.kernel.org/r/20260714-tr_pta_mode-v1-1-6b6544af9d79@intel.com
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_pat.c          | 44 ++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 56c17cca79c0..860ad322237f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -404,6 +404,10 @@ struct xe_device {
 		const struct xe_pat_table_entry *pat_primary_pta;
 		/** @pat.pat_media_pta: media GT PAT entry for page table accesses */
 		const struct xe_pat_table_entry *pat_media_pta;
+		/** @pat.pat_primary_tr_pta: primary GT PAT entry for TRTT page table accesses */
+		const struct xe_pat_table_entry *pat_primary_tr_pta;
+		/** @pat.pat_media_tr_pta: media GT PAT entry for TRTT page table accesses */
+		const struct xe_pat_table_entry *pat_media_tr_pta;
 		u16 idx[__XE_CACHE_LEVEL_COUNT];
 	} pat;
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index fad5b5a5ed4a..a5fe1beec652 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -25,6 +25,7 @@
 								   0x4800, 0x4804, \
 								   0x4848, 0x484c)
 #define _PAT_PTA				0x4820
+#define _PAT_TR_PTA				0x48cc
 
 #define XE2_NO_PROMOTE				REG_BIT(10)
 #define XE2_COMP_EN				REG_BIT(9)
@@ -256,6 +257,7 @@ static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
 
 static const struct xe_pat_table_entry xe3p_primary_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 3);
 static const struct xe_pat_table_entry xe3p_media_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 2);
+static const struct xe_pat_table_entry xe3p_pat_tr_pta = XE2_PAT(0, 0, 0, 0, 0, 0);
 
 static const struct xe_pat_table_entry xe3p_lpg_pat_table[] = {
 	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
@@ -325,11 +327,26 @@ static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
 	return NULL;
 }
 
+static const struct xe_pat_table_entry *gt_tr_pta_entry(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_gt_is_main_type(gt))
+		return xe->pat.pat_primary_tr_pta;
+
+	if (xe_gt_is_media_type(gt))
+		return xe->pat.pat_media_tr_pta;
+
+	xe_assert(xe, false);
+	return NULL;
+}
+
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
+	const struct xe_pat_table_entry *tr_pta_entry = gt_tr_pta_entry(gt);
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
@@ -342,6 +359,9 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 
 	if (pta_entry)
 		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), pta_entry->value);
+
+	if (tr_pta_entry)
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_TR_PTA), tr_pta_entry->value);
 }
 
 static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
@@ -349,6 +369,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
+	const struct xe_pat_table_entry *tr_pta_entry = gt_tr_pta_entry(gt);
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
@@ -361,6 +382,9 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
 	if (pta_entry)
 		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
+
+	if (tr_pta_entry)
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry->value);
 }
 
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -531,6 +555,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "Page Table Access:\n");
 	xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 
+	if (gt_tr_pta_entry(gt)) {
+		if (xe_gt_is_media_type(gt))
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_TR_PTA));
+		else
+			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_TR_PTA));
+
+		drm_printf(p, "TRTT Page Table Access:\n");
+		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
+	}
+
 	if (xe_gt_is_media_type(gt))
 		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_ATS));
 	else
@@ -577,6 +611,8 @@ void xe_pat_init_early(struct xe_device *xe)
 		if (!IS_DGFX(xe)) {
 			xe->pat.pat_primary_pta = &xe3p_primary_pat_pta;
 			xe->pat.pat_media_pta = &xe3p_media_pat_pta;
+			xe->pat.pat_primary_tr_pta = &xe3p_pat_tr_pta;
+			xe->pat.pat_media_tr_pta = &xe3p_pat_tr_pta;
 		}
 		xe->pat.n_entries = ARRAY_SIZE(xe3p_lpg_pat_table);
 		xe->pat.idx[XE_CACHE_NONE] = 3;
@@ -701,6 +737,7 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
+	const struct xe_pat_table_entry *tr_pta_entry = gt_tr_pta_entry(gt);
 	char label[PAT_LABEL_LEN];
 
 	if (!xe->pat.table || !xe->pat.n_entries)
@@ -731,6 +768,13 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 	}
 
+	if (tr_pta_entry) {
+		u32 pat = tr_pta_entry->value;
+
+		drm_printf(p, "TRTT Page Table Access:\n");
+		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
+	}
+
 	if (xe->pat.pat_ats) {
 		u32 pat = xe->pat.pat_ats->value;
 

---
base-commit: 0fcee361fa4cf13207af78b95e71bbbaeb046319
change-id: 20260629-tr_pta_mode-b45fbb593987

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

