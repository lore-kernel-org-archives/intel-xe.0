Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FE2C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 11:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBBE10E2CE;
	Fri, 31 May 2024 11:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nl1HPyeu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD2010E2CE
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717153206; x=1748689206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wzC+wraJBSPW/KFaGUiixQGFe7xTZObPT/QDwuwKla0=;
 b=Nl1HPyeuZCl9n8C37uPuPfACbx28A+cPFQ6HjaNdwpnsr5ItN0cz8WYq
 wYJgpIJOF1Faxg5DjX+RpMjbinmE5C9Q7bv8BisbpiZ4EaQCFfQ8ziwni
 MpRL4bXAleMx6nWWv1cRbHyyX9pq13oYkDRWxil5q6L4P6s52a6qwWRew
 1MW1mYCIw6u1+SGp3+UN+R/7Qiocu678o9oycoTYh+/IqzC/YnMkh1B7b
 O7Srm74lhEVkMQFq3Fkl49wRS5IdeAWUVhW67iVlQgN3hRESmWCN1w5fa
 QmA0nmtx0LYefzCLZVMmCspGWD4/iRyQjGaDxBafrtqzRh/MlXapsHdWu g==;
X-CSE-ConnectionGUID: qLzipRQOSGGOetWQTYH+ug==
X-CSE-MsgGUID: 49wUWrGZSV+kGbwVJiMwtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13510543"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13510543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 04:00:05 -0700
X-CSE-ConnectionGUID: tmqOeRqcRU2LcDhJQFZOJQ==
X-CSE-MsgGUID: FeraRFxRSr2VITDgt2vGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36060757"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 04:00:01 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4] drm/xe/xe2lpm: Add permanent Wa_14020756599
Date: Fri, 31 May 2024 16:30:22 +0530
Message-Id: <20240531110022.551477-1-tejas.upadhyay@intel.com>
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

V4:
  - Make it part of lrc wa
  - Check for RCS as rtp rule
V3(MattR):
  - Rename rtp api name
  - Use MEDIA_VERx100
V2:
  - Remove engine filter video decode
  - Fix typo GRAPHICS/MEDIA/s - Himal

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_wa.c  |  7 +++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index fb44cc7521d8..01c32a932780 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -323,3 +323,9 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 
 	return dss >= dss_per_gslice;
 }
+
+bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
+				 const struct xe_hw_engine *hwe)
+{
+	return (gt_to_xe(gt))->info.media_verx100 == 2000;
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 337b1ef1959c..24ee0e4cdf1b 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -427,4 +427,14 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_when_media2000 - Match when media GT version 2000
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if media GT version 2000, false otherwise.
+ */
+bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
+				 const struct xe_hw_engine *hwe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 64bc595fc727..321ea100a491 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -701,6 +701,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_AUTOSTRIP))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("14020756599"),
+	  XE_RTP_RULES(ENGINE_CLASS(RENDER), FUNC(xe_rtp_match_when_media2000)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
+
 	{}
 };
 
-- 
2.25.1

