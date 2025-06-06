Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0FDC61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A7210EBED;
	Fri,  6 Jun 2025 19:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gb/D/Xne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B6810EBEE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749237982; x=1780773982;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vDcyD7JtVtLgy9cc3O3K68cgpUchVqGIQp2osWEbE7M=;
 b=gb/D/Xnexb3F8yKDHApEA8VrnVcFtomcAIyE16Jet5zqbZ1hVdJPAAMk
 hcdL5gtURSoAFzes0M/J8SsqqmEt5sA8WokWC7rMBgn+aXwh4kTR7eo7R
 6L1BG8QhwhXHlQqUg0jl+97pFKkvXngC+5Ls1kwrYFsSyv6Hn95yanFi2
 XpM/DY6uR9/qhdBMPCPB/z8ECceY0YLvPEyKzr7fiFaa5DFbR6ACpHXD7
 W4yCrvtqmMJs48UTPwf2HytySdcX2MQMgzDnyg/tWIzM7JShe1asLjAp4
 gyHEIwwWCh15tfUY1IgKlgud616Hyu8t+3CByhYsOI6KSnftbL6fDJXY2 w==;
X-CSE-ConnectionGUID: 0hOQUfx7So6s2JhBcySiBA==
X-CSE-MsgGUID: ixyQ8/qXRxGz+nvBCDvNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61663146"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="61663146"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
X-CSE-ConnectionGUID: m82kJzCyQby/E5AL3WaUew==
X-CSE-MsgGUID: b6PMvI5ZTbKX6AyVW2zkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="150742752"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/5] drm/xe/oa: Assign hwe for OAM_SAG
Date: Fri,  6 Jun 2025 12:26:16 -0700
Message-ID: <20250606192618.4133817-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
References: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
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

v2: Assign an engine with a valid OA unit for OAM_SAG (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 57 ++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 19529c861523b..f41dac107e4a3 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1923,37 +1923,48 @@ u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
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
 
+	/* If we still didn't find a hwe, just get one with a valid oa_unit from the same gt */
+	for_each_hw_engine(hwe, param->oa_unit->gt, id) {
+		if (!hwe->oa_unit)
+			continue;
+
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
 
@@ -2578,6 +2589,8 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 				DRM_XE_OA_UNIT_TYPE_OAM_SAG : DRM_XE_OA_UNIT_TYPE_OAM;
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

