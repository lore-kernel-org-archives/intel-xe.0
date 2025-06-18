Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F71BC71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 04:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A2A10E186;
	Wed, 18 Jun 2025 04:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEGvqROn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F7510E186
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 04:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750220669; x=1781756669;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EbwDyjojY+CfEmUubd6JLvpw7ZoN9axby4/nHfXzZXM=;
 b=mEGvqROnSiUpzdqUUt18Ts9vBoSlv4tVFOp+8OHUZ6u1XF2C2XvFn1+5
 mSmlL/QhLyrbGX/8P7g1GxcWIsayDd5ma9MSvkeF56DhNNRLlBSinGMiC
 UKVC7v4SnaZP3TfWs0kQOBPTCw33JQ60IONl9FS0vBNVJaYTIwLkPYhdI
 0H+4kgnPT2LQ1MSy7VyPU3i13iu98h1yW9KzoABoJwgpxNbcAc8+qdXgm
 oYZexq2WUGrZtcOWKjp3sRBekviqLa56mYMLQt8ERcUm5B1XYNtNQDOOv
 sWD04EmMzSyTkruywrX2+aS+3ZubYu3TijVJ76dJ6qKUAi1KlbZF23OzU w==;
X-CSE-ConnectionGUID: gZtOYPZJTl2yXl1kK1OK/g==
X-CSE-MsgGUID: KcXNiTuDRXe4WyjALQsu4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52290789"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="52290789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 21:24:29 -0700
X-CSE-ConnectionGUID: ixRJ2AzcQgCJp7A1UwgRqw==
X-CSE-MsgGUID: U9X1AlO3RwOw198HKlJUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149523887"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 21:24:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Onlu use worker to destroy userptr VMAs
Date: Tue, 17 Jun 2025 21:26:04 -0700
Message-Id: <20250618042604.2225032-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Not a proper patch but let's see if this works.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 04d1a43b81e3..9492b6dccd94 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1341,7 +1341,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	}
 
 	xe_vm_assert_held(vm);
-	if (fence) {
+	if (fence && xe_vma_is_userptr(vma)) {
 		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
 						 vma_destroy_cb);
 
-- 
2.34.1

