Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9CFC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 22:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603BA10E618;
	Thu, 27 Jul 2023 22:09:48 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492DD10E618
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 22:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690495785; x=1722031785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4ZD9W4TajAoI16TrZzhp40n2uvPmEGVVym6o4JsZcDw=;
 b=QiW+q8Jq6xedyf10pWmfjchKbORXEWHPru8W5ocxUeU4DC/E0LgZNdvP
 iy+Udl/KcEKoVTy7fFpFozvyh85IfidODICJR61s18Tb0P5+H8IfoCH+m
 ibpC/Pi3hc00fUV4j1RWwgzHeL8/MmDllWwMskmFZMDv2oEpvd9XbmZmw
 hNXeFCsbnyr34W8t9L3nPSwptHbSE0q+db/YqBel9ZhGLUl2Vd55FTEGx
 /ybqpyqtvqTNBP+sprl04gwxoIgBSHXqlyTJJZ5oo3tAd43rU9t0CBC2b
 jDbVF7jRsFW55sAa0GagkD1MRV6X5eJIoop5o/40CrCQdPUPyE88RH+kl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454810795"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="454810795"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 15:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870614235"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 15:09:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 15:09:21 -0700
Message-ID: <20230727220920.2291913-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add Wa_14015150844 for DG2 and Xe_LPG
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

The workaround database tells us to set this bit, even though the bspec
indicates the bit doesn't exist on these platforms.  Since this is a
write-only register, we also can't read back its value to verify whether
it's actually working or not.  For now we'll trust that the workaround
database knows what it's talking about; if not, the hardware will just
ignore the attempt to write to a non-existent bit and it shouldn't cause
any problems.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_wa.c           | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d654f3311351..c93d8f8cd93a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -328,6 +328,7 @@
 
 #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
+#define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
 
 #define RT_CTRL					XE_REG_MCR(0xe530)
 #define   DIS_NULL_QUERY			REG_BIT(10)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 21087f7a4609..497a8c05c715 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -498,6 +498,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			      */
 			     .read_mask = 0))
 	},
+	{ XE_RTP_NAME("14015150844"),
+	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
+			     XE_RTP_NOCHECK))
+	},
 
 	/* PVC */
 
@@ -525,6 +530,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
 	},
+	{ XE_RTP_NAME("14015150844"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
+			     XE_RTP_NOCHECK))
+	},
 
 	{}
 };
-- 
2.41.0

