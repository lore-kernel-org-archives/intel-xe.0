Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A23EEEAA77
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 20:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFD010E582;
	Thu, 14 Sep 2023 20:40:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5D310E15D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694724041; x=1726260041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gC4hhyPTJ+DYN4h1AexakS6COwqqjdR/TZTOCtMdWiw=;
 b=LyU4lQ3miEqFf6Z9OyhyJHvlJPrOhDCHDoj22UCHBxShrxkNh8zICbjF
 kPttgtEO24Y5jFfGYz221oJkqyjxXxHXjtBuXZFetB5HE3iGbg65bHV/u
 cOBMQPR+WxPKYDCRSxf3V7HUYqLM3TMAx14tKYrS49+4NuWD/MCj9+LNn
 ii7BDV19sXLAvJ6vF9NSNvrgn1xwoVlLZ1tVnrPtTP3z0NFhfCSVS5c2E
 2llNQq5v8GRSu5gs6GNySfKldEvHTokM8RtcMaOPYse0oVyByng61zjyJ
 kV7WkNkcOMDRNhCGUTAquV7CLrapL8EuQWTge6ELWAVwvqV9iNo+BgM51 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369369366"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="369369366"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="694453584"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="694453584"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:40:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 14 Sep 2023 13:40:52 -0700
Message-Id: <20230914204053.2220281-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914204053.2220281-1-matthew.brost@intel.com>
References: <20230914204053.2220281-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: Allow num_binds == 0 in VM bind IOCTL
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

The idea being out-syncs can signal indicating all previous operations
on the bind queue are complete. An example use case of this would be
support for implementing vkQueueWaitForIdle easily.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 49c745d53b41..0e2f3ab453ea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2678,7 +2678,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int i;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, !args->num_binds) ||
 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
 
@@ -2805,7 +2804,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto put_exec_queue;
 		}
 
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
 			err = -EINVAL;
 			goto put_exec_queue;
@@ -2819,7 +2818,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (!args->exec_queue_id) {
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
 			err = -EINVAL;
 			goto put_vm;
@@ -2856,16 +2855,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
-	if (!bos) {
-		err = -ENOMEM;
-		goto release_vm_lock;
-	}
+	if (args->num_binds) {
+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
+		if (!bos) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 
-	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
-	if (!ops) {
-		err = -ENOMEM;
-		goto release_vm_lock;
+		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
+		if (!ops) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -2920,6 +2921,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
+	if (!args->num_binds) {
+		err = -ENODATA;
+		goto free_syncs;
+	}
+
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
-- 
2.34.1

