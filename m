Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43824606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=Lwnz9889
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DE010F19F;
	Thu,  5 Nov 2026 16:13:58 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F24810ED82
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1793895230;
 bh=Y2Q7J7r26GdZ8w8odEi97wVNI17w7xFkRfXmRboNsIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lwnz9889BNXjYdC3z1Gw3pnP409lLOPCXs/86kXKjHHrZrpG7CyWQZRc35mym4W23
 g+VUXBFpoRU2MKDOhI2XvCvd/waC8CexyBsHtCqAieCZiHfKdfKqpupH+M3ossZqbn
 mfOqSHrYgXMJbooUqBSGkQu4Z36vz88zn4WILELOIHHGXE+XRpvtnRtNSFINOuspUE
 mtvH2qmzdnm7i/Jm8vwc6jw9j16mKVZKiW3ScjnolZ1dkPpbBcgA8isc0SsbZYIvmD
 jwSpB6Tjgtosq24/bN0mMbQjt40NhRhwap0jGIJSx0HYFjPK+j7AbaKuMZLl54aKBs
 fsCr1PaOl+ZHw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 4/5] HACK: Always fallback
Date: Thu,  5 Nov 2026 17:14:49 +0100
Message-ID: <20261105161444.593259-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105161444.593259-7-dev@lankhorst.se>
References: <20261105161444.593259-7-dev@lankhorst.se>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

