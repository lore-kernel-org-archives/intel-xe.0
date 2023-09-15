Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95F4CD37AF
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 23:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BC810E09C;
	Fri, 15 Sep 2023 23:34:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7917610E09C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 23:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694820874; x=1726356874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5bt8PZhVYDINoujYp7/k3j6ziiySeHEhNmn3VMZ18I=;
 b=WNN9yipYEkmkIcYwA1jmhiAQGj+t8AbXyiSrvD8+ZUBAWzM5xmOSxuBn
 pK2+jFdktr9NWy4AocFBH5WX8YKd1jqeifjGsLhAPg8eLRqIpcWTTwWnn
 LJNkKmuTzwk+XIHkkYC2poX188QRfYg8OuGc6txnU5ZXgkSLubJ+ZhM2j
 Dj1LF36IE0OwUeHBibOO8MCPWZotdjaYd7i5C+prMZmHoApVC5aPudqEK
 XN6Zcde9cdPDoV6dxbhwjcMZhgmly9ituj+vqHM3TUU67jMSIf2VBsnjU
 JKMokV8agpGSWgd2paqkZFxQ4DOUFIhBndAZmyeJNi+Cn3gaECfR5KXdY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="376694106"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="376694106"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 16:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="992036136"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="992036136"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 16:34:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 16:34:42 -0700
Message-Id: <20230915233445.2241554-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915233445.2241554-1-matthew.brost@intel.com>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] drm/xe: Fix xe_exec_queue_is_idle for
 parallel exec queues
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

Last little piece to support parallel exec queue is compute mode.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6725157d8c1d..eee64ba87d50 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -867,8 +867,17 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
-	if (XE_WARN_ON(xe_exec_queue_is_parallel(q)))
-		return false;
+	if (xe_exec_queue_is_parallel(q)) {
+		int i;
+
+		for (i = 0; i < q->width; ++i) {
+			if (xe_lrc_seqno(&q->lrc[i]) !=
+			    q->lrc[i].fence_ctx.next_seqno - 1)
+				return false;
+		}
+
+		return true;
+	}
 
 	return xe_lrc_seqno(&q->lrc[0]) ==
 		q->lrc[0].fence_ctx.next_seqno - 1;
-- 
2.34.1

