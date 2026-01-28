Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23380D3567F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 06:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FE710E1AD;
	Wed, 28 Jan 2026 06:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEF8nETC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0AA10E1AD
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 06:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769581633; x=1801117633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=98j7sUI4p6f/m5NgN/f2QZclyiFHTZUvF4op8eoMqQY=;
 b=CEF8nETCbqekOnRzHcC5IuTy0GqtToeH4+kvewdb8HrVP0N/zNSfJS4T
 n3EHRcNvZznZ2rJSuN3DKaeiPNIrgGmj0s4x5iQKiihFYOS2WkfDdd86C
 m98Zi8SgZlVA23hC31vzVU+9rOa1Rb+QggXhQpXVqZpjMMJ2V0gXufD0N
 Nrl+n+qFIkIuO3GuFbtim/zzC9NaTbadPP2+OKMn5D+l5WCDno5mObMof
 3STvbJJqUOVSm8BFKuFZ/UERlMjnYjJYDSDg/HAvryXxD/mVr1NHH73Y2
 92GmhSwu+S1pluuMPAt3fLuq97vCWyfoNrzwlTguJxlhP8QZV2vDTrZYj A==;
X-CSE-ConnectionGUID: hohvdC0LTK+gzOQbcUzi3A==
X-CSE-MsgGUID: IKf8zGc5QHGVm8isIqELjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82216947"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82216947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 22:27:12 -0800
X-CSE-ConnectionGUID: 57Q0dyx9QqSzt2c5OQH/WA==
X-CSE-MsgGUID: qrG1dmZYTqiozYRb6jjCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231133969"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 22:27:10 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2] drm/xe: Apply WA_16028005424 to Media
Date: Wed, 28 Jan 2026 11:59:12 +0530
Message-ID: <20260128062911.1456539-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

Apply WA_16028005424 to following IPs:
Xe2_LPM, Xe2_HPM, Xe3_LPM, Xe3p_LPM

While doing this move the same WA defined for Xe3_LPG under the comment
for Xe3_LPG. It was wrongly placed under Xe3_LPM.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2: Move the WA under the comments for each IP (MattR)

---
 drivers/gpu/drm/xe/xe_wa.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a991ee2b8781..1e8d61ac581b 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -236,6 +236,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
 
 	/* Xe2_HPG */
 
@@ -262,6 +266,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
 
 	/* Xe3_LPG */
 
@@ -269,6 +277,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
 	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
 
 	/* Xe3_LPM */
 
@@ -303,7 +315,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 	{ XE_RTP_NAME("16028005424"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3002)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
+
+	/* Xe3p_LPM */
+
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(MEDIA_VERSION(3500)),
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
 	},
 };
-- 
2.43.0

