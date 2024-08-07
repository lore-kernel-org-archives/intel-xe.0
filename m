Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55152C52D7B
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19510E57F;
	Wed,  7 Aug 2024 16:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQyUR9YB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCB710E57F
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047879; x=1754583879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYxpsV8GLXYOtbglV72nW/2wf+k1UHMAqKfRqtc42Tc=;
 b=lQyUR9YBdRck70rjxUSHKZMxvsblsbz62533g4uIJvbVlgUlX3AejLhR
 hnrEvz9tH+qBbCvL3Pls1FJmB8xyyshuGMse5WBHLUvJaQDYS+aRA/DJd
 1Cq0budpWnwHaAgDZjr53BTr7Ntd8d8UAdYF8iXnrWgxLOko6+uB72i4+
 r+Ctmt/gPF8dISTtiPB55G2fThOaHzAPUuaCxwcSrUrYf983S3f33ut5K
 gWMLdXV+LdWOqQiA250/S62UcHjyajxYUufRGACULWlxk2lGGMoLuhE3P
 XQS7QtfCKRpW4TGtskACfqaicPtu6qxLcuYbjAVSCkyJ/Dxz5LDLUm0bZ g==;
X-CSE-ConnectionGUID: 0vs/7j8ASICFPMrwV9T4wQ==
X-CSE-MsgGUID: 7JAdZRTtTuWOybNkafwhvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20793813"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="20793813"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:39 -0700
X-CSE-ConnectionGUID: zbpMOGhzTeu5IOSi30nkOg==
X-CSE-MsgGUID: TnuM2PeOSf6eq7osEfA3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61790929"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:38 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 02/13] drm/xe/guc_submit: Make suspend_wait interruptible
Date: Wed,  7 Aug 2024 18:23:31 +0200
Message-ID: <20240807162416.1307061-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807162416.1307061-1-francois.dugast@intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
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

Rely on wait_event_interruptible_timeout() to put the process to sleep
with TASK_INTERRUPTIBLE. It allows using this function in interruptible
context.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 460808507947..50013e1e7455 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1603,11 +1603,11 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 * suspend_pending upon kill but to be paranoid but races in which
 	 * suspend_pending is set after kill also check kill here.
 	 */
-	ret = wait_event_timeout(q->guc->suspend_wait,
-				 !READ_ONCE(q->guc->suspend_pending) ||
-				 exec_queue_killed(q) ||
-				 guc_read_stopped(guc),
-				 HZ * 5);
+	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
+					       !READ_ONCE(q->guc->suspend_pending) ||
+					       exec_queue_killed(q) ||
+					       guc_read_stopped(guc),
+					       HZ * 5);
 
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
-- 
2.43.0

