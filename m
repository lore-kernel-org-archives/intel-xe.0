Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA02FC5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8945210E827;
	Fri, 20 Feb 2026 17:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/MmqjDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4C410E82B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=19+5uTbC/894AtaaCr3gq2X8GMFNEnV01hy+9LVKVN4=;
 b=V/MmqjDgnrfplOQiUnztZRSJmUEQrPkCIqpne/7PT9Rfc1ahfXhDGjs/
 KfBgN+2w4hMyqL2DxgJN4GjvYFLwMorZRY5353+e/yUyrIebVpJxi/jAu
 47uNfHIZasaQ4AI5iWnofvwbkgrtS05+vf5PFALuzkA5nh/QGl1GtzoHq
 4JG44qkCAMHoUCU18wLarLIHVB5hPbCXtvHB9ew7eyGyzCNlhHXHLvQeF
 MR89xAd08sOJnR4637CXYjt6GTZlO6tXJEgIG/aZ+wK+5StOm2w3MD32R
 KYZX0Lh1BLwutcvRR/Oi4imPYK+mJy1604lmDLcHRmTHd5vmwNeKu/O6d w==;
X-CSE-ConnectionGUID: masMkp3TShSXEWLK9A+lpQ==
X-CSE-MsgGUID: mL5ErkYhR+CCABB/Fd+3Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606746"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606746"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: WyIwH/QCSUySBc7hLBpIRg==
X-CSE-MsgGUID: qkUQtyUrRQCPCaQvWksWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138721"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:39 -0800
Subject: [PATCH v2 17/23] drm/xe: Consolidate workaround entries for
 Wa_14019386621
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-17-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=19+5uTbC/894AtaaCr3gq2X8GMFNEnV01hy+9LVKVN4=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmuKGsAgQ0fo6xxLSrqilJhErMpJxtDZVA1O
 Uw7vVPxbiqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrgAKCRBNeSQFyHKQ
 BMiyD/0XvBUIfaAWPu3cMzVZ87acDFi9K9GVGS1k72cf0sIQh3gzb2750PCGnSjHwVEr3i8CPI+
 hSCajpbT45UKM4qv5HyRsH9yHaCBGiEztFvt4zFuVufwyN5iC+wdwZZF+SEFsE0SD7KZLaI77JT
 SaLKvJ4GiOxRjzzEOYO8EKMWDqYFswM95cIETEBNvsGMbR8B0hdCH/6BIXkRtMVl/pqXIskBOXM
 skE6E4b/loR4jQ6MShMt9FbIk3zCvQvita07ZfLNCb9uPewnV+adGEL075w5SfbvVMuoSQrtQiY
 rxWlZC0kbITbNfBGDAWXio3eb//9DO250akk4KjAJCpduupd7+/UaJTB2lqzj5EcfPbqX3OvziM
 /w9iHXWlZVER8hjT61La7pfiGEAslXnf+OubLSic0gSLcBk2q4GPMrPjcTFjJv/jCYDRUoobkwm
 JmTIvs76tqO74FjBjdNgb+4IkRiaTaMDlZUa1AKaaqHoL8bdnhzQKIvGxgR1x80VlfHijsh/gP/
 l6si3tc4WEYvpU3Qvg25bcxmjTEBpKw1ohh7wZSjiQBZqeYCTdfzs/AYU3hBFl/AwLRycyNs3q2
 RVpNos6wkpxsCzUyDHWSa3qqisVhdC4ijtBTFfwmzGRU+hkf9Kuz7naNMQV2rAwsSlpy+ZNlg4k
 uCaAwiMObdjpuew==
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

Wa_14019386621 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the RTP entries into a single range-based entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 21af997447e78951dd6d40c87454e8ef69343006..03bef11370ae589d1035cf2cb7b022fd173d37b5 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -641,6 +641,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
 	},
+	{ XE_RTP_NAME("14019386621"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
+	},
 
 	/* DG1 */
 
@@ -697,10 +701,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("14019386621"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
-	},
 	{ XE_RTP_NAME("14019988906"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
@@ -738,10 +738,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
 	},
-	{ XE_RTP_NAME("14019386621"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
-	},
 	{ XE_RTP_NAME("14020756599"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))

-- 
2.53.0

