Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83925C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524A10E781;
	Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0D610E780
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V0bjgc9ZlHF3PZk0AdiAxB4VlWKdt5P1B99cE0e33js=;
 b=g9E1U/GxeFqlTiOnnNlGacoTEzuVCDOPheZ0VutjA75/Bflvxodp3kL8
 ok8BqHkc08dMa9pyI4oDvFyIcmmn6NIoS/+NYdT2too5FfZ9AQ9+Y9A3q
 pnNvLd402YvDM/qSngCKoVo76r5fEjUwC1arFTNezF88FRdcpJ0eO+Jt9
 8cBgPDWuE4alC7yC7SK7/77q2gZAJ+A3+nd8mULwJrmuwieZnpQeGNose
 uMtL+DVAia0KjljSnV0rUGDtdUHPFQgILiWBZFlMtr9Bokjg50VpwDSQZ
 WTeQ4lp1XVHiIg2VzglsVD+tRVzylVOAZ7788uyWNWAcCV2ZcXI1UveJ4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377915"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377915"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970765"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970765"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:34:01 -0700
Message-Id: <20230525213407.3907094-16-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 15/21] drm/xe/guc: Port
 Wa_14012197797/Wa_22011391025 to xe_wa
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wa_14012197797 and Wa_22011391025 apply to DG2 using the same action.
They apply to slightly different conditions. Add both to the oob rules
so they are both reported as active.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 9 +--------
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1b3fbbd74923..54aaf6e6b577 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -147,14 +147,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	    xe->info.platform == XE_DG2)
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
-	/*
-	 * Wa_14012197797
-	 * Wa_22011391025
-	 *
-	 * The same WA bit is used for both and 22011391025 is applicable to
-	 * all DG2.
-	 */
-	if (xe->info.platform == XE_DG2)
+	if (XE_WA(gt, 22011391025) || XE_WA(gt, 14012197797))
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9b29a0dd0934..77ac4a4a3296 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -1,2 +1,4 @@
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
 16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
+22011391025	PLATFORM(DG2)
+14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
-- 
2.40.1

