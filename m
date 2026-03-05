Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDB0F30947
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 11:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C931310E278;
	Thu,  5 Mar 2026 11:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GmHCyAPL";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9010E278;
 Thu,  5 Mar 2026 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772710675;
 bh=s2ekpwW+kcg1DfUIh/2SilhqwnHNZ02RMSpuVs+sGA0=;
 h=From:To:Cc:Subject:Date:From;
 b=GmHCyAPLkwCj4mesXklpEYEN+Hj2GliVyeroNk7em1qFcrUrdFS3pYNU08qq5yNGs
 47UZL1bVrFE5yLs9C2r+NOL5k03Gm/IPnJMFG+TikubBfiN8c4oGl3DcOkckud/JRV
 cMSuJbY5DRcqqXhpECkhNiax7YQstQ2vXP+XPjgBOeIKael0J6Jc3Y3pp3RmHoF9Wb
 JNSMlVy5sDhdRE/f2LmCh8B0Ul0wMrsb6lxzYi+yjjewHhjHX4lVgHb2QmPSI5aeLA
 Vwtiob5Oi2mQB2t9n1HPan6+CXqbHPUvo2O6ZcUFOqDsBILAFbCMGKm95Jd21FdIYp
 DLUSpb+b13CYQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Rob Clark <robdclark@chromium.org>, Julian Orth <ju.orth@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
Date: Thu,  5 Mar 2026 12:37:34 +0100
Message-ID: <20260305113734.1309238-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.

The problem occurs when userspace is compiled against new headers
with new members, but don't correctly initialise those new members.

This is not a kernel problem, and should be fixed in userspace by
correctly zero'ing all members.

Cc: Rob Clark <robdclark@chromium.org>
Cc: Julian Orth <ju.orth@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_syncobj.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 49eccb43ce63d..250734dee928e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 		return drm_syncobj_export_sync_file(file_private, args->handle,
 						    point, &args->fd);
 
-	if (point)
+	if (args->point)
 		return -EINVAL;
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
@@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 							  args->handle,
 							  point);
 
-	if (point)
+	if (args->point)
 		return -EINVAL;
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
-- 
2.51.0

