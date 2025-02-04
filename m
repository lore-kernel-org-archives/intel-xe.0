Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34154C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 13:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA1510E61F;
	Tue,  4 Feb 2025 13:21:48 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF72B10E32D;
 Tue,  4 Feb 2025 13:21:47 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <dev@lankhorst.se>, Ingo Molnar <mingo@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 2/8] drm/xe/gt: Unify
 xe_hw_fence_irq_finish() calls.
Date: Tue,  4 Feb 2025 14:22:31 +0100
Message-ID: <20250204132238.162608-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
References: <20250204132238.162608-1-dev@lankhorst.se>
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

Those calls should be from xe_gt_init, not the diverse amount of places
they are called.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 01a4a852b8f43..943bab94119fa 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -408,13 +408,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref) {
-		err = -ETIMEDOUT;
-		goto err_hw_fence_irq;
-	}
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -455,9 +453,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_force_wake:
 	dump_pat_on_error(gt);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-err_hw_fence_irq:
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
@@ -465,7 +460,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 static int all_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
@@ -543,8 +538,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
@@ -596,35 +589,39 @@ int xe_gt_init(struct xe_gt *gt)
 
 	err = xe_gt_pagefault_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	xe_mocs_init_early(gt);
 
 	err = xe_gt_sysfs_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	err = gt_fw_domain_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	err = xe_gt_idle_init(&gt->gtidle);
 	if (err)
-		return err;
+		goto err;
 
 	err = xe_gt_freq_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	err = all_fw_domain_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	xe_gt_record_user_engines(gt);
 
 	return 0;
+err:
+	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
+		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+	return err;
 }
 
 /**
-- 
2.47.1

