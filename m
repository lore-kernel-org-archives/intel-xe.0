Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFF5CD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 21:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AF910F60D;
	Fri,  8 May 2026 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuUV9Ern";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332F810F60D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778276579; x=1809812579;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=k02S8dCHh2aaCGqXRUKpxriAiEt7j6LZZX6fa/RL2ts=;
 b=CuUV9ErnoKwob2DmPG1mnpD7gEoRYwfGkM+8D0j/p9BvE/jtl69I834M
 AtmfJ1cCsif32STkibo0cMD55eMcf9XaHUIztcdGVVuNM9ACIWvBRfVb8
 RmJleiZz7RsKwEQktxIzzG9d4UfOpJtLMvcKtRC0TpClXpUDCtC69awLe
 lpGpKs0X1XUoZ+Fcgfy5yW7A/jNfM4jdcqWydQ7mfZtABihtK1RhBEhcI
 fbYqhi/zSnp46Lf+/DrDjcDMvJvl2CLB4ZGNzzK8lqrf1Tcze4RBRLiZg
 IkNQBlB5TL3VyBb4H3U++Xfhrog+HUx4D5eH034c7W2lpv1srfsQLc9lg g==;
X-CSE-ConnectionGUID: vWHLOOy1Qi2L97o+chdqkA==
X-CSE-MsgGUID: K7iN/Sd8QuaARF4p9myllw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90635997"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="90635997"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:59 -0700
X-CSE-ConnectionGUID: E4r0TdFIRwmYyBNZUa0P1A==
X-CSE-MsgGUID: 9/lvCtFdQUOvqqYsb/mEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="267244255"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:58 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 08 May 2026 18:42:37 -0300
Subject: [PATCH v2 7/8] drm/xe/mcr: Extract reg_in_steering_type_ranges()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rtp-mcr-check-v2-7-9897b147a5d2@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
In-Reply-To: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
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

