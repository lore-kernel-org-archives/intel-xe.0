Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809F0E83040
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 02:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3713C10E4C8;
	Tue,  3 Feb 2026 02:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyrQh7cc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAB910E4C8;
 Tue,  3 Feb 2026 02:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770086507; x=1801622507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f4sI9rmaVXPffMelMtqKY4kvhIM6UXiS1A7zEhdsEmU=;
 b=iyrQh7cc8zgj010AYf4Nr+AOZPechtf0xe7HlwRiPdx6qECBM6RxAYPs
 z4KZr9R8QY4rUF9mHWEibaHv9VqfdFBMMNPTr4Jo8XsMr4/wG7OqLabtd
 UwpBaH6yX/bBHnddbxnxy/y6Apn95MHwSBWWRs6akcelAn9qftALp+IaM
 rQkN11X4QVDqWyrxQnqdoqwN/ATF188/KlupINHJOPswpqOR2M+iHMWTZ
 idGr1nmXuwStXysydjY+ByLN/WESa5c5yzNKyQgbkR5cvOrtgbXtmqZA2
 1qymN+Q4yGU0wFyrtopHybPoFq6yxYSIlC0A7kGaSBoMX3NMf6crEbU0W g==;
X-CSE-ConnectionGUID: ijB6HKo9Rhqsxb88wynljw==
X-CSE-MsgGUID: pbk5xOyzRjCz3Sn/vD/Y1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="74875604"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="74875604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 18:41:46 -0800
X-CSE-ConnectionGUID: K2n321HORGm0hpYZH4yFjg==
X-CSE-MsgGUID: dEQspnRoTTa8FNABLLd0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="214224417"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 02 Feb 2026 18:41:44 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/ltphy: Return true for TBT scenario during
 lt_phy_state compare
Date: Tue,  3 Feb 2026 08:11:41 +0530
Message-Id: <20260203024141.1549517-1-suraj.kandpal@intel.com>
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

TBT PHY is enablement/disablement is handled by its own TBT module.
We do not play a big part in it's state management that being take care
by it's own TBT modeule. With that in mind comparing the state would be
wrong since we really don't touch it.
Simple return true when we are in tbt mode.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
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

