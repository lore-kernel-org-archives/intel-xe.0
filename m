Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB21FCC9A2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 00:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817F510E604;
	Tue, 10 Mar 2026 00:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFE9NxUr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFD610E60B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 00:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773103384; x=1804639384;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wKPiUcJBz6PF8Q1VHH0LHG1wL1SRc7UHSa/Q6O1Ul1Y=;
 b=bFE9NxUrHKnyMqhzwTs5C2NMoVSbKs2/6f3VajAcp8uvKFkFMmzeW3MQ
 GRe7zR9pe/Cyxav8zawlqsZ1RyIQNH9c81OJSe6EGEjZ5767vEgEyNsp0
 MQUHkIUiKVL06bqt4E/qqfJPmM+BZkOxfo/RgnAssMLWTPml4SJI6TDng
 FZti+F/yQto4ACKJJpr/XjCZ+ouCs7PuxciGRBqbLl1LNX3ajiFQqC4mB
 QifvUg4IkIKudkt+XhFcB0t4/Dqw238x7HHRIxoNY0IrSiNLSDXlHzeCq
 CSHv8zj97l/+Fseoxf0agidW75xvQYzAe80gWCaMAzw0DR1rTa7i7gHw3 w==;
X-CSE-ConnectionGUID: 4NPwcntCSmOyqirVzwqHAw==
X-CSE-MsgGUID: d2q5Neb+THWbp7TSRRA06g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74183505"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74183505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:43:04 -0700
X-CSE-ConnectionGUID: b+Zf3hLoT5qo/vFD4PaD2g==
X-CSE-MsgGUID: VvvkCba7SHKrc9bwwwDhSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219063592"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:43:03 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 21:42:11 -0300
Subject: [PATCH v5 6/7] drm/xe/xe3p: Drop Wa_16028780921
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v5-6-be9c902ee34e@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

Wa_16028780921 involves writing to a register that is locked by firmware
prior to driver loading and doesn't have any effect if implemented by
the KMD.  Since the implementation of the workaround actually belongs
the firmware, just drop the ineffective implementation by the KMD.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
 drivers/gpu/drm/xe/xe_wa.c           | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a83cafbe03fd..f49a28f4a330 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -218,9 +218,6 @@
 
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
-#define CCCHKNREG2				XE_REG_MCR(0x881c)
-#define   LOCALITYDIS				REG_BIT(7)
-
 #define CCCHKNREG1				XE_REG_MCR(0x8828)
 #define   L3CMPCTRL				REG_BIT(23)
 #define   ENCOMPPERFFIX				REG_BIT(18)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 183c5c86c35a..38881b1aaeb1 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -287,10 +287,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
 			     DIS_ATS_WRONLY_PG))
 	},
-	{ XE_RTP_NAME("16028780921"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(CCCHKNREG2, LOCALITYDIS))
-	},
 	{ XE_RTP_NAME("14026144927"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |

-- 
2.52.0

