Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B500CDD1B2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B7810EC72;
	Fri, 27 Sep 2024 14:14:12 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFE010EC67
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 14:14:07 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 13/14] drm/xe: Move interrupt initialisation until after
 xe_display_init_noaccel
Date: Fri, 27 Sep 2024 16:14:03 +0200
Message-ID: <20240927141404.163317-14-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
References: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
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
index 0a9aa76bf8c4..eda34e284b16 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -678,9 +678,6 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		err = xe_memirq_init(&tile->memirq);
-		if (err)
-			return err;
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -700,10 +697,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_irq_install(xe);
-	if (err)
-		goto err;
-
 	err = probe_has_flat_ccs(xe);
 	if (err)
 		goto err;
@@ -731,6 +724,17 @@ int xe_device_probe(struct xe_device *xe)
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

