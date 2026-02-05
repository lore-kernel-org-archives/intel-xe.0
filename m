Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB21EA7967
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 05:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F8F10E7B5;
	Thu,  5 Feb 2026 05:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2JkwGnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE110E7B5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 05:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770268112; x=1801804112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fcn03jURmHOkdcYvb7CGV6zi+jK+QOW5VjRmWwOas7w=;
 b=N2JkwGnTkcvpD5awApDqNP3Y5QGfvf5MPuwBr+OQZRR1t47Qi9Dw0rN4
 TChh2h8jxCa6Aj2vH6Eau44qNmVMAtb1czsTzo9tpyn//Jm1qh85rL4pg
 vYBB/poXy3lhD6+5mn4xdlPsThpFriAWjNgRZ+cUp8mIdS0t77TrEjtQp
 INWmlt1A3gfZ9lBgkOBRknNTGa73vxeyEMtqc3W83c5rsJHNYsjHO2uI0
 KVccFGwZHsQsknAmMWQccQ2Ser3wUQw5XSkd0KkTKG0xLWWijPHSDvOlg
 hrzQA0lTp02FIXCN0GSeVVKEkswI96NW56bzZkSIDep3hWvA4KiIukFaT w==;
X-CSE-ConnectionGUID: bSec49ayT7a5YFbiBa54aQ==
X-CSE-MsgGUID: AmPSwc2oRH2eoYtqTgJpSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70656215"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70656215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 21:08:31 -0800
X-CSE-ConnectionGUID: C52PJYirRMG1APebA2qjSg==
X-CSE-MsgGUID: Ir+qJBKDR6q7ATlsi13HTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210303186"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 21:08:30 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
Date: Thu,  5 Feb 2026 10:38:18 +0530
Message-ID: <20260205050818.2180756-1-arvind.yadav@intel.com>
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

Applied Wa_14024997852 to Graphics version 20.02

Cc: Nitin Gote <nitin.r.gote@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 1e8d61ac581b..2f838c99596f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -874,6 +874,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 
+	{ XE_RTP_NAME("14024997852"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
+
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
-- 
2.43.0

