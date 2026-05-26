Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE4DCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FCB10E695;
	Tue, 26 May 2026 14:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="gbzIh33S";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863C210E695
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779805021;
 bh=UMDGu5lgwW+qayH8mmkgXlEkmoFrbgMH6DTWeUMK3kk=;
 h=From:To:Cc:Subject:Date:From;
 b=gbzIh33SJ0pUx3TCvHt8MoRGAinuQBxGP2z0oW13nAheXcZOFoU8R/q4PlQ6xMtng
 uXPc1jcjC1h3FCyGV0ffNgCvzWcyvQzQCqgd4lDHqIro/dfjq6BgQRvfm4xYtX45HQ
 EdorIvHAcDYRSwm/SehAn6PaNZsUiutrY3P2VbCll2qtouzLucrx7m26mbsICdDLHR
 Ok27ZoHQd5Hnkz/cLyQJSGKmru0K1mIDFI/ARtCiBXKp/eTDOG+vBpKaIcXmTsBib/
 y5X0dufALhP+ezGjFlL4lMsRAExwSMhxPCzZpPsaF9O20KJ2245V4OSz0nNuHAFKbO
 BBaXH8cwUdcYw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe: Do not allow setting the same exec queue property
 twice
Date: Tue, 26 May 2026 16:16:58 +0200
Message-ID: <20260526141659.13838-1-dev@lankhorst.se>
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

It's possible to leak memory by setting the replay_state property
twice. I'm also uncertain what happens when setting
the multi group property multiple times, either with different
exec groups or once with an exec group and once with multi group
create.

Nothing good can happen by allowing this, so just stop it.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a4..29296eb0de452 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1109,6 +1109,10 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	if (!exec_queue_set_property_funcs[idx])
 		return -EINVAL;
 
+	/* do not allow setting same property twice */
+	if (XE_IOCTL_DBG(xe, *properties & BIT_ULL(idx)))
+		return -EINVAL;
+
 	*properties |= BIT_ULL(idx);
 	err = exec_queue_user_ext_check(q, *properties);
 	if (XE_IOCTL_DBG(xe, err))
-- 
2.53.0

