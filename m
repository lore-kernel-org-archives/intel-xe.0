Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72353FCA192
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2629E10E5C8;
	Mon,  9 Mar 2026 21:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0Yg8LKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3465810E5C8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773092411; x=1804628411;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ntfRk+4braRlNz0fA8KEuJ25wv3J27xm74Nj7EmSV9I=;
 b=g0Yg8LKyPMJOCFnpI6G3q2g3Lr9eBhdW068asX7Dy7P3jp67frthdmp7
 +PUTrQLPcDDXeiIJa0EP7LY83soIhwziLkF2OBeUw/ZTyAMWOb+Yrmarz
 sQJL0pzlb+fknFkVXjYrPdWFDSuLyXSoqKIzvYLstrPiUdW+kOc5wlc3L
 +YPE4LSlr2QPo1TbQcA1ruZFUiPtC6OTygI6oaa28ILEbJOlLW6OcQHTv
 E3JLPiot7eBRKFAne/0XNNwtJxKV9J/JyuqByJ85eRvqDL8Dg7pmdO6Cs
 haG/Z8GsJKp11U2eIiMrt2yKGvthwOq+sMMUqMlQ4FPaTWBlZpTgV6hmn w==;
X-CSE-ConnectionGUID: Py/gAxkqT+OeCJf6/bZkRg==
X-CSE-MsgGUID: sRkYJ36gSpGc4K+OU186xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91702265"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="91702265"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:11 -0700
X-CSE-ConnectionGUID: xyQPgj7/R8OqTJF6gvda5Q==
X-CSE-MsgGUID: IBjrTNd+RUGzpwbZaGsVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="216346702"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:09 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 18:39:44 -0300
Subject: [PATCH v4 1/8] drm/xe: Modify stepping info directly in
 xe_step_*_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v4-1-2e7fcead971a@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
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

In an upcoming change, we will add a member to struct xe_step_info to
represent the platform-level stepping.  As such, we should stop assigning
the value returned by functions xe_step_pre_gmdid_get() and
xe_step_gmdid_get() directly to xe->info.step.

