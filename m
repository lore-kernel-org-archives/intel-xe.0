Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F49AD73EA9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410110E346;
	Thu, 29 Jan 2026 23:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC5ZWYbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD8210E322
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769730105; x=1801266105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PGCEDZEIofW6XE71UyNqdO/3CmNJeaklJKwLwJwDUmY=;
 b=aC5ZWYbXHGzZmCCks7kx1l1pWgvpnuX/pSYs7kKIUdEEaP+GE8Vu3mQn
 +eG3ao8B9nPPjL+qylFHMKKIEzJr0u4SVMw7tLNJlnzCdciWdJu16tUYm
 DN/LFacbfcvLgn+3ItwUu5jsAexDX/XxySRU23fh1CxG5JmnpzZEARrZC
 HQ+KwJLqJ3a5wu3Fd5ST1OC1TBJnGPjdoMcWlWDkngiQsrraLlSrYPU3J
 NB5Yy7chCovw5Arv5VIzik4A7DXe9Yw60lx9ueWiDk1p0TBrIs5HXOo2M
 sGjq5LggI0cU4eDh6AJtiO+B01sG485Id/lxLkUdhAMcstZGC3mZNleJP Q==;
X-CSE-ConnectionGUID: nupiZMVvSYGXRhC2fGofSA==
X-CSE-MsgGUID: rKKYzvUhSXG5DM7QME9oCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58560073"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="58560073"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:41:45 -0800
X-CSE-ConnectionGUID: ST5kPuxvSl+R/E1FCVQVAg==
X-CSE-MsgGUID: zVuW1PG4QOeSpDQe7DnLIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213201749"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 15:41:45 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep
Date: Thu, 29 Jan 2026 23:38:38 +0000
Message-ID: <20260129233834.419977-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129233834.419977-5-shuicheng.lin@intel.com>
References: <20260129233834.419977-5-shuicheng.lin@intel.com>
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

Correct the function name in the kerneldoc.
It is for below warning:
"Warning: drivers/gpu/drm/xe/xe_tlb_inval_job.c:210 expecting prototype for
xe_tlb_inval_alloc_dep(). Prototype was for xe_tlb_inval_job_alloc_dep()
instead"

Fixes: 15366239e2130 ("drm/xe: Decouple TLB invalidations from GT")
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 6a7bd6315797..01c413a2537e 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -198,7 +198,7 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
 }
 
 /**
- * xe_tlb_inval_alloc_dep() - TLB invalidation job alloc dependency
+ * xe_tlb_inval_job_alloc_dep() - TLB invalidation job alloc dependency
  * @job: TLB invalidation job to alloc dependency for
  *
  * Allocate storage for a dependency in the TLB invalidation fence. This
-- 
2.50.1

