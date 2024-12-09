Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67232E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 11:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194E710E6C5;
	Mon,  9 Dec 2024 11:16:51 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DF210E6C5;
 Mon,  9 Dec 2024 11:16:49 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2] drm/xe: Defer irq init until after xe_display_init_noaccel
Date: Mon,  9 Dec 2024 12:17:21 +0100
Message-ID: <20241209111721.13686-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206185956.3290-5-dev@lankhorst.se>
References: <20241206185956.3290-5-dev@lankhorst.se>
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

We want to merge xe_display_init_noirq and xe_display_init_noaccel,
by not enabling interrupts in between, this should be safe to do.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
v2: Remove memirq parts, reword commit message.

 drivers/gpu/drm/xe/xe_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c1b4601a14779..fbec176ee64ad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -701,10 +701,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_irq_install(xe);
-	if (err)
-		goto err;
-
 	err = probe_has_flat_ccs(xe);
 	if (err)
 		goto err;
@@ -738,6 +734,10 @@ int xe_device_probe(struct xe_device *xe)
 			goto err;
 	}
 
+	err = xe_irq_install(xe);
+	if (err)
+		goto err;
+
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
 
-- 
2.45.2

