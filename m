Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5579AC001DE
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030F410E551;
	Thu, 20 Jul 2023 04:21:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867BA10E551
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826881; x=1721362881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D5n/yp3SEAhfwNXmwDtnCh7jZDyGzwPH90qB1IPkpQ0=;
 b=UooRyhLCw3talVq0G+hsGKLt1C3SWD7IwljSKvhNl1B7j3ZW/3msE7dk
 JzB8i9uViWKUWG16Hakd3vL385sq71EBVzBPWQ2H//cB7O568xoe0a83T
 wmt86/sbc6FqF9rn6c2gXDvDo/4fQeAGYtkmZp5E2QIhYc4D4gpREBUxn
 T2ZwKS0XHGQ3l+FQb+iweriNWbQFHhofAZ+qaUzHQgVwM+KewDyg4RVGL
 CLi0sO+cZUdZ+lpFDCjxK6KQXY+NX0/uLp6NzXLe83a2q/p5BCvc6J6V+
 mLVzdWGLENUbwpZExqeBeCPv+Iihs8C4oSWzCaHAOHq2V6DSWQ/XIn+31 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366661713"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366661713"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724245049"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="724245049"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:21:12 -0700
Message-Id: <20230720042115.119494-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720042115.119494-1-matthew.brost@intel.com>
References: <20230720042115.119494-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/7] drm/xe: Replace list_del_init with
 list_del for userptr.invalidate_link cleanup
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

This list isn't used again, list_del is the proper call.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 87faf4b723b3..1ed3bc2541f2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1065,7 +1065,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
 
 		spin_lock(&vm->userptr.invalidated_lock);
-		list_del_init(&vma->userptr.invalidate_link);
+		list_del(&vma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
-- 
2.34.1

