Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9800C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 19:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBFA11349A;
	Wed,  6 Mar 2024 19:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVw0NT4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6FD11349B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709752868; x=1741288868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sBnCYwyZmEvYKYtui+HuVKHE8DwCovVp63n0TXLXrPQ=;
 b=SVw0NT4/KchsBalspL7wpAf+dMel6vTIZwTMoBE9vzjGGZTM1TuxYqgC
 RCIJCjizZlySTjRNuXsudfkp73FZu6IzjDp01bBUm34YRnStSufSADBva
 R/cz5PvXto9VaRL1JMITZfbqcyA71ElJ1u+vzQL284R1/m+o3nuN+rJAh
 umjvr1wgx53w2my2+E24RFNQAsE/CFgHMqK41VHfBrIClZpwp2N5GuqkL
 9Zb3/NpLIjj5HseHjtMt/a0IDuddT8P54hnuRdWrXFlQlw31ahn4glOZM
 aUWq3LcOQU5WD/bVARLtMEJQI+veJUbmcUCF9b2gIS81vD3kfKduICTrA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4235364"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4235364"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9775895"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:21:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe/pvc: Fix WA 18020744125
Date: Wed,  6 Mar 2024 11:21:28 -0800
Message-ID: <20240306192128.1895603-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306192128.1895603-1-lucas.demarchi@intel.com>
References: <20240306192128.1895603-1-lucas.demarchi@intel.com>
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

With the current state GUC_WA_RCS_REGS_IN_CCS_REGS_LIST could in theory
be removed since there is no render register being added to the list of
compute WAs. However the real issue is that 18020744125 is incomplete
and not setting the RING_HWSTAM on render as it should.

Writing this in RTP is a little more tricky as we want to write to
another's engine base when the match happens: first compute engine and
no render present. So use RING_HWSTAM(RENDER_RING_BASE) instead of the
usual XE_RTP_ACTION_FLAG(ENGINE_BASE).

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 2460c570e628..54740d246310 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -377,6 +377,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
+	{ XE_RTP_NAME("18020744125"),
+	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute),
+		       ENGINE_CLASS(COMPUTE)),
+	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
+	},
 	{ XE_RTP_NAME("14014999345"),
 	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
 		       GRAPHICS_STEP(B0, C0)),
-- 
2.43.0

