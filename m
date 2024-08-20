Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1288BC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42F610E529;
	Tue, 20 Aug 2024 08:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSR6I3MY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DC610E529
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724143505; x=1755679505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F27WikbOA6EKrT4Cel/XM3IwYd5uytDCGnneWj/AJ+A=;
 b=XSR6I3MYUCfy20w4Imy3w7PYV3sknxkIGYHKeERKgCtEPUViwD/6GLjk
 5Iy9BufXk2B33+l5hjmd5txMbq3v0z36AhERVDS1vKEK8ed2UGt7qyD6b
 vB1eB/P9rg6B1+STEq6b9qkIarcQ5dPuBFc5Ezj1rl1ItmucJ/kAdeXJ6
 AIjucmeSzCLIm2+hcIO/STFpuOX+/ZMxnHBPwowtwgW7sTThcIlpQ1qLn
 EGS/v3GPtiGnHp1c11l1s8nHtec1lNJA7pZEKILpgxHir5hAoFxDVY8QE
 wJnub4SlG7kRMNCRMesA31pfvZbG8cVAzvS6+SXqvCWYqZKXZtToOkg8N w==;
X-CSE-ConnectionGUID: /yRo/Zw0S4GlvNbx/mAUgA==
X-CSE-MsgGUID: 75xp/793SEemTFM20Mx7Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22606793"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22606793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:45:05 -0700
X-CSE-ConnectionGUID: fDzCmKr7RXiRTG0xnBBQCw==
X-CSE-MsgGUID: IPX2YDRvSvSKJ9CGLncOsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60701212"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2024 01:45:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 3/3] drm/xe: Remove unrequired NULL check in
 xe_sched_job_free_fences
Date: Tue, 20 Aug 2024 14:32:30 +0530
Message-Id: <20240820090230.3258128-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
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

dma_fence_chain_free() can handle NULL input, there is no need for NULL
check by caller.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 44d534e362cd..4ed0c366ccff 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -89,8 +89,7 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
 
 		if (ptrs->lrc_fence)
 			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
-		if (ptrs->chain_fence)
-			dma_fence_chain_free(ptrs->chain_fence);
+		dma_fence_chain_free(ptrs->chain_fence);
 	}
 }
 
-- 
2.34.1

