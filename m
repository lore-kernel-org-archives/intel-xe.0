Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E75C7115E
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 18:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7580110E78F;
	Tue, 17 Jun 2025 18:02:13 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5044210E778
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 18:02:06 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 9/9] drm/xe: Move xe_ttm_sys_mgr_init() downwards.
Date: Tue, 17 Jun 2025 20:01:42 +0200
Message-ID: <20250617180132.7059-20-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250617180132.7059-11-dev@lankhorst.se>
References: <20250617180132.7059-11-dev@lankhorst.se>
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

Now that all previous allocations are gone, ensure no new allocations
will ever be done before xe_display_init_early(), by moving the call
that allows allocations downwards.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c8595cc0300fb..c0952f692fb66 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -782,10 +782,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_ttm_sys_mgr_init(xe);
-	if (err)
-		return err;
-
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init_early(gt);
 		if (err)
@@ -823,6 +819,14 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	/*
+	 * Allow allocations only now to ensure xe_display_init_early()
+	 * is the first to allocate, always.
+	 */
+	err = xe_ttm_sys_mgr_init(xe);
+	if (err)
+		return err;
+
 	/* Allocate and map stolen after potential VRAM resize */
 	err = xe_ttm_stolen_mgr_init(xe);
 	if (err)
-- 
2.45.2

