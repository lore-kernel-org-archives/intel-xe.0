Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD19C001E0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 17:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548A310E213;
	Fri, 28 Jul 2023 17:56:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF92D10E213
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690566969; x=1722102969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wg3uvxKGQcH4tW+UH6p0MlXm3QKQ83mXoxM36eHCJxE=;
 b=eyqtc6FEUUaN9qTzS1PqqiCL4SVxGTFMdc2pKoN56kJBZXAeRYihRVbZ
 6u8geB9KZwtKs8x+Yu4j11jTd/oH6SfSpyRaBM8xrVDc3i7HKP8mN0lMq
 upDxqg6TtaZ1YhupLTlxmbJ1TxEVMWExiM1D/w4eUuo0bYaPyHFKG03lQ
 TxMQ1BZ61T8ukZLAlsYDgarq3VTHkuDv1cHENWUdZVWVsDS2vpZFqwZeV
 lXpBVbA1h+FEAAfI6JvWjPs8ZVyDG0oEbKRZSOtDRnjbIlQeaCfVIHkWJ
 F8A9B7HVPUEBqzKlrCtF0hRVWIXneAdNfjVOeEcQXs7BaBpWEF0eBs6qs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372276755"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="372276755"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 10:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730851615"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="730851615"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 10:56:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Jul 2023 10:56:02 -0700
Message-ID: <20230728175601.2343755-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mtl: Reduce Wa_14018575942 scope to the
 CCS engine
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

The MTL version of Wa_14018575942 has been updated to suggest only
applying the register change on the CCS engine.

Note that DG2 and PVC have a functionally equivalent workaround with
Wa_18018781329; for now that one is still applying to all engines,
although we'll keep an eye on it in case it changes to be CCS-specific
too.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 497a8c05c715..5cf84a096302 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -238,21 +238,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	},
 	{ XE_RTP_NAME("14018575942"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
-	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
-			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
+	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
 	},
 	{ XE_RTP_NAME("22016670082"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
 	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
 	},
 
-	/* Xe_LPM+ */
-	{ XE_RTP_NAME("14018575942"),
-	  XE_RTP_RULES(MEDIA_VERSION(1300)),
-	  XE_RTP_ACTIONS(SET(XELPMP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
-			 SET(XELPMP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
-	},
-
 	{}
 };
 
-- 
2.41.0

