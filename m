Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5460EF99E3
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605E110E327;
	Fri, 13 Feb 2026 22:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QB/HqBF3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ADB10E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021957; x=1802557957;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yP7D3vk1jtu11JUrJSpu69wL729NBiQ7CRz1hHullrE=;
 b=QB/HqBF3aTL5x7qV0JRCuJfEcy72wVc368lok4Twjug2+fKc3xvrPwVe
 6OnXBdrOnRZqfhwINDUsGqqai4Flb4BfxefiHfkACBya6TApvdkFOgcQx
 3RhS3lmjMVSAKoSyLs27oiaKAzYLVkUG/Nf0rilUYrPGpdWMsa5wJvV43
 bMWM7xztx/4ageajXS8M5GdL58b0XQJpBMenASP28eG3pxsQifmzyZGOA
 IXsSMtfSA5mQGHu1+6AqABsTJIdbpPqg71EhhBmR6zIWvZsbmbA/fmox9
 CcGJ775PQykdumYviUmZL2j70hyFcHH2T5Pfrt8A16Z7kYeuRC3tVU8vd w==;
X-CSE-ConnectionGUID: zGdXy1oFSm2MFd3dCUxXXA==
X-CSE-MsgGUID: Yz1HwGs1TJmfk35szdQe2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654433"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: To/hDalHRv6oc6TzLlfXHw==
X-CSE-MsgGUID: X6RpqbL4Tr2vnsXG8f/inA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705638"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:41 -0800
Subject: [PATCH 06/22] drm/xe: Consolidate workaround entries for
 Wa_16028005424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-6-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=yP7D3vk1jtu11JUrJSpu69wL729NBiQ7CRz1hHullrE=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aBdqYnu4sVmqza+OlYPE30Kmg3f2kjgMZH1
 7/+g8JbxreJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgQAKCRBNeSQFyHKQ
 BBLXEACSjmNKLeNvLAyV0eAeO29U2pac+NGYUXWUMro8ax4KsPcuRI4PxBVap/ypDiDs9aMj0kd
 kmEN4cHib8SfEv2w2MXMXCYmRMu7tpqAc4/nRrfPxKDSrzmGSbngTug0VIVJtcQ0sOCI0JozLO/
 P4whJqN6O12J28Is8a0RNLSlbMGM+MfELzF9klFvkBesgQ262bAYyjSnhCJsvAfl30H0T6TpQde
 QMSqZ+aG5OXkLXVK4fcgKzEoeio2OKzsZH/QuKS3LeuAVxTLWmbPQLkIlYaqhSc0OAUIxmclfip
 jMKBGsnPZyqJQ/Ii48IxCnl5DDb34Q5TMjgtpOakBTlZJn7OHXChpJOGkcBaxW5g+KLhCzZDode
 ruo0m0PTsyi+ijVGAaBFOcAkS38m4NNop2WHbnLYrRw+EsH8TkceOqSxD6YPyLFRBd9SOh/tb2s
 uriMJpbBZDZ+enp5rLsJd4x1Df1P8G5P7y3eijKDZ5LzVPUJ2X4cGZjYV4OOpuCFb8gGfDL0MOE
 w1ysy5g9I+igcoLbLUHPYqg+QMVNoouwtEB+CR7Y7WKDW8s/hfeSz/5KPhJlCVK/UvFJ5763Ugn
 WiuwpPJdGTTmXLu1YswYrCpjP0IRXuerYIkYuUx+hRor8JMB3DTVtl+TxgDsmnkoj35ob5kvabq
 TbVfni+Z5kM/YQQ==
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
index 200ce2db8adc80490845724bd891f01a0fa7e859..095e8e77595554470bd249e4c69809622c4cea75 100644
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

