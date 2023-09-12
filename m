Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66780EE3F37
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 21:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C3610E091;
	Tue, 12 Sep 2023 21:28:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E8A10E091
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 21:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694554130; x=1726090130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BzgnTfe0iqLVEB+PPeFvLEQh/VztZyBr/IpS1RD+4Zo=;
 b=eVEzimMsZXyYSZdaY3DWovCa82qAGmPI3AuLTYU3kyTwEFVJKAQYB4Yy
 H4CkZnHV7hyjK5QyN/MgW3vmEfHngY8z3KS189S2K//1o8v/cL3Iul7O6
 BQCdbUQ/zM8AHIlcvqSIBwF4VkzGTPrU5bv0+KJFo1oNxY1C1Gc+TEUOu
 ceYCypuFfTrfkgV7d6ULghdlf62PYr7Nx+p4yVMXPCcEhLoYr0vQ6dIJV
 GAHmaa+Rqcn6NfXArioL8aI9L2JURqz8rclCJqH84AqkiW4r7SM6mcCrr
 gnwV8e3sTAZxrYXUKE+qCG+0FIZZGWm39sm2cnn6UIpOjXZAuzDY09mq0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358769859"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="358769859"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 14:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809418429"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="809418429"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.251.31.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 14:28:49 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com
Date: Tue, 12 Sep 2023 14:28:43 -0700
Message-Id: <20230912212843.681802-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912212843.681802-1-matthew.s.atwood@intel.com>
References: <20230912212843.681802-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/2] drm/xe: add gt tuning for indirect state
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

Force indirect state sampler data to only be in the dynamic state pool,
which is more convienent for the UMD. Behavior change mirrors similar
change for i915 in commit 16fc9c08f0ec ("drm/i915: disable sampler
indirect state in bindless heap")

v2: split out per engine tuning into separate patch, commit message
(Lucas)
v3: rebase
v4: Change to match render only, g.ver 1200 to 1271 (MattR)

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 271ed0cdbe21..b456a7617883 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -298,6 +298,7 @@
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
+#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
 
 #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 266f6ac38e37..2ae73b599f52 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -28,6 +28,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 };
 
 static const struct xe_rtp_entry_sr engine_tunings[] = {
+	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1271),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
+	},
 	{}
 };
 
-- 
2.40.1

