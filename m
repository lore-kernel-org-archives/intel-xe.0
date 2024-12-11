Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EDFE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 22:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224ED10E633;
	Wed, 11 Dec 2024 22:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nip+dw/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7CF10E633
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 22:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733957635; x=1765493635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nFV/erRxP0hkEp25dMrffQ0VJOeXkf5ychORSPiTSLQ=;
 b=Nip+dw/l5V3bF79JraRiTkYo9CMYMyzS1+dDhPTG3GXjakBjFftZmehB
 pEuLE4UUmihFvQmVWnAlz9E7n1SbC4gVg5yVRtIGjIQozSMq6iDGIgMnn
 7JyTuIkPjfRykV5nvQ6Ft2Qa3mWzPB2o/fg50aIj2XNc+GHFMPG/UPK87
 Y8zSqx9eIMUeIHJNCYOiMcbq5uhH8d8irdI6Ap/xL7agBmMiCM3fwkk/K
 Sw+xjzFwate+oQdIb/vtsSBeyrbKnVZmprD1oWPHtVdvSUehEzlbdxoej
 62BIZNnOnoYTHvRr1Ux4z/ypO6j5tppEWBZulBUlMYWl1ktT5VBJHBDVr A==;
X-CSE-ConnectionGUID: MqjnmtaaQkmfW9mwLKxOQw==
X-CSE-MsgGUID: 96dDnSzORMya7Eue/ST/xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51773077"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="51773077"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 14:53:55 -0800
X-CSE-ConnectionGUID: llOxct7FTmeKr207Gp4WZQ==
X-CSE-MsgGUID: ymgXLJ/mRUm38jXkNuiOdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100099172"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 14:53:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Fix fault on fd close when wedged
Date: Wed, 11 Dec 2024 14:53:32 -0800
Message-ID: <20241211225332.1136152-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

If device is wedged, the final run ticks update for the client should be
skipped as it's already unmapped. Fix this pagefault when forcing a
wedged state with igt:

<6> [IGT] xe_wedged: exiting, ret=98
<1> BUG: unable to handle page fault for address: ffffc901bc5e508c
<1> #PF: supervisor read access in kernel mode
<1> #PF: error_code(0x0000) - not-present page
...
<4>   xe_lrc_update_timestamp+0x1c/0xd0 [xe]
<4>   xe_exec_queue_update_run_ticks+0x50/0xb0 [xe]
<4>   xe_exec_queue_fini+0x16/0xb0 [xe]
<4>   __guc_exec_queue_fini_async+0xc4/0x190 [xe]
<4>   guc_exec_queue_fini_async+0xa0/0xe0 [xe]
<4>   guc_exec_queue_fini+0x23/0x40 [xe]
<4>   xe_exec_queue_destroy+0xb3/0xf0 [xe]
<4>   xe_file_close+0xd4/0x1a0 [xe]
<4>   drm_file_free+0x210/0x280 [drm]
<4>   drm_close_helper.isra.0+0x6d/0x80 [drm]
<4>   drm_release_noglobal+0x20/0x90 [drm]

Fixes: 83db047d9425 ("drm/xe: Stop accumulating LRC timestamp on job_free")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3421
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index aab9e561153dc..9ad7a6b24cc3a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -265,7 +265,9 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	 * Before releasing our ref to lrc and xef, accumulate our run ticks
 	 * and wakeup any waiters.
 	 */
-	xe_exec_queue_update_run_ticks(q);
+	if (!xe_device_wedged(gt_to_xe(q->gt)))
+		xe_exec_queue_update_run_ticks(q);
+
 	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
 		wake_up_var(&q->xef->exec_queue.pending_removal);
 
-- 
2.47.0

