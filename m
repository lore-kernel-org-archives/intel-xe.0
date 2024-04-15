Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F864C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 03:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CF710FD8F;
	Mon, 15 Apr 2024 03:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yVI55dsk";
	dkim-atps=neutral
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Mon, 15 Apr 2024 03:32:59 UTC
Received: from out199-17.us.a.mail.aliyun.com (out199-17.us.a.mail.aliyun.com
 [47.90.199.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701EC10FD8F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 03:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1713151975; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=HQ/ETOKOJmL/IZamalPpP4votWKbCg1bK9n71loVHb8=;
 b=yVI55dskwn48cwqq0Br1sEkM6YJDcy3XL9SRcNCbapRC+KFDMKwm2i+ysBdtTAycIG8cunPdi7IGepZnlMGy4Jqg3rittIVsejSq/xdRuJI/IoL0nt7w8203U5wQwaB0S0E+2yC+VmTySBIRU4h5L06gCqE9Z4hnYng4q9EPxj4=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R971e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W4UNuFG_1713151654; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W4UNuFG_1713151654) by smtp.aliyun-inc.com;
 Mon, 15 Apr 2024 11:27:41 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lucas.demarchi@intel.com
Cc: ogabbay@kernel.org, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/xe/irq: remove unneeded semicolon
Date: Mon, 15 Apr 2024 11:27:33 +0800
Message-Id: <20240415032733.39584-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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

No functional modification involved.

./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 996806353171..5b1a2f46a1b2 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -276,7 +276,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
 			return tile->media_gt;
 		default:
 			break;
-		};
+		}
 		fallthrough;
 	default:
 		return tile->primary_gt;
-- 
2.20.1.7.g153144c

