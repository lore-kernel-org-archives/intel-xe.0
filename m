Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E675CFC516
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 01:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E85110E8FF;
	Sat, 22 Nov 2025 01:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXNtpPHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD62510E8FF
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763774707; x=1795310707;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=to6TLDehaXsdM59AxOmkGMS+fSZhiFL6N0QZmzCXJpE=;
 b=AXNtpPHwsLikmpEmVVJ40cB1nliWpXLMbaImLxIEj6t8lir4s4eTv1uP
 N7Lj8xieZrghvQTLpbTBIIDnFXxTURecHUqSI8nituAji3Yrg/CUnt28W
 S7Rb5yxFh/r1NE5i5VHqOXtf3QSntEVWBar/usanbJik0AkUlRCxcsO1P
 uGwMuZSouj4pv4pFk6/wOw6tCTpBLPJuh3OORULcpnP9FmiTp1ZyMuYyM
 kgU5bG/klppPXLf1c/0IiisZ190Ue1qMS5i5+M1ukz450aGli7+OO3nBI
 hP9rPSuLmmNcM4RAtQFuIhuqb6sElO65Vrmfl4DVzUh5/rrkE3ZJ7pJs5 A==;
X-CSE-ConnectionGUID: EWsnopp1Ql2lArjlGlCyIg==
X-CSE-MsgGUID: 9OL+bLRpSv2zkczMjfl7gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65955433"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65955433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:25:07 -0800
X-CSE-ConnectionGUID: sa676Lo1RYChb2Wo/JvoVQ==
X-CSE-MsgGUID: HX/gdLQnTR2zpeqXa0Qjbg==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:25:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Covert return of -EBUSY to -ENOMEM in VM bind
 IOCTL
Date: Fri, 21 Nov 2025 17:25:02 -0800
Message-Id: <20251122012502.382587-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122012502.382587-1-matthew.brost@intel.com>
References: <20251122012502.382587-1-matthew.brost@intel.com>
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

xe_vma_userptr_pin_pages can return -EBUSY but -EBUSY has special
meaning in VM bind IOCTLs that user fence is pending that is attached to
the VMA. Convert -EBUSY to -ENOMEM in this case as -EBUSY in practice
means we are low or out of memory.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f9989a7a710c..a87a606ba890 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2448,8 +2448,17 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		if (IS_ERR(vma))
 			return vma;
 
-		if (xe_vma_is_userptr(vma))
+		if (xe_vma_is_userptr(vma)) {
 			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
+			/*
+			 * -EBUSY has dedicated meaning that a user fence
+			 * attached to the VMA is busy, in practice
+			 * xe_vma_userptr_pin_pages can only fail with -EBUSY if
+			 * we are low on memory so convert this to -ENOMEM.
+			 */
+			if (err == -EBUSY)
+				err = -ENOMEM;
+		}
 	}
 	if (err) {
 		prep_vma_destroy(vm, vma, false);
-- 
2.34.1

