Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B85C021A5
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 16:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE71210E901;
	Wed, 12 Feb 2025 16:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IERsG/+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383E810E924
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739377575; x=1770913575;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FrHluOo7HsUBUfMjYu9mEnnHgcqX1pnnPTpi9tgttsA=;
 b=IERsG/+Q4pzbUQzs4gUeXDhdBgt+F4IG6WBCLNmt5IwkN6G0sf5htfCQ
 M0E8HSgctPCaY3FhGKwZJZlXAsye0cxfOAWuwG7bCPiyoRyheg2x7s0cV
 DlWD3nBS4WeTYjITg5v9oRCo1rLDuCXsF64s+n23zNFRcf1LplnUY9Vso
 +/2g7rzjfkJYPc6uqd0CqyLcyBoaVLkI5ItkxR5aHs5N8StTOE4yk2rUf
 k6j5myet8qO4TwZL8MVmrSAb8NzSSzPQgu4d7JYyLTq/mLG2dXRvKB7SN
 MfYShiV1mTDWjcdLxqVhUa+RaPlqqVU7WDrOupJZnQIUjQ8sq7Dqc1met g==;
X-CSE-ConnectionGUID: +XGx4ofXTROQWD+9lT2hGg==
X-CSE-MsgGUID: HGwz65JdTpa5I1N6M9Mzhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39967764"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39967764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:26:15 -0800
X-CSE-ConnectionGUID: aDYWMotASxCUokMBC+iGKg==
X-CSE-MsgGUID: UHqBwuGZQ4qtt29efhDLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116988179"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:26:14 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/oa: Allow oa_exponent value of 0
Date: Wed, 12 Feb 2025 08:26:10 -0800
Message-Id: <20250212162610.1432159-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

OA exponent value of 0 is a valid value for periodic reports. Allow user
to pass 0 for the OA sampling interval since it gets converted to 2 gt
clock ticks.

v2: Update the check in xe_oa_stream_init as well (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a692dffcb638..9c95ad742f7d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1690,7 +1690,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->oa_buffer.format = &stream->oa->oa_formats[param->oa_format];
 
 	stream->sample = param->sample;
-	stream->periodic = param->period_exponent > 0;
+	stream->periodic = param->period_exponent >= 0;
 	stream->period_exponent = param->period_exponent;
 	stream->no_preempt = param->no_preempt;
 	stream->wait_num_reports = param->wait_num_reports;
@@ -2025,7 +2025,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		goto err_exec_q;
 	}
 
-	if (param.period_exponent > 0) {
+	if (param.period_exponent >= 0) {
 		u64 oa_period, oa_freq_hz;
 
 		/* Requesting samples from OAG buffer is a privileged operation */
-- 
2.34.1

