Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5946DD3F28A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 20:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2CA10E98A;
	Fri, 18 Oct 2024 20:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCCLogai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980CC10E985;
 Fri, 18 Oct 2024 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729281800; x=1760817800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DLSVaXeSyGoi/9Ei9o2xtFi5RHxS4N8DlyIMNtgMedk=;
 b=gCCLogaiaTxJFaC6JPuWDw5q9qzVmsAiCOf/Oo4ITBq3tZxrxEYRiqcU
 J1xAGUUYLzLD7iSCnIJ/1qC0JQ6xFlSI3HFPSUR8WJ6w2FR/Vg7GKf0ea
 eI61G+6yJLOQCQ741+mr24tW9azrHRPDOUMfY19K/tFd5W3nsbX8jAUnW
 HcnBZdllVwx0H9maODlen31W2qCbi8mhoSHsjdhEdhUQSK007bnAe6Ksp
 zuYkK0dI/x9YCd8sX31Ws69QHwDqVd6W6QWCeev6DyJFGk1sH6jVxzlO7
 LS1EOV/ShVZvM9L8y+oTTmsaSqCoHHzkSBs3udllBJrGNdwYDstb2tAoX g==;
X-CSE-ConnectionGUID: B+/CORMHSruSCD5qNqHPPg==
X-CSE-MsgGUID: K5TM0Ft5Rp+pflIseNWZ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28286801"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="28286801"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 13:03:19 -0700
X-CSE-ConnectionGUID: 5bmxurxeQ2yL8MKZEhCjkw==
X-CSE-MsgGUID: T3hErcf/SBC0P0Tugyzx/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="102263867"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.145])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 13:03:19 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v4 5/7] drm/i915/xe3lpd: Add new bit range of MAX swing setup
Date: Fri, 18 Oct 2024 13:03:09 -0700
Message-ID: <20241018200311.67324-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241018200311.67324-1-matthew.s.atwood@intel.com>
References: <20241018200311.67324-1-matthew.s.atwood@intel.com>
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

From: Suraj Kandpal <suraj.kandpal@intel.com>

Add new bit range for Max PHY Swing Setup in PORT_ALPM_CTL
register for DISPLAY_VER >= 30.

v2: implement as two seperate macros instead of a single macro
v3: extend previous definition by 2 bits that were previously reserved

Bspec: 70277
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 0841242543ca..9ad7611506e8 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -298,7 +298,7 @@
 #define _PORT_ALPM_CTL_B			0x16fc2c
 #define PORT_ALPM_CTL(port)			_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
 #define  PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE	REG_BIT(31)
-#define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK	REG_GENMASK(23, 20)
+#define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK	REG_GENMASK(25, 20)
 #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)	REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)
 #define  PORT_ALPM_CTL_MAX_PHY_SWING_HOLD_MASK	REG_GENMASK(19, 16)
 #define  PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(val)	REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_HOLD_MASK, val)
-- 
2.45.0

