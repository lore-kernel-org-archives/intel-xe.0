Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F265CD1299
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69810FF70;
	Tue,  9 Apr 2024 20:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJ/2nRxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3110FF70
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693094; x=1744229094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2JBBFSdQ2qf8eXAqPly5LAO1+633Aclr2gZrhk50aFs=;
 b=DJ/2nRxFfDY4iQT1eushENHJzWSIBeWZsNCKlLc0RnBnxpP4vSEiLZ+9
 gV7AO7ug3yZlMlfQsWsL/IoNrJOFTIM0gRcf9YRyqgFtjj1RC3XiJYQdX
 BSj2XSV5Vkf70I6u6KgpbBRfBUqBpGRTnHoiwaFgpEPsi0pZL9eqyg3Nl
 iYsnEqs7vY3d+leUKyS8KQ4AnHLBs3OG0rH7qP8yPtFw/yzF69NOLWHNm
 3mfTHSdiir05XJxmHGnerS5YR8rWGNaeoTwOP8duYp+g279KmQsymd1cX
 BUeW6koN41ntNGhkygk9B2Y5Bw9Xxsr4ISB0G5yECjHqgdBtFF80pf6Jf w==;
X-CSE-ConnectionGUID: fTwbFPW6QD6pqDKNmb4jwg==
X-CSE-MsgGUID: Z731imVvQPeQmOeBEidufw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803749"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803749"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: 6eoNBYlaSUWtHXup0n+XhA==
X-CSE-MsgGUID: PBfxs2FIR3err5JrGEfAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773723"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 04/31] drm/xe: Drop unused arguments from vm_bind_ioctl_ops_parse
Date: Tue,  9 Apr 2024 16:17:15 -0400
Message-Id: <20240409201742.3042626-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Drop exec queue and last arguments from vm_bind_ioctl_ops_parse as these
are unused.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e1c1c18825ff..c0c6bb163a9e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2142,10 +2142,9 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
-static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
-				   struct drm_gpuva_ops *ops,
+static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct xe_vma_ops *vops, bool last)
+				   struct xe_vma_ops *vops)
 {
 	struct xe_device *xe = vm->xe;
 	struct drm_gpuva_op *__op;
@@ -3037,8 +3036,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto unwind_ops;
 		}
 
-		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
-					      &vops, i == args->num_binds - 1);
+		err = vm_bind_ioctl_ops_parse(vm, ops[i], syncs, num_syncs,
+					      &vops);
 		if (err)
 			goto unwind_ops;
 
-- 
2.26.3

