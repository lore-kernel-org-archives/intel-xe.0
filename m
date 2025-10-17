Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A732CCD183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 00:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9B10EACE;
	Fri, 17 Oct 2025 00:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFdxwk9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1836A10EACE
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 00:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760662017; x=1792198017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EdBPmXSf4CDlOEZyO7wJtxd7FauzjNzUF1QJlVaRnSI=;
 b=TFdxwk9Tp65LbfNTSrCC/YmU6Z43yi40fx6HYpdQ489y0VykQkyLm600
 D/aWxviN+SuXytIOk9B1WQfm9uLJ+MD9d3gRy8mApMjc2eSue1QO3xvvS
 IJfN54rPs7KatN1uSfrTxecSbkRY1VkqPUQP+ZDpYtjtoAOd1WyrNNiWs
 5rnCuk0wZz1TZGIetprMJY9FJZCXLMvNF1W29upRKGVVG0Jm9p6PwEpmT
 KLciW/Plt8SfSmZPllqo9U/gw5qbD5ZUgr2V3FJY6vQq62y5D4XvQzWmM
 6IWRLpBnYMCBOpXAVseZOEiLKq16CaCzaCyHa4dOH6KwToOKTKhWHV44U Q==;
X-CSE-ConnectionGUID: V7usSXx7TKygcwq9vQRYaw==
X-CSE-MsgGUID: vycSyKZZRb6JD4HiG1xjkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80314215"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="80314215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 17:46:57 -0700
X-CSE-ConnectionGUID: rigALMyQQaKN2m+4hRsaxg==
X-CSE-MsgGUID: 2MJqf8jARXO0PHtJ3l23iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183005420"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2025 17:46:56 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] drm/xe/guc: Change outstanding assertion to error
Date: Thu, 16 Oct 2025 20:46:54 -0400
Message-Id: <20251017004654.1490644-1-zhanjun.dong@intel.com>
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

GuC CT layer will check GuC to host outstanding counter when changing
state, trigger assertion if the counter is not 0. However, the failed
assertion is expected on fault injection test, change it to error to
make it works with CI system.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 18f6327bf552..85416db1563c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -436,8 +436,9 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
 
-	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
-		     state == XE_GUC_CT_STATE_STOPPED);
+	if (ct->g2h_outstanding != 0 && state != XE_GUC_CT_STATE_STOPPED)
+		xe_gt_err(ct_to_gt(ct), "Unexpected outsanding counter:%d on switch state:%d\n",
+			  ct->g2h_outstanding, state);
 
 	if (ct->g2h_outstanding)
 		xe_pm_runtime_put(ct_to_xe(ct));
-- 
2.34.1

