Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3B2EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 19:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD27410E074;
	Tue, 18 Jul 2023 19:31:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13D210E074
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689708690; x=1721244690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oFXdMSYSH2mYgLnWD6GQj4Fbc26FTpB8MDvv0LZHrdw=;
 b=D3csxeDVZ5KB+MbTXMlY93jSg3u5jlTTrouxJEQDsyMJEGNcu9evsIDi
 wQQJ3DarTG3g/Zn5gfvYLCt6RlY83NO1iSo67QsqEW9iCvHd8lCKSDyaU
 kdznKoKMVT0Cpz69yPJTd/xdA9+Gn0gpcfSf9Gc4M3rZH/WUYbOBMqHGu
 DLC5IUtssOvlzjjoOycCep5KyUUgARnhT6vDeGw2nJtier3vyWdNGoh4z
 DSycg83B2GMQsRxu0rVqSm9Gcd5iERkARAFcnpvZ45VJ749+C+/6fufND
 GcmQ0LAZBcj2aEbP6VdL0mXs8yaagrA4SqA8MxRqcE+5NXaPNFb1qEvri g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369852641"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="369852641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 12:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="758907092"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="758907092"
Received: from wintersr-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.222.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 12:31:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 19:31:18 +0000
Message-Id: <20230718193118.8-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Cleanup style warnings
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
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Bring the comments to their usual places to make code more
readable. (Lucas De Marchi)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 91f11dfe9460..b3daa9712ba0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2166,20 +2166,16 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 	case XE_VM_BIND_OP_PREFETCH:
 		vma = xe_vm_find_overlapping_vma(vm, addr, range);
 		if (XE_IOCTL_DBG(xe, !vma))
-			return -ENODATA;	/*
-						 * Not an actual error, IOCTL
-						 * cleans up returns and 0
-						 */
+			/* Not an actual error, IOCTL cleans up returns and 0 */
+			return -ENODATA;
 		if (XE_IOCTL_DBG(xe, (xe_vma_start(vma) != addr ||
 				      xe_vma_end(vma) != addr + range) && !async))
 			return -EINVAL;
 		break;
 	case XE_VM_BIND_OP_UNMAP_ALL:
 		if (XE_IOCTL_DBG(xe, list_empty(&bo->ttm.base.gpuva.list)))
-			return -ENODATA;	/*
-						 * Not an actual error, IOCTL
-						 * cleans up returns and 0
-						 */
+			/* Not an actual error, IOCTL cleans up returns and 0 */
+			return -ENODATA;
 		break;
 	default:
 		XE_BUG_ON("NOT POSSIBLE");
-- 
2.34.1

