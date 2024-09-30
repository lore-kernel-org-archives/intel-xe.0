Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C19CEBF74
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFE710E5A0;
	Mon, 30 Sep 2024 19:57:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1D210E59B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 19:57:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 15/15] drm/xe: Initialise GGTT later
Date: Mon, 30 Sep 2024 21:57:49 +0200
Message-ID: <20240930195749.318998-16-maarten.lankhorst@linux.intel.com>
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

Now that we know that nobody is using GGTT any more, postpone
initialisation to prevent any new allocations.

This prevents any new users from popping up.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 31d668ab60f04..5919da7b23361 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -676,9 +676,6 @@ int xe_device_probe(struct xe_device *xe)
 			if (err)
 				return err;
 		}
-		err = xe_ggtt_init_early(tile->mem.ggtt);
-		if (err)
-			return err;
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -710,6 +707,11 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_tile_init_noalloc(tile);
 		if (err)
 			goto err;
+
+		/* Initialise GGTT, before this point no allocations are allowed */
+		err = xe_ggtt_init_early(tile->mem.ggtt);
+		if (err)
+			return err;
 	}
 
 	/* Allocate and map stolen after potential VRAM resize */
-- 
2.45.2

