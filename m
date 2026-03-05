Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A1F30951
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D20710E278;
	Thu,  5 Mar 2026 12:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CP5t0yTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F272A10E282
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712191; x=1804248191;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=A2I1f8bYsz436898g5/sqxrKoFSMXNuPZSttp1WQv4g=;
 b=CP5t0yTecV6p+mNloesLqUHSmSi8RWgMJXSYBTj/zpAynSVPSFAaWG83
 nhcigsWbM5kYp0WJrEQnp7jCojfraUkfdzAZ0WYnN4EjzUBnqUgFV62q+
 mciNCmkbKfR/m1m60e6PVu6pU1EHrpKhKSuTqWaLxrySiSJ0KZb6TX6tZ
 gaKQS/Yt5d5gK4NoDe4VZmwP1AcCtMngTqt+aiJKHtQltDRqx5c1I6OEJ
 zfaeW13WTOjtHaTGgfY2YaQlcJ3bu7VirejZjNsltVkUiRFsb6ZMAasQS
 2gRc6YtDWqLmij1KPNAq8VcIbYpFkjCzwE3It/lEb0HHJWhB3tZI9Y1GF A==;
X-CSE-ConnectionGUID: bDzm0+VwStWIsLhCyu0Srg==
X-CSE-MsgGUID: hRiEY2dOQmKnGLlvf2GoRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702507"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702507"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:10 -0800
X-CSE-ConnectionGUID: ORhEHguyRwuseQ3TxwXgNA==
X-CSE-MsgGUID: cGg5DqI9RByCpB7pU8q94w==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:09 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Mar 2026 09:02:28 -0300
Subject: [PATCH 1/7] drm/xe: Modify stepping info directly in xe_step_*_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-1-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
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

In an upcoming change, we will add a member to struct xe_step_info to
represent the platform-level stepping.  As such, we should stop assigning
the value returned by functions xe_step_pre_gmdid_get() and
xe_step_gmdid_get() directly to xe->info.step.

Since there are no other users for those functions, let's simply update
them to modify xe->info.step directly.

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

