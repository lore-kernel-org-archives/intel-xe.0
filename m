Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68D9E784AF
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95401113F6F;
	Thu, 25 Dec 2025 01:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2AKvaDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334FD113F70
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gTpqSloEDiZjOsdH40BC10R/jpkGL8u6zC2sbIl/3kI=;
 b=g2AKvaDkLub9+RCaCXs2Xg97edDpYDhtHXkhUb9sRtwuqEPwo08IfiUg
 dcT+0W2VmOHWsid7zZpktkMIUWtU/A/lXkzZJtcpUEh81IwO/QReeAlhO
 3QMzUGC/gsjJ2bQwYv6t4PNiWZ73fWOv950b9YqPbyLAAkt/updy1aFhE
 HO4Qsb+GxNzPKVOI3X9hiJIBwrKkaN1fN28rVGkMKgFc7sLCBUxVhikfn
 p9ep+JtpV33B1S6xeRikDezPfUBzN4bej72ML+gSR3QwrRZfuh43EvdLD
 e1gdwtAU3choGJyWm0gtRieEUTTeAR5QZHP7t07Zp1jawpSv1+psmmOH/ A==;
X-CSE-ConnectionGUID: awIaNLefQNKToFXnu5NSIA==
X-CSE-MsgGUID: xU6Zk94OSpyXWWdQ4lzaQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866362"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866362"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: EpmQ4wxWSWyySWdXHUgLRA==
X-CSE-MsgGUID: ztmG8XnkSEGJ9ffJmoLYIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629140"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 08/13] drm/xe: Stub out execlists deadline vfuncs as NOPs
Date: Wed, 24 Dec 2025 17:17:29 -0800
Message-Id: <20251225011734.341683-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The execlists backend is non-functional but shouldn’t crash. Stub out
execlists deadline vfuncs as NOPs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 46c17a18a3f4..1e9323fe19e3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -469,6 +469,23 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 	return false;
 }
 
+static void execlist_exec_queue_set_deadline(struct xe_exec_queue *q,
+					     struct dma_fence *fence,
+					     ktime_t deadline)
+{
+	/* NIY */
+}
+
+static void execlist_exec_queue_enter_deadline(struct xe_exec_queue *q)
+{
+	/* NIY */
+}
+
+static void execlist_exec_queue_exit_deadline(struct xe_exec_queue *q)
+{
+	/* NIY */
+}
+
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
@@ -481,6 +498,9 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
 	.reset_status = execlist_exec_queue_reset_status,
+	.set_deadline = execlist_exec_queue_set_deadline,
+	.enter_deadline = execlist_exec_queue_enter_deadline,
+	.exit_deadline = execlist_exec_queue_exit_deadline,
 };
 
 int xe_execlist_init(struct xe_gt *gt)
-- 
2.34.1

