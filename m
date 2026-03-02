Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11982D58E4B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA6410E42C;
	Mon,  2 Mar 2026 04:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4mRGmw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888A410E42C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 04:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772426870; x=1803962870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X2ydVHpC17yMyubFuXDAvdiTuqHs3i5jrlDD7B2/ofg=;
 b=A4mRGmw1CIGOgO7Og437Cmcr+5XMUylFR81h6j5rLUQ/gU6hM7ZVML9k
 muoxelol9s61nmJvbCLn/0fQS/serIzBgnft0o3i9EOpfITkdk/cu/WNv
 G/iAMvzTmQ+5W0OgAcCbMBi7m00b16Dwa1Ty2AX9DoIBkqSLemMbLHmLW
 1M/11kGOGwJV5xvUjQ3K3ZStTjLEZ1FzVLRQdAHNib1bsv9Qn7q733Vq3
 2+8SIAhkLVzc3dy1C3MhmTvkDMEACMmTQmqPLpvnVgOQE5UNfgiCtBvpd
 BWSHp+B0WTjbd8npyfQosfkbNbCPiPeTVF5n+mg8/L3f3sJtt/Uu1DA7l g==;
X-CSE-ConnectionGUID: dkQ5qJVYT7q0H7v0HoJLHw==
X-CSE-MsgGUID: CvFkWL/mT66Sw17iU8FmCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84520037"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84520037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:47:49 -0800
X-CSE-ConnectionGUID: s7hwn9NVRkibOVYjTFpxiA==
X-CSE-MsgGUID: zIgumpJdRSyn8S3piqhkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="222031986"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:47:47 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH v2] drm/xe: Add Wa_14026578760
Date: Mon,  2 Mar 2026 10:17:38 +0530
Message-ID: <20260302044738.2936976-1-varun.gupta@intel.com>
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
---
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

