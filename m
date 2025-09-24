Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AC1CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3727B10E6A6;
	Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoDRphy+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152A810E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676572; x=1790212572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8gTLRZyCuV0oBNZI+K75FxahDOoKOB5xWf07MbWyPnA=;
 b=IoDRphy+vwYiIQN5RSo2cT4ngeZeiaXpyD0aBZvIqlIn+/JyismKvFp3
 4/6aUXI/ZQOokoFPSj64ijRgTB0/FCC3PEA11x7AOyE7yPn6tOpziccjq
 lSNTK0n3JLU5qZJ8OcjX3EidrOE0MOipsfoKmblsKpvVfYCF0R30jEzR6
 5qqwU3zjPTaHa/Y6NGimTSrOyxJA3yjaBJRbGrNqrwR5aO/JOiFI9p0OZ
 n3xJXrNzxh0+OLMF8u5893Zr13GUsp5+T+1vbw/GEAUgAVtiXymXiTDAz
 4SsElAszlqs0XxqtNxdSXB2KcLPMIq1UdSrYd/PVDcemkOT8JgW9FA73s g==;
X-CSE-ConnectionGUID: lDkhosLRS9eiusXo7MQ+xQ==
X-CSE-MsgGUID: 4ULbGcp7RjGVGjEjmb7pOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908300"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:12 -0700
X-CSE-ConnectionGUID: aLD+T1cvTP+KNK/kR4RgdA==
X-CSE-MsgGUID: WHNKb102S7mK7u9VZUY9vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841816"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 34/34] drm/xe/guc: Increase wait timeout to 2sec after BUSY
 reply from GuC
Date: Tue, 23 Sep 2025 18:16:01 -0700
Message-Id: <20250924011601.888293-35-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Some VF2GUC actions may take longer to process. Increase default timeout
after received BUSY indication to 2sec to cover all worst case scenarios.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ac60da51da2c..d029f349dafa 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1472,7 +1472,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
 
 		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
-				     1000000, &header, false);
+				     2000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
-- 
2.34.1

