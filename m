Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F083CCD188
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA03010E686;
	Tue,  7 Oct 2025 11:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0fiiCMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6088210E671
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836409; x=1791372409;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zq35zAhxL/Sf8B8F42DYXO5tAyXag+D4ePYsewbqfN0=;
 b=C0fiiCMgHS21oBi28m2st6X9rvXn3YnYIC8wODOmOzMJAznZqz1Bw+Gi
 xxIRW4YfKuu4Gk2Pgrg6IFlkctWIgFZDhkXuqgYPhmHwo4oQjitoLSvWu
 yxwYki8DD1LrPIcBOBse1kCeH22Vwz01qxg7L+b8ijLejyf4PTPRe1tpf
 zCbs++xeIp4MDy6SfV/ovK87PfueRKwazqotEtI6/Wrei+zWBQf2qGrrk
 PpW42vJ/sOjD+41RNeT10Pq7WgrobnsGZldZyH2BOl4X7I1cABCIk/5n7
 ki3K7S9SnbqgMwZldGSZRVhSlpkLIbWsrU3LlbmL5JoEQmx6NX7SXvNAP Q==;
X-CSE-ConnectionGUID: h+aggtZwTLuikQClyeLRGA==
X-CSE-MsgGUID: xdM6vEiRRJSWtPddmpxPEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660680"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:48 -0700
X-CSE-ConnectionGUID: ON+rXJsoT8utqWYn2KAfGA==
X-CSE-MsgGUID: G241K2rGReKX0vpVY03E9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180923998"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 11/32] drm/xe: Move GGTT lock init to alloc
Date: Tue,  7 Oct 2025 04:26:20 -0700
Message-Id: <20251007112641.2669655-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

The GGTT lock is needed very early during GT initialization for a VF;
move the GGTT lock initialization to the allocation phase.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7fdd0a97a628..f7717057cd14 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -159,6 +159,16 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
+static void primelockdep(struct xe_ggtt *ggtt)
+{
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&ggtt->lock);
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 /**
  * xe_ggtt_alloc - Allocate a GGTT for a given &xe_tile
  * @tile: &xe_tile
@@ -170,8 +180,19 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
 {
 	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
-	if (ggtt)
+
+	if (ggtt) {
+		int err;
+
 		ggtt->tile = tile;
+
+		err = drmm_mutex_init(&tile_to_xe(tile)->drm, &ggtt->lock);
+		if (err)
+			ggtt = NULL;
+		else
+			primelockdep(ggtt);
+	}
+
 	return ggtt;
 }
 
@@ -180,7 +201,6 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = arg;
 
 	destroy_workqueue(ggtt->wq);
-	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
 
@@ -198,16 +218,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 }
 #endif
 
-static void primelockdep(struct xe_ggtt *ggtt)
-{
-	if (!IS_ENABLED(CONFIG_LOCKDEP))
-		return;
-
-	fs_reclaim_acquire(GFP_KERNEL);
-	might_lock(&ggtt->lock);
-	fs_reclaim_release(GFP_KERNEL);
-}
-
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
@@ -227,8 +237,6 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
 {
 	drm_mm_init(&ggtt->mm, reserved,
 		    ggtt->size - reserved);
-	mutex_init(&ggtt->lock);
-	primelockdep(ggtt);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
-- 
2.34.1

