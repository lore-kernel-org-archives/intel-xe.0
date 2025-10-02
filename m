Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBBECCD184
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ED510E860;
	Thu,  2 Oct 2025 23:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ra5v1Wff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C170410E858
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759446288; x=1790982288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNeu2npvdom+1tyPpM8YE39lKvV/sQ8/lewNTAXdfOo=;
 b=Ra5v1WffjIiwiETrU0m3OdvH4Y8N7uozDVT9PRRkozTEyXnqxk/VLIMj
 uSLI9WvvcLeah77Ci6jFKICb60OJZbMN0W8jSP4y/i+TyqyjY06M8IXqC
 fKH+QVA597xxRxk6/4eS1583zIdAiLJatBh/LxYzp4cAEFCI5j1/UUwTd
 wilmIFCREd2EQssKozN+nxHWibbq6SJRrQR+tQJAsBJnq0wCsoxZlDmWL
 26JoZs1goRthKdN9XYbtDLnUjzi6Ved/rgN3m1/vHylIFwXqkLUWzRShR
 iX4zxAbNe87v3acHe4YHSHMjPWptYGcTpCcd1towUg+j6Gl+LI2I8n3Ge A==;
X-CSE-ConnectionGUID: 448P/lV4TOuUqMTID3H+BQ==
X-CSE-MsgGUID: ksIZ9ouoR3agQ8CJbPjzfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79165583"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79165583"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:47 -0700
X-CSE-ConnectionGUID: gf+4ATWaQZKTpXYmkqyqeQ==
X-CSE-MsgGUID: BWDf43j4S2OqS8EXJYs+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179566731"
Received: from dut4351arlh.fm.intel.com ([10.105.10.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 6/7] drm/xe: Don't send a CLEANUP message on sched pause
Date: Thu,  2 Oct 2025 23:04:43 +0000
Message-Id: <20251002230444.313505-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
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

When the DRM scheduler has been "paused" (see xe_gpu_scheduler.c),
if we then send a message to cleanup an exec queue at that time,
we will never get a response for it if for some reason the
unpause never happens. This can occur if for some reason during
exec queue creation, the device becomes wedged. The wedge event
will cause that scheduler to become paused and the creation
then leaves a dangling LRC that will never get cleaned up since
the recovery is a driver rebind. So essentially this change
fixes a potential memory leak in the event the device is
wedged during a test unexpectedly (e.g. during an unexpected
hardware failure).

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 55a50c46ea2b..45b72bebfc63 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1732,7 +1732,8 @@ static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q) &&
+	    !READ_ONCE(q->guc->sched.base.pause_submit))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
 		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
-- 
2.34.1

