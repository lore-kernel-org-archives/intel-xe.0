Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F1BE7E631
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0256010E3DA;
	Tue, 26 Sep 2023 13:03:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E6910E3DD
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733374; x=1727269374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gE4HEGlZ5EYXDB5dWWVsyjtm+cVTJrHQznCQZEclnlg=;
 b=KTC9oE5+xKn50MDroecZ+eRCtaCU23JS/zxCPzp0YKWSOftAmMJAGYOM
 9R98SSNk+zhxDuWw/jUMwZQi0bbGyvtyT8q7EaRZOOxJCVLnYH4MbxzFl
 oXVR/IVeuU31YexHJ5uWTjI5R7kRtx27MCs9sIhQBsYKYJB9gMTMNXdUP
 Ync1Qp7sd/LZG6OfNoY1+UmQxwsUkIc5CZZT10V1EA7Fru+A8A5dTOhmH
 QVLcrtVti2O5+Ivf8WeIWFVXALT2aMyISdnAonvm3sYyQU3VulVi8oqYt
 hXezaqDGeRNRKXhM8AN1Trhd3qTODQXrJI1cCc4rWWvJW58PYkZawV9Fx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617097"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617097"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139535"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:17 +0000
Message-Id: <20230926125540.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 07/30] drm/xe: Fix xe_exec_queue_is_idle for
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Last little piece to support parallel exec queue is compute mode.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 744be293fe37..6f1e64896a2d 100644
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

