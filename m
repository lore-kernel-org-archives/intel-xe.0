Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694B7C5B549
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 23:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31F10E792;
	Thu, 29 May 2025 23:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzqdVbY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A11510E792
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 23:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748563131; x=1780099131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5+m1KGKrO9BPrWQPLspJ1MKJHiTx7Ijc9jzx4sMC/6I=;
 b=FzqdVbY9R0KgDuhTMm0OleYsYqTcJyEuaGGy9O2SV174k8Ao1e/7EzbM
 lIxCY24Y0rCIB0i2T98fHnkvAdg+POwpbRY3j/Ms7/fMOC7tgMHRTbVHO
 pvkt1ARtq4CrkxFZV9AgNmDhWf73orwyX4bxYMrmNQbXI6B9Xple+o4UJ
 K8QRegB2Q8dga2IhSEakbgY+WgNt7/2nhS/+19deR+G9oAZEB/OgfQDRO
 gKwL+e4H4Vqw4QDR78dOF8XnWq2aGsRj5RC7mpZQBlPPAXRP5dQg4ykKl
 YI08Dic7r3Z4VSfy/c8IQK7S0TB7Nx2XHYU5kMKrBUjvzfHlhyoT0/OMa Q==;
X-CSE-ConnectionGUID: OALm72xSTHCwu3iPMe+T1w==
X-CSE-MsgGUID: tLFMOae3QDSEVbWk9KmelA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49764994"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="49764994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:49 -0700
X-CSE-ConnectionGUID: dP+b457HSeW67dFqoQ6L/Q==
X-CSE-MsgGUID: o04UqCsUT1msjwDeJu7gwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="166889418"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 4/4] drm/xe/oa: Assign hwe for OAM_SAG
Date: Thu, 29 May 2025 16:58:36 -0700
Message-ID: <20250529235836.145097-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250529235836.145097-1-ashutosh.dixit@intel.com>
References: <20250529235836.145097-1-ashutosh.dixit@intel.com>
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

Because OAM_SAG doesn't have an attached hwe, assign another hwe belonging
to the same gt (and different OAM unit) to OAM_SAG. A hwe is needed for
batch submissions to program OA HW.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 54 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 2 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 66157b5d6f162..82b48b228ccbe 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1922,37 +1922,45 @@ u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
 		hwe->oa_unit->oa_unit_id : U16_MAX;
 }
 
+/* A hwe must be assigned to stream/oa_unit for batch submissions */
 static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 {
-	struct xe_gt *gt;
-	int i, ret = 0;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	int ret = 0;
+
+	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
+	if (!param->oa_unit)
+		param->oa_unit = &xe_device_get_gt(oa->xe, 0)->oa.oa_unit[0];
 
+	/* When we have an exec_q, get hwe from the exec_q */
 	if (param->exec_q) {
-		/* When we have an exec_q, get hwe from the exec_q */
 		param->hwe = xe_gt_hw_engine(param->exec_q->gt, param->exec_q->class,
 					     param->engine_instance, true);
-	} else {
-		struct xe_hw_engine *hwe;
-		enum xe_hw_engine_id id;
-
-		/* Else just get the first hwe attached to the oa unit */
-		for_each_gt(gt, oa->xe, i) {
-			for_each_hw_engine(hwe, gt, id) {
-				if (hwe->oa_unit == param->oa_unit) {
-					param->hwe = hwe;
-					goto out;
-				}
-			}
-		}
+		if (!param->hwe || param->hwe->oa_unit != param->oa_unit)
+			goto err;
+		goto out;
 	}
-out:
-	if (!param->hwe || param->hwe->oa_unit != param->oa_unit) {
-		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
-			param->exec_q ? param->exec_q->class : -1,
-			param->engine_instance, param->oa_unit->oa_unit_id);
-		ret = -EINVAL;
+
+	/* Else just get the first hwe attached to the oa unit */
+	for_each_hw_engine(hwe, param->oa_unit->gt, id) {
+		if (hwe->oa_unit == param->oa_unit) {
+			param->hwe = hwe;
+			goto out;
+		}
 	}
 
+	/* If we still didn't find a hwe, just get one from the same gt */
+	for_each_hw_engine(hwe, param->oa_unit->gt, id) {
+		param->hwe = hwe;
+		goto out;
+	}
+err:
+	drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
+		param->exec_q ? param->exec_q->class : -1,
+		param->engine_instance, param->oa_unit->oa_unit_id);
+	ret = -EINVAL;
+out:
 	return ret;
 }
 
@@ -2576,6 +2584,8 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
+		u->gt = gt;
+
 		xe_mmio_write32(&gt->mmio, u->regs.oa_ctrl, 0);
 
 		/* Ensure MMIO trigger remains disabled till there is a stream */
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index a01c85931e2a5..2628f78c4e8dc 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -95,6 +95,9 @@ struct xe_oa_unit {
 	/** @oa_unit_id: identifier for the OA unit */
 	u16 oa_unit_id;
 
+	/** @gt: gt associated with the OA unit */
+	struct xe_gt *gt;
+
 	/** @type: Type of OA unit - OAM, OAG etc. */
 	enum drm_xe_oa_unit_type type;
 
-- 
2.48.1

