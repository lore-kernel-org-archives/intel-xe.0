Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA48112583A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366610E3E7;
	Wed, 11 Mar 2026 14:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="DGG6pT8R";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E6F10E2DA;
 Wed, 11 Mar 2026 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1773240329;
 bh=0420rz0ZNP1czwdzLAHDhi2yhQn9Ah3qz+Nn5YwRuUw=;
 h=From:To:Cc:Subject:Date:From;
 b=DGG6pT8RTZBSg0S4bF68W9q0LtQ6kT/8AHcE3PxX+FuxT8G3fSl6SjUEXezFkyzuE
 KfTw43rxFQfUiI+r3AEdXToHTPelmknTzQd2l5zOTwLenoBkr8M+R1AyAOWljulbdF
 oF2M1jH+EaYDlF3oAqqysiEM6LYATAcArfS2qexzSxLLMSMKbqadUQZFOrjUCZ7yk9
 BPVmeIK4UlJ7djf1z/PlhpPNj3HWsc4atCpamzKYpRMO++zvLzNb1XYQLj8HREG+US
 sKHRWzpXQjNvc4PUMvySU+lQtAzsRtBCLjm6yZi0NiiVcWiYIKDWy/js+viTOzdI9i
 P6zAGx3SHznnQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Rob Clark <robdclark@chromium.org>, Julian Orth <ju.orth@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: [PATCH] drm/syncobj: Enforce strict checking of timeline syncobj
 struct
Date: Wed, 11 Mar 2026 15:45:25 +0100
Message-ID: <20260311144524.3046352-2-dev@lankhorst.se>
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

We add a new flag DRM_SYNCOBJ_*_FLAGS_TIMELINE and a point argument,
but we never check if the point is only set when the timeline flag
is set, and we still allow the timeline flag to be set when sync
files are not used.

This was discovered when userspace increased the size of the ioctl
to include args->point, but never cleared args->point, so fd_to_handle
and handle_to_fd ioctl's without timeline started failing.

Add more strict checking to prevent userspace from creating
new bugs!

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Julian Orth <ju.orth@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 250734dee928e..33f2fc987e1d1 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -857,7 +857,6 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	struct drm_syncobj_handle *args = data;
 	unsigned int valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
 				   DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
-	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -868,14 +867,14 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
-	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
-		point = args->point;
+	if (!(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE) && args->point)
+		return -EINVAL;
 
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
-						    point, &args->fd);
+						    args->point, &args->fd);
 
-	if (args->point)
+	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
 		return -EINVAL;
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
@@ -889,7 +888,6 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	struct drm_syncobj_handle *args = data;
 	unsigned int valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
 				   DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
-	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,16 +898,16 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
-	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
-		point = args->point;
+	if (!(args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE) && args->point)
+		return -EINVAL;
 
 	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 		return drm_syncobj_import_sync_file_fence(file_private,
 							  args->fd,
 							  args->handle,
-							  point);
+							  args->point);
 
-	if (args->point)
+	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
 		return -EINVAL;
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
-- 
2.51.0

