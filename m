Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254DFEF99E5
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AD310E844;
	Fri, 13 Feb 2026 22:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqGuqPYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0910E845
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=25bdJMHHbSgkHsm8d2EpUQyjx1oh+hoi7HuJPo3sZZ0=;
 b=cqGuqPYz/+r9YAgrosVWaV36S2BoZ9fWNPQWoNsUQpg4EhqGh/cNVQYZ
 farFnx+ewtcxcfwVg697Q6MgQkvZXDI3lAcuWwDubD6Aw8t9QS5OTRLb5
 EG1nVw6EkdKZPvHfHlWMXm3+KuAUwgDP6xEKgG1VanPLtxthc014HQZza
 s74mGcQsDkcDzGaq5qPUGrYAuW3xXmMLoR4NnpbGzVLWoaiFxn651A6es
 s7bNofeGgv1X/vJdIVSc47z4xvUpfAY2ILIvW2SrOk1FpEuTpLu7WjBjz
 jM2IXxtsbwvk0RbWYJM7KgbMXlimznAPBCB+ARigSysCNV+6REIriIQVY A==;
X-CSE-ConnectionGUID: DHtEmEiXSoOr4zXx92PdHw==
X-CSE-MsgGUID: pY/wFrEjR4C3zyHqeSobig==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654439"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: +an+3YIiSCGqcj25aJ0T4g==
X-CSE-MsgGUID: ehRNFuwFTwKdn0Wgapj5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705653"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:46 -0800
Subject: [PATCH 11/22] drm/xe: Consolidate workaround entries for
 Wa_14018471104
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-11-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=25bdJMHHbSgkHsm8d2EpUQyjx1oh+hoi7HuJPo3sZZ0=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aCqKxtztUll5B+wGS+JTR5YfUk7mJe70Xit
 W503BnbdM2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mggAKCRBNeSQFyHKQ
 BPWdD/4iVE9nGDOC/MjRpxQaiKEF4/zVOGoblYlyrY1ksqwsjNgok3WYYJ0dFiapOD+b3h7esMO
 ks8SYUtLCr4ltzCjSX0ffCOTDF78S4IutvU3K/i7r8UA2diujaTM0vdth8dYS8APJg6FrhSkGL5
 51h0lxb9Tr6b+tPsl3PIDnaNtFhVUzUziotO+XIIjfBB9UbTM/7KjVrNUvZgqs4DVDjpbIBtNwx
 r1HckhHyxkVbaoZKCB8eOzW49hoI6ftv8JgV1tDo8gj9+WPyEPzStp579TUTZF2CCUVwj6GFFfU
 F3XK2pPq6RuMAPUKVVLlmd7i+6pfxAEP8BJvXuyoN+N3PwJVTkQex1fFlfsGWseBc27Z4787GDk
 t28bS/5KUwcfQaatkzAo2VZH6/2sJbZtJo1j/KPa3EeO37O16Wtv9md5W6shqkzE8wQTrTMroug
 VAvnSJHYqjtaWCWClQ8BPUvrBs5dbCWvMu75rwqAwoDDCXheJbn+QjHyP5sthGX4vyNLEzuxRCz
 AvT0O/cVbVyYWUgmqQwl+OqC7KSinMQn2C0TQ73BIul9yn4Xy3+Fh0FsiMthWc/JCey0iKGpuKr
 vW5qg55qKEuJjfIjQMJqgbmGiDxsTn0DxyAA0M9suGr+zXiyiOgegBX8WMzibnLN86k4oCGs/iu
 BeCPUQ9udT1nJ4w==
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

Wa_14018471104 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the two RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 370edba9e3747d63d3b0c76a09b5ee64da66481c..e5b2424305ac5ec4ecd193038ca6231e8bc81fae 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -358,6 +358,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
+	{ XE_RTP_NAME("14018471104"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
+	},
 
 	/* TGL */
 
@@ -500,10 +505,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
-	{ XE_RTP_NAME("14018471104"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
-	},
 	/*
 	 * These two workarounds are the same, just applying to different
 	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
@@ -539,11 +540,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
-	{ XE_RTP_NAME("14018471104"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
-	},
 	/*
 	 * Although this workaround isn't required for the RCS, disabling these
 	 * reports has no impact for our driver or the GuC, so we go ahead and

-- 
2.53.0

