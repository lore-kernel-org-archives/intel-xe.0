Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE5FCA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 19:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD86B10E7C0;
	Wed, 13 Aug 2025 19:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7A/8tAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF3A10E12A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755114493; x=1786650493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tdGi13yOly89bDp6t82p9/5wSP4bVRhYGuvAir6Ef/M=;
 b=P7A/8tAw6NgN1Vj3hS9DhS5WhhoP9vmKYgtPT0OSWHCyGMnxqCMK29p1
 q1WJ9LqcIutbp2okAtBAWIZe5Y1U5jqU5QNLi+rw34extOV5JdM+u7GcW
 cPTMDbqBjlp6VtR8XRp9QUSvz8Z3Z17ZOV3rsdYuIAXzMFc2g3CCRtDIW
 BxAUubfUtvL13KfuPru3JdlUJ3BbP0fgjirgUgK3E0gR08WqwMWFPH5wd
 xWgavdLrJ2L+CTzaYbIGgyq/lwTO2O7v3mM2uOvYEU34LHvlLBrUkZwtH
 dI2En5DzokpSaT7R3AKnv2BNGRyCz2UByylr1w5MJd05QPZmEE3XexBhV w==;
X-CSE-ConnectionGUID: QNm3edkzRei/vB5yzSU06Q==
X-CSE-MsgGUID: D4O8Qf0tT5y6v43GSldeQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60047017"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="60047017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:12 -0700
X-CSE-ConnectionGUID: vp+wwrGcQbOR0KT5jmGqjg==
X-CSE-MsgGUID: H0S0CN6iTd6rL6jKf43Bhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166206182"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:12 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, stuartsummers <stuart.summers@intel.com>
Subject: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Date: Wed, 13 Aug 2025 19:47:59 +0000
Message-Id: <20250813194806.140500-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813194806.140500-1-stuart.summers@intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
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

There is a small window of time during the driver teardown where
the TLB invalidation fence->gt is set to NULL but an invalidation
worker is still alive. This won't cause an issue currently because
the tlb_invalidation structure itself is still present. However as
part of a future refactor, we are looking to split that structure
out. To be safe, go ahead and cancel any outstanding TLB invalidation
fence worker thread on _fini() since at that time we are already
tearing down the driverworker thread on _fini() since at that time we
are already tearing down the driver and don't need to continue
monitoring this.

Signed-off-by: stuartsummers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 75854b963d66..08e882433b13 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -44,6 +44,8 @@ static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fenc
 	if (WARN_ON_ONCE(!fence->gt))
 		return;
 
+	cancel_delayed_work(&fence->gt->tlb_invalidation.fence_tdr);
+
 	xe_pm_runtime_put(gt_to_xe(fence->gt));
 	fence->gt = NULL; /* fini() should be called once */
 }
-- 
2.34.1

