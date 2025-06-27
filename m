Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E841EC7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B295610EA1A;
	Fri, 27 Jun 2025 13:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GwRalMun";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9CD10EA1A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iUm0uSXvv9yhb4eNlrBzuB7YICsQLi+LjJm6OCv56QY=; b=GwRalMunRujKbl71WfHIv+qYvW
 f9suN4SbkPp1OlDDpYYyV3WPANPgvFCtMK9LsGtJlf1fR84tCBcsCII9qDvhzq7Hv4np2TIbl43E2
 dDh5ONzCZRns50qG/v0htTBF8KaSTracYSq3Sh4lbne3RbZgDkZ82u9rO6gI7AKvkK+kK0bugca/L
 DyQaWLluY1cWVvsBqaES67TNcEfDEeLezhc+9z4wvuUPznWvqgfqh19mQNsVOwv2QdaLlSHn9dz99
 /oZKQr6YCXKzadXwHG6znNqK+gA0MIOP4rjwSdSbU+GEL+pGIjqLTgr0rTkRlkGlolsdGCWz4hBsD
 F/RBA7OA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uV8ui-009PKs-Bp; Fri, 27 Jun 2025 15:14:44 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/2] drm/xe: Simplify batch buffer allocation in emit_wa_job()
Date: Fri, 27 Jun 2025 14:14:37 +0100
Message-ID: <20250627131438.54398-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
References: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
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

Code just needs a large enough buffer and it doesn't even check. Lets
therefore simplify to one allocation path which is guaranteed to be as
least as big as the current ones.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d397df056e4c..86018fee74d3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -190,13 +190,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	int count_rmw = 0;
 	int count = 0;
 
-	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
-		/* Big enough to emit all of the context's 3DSTATE */
-		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
-	else
-		/* Just pick a large BB size */
-		bb = xe_bb_new(gt, SZ_4K, false);
-
+	/* Just pick a large BB size */
+	bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-- 
2.48.0

