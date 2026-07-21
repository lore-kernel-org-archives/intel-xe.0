Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B944FC44537
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 14:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639FE10EA48;
	Tue, 21 Jul 2026 14:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Zg2YUpHy";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757EF10EA43;
 Tue, 21 Jul 2026 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784643919;
 bh=ZTyLbVEEnaqjwXrGfTztWzKjLkw8D8mPZxbsn3nK1yQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zg2YUpHyoKNTqLQo8g0VLWnRUhPnxN0sWmRG15DS7RjZu8seiqTsgAtQIl1Jd5sXh
 3avJIsPcv2IhDXFjX4aphkngIRlaZwpIHY8+USmCfjF8XN4XzoMlHKjI3qTUhX4/vP
 8LWJElgOXAGqxyULpSq5wDG5sAiN8SLYam+XsE/VF/nDGPm3UHVSFaZGWICMc0qZjn
 hJZ3Rv6oOoNCXoDrUHafEHuHfWF90uh1D57KVkvsyzYiR2JPLvpp2GZSLr1wha/aro
 J9IcGI//lkve83AacPw3CpjagGPXKY5Gk/4FgJjYHlqItfF/Xds4MeVUbfvqmw+0cG
 +UGfFl41w7cpA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 4/5] HACK: Always fallback
Date: Tue, 21 Jul 2026 16:26:15 +0200
Message-ID: <20260721142610.93804-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721142610.93804-7-dev@lankhorst.se>
References: <20260721142610.93804-7-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_display_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
index 9385026a80b97..d78d893210c4f 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.c
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
@@ -142,6 +142,8 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
 	if (XE_DEVICE_WA(xe, 22019338487_display))
 		return false;
 
+	return false;
+
 	/*
 	 * If the FB is too big, just don't use it since fbdev is not very
 	 * important and we should probably use that space with FBC or other
-- 
2.53.0

