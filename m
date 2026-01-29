Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803DFD73EA0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6F510E8D3;
	Thu, 29 Jan 2026 23:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIwEAtev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B7D10E8D3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769727618; x=1801263618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rI9L/I+1Kd4FWC7cDLrMzl/G2UTBSqTHqNqWo3zCJDk=;
 b=OIwEAtevbNyXx0RU0j8csdVFPjkqxQMZYkjQ35meGGKwbtm8lpFECJNY
 4qAsylXvZ9zvklTuTJJD5qBbIU2DM3pzcIa6mqfG3FKeP8m6ITEiPrh4Z
 XB/jTGVz2rCFpxucPrssapfqh1Z1yxTfWzq65+puMUXWQp51Lsdd1qnyg
 pMWhhdFpDFNg1RAnzim32rQTX0Rgml4LN2matRTJxosFJak3nuTyTm01t
 b3acDr+EFE4x+Vvy8QDO3/TzKzf6SvJ1IPZEeak4An4VMprziMU+MOe14
 pU09y/ysdfleoeIJGmpJOVNxkwTgCEvH4yPejslN0NZyHzotfdNR4htFc w==;
X-CSE-ConnectionGUID: 17HyjG1SRMuiB9ARZbTFqw==
X-CSE-MsgGUID: pm58VF9wRxighr/aX4uMUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82089505"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82089505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:00:18 -0800
X-CSE-ConnectionGUID: D0meCsLLQFmJESSa0V/Tyw==
X-CSE-MsgGUID: BD7WTz4ATNu8IWFscilCQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208715246"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 29 Jan 2026 15:00:17 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 3/3] drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep
Date: Thu, 29 Jan 2026 22:56:10 +0000
Message-ID: <20260129225606.412902-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129225606.412902-5-shuicheng.lin@intel.com>
References: <20260129225606.412902-5-shuicheng.lin@intel.com>
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
xe_tlb_inval_alloc_dep(). Prototype was for xe_tlb_inval_job_alloc_dep() instead"

Fixes: 15366239e2130 ("drm/xe: Decouple TLB invalidations from GT")
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

