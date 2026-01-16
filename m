Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB7C98308
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADEB10E0FB;
	Fri, 16 Jan 2026 22:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dczREjzA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE8010E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601563; x=1800137563;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=DvBrkL4cU5gcaayTw/6iHl5Sb0Aacml66nnFgXYHs5Y=;
 b=dczREjzAqwxrUA/Z/7qbAfMrjbGBR+MIo8npIVcZ7rQqyL1+fsQJMo7C
 tfwTHUAeY3BgnTWLjkW3oc7XGMTVtO3HP82Aq2c3j3gm5Dj76kPWXQ/CE
 DMdQVXPmHyfqKXRYECPsJJRmGxe86QG+fAJJFO7FfSV5JeOBI5d4ecMoI
 bCpIcTp+JmJTxOq8vODBjk4k26Q8Tol/a21KP0WYqqYVrmY1fjOTbDPAF
 fSQ0nHTv7x1zmKEylK0hdiw+oYoubhHq3Hzvv9fv/pWTBvu9AcEPbLguP
 rqV07ZSi1JLKnF+q348hU5/gvOka0eMorTt2TkiWc9B8BMhpHuFDH4z9r A==;
X-CSE-ConnectionGUID: DwJRDjUmSZKf2UwXF3yCjA==
X-CSE-MsgGUID: IO2PoIeKTquxjqzjBMtVKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123019"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:43 -0800
X-CSE-ConnectionGUID: 0oEQZN7GQiqoREy9KzRLgw==
X-CSE-MsgGUID: 3BxNHlWgRA6kRmPakK7B4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961775"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:42 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:10 -0300
Subject: [PATCH 02/12] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-2-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The register COMMON_SLICE_CHICKEN1 is a MCR register on Xe2.
Let's make sure to define a MCR version of it and use it for the
relevant IP versions.

Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.

Fixes: a5d221924e13 ("drm/xe/xe2_hpg: Add set of workarounds")
Fixes: 9f18b55b6d3f ("drm/xe/xe2: Add workaround 18033852989")
Bspec: 66534, 71185
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index bc984dde2773..d4a1bb1edc9c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -145,6 +145,7 @@
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)
+#define XEHP_COMMON_SLICE_CHICKEN1		XE_REG_MCR(0x7010, XE_REG_OPTION_MASKED)
 #define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
 
 #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a991ee2b8781..a91db59a3d0a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -794,7 +794,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("18033852989"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 	{ XE_RTP_NAME("14021567978"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
@@ -852,7 +852,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("18033852989"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 
 	/* Xe3_LPG */

-- 
2.52.0

