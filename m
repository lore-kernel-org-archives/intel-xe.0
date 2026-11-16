Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E9B606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=FkvZ5JV5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B15910F158;
	Mon, 16 Nov 2026 13:12:47 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1857C10F146;
 Mon, 16 Nov 2026 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794834760;
 bh=YaMTH2wykcP3miWOyfepOmpgVoSReR/hI6xxmSLHdPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FkvZ5JV5SuxJzGjPwlFO0mCZlBbolsVncUtwExU7i1ZHIUk6qGlNOaoJK9P+qIe7P
 JHsoPOIl7cbarqlxZH7F7kvL+JubU9Pd6XZuWZZz0IS0nCu7yC1vUqiXdnnM0loGRy
 22bNVODPnhsPqN093FTAGK4czdhBdQ7AShKtslSZQcPNndkEjctR4HvAeoPhbfHAzr
 RmO5Hs1AtSIr370qkP5YlV0Hhnf0c+fMJU7gqRFFDLr0uKD5Sq4n0igrz6S+NiJEDD
 oltXbzudJ/8YB70zDft7IqgK4YNpc3c1b1Nf3yrShcapo+eJBJbV9mBm45vhNTJ+0N
 rQypMPHfeQsDQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Auld <matthew.auld@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v5 1/5] drm/xe/display: Avoid using stolen memory for
 framebuffer when media gt exists.
Date: Mon, 16 Nov 2026 14:13:51 +0100
Message-ID: <20261116131349.333818-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116131349.333818-7-dev@lankhorst.se>
References: <20261116131349.333818-7-dev@lankhorst.se>
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

On systems with media GT, extra latency is added when accessing stolen
memory when the GT is in MC6.

Simply disable allocating stolen memory for framebuffers when media gt
is found.

Thanks to the previous patch, it will be possible to preserve the
contents.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7513
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Link: https://patch.msgid.link/20260630135523.1775379-3-dev@lankhorst.se
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
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
2.55.0

