Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEEBC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 11:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D2C10E93A;
	Thu, 30 Jan 2025 11:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rSY1nl/O";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B7310E936
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5SV71g796aKNg9OFxH0qqHLxMtHhmbWTJfOxZyeXZcI=; b=rSY1nl/OEqNoScX4nBKcJ2Y0fB
 Qb1x3uNxsh2XviXX8+ZJhly0TrW/qPxZj6KSabBKIJyr2KNpuvpGiC9OyQj3ABvFXrAAQ7Fg9Z1lk
 8iYgB2ioh0yWByChj+CNebILgkUHy4D4K16+vzIzj3YzI50mbB4nyZJlH2kcXO3wdcpuP+9AVPOCe
 YUQr6xLm0a389s3NhJbLl9Mv0hvoLghEX4fE83Va1A/TPdZGMjTT8X2UmGovFod/19R+MZPUR/Y0o
 9dck9n5uBt+G5xi08YwOQuUzU0fYdOZEiqKOdbcq0TbBGF62iccWQ6SC4uP1faJyYNJL1O5Tbsu2M
 ILpQC6HA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tdSKd-000zzG-3b; Thu, 30 Jan 2025 12:03:41 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/4] drm/xe: Fix GT "for each engine" workaround handling
Date: Thu, 30 Jan 2025 11:03:34 +0000
Message-ID: <20250130110337.11237-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
References: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
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

Any rules using engine matching are currently broken due RTP processing
happening in early init before the list of hardware engines has been
initialised.

Fix it my moving the engine initialisation to earlier in the init process
and process the workaround and tuning lists just before the GuC load will
happen.

Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
should be present while we see, before:

GT Workarounds
	14011059788
	14015795083

And after:

GT Workarounds
	14011060649
	14011059788
	14015795083

v2:
 * Moved OOB back to early init.
 * Moved engine init and WA processing to earlier phase.
 * Improved commit message.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
Lets see if this explodes in CI...
---
 drivers/gpu/drm/xe/xe_device.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c     |  6 ------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f3f754beb812..9d8dfee9dad2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -55,6 +55,7 @@
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
+#include "xe_tuning.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
 #include "xe_vsec.h"
@@ -793,6 +794,23 @@ int xe_device_probe(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
+		unsigned int fw_ref;
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		if (!fw_ref)
+			return -ETIMEDOUT;
+
+		err = xe_hw_engines_init_early(gt);
+		if (err) {
+			xe_force_wake_put(gt_to_fw(gt), fw_ref);
+			return err;
+		}
+
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+		xe_wa_process_gt(gt);
+		xe_tuning_process_gt(gt);
+
 		err = xe_gt_init_hwconfig(gt);
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 01a4a852b8f4..c3711987737e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -380,9 +380,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	xe_wa_process_gt(gt);
 	xe_wa_process_oob(gt);
-	xe_tuning_process_gt(gt);
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	spin_lock_init(&gt->global_invl_lock);
@@ -430,10 +428,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	/* Rerun MCR init as we now have hw engine list */
 	xe_gt_mcr_init(gt);
 
-	err = xe_hw_engines_init_early(gt);
-	if (err)
-		goto err_force_wake;
-
 	err = xe_hw_engine_class_sysfs_init(gt);
 	if (err)
 		goto err_force_wake;
-- 
2.48.0

