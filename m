Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9D9FDEE56
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4285A10E12C;
	Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1PeZwpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A12610E107
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984549; x=1808520549;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mz7POA9TjL4aqwQAFb5M9IdgvlI5PFWzpmp/WsOYeng=;
 b=b1PeZwpuuSZYlDTVNHN/F4Q5HiKtRxOEtFHRmlCPuEut0Fym+mEyWI1D
 SgYpqUuCzDcgMkDI+kvFF5/kB2tli/ZNvZ5+5fjWZ2SRBXB7tH5KchL6D
 UEuXzbw2EIKydqqnG9HOInARksvXgXVNRqFyJ9IJhc3D3wHJw9O4OG2Af
 /KEO/PZDY1raZ9qHGiSN5CkOb3VR5VAA6gbYkR1LWHR7ZYDl5lOoF09AL
 O0dDsUM3ANr8HPwo1f6TPvqtUp8bBVnXW3cH29KF7HEmQLXXnSAdOR08m
 krXYIt/LvWZ4AyN5sogOle/fZ57jHwVK/T0syVDch4C1cK1buOq65jU9/ A==;
X-CSE-ConnectionGUID: 5LAjHH+zQrySA8socwaXnA==
X-CSE-MsgGUID: XOV1lVNPScSS/xIGjiLfmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497067"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497067"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: Lp/+hNZVSza1bzHWkQgWhQ==
X-CSE-MsgGUID: JMt+g/obRdeGyTnQN+F/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696193"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:51 -0700
Subject: [PATCH 04/10] drm/xe: Move HWSTAM programming to RTP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-4-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=mz7POA9TjL4aqwQAFb5M9IdgvlI5PFWzpmp/WsOYeng=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHeg+vuoVYsdEAZcIpapqM1yZmYC/MKrGfAM
 8hqypmX7bWJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3gAKCRBNeSQFyHKQ
 BEKFD/wKiPpr8G+QWAdVHB1+0jEAN9LrJEcM65Hb77fRuXXzAY3qnO6JywcgrPYSWv/jhOTrmqY
 fOsv8l5ZJXnyLvcFi+5+yv6/6Y1A/6aI9p5X1zsxbUtkbXjX2WybObJaGd+096jFv3kVM5KD6eo
 a/QXoAYbBG3uTMqXXAj9yXR4lAQVfcs1Ki8BBoLfF7C1edE6KwwiwvouTWUSdXqO2SOee19E6Hi
 h33zz5OFX2DN6JNN3R05LipSde8J40Yl/drWaXhjVRwU9elHVLBbamW2igg3CDi4/pIrlcqUkR+
 /a/vTcTOYq600cVDqSNUfWVh7SYvOFI4WqQc9Trz+ib5rfhrVGajO9jgiFWatumwpcHteOGjop1
 xu3BvTa3xXcAKfjgFQpuQrV9iHLkf5oDdaTOxVdW1JwSTEkVekyEjzx04MDiVjhCq6liUjaC4Ed
 MZrqxHDD0emem5INOvHfKYQFItITwG/xRxrs17NW8Y4P9JygRQfQPyWjEppEWp3n7Z2LnbIFHyW
 tyK5zAiOL2O8iJTXGkAMwKkBFidVXyvZY5Dlf/1T0LnYl+DfowfaHG29u51/YHIt7dCV9+vwEOG
 ePjRYpNItOM1sMkIx4qNP/w1XSKEzwqbfY/I51sNE1glkyPcb1VVRYbwR3Enzr16O/X5Jpg+vK7
 82XHCHW3HRc4Uqg==
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

The write to RING_HWSTAM to disable hardware status page writes on
interrupt was unnecessarily open-coded in xe_hw_engine_enable_ring();
it's preferable to do such programming in the engine_entries[] RTP table
since gets reflected/verified in debugfs, and will also automatically
ensure that the register is properly saved/restored around engine
resets.

In this case the HWSTAM register wasn't explicitly added to the GuC ADS'
save-restore list, so there was the potential for the value to be lost
on engine resets.  This doesn't seem to have happened in practice, so
likely the GuC firmware is automatically saving/restoring this register
on our behalf, but we shouldn't rely on this implicit behavior going
forward.

One other slight change with this patch is that HWSTAM will now be
programmed on the vestigial execlist (non-GuC) initialization path.
Since the register's default value is 0x0 and the documentation
indicates that it's only legal to leave a single bit unmasked at a time,
this likely would have been an illegal situation if the execlist code
were actually usable.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 62a47d7e3f02..06eb655a4ae5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -327,7 +327,6 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	u32 ring_mode = REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
-	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe->hwsp));
 
@@ -437,6 +436,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   ring_cmd_cctl_val,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
+		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+		  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		/*
 		 * To allow the GSC engine to go idle on MTL we need to enable
 		 * idle messaging and set the hysteresis value (we use 0xA=5us

-- 
2.53.0

