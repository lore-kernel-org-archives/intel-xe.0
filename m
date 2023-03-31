Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22109C6FD18
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 10:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1B810F1C9;
	Fri, 31 Mar 2023 10:24:28 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4241D10F1C6
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 10:24:26 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 12:24:15 +0200
Message-Id: <20230331102419.521392-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe: Use full_gt batchbuffer allocation
 for media tiles.
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

This fixes an oops on media tiles, because we don't initialise the
bb pool.
---
 drivers/gpu/drm/xe/xe_gt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc821f431c45..c7a2e9baabfb 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -237,6 +237,10 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		struct xe_engine *e, *nop_e;
 		struct xe_vm *vm;
 		void *default_lrc;
+		struct xe_gt *full_gt = gt;
+
+		if (xe_gt_is_media_type(gt))
+			full_gt = xe_find_full_gt(gt);
 
 		if (gt->default_lrc[hwe->class])
 			continue;
@@ -262,7 +266,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		}
 
 		/* Prime golden LRC with known good state */
-		err = emit_wa_job(gt, e);
+		err = emit_wa_job(full_gt, e);
 		if (err) {
 			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
 				gt->info.id, hwe->name, e->guc->id, err);
@@ -279,7 +283,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		}
 
 		/* Switch to different LRC */
-		err = emit_nop_job(gt, nop_e);
+		err = emit_nop_job(full_gt, nop_e);
 		if (err) {
 			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
 				gt->info.id, hwe->name, nop_e->guc->id, err);
@@ -287,7 +291,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		}
 
 		/* Reload golden LRC to record the effect of any indirect W/A */
-		err = emit_nop_job(gt, e);
+		err = emit_nop_job(full_gt, e);
 		if (err) {
 			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
 				gt->info.id, hwe->name, e->guc->id, err);
-- 
2.34.1

