Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001C8C27C44
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 10:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC3E10E1E8;
	Mon,  3 Jun 2024 10:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+V21f51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04A10E1E8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717411771; x=1748947771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7m4kConaOrM8HVA5M14/za37CHm96RBefoMPvnDSbtw=;
 b=U+V21f51OyKDuFbb8Ryq31Ut35qPoIhI3sZSWsNZ2FQmNoc9HCqDUAEz
 CNBWDnKxRiuDKcXZ0CoeAprNgxyyYhfCQat7GQEAxj0fhuPQ4Lcb93Zps
 s/SQlgZgS3WvmHrLsfMIfAhR2y2U/c+Kw1QZ66hqmPuO3lNt1TzKtsQrZ
 ZXc1tP2Xt2LT09udW+zjQlJyaOHJ1WlQDyBoOUzGR4p9+0aS49CSTCPa8
 0i5YM6Fg+k3R8XjR+QGZ3kcZMLd15RMVE5sw9f28vYsmmDWK3KTF1azrS
 MREG8DIHtfo3rFazagOGVe6IGd8qJ6TkxJIGVr5u2Mi9PGL6ygDprULln w==;
X-CSE-ConnectionGUID: jp+qWBcMQfeJLRaI9sq9uA==
X-CSE-MsgGUID: l0NsOaIzRQm2J/r88hhwiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13645866"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13645866"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:49:31 -0700
X-CSE-ConnectionGUID: dLzgEflZTeujSOGTtkpCZg==
X-CSE-MsgGUID: d1sAlkkbRt2QhMZD0yxSRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36827138"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2024 03:49:29 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4 2/2] drm/xe/xe2lpg: Add permanent wa_14020756599
Date: Mon,  3 Jun 2024 16:19:51 +0530
Message-Id: <20240603104951.705603-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603104951.705603-1-tejas.upadhyay@intel.com>
References: <20240603104951.705603-1-tejas.upadhyay@intel.com>
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
index 321ea100a491..26b170a0cdc7 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -677,6 +677,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
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

