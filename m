Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3BBC2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 09:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6B10E1BC;
	Wed,  3 Jul 2024 09:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnSU5arX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F4910E1BC
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719997622; x=1751533622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=meYEqq49alTjw2h8V22X7ISpFrTCgjSHi530yQ45DcA=;
 b=fnSU5arXo5kRnxH+dr5mgEJwDPoOGn1sEwNiA3EjFuiVRA7UOkMxRZaA
 xwx3QH0l06W7CTD9EfmLubdAq6TwwbrwS452kWxGrqQ0LEpfravzlz5co
 gsQC++xxUpl2NPXkqvSxoIXkhQP1GMJny/wTNZjIjgKbtmYY2VZxN1zwS
 63+OGnvvN4EAhX4cmYr/SmyKzCfJmtheZEeMXPmy2B2jBmve2Giu/6h6w
 ptEOVpNGHmZKVfHSNS+1B4N1tN2TTG6HudGriaZdfPUVYQ6E2oPJebn+e
 jRoxYwKHKOx/NVrpOSYlQ+wK4h+olyp3QI9U2gzxDgPoJwAud4MNgvap2 A==;
X-CSE-ConnectionGUID: W+aOUrpeQ7emWSMKjDL/Tg==
X-CSE-MsgGUID: pVURu49RRJGvj3hHshXeYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17348489"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="17348489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 02:07:02 -0700
X-CSE-ConnectionGUID: mXJxp/VJTMSO1ZRhShp58g==
X-CSE-MsgGUID: M9EAthXOSgqQ7CWK71a2zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="83739633"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa001.jf.intel.com with ESMTP; 03 Jul 2024 02:07:00 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe/xe2lpg: Extend workaround 14021402888
Date: Wed,  3 Jul 2024 14:37:54 +0530
Message-Id: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
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

workaround 14021402888 also applies to Xe2_LPG.
Replicate the existing entry to one specific for Xe2_LPG.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c7bf0862b231..91737d7a483d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -486,6 +486,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
 	},
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
 
 	/* Xe2_HPG */
 
-- 
2.25.1

