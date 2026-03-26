Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3891110AB827
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 21:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3610EBAB;
	Thu, 26 Mar 2026 21:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2FvSh94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35C210E315
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 21:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774558881; x=1806094881;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7f0AmcELGMQoGJlenqiGXUCZbgxldPxzK5loRBujDbQ=;
 b=g2FvSh94d40QO1LxE14j3eQ0RvelDdJmVulcVJWU7CAyPkH0OOd8Y5lI
 LP2RMqZBgfvvnGOIOldG7nLR5ZpB08AxuWVHHtmIC6KPY0pnAJgk+b9Ci
 UTTmosnLJ7ZZfSEEeXAiZ7M8itEduBwYc3+QPoAjhZJiWUpHJzV9vQmP+
 RzwXsg6z+ISB8cnyxiSh7uswayNlDMlswMeuIPAuGV2qtQWHQNQoLkt5E
 JgFP8+aWLcxi2BF/qbLWfnaMlOtpyMUioL2QsRb2AGRy6A44iRMatVVkj
 FH8MzagYb0CR6kaXKC8UIsraeZTY0X6LzasQmegoHZQn78tU2u/j/pc34 Q==;
X-CSE-ConnectionGUID: ecMTAKVDTYy1EZyrLZvdhg==
X-CSE-MsgGUID: v1HftLzlQLqZ+GTcx3AwKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98251876"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="98251876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:01:20 -0700
X-CSE-ConnectionGUID: 2tcaEKhITmC4+2AHt4OYFg==
X-CSE-MsgGUID: BbkVtY+wRcWpO2MHDs6U/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229182395"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:01:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Avoid memory allocations in
 xe_device_declare_wedged()
Date: Thu, 26 Mar 2026 14:01:15 -0700
Message-Id: <20260326210116.202585-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326210116.202585-1-matthew.brost@intel.com>
References: <20260326210116.202585-1-matthew.brost@intel.com>
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

xe_device_declare_wedged() runs in the DMA-fence signaling path, where
GFP_KERNEL memory allocations are not allowed. However, registering
xe_device_wedged_fini via drmm_add_action_or_reset() triggers a
GFP_KERNEL allocation.

Fix this by deferring the registration of xe_device_wedged_fini until
late in the driver load sequence. Additionally, drop the wedged PM
reference only if the device is actually wedged in
xe_device_wedged_fini.

Fixes: ("452bca0edbd0 drm/xe: Don't suspend device upon wedge")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9b0540e3e289..ffea4a453c01 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -833,6 +833,14 @@ static void detect_preproduction_hw(struct xe_device *xe)
 	}
 }
 
+static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	if (atomic_read(&xe->wedged.flag))
+		xe_pm_runtime_put(xe);
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1009,6 +1017,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	detect_preproduction_hw(xe);
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	if (err)
+		goto err_unregister_display;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
@@ -1240,13 +1252,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
 
-static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_device *xe = arg;
-
-	xe_pm_runtime_put(xe);
-}
-
 /**
  * DOC: Xe Device Wedging
  *
@@ -1324,15 +1329,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	xe_pm_runtime_get_noresume(xe);
-
-	if (drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe)) {
-		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. Although device is wedged.\n");
-		return;
-	}
-
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
+		xe_pm_runtime_get_noresume(xe);
 		drm_err(&xe->drm,
 			"CRITICAL: Xe has declared device %s as wedged.\n"
 			"IOCTLs and executions are blocked.\n"
-- 
2.34.1

