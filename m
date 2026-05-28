Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87179CD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 12:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383B710F12C;
	Thu, 28 May 2026 12:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJ7bZ1rU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102F910F12C
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779972248; x=1811508248;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aa04ZKND4HgZ+B6nln0e94RLp2a6XCel7+c7Di27DWI=;
 b=UJ7bZ1rUJwFvKlGQxRatXkPoOC+4WOkt0qfc57YIt2p+FsfpwZlpFBGc
 lPzGc2k3WtF5MbkYhBIQkSNGqYCBqH5aRVtGjZTx/0Cp1jrDPa4zHAfLw
 RPm2HzlXCQl2l4xGsAV2IO4Q7j0/M1yCTSg/l2ByN40EgK8oSwBRjWLtY
 EL7kx1Xu8VIaVyyWnym43u8ZnOHKo46brhJ5RppykelsSz/Z4nDFnFhJD
 j2yPgMlgyWhQiUpKCgkpiP3JlAKW7aLC+Cyw5Ih2qFqQicQ2dPnmFxkFP
 I0Gx7fCCYWuxTa1LRMCV4QiZxO4YMKm0MTPnUHa1bHlbXsXg76ZpZ0WFW w==;
X-CSE-ConnectionGUID: 7iCMjNbgToKhyH7s7AdNYQ==
X-CSE-MsgGUID: lYRWM9c7Sv6H+53zt36maQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91499321"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91499321"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 05:44:08 -0700
X-CSE-ConnectionGUID: mF7cMr2jS/GZl1taFV0dug==
X-CSE-MsgGUID: XFneAgxARy6FJKhBUz3Atw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="272871031"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 28 May 2026 05:44:05 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Clear pending_disable before signaling suspend
 fence
Date: Thu, 28 May 2026 18:13:39 +0530
Message-ID: <20260528124340.1864215-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

In the schedule-disable done path for suspend, we
signal the suspend fence before clearing pending_disable.

That wakeup can let suspend_wait complete and resume be queued
immediately. The resume path may then reach enable_scheduling()
while pending_disable is still set and hit the
!exec_queue_pending_disable(q) assertion.

Fix this by clearing pending_disable before signaling
the suspend fence, so any resumed transition observes a
consistent state.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d1ab66ca1856..122a0983df18 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2791,8 +2791,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
 
 		if (q->guc->suspend_pending) {
-			suspend_fence_signal(q);
 			clear_exec_queue_pending_disable(q);
+			suspend_fence_signal(q);
 		} else {
 			if (exec_queue_banned(q)) {
 				smp_wmb();
-- 
2.46.0

