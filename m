Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E56EE0212
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC1C10E993;
	Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bhbob4oq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF73F10E941
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012050; x=1757548050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sOGTPcIBR0+7yL1hjs0OePaBYz7tUcRE/KNCZteCAWU=;
 b=Bhbob4oqbk2QtVNgVVYlw8VnKG9bDF1QMflNlx1HBiL1nV8JDDXXIXjr
 OJ7ifkrvSstTxBmTbLIoUQSkwSvyRdPYFYbib2/CebNS/JYPL0iAPd0ix
 LufAuWkSKBa1x97muGEJH7PYfF0kizcIh4TbGbRH5wfiC+DrIVuc6aE2G
 VuEUE5TPyAHIPCwix69vzt2KUAP5SkMpL/WRl9VS5JjrMy3cZp2OaOFLw
 Id1jZw87+xXQ7BXdAKHjbcVHIlOcIf0dD8WN+CFQ6MuQvQ2Ycf0a57dTg
 MLY1Vhm18sDqIORnyvRceN+wWcRTVpzV/jNZCoL1ArkiE5dnwYhqnQMNo A==;
X-CSE-ConnectionGUID: KgAnTvriRYWvtDu5gYUdJg==
X-CSE-MsgGUID: FJ2Um19aTouzwyhhIIBB5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144334"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144334"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
X-CSE-ConnectionGUID: 4rC46Il6R3eXvMNLAjKJNg==
X-CSE-MsgGUID: vcUqQAaaQ+mXgHhMFvCTWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989671"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 40/43] drm/xe/forcewake: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:48:00 -0700
Message-ID: <20240910234719.3335472-85-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

