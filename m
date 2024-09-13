Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27593EEEC0E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 06:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79E910E14F;
	Fri, 13 Sep 2024 06:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IcE2SYlH";
	dkim-atps=neutral
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2024 06:08:29 UTC
Received: from out199-2.us.a.mail.aliyun.com (out199-2.us.a.mail.aliyun.com
 [47.90.199.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624210E14F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 06:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1726207706; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=IXY6foCUKJL70y4wvAm3n7YmrfSbfkYbIltLyuQlMbk=;
 b=IcE2SYlHDyo65pw+BbmyVt0Oe5k9ZeKSxgjnBP+rdLYJRvk4dzHMmUUB/sdDdMRkUOnvlmYGYkQ4Q+9Lmq56S6lAYRZr/8aVBcyKg71jX165tR3E6oK1qXp4pg7/15iV0RkaPgZu48Q9pegf4keG7KQA01Rd9E9xfINN9NQ7KNY=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WEtgHGI_1726207383) by smtp.aliyun-inc.com;
 Fri, 13 Sep 2024 14:03:18 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lucas.demarchi@intel.com
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH v3 -next] drm/xe/irq: Remove unneeded semicolon
Date: Fri, 13 Sep 2024 14:02:54 +0800
Message-Id: <20240913060254.26678-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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

Remove unnecessary semicolon in pick_engine_gt().

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v3:
  -Amend the submission information to "Remove unnecessary semicolon in pick_engine_gt()".

 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 07577b418205..e501002e8a04 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -280,7 +280,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
 			return tile->media_gt;
 		default:
 			break;
-		};
+		}
 		fallthrough;
 	default:
 		return tile->primary_gt;
-- 
2.32.0.3.g01195cf9f

