Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9B6C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22D910E7AC;
	Wed, 24 Jul 2024 19:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkFULZj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E9E10E7A0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849712; x=1753385712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+dDJc+vt4iiUrTq6lxNEwWVNz42x4hFH7givR74Bitk=;
 b=TkFULZj4cOkH1th9VMHuAo6JKo7L3fsZvmGl1SQICZwqPVAtfrZRL7wu
 HPM/hqNCwGvvh71ywS+mdi+UG3SiKHez+wd42LPf6Bw9S5/iAmyl0bO7G
 wABPYNf6HjrdGnQ0c70guidIIc7G2ShdFX0/RW8XWl9MJMXyZUvtATXwZ
 jfp/i9NM6UAZ4tHRYoMB4su+9su7NBSAZI4AYs0bzXvq+EtL1GfqeKyRk
 SP7g+Sh57cLVKvJdhwuSKtcFoMp+6j3F9kngQmtWwQmWFUvJWJpw7Q5xT
 Iec9yA95hiEoS6CbSq1Y6veiVvK2AvS19M6lCctcvtXa8rfmj/loXdV+2 g==;
X-CSE-ConnectionGUID: LagBs6MPQNy8csYsijNhcA==
X-CSE-MsgGUID: gW1rUqZDRrSqW6gD2Uk31Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691139"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:12 -0700
X-CSE-ConnectionGUID: AMGIpzDMRmeP4DjwFO+PFQ==
X-CSE-MsgGUID: CFmqEjvIRCGDIjbrel7HBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292306"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 09/12] drm/xe/guc_submit: Allow calling
 guc_exec_queue_resume with pending resume
Date: Wed, 24 Jul 2024 21:33:02 +0200
Message-ID: <20240724193431.2685833-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
References: <20240724193431.2685833-1-francois.dugast@intel.com>
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

Make it safe to have multiple calls to guc_exec_queue_resume() for the
same exec queue. This allows the use of this function from a context where
knowledge about prior calls is missing. In this case the function does
nothing but at least it does not fail on assert.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d5c272a48e64..a06800ed5563 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1588,10 +1588,9 @@ static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, !q->guc->suspend_pending);
+	if (q->guc->suspend_pending)
+		return;
 
 	guc_exec_queue_add_msg(q, msg, RESUME);
 }
-- 
2.43.0

