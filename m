Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E859CA5FAC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 20:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C895110F0C1;
	Tue, 29 Sep 2026 20:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3qgBFTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB8E10F0C1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 20:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790715373; x=1822251373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2eGBM5VJ6NZMVhOZTk7gSLwAsbomAWsJ2/TsxPE/mtM=;
 b=m3qgBFThWgmt2lsVfVQ5G78ZOWA3Y1ylGEYFOA+LgxLChfarSCvxaDAJ
 NPkfyRfhv1y/HP3IB6xH0DCUn+gQksbP5syksMfJwnImRVz4mB7jye2l1
 zt/MzdoI+KUHuEfMqIZ+ylW3vcId3DrM5dqMTLPJkdTUmvxsbgP7in/Eu
 SyEo6l+b66ppcUn70RNgMjUHr+FLsSBKxY3tfo1XNGlcYKS4v6UDqZ8ID
 trDBL9Ef0BkcssPsk+biGqvwmdUzNE6aAlx7fxK3NL48XSg9hpO7ZjMDl
 xO+x3v0neMnvCwMX4Hhes62/Y0wbeEaXYUbSv+Mg7khP0pdE3Vuo7r1SZ Q==;
X-CSE-ConnectionGUID: siNGBPrtRtOTPpGdcnUx1g==
X-CSE-MsgGUID: S9yaBu12Q6eDQ32CSq3kzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90307662"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90307662"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 13:56:12 -0700
X-CSE-ConnectionGUID: lzXxDpfQSeavxx1MdLwTPA==
X-CSE-MsgGUID: z5L86JEPRwmbZUv1oAGptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275517690"
Received: from rabbit.fm.intel.com ([10.36.54.170])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 13:56:12 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, shuicheng.lin@intel.com, dev@lankhorst.se
Subject: [PATCH] drm/xe/vm: Do not dma_fence_put zero fences in err_out path
Date: Wed, 30 Sep 2026 04:56:06 +0800
Message-ID: <20260929205606.1076177-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

It is not necessary to iterate over and dma_fence_put current_fence
fences in the err_out path of ops_execute because current_fences cannot
be non-zero when jumping to that section of code.

Caught by static analysis.

Fixes: f5708e761ed6 ("drm/xe: Add CPU bind layer")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 425c678f4480..f159970bd34e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3575,8 +3575,6 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 
 err_out:
 	xe_pt_update_ops_abort(xe, vops);
-	while (current_fence)
-		dma_fence_put(fences[--current_fence]);
 	kfree(fences);
 	kfree(cf);
 
-- 
2.43.0

