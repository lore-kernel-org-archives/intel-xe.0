Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA374E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 07:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640DB10E0D1;
	Thu, 19 Feb 2026 07:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGtuate3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9B510E0D1
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771487791; x=1803023791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PRIS3cVA//gkRMjM7ZMTls3uX8Y094PW/a6AO+d5zMs=;
 b=kGtuate3B+0Un2FYRho8MirK7pv9fUdUV/ZEaoYsUKOj26xkmnWJZehm
 DJMHfVBWstOVx2JI+fjYsf4sob0igGwK/+mO4Ba3hvNHb8P4flot6sEiN
 2rrvBq+QioWGLtZjANgMAnqffPngSaI0IhqkttvIAbUxUitvyAepwjJ9W
 9Id2ugz/pMBHy3D3fskMeS63/ujxD9OBh80tgeNL+udt+komUtG4Zd2Oy
 pS7puwRmYZkL3u1MzyFrE4pipkdiK0gIkS8dFYpa3StaUDIxeequ516nm
 35mXZBhzz8+k6qHp1vpwdyY0RKJUqG0FvwkgSneFuizsrl0QxgYA4DhqP g==;
X-CSE-ConnectionGUID: ibxOFFloTLO80evD3SvrOg==
X-CSE-MsgGUID: zM2GFkogRZqkQ6FgGslfKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="98030458"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="98030458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 23:56:31 -0800
X-CSE-ConnectionGUID: EDYbaozCSF2p1kQlgrsyXg==
X-CSE-MsgGUID: MWrSGjL0RLy5kUH/0e3lTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213681845"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa010.jf.intel.com with ESMTP; 18 Feb 2026 23:56:29 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/xe3p_lpg: Add Wa_14026781792
Date: Thu, 19 Feb 2026 13:59:32 +0530
Message-ID: <20260219082931.2199618-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Wa_14026781792 applies Xe3p_LPG graphics version 35.10.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
v2: WA officially approved for 35.10 in WA database,
    So, only apply for 35.10 even though the text 
    description of WA indicates that this WA applicable
    to multiple platforms (Matt)

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a375ffd666ba..90b9017770ea 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -131,6 +131,7 @@
 #define   VS_HIT_MAX_VALUE_MASK			REG_GENMASK(25, 20)
 #define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
 #define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
+#define   DIS_TE_PATCH_CTRL			REG_BIT(4)
 
 #define VFLSKPD					XE_REG_MCR(0x62a8, XE_REG_OPTION_MASKED)
 #define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 61c4187dc0ae..0f52c30728a8 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -939,6 +939,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
+	{ XE_RTP_NAME("14026781792"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
-- 
2.50.1

