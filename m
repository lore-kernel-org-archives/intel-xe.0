Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7993AE6FE56
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F51D10EB3A;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ovc7+V+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955CB10EB29
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I510lhEhhbUwTNHhCz2W8YfOCx11t4nrUifDTqsaxM0=;
 b=Ovc7+V+eEa7OByTO8HxiQmcDTSGSpQhOCuog1K5Da6H2IAXDZAx+bKwk
 AoNvGLRuhh+SQkqiAR497KvBSx1FhbsNsoc3i0lRo/9it2W+eWhHbLvf2
 wGXAdTjjvvwhu4BJ/QkWGdW/8biqpNUEPcWVmmcDjBmrDVZmYAPdULe53
 eEliWTPXwhGexWJCjtDdOfz8zCbWAVqRtMM7zpmau6/6VyQm1aJki5YfQ
 XvsR22+aKUp3EiVCXGBAnR0P1/ciJsyCUG+fJV4Ty/+yH1KxxGNL72uLJ
 wl1e7+vV1LPQu5is59mTTwdCeCb9+RQK1yDKVElT+1vm1Zs9XltSxsQl4 A==;
X-CSE-ConnectionGUID: tlVi4ctjQcqOqIcAoodFgg==
X-CSE-MsgGUID: 6kGfYSNARPGfjM/Hg1AJog==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855330"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855330"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: uCLem0EWTNO7khDeWDNmKQ==
X-CSE-MsgGUID: EO5/XXZkTzaLMArth2m3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792740"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 40/43] drm/xe/forcewake: Convert register access to use
 xe_mmio
Date: Fri,  6 Sep 2024 17:08:29 -0700
Message-ID: <20240907000748.2614020-85-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index b263fff15273..a64c14757c84 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -100,7 +100,7 @@ static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
-	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
+	xe_mmio_write32(&gt->mmio, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
 }
 
 static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
@@ -111,7 +111,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return 0;
 
-	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
+	ret = xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val, wake ? domain->val : 0,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
 	if (ret)
-- 
2.45.2

