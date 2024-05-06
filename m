Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806CCC10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 12:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287CB10EDCB;
	Mon,  6 May 2024 12:08:13 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6490710E27A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 12:08:11 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t] lib/intel_ctx: Propagate error from __intel_ctx_xe_exec
 wait timeout
Date: Mon,  6 May 2024 14:08:27 +0200
Message-ID: <20240506120827.5799-1-maarten.lankhorst@linux.intel.com>
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

Any wait timeouts are currently ignored, which might cause silent
failures in test. Be more noisy about them.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 lib/intel_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index b43dd6391..30325b906 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -450,7 +450,7 @@ int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offse
 		goto err;
 
 	if (!ctx->sync_bind || !ctx->sync_out)
-		syncobj_wait_err(ctx->fd, &sync_out, 1, INT64_MAX, 0);
+		ret = syncobj_wait_err(ctx->fd, &sync_out, 1, INT64_MAX, 0);
 
 err:
 	if (!ctx->sync_bind)
-- 
2.43.0

