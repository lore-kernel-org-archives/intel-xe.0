Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23D2C9830A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3CE10E267;
	Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCAWQpCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67010E1FD
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601866; x=1800137866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P335Mv6qGUDFh6ldf1d+VMKBpyMryakCQ+mDrBovWnE=;
 b=dCAWQpCiUT1XnzdJ6Wm9wcJiPqLy77a/93aOASlBMpGIF6FJnlAW9wqP
 ZI5lk6rxG8MmIRj+YtRLuy06ZA71KJrZMIXKi3LHdt86ZAc5PP/Vf5eCg
 qld7oap5QI6nrOk8YP3WZSAdsM63AHKqpuKTWqUeljOuh6DDNzamigI3X
 TpEKbVz2r0d3YK1QUKtaXAJUSFIRZmfw+y+dHGGAaRZvDHC17ikqf4b4m
 /bfH9ql+C+N1QHtawTVMcQO+xDqsvXB18xyNDoBHeJFoaXSsJujaWFpOm
 AoSEFP1Al3kciT1Sa4BccSvKynHUCp2iOig2qWkWeumLgsUzPJIOlN43e Q==;
X-CSE-ConnectionGUID: d9v8FnSsSRyfnCqq9X+b8A==
X-CSE-MsgGUID: 0RsjPVWYRf+cFUvCNYzQYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123348"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123348"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: qztdEWBiQUWILQGwxuRtLg==
X-CSE-MsgGUID: Wtp/f+x9T5a7kEqWuUc6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962696"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 02/11] drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
Date: Fri, 16 Jan 2026 14:17:22 -0800
Message-Id: <20260116221731.868657-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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

Ensure the asid_to_vm lookup is reclaim-safe so it can be performed
during TLB invalidations, which is necessary for context-based TLB
invalidation support.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Tested-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4a316bd49135..79155930ac0f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1653,7 +1653,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		down_write(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
 				      XA_LIMIT(1, XE_MAX_ASID - 1),
-				      &xe->usm.next_asid, GFP_KERNEL);
+				      &xe->usm.next_asid, GFP_NOWAIT);
 		up_write(&xe->usm.lock);
 		if (err < 0)
 			goto err_close;
-- 
2.34.1

