Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFD7C52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF3210E3EA;
	Tue,  6 Aug 2024 19:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5jRhDB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A1C10E3E1
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972492; x=1754508492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9EPgmcOoww9zrLQzfm0C4sNRIlStiPEColufS96cx8=;
 b=l5jRhDB1Q+KKCM7vByzITRwnmZVtxn7fiv6tPvJsZDCAA37PD6ci8gOv
 phoKsHJIsqR6Cmul+dfZ18YL6WfWlzqrj0eJB37CcjHKmqrH+4J60U2a8
 CE29i1VMGJ5+loVMXF/s11YFjlLrpwzVzzxIUcND4RaKS1SVzfD+KQol0
 +JDmlhIkM8o7J88SMzO4XsVRbEw5rb4p009oGtzJ51VNQU25OEYviJA1l
 QSInagYr4PipcOMQX4w6oQQ1d+ysn/nqXIG8jpllXp8lYxomkhEq9Ffo/
 pt/7zK7ttpks2lC/Bqgx2ofoLeSgVH8YZlW5ARwyIeKKpgm8Jqs+nQ+Pj g==;
X-CSE-ConnectionGUID: F1lAYogLSTKHyManCPWjSw==
X-CSE-MsgGUID: k5uayFMtTkS+B7H8xfTLIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682134"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682134"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:12 -0700
X-CSE-ConnectionGUID: lHquJMtkSB6wbPyodJkiyg==
X-CSE-MsgGUID: MjA50iRKSDyHofn7YftUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585100"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 10/13] drm/xe/guc_submit: Allow calling
 guc_exec_queue_resume with pending resume
Date: Tue,  6 Aug 2024 21:27:08 +0200
Message-ID: <20240806192739.1076344-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806192739.1076344-1-francois.dugast@intel.com>
References: <20240806192739.1076344-1-francois.dugast@intel.com>
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
index 50013e1e7455..782561b21d24 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1623,10 +1623,9 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
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

