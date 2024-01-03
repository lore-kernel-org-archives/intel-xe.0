Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24A8C46CD2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 01:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3A610E1EA;
	Wed,  3 Jan 2024 01:20:32 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jan 2024 01:20:30 UTC
Received: from out199-6.us.a.mail.aliyun.com (out199-6.us.a.mail.aliyun.com
 [47.90.199.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0463110E1EA
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 01:20:29 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VzrwAcM_1704244515; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VzrwAcM_1704244515) by smtp.aliyun-inc.com;
 Wed, 03 Jan 2024 09:15:16 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com
Subject: [PATCH -next] drm/xe: Remove unneeded semicolon
Date: Wed,  3 Jan 2024 09:15:15 +0800
Message-Id: <20240103011515.56529-1-yang.lee@linux.alibaba.com>
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

./drivers/gpu/drm/xe/xe_rtp.c:168:2-3: Unneeded semicolon

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index fb44cc7521d8..316ed2f6d1f0 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -165,7 +165,7 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 		*gt = (*hwe)->gt;
 		*xe = gt_to_xe(*gt);
 		break;
-	};
+	}
 }
 
 /**
-- 
2.20.1.7.g153144c

