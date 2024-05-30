Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56E3C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 10:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376C911BD1D;
	Thu, 30 May 2024 10:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYcTP+4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DA611BD1D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717066331; x=1748602331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qsp9N31b56QWJCghnmC6gv4le13RRHXc8863ua6RyyE=;
 b=PYcTP+4FNZebc9tbNEKuASRo5N/QlNK752FaqThXAeFPRfLcC0mj53VK
 RlXwjv1jlWnv9AtetMnk5q4J7u5hvSnxTj5GpPLkhfqSyVVVdnsh/zdFt
 X+lRaP89hb2RMPt4LUw2dLNk72Car/bWq5IdHbiGHkC4Is90tjd6H1CBA
 76i7ulRBRPPnI/lL9BOiuSMHemG0vGx6AcNOmPbPqaxjH8tvGbKpi0xGh
 JW5qRO/op2Bmv38XM8A7upRK/ohQbzty7V20xWKUXTSQ1g5yHpQXWnV/L
 vJSEv0BBbtmsuc8ooKymv6rL47MYXADBK39H4Gh5dZttJ944GI60HRSle g==;
X-CSE-ConnectionGUID: N5f6obBxR925P99vCHMH8A==
X-CSE-MsgGUID: 0Ecw3X+NS9KKINdAXIbDkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13385683"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13385683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 03:52:11 -0700
X-CSE-ConnectionGUID: dG9drYWgRh6SZrhOH9SfNQ==
X-CSE-MsgGUID: RX+g7SX1RKSPuwMgO6XSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="73253130"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 30 May 2024 03:52:09 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3] drm/xe/xe2lpm: Add permanent Wa_14020756599
Date: Thu, 30 May 2024 16:22:29 +0530
Message-Id: <20240530105229.490430-1-tejas.upadhyay@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For xe2_lpm Wa_14020756599 is applied to all steppings and
when RCS is present on graphics GT.

V3(MattR):
  - Rename rtp api name
  - Use MEDIA_VERx100
V2:
  - Remove engine filter video decode
  - Fix typo GRAPHICS/MEDIA/s - Himal

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_rtp.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa.c  |  4 ++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index fb44cc7521d8..608ad1c57613 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -323,3 +323,13 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 
 	return dss >= dss_per_gslice;
 }
+
+bool xe_rtp_match_rcs_when_media2000(const struct xe_gt *gt,
+				     const struct xe_hw_engine *hwe)
+{
+	if (!xe_gt_is_media_type((struct xe_gt *)gt) &&
+	    hwe->class == XE_ENGINE_CLASS_RENDER)
+		return (gt_to_xe(gt))->info.media_verx100 == 2000;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 337b1ef1959c..76e3ee55c4fc 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -427,4 +427,16 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_rcs_when_media2000 - Match when media GT version 2000 and
+ * rcs engine present on graphics GT
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if media GT version 2000 and rcs engine matched on graphics
+ * GT, false otherwise.
+ */
+bool xe_rtp_match_rcs_when_media2000(const struct xe_gt *gt,
+				     const struct xe_hw_engine *hwe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 64bc595fc727..0288499dc226 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -227,6 +227,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("14020756599"),
+	  XE_RTP_RULES(FUNC(xe_rtp_match_rcs_when_media2000)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
 
 	/* Xe2_HPM */
 
-- 
2.25.1

