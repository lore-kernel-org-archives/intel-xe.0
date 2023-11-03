Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA87C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 05:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9856E10E052;
	Fri,  3 Nov 2023 05:51:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EB210E052
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 05:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698990675; x=1730526675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MhLnnOAcmdglxKcKxfswZjFPGb1prlWvpB8ARTbdXVQ=;
 b=Ac4uQJLaOT5Y+cUBABGh6AjfPXWPgkJFoIVeZL/V+LHFgMGMz22w8YF7
 VboyR6GJ08jOnZVk9g+C2Tq0YGQo1+nZyxKCEoZngex3/FnVZybDVN3GK
 Z/XHwIuBjwhY0NSy9B931rSl2VVyRHW4By47NEyqc0MzI0LKwzHsTeLQ0
 bw1i2JSpkUd9wOxvmJK1+M7OokkPEZGmoFkDmiIn3fZ3FRgQtT71c86ag
 sGxvJSfsdJ+eE9t21GKgnw+gCcfZcH3Ls6zNomSuFjvTYT1h13JJFNGS/
 ONcC+y8tH1WRLhjsO8n6cFZOiPDLMET059FK52gUSYx6cFY53UmLEwEvC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391752665"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="391752665"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 22:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711409021"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="711409021"
Received: from haridhar-ms-7d25.iind.intel.com ([10.190.238.53])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 22:51:12 -0700
From: Haridhar Kalvala <haridhar.kalvala@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 11:16:41 +0530
Message-Id: <20231103054641.3311585-1-haridhar.kalvala@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add Wa_14019877138
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Enable Force Dispatch Ends Collection for DG2.

BSpec: 46001

Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 2f1782db267b..6b6dea233d80 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -671,6 +671,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
+	{ XE_RTP_NAME("14019877138"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G12)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
+	},
 
 	/* PVC */
 
-- 
2.25.1

