Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E91CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFEF10E1A5;
	Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRlJVDs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506FC10E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412329; x=1791948329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0XYxr5T4pTKjHruu7YksshzCCa92RzG+YWCDCAFMS6c=;
 b=mRlJVDs8u+EBz9rFQ40sjCpQoVksD0c2nDJamZETRfl6U6YpD8Q8Iqes
 MdF9+sdJsCItXTZc8RDtckwJoBSoI2BqAq2kHKP4tKpKYjCWc4f35IVh+
 9jaH9tRZkmgYYQcjrac5GM6d3FXpGYxM2naCKbUUg/SZUxkHXku3GTQ70
 UtlzZVN9gcohHtRVpdzgsRNOX76sBNYnYSL0l+XIi4QgUoMwoiaedMFA+
 qOzigLxdghRZAmSHgH3aNYCAtyi3CKCTYX+xlJk3BGWkKlOoNKJrZSGcq
 6cWDh/wmXZchcZ6tqj0Cn0ixmMzZzFn1I+VK9ytfwALOlVYTGm0tRdr4I A==;
X-CSE-ConnectionGUID: KqSX5gbST7ScYP+iAsX+kA==
X-CSE-MsgGUID: cpd1QqvcT36iYUneF98OVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414865"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:28 -0700
X-CSE-ConnectionGUID: Ibu9sSNhThWHI6/ebhN9qA==
X-CSE-MsgGUID: VLqjZlPITNCr8vUH6/HE2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567265"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH 01/23] drm/xe/xe3: Add support for graphics IP versions 30.04
 & 30.05
Date: Mon, 13 Oct 2025 20:24:33 -0700
Message-ID: <20251013-xe3p-v1-1-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Add graphics IP versions 30.04 & 30.05 and initial workarounds for these
IP versions.

BSpec: 74201
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        | 2 ++
 drivers/gpu/drm/xe/xe_wa.c         | 6 +++---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 7 +++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 944c698808ace..c1e89689953b7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -149,6 +149,8 @@ static const struct xe_ip graphics_ips[] = {
 	{ 3000, "Xe3_LPG", &graphics_xe2 },
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
 	{ 3003, "Xe3_LPG", &graphics_xe2 },
+	{ 3004, "Xe3_LPG", &graphics_xe2 },
+	{ 3005, "Xe3_LPG", &graphics_xe2 },
 };
 
 /* Pre-GMDID Media IPs */
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c60159a130014..24b6d4bb0b962 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -684,7 +684,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	},
 	{ XE_RTP_NAME("13012615864"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
-		       GRAPHICS_VERSION(3003),
+		       GRAPHICS_VERSION_RANGE(3003, 3005),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
@@ -695,7 +695,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
 	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3003, 3005), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
 	{ XE_RTP_NAME("18041344222"),
@@ -913,7 +913,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_AUTOSTRIP))
 	},
 	{ XE_RTP_NAME("22021007897"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
 };
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f3a6d5d239cec..9aff2e56fd3e4 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -34,14 +34,17 @@
 13011645652	GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 		GRAPHICS_VERSION(3003)
+		GRAPHICS_VERSION_RANGE(3004, 3005)
 14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 		GRAPHICS_VERSION(3003)
+		GRAPHICS_VERSION_RANGE(3004, 3005)
 22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 		GRAPHICS_VERSION(3003)
+		GRAPHICS_VERSION_RANGE(3004, 3005)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
@@ -63,11 +66,11 @@
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
 		MEDIA_VERSION_RANGE(1301, 3000)
 		MEDIA_VERSION(3002)
-		GRAPHICS_VERSION(3003)
+		GRAPHICS_VERSION_RANGE(3003, 3005)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
 		MEDIA_VERSION_RANGE(1300, 3000)
 		MEDIA_VERSION(3002)
-		GRAPHICS_VERSION(3003)
+		GRAPHICS_VERSION_RANGE(3003, 3005)
 14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)

-- 
2.51.0

