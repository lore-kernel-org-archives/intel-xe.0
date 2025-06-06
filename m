Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5819CC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 16:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C1110EAF2;
	Fri,  6 Jun 2025 16:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFWLnWt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AACB10EAEF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225784; x=1780761784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q84jH+9fykAGHNLTFnS3kT6Y+e9NXMwhBsFefFyk8zw=;
 b=bFWLnWt/3HoiH8pfVUAWRlnm+fUApOezvzHek7ulAyO/e5vRO4YB8cZ3
 pooEtdG0yVuX7UX7XzGHPVmTMNQoBVAe2fX59AgmyUOOMAV56OVhxJOLl
 jfPvHPJXnufkfcY1t2mOV43bKRt5Q9zmCNoq1gSdtMIR9SKXMhZ9069qY
 OiEfYn3g8cZE7x0Q41OiKjbbT4EcCttOjr1STEkYvHZcMTEksg9vr5tBK
 CVRGvWXGKggCxgkMtvhHCqhWvLmYyo+YGWUtolXtS5cCwKCa02gd5bkj+
 IX89g4vCmZe9MHBeLwXk292TW1DhXPrUEOqvcpU+lJ8rMrF57WfeNgwi0 A==;
X-CSE-ConnectionGUID: vYTPXMppRBOF9SSWfFAYgg==
X-CSE-MsgGUID: 4lSjo4M0SYWzzKQHhEWlpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51526359"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51526359"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:03 -0700
X-CSE-ConnectionGUID: b1xh5ImASpa9jgfdj6WNUg==
X-CSE-MsgGUID: 5nOpiNQ0SHC8vhr7OyRmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145748899"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 4/5] drm/xe/oa: Assign hwe for OAM_SAG
Date: Fri,  6 Jun 2025 09:02:52 -0700
Message-ID: <20250606160253.4054668-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
References: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
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

