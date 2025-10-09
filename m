Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB91CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 20:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0216610E241;
	Thu,  9 Oct 2025 20:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2iO6qlT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E9610E241
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760042988; x=1791578988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7b0U+XnVk/snwisYJsssMhH6CWASwFfKsbBXIbMHIn8=;
 b=N2iO6qlT+zf9Cu55XV6azt68aoS8Kl/7ZwZMBsqWoe6WbJ5YEYgk9A2F
 37mzAfSkuq3b33GpgJnB1j0dxFqVUkh6pt2zesPtkcG3L+PfzZaF41iuh
 D+I+b7VgeAxNYKrC+9rj+2IInFkFomCNjStDGWv+x0uVQLB+R8dcWLWl/
 4b2FjASbdvmPG0iAbiupj80xH33IQT2I0hYBKyHUPjNeYeVFiLVaddi7z
 Ss3vvVfqrtWPL4eIyb4tDcHZymgjMRkRVSWWcvOxy62Wzh4Wt3m51ZG8F
 lDvRAngTLh2sBS3kdSRXyf9pAt9DMrRHsjoacet3eGn86a0SVkJA1NxEN Q==;
X-CSE-ConnectionGUID: qn60gKJuTKqHA2OvI15zOQ==
X-CSE-MsgGUID: LvVh897zQAqhIt8o7qAesw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73609162"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="73609162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 13:49:47 -0700
X-CSE-ConnectionGUID: l518qiZwQCCUIlolDgBNCQ==
X-CSE-MsgGUID: /l5xZ1/TSsKNntEdOwliSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185927240"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 13:49:47 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4] drm/xe: Enable media sampler power gating
Date: Thu,  9 Oct 2025 13:47:49 -0700
Message-Id: <20251009204749.1950689-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Where applicable, enable media sampler power gating. Also, add
it to the powergate_info debugfs.

v2: Remove the sampler powergate status since it is cleared quickly anyway.
v3: Use vcs mask (Rodrigo) and fix the version check for media
v4: Remove extra spaces

Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_gt_idle.c      | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 06cb6b02ec64..51f2a03847f9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -342,6 +342,7 @@
 #define POWERGATE_ENABLE			XE_REG(0xa210)
 #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
 #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
+#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
 #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
 #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index f8950a52d0a4..f5bc0d48462c 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -118,8 +118,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
 	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
 
-	if (vcs_mask || vecs_mask)
+	if (vcs_mask || vecs_mask) {
 		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
+		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)
+			gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
+	}
 
 	if (xe_gt_is_main_type(gt))
 		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
@@ -245,6 +248,10 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 			if (gt->info.engine_mask & media_slices[n].engines)
 				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
 					   str_up_down(pg_status & media_slices[n].status_bit));
+
+		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)
+			drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
+				   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
 	}
 	return 0;
 }
-- 
2.38.1

