Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9549C5321D
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EB210E4E8;
	Tue, 20 Aug 2024 08:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TefA5X9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD8310E4E8
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141387; x=1755677387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4eMJTWnIZvnmL97i1KaEQ0YSxpKhqC8ZDdHrW1eXINU=;
 b=TefA5X9IvCbJQin4obZVST/uNJtBzW1854yZPqrEfNWvqHOh0lNuRwPV
 3OCm6FnvTneQ0tlwzUo5jfZtH7V8Kj7hOaeFJHX2sDmCvHRyiHJvUcQuc
 KgjDxHtcifb6ftv4T+A0oA7uHz3xS7FkoiAIhb1IJDwAfk9Qy97GMzj7l
 cSBc3Y9E5nS3m+6T8ncFvnDiiygLRR/NDejHnMysAu7bfBkhivj+eGw5D
 Qoo8oCLxAazDpw8rGRpO1/uRCw2xuYo4si1usg1CzLwOejxhg088/dxMh
 PndkqyiHDU0nDPz/TBTDubMY+o/78EnU5p8otkjEV4UTaXLfsaVai1Ypt w==;
X-CSE-ConnectionGUID: lH+L9TMhSFaz0VgtcHzB1w==
X-CSE-MsgGUID: SA4osb3RQFmudbKeHrhyZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26291067"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="26291067"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:09:32 -0700
X-CSE-ConnectionGUID: Zw4dtttPRGqqsgu5DYO1xg==
X-CSE-MsgGUID: SAZhbo4pRwSdqyiTeYMJHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60350165"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 01:09:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/2] drm/xe: Remove unrequired NULL checks in
 xe_sync_entry_cleanup
Date: Tue, 20 Aug 2024 13:57:13 +0530
Message-Id: <20240820082713.3257455-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820082713.3257455-1-himal.prasad.ghimiray@intel.com>
References: <20240820082713.3257455-1-himal.prasad.ghimiray@intel.com>
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

dma_fence_put() and dma_fence_chain_free() can handle NULL input,
there is no need for NULL check by caller.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index a0675f57a398..436faff09bac 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -249,10 +249,8 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 {
 	if (sync->syncobj)
 		drm_syncobj_put(sync->syncobj);
-	if (sync->fence)
-		dma_fence_put(sync->fence);
-	if (sync->chain_fence)
-		dma_fence_chain_free(sync->chain_fence);
+	dma_fence_put(sync->fence);
+	dma_fence_chain_free(sync->chain_fence);
 	if (sync->ufence)
 		user_fence_put(sync->ufence);
 }
-- 
2.34.1

