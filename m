Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57213C5AD59
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C242310E833;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pzbrxmi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1F710E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=rdSsra5QDiWUML+26KjAQ31aRCT1OtXHD15w3fbrDMo=;
 b=Pzbrxmi5mT5Y0bfZom31y6uPEhdOEkNt4bEef9+SdhZmYZYFLYJ/lxDF
 sStQQg37zWDVWR/HzNFEvJNF3fq1igDtrURs8gAmKUyZ3jfzkinPqwT5Z
 SCOKVpF61aQE8thsCzLQVRd7RIo4UsvOJXKqzTxrrqCx1WGbhLZ8C068Y
 ydzt0LO4UNzWzQC9dYeW4uocMAlQkd0wgibMPcelEN5hUKqSwkOAxJIwR
 xure1hPNK5xY90Rr6y9siAIvvTmYEyYxp5uB2McZk0qX9kkxBHpzD4t8f
 TTQJShrQaxwmC6lh8Ex+KMLIszVO9XebwTlMvhV8/WJk3W9l06XS3mTaP A==;
X-CSE-ConnectionGUID: N575x9h0Ta+ZcHmgwIyKBQ==
X-CSE-MsgGUID: EntOlW3JTBy64cPwXFWCGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606733"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606733"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: nfXdaYX9SWaMnx8sd/hi1g==
X-CSE-MsgGUID: GupxwupmQPC/Uy7U/sIidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138684"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:28 -0800
Subject: [PATCH v2 06/23] drm/xe: Consolidate workaround entries for
 Wa_16028005424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-6-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=rdSsra5QDiWUML+26KjAQ31aRCT1OtXHD15w3fbrDMo=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmtjIEl9SPXYVf8OGFc4T03P6+rnRh8NZNZ2
 f8Kf44v+hGJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrQAKCRBNeSQFyHKQ
 BK9FEACeqXSdLvzq8FAuhWjZejrqe6SoTFm0Y22rK9b4OVrcPzGxrqA9asvL6Quf6uhEljX+Vxu
 kwxal2tiZrdphfG92CpgSkCJxjdYq7WDTq82dTJq5YQCYqwRFHnEDEqV1nASG8s6CvgoJbvHZGW
 xRo7+vEBc83gU6LPaVf2gjQgaeDTqVE3NeS5jzUkPCDUBHvZMP9ZiFCgmtYFd3tjpLzNlxhHwSt
 OfzUtanAwPAeKBYANW9Nb8nLMlY8K9OdrEVdoOWONHbJLUsSTs9inB2tVxnA3rLzzhaEtMTj8EX
 GIM+Jq/FQeeEeYv5U+IfLt/qx/AmsbIhGrH2JZG5CRSjsQIJMPXSvQpfEE/noM+W3yLZOKTuiGl
 HUMQLxWrwO3oHp1zWsro9Dk7DPp9TnPhU0FPhteX3GQNM57HpGjl30z2OhJDZugL74udXgv7eGi
 84h7WlxBhHzcud0bTRT2KGNIrom3FgucTbwn70/GxkAIEYYj4nIl5tn4V3bfK09uKWIIWiicyfN
 4MgDvGFSWJABk7B/KbSOnFmiy3TPkkV42FntGFHkfXbtidJwkK3j+evG9t50xqAWxUd/q0i6uTg
 abIVvDLUcI1mvZMD1kgxkHbqXMuHsGq1LX81kkb0e7dVb68ljtOxopFtNGvxHats4n6JIHSQmau
 +cR8RREDsywhzLA==
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

Wa_16028005424 applies to all media IPs from 13.01 to 35.00 (inclusive)
and all graphics IPs from 30.00 and 30.05 (inclusive).  Conslidate the
multiple RTP entries into a single range-based entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 33e7e33db83175953361ee13dd40af8954c6d838..4009323da8021cf5791a96e119b7b71b64eb4431 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -159,6 +159,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), OR,
+		       MEDIA_VERSION_RANGE(1301, 3500)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
 
 	/* DG1 */
 
@@ -239,10 +244,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("16028005424"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
-	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
-	},
 
 	/* Xe2_HPG */
 
@@ -256,23 +257,12 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 			     LSN_DIM_Z_WGT(1)))
 	},
 
-	/* Xe2_HPM */
-
-	{ XE_RTP_NAME("16028005424"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301)),
-	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
-	},
-
 	/* Xe3_LPG */
 
 	{ XE_RTP_NAME("14021871409"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
 	},
-	{ XE_RTP_NAME("16028005424"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
-	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
-	},
 
 	/* Xe3_LPM */
 
@@ -294,17 +284,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("16028005424"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3002)),
-	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
-	},
-
-	/* Xe3p_LPM */
-
-	{ XE_RTP_NAME("16028005424"),
-	  XE_RTP_RULES(MEDIA_VERSION(3500)),
-	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
-	},
 
 	/* Xe3P_LPG */
 

-- 
2.53.0

