Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFA3E8B38A
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 02:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532B910E1CE;
	Wed,  4 Feb 2026 02:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czkPJ6zN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0905710E1CE;
 Wed,  4 Feb 2026 02:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770172372; x=1801708372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4T49y/2I0wU/l1YzAqWO7G2wWcmJCdmOkVtzOO4WnzQ=;
 b=czkPJ6zNoOTWtb/b4ZCz36M5XxnSCEnW3bLMrgL0Gv5eFO6KpbybcT+W
 KMk11AC6bebTG3f7h/Olw8YF/SLMDCINEqz8ETjxdUZ6i9MA94P8/oZd5
 bhJbW7ZisRtpFFdgZMvJMt61StYFbiTQFXTZjnHUndbooY2WXTMSYYr2L
 P8RJE6YLy6pFmA2/QHcXobRzUGUSm6xK0GrFlnULkffEAFV80IdgQZLpv
 x/5y2rqZavBKwGzQTnsN/facJQN2ksa9NLKULl/X0P+xh2k/QLUFGwY90
 2wzN//7dFUYiBmFoobYm9BI0SY6zOSW7ncoHbdUnU5EfkBiIg6/x53QA5 g==;
X-CSE-ConnectionGUID: zfwnO052R3CHUpB8T1jOMw==
X-CSE-MsgGUID: ruUrSZY1QQqtLbm44qRZrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75212153"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="75212153"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 18:32:51 -0800
X-CSE-ConnectionGUID: uc0qJWuKTRSJ6Wk6cVW+0w==
X-CSE-MsgGUID: h/wzDgmYTtyxMjcXn8fRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210060487"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 03 Feb 2026 18:32:49 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, imre.deak@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2] drm/i915/ltphy: Return true for TBT scenario during
 lt_phy_state compare
Date: Wed,  4 Feb 2026 08:02:47 +0530
Message-Id: <20260204023247.1560196-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203024141.1549517-1-suraj.kandpal@intel.com>
References: <20260203024141.1549517-1-suraj.kandpal@intel.com>
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

TBT PHY is enablement/disablement is handled by its own TBT module.
We do not play a big part in it's state management, that being take care
by it's own TBT modeule.
The PHY/PLL TypeC mode (TBT, DP-alt) can change after the PLL state was
computed for a modeset, so the state verification after the modeset
sequence would indicate a mismatch in case the mode changed from DP-alt
to TBT, or from TBT to DP-alt mode. To avoid such a mismatch error the
verification is skipped if the mode for either the read-out or the
computed state is TBT (where that TBT PLL state doesn't reflect anyway
the PLL's actual HW state).
Simply return true when we are in tbt mode.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
V1 -> V2:
- Reframe commit messgae with give the full explanation as to why we
skip verification (Imre)

 drivers/gpu/drm/i915/display/intel_lt_phy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 04f63bdd0b87..27ad8407606b 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2158,6 +2158,9 @@ bool
 intel_lt_phy_pll_compare_hw_state(const struct intel_lt_phy_pll_state *a,
 				  const struct intel_lt_phy_pll_state *b)
 {
+	if (a->tbt_mode || b->tbt_mode)
+		return true;
+
 	/*
 	 * With LT PHY values other than VDR0_CONFIG and VDR2_CONFIG are
 	 * unreliable. They cannot always be read back since internally
-- 
2.34.1

