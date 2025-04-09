Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E7AC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 09:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C4310E341;
	Wed,  9 Apr 2025 09:12:21 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9AB10E341
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 09:12:19 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI] drm/xe: Disble invalidate in migration job
Date: Wed,  9 Apr 2025 11:12:10 +0200
Message-ID: <20250409091210.1590853-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

Lets see if things break?

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a7582b097ae67..877d7cdb9b9d7 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -411,7 +411,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
 
-	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
+	if (0) {
 		/* XXX: Do we need this? Leaving for now. */
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_invalidate(dw, i);
-- 
2.45.2

