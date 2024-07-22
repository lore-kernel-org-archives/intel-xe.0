Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB4C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 19:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F9F10E297;
	Mon, 22 Jul 2024 19:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1d6ZCUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E6210E297
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 19:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721675153; x=1753211153;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y6UUtlnailXX0M1NwRj402XpLhLNFRaR9rsY/lE6dGY=;
 b=W1d6ZCUsJAQL9vybeBUGGVRi8dIMiluk/hH/bsel/Z96OTwGnJyKW8NP
 ilI7+MWNy2fXOiR8bus0VPwvFFpbSTvDOt8m46UtRKINuaNXA7+Ne3hHg
 gHKSc6LW3AGE74m27gYb0qLd0L7leGSQ+DJcwphJ1r1Tv3cSVXHIvpj1o
 1nsJTaJTaRHLpWmBG1g5hFz/xv/tGbtX4w/qBPfKKnfYmn7dNjKzktAmC
 olmNXo5wfpeqwtenSmt9md66I4HkAsLXioIx4vFejZQ0Ltzqp/WhTeuIr
 hUoqSyH7nVh7NqWdT3csRoMI5yL6OIv4CqrJyNq6Hnh9JOzuxm26Hq6Zu w==;
X-CSE-ConnectionGUID: ewLFHqJTQAqXXI0DvUewqg==
X-CSE-MsgGUID: ggCmiABfQtu3QPkGcxcFuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23066268"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="23066268"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 12:05:53 -0700
X-CSE-ConnectionGUID: S6GO2TF0RvyrTAwHsmUvPw==
X-CSE-MsgGUID: AASwftRMRVuGvztsFLyZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="52210782"
Received: from inaky-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.109.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 12:05:52 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove stale declaration of xe_mmio_probe_vram()
Date: Mon, 22 Jul 2024 16:05:25 -0300
Message-ID: <20240722190524.71548-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
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

The declaration of xe_mmio_probe_vram() became useless since
commit 638d1c79cbf1 ("drm/xe: Promote VRAM initialization function to
own file"). Remove it.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 6ae0cc32c651..26551410ecc8 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -22,7 +22,6 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
 int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
 bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
 
-int xe_mmio_probe_vram(struct xe_device *xe);
 u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
 int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
 		   u32 *out_val, bool atomic);
-- 
2.45.2

