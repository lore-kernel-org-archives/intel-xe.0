Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B60CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A12210EC68;
	Fri, 17 Oct 2025 15:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="dey9Iuki";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499F910EC62
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1760715440;
 bh=upuwLmCSgPoNTInTlpVvIpw9JFl8b4p+vbmK4DmjNsw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dey9Iuki+sPYCeiknllzBUX66w0FGBAPHgi6yfUlhNmcyG6nTP2HYMOp4TusM0dHW
 4E2muw/9dWcI/SV7CmCjUOLmoG0gNMMh8tWotXVmGWU0Pg/1QKB7Cb2QjB+Z0sW7lI
 fiDe+i8JYqfhz8yagyzviG+rfljK+qZvxr6UddA5wpmhJmMXTkUf3RhDIbTIP9XKkC
 0LRox18RGQJ/8BthcCm2LDiNyV4sABQXm75nc+QIxIX6sXTkkjOrp02xhiNydrXUMq
 mAniurNB9P+NS8xnf++o04ixJhAzhWINAQ7ZshdF6N4fpyCfEBFSNmA6jlHJ+YQ24+
 G/Idz3XxH6i+w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 1/5] drm/xe: Bump xe_device_l2_flush even higher
Date: Fri, 17 Oct 2025 17:37:44 +0200
Message-ID: <20251017153748.26059-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017153748.26059-1-dev@lankhorst.se>
References: <20251017153748.26059-1-dev@lankhorst.se>
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

It turns out for some applications 1 ms is not enough, and 2 ms is
needed.

Failing to flush causes a catastrophic display update failure,
so we should prevent it if possible.

Add an even bigger margin of 5 ms, and complain loudly if we ever exceed
it.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6097
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5f6a412b571c7..f6704c57e87ca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1077,8 +1077,8 @@ void xe_device_l2_flush(struct xe_device *xe)
 	spin_lock(&gt->global_invl_lock);
 
 	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
-	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 1000, NULL, true))
-		xe_gt_err_once(gt, "Global invalidation timeout\n");
+	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 5000, NULL, true))
+		xe_gt_err(gt, "Global invalidation timeout\n");
 
 	spin_unlock(&gt->global_invl_lock);
 
-- 
2.51.0

