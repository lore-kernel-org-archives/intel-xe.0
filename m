Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B97C83F15
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 06:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8FC10E0FE;
	Wed, 30 Aug 2023 06:45:08 +0000 (UTC)
X-Greylist: delayed 674 seconds by postgrey-1.36 at gabe;
 Wed, 30 Aug 2023 06:45:05 UTC
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1010E0FE
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 06:45:05 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1693376996; bh=ty6JTBBdkVpqgqVJRnPOJjiKDiZdW1AEO60ofN2wyZQ=;
 h=From:To:Cc:Subject:Date:From;
 b=RkjM59qn/10ASRwL6PzkX7f2Nx4OljOiqSAU7Nk6SZvPFvd/UhW4Eys1uTzTuo2V6
 R4HpmzlyNy6mt5AuuriktQr1+LYWvNJiLNfVC7tRUNVaGcWWMxGYXnXBZ2pZrA2x9K
 SFTfkNIUjYKG9cx0Y7AuzdDXh7OKH0PRD9Ruvuvmjgqlp64dRY+l8KkiHALW7iBWDJ
 iU11V2WW2XpdFPG9FTTqM4g4P7Xn6Fd8R2wdTEJuL9/2HWR12E5Fq8WAAYqIeVz965
 ZUgwzfjVW4BgX5CnSYKc4beDwbbabaeFRFWbVhpVbC6my5D/sPgISDX7MOQttxtGyR
 IU942v08IaTtQ==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 37U6XfQk347357; Wed, 30 Aug 2023 09:33:41 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 09:33:32 +0300
Message-Id: <20230830063332.347344-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix error handling flow when device
 probing fails
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
Cc: Ohad Sharabi <osharabi@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Upon device probe failure, rolling back the initialization
should be done in reversed order.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 766df07de979..109aeb25d19c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -325,11 +325,11 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_display_init(xe);
 	if (err)
-		goto err_fini_display;
+		goto err_irq_shutdown;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
-		goto err_irq_shutdown;
+		goto err_fini_display;
 
 	xe_display_register(xe);
 
-- 
2.34.1

