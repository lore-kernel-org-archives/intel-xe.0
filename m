Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FBEC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 18:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D34B10EE4C;
	Fri, 14 Jun 2024 18:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="em5zt+mp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ABB10EE1D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718389501; x=1749925501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tPpyS5Aq5XT2Qf4S1MfRMuDm53xrSqWN90TGNot74YM=;
 b=em5zt+mpIKLztV5NUybjFjzYHQ2ZK54L00Jdu4hyARbK3JmyuisFtFDU
 QpvNi4vs6V02EjyynLpmU+4dT9IwfjD9V+FtWueMJjYRnJIF/JBK38l9p
 9tybf9TL2P4CoKlxJls13J+CSEeTRUjgzuuqc0O2qW3/D/Baj6GLdboBL
 i8z+w2Krld2GTTxJOBWi+L9Z/Ue7c4F2B5asBHugVZzgKxNDCJBZ+TPzx
 RQYHsdU0juG4YLk/XkdXtj9uiWQ5bEbZpaeRMz9r8kh2pJzlW5jsVbhd1
 ZYD0cm7UqO9pVIHWLeu+WSNvkslabviaGx4/v2cZxGz5l8znuuFIKRgqJ g==;
X-CSE-ConnectionGUID: C3qfbBSJTLm3MZVD1yNj2A==
X-CSE-MsgGUID: 1ZDaCCpTSyK/I0wmLGYtYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15260181"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15260181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 11:25:00 -0700
X-CSE-ConnectionGUID: YR41l8pVQridG8LwdC3YwQ==
X-CSE-MsgGUID: Kg6cMYfXQ/G9jmV/sMhgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40540560"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 11:25:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [CI] drm/xe/xe2lpg: Add Wa_14021490052
Date: Fri, 14 Jun 2024 11:24:56 -0700
Message-ID: <20240614182455.2370059-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.0
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

From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Add Wa_14021490052 for Xe2LPG 20.04.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Akshata's emails don't seem to be making it to the mailing list.

 drivers/gpu/drm/xe/xe_wa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 18a4d5dd5a4c..a2725a150441 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -688,6 +688,15 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
+	{ XE_RTP_NAME("14021490052"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),
-- 
2.45.0

