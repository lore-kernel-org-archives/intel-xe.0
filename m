Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79737C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 14:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAE310E427;
	Wed, 17 May 2023 14:20:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC4C10E428
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684333215; x=1715869215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=agNBKRNCrhEgiT8poV5KEybADopxgfF5JNNXF39GEGM=;
 b=DqFVt/ERFBNuTCA5eMHBHLAh4Vm62XLXyl1MUhZboPt0hSQpGMykyvIL
 HyH5iSQ6GScKk5kThnBD0TSIkLxmYgDx8rXa9qXWLfgPDMObh+EtJqZ3Y
 Rxyicys0IZA3JXCH/GQ9T2g3/JK6OturoHZd1/4x8e15u1H7Un1fh9P1l
 A3zUAePRQDAdOdHnEs46ZRunwh1m5Kgb6lkJG8BgRumjvPOLX7VhmH2Ek
 G0f1OJiLjxI5nrNSv7yk5JNGHihA6F7IGw7ojOzGTkAmy8cULBDJl5VFh
 MALAoUWKwCHkrQC1Xc5DbhpJQybtRySwInQIfYMTF5bNt/LGHmUW/kDLM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="354942989"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="354942989"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="701772293"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="701772293"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:20:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 17 May 2023 07:20:20 -0700
Message-Id: <20230517142020.3717595-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517142020.3717595-1-matthew.brost@intel.com>
References: <20230517142020.3717595-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Allow dma-fences as in-syncs for
 compute / faulting VM
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is allowed and encouraged by the dma-fencing rules. This along with
allowing compute VMs to export dma-fences on binds will result in a
simpler compute UMD.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

