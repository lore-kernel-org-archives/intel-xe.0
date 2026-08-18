Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCA0C5DF67
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 04:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030D410E4F6;
	Tue, 18 Aug 2026 04:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKZxEGeX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4B210E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 04:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026067; x=1818562067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ie7UiFEuQgwL1qP/sNwBsUOvW06oVYujPhEeWTFwr1c=;
 b=RKZxEGeXSUY1dQakYi8ICVFe1cTX11WzPVZZgxqr9ZVL/zcnJNoWMQYx
 xOvLhNaQCv1mv+dzj1gh9wbFKXRYAqNyEnuAFP6SZQcmSPdKmPih0deZh
 ao15ARJE3FAYxm6HqMIUH4K994N5n2XHPRFvCQwEZkCRT+qM8urF3dOBD
 E1AXAufX9tdTs8A1AfJQ1UdY8M5Wi6Tyu33G630rfUTAnmoRaPWt+IbIb
 HZ1NKzC1uDKrMctUoW6fOuPDwHHAc8w6EDQrs1qRreLqbBSpR20SBs4n7
 9dt5AlgoGC1Nmx148N4ecst1JxIwab4fU8YCoTV9eHea2f2yDPWSltcUO Q==;
X-CSE-ConnectionGUID: /jBKk68yQ82lgd7ztn0qhQ==
X-CSE-MsgGUID: KWWwBYv3QJuedt0nrGMeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870338"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870338"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:07:46 -0700
X-CSE-ConnectionGUID: Edo7hWWbQuGrnc9IrH8w+Q==
X-CSE-MsgGUID: qXqPoZrTSKmzy8k8VnKN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477149"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:07:45 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org,
	matthew.brost@intel.com
Subject: [PATCH] drm/xe/guc: Skip CLEANUP message when GuC is stopped
Date: Tue, 18 Aug 2026 09:37:33 +0530
Message-ID: <20260818040733.135964-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

Attempting to enqueue a CLEANUP message while the GuC is stopped
(during a device reset or suspend) triggers a missing outer runtime
PM protection warning in xe_pm_runtime_get_noresume().

Since the GuC cannot service Command Transport (CT) requests while
stopped, skip the message and route directly to local teardown.

Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
Cc: stable@vger.kernel.org
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9036f89dff7d..24f35b0179e1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2180,12 +2180,14 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 #define STATIC_MSG_CGP_SYNC	3
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
+	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q) &&
+	    !xe_guc_read_stopped(guc))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
-		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
+		__guc_exec_queue_destroy(guc, q);
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
-- 
2.43.0