Since there are no other users for those functions, let's simply update
them to modify xe->info.step directly.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c  |  6 ++---
 drivers/gpu/drm/xe/xe_step.c | 52 +++++++++++++++++++++++++-------------------
 drivers/gpu/drm/xe/xe_step.h |  8 +++----
 3 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 29f976e66848..72d4131e9775 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -914,7 +914,7 @@ static int xe_info_init(struct xe_device *xe,
 	if (desc->pre_gmdid_graphics_ip) {
 		graphics_ip = desc->pre_gmdid_graphics_ip;
 		media_ip = desc->pre_gmdid_media_ip;
-		xe->info.step = xe_step_pre_gmdid_get(xe);
+		xe_step_pre_gmdid_get(xe);
 	} else {
 		xe_assert(xe, !desc->pre_gmdid_media_ip);
 		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
@@ -922,9 +922,7 @@ static int xe_info_init(struct xe_device *xe,
 		if (ret)
 			return ret;
 
-		xe->info.step = xe_step_gmdid_get(xe,
-						  graphics_gmdid_revid,
-						  media_gmdid_revid);
+		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 2860986f82f7..064b604b5b94 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -115,15 +115,17 @@ __diag_pop();
  * Convert the PCI revid into proper IP steppings.  This should only be
  * used on platforms that do not have GMD_ID support.
  */
-struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
+void xe_step_pre_gmdid_get(struct xe_device *xe)
 {
 	const struct xe_step_info *revids = NULL;
-	struct xe_step_info step = {};
 	u16 revid = xe->info.revid;
 	int size = 0;
 	const int *basedie_info = NULL;
 	int basedie_size = 0;
 	int baseid = 0;
+	u8 graphics = STEP_NONE;
+	u8 media = STEP_NONE;
+	u8 basedie = STEP_NONE;
 
 	if (xe->info.platform == XE_PVC) {
 		baseid = FIELD_GET(GENMASK(5, 3), xe->info.revid);
@@ -166,10 +168,12 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
 
 	/* Not using the stepping scheme for the platform yet. */
 	if (!revids)
-		return step;
+		goto done;
 
 	if (revid < size && revids[revid].graphics != STEP_NONE) {
-		step = revids[revid];
+		graphics = revids[revid].graphics;
+		media = revids[revid].media;
+		basedie = revids[revid].basedie;
 	} else {
 		drm_warn(&xe->drm, "Unknown revid 0x%02x\n", revid);
 
@@ -187,25 +191,30 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
 		if (revid < size) {
 			drm_dbg(&xe->drm, "Using steppings for revid 0x%02x\n",
 				revid);
-			step = revids[revid];
+			graphics = revids[revid].graphics;
+			media = revids[revid].media;
+			basedie = revids[revid].basedie;
 		} else {
 			drm_dbg(&xe->drm, "Using future steppings\n");
-			step.graphics = STEP_FUTURE;
+			graphics = STEP_FUTURE;
 		}
 	}
 
-	drm_WARN_ON(&xe->drm, step.graphics == STEP_NONE);
+	drm_WARN_ON(&xe->drm, graphics == STEP_NONE);
 
 	if (basedie_info && basedie_size) {
 		if (baseid < basedie_size && basedie_info[baseid] != STEP_NONE) {
-			step.basedie = basedie_info[baseid];
+			basedie = basedie_info[baseid];
 		} else {
 			drm_warn(&xe->drm, "Unknown baseid 0x%02x\n", baseid);
-			step.basedie = STEP_FUTURE;
+			basedie = STEP_FUTURE;
 		}
 	}
 
-	return step;
+done:
+	xe->info.step.graphics = graphics;
+	xe->info.step.media = media;
+	xe->info.step.basedie = basedie;
 }
 
 /**
@@ -220,28 +229,27 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
  * all platforms:  major steppings (A0, B0, etc.) are 4 apart, with minor
  * steppings (A1, A2, etc.) taking the values in between.
  */
-struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
-				      u32 graphics_gmdid_revid,
-				      u32 media_gmdid_revid)
+void xe_step_gmdid_get(struct xe_device *xe,
+		       u32 graphics_gmdid_revid,
+		       u32 media_gmdid_revid)
 {
-	struct xe_step_info step = {
-		.graphics = STEP_A0 + graphics_gmdid_revid,
-		.media = STEP_A0 + media_gmdid_revid,
-	};
+	u8 graphics = STEP_A0 + graphics_gmdid_revid;
+	u8 media = STEP_A0 + media_gmdid_revid;
 
-	if (step.graphics >= STEP_FUTURE) {
-		step.graphics = STEP_FUTURE;
+	if (graphics >= STEP_FUTURE) {
+		graphics = STEP_FUTURE;
 		drm_dbg(&xe->drm, "Graphics GMD_ID revid value %d treated as future stepping\n",
 			graphics_gmdid_revid);
 	}
 
-	if (step.media >= STEP_FUTURE) {
-		step.media = STEP_FUTURE;
+	if (media >= STEP_FUTURE) {
+		media = STEP_FUTURE;
 		drm_dbg(&xe->drm, "Media GMD_ID revid value %d treated as future stepping\n",
 			media_gmdid_revid);
 	}
 
-	return step;
+	xe->info.step.graphics = graphics;
+	xe->info.step.media = media;
 }
 
 #define STEP_NAME_CASE(name)	\
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index 686cb59200c2..6febb7fac476 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -12,10 +12,10 @@
 
 struct xe_device;
 
-struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
-struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
-				      u32 graphics_gmdid_revid,
-				      u32 media_gmdid_revid);
+void xe_step_pre_gmdid_get(struct xe_device *xe);
+void xe_step_gmdid_get(struct xe_device *xe,
+		       u32 graphics_gmdid_revid,
+		       u32 media_gmdid_revid);
 static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
 
 const char *xe_step_name(enum xe_step step);

-- 
2.52.0

