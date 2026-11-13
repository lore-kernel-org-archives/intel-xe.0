Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A594D606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=Y328bCNU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEBD112423;
	Fri, 13 Nov 2026 12:43:55 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463001123B3;
 Fri, 13 Nov 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794573826;
 bh=YaMTH2wykcP3miWOyfepOmpgVoSReR/hI6xxmSLHdPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y328bCNUHcwlesY8Pgf0talsLSeyage4YtwXsMFr6cuXbB6h0C61VCXNe7Kdhi4E2
 kq/LfCPuU21SXbV8/wCqTs2HEVHVaVI3MdCoUeiy9Tb/g4SfXkLW84ck1yocbxC5hs
 4+2nXxYRNhaXgUyuWcTtxaI2tYpz2YeheH/i4l8iIQ2dpcpASAVaXcduxY+cngkHYv
 MdfguB0sHrx7uhBaq//yqnjatUkkkI1PtlEYY0Db9a9gMolW359MWRR9yQcZS8xygV
 vXZGsz4kI5bQMWkzR+k3XXm3vc4cPC0TdDV2hClp29mysR/IkhbU8hQSa4AOVlV+zc
 iEa2yLW53/8XA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Auld <matthew.auld@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v5 1/5] drm/xe/display: Avoid using stolen memory for
 framebuffer when media gt exists.
Date: Fri, 13 Nov 2026 13:44:55 +0100
Message-ID: <20261113124453.144408-8-dev@lankhorst.se>
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

