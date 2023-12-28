Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E1CC3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 11:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BE810E083;
	Thu, 28 Dec 2023 11:05:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8EB10E083
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703761537; x=1735297537;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rdz7Mnhba/6OEAVYXF+BVb72uZYRSIBDISEa45/6MUs=;
 b=QJiIVIvhwqZFqrnYeFYnubSsXKibIY5DS0mXXbqyE9+USmG9caXemi01
 5CpjX0gP5XtHVbaiG04khksy8xC3ZZQ9uzxtylsDn728al44gokl1jeLA
 bFVW93txYNdMubTCMUKisEG55emWWTvxkd4TGyJjtCwSx1mPDGpJaATlu
 lw6DdGqeaGN0kl2F8szw3QuIriiClbsuCBngWSSbhNkmzJFA/Kr5ckKLm
 Hy1V5cVhsTDLbFU/Xf6KWud7/wc7qsEILeLQRfAeQmBE10fYV+gAF+cER
 3GWU9Pk/gZ1o/KQMt9tQHFVMAcBG7tBA7NuIOqcbMbqV0vKvUoVVG3UbU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="381508810"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="381508810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="20225512"
Received: from amajstox-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.251.210.144])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:05:36 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/display: fix type of intel_uncore_read*() functions
Date: Thu, 28 Dec 2023 13:05:26 +0200
Message-Id: <20231228110526.383245-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

Some of the backported intel_uncore_read*() functions used the wrong
types.  Change the function declarations accordingly.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index cd26ddc0f69e..ef79793caa72 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -25,15 +25,15 @@ static inline u32 intel_uncore_read(struct intel_uncore *uncore,
 	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline u32 intel_uncore_read8(struct intel_uncore *uncore,
-				     i915_reg_t i915_reg)
+static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
+				    i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
 	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline u32 intel_uncore_read16(struct intel_uncore *uncore,
+static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
 				      i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-- 
2.39.2

