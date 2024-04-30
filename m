Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A0C25B10
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 07:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C5C10E4FC;
	Tue, 30 Apr 2024 07:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gz61LvUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF4910E4FC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714462952; x=1745998952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/p5kbZfdG4tnGPgg1qhBaHOPsyVFU2YTzc/6HpyYo6s=;
 b=Gz61LvUN3zdEyVTUXzLTTJr7VcaSP2Fxk0BbGO6Ng+oDjfHCKkkG/koP
 uz1/mwyy/gsA4YKnFqhpSfzGoU7Vkct/DBZdLW3LYiCHJ2Jjj229PpPBH
 9j8PRA9xfIimLw+xVkKzCYd6L/U5UCI5yWMCHrPDq0wF2/z2G7KXBuDvx
 6vriwUYfP9SLBkGCu1jF98WoJfohdjnGg/6Bp4QHp2aQ1PF4C6t5MscjX
 hUEywFMB1Uzl0ZL5jXsf2NjwFLDPvMpsaOPK8tddi3luamEw9umeVh1hZ
 6JT7iAAIm603GNPEit+E456HtpNyEZUJ57LqIOx8awySeQnFOjvL+8nkN A==;
X-CSE-ConnectionGUID: IEoB1q7fSYqdlLx0HSYfsA==
X-CSE-MsgGUID: SfMEkmOdR3CVDfnFn1KcGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10003656"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10003656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 00:42:31 -0700
X-CSE-ConnectionGUID: BLTZngaWRPqG24+TnJjTfg==
X-CSE-MsgGUID: yFrWJwnsQLeOYj23mfWFhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="63857174"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 30 Apr 2024 00:42:30 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 1/2] drm/xe/xe2lpg: Add permanent wa_14020756599
Date: Tue, 30 Apr 2024 13:26:08 +0530
Message-Id: <20240430075609.2216291-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
References: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
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

For xe2_lpg render Wa_14020756599 is applied to
all steppings.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 134a34dbfe8d..7657aadf217c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -673,6 +673,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
+	{ XE_RTP_NAME("14020756599"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),
-- 
2.25.1

