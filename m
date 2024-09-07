Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330FCEB64C9
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E35410EB43;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVSY8SuD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0998910EB2E
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eo23JnWCMFcxA1/rtpxhcoub2WftkOlorYDO+AoPjQQ=;
 b=lVSY8SuDPVccgbwRgE1ToxvVmrwVr0sG5hmHX2xNJr4EJ4GJ/RwZ8PjI
 s1BQVEVb4bFeaClR5QpTEYMaG6t11NBNExWu/b3M01OXUcnPpAwynmryD
 pDBK4vnVo1M4O7hQTUyY1sPKsvj6zfncf6gD0AcKo/fHxCETUI/8NF0Bf
 Fws86aS8ynkRQV8uZXxUOXYUwFPAAzZhj6uZm6paw5aGCg7oapU+YzGOk
 MNANjT0N6xsXhYjHJnPwcV6emXOKBZ2TZWMfuGFx0tpUFhtAID8fKwmIW
 uTbtbxS/aKv97KGP+pTNkMJHc1lxkQ7tebKYqmNZtUfqvR4H9Qk2jIC2e A==;
X-CSE-ConnectionGUID: v7Z07cJsRzKhPRWpi0V6uA==
X-CSE-MsgGUID: bKSwl/6CS72g9Aw0qSaLHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855319"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855319"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: 8YxLQ9PbTWWKIV6Sy52YOA==
X-CSE-MsgGUID: Zg60fM+cSDSr23FKEkEL7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792706"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 29/43] drm/xe/pat: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:18 -0700
Message-ID: <20240907000748.2614020-74-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 5bf48e99c939..6bd6adfdfc74 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -165,7 +165,7 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
 
-		xe_mmio_write32(gt, reg, table[i].value);
+		xe_mmio_write32(&gt->mmio, reg, table[i].value);
 	}
 }
 
@@ -191,7 +191,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "PAT table:\n");
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
-		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		u32 pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
 
 		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
@@ -283,7 +283,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 		u32 pat;
 
 		if (xe_gt_is_media_type(gt))
-			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
@@ -321,10 +321,10 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 			       int n_entries)
 {
 	program_pat(gt, table, n_entries);
-	xe_mmio_write32(gt, XE_REG(_PAT_ATS), xe2_pat_ats.value);
+	xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe2_pat_ats.value);
 
 	if (IS_DGFX(gt_to_xe(gt)))
-		xe_mmio_write32(gt, XE_REG(_PAT_PTA), xe2_pat_pta.value);
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe2_pat_pta.value);
 }
 
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -341,7 +341,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		if (xe_gt_is_media_type(gt))
-			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
@@ -360,7 +360,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	 * PPGTT entries.
 	 */
 	if (xe_gt_is_media_type(gt))
-		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
+		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_PTA));
 	else
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
 
-- 
2.45.2

