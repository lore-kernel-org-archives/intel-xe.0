Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41F1C7EE3A
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38AE10E493;
	Tue,  2 May 2023 00:17:33 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EF110E40E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986651; x=1714522651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GGM81wkRvSMeljT95Eun8/CRn8HdGVx85rYCSvjP5ZM=;
 b=nQMGHwsWaHKzbx9j3ZJHUdSIaOITRzvO7Kq5cu6y+zU1vrQ9XM4bKiv7
 uqZ09EwoTwMVb3RXPFJtWUTFn8EZPJjSXgWcGusWMgfQDUjM+moaZ7cPD
 nCW8UTIb1nuxlcBTXRgylA/1sYz/f5fZ2EaX9w6KaLLBbEiiCRaTfEkL4
 2fkcbblj3B9BTE9o3wwxJldsSSPnM5WZ2mHdGSzUFdrIkfcDyywl1gj6a
 uE0LtPov9tiMyul0ROKvM1t7m/Z7FyHvmehQ+jHIqAkP1XLwyCiCSeOIk
 o7z6Ow3LL0hG8+5Tkd+6tIDzgY4VznJxONYZl/Q9h6plEAYDtu5QQk1at g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619599"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619599"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541746"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541746"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:24 -0700
Message-Id: <20230502001727.3211096-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 28/31] drm/xe: Allow dma-fences as in-syncs
 for compute / faulting VM
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

This is allowed per the dma-fencing rules.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 99f1ed87196d..1e4e4acb2c4a 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -105,6 +105,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 {
 	struct drm_xe_sync sync_in;
 	int err;
+	bool signal;
 
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
 		return -EFAULT;
@@ -113,9 +114,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
 		return -EINVAL;
 
+	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_SYNCOBJ:
-		if (XE_IOCTL_ERR(xe, no_dma_fences))
+		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
 			return -ENOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
@@ -125,7 +127,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		if (XE_IOCTL_ERR(xe, !sync->syncobj))
 			return -ENOENT;
 
-		if (!(sync_in.flags & DRM_XE_SYNC_SIGNAL)) {
+		if (!signal) {
 			sync->fence = drm_syncobj_fence_get(sync->syncobj);
 			if (XE_IOCTL_ERR(xe, !sync->fence))
 				return -EINVAL;
@@ -133,7 +135,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
-		if (XE_IOCTL_ERR(xe, no_dma_fences))
+		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
 			return -ENOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
@@ -146,7 +148,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		if (XE_IOCTL_ERR(xe, !sync->syncobj))
 			return -ENOENT;
 
-		if (sync_in.flags & DRM_XE_SYNC_SIGNAL) {
+		if (signal) {
 			sync->chain_fence = dma_fence_chain_alloc();
 			if (!sync->chain_fence)
 				return -ENOMEM;
@@ -168,7 +170,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_USER_FENCE:
-		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
+		if (XE_IOCTL_ERR(xe, !signal))
 			return -ENOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
-- 
2.34.1

