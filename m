Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AB9EED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840D510EC2D;
	Thu, 12 Sep 2024 18:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ob/p7Hxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1593E10EC27
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167509; x=1757703509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hxk6M8CQKnKb2TGF56f/F3Hn0FOpGAFZK1IzQ02MafQ=;
 b=Ob/p7HxcYiz8LEmBtVzN8P5Wa9Ovk9d3OtsG/2FuEV4mwP8xj50nrnPW
 2Tmmyva0QCCNqNnvaw41cphqXK2Nx991aIG4vYBogkHKOSo1pDOKstAHL
 CZUQ6uKeyeA9JXcH7XB5CPYbyaVhjJdzk/AU1Y7X2C20mk/HlLPSu2DAv
 x16n0ujaWsaLEft119HjTHVxEUeB/WzUMnvb6hSvNHXiwGF3r7bbGK4M5
 5rYmkpfhAOX4B+xl0ySvYWzn8LD80jwJdvVodjtxajTnCFUi7bXGW/wJs
 z+0AGt1rqhMxQpcUQ14A4LYtT5mVHZ7+M4zcFs714/JllWOKIPMGULo3z A==;
X-CSE-ConnectionGUID: hJS9c0OARRamkgtu0uIeEw==
X-CSE-MsgGUID: CPRDDLi6R8eJ7RfxBQyHwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202984"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202984"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:29 -0700
X-CSE-ConnectionGUID: 5f9S0uqVROyBQ/yIj5/YPg==
X-CSE-MsgGUID: BHom3rwQSf6OtY+ANFvkQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910195"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 15/23] drm/xe/oa: Handle force_wake_get failure in
 xe_oa_stream_init()
Date: Fri, 13 Sep 2024 00:45:55 +0530
Message-Id: <20240912191603.194964-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does not
necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 354ee9045efc..80e5c4ef86ef 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1357,7 +1357,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 {
 	struct xe_oa_unit *u = param->hwe->oa_unit;
 	struct xe_gt *gt = param->hwe->gt;
-	int ret;
+	int ret, fw_ref;
 
 	stream->exec_q = param->exec_q;
 	stream->poll_period_ns = DEFAULT_POLL_PERIOD_NS;
@@ -1417,7 +1417,11 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(stream->oa->xe);
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL) {
+		ret = -ETIMEDOUT;
+		goto err_fw_put;
+	}
 
 	ret = xe_oa_alloc_oa_buffer(stream);
 	if (ret)
@@ -1459,7 +1463,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_oa_buf:
 	xe_oa_free_oa_buffer(stream);
 err_fw_put:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
-- 
2.34.1

