Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71302C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 10:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308CD10E5F8;
	Wed, 22 Nov 2023 10:49:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E337110E5F8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700650181; x=1732186181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JANZ1BxAz/pcCwPtm7aJEY0Ux33GFjs6KuWzUb6ugTc=;
 b=F0atciJ925QIpGTBsZvdCnrxQGvgAZcMbXHZqCbUCDZ7jPKYcN2DXZTm
 U8q1I9c1uT2BY36jFVSkhBKs5nfYPDn1x77XD1Q8OA5IybzceNEh9xEDc
 PcXeDEjbWPvKsGhwZqJ3tAOX/qVYtXC4QULksJ1gYP2yT9HIQZQP6IbZm
 O9rgPF7AKEJ1EZipTJ2/qVzlRWw8lZXNKKXw17NU/DfmJWeccDB/dAms6
 UKWyn7ZgFRjQE2hw3y2ntClok/wJirSoDEK4G05U8saQaKiq79VT2+7bJ
 NcnXG7TcG6ucbe81292rzcVXEEKkYtcUMbDSscIZNOrnQPx0Q88i7oipP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="395951310"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="395951310"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 02:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="770553041"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="770553041"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga007.fm.intel.com with ESMTP; 22 Nov 2023 02:49:40 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 16:28:54 +0530
Message-Id: <20231122105854.3788939-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16021867713
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

This workaround applies to Xe2_LPM as well

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 6572715dfc09..473f1d0bc14b 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -273,6 +273,15 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 			 SET(XEHPC_L3CLOS_MASK(3), ~0))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
-- 
2.25.1

