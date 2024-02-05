Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E001AC4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 23:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C179112696;
	Mon,  5 Feb 2024 23:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr3cbS74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A47D112696
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 23:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707174993; x=1738710993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i7ivmUBe7y845o4r2+Ozx2eQF+GOi15F+hRIMx1fDGc=;
 b=fr3cbS74pkZqBEE88ZDEvSmIYIkj58uYCadQzgvHOrd/rd73pUac43K4
 wen61XUZYDjfVKtIn11j36dlCglxl0Y8STrgJuK4eV0ObM6s2lilBrKhw
 4o40GKO6bpSQUuheNhqvwkIu4ok1zGNUF4QxrY/d6kj1QuuZfCE81GBss
 AuRyu5vRbM0DJWJ5YVUfpm5cD5EG/EOAmwltAKo9Xahcoq8Ud9b1WWug6
 AF1+Ql+0dSQKHEd4afI41KM95owNUuSykUjrk52tajlWSNxOri3FXvAiM
 vWxjDsH9EbGgkMu3oDHO4h+X6SAAXAksHrB3S5EZ+1Yw6FUlkp7DEOll4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="23105147"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="23105147"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 15:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="903715"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 15:16:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Assume large page size if VMA not yet bound
Date: Mon,  5 Feb 2024 15:17:14 -0800
Message-Id: <20240205231714.2956225-1-matthew.brost@intel.com>
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

The calculation to determine max page size of a VMA during a REMAP
operations assumes the VMA has been bound. This assumption is not true
if the VMA is from an eariler operation in an array of binds. If a VMA
has not been bound use the maximum page size which will ensure the
previous / next REMAP operations are not incorrectly skipped.

Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7e29b816c4d4..ed594fa2f8da 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2200,8 +2200,10 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
 		return SZ_1G;
 	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
 		return SZ_2M;
+	else if (vma->gpuva.flags & XE_VMA_PTE_4K)
+		return SZ_4K;
 
-	return SZ_4K;
+	return SZ_1G;	/* Uninitialized, used max size */
 }
 
 static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
-- 
2.34.1

