Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13378CD98C6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C891810E629;
	Tue,  9 Jun 2026 20:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rct373fC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA01710E629
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036269; x=1812572269;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VROVcs3pvLqrExIAHRCiJlC2gY+yNe4lKZCgona7bhs=;
 b=Rct373fCDcRVbR1YKSLHv6Ef9id3KpQ3Z6t4jEz6aI5+D9SFECH+poxI
 3t3JFnVV4+P/T9CoVu0xx/4kgV3SgOXtfOo7UdTXRUYJM9OgzfdG/v5q8
 ztwcICzdiOyV42/UC8uZoI+PmgAyGOS82eKRJPSuTyLTmD/0WvdDDLO33
 i/TECXfMIRMD4RVjp4UvmCBDdwer5AdSzEN6k5NWElL2KaOoUWgeWJtcj
 OS3iYYTQnqR3jHTjrZrgrS4H7iamK4OU1o11zYkDGs3iXulGl60KPzbaC
 KPOmVdefOpoPHzHUNc5wmHptJr2P5S3FvC5NRUe5kxFLf9xPFOpgsAqJC A==;
X-CSE-ConnectionGUID: uxX2P+O7R1WxF33P7K/cIQ==
X-CSE-MsgGUID: J3kru/c8Tk23RarXUSk1nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383297"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:49 -0700
X-CSE-ConnectionGUID: 0ha5x/t2Q4isIpyXcNIgeA==
X-CSE-MsgGUID: lMXziprKRKuFaokR6r/4Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027531"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:50 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:34 -0300
Subject: [PATCH 2/9] drm/xe/step: Pass xe_step_info to xe_step_*_get()
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-2-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
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

The xe_step_*_get() functions update the step directly in
xe->info.step and are called by functions xe_info_init_early() and
xe_info_init().

As the stepping info is something probed from the hardware (via PCI
revid and/or GMDID) and we want to move away from probing inside
xe_info_init*() functions, let's make xe_step_*_get() functions modify
a pointer to the step structure instead of modifying xe->info.step
directly: this will allow an upcoming change that will move those
function calls out of the info init functions and will pass a member
of struct xe_probed_info instead of xe->info.step.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c  |  6 +++---
 drivers/gpu/drm/xe/xe_step.c | 33 ++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_step.h |  7 ++++---
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7f1da6d25011..646e04c6254f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -811,7 +811,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
 	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
-	xe_step_platform_get(xe);
+	xe_step_platform_get(xe, &xe->info.step);
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
@@ -963,7 +963,7 @@ static int xe_info_init(struct xe_device *xe,
 	if (desc->pre_gmdid_graphics_ip) {
 		graphics_ip = desc->pre_gmdid_graphics_ip;
 		media_ip = desc->pre_gmdid_media_ip;
-		xe_step_pre_gmdid_get(xe);
+		xe_step_pre_gmdid_get(xe, &xe->info.step);
 	} else {
 		xe_assert(xe, !desc->pre_gmdid_media_ip);
 		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
@@ -971,7 +971,7 @@ static int xe_info_init(struct xe_device *xe,
 		if (ret)
 			return ret;
 
-		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid);
+		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid, &xe->info.step);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index fb9c31613ca7..49dc64f2b363 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -111,11 +111,12 @@ __diag_pop();
 /**
  * xe_step_platform_get - Determine platform-level stepping from PCI revid
  * @xe: Xe device
+ * @step: Pointer to the step struct to update
  *
  * Convert the PCI revid into a platform-level stepping value and store that
- * in the device info.
+ * in @step->platform.
  */
-void xe_step_platform_get(struct xe_device *xe)
+void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step)
 {
 	/*
 	 * Not all platforms map PCI revid directly into our symbolic stepping
@@ -127,17 +128,20 @@ void xe_step_platform_get(struct xe_device *xe)
 	 */
 
 	if (xe->info.platform == XE_NOVALAKE_P)
-		xe->info.step.platform = STEP_A0 + xe->info.revid;
+		step->platform = STEP_A0 + xe->info.revid;
 }
 
 /**
  * xe_step_pre_gmdid_get - Determine IP steppings from PCI revid
  * @xe: Xe device
+ * @step: Pointer to the step struct to update
  *
- * Convert the PCI revid into proper IP steppings.  This should only be
- * used on platforms that do not have GMD_ID support.
+ * Convert the PCI revid into proper IP steppings and update @step->basedie,
+ * @step->graphics and @step->media accordingly.
+ *
+ * This should only be used on platforms that do not have GMD_ID support.
  */
-void xe_step_pre_gmdid_get(struct xe_device *xe)
+void xe_step_pre_gmdid_get(struct xe_device *xe, struct xe_step_info *step)
 {
 	const struct xe_step_info *revids = NULL;
 	u16 revid = xe->info.revid;
@@ -234,9 +238,9 @@ void xe_step_pre_gmdid_get(struct xe_device *xe)
 	}
 
 done:
-	xe->info.step.graphics = graphics;
-	xe->info.step.media = media;
-	xe->info.step.basedie = basedie;
+	step->graphics = graphics;
+	step->media = media;
+	step->basedie = basedie;
 }
 
 /**
@@ -244,8 +248,10 @@ void xe_step_pre_gmdid_get(struct xe_device *xe)
  * @xe: Xe device
  * @graphics_gmdid_revid: value of graphics GMD_ID register's revid field
  * @media_gmdid_revid: value of media GMD_ID register's revid field
+ * @step: Poninter to the step struct to update.
  *
- * Convert the revid fields of the GMD_ID registers into proper IP steppings.
+ * Convert the revid fields of the GMD_ID registers into proper IP steppings
+ * and update @step->graphics and @step->media accordingly.
  *
  * GMD_ID revid values are currently expected to have consistent meanings on
  * all platforms:  major steppings (A0, B0, etc.) are 4 apart, with minor
@@ -253,7 +259,8 @@ void xe_step_pre_gmdid_get(struct xe_device *xe)
  */
 void xe_step_gmdid_get(struct xe_device *xe,
 		       u32 graphics_gmdid_revid,
-		       u32 media_gmdid_revid)
+		       u32 media_gmdid_revid,
+		       struct xe_step_info *step)
 {
 	u8 graphics = STEP_A0 + graphics_gmdid_revid;
 	u8 media = STEP_A0 + media_gmdid_revid;
@@ -270,8 +277,8 @@ void xe_step_gmdid_get(struct xe_device *xe,
 			media_gmdid_revid);
 	}
 
-	xe->info.step.graphics = graphics;
-	xe->info.step.media = media;
+	step->graphics = graphics;
+	step->media = media;
 }
 
 #define STEP_NAME_CASE(name)	\
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index ea36b22cc297..c6cea95a3727 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -12,12 +12,13 @@
 
 struct xe_device;
 
-void xe_step_platform_get(struct xe_device *xe);
+void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step);
 
-void xe_step_pre_gmdid_get(struct xe_device *xe);
+void xe_step_pre_gmdid_get(struct xe_device *xe, struct xe_step_info *step);
 void xe_step_gmdid_get(struct xe_device *xe,
 		       u32 graphics_gmdid_revid,
-		       u32 media_gmdid_revid);
+		       u32 media_gmdid_revid,
+		       struct xe_step_info *step);
 static inline u32 xe_step_to_gmdid(enum intel_step step) { return step - STEP_A0; }
 
 const char *xe_step_name(enum intel_step step);

-- 
2.53.0

