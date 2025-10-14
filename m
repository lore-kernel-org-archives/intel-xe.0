Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4794DCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 07:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78610E560;
	Tue, 14 Oct 2025 07:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StSsHSED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8416010E55F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760427088; x=1791963088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h5JOwJvzEeiBP2ARkOfCuOVqjka3IUAegFPy5YquZ1o=;
 b=StSsHSED4cVAAvb7CZkgDJI9w6wLQS3gYXPB9X02bz8wS6YTMTSQpytt
 NFMAdpnlH5/zCNA6xXa9eFKeJO7GwKcInBDrk3ns7ADMpvSmOJsUEJ1Ft
 Y/ceJMBUqBtNS+cNRv/p1CDp8w9S3ie7g7Exl7RunqidfovzBXOpH0Aw5
 oVlMzB+i5f0RMfKwKZ7ppWQUNby6Qm9SYr0MDigya7GQCYKYy5k2zsGoZ
 KZdKmDYY+7luW3yXsFbKJ1J+b+EyA8dZ2lV5jo2r+ObJjfwkeavxSsU66
 Uuq1X/Q0jeb+UllgoEfnrBuHplCm4iXrdUFARHX6BDu0jvgd6rcWWhLlY Q==;
X-CSE-ConnectionGUID: 0XoqVq8/SPKpnC+WduceRA==
X-CSE-MsgGUID: FSmwEl9kR/eh2qhY4FtrJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62474476"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="62474476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:31:28 -0700
X-CSE-ConnectionGUID: FBFJvoWpTWGEscAK4Ug9Rw==
X-CSE-MsgGUID: V3r4mCC+SZif6wMe4L+Glw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181826226"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 14 Oct 2025 00:31:26 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 1/2] drm/xe/guc: Make xe_guc_submit_pause() available for
 non-VF cases
Date: Tue, 14 Oct 2025 13:00:35 +0530
Message-Id: <20251014073036.3282329-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014073036.3282329-1-raag.jadav@intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
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

Drop xe_gt_assert() meant for VF migration and make xe_guc_submit_pause()
available for non-VF cases.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0ef67d3523a7..3cc428d45b4a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2170,8 +2170,6 @@ void xe_guc_submit_pause(struct xe_guc *guc)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
-	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
-
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
 		/* Prevent redundant attempts to stop parallel queues */
-- 
2.34.1

