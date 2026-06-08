Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6094ACD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CC010F76D;
	Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4Emw+BX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442C810F76B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937691; x=1812473691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=skzP8qiz0SgKC7mWZYxrP3zIyD9zKP3ZY8c4D8FzWTQ=;
 b=N4Emw+BXbt0Y8LtHn1a3sDEtCvTHyFoAai6Xc1XOcK+PpLjqvBMbmt4J
 mZmEv7JpV/TO8SLdPUfkcJ1KhLQ1c4kXPNO/0VIufLN39cVCuKJA1pSWC
 IFPG2qJ6gHToXTGtQT7NsaJIHSSKRudK36+wYabofTbw4JWgk3NcLbMU6
 ORDo274q1mpm95/K2Tu8YW3PzaIRa745vNH+lQrom6qE/CqAh84f5KLk9
 NAH0KDgxccEPCm6L1jmVrdPtmaoyIL/f56Z6PGghp2oeSNebI6w0svQ0l
 NW9zXmyvuv1DbqcOCWbfAg7kC4lO8miIUSrXG7aLyJGToPfbNS/a+EiPt w==;
X-CSE-ConnectionGUID: ou9EStkpSImJxz1kImMDnA==
X-CSE-MsgGUID: Qn7WWojzT1aoDUEvGlSQTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744557"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744557"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:50 -0700
X-CSE-ConnectionGUID: +MASKiuASMC9ere+JJ06dA==
X-CSE-MsgGUID: sjxT6CBlTJOxEQthrrvU7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467569"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/16] drm/xe/kunit: Skip forcewake operations on fake device
Date: Mon,  8 Jun 2026 18:54:21 +0200
Message-ID: <20260608165429.587-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

During some of the kunit tests we might want to use unmodified xe
functions that in turn may internally use xe_force_wake component.
Skip low-level forcewake MMIO operations, in similar way as VFs,
when running on the fake xe_device.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..eb3519107a31 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -95,7 +95,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 
 static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
 {
-	if (IS_SRIOV_VF(gt_to_xe(gt)))
+	if (IS_SRIOV_VF(gt_to_xe(gt)) || !xe_device_is_real(gt_to_xe(gt)))
 		return;
 
 	xe_mmio_write32(&gt->mmio, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
@@ -106,7 +106,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	u32 value;
 	int ret;
 
-	if (IS_SRIOV_VF(gt_to_xe(gt)))
+	if (IS_SRIOV_VF(gt_to_xe(gt)) || !xe_device_is_real(gt_to_xe(gt)))
 		return 0;
 
 	ret = xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val, wake ? domain->val : 0,
-- 
2.47.1

