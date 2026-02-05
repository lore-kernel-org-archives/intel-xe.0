Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A12EC1E83
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B415010E830;
	Thu,  5 Feb 2026 09:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tjf3P33T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAEE10E829;
 Thu,  5 Feb 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770283689; x=1801819689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F8YNYpYlBJr76i7Gwy2+F+vIHIVyDniNkhxu8Wp8swM=;
 b=Tjf3P33T80KkSVC4sOxQEP5LZ7+mCCju45HHHhOXbLllxnL1sEtCe4tL
 uW+H1tJY/TldPtNmKtTUZV2B1ZSVroD5080zUdLKYRcLv1rk5vA63rZSy
 5XGIe4Ezdl8gZEykpyS+8NYFeepaYt9kZnfOrU65tkuBT9ywZeJrYSfdh
 GYBTi9KWAwiTA8+PTRPhuv8LgZednim/KxlQ8j6cTNR8zH/ox5QcQStmL
 hqcJp6uuL5Cw7GGlL62GGQKBLHWzQlKbYygi4fKs90DQc2iDVEcXwQxde
 uqH338K+563Nkty7hMggnLpPOlCvA2VFkn02wlWVk547N6oJcWkOmvFiF A==;
X-CSE-ConnectionGUID: pO6kY91hT1ySNooAiFl5gw==
X-CSE-MsgGUID: jUsG92TzQkinCgadwGxqQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89060108"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89060108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:28:09 -0800
X-CSE-ConnectionGUID: 29P+bIB0QWq6WPRWpQzVHw==
X-CSE-MsgGUID: 8eSXuzMqSPO3tf1PnYpp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209807775"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2026 01:28:07 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 07/20] drm/i915: Move GMD_ID and mask to intel_gt header
Date: Thu,  5 Feb 2026 15:13:28 +0530
Message-ID: <20260205094341.1882816-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260205094341.1882816-1-uma.shankar@intel.com>
References: <20260205094341.1882816-1-uma.shankar@intel.com>
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

GMD_ID* is relevant only for GT, hence moving the same
together in gt/intel_gt_regs.h

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 3 +++
 drivers/gpu/drm/i915/i915_reg.h         | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7421ed18d8d1..14d31882e9e7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -61,6 +61,9 @@
 
 #define GMD_ID_GRAPHICS				_MMIO(0xd8c)
 #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
+#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
+#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
+#define   GMD_ID_STEP				REG_GENMASK(5, 0)
 
 #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
 #define MTL_STEER_SEMAPHORE			_MMIO(0xfd0)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 90a5c60e7667..b12c6bf68a2c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -922,10 +922,6 @@
 #define   MASK_WAKEMEM				REG_BIT(13)
 #define   DDI_CLOCK_REG_ACCESS			REG_BIT(7)
 
-#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
-#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
-#define   GMD_ID_STEP				REG_GENMASK(5, 0)
-
 /* PCH */
 
 #define SDEISR  _MMIO(0xc4000)
-- 
2.50.1

