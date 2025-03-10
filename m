Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4922EC28B30
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FE810E41F;
	Mon, 10 Mar 2025 12:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkZ8rV+2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2A710E423
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609197; x=1773145197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8UHs5850D9g2+fzx/XcOA0KTdD7XbfiTBApvzuGX4AI=;
 b=WkZ8rV+2hi5piVIznEqhi2yyYkJzguvrDZlDsDIBElRQwKbTAC6Q3/2z
 gSCUYlvdfofI1C1jjdULaNzgukdKZOCNE/vkj9ZsP147C6BfSOdZUtU/R
 QxTVd5MT7Sjd4RCeaCaBVdqvdKl5V4EQd0isrwt3OXA3Gpx7Lxocgx8RJ
 s+mnaOcP7CXJtImjNfVyUMmc0KB0oGQcylSkmDBkRTWXUIn+kZsclgdn3
 l9KroSI9NlTSnyJZgeuJ93qyX82knP4FIhHlNEMu5N+jR9kReFi8VMt1O
 2MQe9YM/bOsXVmfO7uTHGWmNbYl/oFwhHFbG1W+F/pGKJgar8Lu7GfxWP Q==;
X-CSE-ConnectionGUID: 3L6rCxl8RTuGidr5M15fPg==
X-CSE-MsgGUID: UQplRJBgRsmiMba1hFSdcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65056455"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65056455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:19:57 -0700
X-CSE-ConnectionGUID: f5zU0UF/TMq/98b4xU73sw==
X-CSE-MsgGUID: YYGta1ccRJ6mGk1WMNqOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143179132"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 05:19:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 12/12] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Mon, 10 Mar 2025 18:13:41 +0530
Message-Id: <20250310124341.1819568-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

Introduce debug logs for the prefetch operation of SVM ranges.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a1607283a5fe..b2b0824b8777 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2372,6 +2372,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2869,6 +2870,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 						vm->usm.asid, (u64)&vm->svm.gpusvm, err);
 					return -ENODATA;
 				}
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 			}
 
 			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
@@ -2878,8 +2880,11 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 
 				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=0x%016llx, errno %d\n",
 					vm->usm.asid, (u64)&vm->svm.gpusvm, err);
-				return err;
+				err = -ENODATA;
 			}
+			if (err)
+				return err;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 		}
 	}
 	return err;
-- 
2.34.1

