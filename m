Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFD0FB5EA5
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 04:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E60B10E16B;
	Tue, 17 Mar 2026 04:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQd5gkHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDFC10E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 04:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773720299; x=1805256299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Q13ZnRKqstSCObVdXHc+JIXefqT1AhikqJDp55PBfw=;
 b=EQd5gkHIiQgpTVi3yNFnWkqoj5A9RtCP+I8uwyDBFU90YGVACpdgjEeN
 Si/Uw6HEvJEO/MpWaA3Cv5LC7gL0ny/7HWvwGjOwoJBbNg8pWL1UXTXgO
 pSvsXZNZkDLb1d243QRDS717duos5JvgsmPJk5NOycQHCdfNAnIV/HBif
 p26OlynE/dg3WK/Ubegv2HRnaqc64GftVUGCOVep4LRtkyKtDCpKK2NTW
 uVu8e+TMDd1ds/991l+O+MujDotfyj5b7Iczul50NnFBr3tnyy8KWobR/
 7B8XfEhn/DoQWR4BBFS9FQuvB/bY0oRr2KqfC0Qd8tzsNGL1SSpAZBgIC g==;
X-CSE-ConnectionGUID: q3pdU/XLQiWAWK6L0izr2Q==
X-CSE-MsgGUID: 2WcWKsFBQeeI24h32CrLUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73924714"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="73924714"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:04:59 -0700
X-CSE-ConnectionGUID: 6yW3dyRAQbKf/Ev2JBh2eg==
X-CSE-MsgGUID: w5vMKIOBTP+YTLpCaCSzJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221368546"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:04:57 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/xe3p_lpg: Add Wa_16029437861
Date: Tue, 17 Mar 2026 09:34:47 +0530
Message-ID: <20260317040447.1792687-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

Wa_16029437861 requires disabling COAMA atomics by setting bit 22
(SQ_DISABLE_COAMA) of L3SQCREG2 (0xb104) for Xe3p_LPG graphics
version 35.10 stepping A0..B0. This bit is already set by the existing
Wa_14026144927 entry, so add the new WA ID to the same implementation.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d2fc1f50c508..1d77f5b6401f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -292,7 +292,7 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
 			     DIS_ATS_WRONLY_PG))
 	},
-	{ XE_RTP_NAME("14026144927"),
+	{ XE_RTP_NAME("14026144927, 16029437861"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |
 			     L3_SQ_DISABLE_COAMA))
-- 
2.43.0

