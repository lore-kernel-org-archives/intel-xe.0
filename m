Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95B7C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 12:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADC110E3A8;
	Mon, 20 Nov 2023 12:05:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5891D10E3AC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700481918; x=1732017918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6DLeu9DO3xn8TiVxjGKHlRfoSY7hxNvTGY3E8otkALE=;
 b=hpK/9l/NBxkvsKRn0qPzvP2EZvaVa39Jnh/ia1iL2zEzH8YTuhHflxYD
 huYTUAhlK2SdCR9v3hfjn51Qq3qeiG2XEjTijcuxyKlNvqQyBgCmBFyd4
 gSk+IRaSMB9Ynqo8m6U0wd3BblyRlkHrrP2Ka9+PYSb8iXhEK5FFylgfm
 wXkPR0pzlUdgl/XMbBEVw4fvxYS0xzXERAfxzgAUXrom97Q00Lxfcd/2O
 HqQ9UF6fPoDfuYGK6wwDt5rVZjNTbEw+mQY6eKyZk0vtJbofA1Sx9BrcE
 6jAZ7cYH+GbBHe4Sqigu4BfrkYxHdbOAJyTr0YSf/044zPU7gBio43fa/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="390464485"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="390464485"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 04:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="716187845"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="716187845"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 20 Nov 2023 04:05:16 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 17:44:28 +0530
Message-Id: <20231120121428.3576569-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14017421178
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

This workaround applies to Xe2_LPM

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 6572715dfc09..13962b8a677a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -273,6 +273,15 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 			 SET(XEHPC_L3CLOS_MASK(3), ~0))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("14017421178"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
-- 
2.25.1

