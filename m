Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D70C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B11F10F2FA;
	Fri, 26 Apr 2024 09:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScqA43F7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BD810F2A6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714124177; x=1745660177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bubd3p4lqfOiG0Gd4SyHc00lxuvGFnbdnwzso8QsbP4=;
 b=ScqA43F73OhspvV421ZAxum45sgZugoZZfQNKaB9AVV/A7S4VGyaMwwP
 +CaU5aqRS/9RNoRcFkoAJ18ZK8jDE5jwwVWpQ7h2Fk+1b09bO6EDqt48f
 OYU2YoyJdKFbmZXVkF8l5rJLFQEmLbVsT3Wlv14jU8X7+Zky2yTUc5FlM
 EoUzNP7zdkUxSCemdCkUnoFBCyB5IZMa1mHdW+nQymrqxZidcAgi7xS0I
 mw4F4Qvw0x6jwbnJvgrnMUDz2FzEK8+KFMBILudc68UWLsPJnOVwZ5duA
 5EwwznLnViJdwUbCfxGDaQQUEvLtiAEakZ1acIKCwOKt47B41E6a/B6Ix g==;
X-CSE-ConnectionGUID: S/8NMc4vRD6UM2cLS+i1nw==
X-CSE-MsgGUID: DGXIfX4ETmWGGUjzOzZCBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13686909"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="13686909"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:36:17 -0700
X-CSE-ConnectionGUID: oQpbrd+JSQugfxu//OfgPA==
X-CSE-MsgGUID: 7+RaTB0RQO+2dr+XxU4sSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="29830351"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2024 02:36:16 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Date: Fri, 26 Apr 2024 15:19:47 +0530
Message-Id: <20240426094947.2039436-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
References: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
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

For xe2_lpm Wa_14020756599 is applied to
all steppings.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c75946e70d84..d692eb69f231 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -697,6 +697,12 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
 
+	/* Xe2_LPM */
+	{ XE_RTP_NAME("14020756599"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
+
 	{}
 };
 
-- 
2.25.1

