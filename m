Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790CAC44524
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4062810E9EF;
	Mon, 20 Jul 2026 16:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="AkyDWN3J";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3D910E9DE;
 Mon, 20 Jul 2026 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564044;
 bh=W12gryfcOowjVkSWMj764Er4vunTyhHO+B8fbOPxjLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AkyDWN3JfN1pjA86zli5pRUfqRfqZhQmosS8EDo+seHHlD774I6/8SMwNuFJWAuAg
 xkJBDFbVRgKPvVDRihEerWttNE04Wap3Q0u2izsAzHfiNxw7WzQlQrmKJvP4pGT2x2
 M852ApyK+RlY8hCdtQgsHeYHFAXf61jGbMPlpz9ZxC6fFnbqlTM16WX3zGUKiOvwy2
 FLq/IptJ1z0PXpBr9pn4KxwsipKtP9vzvszvQNJFoX3mum4DAZeE0SrVEwXzACC95s
 XIjC1AuEC96/UCDNg6h52nRqNUYiHh33Gi6qHvs2sh8wu2wXkae8CiN6+adNS7Am+R
 pxf6ClVEt5v5g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 07/11] drm/xe/display: Avoid using stolen memory for
 framebuffer when media gt exists.
Date: Mon, 20 Jul 2026 18:14:59 +0200
Message-ID: <20260720161451.384968-20-dev@lankhorst.se>
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

On systems with media GT, extra latency is added when accessing stolen
memory when the GT is in MC6.

Simply disable allocating stolen memory for framebuffers when media gt
is found.

Thanks to the previous patch, it will be possible to preserve the
contents.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7513
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Link: https://patch.msgid.link/20260630135523.1775379-3-dev@lankhorst.se
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_display_bo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
index f5102cd0e95d6..9385026a80b97 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.c
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
@@ -131,6 +131,14 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
 	if (IS_DGFX(xe))
 		return false;
 
+	/*
+	 * Avoid stolen memory when the media_gt exists,
+	 * because a lot of latency is added when media gt is in MC6
+	 */
+	if (xe_device_get_root_tile(xe)->media_gt)
+		return false;
+
+	/* machine hang when doing lots of LMEMBAR accesses */
 	if (XE_DEVICE_WA(xe, 22019338487_display))
 		return false;
 
-- 
2.53.0

