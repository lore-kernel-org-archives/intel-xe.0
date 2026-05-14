Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D54CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8457610F349;
	Thu, 14 May 2026 21:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xz7G1h03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBEE10F342
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778795121; x=1810331121;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=k02S8dCHh2aaCGqXRUKpxriAiEt7j6LZZX6fa/RL2ts=;
 b=Xz7G1h03LFhlMC/DXT1B5Ifd9c7sSS+uaI+9s0bpyTXT+duT8NLemjf+
 IOZUjs2xIzI8qTXJph2YsNabCmi9zXUm1sKuMTvLH6nnuwt2ANE9m/Egt
 1I9ThId24rJ8cyf0H06AuXqsysqvMvFc2LBuJ6jc8bf2msjA5A1Dobswe
 M0+YTLOn28hkX74Z5lHE+wYn5369LHyMr0fTsx9X8e+rvNh77GgEEyGPE
 iSxoP12tgv2tVi3M2wNvM7/dRhNkPNIx4Vo8ExjC7mASTYwIgPW63q6JI
 RIx0DhiwznYY7wsNOWHY0bkAau9zf8mazaZpX2m1tA17tnqI5EX2NIhdq A==;
X-CSE-ConnectionGUID: R0LU5iN5Rw2OoeGLYItHgA==
X-CSE-MsgGUID: y7d2gZBzRF6FE0Gnu2bPcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67277260"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="67277260"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:20 -0700
X-CSE-ConnectionGUID: nnyKMusxQyegVac6NBToVg==
X-CSE-MsgGUID: XV7Cf5wkR3CI9BGF3b3JOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238613223"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:19 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 18:44:49 -0300
Subject: [PATCH v3 6/7] drm/xe/mcr: Extract reg_in_steering_type_ranges()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rtp-mcr-check-v3-6-30dd47855fee@intel.com>
References: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
In-Reply-To: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
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

The logic to check if a register falls within one of the ranges for a
steering type is already duplicated in
xe_gt_mcr_get_nonterminated_steering().  We will also want to use that
same logic in another upcoming function.  Let's factor out that logic
and put it into a function named reg_in_steering_type_ranges().

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 43 +++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index df281688c617..2b2a4d9c3749 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -600,6 +600,20 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
 	}
 }
 
+static bool reg_in_steering_type_ranges(struct xe_gt *gt,
+					struct xe_reg reg,
+					int type)
+{
+	if (!gt->steering[type].ranges)
+		return false;
+
+	for (int i = 0; gt->steering[type].ranges[i].end > 0; i++)
+		if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg))
+			return true;
+
+	return false;
+}
+
 /*
  * xe_gt_mcr_get_nonterminated_steering - find group/instance values that
  *    will steer a register to a non-terminated instance
@@ -621,30 +635,21 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 					  u8 *group, u8 *instance)
 {
 	const struct xe_reg reg = to_xe_reg(reg_mcr);
-	const struct xe_mmio_range *implicit_ranges;
 
 	for (int type = 0; type < IMPLICIT_STEERING; type++) {
-		if (!gt->steering[type].ranges)
-			continue;
-
-		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
-			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
-				drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
-					 "Uninitialized usage of MCR register %s/%#x\n",
-					 xe_steering_types[type].name, reg.addr);
-
-				*group = gt->steering[type].group_target;
-				*instance = gt->steering[type].instance_target;
-				return true;
-			}
+		if (reg_in_steering_type_ranges(gt, reg, type)) {
+			drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
+				 "Uninitialized usage of MCR register %s/%#x\n",
+				 xe_steering_types[type].name, reg.addr);
+
+			*group = gt->steering[type].group_target;
+			*instance = gt->steering[type].instance_target;
+			return true;
 		}
 	}
 
-	implicit_ranges = gt->steering[IMPLICIT_STEERING].ranges;
-	if (implicit_ranges)
-		for (int i = 0; implicit_ranges[i].end > 0; i++)
-			if (xe_mmio_in_range(&gt->mmio, &implicit_ranges[i], reg))
-				return false;
+	if (reg_in_steering_type_ranges(gt, reg, IMPLICIT_STEERING))
+		return false;
 
 	/*
 	 * Not found in a steering table and not a register with implicit

-- 
2.53.0

