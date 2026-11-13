Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51613606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=R5jf4Kfj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163AC112425;
	Fri, 13 Nov 2026 12:44:00 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C18112387;
 Fri, 13 Nov 2026 12:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794573828;
 bh=Y2Q7J7r26GdZ8w8odEi97wVNI17w7xFkRfXmRboNsIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R5jf4KfjPxXepz0fSBJwjy0a/0wVyAhUwoOoQB0Nb9MDmhJ74P60Zs9G1OgK1U18x
 QrMwq/2WODLATy7jn0W0895GIV3OcjNCkkU3puiQWfTcfFk99dON9Ds7cfBYzJq+93
 zEZwcuW4N3f/as9g36PVY09aABC3fe0y+XapoZxj1ny//dFWD8DSHoX7xw7exk+vKC
 oU9JvLPVTicmQaLIVTlW0wHjWG7WHpf6sQ9EmGeAVl+Tf5IQb4cyXmp3xRJ02il79T
 iYGLNWZaNBDb6BLvBBQo+73EXlxqGiJU7T7WAH3HHZ4NueDX2NNKcA3CowWSIC/rHx
 aCoYC1sCcLuAg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 4/5] HACK: Always fallback
Date: Fri, 13 Nov 2026 13:44:58 +0100
Message-ID: <20261113124453.144408-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113124453.144408-7-dev@lankhorst.se>
References: <20261113124453.144408-7-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.55.0

