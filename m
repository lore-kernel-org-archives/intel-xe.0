Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C4CCD6E69
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 06:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D2210F8FD;
	Wed,  3 Jun 2026 06:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFI1NEF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6608310F8FD
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780469563; x=1812005563;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gYejhnkbffyTbJJOqfsSQ3+d+Axp8GcCF4+A6kM7SnM=;
 b=gFI1NEF5AcpwJTG8Gix52IlfmOwJz4qKgx9qJTLrEnnBzyakdWj1wJkr
 9t2wmKFm+qAoNqONQtA2aClEj1OGzbOkKXNi6v9Qcbhf1y3fLVZIfsNY6
 pBRr3jj5YEKvalxvX2J5KGBzpaNuyXWYOItPW+Sxwy0qh0zLVltGxJM1w
 N3LBdR53eCzR54MHSez54sVEW8gXHR66BB4iwwRw05APdJy96G3zPkbpp
 ujKRggYhbKuQvWfjq7rYqFXi9U1NphuEyl7kVmbUBOZ6tKp0C2u915Cea
 mXjQL+iHNwzmPkIxiW1g17nSyk+Xu9ffV+dwhvVUtwcj6AQ2LkrD0rR/9 A==;
X-CSE-ConnectionGUID: /Qzx1bjpTWGEulHMUyflEQ==
X-CSE-MsgGUID: ftm/Q9xvQjuPukFfxDbk5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81263633"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81263633"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 23:52:43 -0700
X-CSE-ConnectionGUID: Y5Q9olzRSGWCfsf3MgvDZw==
X-CSE-MsgGUID: xPnempVySASd1U1KokOM8Q==
X-ExtLoop1: 1
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 02 Jun 2026 23:52:41 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, daniele.ceraolospurio@intel.com,
 niranjana.vishwanathapura@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Clear pending_disable before signaling suspend
 fence
Date: Wed,  3 Jun 2026 12:22:16 +0530
Message-ID: <20260603065217.3131066-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603065217.3131066-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260603065217.3131066-1-tilak.tirumalesh.tangudu@intel.com>
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

Fixes: 87651f31ae4e ("drm/xe/guc_submit: fix race around suspend_pending")
Cc: stable@vger.kernel.org # v7.0+
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

