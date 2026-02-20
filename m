Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43777C5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0567F10E81F;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uh/R3www";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F7210E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608496; x=1803144496;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=sdsyZhg2ssolXuffLwCVf9Ku2lMZm2vRacWRd+X7wXM=;
 b=Uh/R3wwwmOxeGsNToBHoCJ9UebQX4BkH7gyPpo2vU4SMk6WFOcUT5F56
 u1Seihi3Pe/G4p+/XHrVlpfZeQXdk3M1qhiHlV4NpJKVAH4PkeUKA8CIl
 /nbAPKRe+7flwdPRwoBGKLgv0BSHR+rdsbJBhs09LqrAsdv1XuoevII2i
 tCS7QHV1o54WYEStT+ZBthc0sEryb7wSlHrM8ul2xz76ieKJ49hYFPUBF
 aC0dmx/kd7yVuNSiR2vPTImZUBG7qzczESJvgbFSAy+NR3jA7UFCpbj1b
 mvvaHD3+GVFF1e84BNTbl0ablmybUG++YIfVPZZww1HPr1726J38Cddsv Q==;
X-CSE-ConnectionGUID: zHmRFbTYR5iPpVueuHJyQg==
X-CSE-MsgGUID: lBvW3rY+QtmwCJwC71mmzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606728"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: cM4q/OnwS/KxNK0fSFafqQ==
X-CSE-MsgGUID: Pjn3trDuRamvQL0fw6l1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138666"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:23 -0800
Subject: [PATCH v2 01/23] drm/xe/mtl: Drop pre-prod workarounds
 Wa_14015795083 & Wa_14014475959
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-1-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=sdsyZhg2ssolXuffLwCVf9Ku2lMZm2vRacWRd+X7wXM=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJms5z7kKkkYl3yKlJQ5mnydwM8Z2tVBX/BRq
 FXqkmZSn6+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrAAKCRBNeSQFyHKQ
 BOLEEACdftzud0KnervVWiwIXQOgRt9O7HpMgcYlX1jW/zjy5VXiAYBSzbF1kwz6PoiwUEn3HDh
 +Eznle6aYAuvGDaICSNM/+wO/SYAeLPbmCbYUlsl6EyDL380MCPttl7d/E9O+hDm1B8hl5KXQa3
 BWY+vsTVbAtZuo9ELuOc3+g+/StyXZM4iprD4hj1Nd7CDvMA77B/lAys2zqHwPYOxFzWg6Nbx7Q
 WuQDN6GTdDXDIExmA8LUvbwuKaKerUW7BAqYGZXGxMIJhwxzVY7v4TpWF4grwDQY+8jzLsMvtrl
 fp6UUB8EVRQ0QmazJ3z+zKOUxWKagCiwLPu0VKYRzwFj97jnxICAxLozRmQmYhpL1iU1Qr/WYGf
 yXzlyLCL6/QMpqojFzlCc40zJhWw3E91EI9HBpTUBZ11EQFFR/pO4yM9vhd6dYCE8vIZhpE6qaL
 Dthd5bmz9NLxyHo9yErczLeBczNuevyZJ6K18MhHr0OqlSIrtFCJRkLkVoWA9fx53z/KKit+YIn
 SrUZ2HRmw7u4XMlj1n2grHRj0zENAUlb9ysk0Bbhca/ZJzLHHIebNRzEIMN3FHqpkqUZs7dw/T4
 YmJTJra4wUDNXvG1XUBaEgKErZFdNNjoZTWfslERgjhIhh1K7Yjh9FyCga5MKrkhw6P4TNfgTHZ
 /xCUuSccKci4cCA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_14015795083 and Wa_14014475959 only apply to early steppings of
Xe_LPG that appeared only in pre-production hardware (in fact
Wa_14014475959 wasn't supposed to apply to _any_ steppings of version
12.71).  Xe1 platforms already aren't officially supported by the Xe
driver, but pre-production steppings are especially out of scope (and
'has_pre_prod_wa' is not set in the device descriptor).  Drop both
workarounds.

Bspec: 55420
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c         | 4 ----
 drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 76fa6d510aadb91169170ba35f65390c477a569e..aa5755bcdc04a3ec2569ab9676a9dd95516f1711 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -191,10 +191,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe_LPG */
 
-	{ XE_RTP_NAME("14015795083"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
-	},
 	{ XE_RTP_NAME("14018575942"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
 	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ac08f94f90a142629545c4964ca0fd3f9cad6aa9..cc988f2a18d33365dc09d32f4e85ced01b823877 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -2,8 +2,7 @@
 16010904313	GRAPHICS_VERSION_RANGE(1200, 1210)
 18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
-14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
-		PLATFORM(DG2)
+14014475959	PLATFORM(DG2)
 22011391025	PLATFORM(DG2)
 22012727170	SUBPLATFORM(DG2, G11)
 22012727685	SUBPLATFORM(DG2, G11)

-- 
2.53.0

