Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A3FC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 19:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5D410E9A7;
	Fri, 25 Apr 2025 19:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="i0GJ++jd";
	dkim-atps=neutral
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Thu, 24 Apr 2025 02:40:32 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B26110E2F4;
 Thu, 24 Apr 2025 02:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3qiDl
 T+rNYYIueM4osSVU8znOOazc0IsHSbCKSt2gPY=; b=i0GJ++jdfBqJB0rOGQB01
 9Hysr9shb3Qe88l2Zn1P4XzRD0Qi9Zs7Df2ipUmdwj3Azl2sv1NZGIacoa1nJ30L
 gerbmrh42nACfLXdjesA5Z8wiRC0PtYtAz4lx6SwExfn+0qJlIL15mwJ1FhCewxK
 CWTRlsy27Leoby/8j25Psw=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgCXvEWRpAloXUhmAw--.34232S4;
 Thu, 24 Apr 2025 10:40:18 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: [PATCH RESEND] drm/xe/display: Add check for alloc_ordered_workqueue()
Date: Thu, 24 Apr 2025 10:40:15 +0800
Message-Id: <20250424024015.3499778-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCXvEWRpAloXUhmAw--.34232S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr18CFWfCryxtFWxZw18Xwb_yoWDJrgEkr
 17ZrnxWry0k3Wvqw4UZr4furySvr1Yvan7X3yS9asxtry7Wa1ftryvy345Xr4UZFy2yFW7
 u3W8W3WDZws7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNtxhDUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkBk5bmgJo48xgwAAsh
X-Mailman-Approved-At: Fri, 25 Apr 2025 19:08:24 +0000
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

Add check for the return value of alloc_ordered_workqueue()
in xe_display_create() to catch potential exception.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0b0aca7a25af..18062cfb265f 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -104,6 +104,8 @@ int xe_display_create(struct xe_device *xe)
 	spin_lock_init(&xe->display.fb_tracking.lock);
 
 	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
+	if (!xe->display.hotplug.dp_wq)
+		return -ENOMEM;
 
 	return drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
 }
-- 
2.25.1

