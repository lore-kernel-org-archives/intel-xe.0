Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929EEC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A1110E981;
	Fri, 14 Mar 2025 07:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBUsjLxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA53310E981
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937915; x=1773473915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/dOo+KyjTJyVj6ABPf5SddLkdwEVWa8H3t1OOU9VdTs=;
 b=bBUsjLxzmXTph7ipEFIJzD185J2F3EYDUzPGLK25X61HAP4Yowv0PF/X
 DGlUGn0ihHVNLoUOdIBDupQpBgu5aPZkH88J/PX3rTeGAJt/4uvVj6h1R
 qtzNwQhZDtYTM9JB0rVcINnj0GpQT2fWLvQck/1dsFro4Jaq0A6ZWCcaQ
 nkLTd0AOEpDTBG39GMnRrs6MJr4iZjNbzZpslHIKwX+WX3jGsBjUfMkks
 UgkhP1Fnv418PRB8kPIAvGcsB5DECz2Gna1PAOCsBG8WPZcyVxQY+i3vN
 QWRdz+xhCRR4u+tzSv06pxulTI4rIIeQCCvX43c5HRmAUvdG20OfhHaKb w==;
X-CSE-ConnectionGUID: Qd/lJoq/QByA3Kne7vCQkQ==
X-CSE-MsgGUID: AmYqELCWSBGaZnMRCWPuXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446021"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:35 -0700
X-CSE-ConnectionGUID: iuLdEPO9QIClt3/3XYGv5Q==
X-CSE-MsgGUID: H+IVXC6FRyGdVPvoOSU4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043776"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 12/29] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Fri, 14 Mar 2025 13:32:09 +0530
Message-Id: <20250314080226.2059819-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 360be74b2a28..f63dd4eb1ae8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2369,6 +2369,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2866,6 +2867,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 						vm->usm.asid, (u64)&vm->svm.gpusvm, ERR_PTR(err));
 					return -ENODATA;
 				}
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 			}
 
 			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
@@ -2877,6 +2879,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 					vm->usm.asid, (u64)&vm->svm.gpusvm, ERR_PTR(err));
 				return err;
 			}
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 		}
 	}
 	return err;
-- 
2.34.1

