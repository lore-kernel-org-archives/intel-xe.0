Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D47CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 13:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBE71132D2;
	Thu,  4 Apr 2024 13:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMxmXrfo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B57510E779
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712237561; x=1743773561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VCB1nAU6LqrZ20HkV8/jbEORtHUnYzJrztnEp/Xle08=;
 b=WMxmXrfow2EaN3g07EKfTsW1VKdiRnOc3AXBWCM4i4NFLImgRU7QLHTN
 8KgWmXVMWpMw8Wja4IM71VhN0WQ1bP+dyCa9wbwSKKxPz0aWrI3be3lLe
 5YGdxTjdY4M/st+zcAxSlFX1gGnpJYYxVllw+oJNWLO3m/nCaJR6IDcVx
 hcvZOpzKK/SL0n5HUi3qij8FAuRS4am7Rm01eORfAFgz9j5KFuOX0rnur
 UQpJkDFZ732/Lzq5Ai7l/RU6n26Rro2Qkqpjs3+slzhWV1Yn9Q3JM/ehS
 dk58zY0nwVUGVPUe8nLPnNSwF4iNVlwOesfXUkirDUFc3rt9Zdn3cLgpC g==;
X-CSE-ConnectionGUID: m09BOsg1SOSAWJgefx8etQ==
X-CSE-MsgGUID: QdHBwWuAQuSrozQqflJ3gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18648654"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18648654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:22:24 -0700
X-CSE-ConnectionGUID: GQCDrnDUTnmlV8frBPvyWA==
X-CSE-MsgGUID: jxo/IT1yQQqtwOvgozqgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="49941590"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 02:22:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2_lpg: Add workaround 14021567978
Date: Thu,  4 Apr 2024 15:05:29 +0530
Message-Id: <20240404093529.734251-1-tejas.upadhyay@intel.com>
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

Workaround 14021567978 applies to RenderCS xe2_lpg

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index bb6db2817ada..cc65e5b4353b 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -93,6 +93,13 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 
+	/* Xe2_LPG */
+
+	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
+	},
+
 	{}
 };
 
-- 
2.25.1

