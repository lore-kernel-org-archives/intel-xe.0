Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD0C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6594610E29B;
	Wed, 19 Jun 2024 21:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEFZEm4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8985710E29B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833593; x=1750369593;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tKJi49elPTMJ61ziobLOjLmlMx3VaJAbiAipSBpUtPc=;
 b=mEFZEm4Z6Ss2K56M/D6WxtCTJn8k9lpYKjCkPERKqSQKJtXnIVtnbNIJ
 AxcEhw4iFCGP9lJHVyHFZVd1SnjjwDbMkIjDvrlwNiubTc9eDRZT5UnCc
 ArWYbKemaMn7k0wOKktlZO2d1WcGBfdyvWMkoRUQfzDtTmdDqANNWqUC4
 Vdmhz/+uzNmJZ2wzNuZw4A16K5sV1ILnJrfvuisZSCQLSIZgRJOwR3MXl
 iw7hDcVlsj7n1iE4/646Nphom9VcVdL+RrJ1qFM11DhLATY7nmc0OWkXL
 gljOJ2fiwkNjuEzCAkSMlbV5uMm4WgK04BNux99diJjJh6oFvejO58wdO g==;
X-CSE-ConnectionGUID: DlzYBu2KSB6j+lIswNn1pA==
X-CSE-MsgGUID: l/2yI/ZRQFS2B6FtU4MVoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662981"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662981"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:32 -0700
X-CSE-ConnectionGUID: amfOyA/bRni5TZ+nwBpdXw==
X-CSE-MsgGUID: XRzK0P1ESf2QLBk0kjfUTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157809"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/9] drm/xe/vf: Don't initialize OA if VF
Date: Wed, 19 Jun 2024 23:45:53 +0200
Message-Id: <20240619214557.905-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

We don't support Observation Architecture on the VF device.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 34206e0b6a08..f54a97954452 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -35,6 +35,7 @@
 #include "xe_perf.h"
 #include "xe_pm.h"
 #include "xe_sched_job.h"
+#include "xe_sriov.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -2385,6 +2386,9 @@ int xe_oa_init(struct xe_device *xe)
 	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
 		return 0;
 
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	oa->xe = xe;
 	oa->oa_formats = oa_formats;
 
-- 
2.43.0

