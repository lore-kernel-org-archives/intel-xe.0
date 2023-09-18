Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AE3CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 11:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C7E10E06E;
	Mon, 18 Sep 2023 11:56:40 +0000 (UTC)
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Mon, 18 Sep 2023 11:56:38 UTC
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E3F10E044
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 11:56:37 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695037739; bh=t62i0LjvA08Ah92D0O8six5SiGEi++UDi/kdCnSvAJY=;
 h=From:To:Cc:Subject:Date:From;
 b=L970ZJubHTKTAsPfTzx2TSWVdUOx6HrXruNZLc+k1RBDgSv+y5P1wtrqxdF89iwd7
 yJNW72K3dvHUCenn33s46iZTQ6btyTs2Vf1l2XHz4/FEeWjCYP8HfSr+GDkjMpt5Tj
 3uyqj9beTDX62BOY336b53TMz2oCi0tk75q93TDz9dSSKMn/aBpIqMY/BaXAjII9WA
 oTKLmiyBfEiechpeFSEdfX2DYzc3LyOHy73dhIFubQ1kiLZnWt4Iix33CgFQFgYWQp
 NndMIVLxYhJQZfv100gUONij+GpHza9rPh26BwP0JAyo6neM0T6omMoJEXNXPejclD
 WcWlqVjfPIlbQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 38IBn4Ke067730
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 14:49:04 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 38IBn4Kr067729; 
 Mon, 18 Sep 2023 14:49:04 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 14:48:46 +0300
Message-Id: <20230918114848.67712-1-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: proper setting of irq enabled flag
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

IRQ enabled flag should be set only after request irq succeeds.

Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_irq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 3f34c507ff59..dff9a1b40540 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -590,16 +590,14 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
-	xe->irq.enabled = true;
-
 	xe_irq_reset(xe);
 
 	err = request_irq(irq, irq_handler,
 			  IRQF_SHARED, DRIVER_NAME, xe);
-	if (err < 0) {
-		xe->irq.enabled = false;
+	if (err < 0)
 		return err;
-	}
+
+	xe->irq.enabled = true;
 
 	xe_irq_postinstall(xe);
 
-- 
2.34.1

