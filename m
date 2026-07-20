Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02836C44535
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E5710E9E6;
	Mon, 20 Jul 2026 16:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="mRQ9Yaw4";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FBF10E9E6;
 Mon, 20 Jul 2026 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564045;
 bh=pvUwhE2Znirc5n3Q5WkWT5f7ylNhy6EK8HWWv5feHfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mRQ9Yaw4j4K5zS0USqNlYWFZU3+r0LM8O10WEQ9kVBCjCY4TfEj4RRFn5uKYjM9sG
 tauVairm0/ao9EDAMEcoozZrVvyk2bjGaom+VpvhhjNJIHkC1/c82M8pL3ZseuAx+5
 SZj9RZdocigbVMg1KjmT45BEuDpuDJ6Do+vygF1V70L7vU8jDDb6shW5WxxtUiiwvf
 Cg3pMINYcW4MacuuyvNo39NFv7yZovDj8ebm7PaGz1C4bgMN8sXXWC/u/0j48eTx1U
 IqQKylBrr53y1AswuHWsbz/vrMKH6SkUlQ4uYG7KvsQvItPobXiKcIow1Ez6YyVzgl
 s5VKOVUruf6DA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 09/11] drm/xe: Raise gt frequency slightly earlier.
Date: Mon, 20 Jul 2026 18:15:01 +0200
Message-ID: <20260720161451.384968-22-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
References: <20260720161451.384968-13-dev@lankhorst.se>
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

Move raising the gt frequency to before display_register, so the
blit that's potentially performed to copy stolen memory to system
memory will run at full speed.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65b..e6c4e1358a614 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1077,6 +1077,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	for_each_gt(gt, xe, id)
+		xe_gt_sanitize_freq(gt);
+
 	xe_display_register(xe);
 
 	err = xe_oa_register(xe);
@@ -1101,9 +1104,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	for_each_gt(gt, xe, id)
-		xe_gt_sanitize_freq(gt);
-
 	xe_vsec_init(xe);
 
 	err = xe_sriov_init_late(xe);
-- 
2.53.0

