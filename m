Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B64CD6E57
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C1A10E804;
	Mon,  1 Jun 2026 14:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dnkb7M0z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A070110E804
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780324229; x=1811860229;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aa04ZKND4HgZ+B6nln0e94RLp2a6XCel7+c7Di27DWI=;
 b=Dnkb7M0z91PMCwEZzFGpfFUoMeua6vNgWrAgNgwW6gFJMlP8w+W7VDNx
 Y0tP9B8p0SgGRKNHAXqfblK294HrSGXbfBYrHwiEd/29+w9Jc7uhwUZTB
 ShzeGdxNBA1PRbVeHSaDA6cNg5EVpK6f4XF1vpUJsUo+QPqiygEBwivk/
 lCRVo6ON/Y0fH6Th4VIuo1/3/vK6ji8oogOO5O2n1n93c/cAvP7aufJAO
 ZivEwo7rn6Alsapq5nw0jyfTpoy0/pnjeup+9JMgvg0vRVYoQekJAna65
 ShJUVvrc3WCt9qhw58wzvuBDSGJQckUz9ZDdVjsU8MMywLDRNJP2cpkPm Q==;
X-CSE-ConnectionGUID: w97PCWfmSO+/c/mRwQ3mOA==
X-CSE-MsgGUID: X/88lleASgezoTWi9xUvkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92195397"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="92195397"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 07:30:28 -0700
X-CSE-ConnectionGUID: sppQLjG1SqW1D3p8q6UmKA==
X-CSE-MsgGUID: dbWJ4k6nRa+QVnb68RUTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="245408801"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2026 07:30:26 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Clear pending_disable before signaling suspend
 fence
Date: Mon,  1 Jun 2026 19:59:59 +0530
Message-ID: <20260601143000.2830227-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260601143000.2830227-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260601143000.2830227-1-tilak.tirumalesh.tangudu@intel.com>
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

