Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09F10A3D7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 12:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450C410EA75;
	Thu, 26 Mar 2026 12:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="dryfyCYn";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5622110EA75
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1774527501;
 bh=rrRwt7Yv+iskizb9UmbXa/32qRBtMoCWVlk4vHiPim4=;
 h=From:To:Cc:Subject:Date:From;
 b=dryfyCYnLUvi27pJKlRnidQWRekN2dtuHvhUYfAyOfCUPfHG9PBtz7qHZgV4PyabC
 61T2s/xCX0IQ0Ma0Q31gV743/2o6YX00UYPulwIeRfjgwer/aZsstOR6eqUofX60xL
 1FCM4kIPjOvccgme4nxWzn/2Ofwo6OCe+YIAwPBShH3Bp/bZ5mdjxezfdBgRW2CIlZ
 axoZ4HKfYXUtymTq5FVLhj5cWwFsVW36J/+Cvj/oazf4EgTvoZmmev2L3UbgbujHP/
 w6dW9oKs+e6O5oqRSH/w3tPYLDnEjdwMbJm+9aLc0U0FTSSg29JIkDKTVFiOroTv6E
 T0gSDqkolE06Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe: Remove useless comment.
Date: Thu, 26 Mar 2026 13:18:14 +0100
Message-ID: <20260326121818.122401-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

Commit 792d2b9a1259 ("drm: drop mtrr from i915"), added this comment,
drop it since it was carried over from i915.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e77a3a3db73db..94629d782d07d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -388,9 +388,6 @@ bool xe_is_xe_file(const struct file *file)
 }
 
 static struct drm_driver driver = {
-	/* Don't use MTRRs here; the Xserver or userspace app should
-	 * deal with them for Intel hardware.
-	 */
 	.driver_features =
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
-- 
2.53.0

