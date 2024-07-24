Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5991C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 12:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB5410E695;
	Wed, 24 Jul 2024 12:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngOe7bZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F40910E695
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721823374; x=1753359374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HrGHzIIqQ5YWKKh3mb42BJdesmxfFVUVEJBgC7GEc3s=;
 b=ngOe7bZNJ6WwpMVp93Tl1nhxCHAnjsEkzh17WKJx4+l0QE0A+OSTmHZC
 yCpWZYDLoOuz/ka9ZZIEGvpy2Ioi5g45O3UFlMijli7p6gXLImR9c0d9S
 7aP7WSUYDpRfFnfmdHy6cw6/OZiaKh1PTZ34YAEIcqpwzAgoseMZVZcvq
 pEOrPEg2w1SP6GP+eT8WS10XSZi/1NG+bsBiNa1/ImR0OqsJQ+2zNsuNF
 6FBW4FJyG35EyC28ydDinF1ywlFg5qzZcSquAuqsZfz3wzP5cR+7Gleo1
 QAgG2UvKXz8BQAqMFxM+9pltulDveoaRDqWa6uuBS6BzsQ2PlJeKH/C95 A==;
X-CSE-ConnectionGUID: RA+tePsjRSCOScltS2ZSdg==
X-CSE-MsgGUID: qspgo6kxRPOw3RJCd0WdbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30097679"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="30097679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 05:16:14 -0700
X-CSE-ConnectionGUID: 43MFhwHTTgmPmn/dSEKokA==
X-CSE-MsgGUID: mxMC5ZgIRfOPm0bDnWCsTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52441938"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 05:16:11 -0700
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Introduce performance tuning changes for
 Xe2_HPG
Date: Wed, 24 Jul 2024 17:45:21 +0530
Message-Id: <20240724121521.2347524-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add performance tuning changes for Xe2_HPG

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8a94a94d2267..3b87f95f9ecf 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -108,6 +108,7 @@
 
 #define FF_MODE					XE_REG_MCR(0x6210)
 #define   DIS_TE_AUTOSTRIP			REG_BIT(31)
+#define   VS_HIT_MAX_VALUE_MASK			REG_GENMASK(25, 20)
 #define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
 #define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index d4e6fa918942..a8e1cfc99ed2 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -93,6 +93,14 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 
+	/* Xe2_HPG */
+
+	{ XE_RTP_NAME("Tuning: vs hit max value"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
+				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3F)))
+	},
+
 	{}
 };
 
-- 
2.34.1

