Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C690CDD1D5
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EC510E599;
	Mon, 30 Sep 2024 19:58:17 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AA510E59B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 19:57:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 14/15] drm/xe: Move interrupt initialisation until after
 xe_display_init_noaccel
Date: Mon, 30 Sep 2024 21:57:48 +0200
Message-ID: <20240930195749.318998-15-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
References: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
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

memirqs require a GGTT allocation, so we have to postpone this until
after xe_display_init_noaccel.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d7c2b7a013bfc..31d668ab60f04 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -679,9 +679,6 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		err = xe_memirq_init(&tile->memirq);
-		if (err)
-			return err;
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -701,10 +698,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_irq_install(xe);
-	if (err)
-		goto err;
-
 	err = probe_has_flat_ccs(xe);
 	if (err)
 		goto err;
@@ -732,6 +725,17 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	/* And now initialize interrupts and memirq */
+	for_each_tile(tile, xe, id) {
+		err = xe_memirq_init(&tile->memirq);
+		if (err)
+			return err;
+	}
+
+	err = xe_irq_install(xe);
+	if (err)
+		goto err;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init(tile);
 		if (err)
-- 
2.45.2

