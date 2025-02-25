Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039C2C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 04:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67C010E539;
	Tue, 25 Feb 2025 04:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doN4ap0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4422510E539
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 04:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740459071; x=1771995071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=prtp3LYwzzlN0z56eECv2B4Bn7tNw1o5ud0WnmhpkJo=;
 b=doN4ap0konaYIdvTi5NkfaJUb+A39eX5gDdkXg1gzgin8oBWljgItG2v
 3VWZRO1OUC014s21fGqw7i7IeFux73k4HHCiGHGzUrPCTAuHtqif2ZSlb
 1GYPE/DtHBzIrNVFANDLBMoYRJHQLBtLIMVIbc0ZZGU8c2EfGjkuqm+0l
 yzn3qj17YS66dg3w1JT3dmz81R/69ci04ms0Fl2GUR/1heA9hjkdjgnIG
 cJjRelFScF19AiwK89DmGyRoqkzbyXmyEpDykSQbXZb15mQJyIfp5Thyq
 21xTgodilkaN8A0DWdCC5LKZqiMgQ6LWMLofvUaMihwsc8IugzCXHSH6f Q==;
X-CSE-ConnectionGUID: DyoDRGf9Qp2AKZYQeGrPmw==
X-CSE-MsgGUID: nO89dSXkQ3ajBYrgCaRrFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52675143"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52675143"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:51:09 -0800
X-CSE-ConnectionGUID: fGjA2PWERSqUQFUnrMl0xQ==
X-CSE-MsgGUID: eq96dAW6Se+3mSMmVMUBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120380260"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:51:07 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3] drm/xe: cancel pending job timer before freeing scheduler
Date: Tue, 25 Feb 2025 10:27:54 +0530
Message-Id: <20250225045754.600905-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Async call to __guc_exec_queue_fini_async frees scheduler
at the same time when some scheduler submission would have
timed out and restarted. To handle such small window race
case, all pending jobs timer should be cancelled before
freeing scheduler.

V3(MattB):
 - Adjust position of cancel pending job
 - Remove gitlab issue# from commit message
V2(MattB):
 - Cancel pending jobs before scheduler finish

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..b6a2dd742ebd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1248,6 +1248,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
+	/* Confirm no work left behind accessing device structures */
+	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
-- 
2.34.1

