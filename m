Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D865C0218B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 14:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A7710E5CC;
	Tue, 21 Jan 2025 14:29:30 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78CC10E5CC
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 14:29:26 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
	Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 2/3] drm/xe: Defer irq init until after xe_display_init_noaccel
Date: Tue, 21 Jan 2025 15:28:49 +0100
Message-ID: <20250121142850.4960-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121142850.4960-1-dev@lankhorst.se>
References: <20250121142850.4960-1-dev@lankhorst.se>
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

As stated in previous commit, we have to move interrupt handling
until after xe_display_init_noaccel, as using memirqs would require
an allocation.

A full solution will of course require memirq allocation to be moved,
but the first part only focuses on the required changes to display.

Reviewed-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bd6191e1ed3e7..2e008528a9f92 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -808,10 +808,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_irq_install(xe);
-	if (err)
-		goto err;
-
 	err = probe_has_flat_ccs(xe);
 	if (err)
 		goto err;
@@ -845,6 +841,10 @@ int xe_device_probe(struct xe_device *xe)
 			goto err;
 	}
 
+	err = xe_irq_install(xe);
+	if (err)
+		goto err;
+
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
 
-- 
2.43.0

