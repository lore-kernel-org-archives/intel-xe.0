Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C669CC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 20:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B12810EBC1;
	Fri,  6 Jun 2025 20:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lu70zd+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AB510EBEE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 20:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749242606; x=1780778606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zbA6d1BiGnHfHrqj/2OdPu2mL2UEc/Vdy+qIjeutYTk=;
 b=Lu70zd+LoLMgI/jLL1t8+ooIthlGs1DFnxwfkAfhfrL3vDZqUb6I8m/z
 JuLqBEzyli/Rei1pIzFNZ/dxpQKFgpQaoeypp3R7Z3qmGCZZ1xj4LN1bc
 8MFodrMWDXJbWmzuoH8PsGH35MFIYr+2gCnWAu2iFUn6ILs71S4erO5cr
 B7fdhlahNpGM3rJdQ4h84aPREL9U5LcbVY4KqL6AOow6nELKqFoQErHGq
 NpV0sCsdc/PItBEh0jnLeqLOhcFYg+sGnj1gn29KpU9MBsRScrn2hadQi
 sfsfnF0uZlxLN1wzcG5hP3KzqGJi0OeYpfN5aPkkbxc4eaSX5zJD09DSt Q==;
X-CSE-ConnectionGUID: hVo6ntf9QzyNSRMajZSJ8w==
X-CSE-MsgGUID: slZ8H6TRQ/GMigUhAzxxxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68843604"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="68843604"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 13:43:25 -0700
X-CSE-ConnectionGUID: /761Au2GTWSbn0oHzf0cYg==
X-CSE-MsgGUID: d1EX0WeITAmixfwKC8ZEmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145821869"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 13:43:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/uc: Use GT-oriented firmware messages
Date: Fri,  6 Jun 2025 22:43:11 +0200
Message-Id: <20250606204311.813-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We are already prepared to define firmwares per-GT type, so we
should also prepare our messages to be GT-oriented.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7b2d01d39b86..dcc3021c9f5a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -668,8 +668,9 @@ do { \
 static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct drm_printer p = xe_gt_info_printer(gt);
 	struct device *dev = xe->drm.dev;
-	struct drm_printer p = drm_info_printer(dev);
 	const struct firmware *fw = NULL;
 	int err;
 
@@ -678,8 +679,8 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	 * before we're looked at the HW caps to see if we have uc support
 	 */
 	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
-	xe_assert(xe, !uc_fw->status);
-	xe_assert(xe, !uc_fw->path);
+	xe_gt_assert(gt, !uc_fw->status);
+	xe_gt_assert(gt, !uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
 
@@ -703,7 +704,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 
 	if (!xe_uc_fw_is_supported(uc_fw)) {
 		if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
-			drm_err(&xe->drm, "No GuC firmware defined for platform\n");
+			xe_gt_err(gt, "No GuC firmware defined for platform\n");
 			return -ENOENT;
 		}
 		return 0;
@@ -712,7 +713,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	/* an empty path means the firmware is disabled */
 	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
 		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
-		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
+		xe_gt_dbg(gt, "%s disabled\n", xe_uc_fw_type_repr(uc_fw->type));
 		return 0;
 	}
 
@@ -745,10 +746,10 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 			       XE_UC_FIRMWARE_MISSING :
 			       XE_UC_FIRMWARE_ERROR);
 
-	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
-		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
-	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
-		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
+	xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
+		     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
+	xe_gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
+		   xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
 	release_firmware(fw);		/* OK even if fw is NULL */
 
-- 
2.47.1

