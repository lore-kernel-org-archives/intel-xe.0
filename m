Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EFBC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 05:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B903910E569;
	Tue, 18 Jun 2024 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeL6vfGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B795C10E562
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 05:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718686856; x=1750222856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DBmEfhgwrxwp2+w+BmccWHfubXKeIAvl6Ew+coYkY98=;
 b=JeL6vfGcowrN7CNJYEeONkgQAMsq2pHpcj+GwKHKq8h0e77HI3sTp8XC
 tfSoOmo1fB3Aj+osfEVRJdnb6tZrKMMBuwKzfSAqHB30mjXjvjFPPW/sE
 NyHJ2qDRjMgSvVLKIF5Qt1wX9/9o8kIibkA457y3aujD23nrNszoyTmtD
 SwPo658yYY81an14JAWioHWF/vRqUhUEYvdej60xaxnfRUBmHr50mVJjA
 X5EuHAc4nr4XXv+Tujtp+jrF8Hp6UzHzW4r/vLxhtTa+gty2BY52g4n+H
 Pox7MK8fcBX3kZGLLdFpYm1T63Xrh1pJhWRKoNoNpqSYC1vW/iWD2Tkud Q==;
X-CSE-ConnectionGUID: 8uVMnTHtSe6HcAWtsNSyLA==
X-CSE-MsgGUID: U5JEqrRfSIanoJ3EV08GBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15256604"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15256604"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:55 -0700
X-CSE-ConnectionGUID: IbvrHHV8TfyOza1fbUna+w==
X-CSE-MsgGUID: G+dIf4RzSlCDBeVvfwr+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41537747"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/5] drm/xe/xe2: Add proper check for media in
 Wa_14020756599
Date: Mon, 17 Jun 2024 22:00:44 -0700
Message-ID: <20240618050044.324454-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618050044.324454-1-lucas.demarchi@intel.com>
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
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

A temporary fixup was made in commit 24d0d98af1c3 ("drm/xe/xe2lpm: Fixup
Wa_14020756599") due to limitations in the RTP infra. Now that RTP has
support for OR condition that change can be removed. RTP now also
supports checking any GT, so use that instead of the more specific
xe_rtp_match_when_media2000() used in that commit.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a2725a150441..0b6fbbebc41e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -677,15 +677,9 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
-	/*
-	 * This WA is also needed on primary GT when the media version is 2000.
-	 * Currently, media version 2000 is always paired with graphics version
-	 * 2004, so just checking the latter is sufficient. In the future, media
-	 * version 2000 can be used with some other graphics version where WA
-	 * still needs to be implemented
-	 */
 	{ XE_RTP_NAME("14020756599"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), OR,
+		       MEDIA_VERSION_ANY_GT(2000), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
 	{ XE_RTP_NAME("14021490052"),
-- 
2.43.0

