Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC3BCED610
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 06:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD44610E65D;
	Wed,  9 Oct 2024 06:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhFBK8t/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E3310E65D
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728456970; x=1759992970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eaJpZ6Eoo8HMOtrJHCTvzX8trIxmea5hEdOVG1EIld0=;
 b=UhFBK8t/9e6RlESniw41WRiH4ZxAFfOul+R8nUAnK3tdgRrFlch69f9O
 ERaFcJL82873gFFGqMkZ/p14zwAyFNeXTBZwdqv5qnNrc4yBxOOlW7B/m
 p0/LjDVVFxHP4nXNxz3fG3weC8Q4LR+5vlSujgvto7/z6bnSUISwpohuB
 k1CkVtyBvk5OOHCceHKRDS6N8Yp5gc9yH2Jel4gubsHVcXgIxogqAhgoS
 rnSv4Cy/dKchObQyG/arbFmV3xEjmtLhhtWHdMcDxXz0YZ9F+n6QUJTV+
 OVDZ5+SE4kbRb9oZPRSRW/VlLE7FW9u6g2i3+sYuKP5BlaZi6G32F6ye2 w==;
X-CSE-ConnectionGUID: /TgX2saoS3Gx0Wu1OFXBrA==
X-CSE-MsgGUID: zmiQAvQCQti4PfeQhC5yvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="30612343"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="30612343"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 23:56:10 -0700
X-CSE-ConnectionGUID: DvtytHMnR6+9LMbN2M4UKA==
X-CSE-MsgGUID: 3PsMNIM2SLK4m/3/JZIJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80729094"
Received: from baradhya-z690i-a-ultra-plus.iind.intel.com (HELO
 aradhyab-desk.iind.intel.com) ([10.145.169.55])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 23:56:08 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2] drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg
Date: Wed,  9 Oct 2024 12:25:42 +0530
Message-Id: <20241009065542.283151-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add workaround (wa) 15016589081 which applies to Xe2_v3_LPG_MD.

Xe2_v3_LPG_MD is a Lunar Lake platform with GFX version: 20.04.
This wa is type: permanent, and hence is applicable on all steppings.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
Change Log:
v2:
  - Update the commit subject as suggested by Tejas Upadhyay.
  - Add his R-b tag as well.

Previous revisions:
v1: https://lore.kernel.org/all/20240930120602.1720218-1-aradhya.bhatia@intel.com/

---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 94ea76b098ed..df2abdfae2b2 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -711,6 +711,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
+	{ XE_RTP_NAME("15016589081"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
+	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),

base-commit: 0f1fdf5592259cc68ee5ec968c6cddb26d0ecf77
-- 
2.34.1

