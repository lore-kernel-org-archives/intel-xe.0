Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C85C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9C010E552;
	Thu, 20 Jul 2023 04:11:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1C810E551
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826264; x=1721362264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D5n/yp3SEAhfwNXmwDtnCh7jZDyGzwPH90qB1IPkpQ0=;
 b=LBWH+nHMipBSDz7V+XN0ifpOzNkirA/wNntRukCC+LxBbYkfBkDePh8o
 KWVmkd1IgWAXXDmnWotYqc8m22CNbTWQEeceWyCw0/I9g502U8T+EUjwj
 OHN2sCjq4AVp2snQaGyPabPiX1mDH+FH/Fw3dX2BcarCtzvC37VQe9UDL
 ACCZm5ar2EzMhnvgDPr84LbGj1rEr/Gd9z3SEnFua0tpN+CSwoGHc5xT2
 AjMfFKi4J3t4IGeyqUvjKriyKPKYApiUQ1JubBWPdAidY1MSK1vj+JHCW
 fNKgC0pxiSlY9+w0ro8eXEaYvnUARYXtWuVEZiGvjZVXdUenvgxYcssgd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397500416"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="397500416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="753924801"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="753924801"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:11:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:10:54 -0700
Message-Id: <20230720041057.112903-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720041057.112903-1-matthew.brost@intel.com>
References: <20230720041057.112903-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/6] drm/xe: Replace list_del_init with
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

