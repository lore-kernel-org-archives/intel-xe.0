Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6715DCD6E60
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 16:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7C10F391;
	Tue,  2 Jun 2026 16:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noo7U6TC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A8D10F391
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780418159; x=1811954159;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Uig8ZPASqDz0QLSbKCDig+r4f8EM9XvE2vMS+Y5gqJU=;
 b=noo7U6TCB/tDIhrf6VUFQoNVM3enyMFP/VfRWIuv9i37YYMODhGgYACZ
 kW7hm0w5+0Ytnpr29GC6IFy95hJ5WqfFn+TkqsP/6WNyVO4RQoIfOZWQ2
 +gqk0KKayi+yr8wGl4607FpEZjTtxQViMVbnyJGzFM5kCDsXaEjWwVSfq
 NpTFgX+F17sciZ41suiaEqozXq0s4ExSo7cdjyqNz1ryULxplLgEzME3L
 nPmlOvtwFjXJ4R/i+gdrrDmm8F2r1zL2KO8rStpTt7r5arF6zpsKsFO4V
 j1y4f4/U8RL6WQVv1na2oDQVQ6j5ObgxeBu4cgtYv+ee8w4wkJs2OoKPQ g==;
X-CSE-ConnectionGUID: RqiwHOI6SAuB9r9QkU443A==
X-CSE-MsgGUID: cVYrG2hpQemrtaJp8m3K0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83792000"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="83792000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:35:59 -0700
X-CSE-ConnectionGUID: DLuV+6q6R7eSAWN0hsnPVQ==
X-CSE-MsgGUID: xMde1RVhT6Gl0aUTbfRGlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="243798971"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa008.jf.intel.com with ESMTP; 02 Jun 2026 09:35:58 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, daniele.ceraolospurio@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Clear pending_disable before signaling suspend
 fence
Date: Tue,  2 Jun 2026 22:05:34 +0530
Message-ID: <20260602163535.3124689-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260602163535.3124689-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260602163535.3124689-1-tilak.tirumalesh.tangudu@intel.com>
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

