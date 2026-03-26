Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8440B10A88EA
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6AD10E9C4;
	Thu, 26 Mar 2026 17:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hH8aFbFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0C510E956;
 Thu, 26 Mar 2026 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545324; x=1806081324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lpLk4FBGt6n+G0pjKQtjrOGITfkcxlLVXB+TUk8Loc=;
 b=hH8aFbFvhNzp3w7FOyNcRKiOs4+5pbQs0BF1+EIYG5J+zCZguZpZJGDk
 hhkxFgGKkjQWb5BeMUU3WIZl257i0l7f+WXwiRKmLiTbXSNZfgh8I3hnc
 DKNtGdtmQBA4lxCxPg7Lvf3k9mJfOJWn+7j1qY99pb+wwFSh0zg7ng0/5
 pe125prAeO47GQMvlqlNdA89mciXcbMMMb1q7Q3N8DUJiz/f9nFKRtTpi
 E4SoPN4NOdI7VEYR8jTGt9VZJxCgVvoXAId4eZ0k/nYp/SRQLoHnYRkoY
 BQerivcwTfGd/rMKh3s5JFk0S/nGqxdrRM1Fh8vMOWPY18zGENqkgPxnx A==;
X-CSE-ConnectionGUID: D40wcMYgSQS+1DiC+7Z2bw==
X-CSE-MsgGUID: JgWIaxWVR423Wn0cDJWZlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630561"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:19 -0700
X-CSE-ConnectionGUID: AhVqFGgSRkuiepyeq8TDIQ==
X-CSE-MsgGUID: ddaiIewARUKZwIgViXBnKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975524"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:17 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 03/19] drm/i915/display: Use FIELD_PREP() for DC state enable
 bits
Date: Thu, 26 Mar 2026 22:45:41 +0530
Message-ID: <20260326171557.2065632-4-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

Replace open-coded shifts with REG_GENMASK() and REG_FIELD_PREP()
for the DC state enable field.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index d0196d4ad234..2bace331437c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -3047,11 +3047,12 @@ enum skl_power_gate {
 #define  DC_STATE_DC3CO_STATUS		REG_BIT(29)
 #define  HOLD_PHY_CLKREQ_PG1_LATCH	REG_BIT(21)
 #define  HOLD_PHY_PG1_LATCH		REG_BIT(20)
-#define  DC_STATE_EN_UPTO_DC5		(1 << 0)
 #define  DC_STATE_EN_DC9		(1 << 3)
-#define  DC_STATE_EN_UPTO_DC6		(2 << 0)
-#define  DC_STATE_EN_UPTO_DC3CO		(3 << 0)
-#define  DC_STATE_EN_UPTO_DC5_DC6_MASK   0x3
+#define  DC_STATE_EN_UPTO_DC5_DC6_MASK   REG_GENMASK(1, 0)
+#define  DC_STATE_EN_DISABLE		REG_FIELD_PREP(DC_STATE_EN_UPTO_DC5_DC6_MASK, 0)
+#define  DC_STATE_EN_UPTO_DC5		REG_FIELD_PREP(DC_STATE_EN_UPTO_DC5_DC6_MASK, 1)
+#define  DC_STATE_EN_UPTO_DC6		REG_FIELD_PREP(DC_STATE_EN_UPTO_DC5_DC6_MASK, 2)
+#define  DC_STATE_EN_UPTO_DC3CO	REG_FIELD_PREP(DC_STATE_EN_UPTO_DC5_DC6_MASK, 3)
 
 #define  DC_STATE_DEBUG                  _MMIO(0x45520)
 #define  DC_STATE_DEBUG_MASK_CORES	(1 << 0)
-- 
2.43.0

