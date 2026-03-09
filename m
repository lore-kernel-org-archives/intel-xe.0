Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8113DEF36E5
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 06:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C76810E0F3;
	Mon,  9 Mar 2026 06:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gu9pG6Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE8210E0F3
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773038375; x=1804574375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mPxmXbSqfhrZYXisvQ7+xcBy3u8J5ewD2d2sowsbAxs=;
 b=Gu9pG6Mjk7OgvF15+i2+QZ0YNknRq5kJMaw8ltXRUC/hdLhrBoIH8uXI
 2XlLTO7IgVIrxIrLL/ZcdduTdzS66sqyMiqaQzkQIPLA5szpNlVaZMddo
 /hv1Ev9vdYtBXa1EuOZY9VEQozTCUVixMTUhIaVkAPwWRF4Nq1GW7VKVm
 xjDGbCIvk4e3xxgymmE8RP4ie24ewEEcEveHBdWxh0APsQ+g08F+WRD1b
 EmQCAkZlIJzk8uWTExR9yQ3VG2Rhw/IU7qxz6bhTgl0s2VTmWhy+ZBPtn
 o9ywj5eLRG0Ew8BH+JhJvb4W4vpSto1IyVRCnikggHM0RMZvA1YFjw3ZQ g==;
X-CSE-ConnectionGUID: Dz8Gd/5RQr2QWEyhz5DtXw==
X-CSE-MsgGUID: gLueSE2kRa2wtvxbwfUzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77655802"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77655802"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 23:39:35 -0700
X-CSE-ConnectionGUID: 4imd0JYHRauXqhhP+4qsrQ==
X-CSE-MsgGUID: 5gYMh0kGSEiZWlpJ3RAv6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224354963"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 23:39:33 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH v4] drm/xe: Add Wa_14026578760
Date: Mon,  9 Mar 2026 12:09:23 +0530
Message-ID: <20260309063923.4031933-1-varun.gupta@intel.com>
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

Add GT workaround Wa_14026578760 for graphics versions 35.10, 35.11
and media version 35.03.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
v4:
 - Drop separate media register define; MEDIA_GT_GSI_OFFSET is applied
   automatically by the media GT's mmio, so a single XE_REG_MCR
   suffices for both graphics and media (Matt Roper)
v3:
 - Use separate register defines for graphics and media (Tejas)
v2:
 - Fix register define ordering (Matt Roper)
 - Broaden workaround scope to cover graphics 35.10, 35.11 and media
   35.03 per workaround database (Matt Roper)
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 90b9017770ea..c70dbf7e4e7c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -100,6 +100,9 @@
 #define VE1_AUX_INV				XE_REG(0x42b8)
 #define   AUX_INV				REG_BIT(0)
 
+#define GAMSTLB_CTRL				XE_REG_MCR(0x477c)
+#define   DIS_PEND_GPA_LINK			REG_BIT(13)
+
 #define GAMSTLB_CTRL2				XE_REG_MCR(0x4788)
 #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 26950b8a7543..dc780368c452 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -164,6 +164,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 		       MEDIA_VERSION_RANGE(1301, 3500)),
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
 	},
+	{ XE_RTP_NAME("14026578760"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, 3511), OR,
+		       MEDIA_VERSION(3503)),
+	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL, DIS_PEND_GPA_LINK))
+	},
 
 	/* DG1 */
 
-- 
2.43.0

