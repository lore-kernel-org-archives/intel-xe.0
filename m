Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389D3D2126D
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 10:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E666410E30F;
	Thu, 17 Oct 2024 10:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7G6ej8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC40C10E30F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729159391; x=1760695391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FTEmx1eDmnlIorRqH/I/1azuKuU8Y5hB5aDQh2l7Vwg=;
 b=S7G6ej8W9I6wmBhS91pXg66/AxV3Z4hv/hPZJOfwgrCVRXjWlovMfNSA
 Ti9s49y7iqUCsd9lm6Qi082hmYmxPAAY861TWTryUV+Wty1GmCnBcIeLk
 hbqk2poz50Ogv0ueLPZwQ/G6w9ms0mZ9Pe9py3tfSLYvPfZITOsUpiIKl
 7Qa01hQuGtsGhhbF616Ex+49TbJBpXONfiGb0MFD5wKKSUrs8tqGNZbS/
 Sb30XriUvAkbasTbDDqp1R5nG1uU+DuwHVI8vEKL/NKwPK7ORxYM863qx
 3/7JgzUcDXQK5ieagAA+cy9r1VH5uq9bnVLb9CuBOGKcWKQ3sgoMfj/Ew w==;
X-CSE-ConnectionGUID: pKJ8XhukQ2eK4Fj67leIvg==
X-CSE-MsgGUID: vho/qnOYTD2s2JorvJ5Rmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32436742"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="32436742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 03:03:11 -0700
X-CSE-ConnectionGUID: 0ajm3GHUSFibYBt7XjWAmQ==
X-CSE-MsgGUID: 4/hyIyPGRCOZAkOtlCwGQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78848134"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 03:03:10 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/ufence: Kick ufence immediately when possible
Date: Thu, 17 Oct 2024 11:21:13 +0200
Message-ID: <20241017092113.208678-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

If the backing fence is signaled then signal ufence soon with
system_wq. This should reduce load from the xe ordered_wq and also
won't block signaling a ufence which doesn't require any serialization.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Matthew Auld <matthew.auld@intel.com>
gc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c6cf227ead40..598b2a481077 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -89,10 +89,14 @@ static void user_fence_worker(struct work_struct *w)
 	user_fence_put(ufence);
 }
 
-static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
+static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
+			bool signaled)
 {
 	INIT_WORK(&ufence->worker, user_fence_worker);
-	queue_work(ufence->xe->ordered_wq, &ufence->worker);
+	if (signaled)
+		queue_work(ufence->xe->system_wq, &ufence->worker);
+	else
+		queue_work(ufence->xe->ordered_wq, &ufence->worker);
 	dma_fence_put(fence);
 }
 
@@ -100,7 +104,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
 
-	kick_ufence(ufence, fence);
+	kick_ufence(ufence, fence, false);
 }
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
@@ -236,7 +240,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 		err = dma_fence_add_callback(fence, &sync->ufence->cb,
 					     user_fence_cb);
 		if (err == -ENOENT) {
-			kick_ufence(sync->ufence, fence);
+			kick_ufence(sync->ufence, fence, true);
 		} else if (err) {
 			XE_WARN_ON("failed to add user fence");
 			user_fence_put(sync->ufence);
-- 
2.46.0

