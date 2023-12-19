Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7FCC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 06:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB0410E09A;
	Tue, 19 Dec 2023 06:49:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA1810E09A
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702968578; x=1734504578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wfeXXM8Mwy6VRffny5Eigu0wKu/v1dyDuVzJ9N4lTiE=;
 b=MqOGFAAufquYJcA2afpv5Wq8yJsdpU7uYGO0FMmaF7+H5QcnLS1rvmRx
 r5UaJo3eRRQh5EHDk0LGO+QieoRt3zFKWhO36/X/lahM33GDcKwnFV8//
 cgj7Kfvvr8LWXPbDVHHWOT7IV68o+/Lv6rpoZqMfaxBTvU9QL4OZbKAI/
 2RaMkobqGPKc29U38FSObJ0ngWH8zHrpffzwt63xM1J491uliDl8WFz4f
 Lvrn8IfEFOND9H2zvjAueb+lOP7jN3dwFs3CcdeqTuRXCFGnmcOv/SwzF
 jaBTxhI3sotCEMYB8uI/2hHvVNWcksLrpK0PFX7jcuSJUVIXTltl2ag8z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394493625"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="394493625"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 22:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="775859575"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="775859575"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 18 Dec 2023 22:49:35 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xelpg: Extend Wa_14019877138 for Graphics 12.7
Date: Tue, 19 Dec 2023 12:30:18 +0530
Message-Id: <20231219070018.8931-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wa_14019877138 is also needed for xe_lpg graphics 12.7

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 7d6b86d602c8..3456ca6f7b32 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -536,6 +536,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
+	{ XE_RTP_NAME("14019877138"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
+	},
 
 	/* Xe2_LPG */
 
-- 
2.25.1

