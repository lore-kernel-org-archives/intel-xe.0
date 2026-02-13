Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C7EF99EC
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6303310E851;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2kMVpGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71A510E849
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021959; x=1802557959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FbZerdTjcUHACtXN87JIS1YoGu2BO4GW6q3xBohhFKo=;
 b=S2kMVpGnKGH3a5g9ghiWrJjdY1a5pu/y8ha6mNq+RKxktUzmbz+kSj8M
 nEEMM6FD6hvWSNW7Iy8ZP6WfZv2RHD7OMjVfmegiODX6eXyQWe/8Sta2d
 53+nrCUZSJr+zzyk50jzDc/7odh0ocVByv2DINJP1vdKOuvfMQA9UTo3q
 8Gni9jrOKQI4TOsOaNF6c8vMZtWKCT7NOPij8BoLd1t33YE3j3/5RZdz9
 7hC7H4xjQTc+vpVLoDXmuqdelJxKZ0CG/uPnSk4Ry4J5uop4iCWGiI+Dm
 /D7JCDdhyMly1/dPaAdksliWPrh0LjQyyxUiOx2jKYfEZUgV8xAZm3Ury w==;
X-CSE-ConnectionGUID: xSSEDwavS6yzsUVl8/PQDQ==
X-CSE-MsgGUID: 3Q75lKwXTZiO0CChyIJTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654445"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654445"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: aLZuLXQJSImxM8fZSfeC9Q==
X-CSE-MsgGUID: H5F5r4sxQwaQQWr+f7GYVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705671"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:52 -0800
Subject: [PATCH 17/22] drm/xe: Consolidate workaround entries for
 Wa_14019386621
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-17-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=FbZerdTjcUHACtXN87JIS1YoGu2BO4GW6q3xBohhFKo=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aDqf8cSKbdC4FgjaWF4RCqGI8DCDgsmSJIy
 +cUhW2OqlqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgwAKCRBNeSQFyHKQ
 BL86D/4hqbbP7sdjSh9L5CjOuaWxzBEr61moKwL1qo45c47upnoqWJnAWKMLZ3bLP/xf97m8zR7
 6YZ7KKsDErTvSkPQB7FPXN5QP3cD9teTMwV7L3XP7nhTcIVjnnArQq+2x+H/AhBkxYLUkl2eWMy
 vwWYFFG1CeUVlOMBo6mZ3fPlDXfMLD3mUxWnQP6pc2+0uBCZa/mkCpKeEAnG/tU9dPWQ+y/9eMm
 puP7ZoC7YmIs0YcBGEpZkXuew1NoRwUmdembMeBS+/N1YVKaRfbPjMSlS8cqLXd3Ohvz65jUdHY
 WwoH+eCeeP6ljId15RdPh1u9DBZTnGHZOT33izZFwaBtsWrghhP9WzcKXFd1ZHGqRm6cirx1vnu
 fbLVxoHg+B2F1kvvocMtzaHji6VVkZGShS3NC7mDl/qNh+7rI2xDyKoc/rjKdtjCMdzgkuHZkwn
 H4FI1MgDuqLrIyaAbzt0hwhdTv3srkdFfR4HiLsDluKcCGf+HTpc6BMWeU+lwfWrCJu4RT90qoX
 WficBACBMtv7dL4c4d3e3oz7Z1hMjoSSYOnlQdupQ1A7MlqhySVWvHOiiyD0AkP/2tn2q+V/tXb
 RI+zMy4yqzOKewaKr5RXFxsEsb8imz/FYK+yxmtk9MM9CxcbuFe5fRzuw81qDPorZvBPsXaLzzp
 fYLSvbigMnZ9/iA==
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
index af1cbdc1d273576ba4500e5b863f26133447c7fc..63403ebfa2a6efad6e589dcd71b397f17a83c3e2 100644
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

