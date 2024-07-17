Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B44DC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 14:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5468310E18D;
	Wed, 17 Jul 2024 14:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hR4Af1LQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C534810E18D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721225028; x=1752761028;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D2FSrZRd5/4Pf7DSP23OLrMeBr1GSPyHnyr9JMG5V5Q=;
 b=hR4Af1LQXatY21si6OZ7Ca2bPjb+tILaJuBJXIh0ufZQ+HsIOD/RheCv
 3oIXY0vO56xuT4lF9FSmdv+p9CkvPUPTtEiBpvbp263sfwUy4D0iXH/0s
 5mu35efG9TEuwogRvagZWBoFilaD+jteNyolgjLXvwFYGsCXfLTAKt7rU
 iww2hFqMqa1OvyOjwkVEDuKHAFbC94pZvfsF+FYT/VpmpLDys56ENJYIR
 6ONkSCUz7p+K7cwUpAt4zI8wJFnMugFL2dRGgmb19kyHZPZodykOeHos9
 vaHDfUbEYOd5q19Re2xZNXpe9b5iHCssLJB1TwS5o0/B+hP8fMzhihQFh w==;
X-CSE-ConnectionGUID: sZHZbZAEQtyG7xykyyEN4w==
X-CSE-MsgGUID: 1kbrtsYaRqaJHELj6QzMVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29341274"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29341274"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:03:47 -0700
X-CSE-ConnectionGUID: O42Uz5bGT/eCxV9Evhi/8g==
X-CSE-MsgGUID: GTJ6QEOIQ6eXLTXwx3IrGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55543223"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:03:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Validate user fence during creation
Date: Wed, 17 Jul 2024 07:04:28 -0700
Message-Id: <20240717140429.1396820-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fail invalidate addresses during user fence creation.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 2883d9aca404..f2e5e3c8c0cd 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -53,14 +53,18 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
+	u64 __user *ptr = u64_to_user_ptr(addr);
+
+	if (!access_ok(ptr, sizeof(ptr)))
+		return ERR_PTR(-EFAULT);
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ufence->xe = xe;
 	kref_init(&ufence->refcount);
-	ufence->addr = u64_to_user_ptr(addr);
+	ufence->addr = ptr;
 	ufence->value = value;
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
@@ -183,8 +187,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		} else {
 			sync->ufence = user_fence_create(xe, sync_in.addr,
 							 sync_in.timeline_value);
-			if (XE_IOCTL_DBG(xe, !sync->ufence))
-				return -ENOMEM;
+			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
+				return PTR_ERR(sync->ufence);
 		}
 
 		break;
-- 
2.34.1

