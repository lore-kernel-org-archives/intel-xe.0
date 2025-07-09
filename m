Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC85C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8713210E79D;
	Wed,  9 Jul 2025 10:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FB/KuNr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950B810E79B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752058543; x=1783594543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eW3867kGjGs/IaEf5K/LZake/RG9hfVJiYWBtLq3IeQ=;
 b=FB/KuNr1fXoqNOwFlpp4LnNq10uoxyTDfyKvMckiTsJzRa3mIzPnvo98
 9ztnTUh4oh6tf0OjoklyCZbe84qPidrvHSOdQuC5oTvqN84w4Hr8xBd/q
 khIUmvsPUEEjy+0eXV4V8NfNsfYSEIdNELxRe/15EWucarOB+VPj9mb1t
 SUDf06HiEm1aKXCXNjOB8CH3fZk0U449T16eM+VBz7zcRW81ra6IYjgVk
 fCHYyHyFvKj0z9QgOzDsloZCk4VoKOf1651v2/Wcj5LjnbFyIlTU/7J0A
 fMWOqYu9a38pw0U3RTaN27oSbDpElzyhoP6WJDUkdzW3Wq+Au4P7n8rq4 w==;
X-CSE-ConnectionGUID: 9PZUj7lrS2K9EcoGUraTQw==
X-CSE-MsgGUID: Qg1Do2Y/RoeM5vbWmV1dzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54288457"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54288457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:55:43 -0700
X-CSE-ConnectionGUID: AqPopOIrQEmJzOcZQHpfyw==
X-CSE-MsgGUID: X6hl5HpKSa+fwUDee1oA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="192936313"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:55:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 2/9] drm/xe: Set GT as wedged before sending wedged uevent
Date: Wed,  9 Jul 2025 16:50:14 +0530
Message-ID: <20250709112024.1053710-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250709112024.1053710-1-riana.tauro@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
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

Userspace should be notified after setting the device as wedged.
Re-order function calls to set gt wedged before sending uevent.

Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..8a5bb7b6d09b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1123,8 +1123,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a module
+ * This is a final state that can only be cleared with the recovery method
+ * specified in the drm wedged uevent. The default recovery method is
  * re-probe (unbind + bind).
+ *
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
  * failure or guc loading failure. Userspace will be notified of this state
@@ -1158,13 +1160,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
+	}
+
+	for_each_gt(gt, xe, id)
+		xe_gt_declare_wedged(gt);
 
+	if (xe_device_wedged(xe)) {
 		/* Notify userspace of wedged device */
 		drm_dev_wedged_event(&xe->drm,
 				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
 				     NULL);
 	}
-
-	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
 }
-- 
2.47.1

